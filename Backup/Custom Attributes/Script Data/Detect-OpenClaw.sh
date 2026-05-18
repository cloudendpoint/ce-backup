#!/bin/bash
# OpenClaw/Clawdbot/Moltbot Detection - Custom Attribute
# Runs as root, must check all user directories
DETECTED="Not Detected"
# Check binaries
if [ -f "/usr/local/bin/openclaw" ] || [ -f "/opt/homebrew/bin/openclaw" ]; then
    DETECTED="Detected"
fi
# Check all user home directories
for USER_HOME in /Users/*; do
    [ ! -d "$USER_HOME" ] && continue
    [ "$USER_HOME" = "/Users/Shared" ] && continue

    if [ -d "$USER_HOME/.openclaw" ] || \
    [ -d "$USER_HOME/.clawdbot" ] || \
    [ -d "$USER_HOME/.moltbot" ] || \
    ls "$USER_HOME"/Library/LaunchAgents/*openclaw* &>/dev/null 2>&1; then
        DETECTED="Detected"
        break
    fi
done
echo "$DETECTED"
exit 0