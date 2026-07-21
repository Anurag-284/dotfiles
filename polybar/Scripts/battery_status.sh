#!/bin/bash

capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if [ "$status" == "Charging" ]; then
    icon="\uf0e7"  # Charging icon
else
    if [ "$capacity" -ge 90 ]; then
        icon="\uf240"  # Full battery
    elif [ "$capacity" -ge 60 ]; then
        icon="\uf241"  # 75% battery
    elif [ "$capacity" -ge 40 ]; then
        icon="\uf242"  # 50% battery
    elif [ "$capacity" -ge 20 ]; then
        icon="\uf243"  # 25% battery
    else
        icon="\uf244"  # Empty battery
    fi
fi

echo -e "$icon $capacity%"

