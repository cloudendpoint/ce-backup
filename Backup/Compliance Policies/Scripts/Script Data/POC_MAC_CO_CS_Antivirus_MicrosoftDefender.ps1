#!/bin/bash
# Custom Compliance Script for Microsoft Defender for Endpoint on macOS
# Checks: Installation, health, running, real-time protection, and Definition status

if command -v mdatp &>/dev/null; then
	defenderInstalled=true
	defenderRunning=false
	defenderHealthy=false
	realtimeProtection=false
	definitionsCurrent=false

	# Check if Defender service is running
	if pgrep -x "wdavdaemon" >/dev/null 2>&1; then
		defenderRunning=true
	fi

	# Check health status
	if [[ "$(mdatp health --field healthy 2>/dev/null)" == "true" ]]; then
		defenderHealthy=true
	fi

	# Check real-time protection status
	if [[ "$(mdatp health --field real_time_protection_enabled 2>/dev/null)" == true* ]]; then
		realtimeProtection=true
	fi

	# Get definitions status - check if they're up to date
	if [ "$(mdatp health --field definitions_status 2>/dev/null)" == "up_to_date" ]; then
		definitionsCurrent=true
	fi
else
	defenderInstalled=false
	defenderRunning=false
	defenderHealthy=false
	realtimeProtection=false
	definitionsCurrent=false
fi

echo "{\"DefenderInstalled\":$defenderInstalled,\"DefenderRunning\":$defenderRunning,\"DefenderHealthy\":$defenderHealthy,\"RealtimeProtectionEnabled\":$realtimeProtection,\"DefinitionsUpToDate\":$definitionsCurrent}"

exit 0