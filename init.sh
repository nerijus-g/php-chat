#!/bin/bash

SESSION_NAME='php'
PROJECT_ROOT="$HOME/projects/php-chat"

tmux new-session -d -s $SESSION_NAME -n root

tmux new-window -t $SESSION_NAME:1 -n scripts
tmux new-window -t $SESSION_NAME:2 -n emacs
tmux new-window -t $SESSION_NAME:3 -n php
tmux new-window -t $SESSION_NAME:4 -n nginx
tmux new-window -t $SESSION_NAME:5 -n react
tmux new-window -t $SESSION_NAME:6 -n docker

sleep 0.2

tmux send-keys -t $SESSION_NAME:0 "cd $PROJECT_ROOT" C-m
tmux send-keys -t $SESSION_NAME:1 "bash $PROJECT_ROOT/scripts/menu.sh $PROJECT_ROOT" C-m
tmux send-keys -t $SESSION_NAME:2 "cd $PROJECT_ROOT" C-m
tmux send-keys -t $SESSION_NAME:3 "cd $PROJECT_ROOT" C-m
tmux send-keys -t $SESSION_NAME:4 "cd $PROJECT_ROOT" C-m
tmux send-keys -t $SESSION_NAME:5 "cd $PROJECT_ROOT" C-m
tmux send-keys -t $SESSION_NAME:6 "cd $PROJECT_ROOT" C-m

tmux attach -t $SESSION_NAME:1
