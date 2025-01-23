#!/bin/bash

random=$((1 + $RANDOM % 100))

# original_photo=$(curl --request GET \
# 		--url "https://api.pexels.com/v1/search?query=dark%20nature&per_page=1&page=$random&size=large&orientation=landscape" \
# 		--header 'Authorization: SoVBriQxLTN7NzEUTo5bTUFVf2xA0ztOLR5TEKQ5jpINSQKoqz3rukGz' --no-progress-meter | jq '.photos.[].src.original' | tr -d '"')
#
# # Download Photo
#
# curl -o /home/kyle/Downloads/Wallpapers/random.jpg "$original_photo" --no-progress-meter 
# wal -c
# change-wallpaper /home/kyle/Downloads/Wallpapers/random.jpg
# eww reload




