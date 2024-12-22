#!/bin/bash
killall hyprpaper

sed -i "1 c\\preload = $1" ~/.config/hypr/hyprpaper.conf
sed -i "2 c\\wallpaper = ,$1" ~/.config/hypr/hyprpaper.conf
wal -i $1

nohup hyprpaper &> /dev/null &
