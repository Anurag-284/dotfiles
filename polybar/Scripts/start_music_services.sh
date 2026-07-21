#!/bin/bash

# A script to robustly start music services for i3

# 1. Start the main MPD server
mpd

# 2. Wait 1 second to give MPD time to initialize
sleep 1

# 3. Start the MPRIS bridge so playerctl can see MPD
mpd-mpris
