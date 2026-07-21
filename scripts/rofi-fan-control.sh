#!/bin/bash

HWMON_PATH="/sys/class/hwmon/hwmon7"
TEMP_PATH="/sys/class/hwmon/hwmon6/temp1_input"  # Adjust if needed
FAN_SPEED_LOW=50
FAN_SPEED_MEDIUM=100
FAN_SPEED_HIGH=200
POLYBAR_FILE="/tmp/fan_status"

# Ensure the file exists
echo "OFF" > "$POLYBAR_FILE"

# Function to adjust fan speed based on temperature
set_auto_mode() {
    echo "AUTO" > "$POLYBAR_FILE"
    while true; do
        TEMP=$(cat "$TEMP_PATH")
        TEMP_C=$((TEMP / 1000))  # Convert to Celsius

        if [ "$TEMP_C" -lt 50 ]; then
            SPEED=$FAN_SPEED_LOW
        elif [ "$TEMP_C" -lt 70 ]; then
            SPEED=$FAN_SPEED_MEDIUM
        else
            SPEED=$FAN_SPEED_HIGH
        fi

        echo 1 | sudo tee "$HWMON_PATH/pwm1_enable" > /dev/null
        echo "$SPEED" | sudo tee "$HWMON_PATH/pwm1" > /dev/null
        echo "AUTO (${TEMP_C}°C)" > "$POLYBAR_FILE"

        sleep 5
    done
}

# Show Rofi menu
OPTION=$(echo -e "Min\nAvg\nMax\nAuto" | rofi -dmenu -p "Set Fan Speed")

case "$OPTION" in
    "Min")
        SPEED=$FAN_SPEED_LOW
        STATUS="Min"
        ;;
    "Avg")
        SPEED=$FAN_SPEED_MEDIUM
        STATUS="Avg"
        ;;
    "Max")
        SPEED=$FAN_SPEED_HIGH
        STATUS="Max"
        ;;
    "Auto")
        set_auto_mode &
        exit 0
        ;;
    *)
        exit 1
        ;;
esac

# Ensure manual fan control
echo 1 | sudo tee "$HWMON_PATH/pwm1_enable" > /dev/null
echo "$SPEED" | sudo tee "$HWMON_PATH/pwm1" > /dev/null

# Update Polybar
echo "$STATUS" > "$POLYBAR_FILE"



