#!/bin/bash

# Thresholds
CRITICAL=10   # %
LOW=20        # %

# Get battery percentage
BATTERY=$(cat /sys/class/power_supply/BAT*/capacity)
STATUS=$(cat /sys/class/power_supply/BAT*/status)

# If charging, do nothing
if [[ "$STATUS" == "Charging" || "$STATUS" == "Full" ]]; then
    exit 0
fi

# Critical battery warning
if [ "$BATTERY" -le "$CRITICAL" ]; then
    dunstify -u critical -t 0 "  CRITICAL: ${BATTERY}% battery left!" "Plug in charger now!"
    paplay /usr/share/sounds/freedesktop/stereo/dialog-warning.oga 2>/dev/null &
    exit 0
fi

# Low battery warning
if [ "$BATTERY" -le "$LOW" ]; then
    dunstify -u normal "  Low Battery: ${BATTERY}% left"
fi

