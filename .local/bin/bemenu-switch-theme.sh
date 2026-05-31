#!/usr/bin/bash

THEME_DIR="$HOME/.local/share/themes"

theme=$(ls -p $THEME_DIR | grep -v / | bemenu --prompt "Theme")

bash apply.sh $theme
