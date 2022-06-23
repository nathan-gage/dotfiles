if type -q exa
    alias la "exa -a"
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
