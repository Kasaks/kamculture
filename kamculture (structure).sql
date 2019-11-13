-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 27 2019 г., 02:57
-- Версия сервера: 10.1.38-MariaDB
-- Версия PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kamculture`
--

-- --------------------------------------------------------

--
-- Структура таблицы `con_event_partners`
--

CREATE TABLE `con_event_partners` (
  `event_partners_event_id` int(10) UNSIGNED NOT NULL,
  `event_partners_partner_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `con_pages_publications_types`
--

CREATE TABLE `con_pages_publications_types` (
  `pages_publications_types_page_id` int(10) UNSIGNED NOT NULL,
  `pages_publications_types_publication_type_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `con_pages_publications_types`
--

INSERT INTO `con_pages_publications_types` (`pages_publications_types_page_id`, `pages_publications_types_publication_type_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(2, 3),
(2, 6),
(2, 8),
(3, 1),
(3, 7),
(3, 9),
(5, 3),
(5, 7),
(5, 8),
(5, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `con_pages_sections_publications_types`
--

CREATE TABLE `con_pages_sections_publications_types` (
  `pages_sections_publications_types_serial_number` int(10) UNSIGNED NOT NULL,
  `pages_sections_publications_types_section_name` varchar(255) DEFAULT NULL,
  `pages_sections_publications_types_additional_block_id` int(10) UNSIGNED DEFAULT NULL,
  `pages_sections_publications_types_page_id` int(10) UNSIGNED NOT NULL,
  `pages_sections_publications_types_section_id` int(10) UNSIGNED NOT NULL,
  `pages_sections_publications_types_publication_type_id` int(10) UNSIGNED DEFAULT NULL,
  `pages_sections_publications_types_publication_limit` int(10) UNSIGNED NOT NULL,
  `pages_sections_publications_types_category_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `con_pages_sections_publications_types`
--

INSERT INTO `con_pages_sections_publications_types` (`pages_sections_publications_types_serial_number`, `pages_sections_publications_types_section_name`, `pages_sections_publications_types_additional_block_id`, `pages_sections_publications_types_page_id`, `pages_sections_publications_types_section_id`, `pages_sections_publications_types_publication_type_id`, `pages_sections_publications_types_publication_limit`, `pages_sections_publications_types_category_id`) VALUES
(1, '', 1, 1, 7, NULL, 6, NULL),
(1, '', 5, 2, 8, NULL, 6, NULL),
(1, '', 8, 3, 8, NULL, 4, NULL),
(1, '', 9, 4, 8, NULL, 6, NULL),
(1, 'Афиша образовательных мероприятий', NULL, 5, 4, 8, 8, 22),
(2, 'Новости', NULL, 1, 2, 1, 4, NULL),
(2, 'Афиша культурных событий', NULL, 2, 4, 8, 8, NULL),
(2, 'Статьи об искусстве', NULL, 3, 1, 7, 8, 3),
(2, '', NULL, 4, 4, 8, 16, NULL),
(2, 'Образовательные статьи', NULL, 5, 1, 7, 4, 5),
(3, 'Галерея', NULL, 1, 6, 2, 4, NULL),
(3, 'Организации', NULL, 2, 5, 3, 4, NULL),
(3, 'Биографии', NULL, 3, 1, 7, 4, 7),
(3, 'Образовательные организации', NULL, 5, 1, 3, 4, 27),
(4, 'Организации', NULL, 1, 5, 3, 4, NULL),
(4, 'Достопримечательности', NULL, 2, 1, 6, 4, 1),
(4, '', 9, 3, 7, NULL, 4, NULL),
(4, 'Электронные книги', NULL, 5, 10, 9, 4, NULL),
(5, '', 2, 1, 7, NULL, 6, NULL),
(5, 'Главные культурные события', 6, 2, 7, NULL, 6, NULL),
(5, 'Статьи о национальной культуре', NULL, 3, 1, 7, 4, 4),
(6, 'Образование', NULL, 1, 9, NULL, 4, NULL),
(6, 'Традиции и национальная культура', NULL, 2, 1, 3, 4, 29),
(6, 'Электронные книги', NULL, 3, 10, 9, 4, NULL),
(7, 'Коллективы', NULL, 1, 1, 4, 4, NULL),
(8, 'Люди', NULL, 1, 1, 5, 4, NULL),
(9, '', 2, 1, 7, NULL, 6, NULL),
(10, 'Конкурсы', NULL, 1, 1, 10, 4, NULL),
(11, 'Хобби', NULL, 1, 1, 3, 4, 28),
(12, '', 2, 1, 7, NULL, 6, NULL),
(13, 'Традиции', NULL, 1, 1, 3, 4, 29),
(14, 'Памятники', NULL, 1, 1, 6, 4, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `con_publications_additional_blocks`
--

CREATE TABLE `con_publications_additional_blocks` (
  `publications_additional_blocks_publication_id` int(10) UNSIGNED NOT NULL,
  `publications_additional_blocks_additional_block_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `con_publications_images`
--

CREATE TABLE `con_publications_images` (
  `publications_images_publication_id` int(10) UNSIGNED NOT NULL,
  `publications_images_image_id` int(10) UNSIGNED NOT NULL,
  `publications_images_main_image_flag` tinyint(1) DEFAULT NULL,
  `publications_images_additional_block_image_flag` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `con_publications_types_cetegories`
--

CREATE TABLE `con_publications_types_cetegories` (
  `publications_types_cetegories_publication_type_id` int(10) UNSIGNED NOT NULL,
  `publications_types_cetegories_category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `dir_additional_blocks`
--

CREATE TABLE `dir_additional_blocks` (
  `additional_block_id` int(10) UNSIGNED NOT NULL,
  `additional_block_name` varchar(100) NOT NULL,
  `additional_block_additional_block_type_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `dir_additional_blocks`
--

INSERT INTO `dir_additional_blocks` (`additional_block_id`, `additional_block_name`, `additional_block_additional_block_type_id`) VALUES
(1, 'Слайдер на главной №1', 1),
(2, 'Слайдер на главной №2', 1),
(3, 'Слайдер на главной №3', 1),
(4, 'Слайдер на главной №4', 1),
(5, 'Слайдбар на \"Посетить\"', 2),
(6, 'Слайдер на \"Посетить #1\"', 1),
(7, 'Сдайдбар на \"Читать\"', 2),
(8, 'Слайдер на \"Читать\"', 1),
(9, 'Слайдбар на \"Афиша\"', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `dir_additional_blocks_types`
--

CREATE TABLE `dir_additional_blocks_types` (
  `additional_block_type_id` int(10) UNSIGNED NOT NULL,
  `additional_block_type` varchar(100) NOT NULL,
  `additional_block_type_en` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `dir_additional_blocks_types`
--

INSERT INTO `dir_additional_blocks_types` (`additional_block_type_id`, `additional_block_type`, `additional_block_type_en`) VALUES
(1, 'Слайдер', 'slider'),
(2, 'Слайдбар', 'slidebar');

-- --------------------------------------------------------

--
-- Структура таблицы `dir_categories`
--

CREATE TABLE `dir_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category` varchar(100) NOT NULL,
  `category_en` varchar(100) NOT NULL,
  `category_publication_type_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `dir_categories`
--

INSERT INTO `dir_categories` (`category_id`, `category`, `category_en`, `category_publication_type_id`) VALUES
(1, 'Достопримечательности', 'attractions', 6),
(2, 'Памятники', 'monuments', 6),
(3, 'Искусство', 'art', 7),
(4, 'Национальная культуры', 'national-culture', 7),
(5, 'Образование', 'educations', 7),
(6, 'Кино', 'cinema', 7),
(7, 'Биографии', 'biographies', 7),
(8, 'Концерты', 'concerts', 8),
(9, 'Спектакли', 'perfomances', 8),
(10, 'Театр HD', 'theater-hd', 8),
(11, 'Трансляции', 'broadcast', 8),
(12, 'Выставки', 'exhibitions', 8),
(13, 'Мастер-классы', 'master-classes', 8),
(14, 'Кинопоказы', 'films', 8),
(15, 'Лектории', 'lectures', 8),
(16, 'Встречи', 'meet', 8),
(17, 'Фестивали', 'festivals', 8),
(18, 'Праздники', 'holydays', 8),
(19, 'Конкурсы', 'contests', 8),
(20, 'Акции', 'promotions', 8),
(21, 'Онлайн', 'online', 8),
(22, 'Обучение', 'educate', 8),
(23, 'Театры, концертные и кинозалы', 'halls', 3),
(24, 'Библиотеки', 'libraries', 3),
(25, 'Музеи', 'musems', 3),
(26, 'Центры культуры и досуга', 'art_house', 3),
(27, 'Образовательные организации', 'educations', 3),
(28, 'Хобби', 'hobby', 3),
(29, 'Традции и национальная культура', 'hobby', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `dir_geofences`
--

CREATE TABLE `dir_geofences` (
  `geofence_id` int(10) UNSIGNED NOT NULL,
  `geofence` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `dir_geofences`
--

INSERT INTO `dir_geofences` (`geofence_id`, `geofence`) VALUES
(1, 'Елизовский автономный округ'),
(2, 'Вилючинский автономный округ'),
(3, 'Усть-Большерецкий автономный округ'),
(4, 'Соболевский автономный округ'),
(5, 'Быстринский автономный округ'),
(6, 'Мильковский автономный округ'),
(7, 'Тигильский автономный округ'),
(8, 'Карагинский автономный округ'),
(9, 'Олюторский автономный округ'),
(10, 'Пенжинский автономный округ'),
(11, 'Алеутский автономный округ'),
(12, 'Усть-Камчатский автономный округ');

-- --------------------------------------------------------

--
-- Структура таблицы `dir_images`
--

CREATE TABLE `dir_images` (
  `image_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `dir_images`
--

INSERT INTO `dir_images` (`image_id`, `image`) VALUES
(1, '000001'),
(2, '000002'),
(3, '000003'),
(4, '000004'),
(5, '000005'),
(6, '000006'),
(7, '000007');

-- --------------------------------------------------------

--
-- Структура таблицы `dir_organizations_types`
--

CREATE TABLE `dir_organizations_types` (
  `organization_type_id` int(10) UNSIGNED NOT NULL,
  `organization_type` varchar(100) NOT NULL,
  `organization_type_en` varchar(100) NOT NULL,
  `organization_type_image_id` int(10) UNSIGNED DEFAULT NULL,
  `organization_type_index_flag` tinyint(1) DEFAULT NULL,
  `organization_type_visit_flag` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `dir_organizations_types`
--

INSERT INTO `dir_organizations_types` (`organization_type_id`, `organization_type`, `organization_type_en`, `organization_type_image_id`, `organization_type_index_flag`, `organization_type_visit_flag`) VALUES
(1, 'Театры, концертные и кинозалы', 'halls', 1, 1, 1),
(2, 'Библиотеки', 'libraries', 2, 1, 1),
(3, 'Музеи', 'musems', 3, 1, 1),
(4, 'Центры культуры и досуга', 'art_house', 4, 1, 1),
(5, 'Образовательные организации', 'educations', 5, 0, 0),
(6, 'Хобби', 'hobby', 6, 0, 0),
(7, 'Традции и национальная культура', 'hobby', 7, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `dir_pages`
--

CREATE TABLE `dir_pages` (
  `page_id` int(10) UNSIGNED NOT NULL,
  `page` varchar(100) NOT NULL,
  `page_discription` varchar(255) DEFAULT NULL,
  `page_en` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `dir_pages`
--

INSERT INTO `dir_pages` (`page_id`, `page`, `page_discription`, `page_en`) VALUES
(1, 'Главная', NULL, 'index'),
(2, 'Посетить', NULL, 'visit'),
(3, 'Читать', NULL, 'read'),
(4, 'Афиша', NULL, 'event'),
(5, 'Образование', NULL, 'education');

-- --------------------------------------------------------

--
-- Структура таблицы `dir_publications_types`
--

CREATE TABLE `dir_publications_types` (
  `publication_type_id` int(10) UNSIGNED NOT NULL,
  `publication_type` varchar(100) NOT NULL,
  `publication_type_en` varchar(100) NOT NULL,
  `publication_type_discription` varchar(255) DEFAULT NULL,
  `publication_type_section_id` int(10) UNSIGNED NOT NULL,
  `publication_additional_field_flag` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `dir_publications_types`
--

INSERT INTO `dir_publications_types` (`publication_type_id`, `publication_type`, `publication_type_en`, `publication_type_discription`, `publication_type_section_id`, `publication_additional_field_flag`) VALUES
(1, 'Новости', 'news', NULL, 2, 1),
(2, 'Галерея', 'gallery', NULL, 1, 1),
(3, 'Организации', 'organizations', NULL, 1, 1),
(4, 'Коллективы', 'collectivies', NULL, 1, 1),
(5, 'Люди', 'people', NULL, 1, 1),
(6, 'Достопримечательности', 'attractions', NULL, 1, 1),
(7, 'Статьи', 'articles', NULL, 1, 1),
(8, 'События', 'events', NULL, 4, 1),
(9, 'Электронные книги', 'e-books', NULL, 1, 1),
(10, 'Конкурсы', 'contests', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `dir_sections`
--

CREATE TABLE `dir_sections` (
  `section_id` int(10) UNSIGNED NOT NULL,
  `section` varchar(100) NOT NULL,
  `section_en` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `dir_sections`
--

INSERT INTO `dir_sections` (`section_id`, `section`, `section_en`) VALUES
(1, 'Стандартный блок', 'standart'),
(2, 'Блок для новостей (с датой)', 'news'),
(3, 'Блок для новостей (вид 2)', 'news-2'),
(4, 'Блок для мероприятия', 'afisha'),
(5, 'Блок 5:7 (только 4)', 'organization'),
(6, 'Блок с 4 маленькими карточками и 1 большой', 'gallery'),
(7, 'Слайдер', 'slider'),
(8, 'Слайдбар', 'slidebar'),
(9, 'Образование', 'eduecation'),
(10, 'Электронные книги', 'e-books');

-- --------------------------------------------------------

--
-- Структура таблицы `dir_target_audiences`
--

CREATE TABLE `dir_target_audiences` (
  `target_audience_id` int(10) UNSIGNED NOT NULL,
  `target_audience` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `dir_target_audiences`
--

INSERT INTO `dir_target_audiences` (`target_audience_id`, `target_audience`) VALUES
(1, 'Для взрослых'),
(2, 'Для детей'),
(3, 'Для всей семьи'),
(4, 'Для молодежи'),
(5, 'Для старшего поколения'),
(6, 'Для лиц с ограниченными возможностями здоровья');

-- --------------------------------------------------------

--
-- Структура таблицы `dir_visiting_mode`
--

CREATE TABLE `dir_visiting_mode` (
  `visit_mode_id` int(10) UNSIGNED NOT NULL,
  `visit_mode` varchar(100) DEFAULT NULL,
  `visit_mode_discription` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `dir_visiting_mode`
--

INSERT INTO `dir_visiting_mode` (`visit_mode_id`, `visit_mode`, `visit_mode_discription`) VALUES
(1, 'Вход свободный', NULL),
(2, 'Цена билета', NULL),
(3, 'Пригласительные', NULL),
(4, 'По записи', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `fil_articles`
--

CREATE TABLE `fil_articles` (
  `fil_articles_id` int(10) UNSIGNED NOT NULL,
  `publication_id` int(10) UNSIGNED DEFAULT NULL,
  `article_author` varchar(100) DEFAULT NULL,
  `article_author_photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `fil_attractions`
--

CREATE TABLE `fil_attractions` (
  `fil_attractions_id` int(10) UNSIGNED NOT NULL,
  `publication_id` int(10) UNSIGNED DEFAULT NULL,
  `attraction_geofence_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `fil_collectivies`
--

CREATE TABLE `fil_collectivies` (
  `fil_collectivies_id` int(10) UNSIGNED NOT NULL,
  `publication_id` int(10) UNSIGNED DEFAULT NULL,
  `collective_director` varchar(100) DEFAULT NULL,
  `collective_site` varchar(100) DEFAULT NULL,
  `collective_phone` varchar(100) DEFAULT NULL,
  `collective_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `fil_contests`
--

CREATE TABLE `fil_contests` (
  `fil_contests_id` int(10) UNSIGNED NOT NULL,
  `publication_id` int(10) UNSIGNED DEFAULT NULL,
  `contest_site` varchar(100) DEFAULT NULL,
  `contest_phone` varchar(100) DEFAULT NULL,
  `contest_email` varchar(100) DEFAULT NULL,
  `contest_file` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `fil_events`
--

CREATE TABLE `fil_events` (
  `fil_events_id` int(10) UNSIGNED NOT NULL,
  `publication_id` int(10) UNSIGNED DEFAULT NULL,
  `event_target_audience_id` int(10) UNSIGNED DEFAULT NULL,
  `event_geofence_id` int(10) UNSIGNED DEFAULT NULL,
  `event_location_id` int(10) UNSIGNED DEFAULT NULL,
  `event_organizer_id` int(10) UNSIGNED DEFAULT NULL,
  `event_visit_mode_id` int(10) UNSIGNED DEFAULT NULL,
  `event_age_limit` char(2) DEFAULT NULL,
  `event_date_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `event_date_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `event_cost` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `fil_e_books`
--

CREATE TABLE `fil_e_books` (
  `fil_e_books_id` int(10) UNSIGNED NOT NULL,
  `publication_id` int(10) UNSIGNED DEFAULT NULL,
  `e_book_file` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `fil_gallery`
--

CREATE TABLE `fil_gallery` (
  `fil_gallery_id` int(10) UNSIGNED NOT NULL,
  `publication_id` int(10) UNSIGNED DEFAULT NULL,
  `gallery_author` varchar(100) DEFAULT NULL,
  `gallery_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gallery_location_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `fil_news`
--

CREATE TABLE `fil_news` (
  `fil_news_id` int(10) UNSIGNED NOT NULL,
  `publication_id` int(10) UNSIGNED DEFAULT NULL,
  `news_geofence_id` int(10) UNSIGNED DEFAULT NULL,
  `news_phone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `fil_organizations`
--

CREATE TABLE `fil_organizations` (
  `fil_organizations_id` int(10) UNSIGNED NOT NULL,
  `publication_id` int(10) UNSIGNED DEFAULT NULL,
  `organization_location` tinyint(1) DEFAULT NULL,
  `organization_organizer` tinyint(1) DEFAULT NULL,
  `organization_partner` tinyint(1) DEFAULT NULL,
  `organization_hide` tinyint(1) DEFAULT NULL,
  `organization_organization_type_id` int(10) UNSIGNED DEFAULT NULL,
  `organization_geofence_id` int(10) UNSIGNED DEFAULT NULL,
  `organization_director` varchar(100) DEFAULT NULL,
  `organization_work_mode` varchar(255) DEFAULT NULL,
  `organization_address` varchar(100) DEFAULT NULL,
  `organization_phone` varchar(100) DEFAULT NULL,
  `organization_site` varchar(100) DEFAULT NULL,
  `organization_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `fil_people`
--

CREATE TABLE `fil_people` (
  `fil_peoples_id` int(10) UNSIGNED NOT NULL,
  `publication_id` int(10) UNSIGNED DEFAULT NULL,
  `people_site` varchar(100) DEFAULT NULL,
  `people_phone` varchar(100) DEFAULT NULL,
  `people_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `publications`
--

CREATE TABLE `publications` (
  `publication_id` int(10) UNSIGNED NOT NULL,
  `publication_title` varchar(255) NOT NULL,
  `publication_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `publication_type_id` int(10) UNSIGNED NOT NULL,
  `publication_category_id` int(10) UNSIGNED DEFAULT NULL,
  `publication_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `publication_id` int(10) UNSIGNED DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `con_event_partners`
--
ALTER TABLE `con_event_partners`
  ADD PRIMARY KEY (`event_partners_event_id`,`event_partners_partner_id`),
  ADD KEY `event_partners_event_id` (`event_partners_event_id`),
  ADD KEY `event_partners_partner_id` (`event_partners_partner_id`);

--
-- Индексы таблицы `con_pages_publications_types`
--
ALTER TABLE `con_pages_publications_types`
  ADD PRIMARY KEY (`pages_publications_types_page_id`,`pages_publications_types_publication_type_id`),
  ADD KEY `pages_publications_types_page_id` (`pages_publications_types_page_id`),
  ADD KEY `pages_publications_types_publication_type_id` (`pages_publications_types_publication_type_id`);

--
-- Индексы таблицы `con_pages_sections_publications_types`
--
ALTER TABLE `con_pages_sections_publications_types`
  ADD PRIMARY KEY (`pages_sections_publications_types_serial_number`,`pages_sections_publications_types_page_id`),
  ADD KEY `pages_sections_publications_types_page_id` (`pages_sections_publications_types_page_id`),
  ADD KEY `pages_sections_publications_types_section_id` (`pages_sections_publications_types_section_id`),
  ADD KEY `pages_sections_publications_types_publication_type_id` (`pages_sections_publications_types_publication_type_id`),
  ADD KEY `pages_sections_publications_types_additional_block_id` (`pages_sections_publications_types_additional_block_id`),
  ADD KEY `pages_sections_publications_types_category_id` (`pages_sections_publications_types_category_id`);

--
-- Индексы таблицы `con_publications_additional_blocks`
--
ALTER TABLE `con_publications_additional_blocks`
  ADD PRIMARY KEY (`publications_additional_blocks_publication_id`,`publications_additional_blocks_additional_block_id`),
  ADD KEY `publications_additional_blocks_publication_id` (`publications_additional_blocks_publication_id`),
  ADD KEY `publications_additional_blocks_additional_block_id` (`publications_additional_blocks_additional_block_id`);

--
-- Индексы таблицы `con_publications_images`
--
ALTER TABLE `con_publications_images`
  ADD PRIMARY KEY (`publications_images_publication_id`,`publications_images_image_id`),
  ADD KEY `publications_images_publication_id` (`publications_images_publication_id`),
  ADD KEY `publications_images_image_id` (`publications_images_image_id`);

--
-- Индексы таблицы `con_publications_types_cetegories`
--
ALTER TABLE `con_publications_types_cetegories`
  ADD PRIMARY KEY (`publications_types_cetegories_publication_type_id`,`publications_types_cetegories_category_id`),
  ADD KEY `publications_types_cetegories_publication_type_id` (`publications_types_cetegories_publication_type_id`),
  ADD KEY `publications_types_cetegories_category_id` (`publications_types_cetegories_category_id`);

--
-- Индексы таблицы `dir_additional_blocks`
--
ALTER TABLE `dir_additional_blocks`
  ADD PRIMARY KEY (`additional_block_id`),
  ADD KEY `additional_block_additional_block_type_id` (`additional_block_additional_block_type_id`);

--
-- Индексы таблицы `dir_additional_blocks_types`
--
ALTER TABLE `dir_additional_blocks_types`
  ADD PRIMARY KEY (`additional_block_type_id`);

--
-- Индексы таблицы `dir_categories`
--
ALTER TABLE `dir_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_publication_type_id` (`category_publication_type_id`);

--
-- Индексы таблицы `dir_geofences`
--
ALTER TABLE `dir_geofences`
  ADD PRIMARY KEY (`geofence_id`);

--
-- Индексы таблицы `dir_images`
--
ALTER TABLE `dir_images`
  ADD PRIMARY KEY (`image_id`);

--
-- Индексы таблицы `dir_organizations_types`
--
ALTER TABLE `dir_organizations_types`
  ADD PRIMARY KEY (`organization_type_id`),
  ADD KEY `organization_type_image_id` (`organization_type_image_id`);

--
-- Индексы таблицы `dir_pages`
--
ALTER TABLE `dir_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Индексы таблицы `dir_publications_types`
--
ALTER TABLE `dir_publications_types`
  ADD PRIMARY KEY (`publication_type_id`),
  ADD KEY `publication_type_section_id` (`publication_type_section_id`);

--
-- Индексы таблицы `dir_sections`
--
ALTER TABLE `dir_sections`
  ADD PRIMARY KEY (`section_id`);

--
-- Индексы таблицы `dir_target_audiences`
--
ALTER TABLE `dir_target_audiences`
  ADD PRIMARY KEY (`target_audience_id`);

--
-- Индексы таблицы `dir_visiting_mode`
--
ALTER TABLE `dir_visiting_mode`
  ADD PRIMARY KEY (`visit_mode_id`);

--
-- Индексы таблицы `fil_articles`
--
ALTER TABLE `fil_articles`
  ADD PRIMARY KEY (`fil_articles_id`),
  ADD KEY `publication_id` (`publication_id`);

--
-- Индексы таблицы `fil_attractions`
--
ALTER TABLE `fil_attractions`
  ADD PRIMARY KEY (`fil_attractions_id`),
  ADD KEY `attraction_geofence_id` (`attraction_geofence_id`),
  ADD KEY `publication_id` (`publication_id`);

--
-- Индексы таблицы `fil_collectivies`
--
ALTER TABLE `fil_collectivies`
  ADD PRIMARY KEY (`fil_collectivies_id`),
  ADD KEY `publication_id` (`publication_id`);

--
-- Индексы таблицы `fil_contests`
--
ALTER TABLE `fil_contests`
  ADD PRIMARY KEY (`fil_contests_id`),
  ADD KEY `publication_id` (`publication_id`);

--
-- Индексы таблицы `fil_events`
--
ALTER TABLE `fil_events`
  ADD PRIMARY KEY (`fil_events_id`),
  ADD KEY `event_target_audience_id` (`event_target_audience_id`),
  ADD KEY `event_location_id` (`event_location_id`),
  ADD KEY `event_geofence_id` (`event_geofence_id`),
  ADD KEY `event_organizer_id` (`event_organizer_id`),
  ADD KEY `event_visit_mode_id` (`event_visit_mode_id`),
  ADD KEY `publication_id` (`publication_id`);

--
-- Индексы таблицы `fil_e_books`
--
ALTER TABLE `fil_e_books`
  ADD PRIMARY KEY (`fil_e_books_id`),
  ADD KEY `publication_id` (`publication_id`);

--
-- Индексы таблицы `fil_gallery`
--
ALTER TABLE `fil_gallery`
  ADD PRIMARY KEY (`fil_gallery_id`),
  ADD KEY `gallery_location_id` (`gallery_location_id`),
  ADD KEY `publication_id` (`publication_id`);

--
-- Индексы таблицы `fil_news`
--
ALTER TABLE `fil_news`
  ADD PRIMARY KEY (`fil_news_id`),
  ADD KEY `news_geofence_id` (`news_geofence_id`),
  ADD KEY `publication_id` (`publication_id`);

--
-- Индексы таблицы `fil_organizations`
--
ALTER TABLE `fil_organizations`
  ADD PRIMARY KEY (`fil_organizations_id`),
  ADD KEY `organization_organization_type_id` (`organization_organization_type_id`),
  ADD KEY `organization_geofence_id` (`organization_geofence_id`),
  ADD KEY `publication_id` (`publication_id`);

--
-- Индексы таблицы `fil_people`
--
ALTER TABLE `fil_people`
  ADD PRIMARY KEY (`fil_peoples_id`),
  ADD KEY `publication_id` (`publication_id`);

--
-- Индексы таблицы `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`publication_id`),
  ADD KEY `publication_type_id` (`publication_type_id`),
  ADD KEY `publication_category_id` (`publication_category_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `dir_additional_blocks`
--
ALTER TABLE `dir_additional_blocks`
  MODIFY `additional_block_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `dir_additional_blocks_types`
--
ALTER TABLE `dir_additional_blocks_types`
  MODIFY `additional_block_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `dir_categories`
--
ALTER TABLE `dir_categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `dir_geofences`
--
ALTER TABLE `dir_geofences`
  MODIFY `geofence_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `dir_images`
--
ALTER TABLE `dir_images`
  MODIFY `image_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `dir_organizations_types`
--
ALTER TABLE `dir_organizations_types`
  MODIFY `organization_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `dir_pages`
--
ALTER TABLE `dir_pages`
  MODIFY `page_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `dir_publications_types`
--
ALTER TABLE `dir_publications_types`
  MODIFY `publication_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `dir_sections`
--
ALTER TABLE `dir_sections`
  MODIFY `section_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `dir_target_audiences`
--
ALTER TABLE `dir_target_audiences`
  MODIFY `target_audience_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `dir_visiting_mode`
--
ALTER TABLE `dir_visiting_mode`
  MODIFY `visit_mode_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `fil_articles`
--
ALTER TABLE `fil_articles`
  MODIFY `fil_articles_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fil_attractions`
--
ALTER TABLE `fil_attractions`
  MODIFY `fil_attractions_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fil_collectivies`
--
ALTER TABLE `fil_collectivies`
  MODIFY `fil_collectivies_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fil_contests`
--
ALTER TABLE `fil_contests`
  MODIFY `fil_contests_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fil_events`
--
ALTER TABLE `fil_events`
  MODIFY `fil_events_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fil_e_books`
--
ALTER TABLE `fil_e_books`
  MODIFY `fil_e_books_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fil_gallery`
--
ALTER TABLE `fil_gallery`
  MODIFY `fil_gallery_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fil_news`
--
ALTER TABLE `fil_news`
  MODIFY `fil_news_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fil_organizations`
--
ALTER TABLE `fil_organizations`
  MODIFY `fil_organizations_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fil_people`
--
ALTER TABLE `fil_people`
  MODIFY `fil_peoples_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `publications`
--
ALTER TABLE `publications`
  MODIFY `publication_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `con_event_partners`
--
ALTER TABLE `con_event_partners`
  ADD CONSTRAINT `fk_event_partners_event_id` FOREIGN KEY (`event_partners_event_id`) REFERENCES `fil_events` (`fil_events_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_event_partners_partner_id` FOREIGN KEY (`event_partners_partner_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `con_pages_publications_types`
--
ALTER TABLE `con_pages_publications_types`
  ADD CONSTRAINT `fk_pages_publications_types_page_id` FOREIGN KEY (`pages_publications_types_page_id`) REFERENCES `dir_pages` (`page_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pages_publications_types_publication_type_id` FOREIGN KEY (`pages_publications_types_publication_type_id`) REFERENCES `dir_publications_types` (`publication_type_id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `con_pages_sections_publications_types`
--
ALTER TABLE `con_pages_sections_publications_types`
  ADD CONSTRAINT `fk_pages_sections_publications_types_additional_block_id` FOREIGN KEY (`pages_sections_publications_types_additional_block_id`) REFERENCES `dir_additional_blocks` (`additional_block_id`),
  ADD CONSTRAINT `fk_pages_sections_publications_types_category_id` FOREIGN KEY (`pages_sections_publications_types_category_id`) REFERENCES `dir_categories` (`category_id`),
  ADD CONSTRAINT `fk_pages_sections_publications_types_page_id` FOREIGN KEY (`pages_sections_publications_types_page_id`) REFERENCES `dir_pages` (`page_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pages_sections_publications_types_publication_type_id` FOREIGN KEY (`pages_sections_publications_types_publication_type_id`) REFERENCES `dir_publications_types` (`publication_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pages_sections_publications_types_section_id` FOREIGN KEY (`pages_sections_publications_types_section_id`) REFERENCES `dir_sections` (`section_id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `con_publications_additional_blocks`
--
ALTER TABLE `con_publications_additional_blocks`
  ADD CONSTRAINT `fk_publications_additional_blocks_additional_block_id` FOREIGN KEY (`publications_additional_blocks_additional_block_id`) REFERENCES `dir_additional_blocks` (`additional_block_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_publications_additional_blocks_publication_id` FOREIGN KEY (`publications_additional_blocks_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `con_publications_images`
--
ALTER TABLE `con_publications_images`
  ADD CONSTRAINT `fk_publications_images_image_id` FOREIGN KEY (`publications_images_image_id`) REFERENCES `dir_images` (`image_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_publications_images_publication_id` FOREIGN KEY (`publications_images_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `con_publications_types_cetegories`
--
ALTER TABLE `con_publications_types_cetegories`
  ADD CONSTRAINT `fk_publications_types_cetegories_category_id` FOREIGN KEY (`publications_types_cetegories_category_id`) REFERENCES `dir_categories` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_publications_types_cetegories_publication_type_id` FOREIGN KEY (`publications_types_cetegories_publication_type_id`) REFERENCES `dir_publications_types` (`publication_type_id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dir_additional_blocks`
--
ALTER TABLE `dir_additional_blocks`
  ADD CONSTRAINT `dir_additional_blocks_ibfk_1` FOREIGN KEY (`additional_block_additional_block_type_id`) REFERENCES `dir_additional_blocks_types` (`additional_block_type_id`);

--
-- Ограничения внешнего ключа таблицы `dir_categories`
--
ALTER TABLE `dir_categories`
  ADD CONSTRAINT `dir_categories_ibfk_1` FOREIGN KEY (`category_publication_type_id`) REFERENCES `dir_publications_types` (`publication_type_id`);

--
-- Ограничения внешнего ключа таблицы `dir_organizations_types`
--
ALTER TABLE `dir_organizations_types`
  ADD CONSTRAINT `dir_organizations_types_ibfk_1` FOREIGN KEY (`organization_type_image_id`) REFERENCES `dir_images` (`image_id`);

--
-- Ограничения внешнего ключа таблицы `dir_publications_types`
--
ALTER TABLE `dir_publications_types`
  ADD CONSTRAINT `dir_publications_types_ibfk_1` FOREIGN KEY (`publication_type_section_id`) REFERENCES `dir_sections` (`section_id`);

--
-- Ограничения внешнего ключа таблицы `fil_articles`
--
ALTER TABLE `fil_articles`
  ADD CONSTRAINT `fil_articles_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`);

--
-- Ограничения внешнего ключа таблицы `fil_attractions`
--
ALTER TABLE `fil_attractions`
  ADD CONSTRAINT `fil_attractions_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`),
  ADD CONSTRAINT `fil_attractions_ibfk_2` FOREIGN KEY (`attraction_geofence_id`) REFERENCES `dir_geofences` (`geofence_id`);

--
-- Ограничения внешнего ключа таблицы `fil_collectivies`
--
ALTER TABLE `fil_collectivies`
  ADD CONSTRAINT `fil_collectivies_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`);

--
-- Ограничения внешнего ключа таблицы `fil_contests`
--
ALTER TABLE `fil_contests`
  ADD CONSTRAINT `fil_contests_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`);

--
-- Ограничения внешнего ключа таблицы `fil_events`
--
ALTER TABLE `fil_events`
  ADD CONSTRAINT `fil_events_ibfk_1` FOREIGN KEY (`event_target_audience_id`) REFERENCES `dir_target_audiences` (`target_audience_id`),
  ADD CONSTRAINT `fil_events_ibfk_2` FOREIGN KEY (`event_location_id`) REFERENCES `publications` (`publication_id`),
  ADD CONSTRAINT `fil_events_ibfk_3` FOREIGN KEY (`event_geofence_id`) REFERENCES `dir_geofences` (`geofence_id`),
  ADD CONSTRAINT `fil_events_ibfk_4` FOREIGN KEY (`event_visit_mode_id`) REFERENCES `dir_visiting_mode` (`visit_mode_id`),
  ADD CONSTRAINT `fil_events_ibfk_5` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`),
  ADD CONSTRAINT `fil_events_ibfk_6` FOREIGN KEY (`event_organizer_id`) REFERENCES `publications` (`publication_id`);

--
-- Ограничения внешнего ключа таблицы `fil_e_books`
--
ALTER TABLE `fil_e_books`
  ADD CONSTRAINT `fil_e_books_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`);

--
-- Ограничения внешнего ключа таблицы `fil_gallery`
--
ALTER TABLE `fil_gallery`
  ADD CONSTRAINT `fil_gallery_ibfk_1` FOREIGN KEY (`gallery_location_id`) REFERENCES `publications` (`publication_id`),
  ADD CONSTRAINT `fil_gallery_ibfk_2` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`);

--
-- Ограничения внешнего ключа таблицы `fil_news`
--
ALTER TABLE `fil_news`
  ADD CONSTRAINT `fil_news_ibfk_1` FOREIGN KEY (`news_geofence_id`) REFERENCES `dir_geofences` (`geofence_id`),
  ADD CONSTRAINT `fil_news_ibfk_2` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`);

--
-- Ограничения внешнего ключа таблицы `fil_organizations`
--
ALTER TABLE `fil_organizations`
  ADD CONSTRAINT `fil_organizations_ibfk_1` FOREIGN KEY (`organization_organization_type_id`) REFERENCES `dir_organizations_types` (`organization_type_id`),
  ADD CONSTRAINT `fil_organizations_ibfk_2` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`),
  ADD CONSTRAINT `fil_organizations_ibfk_3` FOREIGN KEY (`organization_geofence_id`) REFERENCES `dir_geofences` (`geofence_id`);

--
-- Ограничения внешнего ключа таблицы `fil_people`
--
ALTER TABLE `fil_people`
  ADD CONSTRAINT `fil_people_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`);

--
-- Ограничения внешнего ключа таблицы `publications`
--
ALTER TABLE `publications`
  ADD CONSTRAINT `publications_ibfk_1` FOREIGN KEY (`publication_type_id`) REFERENCES `dir_publications_types` (`publication_type_id`),
  ADD CONSTRAINT `publications_ibfk_2` FOREIGN KEY (`publication_category_id`) REFERENCES `dir_categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
