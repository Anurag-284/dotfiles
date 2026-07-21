#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the corrected set of bars
polybar workspaces &
polybar media &
polybar apps &
polybar network &
polybar sysinfo &
polybar tray &

echo "All bars launched..."
