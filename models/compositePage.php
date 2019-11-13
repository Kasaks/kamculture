<?php
	
	include_once($_SERVER['DOCUMENT_ROOT'].'/components/db.php');
	
	//////////////////////////////////////////////////////////////////////////////////
	// Класс описывает методы, которые запрашивают данные для составных страниц     //
	// то есть станиц состоящих из шапки, неопреденного количества секций и подвала //
	// структура таких станиц определяется в таблице con_pages_sections_post_types  //
	//////////////////////////////////////////////////////////////////////////////////
	class CompositePage {

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Функция подготавливает данные для последующих функций                                                          //
		// а именно вытаскивает из базы последовательность секций для определенной страницы                               //
		// и все сопутствующие данные - псевдоним секции, указатель какие данные помещаются в секцию, лимит данных и т.д. // 
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static function get_page_sections_list($page_name) {
			$pdo = Db::get_connection();

			$page_id_array = $pdo->query("SELECT page_id FROM dir_pages WHERE page_en = '$page_name'");

			$page_id = $page_id_array -> fetch(); 
			$page_id = (int) $page_id['page_id'];

			$page_sections_pdo = $pdo -> query("SELECT pages_sections_publications_types_section_name, pages_sections_publications_types_additional_block_id, dir_sections.section_en, pages_sections_publications_types_publication_type_id, pages_sections_publications_types_publication_limit, pages_sections_publications_types_category_id
				FROM con_pages_sections_publications_types 
				INNER JOIN dir_sections ON con_pages_sections_publications_types.pages_sections_publications_types_section_id = dir_sections.section_id
				WHERE pages_sections_publications_types_page_id = $page_id ORDER BY pages_sections_publications_types_serial_number ASC");

			$i = 0;
			while ($row = $page_sections_pdo -> fetch()) {
				$page_sections_list[$i]['section_name'] = $row['pages_sections_publications_types_section_name']; // заголок секции если таковой нужен
				$page_sections_list[$i]['section_additional_block_id'] = $row['pages_sections_publications_types_additional_block_id']; // id дополнительного блока, для определения какие данные вытаскивать и какой блок подставлять
				$page_sections_list[$i]['section_publication_limit'] = $row['pages_sections_publications_types_publication_limit']; // лимит публикация для определенного блока
				$page_sections_list[$i]['section_en'] = $row['section_en']; // имя секции по которому идет обращение к файлу с разметкой блока
				$page_sections_list[$i]['section_publication_type_id'] = $row['pages_sections_publications_types_publication_type_id']; // тип публикации нужен для ссылки
				$page_sections_list[$i]['section_category_id'] = $row['pages_sections_publications_types_category_id']; // тип публикации нужен для ссылки
				$i++;
			};

			if (!empty($page_sections_list)) { // защита, если в базе по такому запросу пусто не возникнет фатальной ошибки
				return $page_sections_list;
			};
		}

		//////////////////////////////////////////////////////////////////////////////////
		// Функция вытаскивает записи для соответствуюзего блока с определенным лимитом //
		//////////////////////////////////////////////////////////////////////////////////
		public static function get_section_content($section_publication_type_id, $section_publication_limit, $section_category_id) {
			$pdo = Db::get_connection();

			if ($section_category_id != null) {
				$section_content_pdo = $pdo -> query("SELECT publication_id, publication_date, dir_publications_types.publication_type_en, publication_title, publication_text, dir_images.image
					FROM publications 
					INNER JOIN con_publications_images ON publications.publication_id = con_publications_images.publications_images_publication_id 
					INNER JOIN dir_publications_types ON publications.publication_type_id = dir_publications_types.publication_type_id 
					INNER JOIN dir_images ON con_publications_images.publications_images_image_id = dir_images.image_id AND con_publications_images.publications_images_main_image_flag = 1 
					WHERE publications.publication_type_id = $section_publication_type_id AND publications.publication_category_id = $section_category_id ORDER BY publication_date DESC LIMIT $section_publication_limit");
			} else {
				$section_content_pdo = $pdo -> query("SELECT publication_id, publication_date, dir_publications_types.publication_type_en, publication_title, publication_text, dir_images.image
					FROM publications 
					INNER JOIN con_publications_images ON publications.publication_id = con_publications_images.publications_images_publication_id 
					INNER JOIN dir_publications_types ON publications.publication_type_id = dir_publications_types.publication_type_id 
					INNER JOIN dir_images ON con_publications_images.publications_images_image_id = dir_images.image_id AND con_publications_images.publications_images_main_image_flag = 1 
					WHERE publications.publication_type_id = $section_publication_type_id ORDER BY publication_date DESC LIMIT $section_publication_limit");
			}
			
			$i = 0;
			while ($row = $section_content_pdo -> fetch()){
				$section_content[$i]['publication_id'] = $row['publication_id']; // id записи нужна для ссылки на пубикацию
				$section_content[$i]['publication_note'] = $row['publication_date']; // дата нужна для новостных записей
				$section_content[$i]['publication_type_en'] = $row['publication_type_en']; // тип публикации нужен для ссылки
				$section_content[$i]['publication_title'] = $row['publication_title']; // хаголовок нужен для ссылки, для изображения (alt) и для непосредсвтенно заголовка
				$section_content[$i]['publication_text'] = $row['publication_text']; // текст нужен в некоторых блоках в сокращенном виде или вообще не нужен
				$section_content[$i]['publication_image'] = $row['image']; // по имени картинки идет обращение к файлу самой картинки
				$i++;
			}

			if (!empty($section_content)) { // защита, если в базе по такому запросу пусто не возникнет фатальной ошибки
				return $section_content;
			};
		}

		///////////////////////////////////////////////////////////////////////////////////
		// Функция вытаскивает события для соответствуюзего блока с определенным лимитом //
		///////////////////////////////////////////////////////////////////////////////////
		public static function get_section_content_events($section_publication_limit, $section_category_id) {
			$pdo = Db::get_connection();
			if ($section_category_id != Null) {

				$section_content_pdo = $pdo -> query("SELECT publications.publication_id, publications.publication_title, publications.publication_text, dir_geofences.geofence, dir_categories.category, event_age_limit, dir_visiting_mode.visit_mode, event_date_start, event_date_end, dir_images.image, event_cost
					FROM fil_events
					INNER JOIN publications ON fil_events.publication_id = publications.publication_id
					INNER JOIN con_publications_images ON publications.publication_id = con_publications_images.publications_images_publication_id
					INNER JOIN dir_images ON con_publications_images.publications_images_image_id = dir_images.image_id
					INNER JOIN dir_categories ON publications.publication_category_id = dir_categories.category_id
					INNER JOIN dir_geofences ON fil_events.event_geofence_id = dir_geofences.geofence_id
					INNER JOIN dir_visiting_mode ON fil_events.event_visit_mode_id = dir_visiting_mode.visit_mode_id
					WHERE publications.publication_category_id = $section_category_id
					ORDER BY publication_date DESC LIMIT $section_publication_limit");

			} else {
				$section_content_pdo = $pdo -> query("SELECT publications.publication_id, publications.publication_title, publications.publication_text, dir_geofences.geofence, dir_categories.category, event_age_limit, dir_visiting_mode.visit_mode, event_date_start, event_date_end, dir_images.image, event_cost
					FROM fil_events
					INNER JOIN publications ON fil_events.publication_id = publications.publication_id
					INNER JOIN con_publications_images ON publications.publication_id = con_publications_images.publications_images_publication_id
					INNER JOIN dir_images ON con_publications_images.publications_images_image_id = dir_images.image_id
					INNER JOIN dir_categories ON publications.publication_category_id = dir_categories.category_id
					INNER JOIN dir_geofences ON fil_events.event_geofence_id = dir_geofences.geofence_id
					INNER JOIN dir_visiting_mode ON fil_events.event_visit_mode_id = dir_visiting_mode.visit_mode_id
					ORDER BY publication_date DESC LIMIT $section_publication_limit");
			}

			date_default_timezone_set('Pacific/Fiji'); // Стандартный часовой пояс Камчатки на 2019 год

			$i = 0;
			while ($row = $section_content_pdo -> fetch()) {
				$section_content[$i]['publication_id'] = $row['publication_id']; // для ссылки
				$section_content[$i]['publication_title'] = $row['publication_title']; // ссылка заголовок альт картинки
				$section_content[$i]['publication_text'] = $row['publication_text'];
				$section_content[$i]['publication_image'] = $row['image']; // ссылка на подключаемый файл картинки
				$section_content[$i]['event_geofence'] = $row['geofence']; // геозона в примечании карточки блока
				$section_content[$i]['event_category'] = $row['category']; // для отметки на миниатюре
				$section_content[$i]['event_age_limit'] = $row['event_age_limit']; // для отметки на миниатюре
				$section_content[$i]['event_visit_mode'] = $row['visit_mode'];
				$section_content[$i]['event_cost'] = $row['event_cost'];

				// следующий блок нежун для определения того началось событие или нет
				$date_now = date('Y-m-d H:i:s');
				$date_event_start =  $row['event_date_start'];
				$date_event_end = $row['event_date_end'];

				if ($date_event_start > $date_now && $date_event_end > $date_now) { // если не началось
					$section_content[$i]['event_date'] = 'С '.$date_event_start; // на миниатюре показываем "С такого-то  числа"
				} else if ($date_event_end > $date_now && $date_event_start < $date_now) { // если началось
					$section_content[$i]['event_date'] = 'По '.$date_event_end; // показываем "До такого то числа"
				}; // Префиксы С и До проще определить сразу тут а в представлении уже вывести все с одного элемента массива

				$i++;
			};
			
			if (!empty($section_content)) { // защита, если в базе по такому запросу пусто не возникнет фатальной ошибки
				return $section_content;
			};
		}

		//////////////////////////////////////////////////////////////////////////////////////////////////////
		// функция вытаскивает из базы записи относительно переданного значения id дополнительного блока    //
		// с заданным лимитом постов                                                                        //
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		// улучшить можно саму систему дополнительных блоков путем ограничения например только 6 публикаций //
		// возможных длдя хранения в таблице records_additional_blocks                                      //
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		public static function get_additional_block_content($additional_block_id, $section_publication_limit) {
			$pdo = Db::get_connection();

			$addictional_block_content_pdo = $pdo -> query("SELECT publication_id, dir_publications_types.publication_type_en, publication_title, dir_images.image
			FROM publications 
			INNER JOIN con_publications_additional_blocks ON publications.publication_id = con_publications_additional_blocks.publications_additional_blocks_publication_id 
			INNER JOIN dir_publications_types ON publications.publication_type_id = dir_publications_types.publication_type_id 
			INNER JOIN con_publications_images ON publications.publication_id = con_publications_images.publications_images_publication_id 
			INNER JOIN dir_images ON dir_images.image_id = con_publications_images.publications_images_image_id
			WHERE con_publications_additional_blocks.publications_additional_blocks_additional_block_id = $additional_block_id AND con_publications_images.publications_images_additional_block_image_flag = 1 
			ORDER BY publication_date DESC LIMIT $section_publication_limit"); // написать запрос -- полчучить все записи у которых указаны дополнительные блоки и условием указать id текущего блока, потом уже достать остальные нужные данные


				$i = 0;
				while ($row = $addictional_block_content_pdo->fetch()) {
					$addictional_block_content[$i]['publication_id'] = $row['publication_id']; // нужно для ссылки в слайдере
					$addictional_block_content[$i]['publication_title'] = $row['publication_title']; // нужно для текста на слайде, для alt картинки и для ссылки в транслите
					$addictional_block_content[$i]['publication_type_en'] = $row['publication_type_en']; // нужен для ссылки
					$addictional_block_content[$i]['publication_image'] = $row['image']; // картинка в слайдере она и в африке картинка в слайдере
					$addictional_block_content[$i]['slide_count'] = $section_publication_limit; // количество слайдов в слайдере
					$i++; 
				}
			if (!empty($addictional_block_content)) { // защита, если в базе по такому запросу пусто не возникнет фатальной ошибки
				return $addictional_block_content;
			};
		}

		/////////////////////////////////////////////////
		// Метод с запросом для сайдбара на главной    //
		// метод вызывается из compositePageController // 
		/////////////////////////////////////////////////
		public static function get_sidebar_content() { // в сайдбаре могут быть записи любого типа
			$pdo = Db::get_connection();
			// запрос к таблице публикации (выбор последних публикций по всем категорниями, или с исключениями)
			$slidebar_content_pdo = $pdo->query("SELECT publication_id, publication_title, publication_text, dir_publications_types.publication_type_en 
				FROM publications
				INNER JOIN dir_publications_types ON publications.publication_type_id = dir_publications_types.publication_type_id 
				WHERE dir_publications_types.publication_type_en != 'events'
				ORDER BY publication_date DESC 
				LIMIT 16");

			$i = 0;
			while ($row = $slidebar_content_pdo -> fetch()) {
				$slidebar_content[$i]['publication_id'] = $row['publication_id']; // для ссылки
				$slidebar_content[$i]['publication_title'] = $row['publication_title']; // для ссылки и сам заголвок
				$slidebar_content[$i]['publication_text'] = $row['publication_text']; // текст на карточке
				$slidebar_content[$i]['publication_type_en'] = $row['publication_type_en']; // для ссылки
				$i++;
			};

			if (!empty($slidebar_content)) { // защита от пустого массива данных
				return $slidebar_content;
			};
		}

		///////////////////////////////////////////////////////////////////////////////////
		// Функция вытаскивает события для соответствуюзего блока с определенным лимитом //
		///////////////////////////////////////////////////////////////////////////////////
		public static function get_section_content_events_filter($section_publication_limit, $category_id) {
			$pdo = Db::get_connection();

			$section_content_pdo = $pdo -> query("SELECT publications.publication_id, publications.publication_title, publications.publication_text, dir_geofences.geofence, dir_categories.category, event_age_limit, dir_visiting_mode.visit_mode, event_date_start, event_date_end, dir_images.image
				FROM fil_events
				INNER JOIN publications ON fil_events.publication_id = publications.publication_id
				INNER JOIN con_publications_images ON publications.publication_id = con_publications_images.publications_images_publication_id
				INNER JOIN dir_images ON con_publications_images.publications_images_image_id = dir_images.image_id
				INNER JOIN dir_categories ON publications.publication_category_id = dir_categories.category_id
				INNER JOIN dir_geofences ON fil_events.event_geofence_id = dir_geofences.geofence_id
				INNER JOIN dir_visiting_mode ON fil_events.event_visit_mode_id = dir_visiting_mode.visit_mode_id
				WHERE publications.publication_category_id = $category_id ORDER BY publication_date DESC LIMIT $section_publication_limit");

			date_default_timezone_set('Pacific/Fiji'); // Стандартный часовой пояс Камчатки на 2019 год

			$i = 0;
			while ($row = $section_content_pdo -> fetch()) {
				$section_content[$i]['publication_id'] = $row['publication_id']; // для ссылки
				$section_content[$i]['publication_title'] = $row['publication_title']; // ссылка заголовок альт картинки
				$section_content[$i]['publication_text'] = $row['publication_text'];
				$section_content[$i]['publication_image'] = $row['image']; // ссылка на подключаемый файл картинки
				$section_content[$i]['event_geofence'] = $row['geofence']; // геозона в примечании карточки блока
				$section_content[$i]['event_category'] = $row['category']; // для отметки на миниатюре
				$section_content[$i]['event_age_limit'] = $row['event_age_limit']; // для отметки на миниатюре
				$section_content[$i]['event_visit_mode'] = $row['visit_mode'];

				// следующий блок нежун для определения того началось событие или нет
				$date_now = date('Y-m-d H:i:s');
				$date_event_start =  $row['event_date_start'];
				$date_event_end = $row['event_date_end'];

				if ($date_event_start > $date_now && $date_event_end > $date_now) { // если не началось
					$section_content[$i]['event_date'] = 'С '.$date_event_start; // на миниатюре показываем "С такого-то  числа"
				} else if ($date_event_end > $date_now && $date_event_start < $date_now) { // если началось
					$section_content[$i]['event_date'] = 'По '.$date_event_end; // показываем "До такого то числа"
				}; // Префиксы С и До проще определить сразу тут а в представлении уже вывести все с одного элемента массива

				$i++;
			};
			
			if (!empty($section_content)) { // защита, если в базе по такому запросу пусто не возникнет фатальной ошибки
				return $section_content;
			};
		}

		public static function get_education_organizations() {
			$pdo = Db::get_connection();

			$education_organizations_pdo = $pdo -> query("SELECT organization_type, organization_type_en, dir_images.image
				FROM dir_organizations_types
				INNER JOIN dir_images ON dir_organizations_types.organization_type_image_id = dir_images.image_id
				WHERE organization_type_en  = 'educations'"); 

			$education_organizations = $education_organizations_pdo -> fetch();

			if (!empty($education_organizations)) { // защита, если в базе по такому запросу пусто не возникнет фатальной ошибки
				return $education_organizations;
			};
		}

		public static function get_education_e_books () {
			$pdo = Db::get_connection();

			$education_e_books_pdo = $pdo->query("SELECT publication_id, publication_date, publication_title, publication_text, dir_images.image, dir_categories.category_id 
				FROM publications 
				INNER JOIN con_publications_images ON publications.publication_id = con_publications_images.publications_images_publication_id 
				INNER JOIN dir_images ON con_publications_images.publications_images_image_id = dir_images.image_id AND con_publications_images.publications_images_main_image_flag = 1 
				INNER JOIN dir_categories ON publications.publication_category_id = dir_categories.category_id
				WHERE publication_type_id = 'e-books' ORDER BY publication_date DESC LIMIT 3");

			$i = 0;
			while ($row = $education_e_books_pdo -> fetch()) {
				$education_e_books[$i]['publication_id'] = $row['publication_id'];
				$education_e_books[$i]['publication_title'] = $row['publication_title'];
				$education_e_books[$i]['publication_text'] = $row['publication_text'];
				$education_e_books[$i]['publication_category'] = $row['category_id'];
				$education_e_books[$i]['publication_image'] = $row['image'];
				$i++;
			};	

			if (!empty($education_e_books)) { // защита от пустого массива данных
				return $education_e_books;
			};
		}

		public static function get_organization_type_content ($page_name) {
			$pdo = Db::get_connection();

			if ($page_name == 'index') {
				$organization_type_content_pdo = $pdo -> query("SELECT organization_type, organization_type_en, dir_images.image
					FROM dir_organizations_types
					INNER JOIN dir_images ON dir_organizations_types.organization_type_image_id = dir_images.image_id
					WHERE organization_type_index_flag = 1");
			} else if ($page_name == 'visit') {
				$organization_type_content_pdo = $pdo -> query("SELECT organization_type, organization_type_en, dir_images.image
					FROM dir_organizations_types
					INNER JOIN dir_images ON dir_organizations_types.organization_type_image_id = dir_images.image_id
					WHERE organization_type_visit_flag = 1");
			}

			$i = 0;
			while ($row = $organization_type_content_pdo -> fetch()) {
				$organization_type_content[$i]['organization_type'] = $row['organization_type'];
				$organization_type_content[$i]['organization_type_en'] = $row['organization_type_en'];
				$organization_type_content[$i]['image'] = $row['image'];
				$i++;
			};	

			if (!empty($organization_type_content)) { // защита от пустого массива данных
				return $organization_type_content;
			};
		}
	}
