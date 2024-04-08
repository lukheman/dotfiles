#!/usr/bin/env bash


chosen=$(ls ~/.config/wallpapers/ | rofi -dmenu)

wallpaper_path="$HOME/.config/wallpapers/${chosen}"
echo $wallpaper_path

hyprctl hyprpaper unload all
hyprctl hyprpaper preload "${wallpaper_path}"
hyprctl hyprpaper wallpaper "eDP-1, ${wallpaper_path}"

notify-send "Wallpaper successfully changed"
