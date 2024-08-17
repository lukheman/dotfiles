#!/usr/bin/bash

if [[ $1 == "inc" ]]; then
  xbacklight -inc 10
  notify-send "Brightness: $(xbacklight -get)"
elif [[ $1 == "dec" ]]; then
  xbacklight -dec 10
  notify-send "Brightness: $(xbacklight -get)"
fi
