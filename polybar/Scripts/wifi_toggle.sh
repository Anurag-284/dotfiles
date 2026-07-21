#!/bin/bash

STATE_FILE="/tmp/polybar_wifi_state"

if [ -f "$STATE_FILE" ]; then
    rm "$STATE_FILE"
else
    touch "$STATE_FILE"
fi

