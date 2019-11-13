<?php
// ROUTER

// Анализ запроса, определение контроллер

// Подключение контроллера

// Передача управления контроллеру

class Router {
	private $routes;

	public function __construct(){
		// получаем массив известных маршрутов
		$this->routes = include($_SERVER['DOCUMENT_ROOT'].'/config/routes.php');

	}
	// приатная функция получния урла
	private function get_URI() {
		if (!empty($_SERVER['REQUEST_URI'])){
			return trim($_SERVER['REQUEST_URI'],'/');
		};
	}

	public function run(){
		// Получить строку запроса
		$uri = $this->get_URI();

		// Проверить наличие такого запроса в routes.php
		foreach ($this->routes as $uri_pattern => $path) {

			// Если есть совпадения определить какой controller и action будет обрабатывать запрос
			if (preg_match("#$uri_pattern#", $uri)) {

				$interval_route = preg_replace("#$uri_pattern#", $path, $uri);

				$segments = explode('/', $interval_route);

				$controller_name = array_shift($segments).'Controller';
				$action_name = 'action_'.array_shift($segments);

				$parameters = $segments;

				// Полдключить файл класса контроллера
				$controller_file = $_SERVER['DOCUMENT_ROOT'].'/controllers/'.$controller_name.'.php';
				if (file_exists($controller_file)) {
					include_once($controller_file);
				}
				
				// Создать объект контроллера и вызвать метод, то есть action
				$controller_object = new $controller_name;
				if (!empty($parameters)) {
					$result = call_user_func_array(array($controller_object, $action_name), $parameters);
				} else {
					$result = $controller_object->$action_name();
				}
				

				if ($result != null){
					break;
				}
			}
			
		}
		


	}
};