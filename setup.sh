#!/usr/bin/sh

# remove all current dotfiles
rm -f ~/.zshrc
rm -f ~/.vimrc
rm -rf ~/.vim

# create symbolic links to dotfiles
ln -s ~/.dotfiles/.vimrc ~/.vimrc 
ln -s ~/.dotfiles/.zshrc ~/.zshrc 
ln -s ~/.dotfiles/.vim ~/.vim 

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# next steps:
# - chage oh-my-zsh home directory
# - install Vundle plugins from inside vim :PluginInstall
