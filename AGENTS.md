# Agent Notes

This repository is kogeki's Arch Linux dotfiles source for chezmoi

## System

- OS: plain Arch Linux
- Desktop: Hyprland on Wayland with Noctalia 5
- Shell tools: fish, starship, fastfetch
- Input method: fcitx5 with Rime
- Proxy: managed outside this repository, currently via Sparkle

## Rules

- Keep the default branch as `main`
- Do not add proxy subscriptions, proxy client state, GitHub credentials, KDE Connect pairings, or runtime caches
- Use Noctalia TOML, not old Noctalia JSON/plugin snapshots
- If adding theme support for another app, extend `dot_config/noctalia/morandi-gen.py`
- Prefer editable text configs over binary application state
- Apply changes through chezmoi and verify Hyprland/Noctalia configs before claiming they are ready
