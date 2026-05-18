$regPath = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings'
$regName = 'RestartNotificationsAllowed2'
$regValue = 1

$transcriptPath = "$env:ProgramData\Microsoft\IntuneManagementExtension\Logs\"
$transcriptName = 'WindowsUpdate-UX-Improvement.log'
New-Item -Path $transcriptPath -ItemType Directory -Force | Out-Null

# Stopping orphaned transcripts
try { Stop-Transcript | Out-Null } catch [System.InvalidOperationException] {}

Start-Transcript -Path (Join-Path $transcriptPath $transcriptName) -Append

try {
    # Ensure key exists
    if (-not (Test-Path $regPath)) {
        Write-Output "Creating registry key: $regPath"
        New-Item -Path $regPath -Force | Out-Null
    }

    # Create or set the DWORD value
    Write-Output "Checking $regName"
    if ((Get-Item $regPath -ErrorAction Ignore).Property -contains $regName) {
        if ((Get-ItemPropertyValue -Path $regPath -Name $regName) -ne $regValue) {
            Write-Output "Remediating $regName"
            Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
        }
    }
    else {
        Write-Output "Remediating $regName"
        New-ItemProperty -Path $regPath -Name $regName -Value $regValue -PropertyType DWORD -Force | Out-Null
    }
    Stop-Transcript
    exit 0
}
catch {
    Write-Error "ERROR: Failed to set $regPath\$regName. $($_.Exception.Message)"
    Stop-Transcript | Out-Null
    exit 1
}