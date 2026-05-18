$regPath = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings'
$regName = 'RestartNotificationsAllowed2'
$regValue = 1

$transcriptPath = "$env:ProgramData\Microsoft\IntuneManagementExtension\Logs\"
$transcriptName = 'WindowsUpdate-UX-Improvement.log'
New-Item -Path $transcriptPath -ItemType Directory -Force | Out-Null

# Stopping orphaned transcripts
try { Stop-Transcript | Out-Null } catch [System.InvalidOperationException] {}

Start-Transcript -Path (Join-Path $transcriptPath $transcriptName) -Append

$remediationNeeded = $false
Write-Output "Checking if registry value: $regPath\$regName equals $regValue (DWORD)"

if (-not (Test-Path $regPath)) {
    Write-Host "Registry key does not exist: $regPath"
    $remediationNeeded = $true
}
else {
    if ((Get-Item $regPath -ErrorAction Ignore).Property -contains $regName) {
        if ((Get-ItemPropertyValue -Path $regPath -Name $regName) -ne $regValue) {
            Write-Output "$regName value is not correct"
            $remediationNeeded = $true
        }
    }
    else {
        Write-Output "$regName does not exist"
        $remediationNeeded = $true
    }
}

if ($remediationNeeded) {
    Write-Warning 'Restart notification setting is missing or incorrect'
    Stop-Transcript | Out-Null
    exit 1
}
else {
    Write-Output 'Restart notification setting is correct'
    Stop-Transcript | Out-Null
    exit 0
}