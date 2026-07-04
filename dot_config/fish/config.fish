set -gx XMODIFIERS @im=fcitx
set -gx QT_IM_MODULE fcitx

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.npm-global/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.bun/bin

if status is-interactive
    if type -q fastfetch
        fastfetch
    end

    if type -q starship
        starship init fish | source
    end
end
