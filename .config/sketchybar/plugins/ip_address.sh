#!/bin/sh

source "$HOME/.config/sketchybar/icons.sh"

IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')

if [[ $IS_VPN != "" ]]; then
	COLOR=0xffb2d8d8
	ICON=$ICON_VPN
	LABEL="VPN"
elif [[ $IP_ADDRESS != "" ]]; then
	COLOR=0xffffb7c5
	ICON=$ICON_WIFI
	LABEL=$IP_ADDRESS
else
	COLOR=0xffffffff
	ICON=$ICON_WIFI_OFF
	LABEL="N/A"
fi

sketchybar --set $NAME background.color=0xff3B4252 \
	icon=$ICON \
	label="$LABEL" \
	icon.color=$COLOR \
	label.color=$COLOR
