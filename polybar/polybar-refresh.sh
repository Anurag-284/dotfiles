#!/bin/bash

SOURCE_FILE="${HOME}/.cache/wal/colors-polybar.ini"
DEST_FILE="${HOME}/.config/polybar/colors.ini"

sleep 0.1

if [ -f "$SOURCE_FILE" ]; then
    cp "$SOURCE_FILE" "$DEST_FILE"

    # Kill existing polybar instances
    pkill -x polybar

    # Give time for cleanup
    sleep 0.5

    # Start a new instance
    polybar main --config="${HOME}/.config/polybar/config.ini" &

    echo "Polybar theme updated and restarted successfully."
else
    echo "Error: Pywal color file not found at $SOURCE_FILE"
fi


