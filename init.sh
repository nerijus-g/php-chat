#!/bin/bash

session='php'
PROJECT_ROOT='~/projects/php-chat'


tmux new-session -d -s $session

tmux rename-window -t 0 'root'
tmux new-window -t $session:1 -n 'scripts'
tmux new-window -t $session:2 -n 'emacs'
tmux new-window -t $session:3 -n 'php'
tmux new-window -t $session:4 -n 'nginx'
tmux new-window -t $session:5 -n 'react'
tmux new-window -t $session:6 -n 'docker'

tmux attach -t $session:1

tmux send-keys -t 'root' "cd $PROJECT_ROOT" C-m
tmux send-keys -t 'scripts' "bash $PROJECT_ROOT/scripts/menu.sh $PROJECT_ROOT" C-m
tmux send-keys -t 'emacs' "cd $PROJECT_ROOT" C-m
tmux send-keys -t 'php' "cd $PROJECT_ROOT" C-m
tmux send-keys -t 'nginx' "cd $PROJECT_ROOT" C-m
tmux send-keys -t 'react' "cd $PROJECT_ROOT" C-m
tmux send-keys -t 'docker' "cd $PROJECT_ROOT" C-m
