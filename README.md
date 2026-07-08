# kogeki Arch KDE Dotfiles

这是 kogeki 的 Arch Linux KDE Plasma 个人 dotfiles 分支，使用 [chezmoi](https://www.chezmoi.io/) 管理。

当前 `kde` 分支面向：

- OS: plain Arch Linux
- User: `kogeki`
- Desktop: KDE Plasma Wayland + SDDM
- Shell/terminal: zsh + Ghostty
- Input method: fcitx5 + Rime + 雾凇拼音
- Browser baseline: Zen Browser, with the browser profile itself excluded
- Proxy: Sparkle, app/config state excluded from this repository

## 管理范围

- KDE Plasma 用户配置：Catppuccin 浅色顶栏、Latte Dock NG、KWin、KRunner、Dolphin、Spectacle、全局快捷键和 KDE 默认值
- Catppuccin KDE resources: Global Theme, Aurorae decoration, color scheme, splash screen, and cursor theme
- Latte Dock NG 布局：`~/.config/latte/Kogeki.layout.latte`
- Ghostty、GTK 3/4、Qt5/Qt6、fontconfig、fcitx5、zsh、bash、mimeapps、systemd user units
- `~/.local/bin/rime-toggle-ascii`
- 可复用壁纸资源

## 不管理的内容

- 代理订阅、代理运行状态、Sparkle 私有配置
- GitHub/1Password/浏览器登录态
- KDE Connect 配对设备
- Zen/Chromium/Firefox profile 和缓存
- `~/.config/*.bak*`、崩溃转储、运行时缓存
- SDDM、pacman、bootloader 等系统级配置

## 应用配置

新机器上：

```bash
sudo pacman -S --needed chezmoi git
chezmoi init --branch kde --apply kogekiplay/dotfiles
```

如果已经 clone 到 chezmoi 源目录：

```bash
cd ~/.local/share/chezmoi
git switch kde
chezmoi apply
```

## KDE Panel Notes

当前底部 Dock 由 Latte Dock NG 管理，不再使用 Plasma 原生底部 panel。仓库里仍保留 `~/.local/share/kogeki-kde/plasma/Panel.qml` 和 `~/.local/bin/kde-apply-mac-dock-panel`，用于回退到 Plasma 原生 Dock 时安装系统级 panel 补丁；常规 Catppuccin + Latte 配置不需要运行它。

## Theme

The active Plasma appearance is official Catppuccin Latte:

- KDE port: `https://github.com/catppuccin/kde`
- Global Theme: `Catppuccin-Latte-Mauve`
- Aurorae window decoration: `CatppuccinLatte-Modern`
- Color scheme: `CatppuccinLatteMauve`
- Plasma Style: `default`
- Cursor theme: `catppuccin-latte-mauve-cursors`
- Icon theme: `WhiteSur-light`
- Dock: Latte Dock NG layout `Kogeki`

Theme assets are vendored under `dot_local/share/`. `Panel 79` is the top bar; the old Plasma bottom panel has been removed in favor of Latte Dock NG.

## 关键软件包

基础 KDE:

```bash
sudo pacman -S --needed \
  plasma-meta sddm sddm-kcm xdg-desktop-portal-kde kde-gtk-config \
  dolphin ark spectacle kcalc kdeconnect \
  bluez bluez-utils power-profiles-daemon
```

用户环境：

```bash
sudo pacman -S --needed \
  zsh ghostty fastfetch btop micro neovim \
  fcitx5 fcitx5-rime fcitx5-configtool fcitx5-gtk fcitx5-qt \
  noto-fonts noto-fonts-cjk noto-fonts-emoji inter-font \
  qt5ct qt6ct kvantum papirus-icon-theme
```

Arch Linux CN / AUR / 第三方包按机器实际情况安装，例如：

```bash
paru -S --needed rime-ice-pinyin-git zen-browser-bin latte-dock-ng whitesur-icon-theme
```

1Password、Sparkle、CodeG、Codex Desktop 等 release 包不由 dotfiles 自动安装。

## 当前 KDE 形态

- 顶栏：KDE appmenu + 系统托盘 + 日期时间
- Dock：Latte Dock NG，布局文件为 `~/.config/latte/Kogeki.layout.latte`
- 壁纸：用户当前 KDE 壁纸，不在主题里强制切换
- 输入法：fcitx5/Rime，中文环境变量由 `environment.d` 管理
- 字体：桌面中文优先 Noto/Harmony 风格，等宽使用 Maple Mono NL NF CN

## 维护约定

- 这个分支不保留 Hyprland/Noctalia 配置。
- 修改 KDE 面板后，优先通过 KDE 自己写入配置，再用 `chezmoi add` 或手工同步回本仓库。
- 不提交浏览器 profile、KDE Connect 配对、代理订阅和缓存。
- 系统文件补丁必须放在 `~/.local/share/kogeki-kde/` 并通过脚本显式安装。
