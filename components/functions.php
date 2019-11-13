<?php 

	include_once($_SERVER['DOCUMENT_ROOT'].'/components/db.php');

	class Secondary_functions {

		public static function get_publication_type_array() {
			$pdo = Db::get_connection();

			$publication_type_array_pdo = $pdo->query("SELECT publication_type_id, publication_type, publication_type_en FROM dir_publications_types");

			$i = 0;
			while ($row = $publication_type_array_pdo -> fetch()) {
				$publication_type_array[$i]['publication_type_id'] = $row['publication_type_id'];
				$publication_type_array[$i]['publication_type'] = $row['publication_type'];
				$publication_type_array[$i]['publication_type_en'] = $row['publication_type_en'];
				$i++;
			};

			return $publication_type_array;
		}

		public static function get_publication_type_en($publication_type_id) {
			$pdo = Db::get_connection();

			$publication_type_en_pdo = $pdo->query("SELECT publication_type_en FROM dir_publications_types WHERE publication_type_id = $publication_type_id");

			$publication_type_en = $publication_type_en_pdo -> fetch();

			return $publication_type_en['publication_type_en'];
		}

		public static function get_publication_type_id ($publication_type_en) {
			$pdo = Db::get_connection();

			$publication_type_id_pdo = $pdo -> query("SELECT publication_type_id FROM dir_publications_types WHERE publication_type_en = '$publication_type_en'");

			$publication_type_id = $publication_type_id_pdo -> fetch();

			return $publication_type_id['publication_type_id'];
		}

		public static function get_publication_type_row ($publication_type_en) {
			$pdo = Db::get_connection();

			$publication_type_row_pdo = $pdo->query("SELECT publication_type_id, publication_type, publication_type_en, publication_additional_field_flag, dir_sections.section_en FROM dir_publications_types INNER JOIN dir_sections ON dir_publications_types.publication_type_section_id = dir_sections.section_id WHERE publication_type_en = '$publication_type_en'");

			$publication_type_row = $publication_type_row_pdo -> fetch();

			return $publication_type_row;
		}

		public static function transormations_month($month) {
			switch ($month){
			case 1: $month='января'; break;
			case 2: $month='февраля'; break;
			case 3: $month='марта'; break;
			case 4: $month='апреля'; break;
			case 5: $month='мая'; break;
			case 6: $month='июня'; break;
			case 7: $month='июля'; break;
			case 8: $month='августа'; break;
			case 9: $month='сентября'; break;
			case 10: $month='октября'; break;
			case 11: $month='ноября'; break;
			case 12: $month='декабря'; break;
			}

			return $month;
		}

		public static function translit_text($s) {
		  $s = (string) $s; // преобразуем в строковое значение
		  $s = trim($s); // убираем пробелы в начале и конце строки
		  $s = function_exists('mb_strtolower') ? mb_strtolower($s) : strtolower($s); // переводим строку в нижний регистр (иногда надо задать локаль)
		  $s = strtr($s, array('а'=>'a','б'=>'b','в'=>'v','г'=>'g','д'=>'d','е'=>'e','ё'=>'e','ж'=>'j','з'=>'z','и'=>'i','й'=>'y','к'=>'k','л'=>'l','м'=>'m','н'=>'n','о'=>'o','п'=>'p','р'=>'r','с'=>'s','т'=>'t','у'=>'u','ф'=>'f','х'=>'h','ц'=>'c','ч'=>'ch','ш'=>'sh','щ'=>'shch','ы'=>'y','э'=>'e','ю'=>'yu','я'=>'ya','ъ'=>'','ь'=>'',' '=>'-'));
		  return $s; // возвращаем результат
		}


		public static function get_page_row($page_name_en) {
			$pdo = Db::get_connection();

			$page_row_pdo = $pdo -> query("SELECT page_id, page FROM dir_pages WHERE page_en = '$page_name_en'");

			$page_row = $page_row_pdo -> fetch();

			return $page_row;
		}

		public static function get_now_page_uri() {
			$now_uri_array = trim($_SERVER['REQUEST_URI'],'/');
			$now_uri_array = explode('/', $now_uri_array);
			return $now_uri_array[0];
		}

		public static function get_category_id ($category_en) {
			$pdo = Db::get_connection();

			$category_id_pdo = $pdo -> query("SELECT category_id FROM dir_categories WHERE category_en = '$category_en'");

			$category_id = $category_id_pdo -> fetch();

			return $category_id['category_id'];
		}

		public static function get_category_en ($category_id) {
			$pdo = Db::get_connection();

			$category_id_pdo = $pdo -> query("SELECT category_en FROM dir_categories WHERE category_id = $category_id");

			$category_id = $category_id_pdo -> fetch();

			return $category_id['category_en'];
		}

		public static function trim_text($text) {

			$text_array = explode("\r\n", $text);

			if (count(explode(" ", $text_array[0])) >= 2) {
				$text_array = explode(" ", $text_array[0]);
			} else {
				$text_array = explode(" ", $text_array[1]);
			}

			for ($i = 0; $i < 15; $i++) {
				if ($i == 0) {
					$trim_text = $text_array[$i];
				} else {
					if (!isset($text_array[$i])) {
						return $trim_text;
					} else {
						$trim_text = $trim_text . " " . $text_array[$i];
					}
				}
			}

			$trim_text = $trim_text . " ...";

			return $trim_text;

		}
	}

