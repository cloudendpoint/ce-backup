$days = 1
try {
    $signatureAge = (Get-MpComputerStatus).AntispywareSignatureAge

    if ($signatureAge -le $days) {
        Write-Output 'Defender signatures up-to-date'
        exit 0
    }
    else {
        Write-Warning 'Defender signatures outdated'
        exit 1
    }
}
catch {
    Write-Error 'Unable to check Defender signature age'
    exit 2000
}