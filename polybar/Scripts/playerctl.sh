#!/bin/bash

# A Polybar script for playerctl

player_status() {
    if [ "$(playerctl status)" = "Playing" ]; then
        echo "󰏤 $(playerctl metadata artist) - $(playerctl metadata title)"
    elif [ "$(playerctl status)" = "Paused" ]; then
        echo "󰐊 $(playerctl metadata artist) - $(playerctl metadata title)"
    else
        echo "Nothing Playing"
    fi
}

# Initial output
player_status

# Listen for changes and update
playerctl --follow status | while read -r _; do
    player_status
done
