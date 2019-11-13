<?php

	/**
	 * 
	 */
	class Db
	{
		
		public static function get_connection() {
			$host = 'localhost';
			$db   = 'u0701267_kamculture';
			$user = 'u0701267_usadm';
			$pass = 'S4k3L1x8';
			$charset = 'utf8';
			$dsn = "mysql:host=".$host.";dbname=".$db.";charset=".$charset."";
			$opt = [
			    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
			    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
			    PDO::ATTR_EMULATE_PREPARES   => false
			];

			try{
				$pdo = new PDO($dsn, $user, $pass, $opt);
			} catch(PDOException $error_info) {
				die('Не могу подключиться к базе данных');
			}

			return $pdo;
		}
	}

	