set fish_greeting ""

set -gx TERM xterm-256color

# themeing
set -g theme_color_scheme terminal-dark
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

# node / nvm
set -U nvm_default_version lts

# config for different env
switch (uname)
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case Darwin
        source (dirname (status --current-filename))/config-macos.fish
end

if test -e (dirname (status --current-filename))/conda.fish
    set -gx CONDA_AUTO_ACTIVATE_BASE false
    source (dirname (status --current-filename))/conda.fish
end

