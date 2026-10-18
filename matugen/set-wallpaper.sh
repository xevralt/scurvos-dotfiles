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

# Apply Matugen's generated colors to Hyprland borders.
HYPR_COLORS="$HOME/.cache/matugen/hyprland-colors.conf"

ACTIVE_HEX="$(sed -n 's/^\$active_border = #\([[:xdigit:]]\{6\}\)$/\1/p' "$HYPR_COLORS")"
INACTIVE_HEX="$(sed -n 's/^\$inactive_border = #\([[:xdigit:]]\{6\}\)$/\1/p' "$HYPR_COLORS")"

if [[ "$ACTIVE_HEX" =~ ^[[:xdigit:]]{6}$ &&
      "$INACTIVE_HEX" =~ ^[[:xdigit:]]{6}$ ]]; then
    hyprctl keyword general:col.active_border \
        "rgba(${ACTIVE_HEX}ff) rgba(${ACTIVE_HEX}ff) 45deg"

    hyprctl keyword general:col.inactive_border \
        "rgba(${INACTIVE_HEX}aa)"
else
    echo "Warning: Could not read Matugen border colors." >&2
fi

# Restart Waybar to load its updated CSS.
pkill -x waybar 2>/dev/null || true
nohup waybar \
    -c "$HOME/.config/waybar/config.jsonc" \
    -s "$HOME/.config/waybar/style.css" \
    >/tmp/waybar.log 2>&1 &

# Ask running Kitty instances to reload their configuration.
pkill -USR1 -x kitty 2>/dev/null || true

echo "Wallpaper changed and Matugen colors regenerated."
