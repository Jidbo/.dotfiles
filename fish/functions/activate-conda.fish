
function activate-conda
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
	# <<< conda initialize <<<
end

