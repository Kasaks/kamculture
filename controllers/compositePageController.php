<?php

include_once($_SERVER['DOCUMENT_ROOT'].'/models/compositePage.php');
include_once($_SERVER['DOCUMENT_ROOT'].'/models/index.php');
include_once($_SERVER["DOCUMENT_ROOT"]."/components/functions.php");

///////////////////////////////////////////////////////////////////////////////////////////////////
// Класс выстраивает составные страницы                                                          //
// подядок составных страниц выстраивается в таблице con_pages_sections_post_types в базе данных //
// в методах класса не подключаются файлы представления, а подключаются непосредстенно шаблоны   //
// такое решение позволяет через абзу данных менять порядок блоков на странице и их наполнение   //
///////////////////////////////////////////////////////////////////////////////////////////////////
class CompositePageController {
	///////////////////////////////////////////////////////////////////////////////////
	// Метод выстраивает любую составную страницу по заданному порядку в базе данных //
	/////////////////////////////////////////////////////////////////////////////////// 
	public function action_all ($page_name) { // имя страницы придит из ссылки

		$page_sections_list = CompositePage::get_page_sections_list($page_name); // по имени страницы возвращабтся данные с помощью которых можно определить какой блок выводитс в данный момент, какой у него заголовок, какой тип блока нужно подключить и публикации какого типа положить в эту секцию

		$page_row = Secondary_functions::get_page_row($page_name);

		$main_menu_list = Index::get_main_menu_list();
		$sub_menu_list = Index::get_sub_menu_list($page_row['page_id']);
		$page_title = $page_row['page'];
		$now_uri = Secondary_functions::get_now_page_uri();

		include($_SERVER['DOCUMENT_ROOT'].'/templates/header.php');  // вне цикла подключается шапка сайта и подвал (после цикла)
		
		$i = 0;
		while ($i < count($page_sections_list)) { // цикл по по всем секциям

			if ($i == 1 and $page_name == 'index') {
				include($_SERVER['DOCUMENT_ROOT'].'/views/index/head-index.php');
			}
			
			// $section_publication_type_en = Secondary_functions::get_publication_type_en($page_sections_list[$i]['section_publication_type_id']);
			if ($page_sections_list[$i]['section_publication_type_id'] != null) {
				$page_sections_list[$i]['section_publication_type_en'] = Secondary_functions::get_publication_type_en($page_sections_list[$i]['section_publication_type_id']);
			}

			if ($page_sections_list[$i]['section_category_id'] != null) {
				$page_sections_list[$i]['section_category_en'] = Secondary_functions::get_category_en($page_sections_list[$i]['section_category_id']);
			}

			// исключение, если секция должна быть дополнительным блоком (слайдер или слайдбар)
			if ($page_sections_list[$i]['section_en'] == 'slider' || $page_sections_list[$i]['section_en'] == 'slidebar'){

				$section_name_en = $page_sections_list[$i]['section_en']; // имя секции для подключения файла
				$additional_block_id = $page_sections_list[$i]['section_additional_block_id']; // id дополнительно блока для вытаскивания определенных данных из базы
				$section_publication_limit = $page_sections_list[$i]['section_publication_limit']; // лимит количества публикаций в секции
				
				if (isset($page_sections_list[$i]['section_name'])) {
					$section_title = $page_sections_list[$i]['section_name'];
				} else $section_title = '';

				$result = CompositePage::get_additional_block_content($additional_block_id, $section_publication_limit);

				include($_SERVER['DOCUMENT_ROOT'].'/templates/'.$page_sections_list[$i]['section_en'].'-section.php');

			} else if (isset($page_sections_list[$i]['section_publication_type_en']) && $page_sections_list[$i]['section_publication_type_en'] == 'event') { // исключение, если выводятся секции с событиями

				$section_publication_limit = $page_sections_list[$i]['section_publication_limit'];
				$section_title = $page_sections_list[$i]['section_name'];
				$section_link =  $page_sections_list[$i]['section_publication_type_en'];
				
				if ($page_sections_list[$i]['section_category_id'] != null) {
					$result = CompositePage::get_section_content_events($section_publication_limit, $page_sections_list[$i]['section_category_id']);
					$section_link = $page_sections_list[$i]['section_publication_type_en']. '/' . $page_sections_list[$i]['section_category_en'];
				} else {
					$result = CompositePage::get_section_content_events($section_publication_limit, $page_sections_list[$i]['section_category_id']);
					$section_link = $page_sections_list[$i]['section_publication_type_en'];
				}

				// $result = CompositePage::get_section_content_events($section_publication_limit);				
				
				include($_SERVER['DOCUMENT_ROOT'].'/templates/head-section.php');
				include($_SERVER['DOCUMENT_ROOT'].'/templates/'.$page_sections_list[$i]['section_en'].'-section.php');

			} else if ($page_sections_list[$i]['section_en'] == 'education') {

				$result['organizations'] = CompositePage::get_education_organizations();
				$result['e-books'] = CompositePage::get_education_e_books();

				$section_title = $page_sections_list[$i]['section_name']; 
				$section_link = 'education';

				include($_SERVER['DOCUMENT_ROOT'].'/templates/head-section.php');
				include($_SERVER['DOCUMENT_ROOT'].'/templates/'.$page_sections_list[$i]['section_en'].'-section.php');

			} else if ($page_sections_list[$i]['section_en'] == 'organization') {

				$section_publication_type_id = $page_sections_list[$i]['section_publication_type_id'];
				$section_publication_limit = $page_sections_list[$i]['section_publication_limit'];
				$section_link = $page_sections_list[$i]['section_publication_type_en'];
				$section_title = $page_sections_list[$i]['section_name'];

				$result = CompositePage::get_organization_type_content($page_name);

				include($_SERVER['DOCUMENT_ROOT'].'/templates/head-section.php');
				include($_SERVER['DOCUMENT_ROOT'].'/templates/'.$page_sections_list[$i]['section_en'].'-section.php');

			} else { // если иначе значит это стандартный запрос к таблице записей

				$section_publication_type_id = $page_sections_list[$i]['section_publication_type_id'];
				$section_publication_limit = $page_sections_list[$i]['section_publication_limit'];
				$publication_type_en = $page_sections_list[$i]['section_publication_type_en'];

				if ($page_sections_list[$i]['section_category_id'] != null) {
					$result = CompositePage::get_section_content($section_publication_type_id, $section_publication_limit, $page_sections_list[$i]['section_category_id']);
					$section_link = $page_sections_list[$i]['section_publication_type_en'] . '/' . $page_sections_list[$i]['section_category_en'];
				} else {
					$result = CompositePage::get_section_content($section_publication_type_id, $section_publication_limit, $page_sections_list[$i]['section_category_id']);
					$section_link = $page_sections_list[$i]['section_publication_type_en'];
				}


				// $result = CompositePage::get_section_content($section_publication_type_id, $section_publication_limit); // данные с базы относительно блока
				$publication_type_en = $page_sections_list[$i]['section_publication_type_en'];
				$section_title = $page_sections_list[$i]['section_name'];
				
				
				include($_SERVER['DOCUMENT_ROOT'].'/templates/head-section.php');
				include($_SERVER['DOCUMENT_ROOT'].'/templates/'.$page_sections_list[$i]['section_en'].'-section.php');
				
			}

			$i ++;
		};

		if ($page_name == 'index') {

				$result = CompositePage::get_sidebar_content();

				include($_SERVER['DOCUMENT_ROOT'].'/views/index/footer-index.php');
			}

		include($_SERVER['DOCUMENT_ROOT'].'/templates/footer.php'); // подключение подвала страницы вне цикла

		return true;
	}

	public function action_filter ($page_en, $category_en) {

		$page_sections_list = CompositePage::get_page_sections_list($page_en);

		$page_row = Secondary_functions::get_page_row($page_en);

		$main_menu_list = Index::get_main_menu_list();
		$sub_menu_list = Index::get_sub_menu_list($page_row['page_id']);
		$page_title = $page_row['page'];
		$now_uri = Secondary_functions::get_now_page_uri();

		include($_SERVER['DOCUMENT_ROOT'].'/templates/header.php'); // вне цикла подключается шапка сайта и подвал (после цикла)

		// echo '<pre>';
		// var_dump($page_sections_list);
		// echo '</pre>';

		$i = 0;
		while ($i < count($page_sections_list)) {

			if ($page_sections_list[$i]['section_publication_type_id'] != null) {
				$page_sections_list[$i]['section_publication_type_en'] = Secondary_functions::get_publication_type_en($page_sections_list[$i]['section_publication_type_id']);
			}

			if ($page_sections_list[$i]['section_en'] == 'slider' || $page_sections_list[$i]['section_en'] == 'slidebar') {

				$section_name_en = $page_sections_list[$i]['section_en']; // имя секции для подключения файла
				$additional_block_id = $page_sections_list[$i]['section_additional_block_id']; // id дополнительно блока для вытаскивания определенных данных из базы
				$section_publication_limit = $page_sections_list[$i]['section_publication_limit']; // лимит количества публикаций в секции
				
				if (isset($page_sections_list[$i]['section_name'])) {
					$section_title = $page_sections_list[$i]['section_name'];
				} else $section_title = '';

				$result = CompositePage::get_additional_block_content($additional_block_id, $section_publication_limit);

				include($_SERVER['DOCUMENT_ROOT'].'/templates/'.$page_sections_list[$i]['section_en'].'-section.php');

			} else if (isset($page_sections_list[$i]['section_publication_type_en']) && $page_sections_list[$i]['section_publication_type_en'] == 'event') {

				$section_publication_limit = $page_sections_list[$i]['section_publication_limit'];
				$section_title = $page_sections_list[$i]['section_name'];
				$category_id = Secondary_functions::get_category_id($category_en);
				$section_link =  $page_sections_list[$i]['section_publication_type_en'];

				$result = CompositePage::get_section_content_events_filter($section_publication_limit, $category_id);
				
				include($_SERVER['DOCUMENT_ROOT'].'/templates/head-section.php');
				include($_SERVER['DOCUMENT_ROOT'].'/templates/'.$page_sections_list[$i]['section_en'].'-section.php');
			}

			$i ++;
		}

		include($_SERVER['DOCUMENT_ROOT'].'/templates/footer.php'); // подключение подвала страницы вне цикла

		return true;
	}


}