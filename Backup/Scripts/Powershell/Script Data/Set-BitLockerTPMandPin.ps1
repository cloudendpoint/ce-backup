try {
    $osVolume = Get-BitLockerVolume | Where-Object { $_.VolumeType -eq 'OperatingSystem' }

    # Detects if TPMPin already set
    if ($osVolume.KeyProtector.KeyProtectorType -contains 'TpmPin') {
        exit 0
    }

    # Sets a recovery password key protector if one doesn't exist, needed for TpmPin key protector
    if ($osVolume.KeyProtector.KeyProtectorType -notcontains 'RecoveryPassword') {
        Enable-BitLocker -MountPoint $osVolume.MountPoint -RecoveryPasswordProtector
    }

    # Configures the PIN (14 characters of the serial in Upper Case)
    $deviceSerial = (((Get-CimInstance -Class win32_bios).SerialNumber).ToUpper() -replace '[^a-zA-Z0-9]', '')
    if ($deviceSerial.length -gt 14) {
        $deviceSerial = $deviceSerial.Substring(0, 14) # Reduce to 14 characters if longer
    }

    # Enables BitLocker using the TpmPin key protector
    $devicePIN = ConvertTo-SecureString $deviceSerial -AsPlainText -Force
    Enable-BitLocker -MountPoint $osVolume.MountPoint -Pin $devicePIN -TpmAndPinProtector

    # Gets the recovery key and escrows to Entra
    (Get-BitLockerVolume).KeyProtector | Where-Object { $_.KeyProtectorType -eq 'RecoveryPassword' } | ForEach-Object {
        BackupToAAD-BitLockerKeyProtector -MountPoint $osVolume.MountPoint -KeyProtectorId $_.KeyProtectorId
    }
    exit 0
}
catch {
    $ErrorMessage = $_.Exception.Message
    Write-Warning $ErrorMessage
    exit 1
}