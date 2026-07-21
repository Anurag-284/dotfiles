#!/bin/bash

# This script uses 'pactl subscribe' to update the volume
# in real-time, which is more efficient than polling.

# Function to get volume and print the formatted string
print_volume() {
    SINK=$(pactl get-default-sink)
    VOLUME=$(pactl get-sink-volume "$SINK" | grep -Po '[0-9]{1,3}(?=%)' | head -1)
    MUTED=$(pactl get-sink-mute "$SINK" | grep -q 'yes' && echo "yes" || echo "no")

    if [ "$MUTED" = "yes" ]; then
        echo "󰸈 Muted"
    else
        if [ "$VOLUME" -lt 30 ]; then
            ICON="󰕿"  # Low volume
        elif [ "$VOLUME" -lt 70 ]; then
            ICON="󰖀"  # Medium volume
        else
            ICON="󰕾"  # High volume
        fi
        echo "$ICON $VOLUME%"
    fi
}

# Handle the --toggle argument for muting
if [ "$1" == "--toggle" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    exit 0
fi

# Initial print
print_volume

# Subscribe to volume changes and print updates
pactl subscribe | while read -r event; do
    if echo "$event" | grep -q "on sink"; then
        print_volume
    fi
done
