#!/bin/bash
# A script that ONLY shows playerctl info if it's NOT from MPD.

playerctl -F metadata --format "{{playerName}} {{status}}" | while read -r player status; do
    # We check if the player is NOT mpd
    if [ "$player" != "mpd" ]; then
        if [ "$status" = "Playing" ]; then
            echo "󰈹 󰏤" # Browser Pause
        elif [ "$status" = "Paused" ]; then
            echo "󰈹 󰐊" # Browser Play
        else
            echo "" # Show nothing if stopped
        fi
    else
        echo "" # Show nothing if it's MPD
    fi
done
