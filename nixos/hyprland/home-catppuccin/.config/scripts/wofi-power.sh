
entries="󰍃 Logout\n󰒲 Suspend\n󰑓 Reboot\n⏻ Shutdown"

selected=$(echo -e $entries|wofi --lines 6 --width 100 --dmenu --cache-file /dev/null --define content_halign=center | awk '{print tolower($2)}')

case $selected in
  logout)
    swaymsg exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
