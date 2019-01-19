# My Dotfiles with an installer

These are just my own config files for various applications like atom, vim and zsh...
It also contains an installation script "setup.sh" to easily apply all of the settings and install some needed tools like
Vundle.

## Usage
Make sure you have these packages installed:
- atom
- vim
- zsh
- oh-my-zsh
- tmux
- tmuxinator
- the_silver_surfer
- powerline-fonts
- fzf
If you want to install and apply all of the settings you just need to run:
```
cd ~
git clone https://github.com/saibotk/.dotfiles
./setup.sh
```

## Atom packages
If you plan on using you own atom package list, you can modify the "atom/packages.list".
The install script will try to find that file and automatically install all packages.

You can export the package list with:
```
apm list --installed --bare > ~/.dotfiles/.atom/packages.list
```

