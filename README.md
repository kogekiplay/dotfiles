# Dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## Components

| Category | Config |
|----------|--------|
| Shell | bash, zsh, fish |
| Terminal | alacritty, kitty |
| Editor | nvim, micro |
| Window Manager | niri |
| Bar/Menu | noctalia, kando |
| Input Method | fcitx5 |
| Theme | gtk3/4, Kvantum, qt5ct |
| Prompt | starship |
| File Manager | superfile, nautilus |
| Tools | btop, cava, neofetch |
| Dev | gh, uv, opencode |
| Recording | obs-studio, gpu-screen-recorder |
| Drawing | krita |
| Network | frp, kdeconnect |
| AUR Helper | yay |

## Quick Start

```bash
# Install chezmoi
paru -S chezmoi

# Apply dotfiles
chezmoi init --apply LanRhyme
```

## Usage

```bash
chezmoi add ~/.config/newapp    # Add new config
chezmoi diff                    # View changes
chezmoi apply                   # Apply to system
chezmoi update                  # Pull & apply from remote
```

## Auto Sync

Configs auto-sync every 2 hours via cron (`~/.local/bin/dotfiles-sync.sh`).
