<?php
require_once './libs/Router.php';
require_once './app/controllers/sock-api.controller.php';

// crea el router
$router = new Router();

// defina la tabla de ruteo
$router->addRoute('socks', 'GET', 'SockApiController', 'getAllSocks');
$router->addRoute('socks/:ID', 'GET', 'SockApiController', 'getSock');
$router->addRoute('insertsock', 'POST', 'SockApiController', 'insertSock'); 
$router->addRoute('updatesock/:ID', 'PUT', 'SockApiController', 'updateSock');
//$router->addRoute("auth/token", 'GET', 'authApiController', 'getToken');

// ejecuta la ruta (sea cual sea)
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
 