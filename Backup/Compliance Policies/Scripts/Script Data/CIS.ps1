#!/bin/bash
# =============================================================
# CIS Apple macOS 26 Tahoe Benchmark v1.0.0 - Level 1
# + Microsoft Defender for Endpoint checks
# Intune Custom Compliance Discovery Script
# Author : Somesh Pathak
# Logs to: /Library/Logs/Microsoft/IntuneScripts/CISCompliance.log
# Output : single-line JSON to stdout | Exit 0
# =============================================================

scriptName="CIS-Level1"
logDir="/Library/Logs/Microsoft/IntuneScripts/Compliance"
LOGFILE="$logDir/$scriptName.log"
MAXSIZE=1048576 # 1 MB rotation threshold

# --- Log rotation ---
if [[ ! -d "$logDir" ]]; then
	mkdir -p "$logDir"
fi
if [[ -f "$LOGFILE" ]]; then
	size=$(stat -f%z "$LOGFILE" 2>/dev/null || echo 0)
	[[ "$size" -gt "$MAXSIZE" ]] && mv "$LOGFILE" "${LOGFILE}.1"
fi
touch "$LOGFILE" 2>/dev/null
chmod 644 "$LOGFILE" 2>/dev/null

log() { echo "$(date '+%Y-%m-%d %H:%M:%S') | $1" >>"$LOGFILE"; }

# Log a check: ID | raw value read | evaluated result
logcheck() { log "  $1 | raw='$2' | result=$3"; }

consoleUser=$(stat -f%Su /dev/console)

log "=============================================================="
log "RUN START | user=$(whoami) | consoleUser=$consoleUser | tty=$([[ -t 0 ]] && echo yes || echo no) | PATH=$PATH"
log "macOS: $(sw_vers -productVersion) ($(sw_vers -buildVersion))"

userDefault() { sudo -u "$consoleUser" defaults -currentHost read "$1" "$2" 2>/dev/null; }

managedPref() {
	sudo -u "$consoleUser" osascript -l JavaScript \
		-e "$.NSUserDefaults.alloc.initWithSuiteName('$1').objectForKey('$2').js" 2>/dev/null
}

# Read a system-scope managed preference (config profile, device channel)
managedSystemPref() {
	osascript -l JavaScript \
		-e "$.NSUserDefaults.alloc.initWithSuiteName('$1').objectForKey('$2').js" 2>/dev/null
}

# ---------- Section 1: Software Updates ----------
log "--- Section 1: Software Updates ---"
su="/Library/Preferences/com.apple.SoftwareUpdate"

raw=$(defaults read $su AutomaticDownload 2>/dev/null)
[[ "$raw" == "1" ]] && c_1_2="true" || c_1_2="false"
logcheck "CIS_1_2_AutoDownloadUpdates (com.apple.SoftwareUpdate:AutomaticDownload)" "$raw" "$c_1_2"

raw=$(defaults read $su AutomaticallyInstallMacOSUpdates 2>/dev/null)
[[ -z "$raw" ]] && raw=$(managedSystemPref "com.apple.SoftwareUpdate" "AutomaticallyInstallMacOSUpdates")
[[ "$raw" == "1" || "$raw" == "true" ]] && c_1_3="true" || c_1_3="false"
logcheck "CIS_1_3_InstallMacOSUpdates (SoftwareUpdate:AutomaticallyInstallMacOSUpdates + managed)" "$raw" "$c_1_3"

raw=$(defaults read /Library/Preferences/com.apple.commerce AutoUpdate 2>/dev/null)
[[ "$raw" == "1" ]] && c_1_4="true" || c_1_4="false"
logcheck "CIS_1_4_InstallAppStoreUpdates (com.apple.commerce:AutoUpdate)" "$raw" "$c_1_4"

r1=$(defaults read $su ConfigDataInstall 2>/dev/null)
[[ -z "$r1" ]] && r1=$(managedSystemPref "com.apple.SoftwareUpdate" "ConfigDataInstall")
r2=$(defaults read $su CriticalUpdateInstall 2>/dev/null)
[[ -z "$r2" ]] && r2=$(managedSystemPref "com.apple.SoftwareUpdate" "CriticalUpdateInstall")
if [[ ("$r1" == "1" || "$r1" == "true") && ("$r2" == "1" || "$r2" == "true") ]]; then c_1_5="true"; else c_1_5="false"; fi
logcheck "CIS_1_5_InstallSecurityResponses (ConfigDataInstall/CriticalUpdateInstall)" "$r1/$r2" "$c_1_5"

raw=$(managedPref "com.apple.applicationaccess" "enforcedSoftwareUpdateDelay")
if [[ -z "$raw" || "$raw" == "null" ]]; then
	c_1_6="true"
elif [[ "$raw" -le 30 ]]; then c_1_6="true"; else c_1_6="false"; fi
logcheck "CIS_1_6_UpdateDefermentMax30Days (managed:enforcedSoftwareUpdateDelay)" "$raw" "$c_1_6"

# ---------- Section 2.3: AirPlay, Time, Sharing ----------
log "--- Section 2.3: AirPlay / Time / Sharing ---"

raw=$(userDefault com.apple.controlcenter AirplayRecieverEnabled)
[[ "$raw" == "1" ]] && c_2_3_1_2="false" || c_2_3_1_2="true"
logcheck "CIS_2_3_1_2_AirPlayReceiverDisabled (user:controlcenter:AirplayRecieverEnabled)" "$raw" "$c_2_3_1_2"

raw=$(systemsetup -getusingnetworktime 2>/dev/null)
echo "$raw" | grep -q "On" && c_2_3_2_1="true" || c_2_3_2_1="false"
logcheck "CIS_2_3_2_1_NetworkTimeEnabled (systemsetup -getusingnetworktime)" "$raw" "$c_2_3_2_1"

raw=$(launchctl print-disabled system 2>/dev/null | grep '"com.apple.screensharing"')
echo "$raw" | grep -q "true" && c_2_3_3_1="true" || c_2_3_3_1="false"
logcheck "CIS_2_3_3_1_ScreenSharingDisabled (launchctl print-disabled)" "$raw" "$c_2_3_3_1"

raw=$(launchctl print-disabled system 2>/dev/null | grep '"com.apple.smbd"')
if echo "$raw" | grep -q "true"; then
	c_2_3_3_2="true"
elif echo "$raw" | grep -q "enabled\|false"; then
	c_2_3_3_2="false"
else
	# Not in print-disabled output — fall back to whether smbd is actually loaded
	if launchctl list 2>/dev/null | grep -q "com.apple.smbd"; then
		c_2_3_3_2="false"
		raw="not listed; smbd loaded"
	else
		c_2_3_3_2="true"
		raw="not listed; smbd not loaded"
	fi
fi
logcheck "CIS_2_3_3_2_FileSharingDisabled (print-disabled + launchctl list fallback)" "$raw" "$c_2_3_3_2"

raw=$(cupsctl 2>/dev/null | grep "_share_printers")
echo "$raw" | grep -q "_share_printers=0" && c_2_3_3_3="true" || c_2_3_3_3="false"
logcheck "CIS_2_3_3_3_PrinterSharingDisabled (cupsctl)" "$raw" "$c_2_3_3_3"

raw=$(systemsetup -getremotelogin 2>/dev/null)
echo "$raw" | grep -q "Off" && c_2_3_3_4="true" || c_2_3_3_4="false"
logcheck "CIS_2_3_3_4_RemoteLoginDisabled (systemsetup -getremotelogin)" "$raw" "$c_2_3_3_4"

raw=$(ps -ef | grep -c "[A]RDAgent")
[[ "$raw" -eq 0 ]] && c_2_3_3_5="true" || c_2_3_3_5="false"
logcheck "CIS_2_3_3_5_RemoteManagementDisabled (ARDAgent process count)" "$raw" "$c_2_3_3_5"

raw=$(systemsetup -getremoteappleevents 2>/dev/null)
echo "$raw" | grep -q "Off" && c_2_3_3_6="true" || c_2_3_3_6="false"
logcheck "CIS_2_3_3_6_RemoteAppleEventsDisabled (systemsetup -getremoteappleevents)" "$raw" "$c_2_3_3_6"

raw=$(defaults read /Library/Preferences/SystemConfiguration/com.apple.nat 2>/dev/null | grep -c "Enabled = 1")
[[ "$raw" -eq 0 ]] && c_2_3_3_7="true" || c_2_3_3_7="false"
logcheck "CIS_2_3_3_7_InternetSharingDisabled (com.apple.nat Enabled count)" "$raw" "$c_2_3_3_7"

raw=$(userDefault com.apple.Bluetooth PrefKeyServicesEnabled)
[[ "$raw" == "1" ]] && c_2_3_3_10="false" || c_2_3_3_10="true"
logcheck "CIS_2_3_3_10_BluetoothSharingDisabled (user:Bluetooth:PrefKeyServicesEnabled)" "$raw" "$c_2_3_3_10"

# ---------- Section 2.5.1: Apple Intelligence ----------
log "--- Section 2.5.1: Apple Intelligence (managed prefs) ---"

raw=$(managedPref "com.apple.applicationaccess" "allowExternalIntelligenceIntegrations")
[[ "$raw" == "false" || "$raw" == "0" ]] && c_2_5_1_1="true" || c_2_5_1_1="false"
logcheck "CIS_2_5_1_1_ExternalIntelligenceDisabled (managed:allowExternalIntelligenceIntegrations)" "$raw" "$c_2_5_1_1"

raw=$(managedPref "com.apple.applicationaccess" "allowWritingTools")
[[ "$raw" == "false" || "$raw" == "0" ]] && c_2_5_1_2="true" || c_2_5_1_2="false"
logcheck "CIS_2_5_1_2_WritingToolsDisabled (managed:allowWritingTools)" "$raw" "$c_2_5_1_2"

raw=$(managedPref "com.apple.applicationaccess" "allowMailSummary")
[[ "$raw" == "false" || "$raw" == "0" ]] && c_2_5_1_3="true" || c_2_5_1_3="false"
logcheck "CIS_2_5_1_3_MailSummarizationDisabled (managed:allowMailSummary)" "$raw" "$c_2_5_1_3"

raw=$(managedPref "com.apple.applicationaccess" "allowNotesTranscriptionSummary")
[[ "$raw" == "false" || "$raw" == "0" ]] && c_2_5_1_4="true" || c_2_5_1_4="false"
logcheck "CIS_2_5_1_4_NotesSummarizationDisabled (managed:allowNotesTranscriptionSummary)" "$raw" "$c_2_5_1_4"

# ---------- Section 2.10 / 2.11 / 2.13 ----------
log "--- Section 2.10 / 2.11 / 2.13: Energy / Lock Screen / Users ---"

raw=$(pmset -g custom 2>/dev/null | awk '/AC Power/,/Battery Power/' | awk '/womp/ {print $2}' | head -1)
[[ -z "$raw" ]] && raw=$(pmset -g 2>/dev/null | awk '/womp/ {print $2}' | head -1)
[[ "$raw" == "0" ]] && c_2_10_3="true" || c_2_10_3="false"
logcheck "CIS_2_10_3_WakeForNetworkAccessDisabled (pmset womp, AC power)" "$raw" "$c_2_10_3"

raw=$(userDefault com.apple.screensaver idleTime)
[[ -z "$raw" ]] && raw=$(managedPref "com.apple.screensaver" "idleTime")
[[ -n "$raw" && "$raw" =~ ^[0-9]+$ && "$raw" -gt 0 && "$raw" -le 900 ]] && c_2_11_1="true" || c_2_11_1="false"
logcheck "CIS_2_11_1_ScreenSaverMax15Min (screensaver:idleTime user+managed, seconds)" "$raw" "$c_2_11_1"

p=$(userDefault com.apple.screensaver askForPassword)
[[ -z "$p" ]] && p=$(managedPref "com.apple.screensaver" "askForPassword")
d=$(userDefault com.apple.screensaver askForPasswordDelay)
[[ -z "$d" ]] && d=$(managedPref "com.apple.screensaver" "askForPasswordDelay")
[[ -z "$d" || ! "$d" =~ ^[0-9]+$ ]] && d=999
if [[ ("$p" == "1" || "$p" == "true") && "$d" -le 5 ]]; then c_2_11_2="true"; else c_2_11_2="false"; fi
logcheck "CIS_2_11_2_PasswordAfterScreenSaver (askForPassword/Delay user+managed)" "$p/$d" "$c_2_11_2"

raw=$(defaults read /Library/Preferences/com.apple.loginwindow RetriesUntilHint 2>/dev/null)
[[ -z "$raw" ]] && raw=$(managedSystemPref "com.apple.loginwindow" "RetriesUntilHint")
[[ -z "$raw" ]] && raw="unset(default=3)"
[[ "$raw" == "0" ]] && c_2_11_5="true" || c_2_11_5="false"
logcheck "CIS_2_11_5_PasswordHintsDisabled (loginwindow:RetriesUntilHint system+managed)" "$raw" "$c_2_11_5"

raw=$(defaults read /Library/Preferences/com.apple.loginwindow GuestEnabled 2>/dev/null)
[[ "$raw" == "1" ]] && c_2_13_1="false" || c_2_13_1="true"
logcheck "CIS_2_13_1_GuestAccountDisabled (loginwindow:GuestEnabled)" "$raw" "$c_2_13_1"

raw=$(sysadminctl -smbGuestAccess status 2>&1)
echo "$raw" | grep -q "disabled" && c_2_13_2="true" || c_2_13_2="false"
logcheck "CIS_2_13_2_GuestSharedFoldersDisabled (sysadminctl -smbGuestAccess)" "$raw" "$c_2_13_2"

# ---------- Microsoft Defender for Endpoint ----------
log "--- Microsoft Defender for Endpoint ---"
MDATP="/usr/local/bin/mdatp"

if [[ -x "$MDATP" ]]; then
	lic=$("$MDATP" health --field licensed 2>/dev/null | tr -d '"')
	org=$("$MDATP" health --field org_id 2>/dev/null | tr -d '"')
	[[ "$lic" == "true" && -n "$org" ]] && mde_onboarded="true" || mde_onboarded="false"
	logcheck "MDE_Onboarded (mdatp health licensed/org_id)" "$lic / org_id_present=$([[ -n "$org" ]] && echo yes || echo no)" "$mde_onboarded"

	hlt=$("$MDATP" health --field healthy 2>/dev/null | tr -d '"')
	[[ "$hlt" == "true" ]] && mde_healthy="true" || mde_healthy="false"
	logcheck "MDE_Healthy (mdatp health healthy)" "$hlt" "$mde_healthy"

	rtp=$("$MDATP" health --field real_time_protection_enabled 2>/dev/null | tr -d '"')
	[[ "$rtp" == "true" ]] && mde_rtp="true" || mde_rtp="false"
	logcheck "MDE_RealTimeProtectionOn (mdatp health real_time_protection_enabled)" "$rtp" "$mde_rtp"

	threats=$("$MDATP" threat list 2>/dev/null)
	if [[ -z "$threats" ]] || echo "$threats" | grep -qi "no threats"; then
		mde_nothreats="true"
	else
		mde_nothreats="false"
		log "  ACTIVE THREATS DETECTED:"
		echo "$threats" | sed 's/^/    /' >>"$LOGFILE"
	fi
	logcheck "MDE_NoActiveThreats (mdatp threat list)" "$(echo "$threats" | head -1)" "$mde_nothreats"
else
	mde_onboarded="false"
	mde_healthy="false"
	mde_rtp="false"
	mde_nothreats="false"
	log "  mdatp binary not found at $MDATP — all MDE checks reported false"
fi

# ---------- Output ----------
JSON="{\"CIS_1_2_AutoDownloadUpdates\":$c_1_2,\"CIS_1_3_InstallMacOSUpdates\":$c_1_3,\"CIS_1_4_InstallAppStoreUpdates\":$c_1_4,\"CIS_1_5_InstallSecurityResponses\":$c_1_5,\"CIS_1_6_UpdateDefermentMax30Days\":$c_1_6,\"CIS_2_3_1_2_AirPlayReceiverDisabled\":$c_2_3_1_2,\"CIS_2_3_2_1_NetworkTimeEnabled\":$c_2_3_2_1,\"CIS_2_3_3_1_ScreenSharingDisabled\":$c_2_3_3_1,\"CIS_2_3_3_2_FileSharingDisabled\":$c_2_3_3_2,\"CIS_2_3_3_3_PrinterSharingDisabled\":$c_2_3_3_3,\"CIS_2_3_3_4_RemoteLoginDisabled\":$c_2_3_3_4,\"CIS_2_3_3_5_RemoteManagementDisabled\":$c_2_3_3_5,\"CIS_2_3_3_6_RemoteAppleEventsDisabled\":$c_2_3_3_6,\"CIS_2_3_3_7_InternetSharingDisabled\":$c_2_3_3_7,\"CIS_2_3_3_10_BluetoothSharingDisabled\":$c_2_3_3_10,\"CIS_2_5_1_1_ExternalIntelligenceDisabled\":$c_2_5_1_1,\"CIS_2_5_1_2_WritingToolsDisabled\":$c_2_5_1_2,\"CIS_2_5_1_3_MailSummarizationDisabled\":$c_2_5_1_3,\"CIS_2_5_1_4_NotesSummarizationDisabled\":$c_2_5_1_4,\"CIS_2_10_3_WakeForNetworkAccessDisabled\":$c_2_10_3,\"CIS_2_11_1_ScreenSaverMax15Min\":$c_2_11_1,\"CIS_2_11_2_PasswordAfterScreenSaver\":$c_2_11_2,\"CIS_2_11_5_PasswordHintsDisabled\":$c_2_11_5,\"CIS_2_13_1_GuestAccountDisabled\":$c_2_13_1,\"CIS_2_13_2_GuestSharedFoldersDisabled\":$c_2_13_2,\"MDE_Onboarded\":$mde_onboarded,\"MDE_Healthy\":$mde_healthy,\"MDE_RealTimeProtectionOn\":$mde_rtp,\"MDE_NoActiveThreats\":$mde_nothreats}"

log "SUBMITTED JSON: $JSON"
fails=$(echo "$JSON" | grep -o "false" | wc -l | tr -d ' ')
log "RUN END | non-compliant settings: $fails"
log ""

echo "$JSON"
exit 0
