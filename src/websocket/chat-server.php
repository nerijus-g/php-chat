<?php
require dirname(__DIR__) . '/websocket/vendor/autoload.php';
require 'Chat.php';

use Ratchet\Server\IoServer;
use Ratchet\Http\HttpServer;
use Ratchet\WebSocket\WsServer;

$server = IoServer::factory(
    new HttpServer(
        new WsServer(
            new Chat()
        )
    ),
    8080,
    '0.0.0.0'
);

$server->run();
