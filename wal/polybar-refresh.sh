#!/bin/bash

# Copy the generated Polybar colors from pywal's cache
cp "$HOME/.cache/wal/colors-polybar.ini" "$HOME/.config/polybar/colors.ini"

# Kill the currently running polybar instance
killall -q polybar
