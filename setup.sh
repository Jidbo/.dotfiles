#!/usr/bin/sh

# remove all current dotfiles
rm -f ~/.zshrc
rm -f ~/.vimrc
rm -rf ~/.vim
rm -f ~/.tmux.conf

# create symbolic links to dotfiles
ln -s ~/.dotfiles/.vimrc ~/.vimrc 
ln -s ~/.dotfiles/.zshrc ~/.zshrc 
ln -s ~/.dotfiles/.vim ~/.vim 
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf


# install vundle
if ! [ -d ~/.vim/bundle/Vundle.vim ]; then
	echo '[INFO] Installing Vundle...'
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
	echo '[INFO] Vundle is already installed.'
fi

# Install vundle Plugins
if commandExists vim; then
	echo '[INFO] Installing vim plugins via Vundle...'
	vim +PluginInstall +qall
else
	echo '[INFO] Vim is not installed, could not install the plugins.'
fi
