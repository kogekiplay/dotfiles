-- kogeki Hyprland config for ASUS TUF Gaming A14 + 27GX-Ultra.
-- Uses Hyprland 0.55+ Lua config mode.

local terminal = "alacritty"
local browser = "firefox"
local file_manager = "nautilus"
local main_mod = "SUPER"

local function sh(cmd)
    return hl.dsp.exec_cmd(cmd)
end

local function bind(keys, command, opts)
    return hl.bind(keys, sh(command), opts)
end

local configure_hyprspace

local function toggle_overview()
    if configure_hyprspace then
        configure_hyprspace()
    end

    if hl.plugin and hl.plugin.Hyprspace then
        hl.plugin.Hyprspace.overview("toggle_all")
    else
        hl.exec_cmd("hyprpm reload")
    end
end

-- Keep the NVIDIA-driven 5K monitor as the primary output.
-- AQ_DRM_DEVICES starts with AMD so the built-in eDP panel does not freeze.
hl.monitor({
    output = "HDMI-A-1",
    mode = "5120x2880@165",
    position = "0x0",
    scale = 2,
    bitdepth = 10,
    icc = "/home/kogeki/.config/hypr/icc/27GX-Ultra.icc",
})

-- Built-in panel as a secondary display to the right of the 5K monitor.
hl.monitor({
    output = "eDP-1",
    mode = "2560x1600@165",
    position = "2560x0",
    scale = 1.6,
})

for i = 1, 9 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "HDMI-A-1",
        persistent = i == 2,
    })
end

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
    experimental = {
        wp_cm_1_2 = true,
    },

    render = {
        cm_enabled = true,
        icc_vcgt_enabled = false,
    },

    general = {
        gaps_in = 6,
        gaps_out = 10,
        border_size = 2,
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 8,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 10,
            render_power = 3,
            color = 0x55111111,
        },

        blur = {
            enabled = true,
            size = 4,
            passes = 2,
            vibrancy = 0.18,
            new_optimizations = true,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
        smart_split = true,
        smart_resizing = true,
    },

    input = {
        kb_layout = "us",
        follow_mouse = 1,
        mouse_refocus = true,
        sensitivity = 0,
        numlock_by_default = true,

        touchpad = {
            tap_to_click = true,
            natural_scroll = true,
            disable_while_typing = true,
        },
    },

    binds = {
        workspace_back_and_forth = true,
        allow_workspace_cycles = true,
    },

    cursor = {
        warp_on_change_workspace = false,
    },

    misc = {
        background_color = "rgba(00000000)",
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
        focus_on_activate = true,
    },
})

local function configure_hyprbars()
    if not (hl.plugin and hl.plugin.hyprbars) then
        return
    end

    hl.config({
        plugin = {
            hyprbars = {
                enabled = true,
                bar_color = 0xee202124,
                bar_height = 28,
                bar_blur = true,
                bar_title_enabled = true,
                bar_text_size = 11,
                bar_text_weight = 500,
                bar_text_font = "Sans",
                bar_text_align = "center",
                bar_buttons_alignment = "left",
                bar_part_of_window = true,
                bar_precedence_over_border = true,
                bar_padding = 10,
                bar_button_padding = 7,
                icon_on_hover = true,
                inactive_button_color = 0x44ffffff,
                on_double_click = "hyprctl dispatch fullscreen 1",
            },
        },
    })

    hl.plugin.hyprbars.add_button({
        bg_color = "rgb(ff5f57)",
        fg_color = "rgb(2b2b2b)",
        size = 11,
        icon = "x",
        action = "hyprctl dispatch killactive",
    })

    hl.plugin.hyprbars.add_button({
        bg_color = "rgb(ffbd2e)",
        fg_color = "rgb(2b2b2b)",
        size = 11,
        icon = "-",
        action = "hyprctl dispatch movetoworkspacesilent special:minimized",
    })

    hl.plugin.hyprbars.add_button({
        bg_color = "rgb(28c840)",
        fg_color = "rgb(2b2b2b)",
        size = 11,
        icon = "+",
        action = "hyprctl dispatch fullscreen 1",
    })
end

configure_hyprspace = function()
    if not (hl.plugin and hl.plugin.Hyprspace) then
        return
    end

    hl.config({
        plugin = {
            hyprspace = {
                panel_height = 250,
                panel_border_width = 2,
                workspace_margin = 12,
                reserved_area = 0,
                workspace_border_size = 1,
                center_aligned = true,
                on_bottom = false,
                hide_background_layers = false,
                hide_top_layers = false,
                hide_overlay_layers = false,
                draw_active_workspace = true,
                hide_real_layers = true,
                keep_real_layer_namespaces = "noctalia-dock",
                affect_strut = true,
                override_gaps = true,
                gaps_in = 20,
                gaps_out = 60,
                auto_drag = true,
                auto_scroll = true,
                exit_on_click = true,
                switch_on_drop = false,
                exit_on_switch = false,
                show_new_workspace = true,
                show_empty_workspace = false,
                show_special_workspace = false,
                disable_gestures = false,
                reverse_swipe = false,
                swipe_fingers = 3,
                swipe_distance = 300,
                swipe_force_speed = 30,
                swipe_cancel_ratio = 0.5,
                swipe_threshold = 10.0,
                swipe_closed_padding = 10.0,
                workspace_scroll_speed = 2.0,
                disable_blur = false,
                override_anim_speed = 0.0,
                drag_alpha = 0.2,
                exit_key = "Escape",
                click_release_threshold_ms = 200,
            },
        },
    })
end

local function configure_plugins()
    configure_hyprbars()
    configure_hyprspace()
end

local function schedule_configure_plugins()
    hl.timer(configure_plugins, { timeout = 250, type = "oneshot" })
end

configure_plugins()

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.curve("smooth", { type = "spring", mass = 1, stiffness = 85, dampening = 16 })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.5, spring = "smooth" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.2, spring = "smooth", style = "popin 90%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.6, bezier = "linear", style = "popin 90%" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.0, bezier = "quick" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4.0, spring = "smooth", style = "slide" })
hl.animation({ leaf = "layers", enabled = true, speed = 4.0, spring = "smooth" })

hl.layer_rule({
    name = "noctalia-surfaces",
    match = {
        namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
    },
    no_anim = true,
    ignore_alpha = 0.5,
    blur = true,
    blur_popups = true,
})

local function sync_lid_display_mode()
    hl.exec_cmd("/home/kogeki/.local/bin/hypr-lid-display-mode auto")
end

hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE")
    hl.exec_cmd("systemctl --user start hyprpolkitagent.service")
    hl.exec_cmd("hyprpm reload")
    schedule_configure_plugins()
    sync_lid_display_mode()
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("fcitx5 -d")
    hl.exec_cmd("sh -lc 'sleep 1; noctalia msg templates-apply'")
end)

hl.on("config.reloaded", sync_lid_display_mode)
hl.on("monitor.added", sync_lid_display_mode)
hl.on("monitor.removed", sync_lid_display_mode)

-- Mac-style shortcuts. SUPER is treated as Command, ALT as Option.
bind(main_mod .. " + SPACE", "noctalia msg panel-toggle launcher")
bind(main_mod .. " + TAB", "noctalia msg window-switcher")
bind(main_mod .. " + GRAVE", "hyprctl dispatch cyclenext")
bind(main_mod .. " + RETURN", terminal)
bind(main_mod .. " + B", browser)
bind(main_mod .. " + E", file_manager)
bind(main_mod .. " + A", "noctalia msg panel-toggle control-center")
bind(main_mod .. " + COMMA", "noctalia msg settings-toggle")

hl.bind(main_mod .. " + W", hl.dsp.window.close())
hl.bind(main_mod .. " + Q", hl.dsp.window.close())
bind(main_mod .. " + SHIFT + Q", "noctalia msg panel-toggle sessionMenu")
bind(main_mod .. " + CTRL + Q", "noctalia msg session lock")
bind(main_mod .. " + ALT + L", "noctalia msg session lock")

hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(main_mod .. " + CTRL + F", hl.dsp.window.fullscreen())
hl.bind(main_mod .. " + ALT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod .. " + H", hl.dsp.window.move({ workspace = "special:hidden" }))
hl.bind(main_mod .. " + ALT + H", hl.dsp.workspace.toggle_special("hidden"))
hl.bind(main_mod .. " + M", hl.dsp.window.move({ workspace = "special:minimized" }))
hl.bind(main_mod .. " + CTRL + M", hl.dsp.workspace.toggle_special("minimized"))

hl.bind("CTRL + LEFT", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("CTRL + RIGHT", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("CTRL + UP", toggle_overview)
bind("CTRL + DOWN", "noctalia msg panel-toggle launcher")
hl.bind("F3", toggle_overview)

for i = 1, 9 do
    hl.bind("CTRL + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind("CTRL + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind(main_mod .. " + LEFT", hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + UP", hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + DOWN", hl.dsp.focus({ direction = "down" }))

bind(main_mod .. " + SHIFT + LEFT", "hyprctl dispatch movewindow l")
bind(main_mod .. " + SHIFT + RIGHT", "hyprctl dispatch movewindow r")
bind(main_mod .. " + SHIFT + UP", "hyprctl dispatch movewindow u")
bind(main_mod .. " + SHIFT + DOWN", "hyprctl dispatch movewindow d")

hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

bind(main_mod .. " + SHIFT + 3", "noctalia msg screenshot-fullscreen all")
bind(main_mod .. " + SHIFT + 4", "noctalia msg screenshot-region")
bind(main_mod .. " + SHIFT + 5", "hyprshot -m window")

bind("XF86AudioRaiseVolume", "noctalia msg volume-up", { locked = true, repeating = true })
bind("XF86AudioLowerVolume", "noctalia msg volume-down", { locked = true, repeating = true })
bind("XF86AudioMute", "noctalia msg volume-mute", { locked = true })
bind("XF86AudioMicMute", "noctalia msg mic-mute", { locked = true })
bind("XF86AudioNext", "noctalia msg media next", { locked = true })
bind("XF86AudioPrev", "noctalia msg media previous", { locked = true })
bind("XF86AudioPlay", "noctalia msg media toggle", { locked = true })
bind("XF86AudioPause", "noctalia msg media toggle", { locked = true })
bind("XF86MonBrightnessUp", "noctalia msg brightness-up", { locked = true, repeating = true })
bind("XF86MonBrightnessDown", "noctalia msg brightness-down", { locked = true, repeating = true })

bind(main_mod .. " + SHIFT + Z", "/home/kogeki/.local/bin/kando-wayland.sh --menu Krita")
bind("CTRL + ALT + DELETE", "noctalia msg panel-toggle sessionMenu")
bind(main_mod .. " + SHIFT + P", "noctalia msg dpms-off")
bind("switch:on:Lid Switch", "/home/kogeki/.local/bin/hypr-lid-display-mode closed", { locked = true })
bind("switch:off:Lid Switch", "/home/kogeki/.local/bin/hypr-lid-display-mode open", { locked = true })

hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

local ok, noctalia = pcall(function()
    return require("noctalia")
end)
if ok and noctalia and noctalia.apply_theme then
    noctalia.apply_theme()
end
