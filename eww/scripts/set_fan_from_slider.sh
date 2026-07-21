#!/bin/bash

# The value from the slider (0-100) will be passed as the first argument
VALUE=$1

# We use a threshold of 50.
# If you drag the slider to the bottom half, it will trigger 'auto'.
# If you drag it to the top half, it will trigger 'max'.
if [ "$VALUE" -lt 50 ]; then
  nbfc set -a      # Set fan to Automatic
else
  nbfc set -s 100  # Set fan to Max Speed (100%)
fi
