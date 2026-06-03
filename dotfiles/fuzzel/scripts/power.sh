#!/usr/bin/env sh
set -eu

list=" Lock
 Logout
 Reboot
 Reboot to BIOS
 Shutdown"

choice=$(printf '%s' "$list" | fuzzel --dmenu --prompt=' Power: ' --lines=5) || exit 0

action="${choice#* }"

case "$action" in
Lock)
  swaylock
  ;;
Logout)
  niri msg action quit --skip-confirmation
  ;;
Reboot)
  systemctl reboot
  ;;
"Reboot to BIOS")
  systemctl reboot --firmware-setup
  ;;
Shutdown)
  systemctl poweroff
  ;;
esac
