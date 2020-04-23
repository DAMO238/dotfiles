#!/bin/bash

rofi_command="rofi -theme /usr/share/rofi-menus-git/themes/powermenu.rasi"

### Options ###
power_off="  "
reboot="  "
lock="  "
suspend="  鈴"
log_out="  "
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
        promptmenu --yes-command "systemctl poweroff" --query "Shutdown?"
        ;;
    $reboot)
        promptmenu --yes-command "systemctl reboot" --query "Reboot?"
        ;;
    $lock)
        i3lock -f -B 7.5 --indicator
        ;;
    $suspend)
        mimic 'Suspend disabled'
        ;;
    $log_out)
        i3-msg exit
        ;;
esac

