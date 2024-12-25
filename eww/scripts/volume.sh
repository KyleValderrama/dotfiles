#!/bin/bash
eww update show_volume=true
pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1
