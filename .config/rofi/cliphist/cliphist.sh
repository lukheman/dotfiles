#!/usr/bin/env bash

cliphist list | rofi -dmenu -theme ~/.config/rofi/cliphist/style.rasi -p ""| cliphist decode | wl-copy

notify-send " Copied to clipboard"
