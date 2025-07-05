#!/bin/bash

# Nama output monitor internal dan eksternal
INTERNAL="eDP-1"
EXTERNAL="HDMI-A-1"

# Cek apakah monitor eksternal terhubung
EXTERNAL_CONNECTED=$(hyprctl monitors | grep "$EXTERNAL")

if [ -n "$EXTERNAL_CONNECTED" ]; then
    echo "Monitor eksternal terdeteksi, mematikan $INTERNAL dan mengaktifkan $EXTERNAL..."
    hyprctl dispatch dpms off "$INTERNAL"
    hyprctl dispatch dpms on "$EXTERNAL"
    hyprctl dispatch moveworkspacetomonitor 1 "$EXTERNAL"
    hyprctl dispatch focusmonitor "$EXTERNAL"
else
    echo "Monitor eksternal tidak terdeteksi, mengaktifkan $INTERNAL..."
    hyprctl dispatch dpms off "$EXTERNAL"
    hyprctl dispatch dpms on "$INTERNAL"
    hyprctl dispatch moveworkspacetomonitor 1 "$INTERNAL"
    hyprctl dispatch focusmonitor "$INTERNAL"
fi
