#!/bin/bash
eww update show_volume=true
eww update timer=3
pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1
