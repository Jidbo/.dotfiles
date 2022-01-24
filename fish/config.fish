# VARIABLES
set EDITOR vim
set TERM screen-256color

# KEYBINDINGS
# move words
bind -e -a \ew
bind \ew forward-word
bind \cr __fzf_reverse_isearch

if status is-interactive
    # Commands to run in interactive sessions can go here
end
