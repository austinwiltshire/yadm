if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi

if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
	tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi
