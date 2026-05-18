$ErrorActionPreference = 'SilentlyContinue'
try {
    $desiredEncryptionMethod = 'XtsAes256'

    #Disable BitLocker on all volumes
    $mountPointsToReEncrypt = Get-BitLockerVolume | Where-Object { $_.EncryptionMethod -ne $desiredEncryptionMethod } | Select-Object -ExpandProperty MountPoint
    $mountPointsToReEncrypt | ForEach-Object { Disable-BitLocker -MountPoint $_ }
    #Recheck decryption status every 30 seconds until decryption complete
    Write-Output 'Beginning decryption'
    do {
        $allDecrypted = $true
        foreach ($mountPoint in $mountPointsToReEncrypt) {
            if ((Get-BitLockerVolume -MountPoint $mountPoint).VolumeStatus -ne 'FullyDecrypted') {
                $allDecrypted = $false
            }
        }
        if (-not $allDecrypted) { Start-Sleep -s 30 }
    }
    until ($allDecrypted)
    Write-Output "Decrypted all non $desiredEncryptionMethod drives"
}
catch {
    Write-Error "Failed to decrypt drives $_"
}