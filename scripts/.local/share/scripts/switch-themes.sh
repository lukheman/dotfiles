#!/usr/bin/bash


themes=$(echo -e "onedark\nsolarized" | rofi -dmenu -theme ~/.config/rofi/main.rasi)

bash "$HOME/dotfiles/themes/$themes/apply.sh"
