#!/bin/bash

sink_volume="$(wpctl get-volume @DEFAULT_SINK@ | tr -d 'Volume:' | sed "s/\[MUTED\]//")*100"
volume="$(bc <<<$sink_volume)"
int_volume=${volume::-3}

echo "$int_volume"


