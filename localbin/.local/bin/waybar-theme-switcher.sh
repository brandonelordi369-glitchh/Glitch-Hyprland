#!/usr/bin/env bash

THEMES_DIR="$HOME/dotfiles/waybar/.config/waybar-styles"
TARGET_DIR="$HOME/dotfiles/waybar/.config/waybar"

chosen=$(find "$THEMES_DIR" -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | sort \
    | rofi -dmenu -p "Select Waybar Theme")

[ -z "$chosen" ] && exit 0

SELECTED_THEME="$THEMES_DIR/$chosen"

if [ ! -d "$SELECTED_THEME" ]; then
    notify-send "Waybar Theme Switcher" "Invalid theme selected!"
    exit 1
fi

# Stage into tmp first — if this fails, TARGET_DIR is untouched
tmp_dir=$(mktemp -d)
cp -r "$SELECTED_THEME"/. "$tmp_dir"/ || {
    notify-send "Waybar Theme Switcher" "Copy failed, config untouched."
    rm -rf "$tmp_dir"
    exit 1
}

# :? guard — aborts if TARGET_DIR is somehow empty or unset
rm -rf "${TARGET_DIR:?}"/*
mv "$tmp_dir"/* "$TARGET_DIR"/
rmdir "$tmp_dir"

pkill -x waybar
sleep 0.1
waybar &>/dev/null & disown

notify-send "Waybar Theme" "Switched to: $chosen"
