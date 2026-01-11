#!/bin/sh

# Get the screenshot directory
dir="$HOME/Pictures/Screenshots"

# Ensure the directory exists
mkdir -p "$dir"

# Generate filename with timestamp
filename="screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"

# Check arguments and take a screenshot
if [ "$1" = "full" ]; then
    grim "$dir/$filename"
elif [ "$1" = "select" ]; then
    grim -g "$(slurp)" "$dir/$filename"
elif [ "$1" = "clipboard" ]; then
    grim -g "$(slurp)" - | wl-copy
fi
