<?php

use Phalcon\Di\FactoryDefault;
use Phalcon\Mvc\View;
use Phalcon\Url;
use Phalcon\Mvc\Router;

$di = new FactoryDefault();
define('APP_PATH', realpath('..') . '/app');

/**
 * View service
 */
$di->setShared('view', function () {
    $view = new View();
    $view->setViewsDir(APP_PATH . '/views/');
    return $view;
});

/**
 * URL service
 */
$di->setShared('url', function () {
    $url = new Url();
    $url->setBaseUri('/');
    return $url;
});

/**
 * Router
 */
$di->setShared('router', function () {
    $router = new Router(false);
    $router->removeExtraSlashes(true);
    $router->setDefaultController('chat');
    $router->setDefaultAction('index');
    $router->add('#^/chat/?$#', [
        'controller' => 'chat',
        'action'     => 'index'
    ]);

    return $router;
});

$di->setShared('dispatcher', function () {
    $dispatcher = new \Phalcon\Mvc\Dispatcher();
    $dispatcher->setDefaultNamespace('App\Controllers');
    return $dispatcher;
});

return $di;