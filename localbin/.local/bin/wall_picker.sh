#!/usr/bin/env sh
# wall_picker.sh — Rofi grid over ~/Pictures (top-level files only), cached square-cropped thumbnails, applies via awg
# ~~ Inspired by HyDE..

wallDir="$HOME/Pictures"
thumbDir="${XDG_CACHE_HOME:-$HOME/.cache}/wall_thumbs"
rofiConf="$HOME/.config/rofi/wallpaper-selector.rasi"
rofiScale=10
elem_border=16
thumbSize=512
iconSize=12
spacingEm=4
nameMax=20      # max chars shown under each card

mkdir -p "$thumbDir"

#// scale grid to focused monitor using *logical* width
#// (physical width / scale). Works correctly for 1×, 1.25×, 1.5×, 2×, etc.
mon_x_res=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | (.width / .scale) | floor')
[ -z "$mon_x_res" ] || [ "$mon_x_res" -le 0 ] && mon_x_res=1920

elm_width=$(( (iconSize + 8 + 5) * rofiScale ))
max_avail=$(( mon_x_res - (4 * rofiScale) ))
col_count=$(( max_avail / elm_width ))
[ "$col_count" -lt 1 ] && col_count=1

r_scale="configuration {font: \"JetBrainsMono Nerd Font ${rofiScale}\";}"
r_override="window{width:100%;} listview{columns:${col_count};spacing:${spacingEm}em;} element{border-radius:${elem_border}px;orientation:vertical;} element-icon{size:${iconSize}em;border-radius:0em;} element-text{padding:0.5em;}"

#// idxFile: full path per line, in the exact order fed to rofi — lets us
#// recover the real path from rofi's returned index even though the
#// displayed name is truncated
idxFile=$(mktemp)
trap 'rm -f "$idxFile"' EXIT

selIdx=$(find "$wallDir" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.bmp" -o -iname "*.gif" \) | sort | \
    while IFS= read -r img; do
        name="$(basename "$img")"
        hash=$(printf '%s' "$img" | md5sum | cut -d' ' -f1)
        thumb="$thumbDir/$hash.jpg"

        if [ ! -f "$thumb" ] || [ "$img" -nt "$thumb" ]; then
            magick "$img" -auto-orient -thumbnail "${thumbSize}x${thumbSize}^" \
                -gravity center -extent "${thumbSize}x${thumbSize}" \
                -quality 85 "$thumb" 2>/dev/null
        fi

        [ -f "$thumb" ] || continue

        #// truncate to nameMax chars, ellipsis if cut
        if [ "${#name}" -gt "$nameMax" ]; then
            disp="$(printf '%s' "$name" | cut -c1-$((nameMax - 1)))…"
        else
            disp="$name"
        fi

        echo "$img" >> "$idxFile"
        printf '%s\0icon\x1f%s\n' "$disp" "$thumb"
    done | rofi -dmenu -show-icons -format i -theme-str "${r_scale}" -theme-str "${r_override}" -config "${rofiConf}")

[ -z "$selIdx" ] && exit 0

setWall=$(sed -n "$((selIdx + 1))p" "$idxFile")
[ -z "$setWall" ] && exit 1

"$HOME/.local/bin/awg" "$setWall"
