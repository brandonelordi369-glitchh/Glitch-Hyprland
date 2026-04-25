#!/usr/bin/env bash

THEMES_DIR="$HOME/dotfiles/waybar/.config/waybar-styles"
TARGET_DIR="$HOME/dotfiles/waybar/.config/waybar"

# FIX: ls -1 word-splits on spaces and misreads [brackets] as globs
# was: themes=$(ls -1 "$THEMES_DIR")
#      chosen=$(echo "$themes" | rofi -dmenu -p "Select Waybar Theme")
chosen=$(find "$THEMES_DIR" -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | sort \
    | rofi -dmenu -p "Select Waybar Theme")

[ -z "$chosen" ] && exit 0

SELECTED_THEME="$THEMES_DIR/$chosen"

if [ ! -d "$SELECTED_THEME" ]; then
    notify-send "Waybar Theme Switcher" "Invalid theme selected!"
    exit 1
fi

# FIX: rm -rf before cp means a failed copy leaves you with nothing
# was: rm -rf "$TARGET_DIR"/*
#      cp -r "$SELECTED_THEME"/* "$TARGET_DIR"/
cp -r "$SELECTED_THEME"/. "$TARGET_DIR"/ || {
    notify-send "Waybar Theme Switcher" "Copy failed, config untouched."
    exit 1
}

# FIX: pkill waybar is substring match; waybar & leaves a zombie
# was: pkill waybar
#      waybar &
pkill -x waybar
# sleep 0.1
waybar &>/dev/null & disown

notify-send "Waybar Theme" "Switched to: $chosen"
