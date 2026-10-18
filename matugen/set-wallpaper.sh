#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${1:-}" || ! -f "$1" ]]; then
    echo "Usage: set-wallpaper.sh /path/to/wallpaper"
    exit 1
fi

WALLPAPER="$(realpath "$1")"
MATUGEN_CONFIG="$HOME/dotfiles/matugen/config.toml"

# Set wallpaper with a smooth transition.
awww img "$WALLPAPER" \
    --transition-type grow \
    --transition-pos center \
    --transition-duration 3 \
    --transition-fps 60 \
    --transition-step 90

# Generate all application palettes.
matugen image "$WALLPAPER" \
    --config "$MATUGEN_CONFIG" \
    --source-color-index 0

# Reload Hyprland to apply the generated border colors.
hyprctl reload

# Restart Waybar to load the regenerated CSS.
# Reload Waybar's stylesheet without restarting the bar.
pkill -USR2 -x waybar 2>/dev/null || true
# Reload SwayNC styling.
swaync-client -rs 2>/dev/null || true

# Reload generated Kitty colors.
pkill -USR1 -x kitty 2>/dev/null || true

echo "Wallpaper changed; Matugen palettes regenerated."
