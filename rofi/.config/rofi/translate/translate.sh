#!/usr/bin/env bash

# translate=$(trans en:id -b "${text}")
text=$(rofi -dmenu -theme ~/.config/rofi/translate/style.rasi -p " Translate:")

if [[ -z $text ]]; then
  text=$(wl-paste --seat=seat0)
fi

translate=$(trans en:id -b "${text}")

if [[ -n $translate ]]; then
  rofi -dmenu \
    -mesg "${translate}" \
    -theme-str 'mainbox {children: [ "message" ];}' \
    -theme ~/.config/rofi/translate/style.rasi
fi
