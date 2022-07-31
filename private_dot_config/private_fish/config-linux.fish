if type -q exa
    alias la "exa -a"
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end

fish_add_path -U "/mnt/c/Windows/"
fish_add_path -U "/mnt/c/Windows/System32"
fish_add_path -U "$HOME/.local/bin"
