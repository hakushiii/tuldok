#!/bin/sh

source "$HOME/.config/sketchybar/icons.sh"

IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')

if [[ $IS_VPN != "" ]]; then
	COLOR=0xffb2d8d8
	ICON=$ICON_VPN
	LABEL="VPN"
	R_PADDING=10
elif [[ $IP_ADDRESS != "" ]]; then
	COLOR=0xffffb7c5
	ICON=$ICON_WIFI
	LABEL=$IP_ADDRESS
	R_PADDING=10
else
	COLOR=0xffffffff
	ICON=$ICON_WIFI_OFF
	LABEL=""
	R_PADDING=5
fi

sketchybar --set $NAME background.color=0xff3B4252 \
	icon=$ICON \
	label="$LABEL" \
	icon.color=$COLOR \
	label.color=$COLOR	\
	label.padding_right=$R_PADDING
