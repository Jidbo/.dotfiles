# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# plugins
plugins=(
	git
	pip
	docker
	command-not-found
	screen
	dirhistory
	gradle
	per-directory-history
	fzf
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Helper Functions
# Returns whether the given command is executable or aliased.
_has() {
	return $( whence $1 >/dev/null )
}

# Set vim as default editor
export EDITOR='vim'

# aliases
alias ll='ls -l'
alias vi='vim'
alias la='ls -la'

if [ -f ~/.dotfiles/.localcommands ]; then
	source ~/.dotfiles/.localcommands
fi

# Tmuxinator autocomplete
if [ -f ~/.bin/tmuxinator.zsh ]; then
    source ~/.bin/tmuxinator.zsh
fi

# fzf + ag configuration
if _has fzf && _has ag; then
	export FZF_CTRL_T_COMMAND='ag --hidden --nocolor --ignore .git -g ""'
fi

export FZF_ALT_C_COMMAND='find . -type d'
   
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
