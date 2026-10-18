#!/usr/bin/env bash
set -e

if [[ -z "${1:-}" || ! -f "$1" ]]; then
    echo "Usage: set-wallpaper.sh /path/to/wallpaper"
    exit 1
fi

WALLPAPER="$(realpath "$1")"

# Change wallpaper with a smooth transition.
awww img "$WALLPAPER" \
    --transition-type fade \
    --transition-duration 2

# Regenerate the Matugen palette from this wallpaper.
matugen image "$WALLPAPER" \
    --config "$HOME/dotfiles/matugen/config.toml" \
    --source-color-index 0

echo "Wallpaper changed and Matugen colors regenerated.
