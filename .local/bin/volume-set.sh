#!/bin/bash

function polybar_vol() {
	icon=""
	volume=$(echo "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f2)*100" | bc)
	wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep MUTED >>/dev/null
	is_muted=$?

	current_sink_name=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep "node.description" | cut -d'=' -f2 | sed -E 's/"//gm;t;d' | awk '{$1=$1};1')
	if [[ $current_sink_name == "Family 17h/19h HD Audio Controller Analog Stereo" ]]; then
		icon=""
	fi

	if [ $is_muted -eq 0 ]; then
		icon=""
	fi
	echo "${icon} ${volume%.*}%"
}

function polybar_micvol() {
	icon=""
	volume=$(echo "$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | cut -d' ' -f2)*100" | bc)
	wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep MUTED >>/dev/null
	is_muted=$?

	if [ $is_muted -eq 0 ]; then
		icon=""
	fi
	echo "${icon} ${volume%.*}%"
}

case $1 in
up)
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
	;;
down)
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
	;;
mute)
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	;;
vol)
	polybar_vol
	LANG=EN
	pactl subscribe | while read -r event; do
		if echo "$event" | grep -q "sink" || echo "$event" | grep -q "server"; then
			polybar_vol
		fi
	done
	;;
micup)
	wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%+
	;;
micdown)
	wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%-
	;;
micmute)
	wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
	;;
micvol)
	polybar_micvol
	LANG=EN
	pactl subscribe | while read -r event; do
		if echo "$event" | grep -q "source" || echo "$event" | grep -q "server"; then
			polybar_micvol
		fi
	done
	;;
esac
