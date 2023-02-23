# VARIABLES
set -gx EDITOR (type -p nvim)
# set -gx GOPATH "~/.go"

# KEYBINDINGS
# move words
bind -e -a \ew
bind \ew forward-word
bind \cr __fzf_reverse_isearch

if status is-interactive
    # Commands to run in interactive sessions can go here
end
