# Agent Notes

This repository branch is kogeki's Arch Linux KDE Plasma dotfiles source for chezmoi.

## System

- OS: plain Arch Linux
- Desktop: KDE Plasma Wayland with SDDM
- User: `kogeki`
- Shell tools: zsh, Ghostty, fastfetch
- Input method: fcitx5 with Rime and 雾凇拼音
- Proxy: managed outside this repository, currently via Sparkle

## Rules

- Keep the default branch as `main`; KDE work belongs on branch `kde`.
- Do not add proxy subscriptions, proxy client state, GitHub credentials, KDE Connect pairings, browser profiles, crash dumps, or runtime caches.
- Do not reintroduce Hyprland/Noctalia files on this branch unless the user explicitly asks for a hybrid setup.
- Keep system-level Plasma patches under `dot_local/share/kogeki-kde/` and expose explicit install scripts under `dot_local/bin/`.
- Prefer editable text configs over binary application state.
- Apply changes through chezmoi where possible and verify `chezmoi diff` before claiming the branch is ready.
