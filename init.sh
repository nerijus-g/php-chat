#!/bin/bash

SESSION_NAME='php'
PROJECT_ROOT="$HOME/projects/php-chat"

tmux new-session -d -s $SESSION_NAME -n root

tmux new-window -t $SESSION_NAME:1 -n emacs -c $PROJECT_ROOT
tmux new-window -t $SESSION_NAME:2 -n php -c $PROJECT_ROOT
tmux new-window -t $SESSION_NAME:3 -n nginx -c $PROJECT_ROOT
tmux new-window -t $SESSION_NAME:4 -n react -c $PROJECT_ROOT
tmux new-window -t $SESSION_NAME:5 -n docker -c $PROJECT_ROOT

sleep 0.2

tmux send-keys -t $SESSION_NAME:0 "cd $PROJECT_ROOT" C-m

tmux send-keys -t $SESSION_NAME:1 "e" C-m
tmux send-keys -t $SESSION_NAME:2 "docker compose exec php php ./server/index.php" C-m
tmux send-keys -t $SESSION_NAME:3 "docker compose exec nginx bash" C-m
tmux send-keys -t $SESSION_NAME:4 "docker compose exec react sh" C-m
tmux send-keys -t $SESSION_NAME:5 "docker compose up" C-m

tmux attach -t $SESSION_NAME:5
