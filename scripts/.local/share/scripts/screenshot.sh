#!/usr/bin/env bash

# filedir="$(xdg-user-dir PICTURES)/Screenshots"
filedir="$HOME/Pictures/Screenshots"
filename="Screenshot_$(date +%Y%m%d)_$(date +%H%M%S).png"
filepath="$filedir/$filename"


# if [[ $1 == "full" ]]; then
#   grim -l 1 $filepath
#   swappy -f $filepath
#   wl-copy $filepath
# elif [[ $1 == "select" ]]; then
#   grim -l 1 -g "$(slurp)" $filepath
#   swappy -f $filepath
#   wl-copy $filepath
# fi

if [[ $1 == "full" ]]; then
  scrot $filepath
  xclip -selection clipboard -t image/png -i $filepath
elif [[ $1 == "select" ]]; then
  # grim -l 1 -g "$(slurp)" $filepath
  scrot $filepath
fi

notify-send "Screenshot: $filepath"
