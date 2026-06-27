# Dotfiles

使用 [chezmoi](https://www.chezmoi.io/) 管理的 CachyOS 配置文件。

## 快速开始

```bash
# 安装 chezmoi
paru -S chezmoi

# 应用配置
chezmoi init --apply LanRhyme
```

## 配置说明

### Shell 环境

| 目录 | 说明 |
|------|------|
| `.bashrc` | Bash Shell 配置 |
| `.zshrc` | Zsh Shell 配置 |
| `.config/fish` | Fish Shell 配置，包含 rustup 和 uv 环境变量 |
| `.config/starship.toml` | Starship 终端提示符配置 |
| `.config/environment.d` | systemd 用户环境变量（fcitx5） |

### 终端模拟器

| 目录 | 说明 |
|------|------|
| `.config/alacritty` | Alacritty 终端配置 |
| `.config/kitty` | Kitty 终端配置 |

### 编辑器

| 目录 | 说明 |
|------|------|
| `.config/nvim` | Neovim 编辑器配置 |
| `.config/micro` | Micro 终端编辑器配置 |

### 窗口管理与桌面

| 目录 | 说明 |
|------|------|
| `.config/niri` | Niri 窗口管理器配置 |
| `.config/noctalia` | Noctalia 桌面栏配置（含插件：文件搜索、GitHub Feed、翻译、截图、录屏、笔记、颜文字） |
| `.config/kando` | Kando 环形菜单配置 |
| `.config/kando-flags.conf` | Kando 启动参数 |
| `.config/gtk-3.0` | GTK3 主题与书签 |
| `.config/gtk-4.0` | GTK4 主题配置 |
| `.config/qt5ct` | Qt5 主题配置 |
| `.config/mimeapps.list` | 默认应用关联 |
| `.config/user-dirs.dirs` | 用户目录路径 |
| `.config/user-dirs.locale` | 用户目录语言 |
| `.config/autostart` | 自启动应用 |

### 输入法

| 目录 | 说明 |
|------|------|
| `.config/fcitx5` | Fcitx5 输入法配置（含 Rime 引擎） |

### 系统监控与工具

| 目录 | 说明 |
|------|------|
| `.config/btop` | Btop 系统监控配置 |
| `.config/neofetch` | Neofetch 系统信息展示 |
| `.config/cava` | Cava 音频可视化配置 |
| `.config/superfile` | Superfile 终端文件管理器 |

### 开发工具

| 目录 | 说明 |
|------|------|
| `.config/gh` | GitHub CLI 配置 |
| `.config/uv` | UV Python 包管理器配置 |
| `.config/opencode` | OpenCode 配置 |
| `.config/yay` | Yay AUR 助手配置 |
| `.config/systemd` | systemd 用户服务 |

### 多媒体

| 目录 | 说明 |
|------|------|
| `.config/obs-studio` | OBS 录屏/直播配置 |
| `.config/gpu-screen-recorder` | GPU 屏幕录制配置 |
| `.config/krita` | Krita 绘图软件配置 |
| `.config/kritarc` | Krita 主配置 |
| `.config/kritadisplayrc` | Krita 显示配置 |
| `.config/kritashortcutsrc` | Krita 快捷键配置 |

### 网络工具

| 目录 | 说明 |
|------|------|
| `.config/kdeconnect` | KDE Connect 设备连接配置 |
| `.config/frp` | FRP 内网穿透配置 |
| `.config/cachyos` | CachyOS 系统配置 |

## 常用命令

```bash
chezmoi add ~/.config/newapp    # 添加新配置
chezmoi diff                    # 查看差异
chezmoi apply                   # 应用到系统
chezmoi update                  # 拉取远程更新并应用
chezmoi cd                      # 进入源目录
chezmoi managed | wc -l         # 查看管理文件数量
```

## 自动同步

配置每 2 小时通过 cron 自动同步到 GitHub：

```bash
# 查看 cron 任务
crontab -l

# 手动同步
~/.local/bin/dotfiles-sync.sh
```

## 排除的敏感文件

以下文件已加入 `.chezmoiignore`，不会被提交：

- `kdeconnect/privateKey.pem` - 设备私钥
- `kdeconnect/certificate.pem` - 设备证书
- `noctalia/plugins/github-feed/settings.json` - GitHub Token
- `noctalia/plugins/github-feed/cache/` - GitHub 缓存

## 新机器恢复

```bash
# 1. 安装必要工具
paru -S chezmoi git

# 2. 初始化并应用配置
chezmoi init --apply LanRhyme

# 3. 安装配置中引用的软件
paru -S alacritty kitty fish starship btop cava neofetch \
        fcitx5-rime niri noctalia kando micro nvim superfile \
        obs-studio krita yay gh uv
```

## 仓库结构

```
dotfiles/
├── .chezmoiignore          # 排除规则
├── .bashrc                 # Bash 配置
├── .zshrc                  # Zsh 配置
├── .gitconfig              # Git 配置
└── .config/
    ├── alacritty/          # 终端
    ├── fish/               # Shell
    ├── niri/               # 窗口管理器
    ├── noctalia/           # 桌面栏
    ├── nvim/               # 编辑器
    ├── ...                 # 其他配置
    └── starship.toml       # 提示符
```
