#!/bin/bash
# This script gets the album art URL from playerctl and cleans it up
ART_PATH=$(playerctl metadata mpris:artUrl | sed -e 's/file:\/\///g')

# A default icon if nothing is playing
DEFAULT_ART="$HOME/.config/eww/default_art.png" # You need to place an image here!

if [[ -n "$ART_PATH" ]]; then
    echo "$ART_PATH"
else
    echo "$DEFAULT_ART"
fi
