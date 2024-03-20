#!/usr/bin/env bash
# Install packages
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt install tmux fzf curl git -y

# install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl https://raw.githubusercontent.com/tkarube/myvimrc/main/vimrc -o ~/.vimrc
vim +'PlugInstall --sync' +qa
