# My Dotfiles
The collection of my precious dotfiles.

## Installation
To install run this command: 
```
git clone https://github.com/jidbo/.dotfiles ~/; cd ~/.dotfiles; ./install
```
This should install all dependecies and create symlinks to all needed files. The only thing that you have to setup on your own is `nvim`.

## Customization
It is possible to load your own zsh-plugins and other commands you want to execute in the `.zshrc`. To add zsh-plugins add a `plugins` file to `~/.dotfiles/shell/`. An example is provided in `~/.dotfiles/shell/plugins.example`. The same thing applies to commands you want to execute in on shell startup, just add a `localcommands` file with your commands in `~/.dotfiles/shell/`.
