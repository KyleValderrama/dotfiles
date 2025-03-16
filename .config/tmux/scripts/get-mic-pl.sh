#!/bin/bash

muted="$(pactl get-source-mute @DEFAULT_SOURCE@ | tr -d 'Mute: ')"

if [[ $muted == "ys" ]]; then
	 echo "#[fg=colour238]#[fg=white,bg=colour238] #[fg=colour238,bg=default]"
else
	 echo "#[fg=colour35]#[fg=white,bg=colour35]#[fg=colour35,bg=default]"
fi

