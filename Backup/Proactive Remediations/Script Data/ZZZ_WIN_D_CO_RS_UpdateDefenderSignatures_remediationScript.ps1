try {
    Update-MpSignature
}
catch {
    Write-Error 'Unable to update Defender signatures'
    exit 2000
}