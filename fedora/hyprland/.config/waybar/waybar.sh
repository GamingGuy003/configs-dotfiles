#!/bin/bash

# Find the amdgpu hwmon path automatically
DETECTED_PATH=$(grep -l "amdgpu" /sys/class/hwmon/hwmon*/name | head -n 1 | xargs dirname)

if [ -z "$DETECTED_PATH" ]; then
  echo "Error: GPU path not found."
  exit 1
fi

# Launch waybar with the variable exported to it
GPU_PATH="$DETECTED_PATH" waybar
