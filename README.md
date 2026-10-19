# Kasperia — Hyprland Dotfiles

A personal **Arch Linux + Hyprland** desktop built around a Tokyo Night / cyberpunk aesthetic, dynamic wallpaper-based colors, and a keyboard-driven workflow.

> **Kasperia** — my personal Linux rice and configuration collection.

## ✨ Features

- **Hyprland** — Wayland compositor and window-management workflow.
- **Matugen** — generates color themes from the current wallpaper.
- **Wallpaper transitions** — wallpaper selection and animated transitions with `awww`.
- **Waybar** — custom status bar styled to fit the desktop.
- **Rofi** — application launcher with a custom Tokyo-inspired theme.
- **Kitty** — terminal emulator with wallpaper-aware colors.
- **Starship** — customizable shell prompt.
- **SwayNC** — desktop notification center.
- **Hyprlock and Hypridle** — lock screen and idle behavior.
- **Clipboard history** — `cliphist` integration with a Rofi menu.
- **Screenshot annotation** — region screenshots with `grim`, `slurp`, and `swappy`.
- **Zsh utilities** — shell aliases, including a Matrix-style terminal effect using Unimatrix.

## 🎨 Dynamic theming

Matugen is the central color-generation system. Templates are used to apply wallpaper-derived colors to supported applications, keeping the desktop visually consistent as the wallpaper changes.

Current template targets include:

- Hyprland
- Kitty
- Rofi
- SwayNC
- Waybar

The desktop also uses custom styling and wallpaper-selection scripts to tie the experience together.

## 📂 Repository structure

```text
.
├── hypr/
│   ├── hyprland.lua
│   ├── hypridle.conf
│   └── hyprlock.conf
├── kitty/
│   └── kitty.conf
├── matugen/
│   ├── config.toml
│   ├── set-wallpaper.sh
│   ├── wallpaper-picker.sh
│   └── templates/
├── rofi/
│   └── themes/
│       └── tokyo-cyber.rasi
├── scripts/
│   └── cliphist.sh
├── starship/
│   └── starship.toml
├── swaync/
│   ├── config.json
│   └── style.css
├── waybar/
│   ├── config.jsonc
│   └── style.css
└── zsh/
    └── .zshrc
```

| Directory | Purpose |
|---|---|
| `hypr/` | Hyprland, idle, and lock-screen configuration |
| `kitty/` | Terminal configuration |
| `matugen/` | Color-generation configuration, templates, and wallpaper scripts |
| `rofi/` | Application launcher theme |
| `scripts/` | Helper scripts, including clipboard history |
| `starship/` | Shell prompt configuration |
| `swaync/` | Notification center configuration |
| `waybar/` | Status bar configuration and styling |
| `zsh/` | Zsh configuration and aliases |

## 🛠️ Applications

The setup is designed for Arch Linux and a working Hyprland session.

Core components include:

- Hyprland
- Waybar
- Kitty
- Rofi
- Matugen
- `awww`
- Starship
- SwayNC
- Hyprlock and Hypridle
- `grim`, `slurp`, and `swappy`
- `wl-clipboard` and `cliphist`

Some optional tools and scripts may require additional packages. Install the dependencies required by the components you intend to use.

## 🚀 Setup

### 1. Clone the repository

```bash
git clone git@github.com:xevralt/scurvos-dotfiles.git
cd scurvos-dotfiles
```

Or clone using HTTPS:

```bash
git clone https://github.com/xevralt/scurvos-dotfiles.git
cd scurvos-dotfiles
```

### 2. Review before applying

These are my personal configurations, not a universal installer. Review the files and adapt paths, monitor settings, keybindings, package dependencies, and other machine-specific settings before applying them to another system.

Back up your existing configuration first.

### 3. Install dependencies

Install the required applications using your preferred Arch Linux package-management workflow. Some components, such as `awww` or Matugen, may be installed separately depending on your system.

### 4. Apply configurations

Copy or link the relevant configuration files into their expected locations under `~/.config/`. Review the wallpaper scripts and Matugen configuration before running them.

**Important:** The repository does not currently provide a complete automated installation script. Applying the configurations may require manual setup and dependency installation.

## ⌨️ Workflow

The configuration includes shortcuts and scripts for common desktop tasks, including:

- Launching applications
- Managing and floating windows
- Switching to special workspaces
- Opening the wallpaper picker
- Locking the session
- Toggling notifications
- Opening clipboard history
- Capturing and annotating screenshots

Refer to [`hypr/hyprland.lua`](hypr/hyprland.lua) for the current keybindings.

## 🖥️ Terminal

The terminal environment uses Kitty and Starship, with colors generated through Matugen.

The Zsh configuration also includes a `matrix` alias for a Matrix-style animation using Unimatrix, if installed.

## 📸 Screenshots

Screenshots of the current desktop can be added here as the project evolves.

Suggested captures:

- Full desktop with Waybar
- Kitty with Starship
- Rofi launcher
- Wallpaper transition
- Lock screen

## ⚠️ Notes

- This repository reflects my personal desktop and may change as the rice evolves.
- Some configurations depend on external packages, scripts, and services.
- Review scripts before executing them, especially when adapting the setup to another machine.
- Back up existing configuration files before replacing them.

## 📜 License

No license has been specified yet. Unless a license is added, don't assume that the repository grants permission to redistribute or reuse its contents.

---

Built and customized on Arch Linux with Hyprland. 🐧
