# kogeki Arch Dotfiles

这是 kogeki 的 Arch Linux 个人 dotfiles 仓库，使用 [chezmoi](https://www.chezmoi.io/) 管理。当前版本基于 LanRhyme 的 Noctalia 配置改造，面向原生 Arch Linux、Hyprland、用户 `kogeki`、Noctalia 5、Sparkle 独立代理，以及 ASUS TUF Gaming A14 这台机器。

## 管理范围

- Hyprland Wayland 合成器配置，以及 Noctalia shell 集成
- Noctalia 5 TOML 配置和莫兰迪壁纸取色脚本
- Kando 的 Wayland 启动包装和菜单配置
- fcitx5/Rime、GTK/Qt、Alacritty、Starship、Fastfetch、btop、cava、micro、nvim、superfile 等用户配置
- `~/Pictures/WallPapers` 下的壁纸资源

## 不管理的内容

- 代理客户端配置、订阅和运行状态
- GitHub CLI 凭据
- KDE Connect 配对设备
- OpenCode 或其他私有 agent 配置
- CachyOS 专用配置
- 运行时缓存和 Electron 会话状态
- 自动同步或自动推送 dotfiles 的脚本

## 应用配置

```bash
sudo pacman -S --needed chezmoi git
chezmoi init --apply kogekiplay/dotfiles
```

这台电脑上的 chezmoi 源仓库位于：

```bash
~/.local/share/chezmoi
```

## 关键软件包

```bash
sudo pacman -S --needed \
  hyprland-git xdg-desktop-portal-hyprland-git hyprpolkitagent \
  hyprpaper hypridle hyprlock hyprsunset hyprpicker hyprshot \
  fish starship alacritty neovim micro fastfetch btop cava superfile \
  fcitx5 fcitx5-rime fcitx5-configtool fcitx5-gtk fcitx5-qt \
  firefox nautilus cliphist wl-clipboard grim slurp swappy \
  kvantum qt5ct qt6ct papirus-icon-theme ttf-jetbrains-mono-nerd \
  ydotool
```

本机用到的 AUR/第三方包：

```bash
yay -S --needed noctalia-git kando-bin bibata-cursor-theme-bin
```

本机用到的 Arch Linux CN 包：

```bash
sudo pacman -S --needed rime-ice-pinyin-git
```

Sparkle 从上游 release 包单独安装，代理配置和订阅不纳入本仓库管理。

## 系统设置

`ydotool` 需要让 `input` 组可以写入 `/dev/uinput`。首次配置时执行：

```bash
sudo usermod -aG input kogeki
printf '%s\n' 'z /dev/uinput 0660 root input -' | sudo tee /etc/tmpfiles.d/uinput.conf >/dev/null
sudo systemd-tmpfiles --create /etc/tmpfiles.d/uinput.conf
systemctl --user enable --now ydotool.service
```

修改用户组后需要注销并重新登录。

## 说明

- Noctalia 的壁纸 hook 会运行 `~/.config/noctalia/apply-morandi.sh`。
- Hyprland 会原生加载外接 `27GX-Ultra` 的 ICC，并固定为 5K@165、scale 2、10-bit。
- `morandi-gen.py` 会根据当前壁纸更新 fcitx5、starship、fastfetch、alacritty、cava 以及 Qt/KDE 色彩方案。
- Kando 的 Krita 快捷菜单依赖 `ydotool` 用户服务。
