#!/bin/bash

# Get the auto-mode status from NBFC (will be "true" or "false")
IS_AUTO=$(nbfc-linux status -a | awk '{print $2}')

if [ "$IS_AUTO" == "true" ]; then
  echo 0  # If it's on Auto, set the slider value to 0
else
  echo 100 # If it's on Manual/Max, set the slider value to 100
fi
