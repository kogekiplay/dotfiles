# kogeki Arch Profile

This fork tracks LanRhyme's desktop style as upstream inspiration, but the active branch is kogeki's `main`

## Target

- User: `kogeki`
- Home: `/home/kogeki`
- OS: plain Arch Linux
- Session: niri + Noctalia 5
- Proxy: Sparkle, managed outside dotfiles

## Important Choices

- Noctalia uses `settings.toml`, not old `settings.json`
- Wallpaper assets apply to `~/Pictures/WallPapers`
- The Morandi hook does not write proxy client state or bootloader artwork
- Runtime state, credentials, paired devices, and generated caches are excluded
- Kando uses `~/.local/bin/kando-niri.sh` for Wayland-friendly Electron startup

## Post-Apply Commands

```bash
systemctl --user enable --now ydotool.service
```

Log out and back in after changing `input` group membership for `ydotool`
