#!/bin/sh

source "$HOME/.config/sketchybar/icons.sh"

VOLUME=$INFO

case $VOLUME in
[9][0-9] | 100)
	ICON=${ICONS_VOLUME[3]}
	LABEL="$VOLUME%"
	BGCOLOR=0xffffffff
	COLOR=0xffff0000
	;;
[3-8][0-9])
	ICON=${ICONS_VOLUME[2]}
	LABEL="$VOLUME%"
	BGCOLOR=0xff3B4252
	COLOR=0xffffffff
	;;
[1-9] | [1-2][0-9])
	ICON=${ICONS_VOLUME[1]}
	LABEL="$VOLUME%"
	BGCOLOR=0xff3B4252
	COLOR=0xffffffff
	;;
*)
	ICON=${ICONS_VOLUME[0]}
	LABEL=""
	BGCOLOR=0xff3B4252
	COLOR=0xffffffff
	;;
esac

sketchybar --set $NAME icon="$ICON" \
	icon.color=$COLOR \
	label=$LABEL \
	background.color=$BGCOLOR \
	label.color=$COLOR
