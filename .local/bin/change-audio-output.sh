#!/bin/bash

set -e

current_sink_id=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep id | head -n 1 | cut -d ' ' -f2 | sed -E 's/,//gm;t;d')

echo "Current sink id $current_sink_id"

headset_sink_id=$(wpctl status | grep "G535 Wireless Gaming Headset Analog Stereo" | sed -E 's/│//g' | awk '{$1=$1};1' | cut -d' ' -f1 | sed -E 's/\.//g')
echo "Headset sink id $headset_sink_id"

speakers_sink_id=$(wpctl status | grep "Ryzen HD Audio Controller Analog Stereo" | head -n 1 | sed -E 's/│\s+.\s+//g' | awk '{$1=$1};1' | cut -d' ' -f1 | sed -E 's/\.//g')
echo "Speakers sink id $speakers_sink_id"

if [[ $current_sink_id == "$speakers_sink_id" ]]; then
  echo "Setting headset as default sink"
  wpctl set-default "$headset_sink_id"
else
  echo "Setting speakers as default sink"
  wpctl set-default "$speakers_sink_id"
fi
