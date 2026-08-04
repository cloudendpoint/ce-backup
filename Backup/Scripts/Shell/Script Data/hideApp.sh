#!/bin/bash
#set -x

# User Defined variables
appName="Company Portal"
appPath="/Applications/$appName.app"

# script variables
logandmetadir="/Library/Logs/Microsoft/IntuneScripts/$appName"
log="$logandmetadir/$appName.log"
plistFile="/.Spotlight-V100/VolumeConfiguration.plist"


# logging
if [[ ! -d "$logandmetadir" ]]; then
	## Creating Metadirectory
	echo "$(date) | Creating [$logandmetadir] to store logs"
	mkdir -p "$logandmetadir"
fi

exec &> >(tee -a "$log")
echo ""
echo "##############################################################"
echo "# $(date) | Logging hiding of [$appName] to [$log]"
echo "############################################################"
echo ""

echo "$(date) | Checking if [$appName] app exists at [$appPath]"
if [ -d "$appPath" ]; then
	echo "$(date) | Hiding [$appName] app at [$appPath]"
	chflags hidden "$appPath"

	# Add the hidden [$appName] app to Spotlight's global exclusion list
	echo "$(date) | Adding [$appName] app to Spotlight's global exclusion list"
	sudo defaults write "$plistFile" Exclusions -array-add "$appPath"

	# clears the Spotlight index for the specified path, forcing it to reindex and apply the exclusion
	echo "$(date) | Clearing Spotlight index for [$appPath] to apply exclusion"
	sudo mdutil -E "$appPath"

	# Restart the Spotlight process to apply changes immediately
	echo "$(date) | Restarting Spotlight process to apply changes immediately"
	/usr/bin/killall mds
	exit 0

else
	echo "$(date) | [$appName] not found at [$appPath]. Exiting script."
	exit 0
fi




