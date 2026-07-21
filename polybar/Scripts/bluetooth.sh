#!/bin/bash

if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
  echo "󰂲" # Bluetooth off icon
else
  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]; then
    echo "󰂯" # Bluetooth on, no device connected
  else
    echo "󰂱" # Bluetooth on, device connected
  fi
fi
