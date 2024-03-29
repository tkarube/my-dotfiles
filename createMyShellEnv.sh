#!/usr/bin/env bash

# Install packages
sudo apt update

# stop temporary asking for restart services
sudo apt purge needrestart -y

sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt install tmux fzf curl git jq -y
sudo apt install zsh -y

sudo apt install needrestart -y

sudo snap install nvim --classic

# install tmux.conf
curl https://raw.githubusercontent.com/tkarube/my-dotfiles/main/tmux.conf -o ~/.tmux.conf

# install vim plug
mkdir -p ~/.config/nvim
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl https://raw.githubusercontent.com/tkarube/my-dotfiles/main/init.vim -o ~/.config/nvim/init.vim
vim +'PlugInstall --sync' +qa

# install zshrc
# Oh My Zsh
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

curl https://raw.githubusercontent.com/tkarube/my-dotfiles/main/zshrc -o ~/.zshrc

chsh -s /bin/zsh
