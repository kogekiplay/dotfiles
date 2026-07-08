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
- Appearance uses the Itchy Plasma 6 theme family and its full panel layout, with the theme resources vendored under `~/.local/share/`.
- The mac-style bottom Dock needs the bundled Plasma `Panel.qml` installed with `kde-apply-mac-dock-panel`.
- `Panel 79` is the top bar and `Panel 101` is the bottom Dock. `Panel 78` is a desktop containment from the Itchy layout, not a fake reserve panel.
- KWin script `codexmacdockgap` is disabled and not installed; the stable reserve is handled by the real panel plus patched `Panel.qml`.
- Browser profiles, KDE Connect pairings, proxy state, and crash reports are excluded.

## Post-Apply Commands

```bash
~/.local/bin/kde-apply-mac-dock-panel
```

If user services were changed:

```bash
systemctl --user daemon-reload
```

If input method environment variables do not apply immediately, log out and back in.
