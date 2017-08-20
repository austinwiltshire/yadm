if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi

#create and re-attach session on ssh connections automatically
if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
	exec tmux new-session -A -s ssh_tmux
fi

#if we're local, just run tmux w/out a session
#if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" == "" ]; then
#	exec tmux
#fi
