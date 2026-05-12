#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Call script with project's root directory argument."
    exit 1
fi

PROJECT_ROOT="$1"

PS3="Select action: "
options=(
    "Docker compose"
    "Emacs"
    "PHP bash"
    "Nginx bash"
    "React sh"
    "Quit"
)
while true; do
    select opt in "${options[@]}"
    do
	case $REPLY in
            1)
		cd $PROJECT_ROOT
		if docker compose ps -q php | grep -q .; then
		    docker compose down
		fi
		docker compose up -d
		break
		;;
            2)
		tmux send-keys -t 'emacs' "cd $PROJECT_ROOT && e" C-m
		tmux select-window -t "emacs"
		break
		;;
            3)
		tmux send-keys -t 'php' "cd $PROJECT_ROOT && docker compose exec php bash" C-m
		break
		;;
	    4)
		tmux send-keys -t 'nginx' "cd $PROJECT_ROOT && docker compose exec nginx bash" C-m
		break
		;;
	    5)
		tmux send-keys -t 'react' "cd $PROJECT_ROOT && docker compose exec react sh" C-m
		break
		;;
	    6)
		cd $PROJECT_ROOT
		docker compose down
		break 2
		;;
            *) echo "invalid option $REPLY";;
	esac
    done
done
