#!/bin/bash

# Increase brightness
if [[ $1 == "up" ]]; then
    brightnessctl set +10%
fi

# Decrease brightness
if [[ $1 == "down" ]]; then
    brightnessctl set 10%-
fi

