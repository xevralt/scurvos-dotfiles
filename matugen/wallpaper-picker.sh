
#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
CACHE_DIR="$HOME/.cache/wallpaper-picker"
SET_WALLPAPER="$HOME/dotfiles/matugen/set-wallpaper.sh"

mkdir -p "$CACHE_DIR"

# Build a list of wallpapers and their cached thumbnail icons.
declare -a WALLPAPERS=()
declare -a LABELS=()

while IFS= read -r -d '' file; do
    name="$(basename "$file")"
    thumb="$CACHE_DIR/${name%.*}.png"

    if [[ ! -f "$thumb" || "$file" -nt "$thumb" ]]; then
        magick "$file[0]" \
            -thumbnail '240x135^' \
            -gravity center \
            -extent 240x135 \
            "$thumb"
    fi

    WALLPAPERS+=("$file")
    LABELS+=("$name")
done < <(
    find "$WALLPAPER_DIR" -maxdepth 1 -type f \
        \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) \
        -print0 | sort -z
)

((${#WALLPAPERS[@]} > 0)) || {
    notify-send "Wallpaper picker" "No wallpapers found."
    exit 1
}

# Show wallpaper names with their thumbnail icons.
selected="$(
    for i in "${!WALLPAPERS[@]}"; do
        printf '%s\0icon\x1f%s\n' \
            "${LABELS[$i]}" \
            "$CACHE_DIR/${LABELS[$i]%.*}.png"
    done |
rofi -dmenu -i -show-icons \
    -theme "$HOME/.config/rofi/themes/tokyo-cyber.rasi" \
    -theme-str '
        window {
            width: 85%;
            height: 85%;
        }
        listview {
            columns: 3;
            lines: 2;
            fixed-height: false;
            spacing: 8px;
        }
        element {
            orientation: vertical;
            padding: 5px;
            spacing: 4px;
        }
        element-icon {
            size: 140px;
        }
        element-text {
            horizontal-align: 0.5;
            vertical-align: 0.5;
        }
    ' \
    -p "Wallpapers"
)" || exit 0

[[ -n "$selected" ]] || exit 0

for i in "${!LABELS[@]}"; do
    if [[ "${LABELS[$i]}" == "$selected" ]]; then
        exec "$SET_WALLPAPER" "${WALLPAPERS[$i]}"
    fi
done

