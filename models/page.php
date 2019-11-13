<?php
	
	include_once($_SERVER['DOCUMENT_ROOT'].'/components/db.php');
	//////////////////////////////////////////////////////////////////
	// Класс описывает методы для работы с не составными страницами //
	// это страницы структуры: шапка -> секция -> подвал            //
	//////////////////////////////////////////////////////////////////
	class Page {

		////////////////////////////////////////////////////////////////////////////////////
		// Локальный метод класса для получения id пуликации по его английскому названнию //
		// название приходит из ссылки                                                    //
		////////////////////////////////////////////////////////////////////////////////////
		private static function get_publication_type_id($publication_type_en) {
			$pdo = Db::get_connection();

			$publication_type_id_pdo = $pdo->query("SELECT publication_type_id FROM dir_publications_types WHERE publication_type_en = '$publication_type_en'");
			$publication_type_id_pdo = $publication_type_id_pdo->fetch();
			$publication_type_id = $publication_type_id_pdo['publication_type_id'];

			if (!empty($publication_type_id)) { // защита от пустого массива данных
				return $publication_type_id;
			};
		}

		private static function get_organization_type_id($category_en) {
			$pdo = Db::get_connection();

			$organization_type_pdo = $pdo -> query("SELECT organization_type_id FROM dir_organizations_types WHERE organization_type_en = '$category_en'");

			$organization_type = $organization_type_pdo -> fetch();

			return $organization_type['organization_type_id'];
		}

		private static function get_publication_category_id($category_en) {
			$pdo = Db::get_connection();

			$publication_category_id_pdo = $pdo->query("SELECT category_id FROM dir_categories WHERE category_en = '$category_en'");
			$publication_category_id = $publication_category_id_pdo -> fetch();

			return $publication_category_id['category_id'];
		}

		private static function check_category_for_publication_type($publication_type_id) {
			$pdo = Db::get_connection();

			$check_category_pdo = $pdo -> query("SELECT category_id FROM dir_categories WHERE category_publication_type_id = $publication_type_id");

			$check_category = $check_category_pdo -> fetch();

			if (empty($check_category)) {
				$check_category = true;
			} else {
				$check_category = false;
			};

			return $check_category;
		}
		
		///////////////////////////////////////////////////////////////////////
		// Метод передает все публикации по определенному ID типа публикации //
		// например все новости или все коллективы                           //
		///////////////////////////////////////////////////////////////////////
		public static function get_publications_list($publication_type_en) {
			// соединение с базой данных
			$pdo = Db::get_connection();

			$publication_type_id = static::get_publication_type_id($publication_type_en);

			if ($publication_type_en == 'organizations') { // запрос к таблице организаций

				$publications_list_pdo = $pdo -> query("SELECT publications.publication_id, publications.publication_title, dir_images.image 
					FROM fil_organizations
					INNER JOIN publications ON fil_organizations.publication_id = publications.publication_id
					INNER JOIN con_publications_images ON publications.publication_id = con_publications_images.publications_images_publication_id 
					INNER JOIN dir_images ON con_publications_images.publications_images_image_id = dir_images.image_id AND con_publications_images.publications_images_main_image_flag = 1
					WHERE publications.publication_type_id = $publication_type_id AND fil_organizations.organization_hide != 1 ORDER BY publications.publication_date DESC LIMIT 16");

				$i = 0;
				while ($row = $publications_list_pdo -> fetch()) {
					$publications_list[$i]['publication_id'] = $row['publication_id']; // для ссылки
					$publications_list[$i]['publication_title'] = $row['publication_title'];
					$publications_list[$i]['publication_image'] = $row['image'];
					$i++;
				};
				
			} else {

				// получение данных с таблицы "Публикации" и "Картинки" с определенным типом публикации (берется картинка с отметной "Главная")
				$publications_list_pdo = $pdo->query("SELECT publication_id, publication_date, publication_title, publication_text, dir_images.image 
					FROM publications 
					INNER JOIN con_publications_images ON publications.publication_id = con_publications_images.publications_images_publication_id 
					INNER JOIN dir_images ON con_publications_images.publications_images_image_id = dir_images.image_id AND con_publications_images.publications_images_main_image_flag = 1 
					WHERE publication_type_id = $publication_type_id ORDER BY publication_date DESC LIMIT 16");

				$i = 0;
				while ($row = $publications_list_pdo -> fetch()) {
					$publications_list[$i]['publication_id'] = $row['publication_id']; // для ссылки
					$publications_list[$i]['publication_note'] = $row['publication_date']; // Дата нужна если тип публикации - новости
					$publications_list[$i]['publication_title'] = $row['publication_title'];
					$publications_list[$i]['publication_text'] = $row['publication_text'];
					$publications_list[$i]['publication_image'] = $row['image'];
					$i++;
				};

			};

			if (!empty($publications_list)) { // защита от пустого массива данных
				return $publications_list;
			};
		}

		///////////////////////////////////////////////////////////////////////////////////////
		// Метод получает список всех публикаций определенного типа и определенной категории //
		///////////////////////////////////////////////////////////////////////////////////////
		public static function get_publication_list_by_category($publication_type_en, $category_en) { // категории приходит из ссылки 
			$pdo = Db::get_connection();

			if ($publication_type_en == 'organizations') { // запрос к таблице организаций

				$organization_type_id = static::get_organization_type_id($category_en);

				$publications_list_pdo = $pdo -> query("SELECT publications.publication_id, publications.publication_date, publications.publication_title, publications.publication_text, dir_images.image 
					FROM fil_organizations
					INNER JOIN publications ON fil_organizations.publication_id = publications.publication_id
					INNER JOIN con_publications_images ON publications.publication_id = con_publications_images.publications_images_publication_id
					INNER JOIN dir_images ON con_publications_images.publications_images_image_id = dir_images.image_id
					WHERE fil_organizations.organization_organization_type_id = $organization_type_id AND con_publications_images.publications_images_main_image_flag = 1
					ORDER BY publications.publication_date DESC LIMIT 16");


				$i = 0;
				while ($row = $publications_list_pdo -> fetch()) {
					$publications_list[$i]['publication_id'] = $row['publication_id']; // для ссылки
					$publications_list[$i]['publication_note'] = $row['publication_date']; // Дата нужна если тип публикации - новости
					$publications_list[$i]['publication_title'] = $row['publication_title'];
					$publications_list[$i]['publication_text'] = $row['publication_text'];
					$publications_list[$i]['publication_image'] = $row['image'];
					$i++;
				};

			} else {

				$publication_type_id = static::get_publication_type_id($publication_type_en);

				$publication_category_id = static::get_publication_category_id($category_en);

				$publications_list_pdo = $pdo->query("SELECT publication_id, publication_date, publication_title, publication_text, dir_images.image 
					FROM publications 
					INNER JOIN con_publications_images ON publications.publication_id = con_publications_images.publications_images_publication_id 
					INNER JOIN dir_images ON con_publications_images.publications_images_image_id = dir_images.image_id 
					WHERE publication_type_id = $publication_type_id AND publication_category_id = $publication_category_id AND con_publications_images.publications_images_main_image_flag = 1
					ORDER BY publication_date DESC LIMIT 16");

				$i = 0;
				while ($row = $publications_list_pdo -> fetch()) {
					$publications_list[$i]['publication_id'] = $row['publication_id']; // для ссылки
					$publications_list[$i]['publication_note'] = $row['publication_date']; // Дата нужна если тип публикации - новости
					$publications_list[$i]['publication_title'] = $row['publication_title'];
					$publications_list[$i]['publication_text'] = $row['publication_text'];
					$publications_list[$i]['publication_image'] = $row['image'];
					$i++;
				};
				
 			};

			if (!empty($publications_list)) { // защита от пустого массива данных
				return $publications_list; 
			};
		}

		///////////////////////////////////////////////////////////////
		// Метод возвращает данные для одной единственной публикации //
		// этот метод вызывется со всех станиц, где есть публикации  //
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// $post_type_en нужен не только для более быстрого выполнения запроса, а и для того,                       //
		// чтобы если открыватся публикация мероприятия выполнился запрос не в таблицу записей, а в таблицу событий //
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static function get_publication_item($publication_type_en, $publication_id) { // id публикации приходит из ссылки      
			$pdo = Db::get_connection();

			$publication_type_id = static::get_publication_type_id($publication_type_en);
				
			$check_category = static::check_category_for_publication_type($publication_type_id);

			if ($publication_type_en == 'organizations' || $check_category == true) {
				$publication_content_pdo = $pdo -> query("SELECT publication_id, publication_title, publication_text, publication_date, dir_images.image
					FROM publications
					INNER JOIN con_publications_images ON publications.publication_id = con_publications_images.publications_images_publication_id
					INNER JOIN dir_images ON con_publications_images.publications_images_image_id = dir_images.image_id
					WHERE publication_id = $publication_id AND con_publications_images.publications_images_main_image_flag = 1");

				$j = 0; // при количестве картинок у публикации больше одной запрос вернет n количетсво строк (зависит от количества картинок у публикации)
							// поэтому элемент массива publication_image так же является массивом
				while ($row = $publication_content_pdo -> fetch()) {
					$publication_content['publication']['id'] = $row['publication_id'];
					$publication_content['publication']['title'] = $row['publication_title'];
					$publication_content['publication']['text'] = $row['publication_text'];
					$publication_content['publication']['date'] = $row['publication_date'];
					$publication_content['publication']['image'][$j] = $row['image'];
					$j++;
				};
			} else {
				$publication_content_pdo = $pdo -> query("SELECT publication_id, publication_title, publication_text, publication_date, dir_images.image, dir_categories.category,  dir_categories.category_en
					FROM publications
					INNER JOIN con_publications_images ON publications.publication_id = con_publications_images.publications_images_publication_id
					INNER JOIN dir_images ON con_publications_images.publications_images_image_id = dir_images.image_id
					INNER JOIN dir_categories ON publications.publication_category_id = dir_categories.category_id 
					WHERE publication_id = $publication_id AND con_publications_images.publications_images_main_image_flag = 1");

				$j = 0; // при количестве картинок у публикации больше одной запрос вернет n количетсво строк (зависит от количества картинок у публикации)
							// поэтому элемент массива publication_image так же является массивом
				while ($row = $publication_content_pdo -> fetch()) {
					$publication_content['publication']['id'] = $row['publication_id'];
					$publication_content['publication']['title'] = $row['publication_title'];
					$publication_content['publication']['text'] = $row['publication_text'];
					$publication_content['publication']['date'] = $row['publication_date'];
					$publication_content['publication']['category'] = $row['category'];
					$publication_content['publication']['category_en'] = $row['category_en'];
					$publication_content['publication']['image'][$j] = $row['image'];
					$j++;
				};
			};

			if (!empty($publication_content)) { // защита от пустого массива данных
				return $publication_content;
			};
		}

		// в методе прописывается запрос к каждой таблице с дополнительными полями
		public static function get_additional_field($publication_type_en, $publication_id) {
			$pdo = Db::get_connection();

			if ($publication_type_en == 'event') {
				$additional_field_pdo = $pdo -> query("SELECT event_age_limit, event_date_start, event_date_end, event_cost, dir_target_audiences.target_audience AS event_target_audience, dir_geofences.geofence AS event_geofence, event_location_id, event_organizer_id, dir_visiting_mode.visit_mode
					FROM fil_events 
					INNER JOIN dir_target_audiences ON fil_events.event_target_audience_id = dir_target_audiences.target_audience_id
					INNER JOIN dir_geofences ON fil_events.event_geofence_id = dir_geofences.geofence_id
					-- INNER JOIN con_event_partners ON fil_events.fil_events_id = con_event_partners.event_partners_event_id
					-- INNER JOIN publications ON con_event_partners.event_partners_partner_id = publications.publication_id
					INNER JOIN dir_visiting_mode ON fil_events.event_visit_mode_id = dir_visiting_mode.visit_mode_id
					WHERE fil_events.publication_id = $publication_id");

				$j = 0;
				while ($row = $additional_field_pdo -> fetch()) {
					$additional_field['event']['age_limit'] = $row['event_age_limit'];
					$additional_field['event']['date_start'] = $row['event_date_start'];
					$additional_field['event']['date_end'] = $row['event_date_end'];
					$additional_field['event']['cost'] = $row['event_cost'];
					$additional_field['event']['target_audience'] = $row['event_target_audience'];
					$additional_field['event']['geofence'] = $row['event_geofence'];
					$additional_field['event']['visit_mode'] = $row['visit_mode'];
					$additional_field['event']['location_array']['location_id'] = $row['event_location_id'];
					$additional_field['event']['organizer_array']['organizer_id'] = $row['event_organizer_id'];
					$j++;

				}	

					$event_location_id = $additional_field['event']['location_array']['location_id'];
					$event_organizer_id = $additional_field['event']['organizer_array']['organizer_id'];
				
				$event_location_field_pdo = $pdo -> query("SELECT publications.publication_title AS location, organization_address AS address, organization_phone AS phone, organization_site AS site, organization_email AS email 
					FROM fil_organizations
					INNER JOIN publications ON fil_organizations.publication_id = publications.publication_id 
					WHERE publications.publication_id = $event_location_id");

				$event_organizer_field_pdo = $pdo -> query("SELECT publications.publication_title AS organizer, organization_address AS address, organization_phone AS phone, organization_site AS site, organization_email AS email 
					FROM fil_organizations
					INNER JOIN publications ON fil_organizations.publication_id = publications.publication_id 
					WHERE publications.publication_id = $event_organizer_id");

				$additional_field['event']['location_array'] = $additional_field['event']['location_array'] + $event_location_field_pdo -> fetch();
				$additional_field['event']['organizer_array'] = $additional_field['event']['organizer_array'] + $event_organizer_field_pdo -> fetch();

			}

			if ($publication_type_en == 'organizations') {
				$additional_field_pdo = $pdo -> query("SELECT dir_organizations_types.organization_type, dir_geofences.geofence, organization_director, organization_work_mode, organization_address, organization_phone, organization_site, organization_email 
					FROM fil_organizations
					INNER JOIN dir_organizations_types ON fil_organizations.organization_organization_type_id = dir_organizations_types.organization_type_id
					INNER JOIN dir_geofences ON fil_organizations.organization_geofence_id = dir_geofences.geofence_id
					WHERE fil_organizations.publication_id = $publication_id");

				$row = $additional_field_pdo -> fetch();

				$additional_field['organization']['type'] = $row['organization_type'];
				$additional_field['geofence'] = $row['geofence'];
				$additional_field['organization']['director'] = $row['organization_director'];
				$additional_field['organization']['work_mode'] = $row['organization_work_mode'];
				$additional_field['organization']['address'] = $row['organization_address'];
				$additional_field['organization']['phone'] = $row['organization_phone'];
				$additional_field['organization']['site'] = $row['organization_site'];
				$additional_field['organization']['email'] = $row['organization_email'];
			}

			if ($publication_type_en == 'news') {
				$additional_field_pdo = $pdo -> query("SELECT dir_geofences.geofence, news_phone
					FROM fil_news
					INNER JOIN dir_geofences ON fil_news.news_geofence_id = dir_geofences.geofence_id
					WHERE fil_news.publication_id = $publication_id");

				$row = $additional_field_pdo -> fetch();
				$additional_field['geofence'] = $row['geofence'];
				$additional_field['news']['phone'] = $row['news_phone'];
			}

			if ($publication_type_en == 'articles') {
				$additional_field_pdo = $pdo -> query("SELECT article_author, article_author_photo
					FROM fil_articles
					WHERE fil_articles.publication_id = $publication_id");

				$row = $additional_field_pdo -> fetch();
				$additional_field['article']['author'] = $row['article_author'];
				$additional_field['article']['author_photo'] = $row['article_author_photo'];
			}

			if ($publication_type_en == 'attractions') {
				$additional_field_pdo = $pdo -> query("SELECT dir_geofences.geofence
					FROM fil_attractions
					INNER JOIN dir_geofences ON fil_attractions.attraction_geofence_id = dir_geofences.geofence_id
					WHERE fil_attractions.publication_id = $publication_id");

				$row = $additional_field_pdo -> fetch();
				$additional_field['geofence'] = $row['geofence'];
			}

			if ($publication_type_en == 'collectivies') {
				$additional_field_pdo = $pdo -> query("SELECT collectivie_director, collectivie_site, collectivie_phone, collectivie_email
					FROM fil_collectivies
					WHERE fil_collectivies.publication_id = $publication_id");

				$row = $additional_field_pdo -> fetch();
				$additional_field['collectivie']['director'] = $row['collectivie_director'];
				$additional_field['collectivie']['site'] = $row['collectivie_site'];
				$additional_field['collectivie']['phone'] = $row['collectivie_phone'];
				$additional_field['collectivie']['email'] = $row['collectivie_email'];
			}

			if ($publication_type_en == 'contests') {
				$additional_field_pdo = $pdo -> query("SELECT contest_site, contest_phone, contest_email, contest_file
					FROM fil_contests
					WHERE fil_contests.publication_id = $publication_id");

				$row = $additional_field_pdo -> fetch();
				$additional_field['contest']['site'] = $row['contest_site'];
				$additional_field['contest']['phone'] = $row['contest_phone'];
				$additional_field['contest']['email'] = $row['contest_email'];
				$additional_field['contest']['file'] = $row['contest_file'];
			}

			if ($publication_type_en == 'e-books') {
				$additional_field_pdo = $pdo -> query("SELECT e_book_file
					FROM fil_books
					WHERE fil_books.publication_id = $publication_id");

				$row = $additional_field_pdo -> fetch();
				$additional_field['e-book']['file'] = $row['e_book_file'];
			}

			if ($publication_type_en == 'gallery') {
				$additional_field_pdo = $pdo -> query("SELECT gallery_author, gallery_date, publications.publication_title AS location, publications.publication_id AS location_id
					FROM fil_gallery
					INNER JOIN publications ON fil_gallery.gallery_location_id = publications.publication_id
					WHERE fil_gallery.publication_id = $publication_id");

				$row = $additional_field_pdo -> fetch();
				$additional_field['gallery']['author'] = $row['gallery_author'];
				$additional_field['gallery']['event-date'] = $row['gallery_date'];
				$additional_field['gallery']['location'] = $row['location'];
				$additional_field['gallery']['location_id'] = $row['location_id'];
			}

			if ($publication_type_en == 'people') {
				$additional_field_pdo = $pdo -> query("SELECT people_site, people_phone, people_email
					FROM fil_people
					WHERE fil_people.publication_id = $publication_id");

				$row = $additional_field_pdo -> fetch();
				$additional_field['people']['site'] = $row['people_site'];
				$additional_field['people']['phone'] = $row['people_phone'];
				$additional_field['people']['email'] = $row['people_email'];
			}

			if (!empty($additional_field)) { // защита от пустого массива данных
				return $additional_field;
			};
		}
	}