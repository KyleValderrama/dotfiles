#!/bin/bash
killall hyprpaper

sed -i "1 c\\preload = $1" /home/kyle/.config/hypr/hyprpaper.conf
sed -i "2 c\\wallpaper = ,$1" /home/kyle/.config/hypr/hyprpaper.conf
wal -t -s -i $1

nohup hyprpaper >/dev/null 2>&1 &
