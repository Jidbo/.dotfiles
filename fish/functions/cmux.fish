function cmux
	if test "screen-256color" = $TERM
		tmux switch-client -t "$(tmux list-session -F '#S' | fzf)"
	else 
		tmux attach -t "$(tmux list-session -F '#S' | fzf)"
	end
end
