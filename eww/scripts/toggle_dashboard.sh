#!/bin/bash

EWW_BIN="/usr/bin/eww"

if [[ -z "$(pgrep -x eww)" ]]; then
  ${EWW_BIN} daemon
  sleep 1
fi

DASH_STATUS=$(${EWW_BIN} windows | grep '*dashboard')

if [[ -n "$DASH_STATUS" ]]; then
  ${EWW_BIN} close dashboard
else
  ${EWW_BIN} open dashboard
fi
