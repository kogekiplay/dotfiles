# kogeki Arch Dotfiles

Personal Arch Linux dotfiles managed by [chezmoi](https://www.chezmoi.io/). This fork is based on LanRhyme's niri + Noctalia setup, then trimmed for plain Arch Linux, `kogeki`, Noctalia 5, Sparkle-managed proxy, and the ASUS TUF Gaming A14 install.

## Scope

- niri Wayland compositor config with Noctalia shell integration
- Noctalia 5 TOML config and Morandi wallpaper color hook
- Kando Wayland wrapper and menu config
- fcitx5/Rime, GTK/Qt, Alacritty, Starship, Fastfetch, btop, cava, micro, nvim, and superfile settings
- Wallpaper assets under `~/Pictures/WallPapers`

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

Sparkle is installed separately from its upstream release package and is intentionally not managed here.

## Notes

- Noctalia's wallpaper hook runs `~/.config/noctalia/apply-morandi.sh`.
- `morandi-gen.py` updates colors for niri, fcitx5, starship, fastfetch, alacritty, cava, and Qt/KDE color schemes.
- `ydotool` needs the user in the `input` group and the user service enabled for Kando's Krita key menus.
