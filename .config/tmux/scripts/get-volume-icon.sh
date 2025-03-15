#!/bin/bash

muted="$(pactl get-sink-mute @DEFAULT_SINK@ | tr -d 'Mute: ')"

if [[ $muted == "ys" ]]; then
   echo " "
else
   echo " "
fi

