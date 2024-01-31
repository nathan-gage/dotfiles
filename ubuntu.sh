#!/bin/sh

echo "Adding PPA for Neovim"
sudo add-apt-repository ppa:neovim-ppa/stable -y -n
sudo add-apt-repository ppa:neovim-ppa/unstable -y -n

echo "Installing Github CLI"
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \

echo "Installing nala"
sudo apt install nala -y

echo "Updating nala"
sudo nala fetch

echo "Updating packages"
sudo nala update && sudo nala upgrade -y

echo "Installing bat ripgrip neovim build-essential gh exa screenfetch mold clang"
sudo nala install bat ripgrep neovim build-essential gh exa screenfetch mold clang -y

echo "neovim config"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Running :PlugInstall"
nvim +PlugInstall +qall

echo "ZSH install"
sudo nala install zsh -y
sudo chsh -s $(which zsh) $(whoami)

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


echo "Installing starship"
curl -sS https://starship.rs/install.sh | sh

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

echo "Installing pyenv"
curl https://pyenv.run | bash

echo "Installing Cargo/rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Copy .cargo, .config, .zshrc to ~!"

