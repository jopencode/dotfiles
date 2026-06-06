#!/bin/sh

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
CACHE_DIR="$HOME/.cache/wal"

RANDOM_WALL=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f | shuf -n 1)

awww img "$RANDOM_WALL" \
    --transition-type grow \
    --transition-duration 2 \
    --transition-fps 120 \
    --transition-pos 0.8,0.8 &

wal -i "$RANDOM_WALL" -n 

if [ -f "$CACHE_DIR/sequences" ]; then
    for tty in /dev/pts/[0-9]*; do
        printf "%s" "$(< "$CACHE_DIR/sequences")" > "$tty" &
    done
fi

pkill -USR2 waybar
