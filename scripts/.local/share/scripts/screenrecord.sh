#!/usr/bin/env bash

filedir=$(xdg-user-dir VIDEOS)
filename="Screenrecord_$(date +%Y%m%d)_$(date +%H%M%S).mkv"
filepath="$filedir/$filename"

echo $filepath

if [[ $1 == "full" ]]; then
  wf-recorder -f $filepath
  wl-copy $filepath
elif [[ $1 == "select" ]]; then
  wl-copy $filepath
  wf-recorder -g "$(slurp)" -f $filepath
fi

notify-send "Screenrecord saved at: $filepath"
