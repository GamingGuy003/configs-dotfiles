#!/bin/bash
# fetch window list
windows=$(hyprctl clients | awk '/title:/{$1="";sub(/^ */, ""); gsub(/\([^)]+\)/,""); print}')

# count items
len=$(echo "$windows" | wc -l)

# cap items at 15
if (( $len > 15 )); then
  len=15
fi

# fetch longest line
max=$(echo "$windows" | awk '{ln=length} ln>max{max=ln} END {print max}' )

# cap width at 75
if (( $max > 75 )); then
  max=75
fi

# read user input
choice=$(echo "$windows" | fuzzel -d -l $len -w $max)

# if choice is empty we abort
if [ -z $choice ]; then
  exit 0
fi

# actually change window
hyprctl dispatch focuswindow "title:$choice"
