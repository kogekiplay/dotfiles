# Hyprland

这是 kogeki 的 Hyprland + Noctalia 5 配置。当前目标是尽量还原 macOS 外接 5K 屏体验：

- 外接 `27GX-Ultra`：`HDMI-A-1`，`5120x2880@165`，`scale = 2`，10-bit framebuffer，加载 ICC。
- 内置屏：`eDP-1`，`2560x1600@165`，`scale = 1.6`，位于外接屏右侧并顶部对齐，方便从外屏右侧进入内屏。
- Noctalia 负责顶栏、launcher、window switcher、控制中心、锁屏和截图入口；Hyprbars 给普通窗口提供 mac 风格左侧红黄绿标题栏按钮；Hyprspace 提供类似 macOS Mission Control 的工作区总览。
- Noctalia Dock 开在所有输出底部，保留 macOS 风格放大效果、运行应用显示和常用应用固定入口。
- `Super` 按键按 macOS 的 Command 使用，`Alt` 按 Option 使用。
- 登录界面使用 `greetd` + `noctalia-greeter-git`，默认 `kogeki` 和 `Hyprland (uwsm-managed)`，并在 `HDMI-A-1` 与 `eDP-1` 各显示一份登录框。
- `1..9` 保留外屏归属规则，其中 `2` 常驻作为快速回到空桌面的缓冲区；其他空工作区切换过去时再按需创建。

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
| `Ctrl+Up` / `F3` | 打开/关闭 Hyprspace 工作区总览 |
| `Ctrl+Down` | 打开 Noctalia Launcher |
| `Ctrl+1..9` | 切到指定工作区 |
| `Ctrl+Shift+1..9` | 移动窗口到指定工作区 |
| `Super+Shift+3` | 全屏截图 |
| `Super+Shift+4` | 区域截图 |
| `Super+Shift+5` | 窗口截图 |

## 显示与颜色

`icc/27GX-Ultra.icc` 来自 macOS 为这台外接显示器保存的 ColorSync profile。Hyprland 通过 monitor 配置原生加载该 ICC，不再使用 `dispwin` 之类的绕路方案。macOS 导出的 profile 带有 Hyprland 当前不支持的 VCGT formula tag，所以 `render.icc_vcgt_enabled = false`，只使用 ICC profile 本体，避免启动时报 `VCGT formula type is not supported`。

`AQ_DRM_DEVICES=/dev/dri/card2:/dev/dri/card1` 同时记录在 `~/.config/environment.d/70-hyprland-gpu.conf`；远端安装时还会写入 `/etc/environment`，确保 Hyprland 进程启动前就能读到 GPU 顺序。这里让 AMD 内屏 GPU 优先渲染，避免内置 `eDP-1` 在 NVIDIA 优先时因为跨 GPU buffer import 卡住；外接 5K 屏仍通过 monitor 配置和 workspace rule 保持为主输出。

Noctalia greeter 自带 compositor，登录界面用 `WLR_DRM_DEVICES=/dev/dri/card2:/dev/dri/card1` 让 AMD 内屏 GPU 优先，从而同时启用内外屏；Hyprland 会话的 5K@165、ICC、10-bit 和外接屏主输出设置仍以 `hyprland.lua` 为准。

合盖时 `~/.local/bin/hypr-lid-display-mode` 会把 `eDP-1` 禁用，只保留外接 `HDMI-A-1`；开盖时恢复 `eDP-1` 到 `2560x1600@165`、`scale = 1.6`、`position = 2560x0`。如果没有检测到外接屏，脚本不会禁用内屏。脚本还会检查 Noctalia 的 bar layer，缺失时自动重启 Noctalia，避免外屏只剩鼠标。

`cursor.warp_on_change_workspace = false` 用来避免在外屏和内屏逻辑高度不同的布局里，切换工作区时把鼠标自动送进两个输出之间的无显示器空洞。

## 窗口布局

默认布局使用 Hyprland 的 `dwindle`。`smart_split = false` 加上 `force_split = 2` 让新窗口默认向右/向下分割；在常规横向工作区里表现为左右排布，避免从 Hyprspace 把窗口拖到另一个工作区后默认变成上下排布。

## Hyprland 插件

Hyprbars 通过 `hyprpm` 从 `https://github.com/kogekiplay/hyprland-plugins` 安装。这个 fork 在 `hyprbars` 里补了当前 Hyprland git 的 animation manager API 变更；启动时 `hyprland.lua` 会执行 `hyprpm reload`，插件加载后 Hyprland 会自动二次读取配置。

Hyprspace 通过 `hyprpm` 从 `https://github.com/kogekiplay/Hyprspace` 安装。这个 fork 基于 0xl30 的 Lua 配置版本，并补了当前 `hyprland-git` 的 state、monitor、pointer 和 animation API 变更。`hyprland.lua` 会显式设置 `plugin.hyprspace.affect_strut = true`、`hide_real_layers = true`、`keep_real_layer_namespaces = "noctalia-dock"`、`hide_top_layers = true`、`overview_background_color = 0x22000000`、`panel_height = 180`、`panel_border_width = 0`、`workspace_preview_crop_top = 82`、`override_gaps = true`、`gaps_in = 20` 和 `gaps_out = 60`，让 overview 恢复 upstream demo 里“顶部 workspace strip + 下方窗口用大空隙重排”的效果，同时隐藏 Noctalia 顶栏、保留真实底部 dock，并使用整屏轻微压暗的 blur 背景，不再画顶部黑色 panel、顶栏 layer、面板边线或顶部空白；同时设置 `show_empty_workspace = false`，只额外保留常驻的 `2` 号空桌面，避免把所有空数字工作区铺出来。当前快捷键为 `Ctrl+Up` 和 `F3` 打开/关闭全部显示器的 overview，`Ctrl+Down` 保留给 Noctalia Launcher。
