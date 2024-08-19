#!/usr/bin/bash

theme=$(ls $HOME/dotfiles/themes | rofi -dmenu -theme ~/.config/rofi/main.rasi)

if [[ -n $theme ]]; then
  bash "$HOME/dotfiles/themes/$theme/apply.sh"
fi

