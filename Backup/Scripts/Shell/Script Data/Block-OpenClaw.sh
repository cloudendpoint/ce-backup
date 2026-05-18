#!/bin/bash
# OpenClaw/Clawdbot/Moltbot Blocker Deployment for Intune
# Handles: npm, Homebrew, manual installs

scriptname="OpenClawBlocker"
logandmetadir="/Library/Logs/Microsoft/IntuneScripts/$scriptname"
log="$logandmetadir/$scriptname.log"

## Check if the log directory has been created
if [ -d $logandmetadir ]; then
    ## Already created
    echo "# $(date) | Log directory already exists - $logandmetadir"
else
    ## Creating Metadirectory
    echo "# $(date) | creating log directory - $logandmetadir"
    mkdir -p $logandmetadir
fi

exec &> >(tee -a "$log")
# Kill any existing processes
pkill -9 -f "openclaw" 2>/dev/null
pkill -9 -f "clawdbot" 2>/dev/null
pkill -9 -f "moltbot" 2>/dev/null
# Get current user
CURRENT_USER=$(stat -f "%Su" /dev/console)
USER_HOME="/Users/$CURRENT_USER"
# Remove config directories
rm -rf "$USER_HOME/.openclaw" "$USER_HOME/.clawdbot" "$USER_HOME/.moltbot"
# Uninstall npm global packages
sudo -u "$CURRENT_USER" npm uninstall -g openclaw clawdbot moltbot 2>/dev/null
# Uninstall Homebrew packages
sudo -u "$CURRENT_USER" /opt/homebrew/bin/brew uninstall openclaw clawdbot moltbot 2>/dev/null
sudo -u "$CURRENT_USER" /usr/local/bin/brew uninstall openclaw clawdbot moltbot 2>/dev/null
# Remove binaries from all paths
rm -f /usr/local/bin/openclaw /usr/local/bin/clawdbot /usr/local/bin/moltbot
rm -f /opt/homebrew/bin/openclaw /opt/homebrew/bin/clawdbot /opt/homebrew/bin/moltbot
# Remove applications
rm -rf "/Applications/OpenClaw.app" "$USER_HOME/Applications/OpenClaw.app"
# Remove user LaunchAgents
for PLIST in "$USER_HOME"/Library/LaunchAgents/*openclaw* \
"$USER_HOME"/Library/LaunchAgents/*clawdbot* \
"$USER_HOME"/Library/LaunchAgents/*moltbot*; do
    [ -f "$PLIST" ] && launchctl bootout gui/$(id -u "$CURRENT_USER") "$PLIST" 2>/dev/null && rm -f "$PLIST"
done
# Create blocker script
mkdir -p /Library/Scripts
cat > /Library/Scripts/block_openclaw.sh << 'SCRIPT'
#!/bin/bash
while true; do
    pkill -9 -f "openclaw" 2>/dev/null
    pkill -9 -f "clawdbot" 2>/dev/null
    pkill -9 -f "moltbot" 2>/dev/null
    killall "OpenClaw" 2>/dev/null
    # Remove if reinstalled
    rm -f /usr/local/bin/openclaw /usr/local/bin/clawdbot /usr/local/bin/moltbot
    rm -f /opt/homebrew/bin/openclaw /opt/homebrew/bin/clawdbot /opt/homebrew/bin/moltbot
    sleep 5
done
SCRIPT
chmod +x /Library/Scripts/block_openclaw.sh
# Create and load LaunchDaemon
cat > /Library/LaunchDaemons/com.company.block.openclaw.plist << 'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.company.block.openclaw</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>/Library/Scripts/block_openclaw.sh</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>
PLIST
# Load daemon
launchctl bootstrap system /Library/LaunchDaemons/com.company.block.openclaw.plist 2>/dev/null || \
launchctl load /Library/LaunchDaemons/com.company.block.openclaw.plist 2>/dev/null
echo "$(date): Deployment complete"
exit 0