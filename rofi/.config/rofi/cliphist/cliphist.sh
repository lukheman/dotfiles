#!/usr/bin/env bash

cliphist list | rofi -dmenu -theme ~/.config/rofi/cliphist/style.rasi | cliphist decode | wl-copy
