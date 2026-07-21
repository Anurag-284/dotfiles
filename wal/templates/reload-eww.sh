#!/bin/bash

# Reload eww
~/.config/eww/launch.sh

# Reload dunst
pkill dunst
dunst &
