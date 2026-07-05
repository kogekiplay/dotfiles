# Hyprland

这是 kogeki 的 Hyprland + Noctalia 5 配置。当前目标是尽量还原 macOS 外接 5K 屏体验：

- 外接 `27GX-Ultra`：`HDMI-A-1`，`5120x2880@165`，`scale = 2`，10-bit framebuffer，加载 ICC。
- 内置屏：`eDP-1`，`2560x1600@165`，`scale = 1.6`，位于外接屏右侧。
- Noctalia 负责顶栏、launcher、window switcher、控制中心、锁屏和截图入口。
- `Super` 按键按 macOS 的 Command 使用，`Alt` 按 Option 使用。
- 登录界面使用 `greetd` + `noctalia-greeter-git`，默认 `kogeki` 和 `Hyprland (uwsm-managed)`，并在 `HDMI-A-1` 与 `eDP-1` 各显示一份登录框。

## 常用快捷键

| 快捷键 | 功能 |
| --- | --- |
| `Super+Space` | 打开 Noctalia Launcher |
| `Super+Tab` | 打开窗口切换器 |
| `Super+\`` | 切到下一个窗口 |
| `Super+Return` | 打开 Alacritty |
| `Super+W` / `Super+Q` | 关闭当前窗口 |
| `Super+,` | 打开 Noctalia 设置 |
| `Super+A` | 打开控制中心 |
| `Super+Shift+Q` | 打开会话菜单 |
| `Super+Ctrl+Q` | 锁屏 |
| `Super+F` / `Super+Ctrl+F` | 全屏 |
| `Super+Alt+F` | 切换浮动 |
| `Super+H` | 隐藏到特殊工作区 |
| `Super+Alt+H` | 显示/隐藏 `hidden` 特殊工作区 |
| `Super+M` | 移到 `minimized` 特殊工作区 |
| `Super+Ctrl+M` | 显示/隐藏 `minimized` 特殊工作区 |
| `Ctrl+Left` / `Ctrl+Right` | 切换工作区 |
| `Ctrl+1..9` | 切到指定工作区 |
| `Ctrl+Shift+1..9` | 移动窗口到指定工作区 |
| `Super+Shift+3` | 全屏截图 |
| `Super+Shift+4` | 区域截图 |
| `Super+Shift+5` | 窗口截图 |

## 显示与颜色

`icc/27GX-Ultra.icc` 来自 macOS 为这台外接显示器保存的 ColorSync profile。Hyprland 通过 monitor 配置原生加载该 ICC，不再使用 `dispwin` 之类的绕路方案。

`AQ_DRM_DEVICES` 同时记录在 `~/.config/environment.d/70-hyprland-gpu.conf`；远端安装时还会写入 `/etc/environment`，确保 Hyprland 进程启动前就能读到 GPU 顺序。

Noctalia greeter 自带 compositor，登录界面用 `WLR_DRM_DEVICES=/dev/dri/card2:/dev/dri/card1` 让 AMD 内屏 GPU 优先，从而同时启用内外屏；Hyprland 会话的 5K@165、ICC、10-bit 和 NVIDIA 外接屏优先设置仍以 `hyprland.lua` 与 `AQ_DRM_DEVICES` 为准。
