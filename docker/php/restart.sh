#!/usr/bin/bash

if [ -f "/scripts/chat-server.pid" ]; then
    PID=$(cat /scripts/chat-server.pid)
    kill "$PID"
fi

php /var/www/html/websocket/chat-server.php >/dev/null 2>&1 &
echo $! > /scripts/chat-server.pid
