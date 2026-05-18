$ErrorActionPreference = 'SilentlyContinue'
try {
    $desiredEncryptionMethod = 'XtsAes256'
    $mountPoints = Get-BitLockerVolume | Where-Object { $_.EncryptionMethod -ne $desiredEncryptionMethod }
    if ($mountPoints.Count -eq 0) {
        Write-Output "All drives are already encrypted with $desiredEncryptionMethod."
        Exit 0
    }
    else {
        Write-Output "Found drives that are not encrypted with $desiredEncryptionMethod."
        Exit 1
    }
}
catch {
    Write-Error "Failed to decrypt drives $_"
    Exit 2000
}