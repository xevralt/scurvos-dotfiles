
#!/usr/bin/env bash
set -u

THEME="$HOME/.config/rofi/themes/tokyo-cyber.rasi"
RUNTIME="${XDG_RUNTIME_DIR:-/tmp}"

case "${1:-menu}" in
    menu)
        selection="$(cliphist list | rofi -dmenu -i \
            -p "Clipboard" \
            -theme "$THEME")" || exit 0

        [[ -n "$selection" ]] || exit 0

        printf '%s\n' "$selection" | cliphist decode | wl-copy
        ;;
    watch-text)
        exec flock -n "$RUNTIME/kasperia-cliphist-text.lock" \
            wl-paste --type text --watch cliphist store
        ;;
    watch-image)
        exec flock -n "$RUNTIME/kasperia-cliphist-image.lock" \
            wl-paste --type image --watch cliphist store
        ;;
    *)
        echo "Usage: $0 {menu|watch-text|watch-image}" >&2
        exit 2
        ;;
esac

