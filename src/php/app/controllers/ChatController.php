<?php

namespace App\Controllers;

use Phalcon\Mvc\Controller;

class ChatController extends Controller
{
    public function indexAction()
    {
        // Loads app/views/chat/index.phtml
        $this->view->setVar("title", "Chat Room");
    }
}