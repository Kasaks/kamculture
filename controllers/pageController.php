<?php

include_once($_SERVER['DOCUMENT_ROOT'].'/models/page.php'); // файл модели, которая выполняет запросы к базе
include_once($_SERVER['DOCUMENT_ROOT'].'/models/index.php'); // файл модели, которая выполняет запросы к базе
include_once($_SERVER["DOCUMENT_ROOT"]."/components/functions.php"); // файл с дополнительными функциями

////////////////////////////////////////////////////////////////////////////////////////////////////////
// Класс выстранивает не составные страницы (страницы из одной сеции с определенным типом публикаций) //
////////////////////////////////////////////////////////////////////////////////////////////////////////
class PageController {

	////////////////////////////////////////////////////////////////////
	// Метод выстраивает все страницы с определенным типом публикаций //
	////////////////////////////////////////////////////////////////////
	public function action_all ($publication_type_en) {
		$result = Page::get_publications_list($publication_type_en);

		$publication_type_row = Secondary_functions::get_publication_type_row($publication_type_en);
		
		$now_uri = Secondary_functions::get_now_page_uri();
		$main_menu_list = index::get_main_menu_list();
		$sub_menu_list = Index::get_sub_menu_list(1);
		$section_title = $publication_type_row['publication_type'];
		$section_link = $publication_type_en;
		$page_title = $publication_type_row['publication_type'];

		include_once($_SERVER['DOCUMENT_ROOT'].'/views/page/page.php');

		return true;
	}

	//////////////////////////////////////////////////////////////////////////////////////////////
	// Метод выстраивает все страницы с определенным типом публикаций и определенной категорией //
	//////////////////////////////////////////////////////////////////////////////////////////////
	public function action_filter ($publication_type_en, $category) {

		$result = Page::get_publication_list_by_category($publication_type_en, $category);

		$publication_type_row = Secondary_functions::get_publication_type_row($publication_type_en);

		$now_uri = Secondary_functions::get_now_page_uri();
		$main_menu_list = index::get_main_menu_list();
		$sub_menu_list = Index::get_sub_menu_list(1);
		$section_title = $publication_type_row['publication_type'];
		$section_link = $publication_type_en;
		$page_title = $publication_type_row['publication_type'];

		// echo '<pre>';
		// var_dump($result);
		// echo '</pre>';

		$section_title = $publication_type_row['publication_type'];
		$section_link = $publication_type_en;

		include_once($_SERVER['DOCUMENT_ROOT'].'/views/page/page.php');

		return true;
	}

	////////////////////////////////////////////////////////////
	// Метод выводит страницу с одной публикацией             //
	// метод вызывается с любой страницы, где есть публикации //
	////////////////////////////////////////////////////////////
	public function action_one ($publication_type_en, $publication_id) {
		$result = Page::get_publication_item($publication_type_en, $publication_id);

		$publication_type_row = Secondary_functions::get_publication_type_row($publication_type_en);

		if ($publication_type_row['publication_additional_field_flag'] == 1) {
			$result = $result + Page::get_additional_field($publication_type_en, $publication_id);
		};

		$now_uri = Secondary_functions::get_now_page_uri();
		$main_menu_list = index::get_main_menu_list();
		$sub_menu_list = Index::get_sub_menu_list(1);
		// $publication_type_en = $publication_type_row['publication_type_en'];
		$section_title = $publication_type_row['publication_type'];
		$section_link = $publication_type_en;
		$page_title = $result['publication']['title'].' | '.$publication_type_row['publication_type'];

		// echo '<pre>';
		// var_dump($result);
		// var_dump($publication_type_row);
		// echo '</pre>';

		include_once($_SERVER['DOCUMENT_ROOT'].'/views/publication/publication.php');

		return true;
	}

}