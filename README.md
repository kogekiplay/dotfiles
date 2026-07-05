# kogeki Arch Dotfiles

Personal Arch Linux dotfiles managed by [chezmoi](https://www.chezmoi.io/). This fork is based on LanRhyme's niri + Noctalia setup, then trimmed for plain Arch Linux, `kogeki`, Noctalia 5, Sparkle-managed proxy, and the ASUS TUF Gaming A14 install.

## Scope

- niri Wayland compositor config with Noctalia shell integration
- Noctalia 5 TOML config and Morandi wallpaper color hook
- Kando Wayland wrapper and menu config
- fcitx5/Rime, GTK/Qt, Alacritty, Starship, Fastfetch, btop, cava, micro, nvim, and superfile settings
- Wallpaper assets under `~/Pictures/WallPapers`
- Display ICC profile assets under `~/.local/share/color/icc`

## Excluded

- Proxy client configuration and subscriptions
- GitHub CLI credentials
- KDE Connect paired devices
- OpenCode/private agent configs
- CachyOS-specific configs
- Runtime caches and Electron session state
- Auto-push dotfiles sync scripts

## Apply

```bash
sudo pacman -S --needed chezmoi git
chezmoi init --apply kogekiplay/dotfiles
```

For this laptop, the source lives at:

```bash
~/.local/share/chezmoi
```

## Key Packages

```bash
sudo pacman -S --needed \
  niri xwayland-satellite polkit-gnome \
  colord argyllcms \
  fish starship alacritty neovim micro fastfetch btop cava superfile \
  fcitx5 fcitx5-rime fcitx5-configtool fcitx5-gtk fcitx5-qt \
  firefox nautilus cliphist wl-clipboard grim slurp swappy \
  kvantum qt5ct qt6ct papirus-icon-theme ttf-jetbrains-mono-nerd \
  ydotool
```

AUR/third-party packages used on this install:

```bash
yay -S --needed noctalia-git kando-bin bibata-cursor-theme-bin
```

Arch Linux CN packages used on this install:

```bash
sudo pacman -S --needed rime-ice-pinyin-git
```

Sparkle is installed separately from its upstream release package and is intentionally not managed here.

## System Setup

`ydotool` needs `/dev/uinput` writable by the `input` group. Configure it once:

```bash
sudo usermod -aG input kogeki
printf '%s\n' 'z /dev/uinput 0660 root input -' | sudo tee /etc/tmpfiles.d/uinput.conf >/dev/null
sudo systemd-tmpfiles --create /etc/tmpfiles.d/uinput.conf
systemctl --user enable --now ydotool.service
```

Log out and back in after changing group membership.

## Notes

- Noctalia's wallpaper hook runs `~/.config/noctalia/apply-morandi.sh`.
- `morandi-gen.py` updates colors for niri, fcitx5, starship, fastfetch, alacritty, cava, and Qt/KDE color schemes.
- Kando's Krita key menus use the `ydotool` user service.
- `~/.local/share/color/icc/27GX-Ultra.icc` is the ColorSync profile copied from macOS for the external 27GX-Ultra display. To follow the Arch Wiki colord layout after applying dotfiles, copy it system-wide with `sudo install -D -m 0644 ~/.local/share/color/icc/27GX-Ultra.icc /usr/share/color/icc/colord/27GX-Ultra.icc && sudo systemctl restart colord.service`.
- niri 26.04 does not expose a compositor ICC output-profile setting or a colord display device. `~/.local/bin/load-27gx-icc.sh` uses ArgyllCMS `dispwin -d 1 -I` at niri startup to install the profile into the X11-compatible display profile location and load its VCGT calibration into the external display LUT.
