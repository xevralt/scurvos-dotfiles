
# ── Zsh: Hyprland Rice ──

# Interactive shells only
[[ -o interactive ]] || return

# ── History ──
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS

# ── Completion ──
autoload -Uz compinit
compinit

# ── Autosuggestions ──
if [[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# ── Fastfetch ──
if command -v fastfetch >/dev/null 2>&1; then
    fastfetch
fi

# ── Starship prompt ──
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# ── Syntax highlighting (keep last) ──
if [[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
# Matrix rain
alias matrix='$HOME/.local/bin/unimatrix -n -a -s 99 -l o -c green -o'
