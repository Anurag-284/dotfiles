#!/bin/bash

# Get the directory of the script
EWW_CONFIG_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# The name of the window as defined in your eww.yuck
EWW_WINDOW="dashboard_window"

# --- Script Logic ---

# Check if the Eww daemon is running. If not, start it.
if ! pgrep -x eww > /dev/null; then
    eww -c "$EWW_CONFIG_DIR" daemon
    sleep 1 # Give it a moment to start
fi

# Get the list of active eww windows
# The asterisk (*) indicates an open window
active_windows=$(eww -c "$EWW_CONFIG_DIR" windows)

if [[ $active_windows == *"$EWW_WINDOW"* ]]; then
    # If the dashboard window is in the list of active windows, close it.
    echo "Closing Eww dashboard..."
    eww -c "$EWW_CONFIG_DIR" close "$EWW_WINDOW"
else
    # If the dashboard window is not active, open it.
    echo "Opening Eww dashboard..."
    eww -c "$EWW_CONFIG_DIR" open "$EWW_WINDOW"
fi

exit 0
