<?php
	include_once($_SERVER['DOCUMENT_ROOT'].'/components/db.php');

	class Index {

		public static function get_sub_menu_list ($page_id) {
			$pdo = Db::get_connection();

			$page_id = (int) $page_id;

			$sub_menu_list_pdo = $pdo -> query("SELECT publication_type, publication_type_en 
				FROM dir_publications_types
				INNER JOIN con_pages_publications_types ON dir_publications_types.publication_type_id = con_pages_publications_types.pages_publications_types_publication_type_id
				WHERE con_pages_publications_types.pages_publications_types_page_id = $page_id AND publication_type_en != 'event'");

			$i = 0;
			while ($row = $sub_menu_list_pdo -> fetch()) {
				$sub_menu_list[$i]['publication_type'] = $row['publication_type'];
				$sub_menu_list[$i]['publication_type_en'] = $row['publication_type_en'];
				$i++;
			}
			
			if (!empty($sub_menu_list)) { // защита от пустого массива данных
				return $sub_menu_list;
			};
		}

		public static function get_main_menu_list () {
			$pdo = Db::get_connection();

			$main_menu_list_pdo = $pdo -> query("SELECT page, page_en FROM dir_pages WHERE page_en != 'index'");

			$i = 0;
			while ($row = $main_menu_list_pdo -> fetch()) {
				$main_menu_list[$i]['page'] = $row['page'];
				$main_menu_list[$i]['page_en'] = $row['page_en'];
				$i++;
			}
			
			if (!empty($main_menu_list)) { // защита от пустого массива данных
				return $main_menu_list;
			};
		}
	}

?>