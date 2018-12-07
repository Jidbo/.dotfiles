#!/bin/bash

commandExists()
{
	  command -v "$1" >/dev/null 2>&1
}

# remove all current dotfiles
echo '[INFO] Removing current dotfiles...'
rm -f ~/.zshrc
rm -f ~/.vimrc
rm -rf ~/.vim
rm -f ~/.tmux.conf
rm -rf ~/.atom

# create symbolic links to dotfiles
echo '[INFO] Creating symlinks to new config files in .dotfiles...'
ln -s ~/.dotfiles/.vimrc ~/.vimrc 
ln -s ~/.dotfiles/.zshrc ~/.zshrc 
ln -s ~/.dotfiles/.vim ~/.vim 
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.atom ~/.atom

# install vundle
if ! [ -d ~/.vim/bundle/Vundle.vim ]; then
	echo '[INFO] Installing Vundle...'
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
	echo '[INFO] Vundle is already installed.'
fi

if commandExists vim; then
	echo '[INFO] Installing vim plugins via Vundle...'
	vim +PluginInstall +qall
else
	echo '[INFO] Vim is not installed, could not install the plugins.'
fi

# if atom is installed import configs
if commandExists atom; then
	if commandExists apm; then
		if [ -f ~/.dotfiles/.atom/packages.list ]; then
			echo '[INFO] Installing atom packages, this can take a while...'
			apm install --packages-file ~/.dotfiles/.atom/packages.list
		else
			echo '[INFO] Cannot find packages.list skipping atom package installation.'
		fi
	else
		echo '[INFO] Atom is installed but the apm command is not available. Cannot import atom packages!'
	fi
else
	echo '[INFO] Skipping atom configuration because it seems like you did not install atom yet!'
fi

# next steps:
# - backup config files first before removing them
