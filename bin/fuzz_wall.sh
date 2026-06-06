#!/bin/sh
# fuzz-wall - A fuzzel-based wallpaper picker
# Supports: swaybg, hyprpaper, feh, nitrogen, xwallpaper, swww

# Find wallpaper directory
find_walldir() {
    for dir in \
        "$HOME/Pictures/wallpapers" \
        "$HOME/Pictures/Wallpapers" \
        "$HOME/Pictures/wallpaper" \
        "$HOME/Pictures/Wallpaper" \
        "$HOME/Wallpapers" \
        "$HOME/wallpapers"; do
        [ -d "$dir" ] && echo "$dir" && return
    done
    echo ""
}

WALLDIR="${FUZZ_WALL_DIR:-$(find_walldir)}"
CACHE_DIR="$HOME/.cache/wal"

# Detect wallpaper setter
detect_setter() {
    if [ -n "$WAYLAND_DISPLAY" ]; then
        for cmd in awww; do
            command -v "$cmd" >/dev/null 2>&1 && echo "$cmd" && return
        done
    fi
    # X11 fallback
    for cmd in feh nitrogen xwallpaper; do
        command -v "$cmd" >/dev/null 2>&1 && echo "$cmd" && return
    done
    echo "none"
}

set_wallpaper() {
    WALL="$1"
    SETTER="$2"
    case "$SETTER" in
        awww)
            awww img "$WALL" --transition-type fade ;;
       *)
            notify-send "fuzz-wall" "No supported wallpaper setter found!" 2>/dev/null
            exit 1
            ;;
    esac
    if command -v wal >/dev/null 2>&1; then
        wal -i "$WALL" -n
        
            cp "$CACHE_DIR/colors" "$CACHE_DIR/colors-foot" 2>/dev/null
            
            if [ -f "$CACHE_DIR/sequences" ]; then
                for tty in /dev/pts/[0-9]*; do
                    printf "%s" "$(< "$CACHE_DIR/sequences")" > "$tty" &
                done
        fi
        
        pkill -USR2 waybar 2>/dev/null
    fi
}

# Checks
if [ -z "$WALLDIR" ] || [ ! -d "$WALLDIR" ]; then
    notify-send "fuzz-wall" "No wallpaper directory found! Set FUZZ_WALL_DIR or create ~/Pictures/wallpapers" 2>/dev/null
    echo "Error: No wallpaper directory found. Set FUZZ_WALL_DIR env var or create ~/Pictures/wallpapers" >&2
    exit 1
fi

command -v fuzzel >/dev/null 2>&1 || { echo "fuzzel not found"; exit 1; }

SETTER=$(detect_setter)

# while true; do
    WALL=$(ls "$WALLDIR" | fuzzel --dmenu --prompt "Wallpaper (ESC to exit) > ")
    [ -z "$WALL" ] && exit 0
    set_wallpaper "$WALLDIR/$WALL" "$SETTER"
# done
