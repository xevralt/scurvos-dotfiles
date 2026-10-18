#!/usr/bin/env bash
set -e

if [[ -z "${1:-}" || ! -f "$1" ]]; then
    echo "Usage: set-wallpaper.sh /path/to/wallpaper"
    exit 1
fi

WALLPAPER="$(realpath "$1")"

# Set the wallpaper with a smooth transition.
awww img "$WALLPAPER" \
    --transition-type fade \
    --transition-duration 2

# Generate colors for Rofi, Kitty, and Waybar.
matugen image "$WALLPAPER" \
    --config "$HOME/dotfiles/matugen/config.toml" \
    --source-color-index 0

# Restart Waybar to load its updated CSS.
pkill -x waybar 2>/dev/null || true
nohup waybar \
    -c "$HOME/.config/waybar/config.jsonc" \
    -s "$HOME/.config/waybar/style.css" \
    >/tmp/waybar.log 2>&1 &

# Ask running Kitty instances to reload their configuration.
pkill -USR1 -x kitty 2>/dev/null || true

echo "Wallpaper changed and Matugen colors regenerated."
