#!/bin/bash
# A script to only show the play/pause icon for playerctl

# The -F flag makes playerctl "follow" and print updates in real-time.
playerctl status -F | while read -r status; do
    if [ "$status" = "Playing" ]; then
        echo "󰏤" # Pause icon
    else
        echo "󰐊" # Play icon
    fi
done
