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

starship init fish | source

git-town completions fish | source

abbr -a -- gst 'git status' # imported from a universal variable, see `help abbr`
abbr -a -- gco 'git checkout' # imported from a universal variable, see `help abbr`
abbr -a -- ip 'ip -c' # imported from a universal variable, see `help abbr`
abbr -a -- mux tmuxinator # imported from a universal variable, see `help abbr`
abbr -a -- ga 'git add -A'
abbr -a --set-cursor -- gcm "git commit -m '%'"
abbr -a --set-cursor -- gca "git add -A && git commit"
abbr -a --set-cursor -- gcam "git add -A && git commit -m '%'"
abbr -a -- gp "git push"
