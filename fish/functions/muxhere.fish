function muxhere
	if tmux has-session -t (basename (pwd)) &> /dev/null
		if test "screen-256color" = $TERM
			tmux switch-client -t (basename (pwd))
		else
			tmux a -t (basename (pwd))
		end
	else
		if test "screen-256color" = $TERM
			tmux new-session -c (pwd) -s (basename (pwd)) -d
			tmux switch-client -t (basename (pwd))
		else 
			tmux new-session -c (pwd) -s (basename (pwd))
		end
	end
end
