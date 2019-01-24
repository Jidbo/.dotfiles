#!/bin/bash

commandExists()
{
	command -v "$1" >/dev/null 2>&1
}

backupFilesIfExists()
{
	if [ -f $1 ] || [ -h $1 ] || [ -d $1 ]; then
		printf "Found $1. Backing up to $1.pre-dotfiles\n";
		mv $1 $1.pre-dotfiles;
	fi
}

# remove all current dotfiles
echo '[INFO] Removing current dotfiles...'
backupFilesIfExists ~/.zshrc
backupFilesIfExists ~/.vimrc
backupFilesIfExists ~/.vim
backupFilesIfExists ~/.inputrc
backupFilesIfExists ~/.tmux.conf
backupFilesIfExists ~/.atom

# create symbolic links to dotfiles
echo '[INFO] Creating symlinks to new config files in .dotfiles...'
ln -s ~/.dotfiles/.vimrc ~/.vimrc 
ln -s ~/.dotfiles/.zshrc ~/.zshrc 
ln -s ~/.dotfiles/.vim ~/.vim
ln -s ~/.dotfiles/.inputrc ~/.inputrc
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

# if atom is installed install packages
if commandExists atom; then
	if commandExists apm; then
		if [ -f ~/.dotfiles/.atom/packages.list ]; then
			read -p "Do you want to install your atom packages? (y/n) " answer
			case ${answer:0:1} in
			    y|Y )
					echo '[INFO] Installing atom packages, this can take a while...'
					apm install --packages-file ~/.dotfiles/.atom/packages.list
			    ;;
				* )
			        echo '[INFO] Skipping atom package installation'
				;;
			esac

		else
			echo '[INFO] Cannot find packages.list skipping atom package installation.'
		fi
	else
		echo '[INFO] Atom is installed but the apm command is not available. Cannot import atom packages!'
	fi
else
	echo '[INFO] Skipping atom configuration because it seems like you did not install atom yet!'
fi

echo 'Finished setup...'
echo 'You should restart your terminal to see the changes.'
