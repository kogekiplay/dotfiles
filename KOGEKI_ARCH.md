# kogeki Arch Profile

This fork tracks LanRhyme's desktop style as upstream inspiration, but the active branch is kogeki's `main`

## Target

- User: `kogeki`
- Home: `/home/kogeki`
- OS: plain Arch Linux
- Session: Hyprland + Noctalia 5
- Proxy: Sparkle, managed outside dotfiles

## Important Choices

- Noctalia uses `settings.toml`, not old `settings.json`
- Wallpaper assets apply to `~/Pictures/WallPapers`
- The Morandi hook does not write proxy client state or bootloader artwork
- Runtime state, credentials, paired devices, and generated caches are excluded
- Kando uses `~/.local/bin/kando-wayland.sh` for Wayland-friendly Electron startup

## Post-Apply Commands

```bash
sudo usermod -aG input kogeki
printf '%s\n' 'z /dev/uinput 0660 root input -' | sudo tee /etc/tmpfiles.d/uinput.conf >/dev/null
sudo systemd-tmpfiles --create /etc/tmpfiles.d/uinput.conf
systemctl --user enable --now ydotool.service
```

Log out and back in after changing `input` group membership for `ydotool`
