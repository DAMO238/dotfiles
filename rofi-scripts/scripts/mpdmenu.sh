#!/bin/bash

rofi_command="rofi -theme /usr/share/rofi-menus-git/themes/mpdmenu.rasi"

### Options ###
# Gets the current status of mpd (for us to parse it later on)
status="Using Strawberry"
# Defines the Play / Pause option content
play_pause="  /"
active=""
urgent=""
# Display if repeat mode is on / off
tog_repeat="  凌"
if [[ $status == *"repeat: on"* ]]; then
    active="-a 4"
elif [[ $status == *"repeat: off"* ]]; then
    urgent="-u 4"
else
    tog_repeat=" Parsing error"
fi
# Display if random mode is on / off
stop="  "
next="  "
previous="  "
# Variable passed to rofi
options="$previous\n$play_pause\n$stop\n$next\n$tog_repeat\n$tog_random"

# Get the current playing song
# If mpd isn't running it will return an empty string, we don't want to display that
current="Using strawberry..."

# Spawn the mpd menu with the "Play / Pause" entry selected by default
chosen="$(echo -e "$options" | $rofi_command -p "$current" -dmenu $active $urgent -selected-row 1)"
case $chosen in
    $previous)
        strawberry -r
        ;;
    $play_pause)
        strawberry -t
        ;;
    $stop)
        strawberry -s
        ;;
    $next)
        strawberry -f
        ;;
esac

