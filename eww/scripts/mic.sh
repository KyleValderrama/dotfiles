#!/bin/bash

pactl get-source-mute @DEFAULT_SOURCE@ | grep -q 'Mute: yes' && echo false || echo true
