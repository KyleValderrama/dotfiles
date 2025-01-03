#!/bin/bash
hyprctl -j clients | jq -c -r 'sort_by(.address) | map(with_entries(select(.key | in({"title": 1, "initialTitle": 1, "class" : 1, "initialClass": 1, "focusHistoryID": 1}))))'
