#!/bin/bash

INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n 1)

# Handle disconnected state
if [ -z "$INTERFACE" ]; then
    echo "󰤭"
    exit 0
fi

# Check for internet connection by pinging a reliable DNS server
if ! ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
    echo "󰤫"
    exit 0
fi

# If connected and has internet, get SSID and signal strength
SSID=$(iwgetid -r)
SIGNAL=$(awk '/^\s*w/ { print int($3 * 100 / 70) }' /proc/net/wireless)

# Ensure SIGNAL is a valid number
if ! [[ "$SIGNAL" =~ ^[0-9]+$ ]]; then
    SIGNAL=0
fi

# Select icon based on signal strength
if [ "$SIGNAL" -ge 75 ]; then
    ICON="󰤨"  # Strong
elif [ "$SIGNAL" -ge 50 ]; then
    ICON="󰤥"  # Medium
elif [ "$SIGNAL" -ge 25 ]; then
    ICON="󰤢"  # Weak
else
    ICON="󰤟"  # Very weak
fi

echo "$ICON $SSID"
