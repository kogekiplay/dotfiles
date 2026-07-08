# kogeki Arch KDE Profile

This branch tracks kogeki's KDE Plasma desktop profile.

## Target

- User: `kogeki`
- Home: `/home/kogeki`
- OS: plain Arch Linux
- Session: KDE Plasma Wayland
- Login: SDDM, greeter backend on Wayland
- Proxy: Sparkle, managed outside dotfiles
- Remote desktop/VNC state: not managed

## Important Choices

- Plasma panel layout is managed in `~/.config/plasma-org.kde.plasma.desktop-appletsrc` and `~/.config/plasmashellrc`.
- Appearance uses the official Catppuccin KDE Latte theme, with Catppuccin resources vendored under `~/.local/share/`.
- The bottom Dock is Latte Dock NG using the `Kogeki` layout and autostart desktop file.
- `Panel 79` is the top bar. The old Plasma bottom panel has been removed, and `Panel 78` is the desktop containment.
- KWin script `codexmacdockgap` is disabled and not installed.
- Browser profiles, KDE Connect pairings, proxy state, and crash reports are excluded.

## Post-Apply Commands

If user services were changed:

```bash
systemctl --user daemon-reload
```

If input method environment variables do not apply immediately, log out and back in.
