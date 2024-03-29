#!/usr/bin/env bash
# Install packages
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt install tmux fzf curl git jq -y
sudo apt install nvim -y
sudo apt install zsh -y

# install tmux.conf
curl https://raw.githubusercontent.com/tkarube/my-dotfiles/main/tmux.conf -o ~/.tmux.conf

# install vim plug
mkdir -p ~/.config/nvim
/bin/zsh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

curl https://raw.githubusercontent.com/tkarube/my-dotfiles/main/init.vim -o ~/.config/nvim
vim +'PlugInstall --sync' +qa

# install zshrc
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh -s /bin/zsh
logout
