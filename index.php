<?php

// FRONT CONTROLLER

// Общие настройки
// Включение отображения ошибок
// Выключить при релизе
ini_set('display_errors',1);
error_reporting(E_ALL);

// Подключение фала маршрутизатора
 include_once($_SERVER['DOCUMENT_ROOT'].'/components/router.php');

// Вызов Router
$router = new Router();
$router->run();