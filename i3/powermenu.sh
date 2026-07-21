#!/bin/bash

# Use the main Rofi config to avoid errors
ROFI_CMD="rofi -dmenu -i"

shutdown="󰐥 Shutdown"
reboot=" Reboot"
lock="󰌾 Lock"
suspend="󰒲 Suspend"
logout="󰍃 Logout"

selected_option=$(echo -e "$shutdown\n$reboot\n$suspend\n$lock\n$logout" | $ROFI_CMD)

case $selected_option in
    "$shutdown")    systemctl poweroff ;;
    "$reboot")      systemctl reboot ;;
    "$lock")        betterlockscreen -l ;;
    "$suspend")     systemctl suspend ;;
    "$logout")      i3-msg exit ;;
esac
