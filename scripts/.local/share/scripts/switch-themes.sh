#!/usr/bin/bash


themes=$(echo -e "onedark\nsolarized" | rofi -dmenu)

bash "$HOME/dotfiles/themes/$themes/apply.sh"
