#!/bin/bash

# The command to run is passed as the first argument
COMMAND_TO_RUN="$1"

# Hide the quick_shell revealer in Eww
eww update show_quickshell=false
eww update shell_input_var=""

# Exit if the command is empty
if [ -z "$COMMAND_TO_RUN" ]; then
    exit 0
fi

# Execute the command in the background and detach it completely
# This prevents the script from hanging Eww
nohup sh -c "$COMMAND_TO_RUN" >/dev/null 2>&1 & disown

exit 0
