export PATH="$HOME/.local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
    z
)

fpath+=${ZSH_CUSTOM:-${ZSH-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

alias ls="exa"
alias la="exa -a"
alias ll="exa -l -g --icons"
alias lla="ll -a"

alias g="git"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

export EDIOTR="nvim"
export nvm_use_default_version=lts
export GPG_TTY=$(tty)

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export VIRTUAL_ENV_DISABLE_PROMPT=1

# z
autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# vscode integration
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code -- --locate-shell-integration-path zsh)"

# starship
eval "$(starship init zsh)"
