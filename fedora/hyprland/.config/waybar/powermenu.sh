#!/bin/bash
choices="󰜺 Abort\\n Lock\\n󰍃 Logout\\n󰜉 Reboot\\n󱄌 Reboot\\n󰐥 Poweroff"
choice=$(echo -en $choices | fuzzel -d -l 6 -w 12)
case "$choice" in
  " Lock") hyprlock
  ;;
  "󰍃 Logout") hyprctl dispatch exit
  ;;
  "󰜉 Reboot") systemctl reboot
  ;;
  "󱄌 Reboot") systemctl reboot --firmware-setup
  ;;
  "󰐥 Poweroff") systemctl poweroff
  ;;
  "󰜺 Abort"|*) exit 0
  ;;
esac
