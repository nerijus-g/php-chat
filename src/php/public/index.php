<?php

use Phalcon\Mvc\Application;
use Phalcon\Di\FactoryDefault;
use Phalcon\Mvc\View;
use Phalcon\Url;
use Phalcon\Mvc\Router;

require_once __DIR__ . '/../vendor/autoload.php';

$di = require '../config/services.php';


$app = new Application($di);

echo $app->handle($_SERVER['REQUEST_URI'])->getContent();
