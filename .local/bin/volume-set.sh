#!/bin/bash

case $1 in
up)
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+
  ;;
down)
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-
  ;;
mute)
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  ;;
micup)
  wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 1%+
  ;;
micdown)
  wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 1%-
  ;;
micmute)
  wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
  ;;
esac
