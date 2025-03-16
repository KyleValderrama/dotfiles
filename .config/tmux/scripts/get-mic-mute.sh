#!/bin/bash

muted="$(pactl get-source-mute @DEFAULT_SOURCE@ | tr -d 'Mute: ')"

if [[ $muted == "ys" ]]; then
   echo "􀊳"
else
   echo "􀊱"
fi
