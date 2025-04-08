#!/usr/bin/bash

THEME_DIR=$HOME/.local/share/themes

theme=$(ls $THEME_DIR | rofi -dmenu -theme ~/.config/rofi/main.rasi)

if [[ -n $theme ]]; then
  bash apply.sh $theme
fi

