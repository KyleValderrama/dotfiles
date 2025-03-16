#!/bin/bash

muted="$(pactl get-source-mute @DEFAULT_SOURCE@ | tr -d 'Mute: ')"

if [[ $muted == "ys" ]]; then
   echo "#[bg=gray]"
else
   echo "#[bg=green]"
fi
