#!/bin/zsh
#set -x
############################################################################################
##
## Script to align to CIS Level 1 Benchmark for macOS Tahoe
##
############################################################################################

## Copyright (c) 2023 Microsoft Corp. All rights reserved.
## Scripts are not supported under any Microsoft standard support program or service. The scripts are provided AS IS without warranty of any kind.
## Microsoft disclaims all implied warranties including, without limitation, any implied warranties of merchantability or of fitness for a
## particular purpose. The entire risk arising out of the use or performance of the scripts and documentation remains with you. In no event shall
## Microsoft, its authors, or anyone else involved in the creation, production, or delivery of the scripts be liable for any damages whatsoever
## (including, without limitation, damages for loss of business profits, business interruption, loss of business information, or other pecuniary
## loss) arising out of the use of or inability to use the sample scripts or documentation, even if Microsoft has been advised of the possibility
## of such damages.
## Feedback: neiljohn@microsoft.com

# Define variables
appname="CIS-L1-Benchmark"                                                     # The name of our script
logandmetadir="/Library/Logs/Microsoft/IntuneScripts/$appname"
log="$logandmetadir/$appname.log"

# Check if the log directory has been created
if [ -d $logandmetadir ]; then
    # Already created
    echo "$(date) | Log directory already exists - $logandmetadir"
else
    # Creating Metadirectory
    echo "$(date) | creating log directory - $logandmetadir"
    mkdir -p $logandmetadir
fi

# Functions
# Enable Security Auditing on macOS Sonoma
EnableSecurityAuditing() {
    if [[ ! -e /etc/security/audit_control ]] && [[ -e /etc/security/audit_control.example ]];then
        /bin/cp /etc/security/audit_control.example /etc/security/audit_control
    fi

    /bin/launchctl enable system/com.apple.auditd
    /bin/launchctl bootstrap system /System/Library/LaunchDaemons/com.apple.auditd.plist
    /usr/sbin/audit -i
    echo  "$(date) | Security Auditing is enabled for devices."
}

# Ensuring access to audit records is controlled
ControlledAuditRecords() {
    /usr/sbin/chown -R root:wheel /etc/security/audit_control
    /bin/chmod -R o-rw /etc/security/audit_control
    /usr/sbin/chown -R root:wheel /var/audit/
    /bin/chmod -R o-rw /var/audit/
    echo  "$(date) | Access to audit records is now controlled or already controlled."
}

# Disable Bonjour Advertising Services
DisableBonjourAdvertisingServices() {
    /usr/bin/defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool true
    echo "$(date) | Bonjour Advertising Services is now disabled or already disabled."
}

# Disable HTTP Server
DisableHTTPServer() {
    /usr/sbin/apachectl stop 2> /dev/null
    /bin/launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2> /dev/null
    echo  "$(date) | HTTP Server is disabled or already disabled."
}

# Disable NFS Server
DisableNFSServer() {
    /sbin/nfsd stop 2> /dev/null
    /bin/launchctl disable system/com.apple.nfsd 2> /dev/null

    # Removing the exported Directory listing
    /bin/rm /etc/exports 2> /dev/null
    echo  "$(date) | NFS Server is disabled or already disabled."
}

# Delete Guest Home Folder
DeleteGuestHomeFolder() {
    /bin/rm -R /Users/Guest 2> /dev/null
    echo "$(date) | Guest Home Folder is deleted or already deleted."
}

# Disables Guest Access to Shared Folders
DisableGuestAccessToSharedFolders() {
    /usr/sbin/sysadminctl -smbGuestAccess off
    echo "$(date) | Guest Access to Shared Folders is now disabled or already disabled."
}

# First checking CPU architecture and then disables Power Nap if device is Intel Mac
DisablePowerNapForIntelMacs() {
    echo  "$(date) | Detecting CPU architecture..."
    if [[ $(uname -m) == 'arm64' ]]; then
        # This is Apple Silicon. We don't need to run this script for these devices
        echo  "$(date) | CPU architecture is Apple Silicon. We don't need to run this script for this CPU to disable Power Nap."
    else
        # Disables Power Nap for Intel Macs
        echo  "$(date) | CPU architecture is Intel. Therefore, we need to make sure that Power Nap is disabled or already disabled. Applying needed changes..."
        /usr/bin/pmset -a powernap 0
        echo  "$(date) | Power Nap is disabled or already disabled for your Intel Mac."
    fi
}

# Disables Printer Sharing
DisablePrinterSharing() {
    /usr/sbin/cupsctl --no-share-printers
    echo  "$(date) | Printer Sharing is disabled or already disabled."
}

# Disables Remote Apple Events
DisableRemoteAppleEvents() {
    /usr/sbin/systemsetup -setremoteappleevents off 2> /dev/null
    echo "$(date) | Remote Apple Events is now disabled or already disabled."
}

# Disables Remote Login
DisableRemoteLogin() {
    echo Yes | /usr/sbin/systemsetup -setremotelogin off
    echo ""
    echo "$(date) | Remote Login is now disabled or already disabled."
}

# Disables Remote Management
DisableRemoteManagement() {
    /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -stop
    echo "$(date) | Remote Management will be fully disabled after reboot or is already disabled."
}

# Disable SMB 1 and NetBIOS
DisableSMB1NetBIOSAndNetbiosd() {
    echo  "$(date) | Disabling SMB1 and NetBIOS..."
    ## Check if "/etc/nsmb.conf" existed
    if [ -f "$file" ]; then
        echo "$(date) | $file exists. Let's proceed..."
        # Check if protocol_vers_map is set to a different number or missing
        ## Lock negotiation to SMB2/3 only
        ## 7 == 0111  SMB 1/2/3 should be enabled
        ## 6 == 0110  SMB 2/3 should be enabled
        ## 4 == 0100  SMB 3 should be enabled
        if grep -q "^protocol_vers_map=" "$file"; then
            current_value1=$(grep -E "^protocol_vers_map=" "$file" | cut -d'=' -f2)
            if [ "$current_value1" != "6" ]; then
                echo "$(date) | protocol_vers_map is set to $current_value1. Changing it to 6..."
                sed -i '' 's/^protocol_vers_map=.*/protocol_vers_map=6/' "$file"
            else
                echo "$(date) | protocol_vers_map is already set to 6."
            fi
        else
            echo "$(date) | protocol_vers_map is missing. Adding it..."
            echo "protocol_vers_map=6" | tee -a "$file" > /dev/null
        fi
        # Check if port445 is set to no_netbios or missing
        ## No SMB1, so we disable NetBIOS
        if grep -q "^port445=" "$file"; then
            current_value2=$(grep -E "^port445=" "$file" | cut -d'=' -f2)
            if [ "$current_value2" != "no_netbios" ]; then
                echo "$(date) | port445 is set to $current_value2. Changing it to no_netbios..."
                sed -i '' 's/^port445=.*/port445=no_netbios/' "$file"
            else
                echo "$(date) | port445 is already set to no_netbios."
            fi
        else
            echo "$(date) | port445 is missing. Adding it..."
            echo "port445=no_netbios" | tee -a "$file" > /dev/null
        fi
    else
        ## Creates /etc/nsmb.conf if not existed
        echo "$(date) | $file does not exist. Creating file..."
        echo "[default]" | tee -a $file > /dev/null
        ## Lock negotiation to SMB2/3 only
        ## 7 == 0111  SMB 1/2/3 should be enabled
        ## 6 == 0110  SMB 2/3 should be enabled
        ## 4 == 0100  SMB 3 should be enabled
        echo "protocol_vers_map=6" | tee -a $file > /dev/null
        ## No SMB1, so we disable NetBIOS
        echo "port445=no_netbios" | tee -a /etc/nsmb.conf > /dev/null
    fi

    ## Disable netbiosd name registration
    launchctl disable system/netbiosd 2> /dev/null
    launchctl unload -w /System/Library/LaunchDaemons/com.apple.netbiosd.plist 2> /dev/null
    echo  "$(date) | SMB1, NetBIOS and netbiosd is now disabled or already disabled."
}

DisableScreenSharing() {
    /bin/launchctl disable system/com.apple.screensharing 2> /dev/null
    /bin/launchctl bootout system/com.apple.screensharing 2> /dev/null
    echo "$(date) | Screen Sharing via VNC is now disabled or already disabled."
}

# Enables "Show all filename extensions" -setting from Finder from current user
ShowAllFilenameExtensions() {
    defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder
    echo "$(date) | 'Show all filename extensions' -setting is now enabled or it is already enabled from Finder for user $USER."
}

# Set to ensure an Administrator account cannot login to another user's active and locked session
EnableAppleMobileFileIntegrityAMFI() {
    /usr/sbin/nvram boot-args=""
    echo "$(date) | Apple Mobile File Integrity (AMFI) is enabled or already enabled."
}

# Set to ensure an Administrator account cannot login to another user's active and locked session
AdministratorAccountCannotLoginToAnotherUsersActiveAndLockedSession() {
    /usr/bin/security authorizationdb write system.login.screensaver use-login-window-ui
    echo "$(date) | Administrator account cannot login to another user's active and locked session is now set or is already set."
}

# Set to require an administrator password to access system-wide settings
AdministratorPasswordToSystemWidePreferences() {
    authDBs=("system.preferences" "system.preferences.energysaver" "system.preferences.network" "system.preferences.printing" "system.preferences.sharing" "system.preferences.softwareupdate" "system.preferences.startupdisk" "system.preferences.timemachine")
    for section in ${authDBs[@]}; do
        /usr/bin/security -q authorizationdb read "$section" > "/tmp/$section.plist" key_value=$(/usr/libexec/PlistBuddy -c "Print :shared" "/tmp/$section.plist" 2>&1)
        if [[ "$key_value" == *"Does Not Exist"* ]]; then
            /usr/libexec/PlistBuddy -c "Add :shared bool false" "/tmp/$section.plist"
        else 	/usr/libexec/PlistBuddy -c "Set :shared false" "/tmp/$section.plist"
        fi
        /usr/bin/security -q authorizationdb write "$section" < "/tmp/$section.plist"
    done
    echo "$(date) | Ensure an Administrator password is required to access system-wide Preferences is now set or already set."
}

# Secure User's Home Folders
SecureUsersHomeFolders() {
    IFS=$'\n'
    for userDirs in $( /usr/bin/find /System/Volumes/Data/Users -mindepth 1 -maxdepth 1 -type d ! \( -perm 700 -o -perm 711 \) | /usr/bin/grep -v "Shared" | /usr/bin/grep -v "Guest" ); do
        /bin/chmod og-rwx "$userDirs"
    done
    unset IFS
    echo  "$(date) | User's Home Folders are now secured or already secured."
}

# Start logging
exec &> >(tee -a "$log")

# Begin Script Body
echo ""
echo "##############################################################"
echo "# $(date) | Starting running of script $appname"
echo "############################################################"
echo ""

# Run functions
EnableSecurityAuditing
ControlledAuditRecords
DisableBonjourAdvertisingServices
DisableHTTPServer
DisableNFSServer
DeleteGuestHomeFolder
DisableGuestAccessToSharedFolders
DisablePowerNapForIntelMacs
DisablePrinterSharing
DisableRemoteAppleEvents
DisableRemoteLogin
DisableRemoteManagement
DisableSMB1NetBIOSAndNetbiosd
DisableScreenSharing
ShowAllFilenameExtensions
EnableAppleMobileFileIntegrityAMFI
AdministratorAccountCannotLoginToAnotherUsersActiveAndLockedSession
AdministratorPasswordToSystemWidePreferences
SecureUsersHomeFolders