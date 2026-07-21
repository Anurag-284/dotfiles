#!/bin/bash

EWW_CMD="eww -c $HOME/.config/eww"

# Check if the powermenu is already open
if $EWW_CMD active-windows | grep -q "powermenu"; then
    $EWW_CMD close powermenu
else
    $EWW_CMD open powermenu
fi
