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

- KDE Plasma 用户配置：顶栏、浮动 Dock、KWin、KRunner、Dolphin、Spectacle、全局快捷键和 KDE 默认值
- KDE/macOS 风格 Dock 支持文件：`~/.local/share/kogeki-kde/plasma/Panel.qml`
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

## KDE Dock 系统补丁

Plasma 的浮动 Dock “窗口上方留缝、Dock 底部留缝、壁纸连续”效果需要替换 Plasma shell 的系统 `Panel.qml`。chezmoi 只会把补丁文件放到用户目录，不会自动写 `/usr/share`。

应用 dotfiles 后执行：

```bash
~/.local/bin/kde-apply-mac-dock-panel
```

脚本会：

- 备份 `/usr/share/plasma/shells/org.kde.plasma.desktop/contents/views/Panel.qml`
- 安装 `~/.local/share/kogeki-kde/plasma/Panel.qml`
- 重启当前用户的 `plasmashell`

Plasma 更新后如果 Dock 视觉恢复默认，重新运行这个脚本。

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
paru -S --needed rime-ice-pinyin-git zen-browser-bin
```

1Password、Sparkle、CodeG、Codex Desktop 等 release 包不由 dotfiles 自动安装。

## 当前 KDE 形态

- 顶栏：KDE appmenu + 系统托盘 + 日期时间
- Dock：底部居中浮动 Dock，真实 panel reserve 为 80，视觉高度由 patched `Panel.qml` 固定为 64
- 壁纸：KDE Next 默认壁纸，Dock 后方保持桌面壁纸连续
- 输入法：fcitx5/Rime，中文环境变量由 `environment.d` 管理
- 字体：桌面中文优先 Noto/Harmony 风格，等宽使用 Maple Mono NL NF CN

## 维护约定

- 这个分支不保留 Hyprland/Noctalia 配置。
- 修改 KDE 面板后，优先通过 KDE 自己写入配置，再用 `chezmoi add` 或手工同步回本仓库。
- 不提交浏览器 profile、KDE Connect 配对、代理订阅和缓存。
- 系统文件补丁必须放在 `~/.local/share/kogeki-kde/` 并通过脚本显式安装。
