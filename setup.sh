#!/bin/bash

commandExists()
{
	  command -v "$1" >/dev/null 2>&1
}

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
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
	echo '[INFO] Vundle is already installed.'
fi
# if atom is installed import configs
if commandExists atom; then
	if commandExists apm; then
		if [ -f ~/.dotfiles/atom/packages.list ]; then
			apm install --packages-file ~/.dotfiles/atom/packages.list
		else
			echo '[INFO] Cannot find packages.txt skipping atom package installation.'
		fi
	else
		echo '[INFO] Atom is installed but the apm command is not available. Cannot import atom packages!'
	fi
else
	echo '[INFO] Skipping atom configuration because it seems like you did not install atom yet!'
fi

# next steps:
# - install Vundle plugins from inside vim :PluginInstall
# - backup config files first before removing them
