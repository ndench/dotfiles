#!/usr/bin/env bash

BAR_ICON=""
NOTIFY_ICON=/usr/share/icons/gnome/32x32/apps/system-software-update.png

get_total_updates()
{
    UPDATES=$(checkupdates 2>/dev/null | wc -l)
}

get_total_updates
echo "$BAR_ICON $UPDATES updates available"

if [[ -z "${DISPLAY}" ]]; then
    echo "Setting DISPLAY"
    export DISPLAY=:0
else
    echo "DISPLAY set: ${DISPLAY}"
fi

if [[ -z "${DBUS_SESSION_BUS_ADDRESS}" ]]; then
    echo "Setting DBUS_SESSION_BUS_ADDRESS"
    export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
else
    echo "DBUS_SESSION_BUS_ADDRESS set: ${DBUS_SESSION_BUS_ADDRESS}"
fi

# notify user of updates
if (( UPDATES > 50 )); then
    notify-send -u critical -i $NOTIFY_ICON "Updates Available" "$UPDATES packages"
elif (( UPDATES > 25 )); then
    notify-send -u normal -i $NOTIFY_ICON "Updates Available"  "$UPDATES packages"
elif (( UPDATES > 2 )); then
    notify-send -u low -i $NOTIFY_ICON "Updates Available" "$UPDATES packages"
fi
