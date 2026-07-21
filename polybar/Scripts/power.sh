#!/bin/bash

# Find the battery device name using upower
BATTERY=$(upower -e | grep 'BAT')

# Check if a battery device was found
if [ -z "$BATTERY" ]; then
    echo "No battery device found. Ensure your system recognizes the battery."
    exit 1
fi

# Fetch battery details using upower
POWER=$(upower -i "$BATTERY" | grep -E "energy-rate" | awk '{print $2}')

# Check if power consumption data is available
if [ -z "$POWER" ]; then
    echo "Unable to retrieve power consumption data. Your system might not support this feature."
    exit 1
fi

# Output power consumption in watts
echo "Current battery power consumption: $POWER W"

