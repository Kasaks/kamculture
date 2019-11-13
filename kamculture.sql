-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 13 2019 г., 00:51
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
(1, 10),
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
(3, 'Галерея', NULL, 1, 6, 2, 6, NULL),
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

--
-- Дамп данных таблицы `con_publications_additional_blocks`
--

INSERT INTO `con_publications_additional_blocks` (`publications_additional_blocks_publication_id`, `publications_additional_blocks_additional_block_id`) VALUES
(61, 1),
(62, 1),
(63, 1),
(64, 1);

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

--
-- Дамп данных таблицы `con_publications_images`
--

INSERT INTO `con_publications_images` (`publications_images_publication_id`, `publications_images_image_id`, `publications_images_main_image_flag`, `publications_images_additional_block_image_flag`) VALUES
(1, 8, 1, 0),
(1, 9, 0, 0),
(1, 10, 0, 0),
(1, 11, 0, 0),
(1, 12, 0, 0),
(2, 13, 1, 0),
(3, 14, 1, 0),
(3, 15, 0, 0),
(4, 16, 1, 0),
(5, 17, 1, 0),
(5, 18, 0, 0),
(5, 19, 0, 0),
(5, 20, 0, 0),
(5, 21, 0, 0),
(5, 22, 0, 0),
(5, 23, 0, 0),
(6, 24, 1, 0),
(7, 25, 1, 0),
(7, 26, 0, 0),
(7, 27, 0, 0),
(7, 28, 0, 0),
(7, 29, 0, 0),
(7, 30, 0, 0),
(8, 31, 1, 0),
(8, 32, 0, 0),
(8, 33, 0, 0),
(8, 34, 0, 0),
(9, 35, 1, 0),
(10, 36, 1, 0),
(10, 37, 0, 0),
(10, 38, 0, 0),
(10, 39, 0, 0),
(10, 40, 0, 0),
(10, 41, 0, 0),
(11, 42, 1, 0),
(11, 43, 0, 0),
(12, 44, 1, 0),
(12, 45, 0, 0),
(13, 46, 1, 0),
(13, 47, 0, 0),
(14, 48, 1, 0),
(14, 49, 0, 0),
(14, 50, 0, 0),
(14, 51, 0, 0),
(14, 52, 0, 0),
(14, 53, 0, 0),
(15, 54, 1, 0),
(16, 55, 1, 0),
(16, 56, 0, 0),
(17, 57, 1, 0),
(17, 58, 0, 0),
(18, 59, 1, 0),
(18, 60, 0, 0),
(19, 61, 1, 0),
(19, 62, 0, 0),
(19, 63, 0, 0),
(19, 64, 0, 0),
(19, 65, 0, 0),
(19, 66, 0, 0),
(19, 67, 0, 0),
(19, 68, 0, 0),
(20, 69, 1, 0),
(20, 70, 0, 0),
(20, 71, 0, 0),
(20, 72, 0, 0),
(20, 73, 0, 0),
(20, 74, 0, 0),
(20, 75, 0, 0),
(21, 76, 1, 0),
(21, 77, 0, 0),
(21, 78, 0, 0),
(21, 79, 0, 0),
(21, 80, 0, 0),
(21, 81, 0, 0),
(21, 82, 0, 0),
(22, 83, 1, 0),
(22, 84, 0, 0),
(22, 85, 0, 0),
(22, 86, 0, 0),
(22, 87, 0, 0),
(22, 88, 0, 0),
(22, 89, 0, 0),
(22, 90, 0, 0),
(22, 91, 0, 0),
(22, 92, 0, 0),
(22, 93, 0, 0),
(23, 94, 1, 0),
(23, 95, 0, 0),
(23, 96, 0, 0),
(23, 97, 0, 0),
(23, 98, 0, 0),
(23, 99, 0, 0),
(23, 100, 0, 0),
(23, 101, 0, 0),
(24, 102, 1, 0),
(24, 103, 0, 0),
(24, 104, 0, 0),
(24, 105, 0, 0),
(24, 106, 0, 0),
(24, 107, 0, 0),
(24, 108, 0, 0),
(25, 109, 1, 0),
(25, 110, 0, 0),
(25, 111, 0, 0),
(25, 112, 0, 0),
(25, 113, 0, 0),
(25, 114, 0, 0),
(25, 115, 0, 0),
(26, 116, 1, 0),
(26, 117, 0, 0),
(26, 118, 0, 0),
(26, 119, 0, 0),
(26, 120, 0, 0),
(26, 121, 0, 0),
(26, 122, 0, 0),
(26, 123, 0, 0),
(26, 124, 0, 0),
(26, 125, 0, 0),
(26, 126, 0, 0),
(26, 127, 0, 0),
(26, 128, 0, 0),
(26, 129, 0, 0),
(26, 130, 0, 0),
(26, 131, 0, 0),
(26, 132, 0, 0),
(26, 133, 0, 0),
(27, 134, 1, 0),
(27, 135, 0, 0),
(27, 136, 0, 0),
(27, 137, 0, 0),
(27, 138, 0, 0),
(27, 139, 0, 0),
(27, 140, 0, 0),
(27, 141, 0, 0),
(27, 142, 0, 0),
(27, 143, 0, 0),
(27, 144, 0, 0),
(27, 145, 0, 0),
(27, 146, 0, 0),
(27, 147, 0, 0),
(27, 148, 0, 0),
(27, 149, 0, 0),
(27, 150, 0, 0),
(27, 151, 0, 0),
(27, 152, 0, 0),
(27, 153, 0, 0),
(28, 154, 1, 0),
(29, 155, 1, 0),
(30, 156, 1, 0),
(31, 157, 1, 0),
(32, 158, 1, 0),
(33, 159, 1, 0),
(34, 160, 1, 0),
(35, 161, 1, 0),
(36, 162, 1, 0),
(37, 163, 1, 0),
(38, 164, 1, 0),
(39, 165, 1, 0),
(39, 166, 0, 0),
(40, 167, 1, 0),
(41, 168, 1, 0),
(41, 169, 0, 0),
(42, 170, 1, 0),
(42, 171, 0, 0),
(42, 172, 0, 0),
(43, 173, 1, 0),
(43, 174, 0, 0),
(43, 175, 0, 0),
(44, 176, 1, 0),
(44, 177, 0, 0),
(44, 178, 0, 0),
(45, 179, 1, 0),
(45, 180, 0, 0),
(45, 181, 0, 0),
(45, 182, 0, 0),
(45, 183, 0, 0),
(45, 184, 0, 0),
(45, 185, 0, 0),
(45, 186, 0, 0),
(46, 187, 1, 0),
(46, 188, 0, 0),
(46, 189, 0, 0),
(47, 190, 1, 0),
(47, 191, 0, 0),
(47, 192, 0, 0),
(47, 193, 0, 0),
(48, 194, 1, 0),
(48, 195, 0, 0),
(48, 196, 0, 0),
(49, 197, 1, 0),
(49, 198, 0, 0),
(49, 199, 0, 0),
(50, 200, 1, 0),
(50, 201, 0, 0),
(51, 202, 1, 0),
(52, 203, 1, 0),
(53, 204, 1, 0),
(54, 205, 1, 0),
(55, 206, 1, 0),
(56, 202, 1, 0),
(57, 203, 1, 0),
(58, 204, 1, 0),
(59, 205, 1, 0),
(60, 206, 1, 0),
(61, 207, 0, 1),
(61, 208, 1, 0),
(62, 209, 0, 1),
(62, 210, 1, 0),
(63, 211, 0, 1),
(63, 212, 1, 0),
(64, 213, 0, 1),
(64, 214, 1, 0);

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
(7, '000007'),
(8, '1'),
(9, '2'),
(10, '3'),
(11, '4'),
(12, '5'),
(13, '1'),
(14, '1'),
(15, '2'),
(16, '1'),
(17, '1'),
(18, '2'),
(19, '3'),
(20, '4'),
(21, '5'),
(22, '6'),
(23, '7'),
(24, '1'),
(25, '1'),
(26, '2'),
(27, '3'),
(28, '4'),
(29, '5'),
(30, '6'),
(31, '1'),
(32, '2'),
(33, '3'),
(34, '4'),
(35, '1'),
(36, '1'),
(37, '2'),
(38, '3'),
(39, '4'),
(40, '5'),
(41, '6'),
(42, '1'),
(43, '2'),
(44, '1'),
(45, '2'),
(46, '1'),
(47, '2'),
(48, '1'),
(49, '2'),
(50, '3'),
(51, '4'),
(52, '5'),
(53, '6'),
(54, '1'),
(55, '1'),
(56, '2'),
(57, '1'),
(58, '2'),
(59, '1'),
(60, '2'),
(61, '1'),
(62, '2'),
(63, '3'),
(64, '4'),
(65, '5'),
(66, '6'),
(67, '7'),
(68, '8'),
(69, '1'),
(70, '2'),
(71, '3'),
(72, '4'),
(73, '5'),
(74, '6'),
(75, '7'),
(76, '1'),
(77, '2'),
(78, '3'),
(79, '4'),
(80, '5'),
(81, '6'),
(82, '7'),
(83, '1'),
(84, '2'),
(85, '3'),
(86, '4'),
(87, '5'),
(88, '6'),
(89, '7'),
(90, '8'),
(91, '9'),
(92, '10'),
(93, '11'),
(94, '1'),
(95, '2'),
(96, '3'),
(97, '4'),
(98, '5'),
(99, '6'),
(100, '7'),
(101, '8'),
(102, '1'),
(103, '2'),
(104, '3'),
(105, '4'),
(106, '5'),
(107, '6'),
(108, '7'),
(109, '1'),
(110, '2'),
(111, '3'),
(112, '4'),
(113, '5'),
(114, '6'),
(115, '7'),
(116, '1'),
(117, '2'),
(118, '3'),
(119, '4'),
(120, '5'),
(121, '6'),
(122, '7'),
(123, '8'),
(124, '9'),
(125, '10'),
(126, '11'),
(127, '12'),
(128, '13'),
(129, '14'),
(130, '15'),
(131, '16'),
(132, '17'),
(133, '18'),
(134, '1'),
(135, '2'),
(136, '3'),
(137, '4'),
(138, '5'),
(139, '6'),
(140, '7'),
(141, '8'),
(142, '9'),
(143, '10'),
(144, '11'),
(145, '12'),
(146, '13'),
(147, '14'),
(148, '15'),
(149, '16'),
(150, '17'),
(151, '18'),
(152, '19'),
(153, '20'),
(154, '1'),
(155, '1'),
(156, '1'),
(157, '1'),
(158, '1'),
(159, '1'),
(160, '1'),
(161, '1'),
(162, '1'),
(163, '1'),
(164, '1'),
(165, '1'),
(166, '2'),
(167, '1'),
(168, '1'),
(169, '2'),
(170, '1'),
(171, '2'),
(172, '3'),
(173, '1'),
(174, '2'),
(175, '3'),
(176, '1'),
(177, '2'),
(178, '3'),
(179, '1'),
(180, '2'),
(181, '3'),
(182, '4'),
(183, '5'),
(184, '6'),
(185, '7'),
(186, '8'),
(187, '1'),
(188, '2'),
(189, '3'),
(190, '1'),
(191, '2'),
(192, '3'),
(193, '4'),
(194, '1'),
(195, '2'),
(196, '3'),
(197, '1'),
(198, '2'),
(199, '3'),
(200, '1'),
(201, '2'),
(202, '1'),
(203, '1'),
(204, '1'),
(205, '1'),
(206, '1'),
(207, '1'),
(208, '2'),
(209, '1'),
(210, '2'),
(211, '1'),
(212, '2'),
(213, '1'),
(214, '2');

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
(8, 'События', 'event', NULL, 4, 1),
(9, 'Электронные книги', 'e-books', NULL, 1, 1),
(10, 'Конкурсы', 'contests', NULL, 1, 1),
(11, 'Публикация в дополнительный блок', 'additional_publication', NULL, 7, 0);

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
(9, 'Образование', 'education'),
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

--
-- Дамп данных таблицы `fil_attractions`
--

INSERT INTO `fil_attractions` (`fil_attractions_id`, `publication_id`, `attraction_geofence_id`) VALUES
(1, 46, 1),
(2, 47, 1),
(3, 48, 1),
(4, 49, 1),
(5, 50, 1);

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

--
-- Дамп данных таблицы `fil_collectivies`
--

INSERT INTO `fil_collectivies` (`fil_collectivies_id`, `publication_id`, `collective_director`, `collective_site`, `collective_phone`, `collective_email`) VALUES
(1, 41, 'Куликова Наталья Владимировна', 'artpk.net', '23-37-25', 'lira2005pk@yandex.ru'),
(2, 42, 'Ткач Наталья Владимировна', '', '47-82-47', 'tkach_kkfo@mail.ru'),
(3, 43, 'Ткач Наталья Владимировна', '', '47-82-47', 'tkach_kkfo@mail.ru'),
(4, 44, 'Козлова Анна Александровна', '', '23-84-79', 'seroglazka41@mail.ru'),
(5, 45, 'Ткач Наталья Владимировна', '', '47-82-47', 'tkach_kkfo@mail.ru');

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

--
-- Дамп данных таблицы `fil_contests`
--

INSERT INTO `fil_contests` (`fil_contests_id`, `publication_id`, `contest_site`, `contest_phone`, `contest_email`, `contest_file`) VALUES
(1, 33, '', '', '', ''),
(2, 34, '', '', '', ''),
(3, 35, '', '+7 (968) 441-84-51', 'info@handswomen.ru', ''),
(4, 36, 'muzforall.ru', '+7 914 223-99-80', 'muzforall1322@mail.ru', ''),
(5, 37, '', '', '', ''),
(6, 38, 'kinoideti.ru', '', '', ''),
(7, 39, 'www.arlekinspb.ru', '', '', ''),
(8, 40, 'www.vmgf.ru', '', '', '');

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

--
-- Дамп данных таблицы `fil_events`
--

INSERT INTO `fil_events` (`fil_events_id`, `publication_id`, `event_target_audience_id`, `event_geofence_id`, `event_location_id`, `event_organizer_id`, `event_visit_mode_id`, `event_age_limit`, `event_date_start`, `event_date_end`, `event_cost`) VALUES
(1, 51, 3, 1, 17, 17, 1, '12', '2018-12-14 12:00:00', '2019-12-14 12:00:00', 0),
(2, 52, 3, 1, 12, 12, 1, '6', '2019-06-09 04:23:01', '2019-06-09 06:00:00', 0),
(3, 53, 3, 1, 12, 12, 2, '0', '2019-06-08 20:40:55', '2019-07-09 06:00:00', 100),
(4, 54, 3, 1, 17, 17, 2, '0', '2019-06-08 20:40:58', '2019-06-23 06:00:00', 80),
(5, 55, 3, 1, 17, 17, 2, '0', '2019-06-08 20:41:00', '2019-06-07 06:00:00', 80),
(6, 56, 3, 1, 17, 17, 1, '12', '2018-12-14 12:00:00', '2019-12-14 12:00:00', 0),
(7, 57, 3, 1, 12, 12, 1, '6', '2019-06-08 20:41:03', '2019-12-30 12:00:00', 0),
(8, 58, 3, 1, 12, 12, 2, '0', '2019-06-08 20:41:06', '2019-07-09 06:00:00', 100),
(9, 59, 3, 1, 17, 17, 2, '0', '2019-06-08 20:41:09', '2019-06-23 06:00:00', 80),
(10, 60, 3, 1, 17, 17, 2, '0', '2019-06-08 20:41:10', '2019-06-07 06:00:00', 80);

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

--
-- Дамп данных таблицы `fil_gallery`
--

INSERT INTO `fil_gallery` (`fil_gallery_id`, `publication_id`, `gallery_author`, `gallery_date`, `gallery_location_id`) VALUES
(1, 19, '', '0000-00-00 00:00:00', 18),
(2, 20, '', '0000-00-00 00:00:00', NULL),
(3, 21, '', '0000-00-00 00:00:00', 18),
(4, 22, '', '0000-00-00 00:00:00', NULL),
(5, 23, 'Вадим Жук', '0000-00-00 00:00:00', 18),
(6, 24, '', '0000-00-00 00:00:00', NULL),
(7, 25, '', '0000-00-00 00:00:00', NULL),
(8, 26, '', '0000-00-00 00:00:00', NULL),
(9, 27, '', '0000-00-00 00:00:00', NULL);

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

--
-- Дамп данных таблицы `fil_news`
--

INSERT INTO `fil_news` (`fil_news_id`, `publication_id`, `news_geofence_id`, `news_phone`) VALUES
(1, 1, 1, ''),
(2, 2, 1, '+7 (4152) 42-75-36'),
(3, 3, 1, '+7 (4152) 25-19-69'),
(4, 4, 1, '+7 (4152) 25-23-55'),
(5, 5, 1, '+7 (4152) 30-52-99'),
(6, 6, 1, '+7 (999) 080-20-91'),
(7, 7, 1, ''),
(8, 8, 1, '+7 (4152) 42-62-03'),
(9, 9, 1, '');

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

--
-- Дамп данных таблицы `fil_organizations`
--

INSERT INTO `fil_organizations` (`fil_organizations_id`, `publication_id`, `organization_location`, `organization_organizer`, `organization_partner`, `organization_hide`, `organization_organization_type_id`, `organization_geofence_id`, `organization_director`, `organization_work_mode`, `organization_address`, `organization_phone`, `organization_site`, `organization_email`) VALUES
(1, 10, 1, 0, 1, 0, 1, 1, 'Акмаева Марина Анатольевна', 'ПН – ПТ 09.00. – 18.00', '683024 г. Петропавловск-Камчатский, пр. Рыбаков 7', '323725', 'artpk.net', 'lira2005pk@yandex.ru'),
(2, 11, 1, 1, 1, 0, 2, 1, 'Елена Сергеевна Левин', 'Абонемент	11-00 - 20-00\r\n						Читальные залы	10-00 - 20-00\r\n	\r\n						В субботу и воскресенье:\r\n							11-00 - 19-00\r\n	\r\n						Выходной - пятница\r\n						В летний период с 1 июля по 30 сентября\r\n						библиотека работает с 11-00 до 19-00\r\n						Выходной - ', '683031 г. Петропавловск-Камчатский, пр-т К. Маркса 33/1', '25-23-55', 'vk.com/kkamlib ', 'ils@mail.kamlib.ru'),
(3, 12, 1, 1, 0, 0, 3, 1, 'Конышева Наталья Александровна ', 'среда, четверг, пятница, суббота, воскресенье с 10.30 ч. до 18.00 ч. \r\n						Первая суббота каждого месяца – санитарный день. \r\n						Последняя пятница месяца – санитарный день. \r\n						', '683001, ул. Ленинская, 20, Петропавловск-Камчатский, Камчатский край, Камчатский край', '41-26-44 ', 'www.kamchatka-museum.ru ', 'museum@mail.kamchatka.ru '),
(4, 13, 1, 1, 0, 0, 1, 1, 'Водясова Ольга Александровна', 'ПН-ПТ, 9.15-17.30, перерыв  13.00-13.30 (административная часть)\r\nПН-ВС, 10.00-19.00, перерыв 14.00-15.00 (касса)\r\n', '683000, г.Петропавловск-Камчатский, ул.Ленинская, д.75', '420090', 'www.kamteatr.com', ' kanat2006@yandex.ru'),
(5, 14, 1, 1, 0, 0, 4, 1, 'Козлова Анна Александровна', 'понедельник – суббота 09:00 – 22:00, воскресенье – по отдельному графику.', 'г. Петропавловск-Камчатский, ул. Космонавтов, д.43', '23-84-79', 'www.seroglazka-ckd.ru', 'seroglazka41@mail.ru'),
(6, 15, 1, 1, 0, 0, 1, 1, 'Кужелев Зиновий Ефимович', 'ВТ-ВС, 11:00-17:00', 'Ул. Максутова, 42, Петропавловск-Камчатский, Камчатский край', ') 42-68-48', 'kamteatr-kukol.com', ' kampuppet41@mail.ru'),
(7, 16, 1, 0, 0, 0, 7, 1, 'Елизарова Анжела Викторовна', '', 'пр. Победы, 67, Петропавловск-Камчатский, Камчатский край', '30-88-88', 'kamkino.ru', ''),
(8, 17, 1, 0, 0, 0, 7, 1, 'Биковец Татьяна Васильевна', 'Каждый день с 10:00 до 18:00. Без перерыва на обед', 'ул. Ленинская, 62', '42-30-25 ', 'kamartmuseum.ru', 'hudmuseum@mail.kamchatka.ru'),
(9, 18, 1, 0, 0, 0, 7, 1, 'Красноносеньких Александр Владимирович', '', 'ул. Ленинградская, 100, Петропавловск-Камчатский, Камчатский край', '46-82-46 ', 'kammusic.ru/', 'kkfo@mail.ru');

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

--
-- Дамп данных таблицы `fil_people`
--

INSERT INTO `fil_people` (`fil_peoples_id`, `publication_id`, `people_site`, `people_phone`, `people_email`) VALUES
(1, 28, '', '', ''),
(2, 29, 'vk.com/id33407513', '', ''),
(3, 30, '', '', ''),
(4, 31, '', '', ''),
(5, 32, '', '', '');

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

--
-- Дамп данных таблицы `publications`
--

INSERT INTO `publications` (`publication_id`, `publication_title`, `publication_date`, `publication_type_id`, `publication_category_id`, `publication_text`) VALUES
(1, 'Краевой семейный фестиваль «Радость быть вместе!» посетили более 500 человек\r\n', '2019-05-27 00:58:35', 1, NULL, 'Яркое и насыщенное мероприятие. приуроченное к празднованию Международного дня семьи, прошло в Камчатской краевой научной библиотеке им. С.П. Крашенинникова 18 мая. Библиотека в этот день преобразилась в огромный парк оригинального досуга, нескучного обучения и необычных интерактивных развлечений.\r\n\r\nСквер перед библиотекой стал площадкой для проведения практического занятия на местности. Юные туристы тренировались в прохождении канатной полосы препятствий и осваивали веревочный курс. Парковка у входа в библиотеку стала местом знакомства с гигантскими внедорожниками величиной с гараж, а вестибюль подарил гостям угощение – шоколадный фонтан с зефиром и сахарную вату.\r\n\r\nШахматный турнир, собирание пазлов на время, литературный вернисаж, программирование квадрокоптера – гости быстро разбрелись по площадкам, с удовольствием выбирая то, что по душе.\r\n\r\nШоу-программа «Круче всех!» предлагала проверить себя на ловкость и глазомер, измерить свой рост в книгах, а тем, кто любит покричать и попрыгать – игры «Шумометр» и «Ракета». Ценители логики и эрудиции переходили в зону напольной игры «Я хочу все знать», где демонстрировали обширные знания пословиц, поговорок и сказок. Поклонники милитари-эстетики надолго оставались в зале с выставкой страйкбольного и лазерного оружия, где любой мог не только примерить бронежилет или опробовать безопасные стрелы из лука, но и разобраться в работе лазерного оружия.\r\n\r\nНа многочисленных мастер-классах с нетерпением ждали тех, кому ближе мирные развлечения. Яркая тагильская роспись маслом, пошив юбки-солнца, изготовление цветочных букетов в самых разных техниках: из лент, гофрированной бумаги, фольги или бисера, создание нитяных кукол и панно из соленого теста – всё это и многое другое вдохновило посетителей фестиваля на творчество. Мастер-классы стали прекрасным источником самовыражения, позволив ощутить себя художником по росписи керамики, каллиграфом и даже парикмахером.\r\n\r\nВ Год театра ни одно событие не обходится без приобщения гостей к этому сложному виду искусства. Мастерами перевоплощений стали даже самые маленькие гости, принявшие участие в театральных мастер-классах «Я – артист!» и «Пчелы и медведь». А в актовом зале в рамках концертной программы «Театр, где играем мы» выступили яркие таланты театральной студии «Затейники» и детского театра «Музыкальная шкатулка»: молодые артисты поставили миниатюру «Морозко» и сказку «Муха-Цокотуха», блестяще сыграв сказочных персонажей.\r\n\r\nА между тем персонажи из сказок стали предметом серьезных размышлений для участников викторины «Сказки и пьесы на сцене театра», а также для создателей арт-объекта «В мире книг», где каждый раскрашенный персонаж отправлялся в путешествие по земному шару.\r\n\r\n«Мы знаем о Камчатке все» – смелое название краеведческой викторины для тех, кто постарше, не оставило равнодушными посетителей фестиваля. Помимо нее в отделе краеведения маленькие следопыты разгадывали тайны «Лесного театра», узнавая зверей из Красной книги. Совсем юные краеведы с интересом слушали сказку о глупом Кутхе, которого чуть не погубили мыши.\r\n\r\nВ то время как дети находили занятие по душе, у родителей была возможность получить ответы на давно волнующие вопросы. В этом им помогали квалифицированные специалисты. «Как весело и с пользой провести время с ребенком» – именно так назывался интерактивный тренинг детского психолога Татьяны Барановой. За круглым столом, в уютной атмосфере психолог беседовала с гостями о вопросах, которые касаются каждого родителя. Родители могли задать свои вопросы и специально приглашенным дефектологу и логопеду.\r\n\r\nРешению проблем будущего была всецело посвящена площадка технопарка «Кванториум». Юные гости фестиваля могли попробовать управлять виртуальным дроном, создать сувенирный календарь-додекаэдр, нарисовать 3D рисунок в очках виртуальной реальности и заставить двигаться механизм буквально с помощью воды и знания законов химии. Развитию программирования, интеллекта и памяти были посвящены также площадки «Школы скорочтения и развития интеллекта». Мнемонические техники и методики развития эмоционального интеллекта оказались интересны большинству посетителей. А развитию хозяйственности и бытовой эрудиции был посвящен «Семейный портрет», где мамам и бабушкам предлагалось тянуть из чугунка вопросы по кухням народов мира, а ведущие в национальных славянских костюмах угощали детей и родителей вкусным чаем.\r\n\r\nУкрасила мероприятие выставка авторской куклы «Премьера». Самые разные куклы, от хрупких фаянсовых до деревянных кукол-колокольчиков, радовали глаз посетителей фестиваля. Многие, вдохновившись, отправились на мастер-классы по росписи кукол из гипса и изготовлению бижутерии из фурнитуры. Атмосфера творчества, веселья и новых открытий для всех и каждого не покидала семейный фестиваль ни на миг.\r\n\r\nКамчатская краевая научная библиотека им. С.П. Крашенинникова искренне благодарит своих партнеров – тех, без чьей помощи этот праздник не стал бы таким ярким и незабываемым: семейный магазин «Бархатята», общественную некоммерческую организацию «Квадратное колесо», студию дизайна и шитья «Fabrika», детский досуговый клуб «Осьминожки», объединение «Макраме и ковроткачество» Камчатского двореца детского творчества, ART-студию «Ангел», компанию «ВОкс», студию праздников «Страна чудес», театральную студию «Затейники», корпорацию праздников «Гудвин», Детский центр «Растём вместе», Школу скорочтения и развития интеллекта «IQ007», Камчатский дом детского и юношеского туризма и экскурсий, Федерацию страйкбола Камчатки, детский музыкально-драматический театр «Музыкальная шкатулка», Детско-юношескую спортивную школу №1, детский технопарк «Кванториум-Камчатка», компании «LaserTag» и «ArcheryTag», коллектив объединения «Умная дорога», мастерскую керамики «Лепилка», волонтеров клуба «БлагоДарим» в рамках проекта «Клуб серебряных волонтеров «БлагоДарим», а также независимых волонтеров, откликнувшихся на приглашение к сотрудничеству.'),
(2, 'На Камчатке стартует традиционный фестиваль «Россия начинается с Камчатки»', '2019-05-27 00:58:35', 1, NULL, 'С 23 по 25 мая в регионе пройдет краевой выездной фестиваль «Россия начинается с Камчатки». В этом году артисты посетят села Соболевского района.\r\n\r\nВ фестивальной программе примут участие народный фольклорный ансамбль «Родные напевы» (Дом культуры «Меридиан», Вилючинск) и народный вокальный ансамбль «Надежда» (Сельский Дом культуры Раздольного, Елизовский район).\r\n\r\nВ рамках фестиваля пройдет выездная выставка декоративно-прикладного искусства мастериц из Мильково и Петропавловска-Камчатского, мастер-классы и творческие лаборатории.\r\n\r\nКраевой выездной фестиваль «Россия начинается с Камчатки» проводится Камчатским центром народного творчества при поддержке Министерства культуры Камчатского края.\r\n\r\nВход на все мероприятия фестиваля свободный!'),
(3, 'Жителей края приглашают на просмотр и обсуждение фильмов о Курильском десанте', '2019-05-27 00:58:35', 1, NULL, '23 мая в 18:00 часов в малом зале Камчатской краевой научной библиотеки им. С.П. Крашенинникова пройдет очередная встреча в рамках проекта «Краеведческий кинозал». Тема встречи – «По следам Курильского десанта», участникам мероприятия покажут три документальных фильма Александра Смышляева, посвященных острову Матуа.\r\n\r\nЗрители увидят документальное кино периода 2005–2007 годов: «Пятая экспедиция», «Курильский десант» и «Далекий остров Матуа».\r\n\r\nВ годы Великой Отечественной японцы превратили этот небольшой остров, расположенный в центре Курильской гряды, в неприступную крепость. Однако, 25 августа 1945 года, группа из 40 советских бойцов беспрепятственно пленила 3811 японских солдат и офицеров.\r\n\r\nОстров Матуа хранит в себе огромное количество прошлых японских военных фортификаций. До сих пор этот таинственный остров, большую часть которого занимает действующий вулкан Фуё (пик Сарычева), будоражит умы исследователей.\r\nФильмы, снятые в ходе научно-исследовательских экспедиций, приоткрывают завесу над некоторыми тайнами острова и вызывают новые и новые вопросы.\r\n\r\nВход свободный, проект ориентирован на лиц старше 12 лет.'),
(4, 'Пришкольные лагеря приглашаются к сотрудничеству в рамках проекта «Лето с библиотекой»', '2019-05-27 00:58:35', 1, NULL, 'Камчатская краевая научная библиотека им. С.П. Крашенинникова уже не первый год сотрудничает с пришкольными лагерями в рамках библиотечного проекта «Лето с библиотекой».\r\n\r\nВ июне и июле 2019 года библиотекари подготовили для своих юных посетителей множество игр в формате командных соревнований: экологический КВН «Усатые и зубатые», познавательная игра «Русь, Россия, Родина моя», литературная викторина «Читаллино»… Специально разработанные мастер-классы по изготовлению фигурок из бумаги, аппликаций, картин из песка, поделок-оригами – всегда вызывают живой интерес у школьников. Кроме весёлых игр, бесед и мастер–классов, девчонки и мальчишки смогут посетить познавательные и расширяющие кругозор выставки, которые работают в стенах библиотеки.\r\n\r\n«Много ребят в летний период остается в городе, и библиотека в это время становится для них одним из популярных мест проведения своего досуга,» – отмечают в главной краевой библиотеке.\r\n\r\nОбо всех мероприятия, которые запланированы в рамках данной программы, можно узнать на сайте библиотеки.\r\n\r\nПосещение мероприятий проекта «Лето с библиотекой» осуществляется организованными группами по заявкам.\r\nЗаявки принимаются по тел. +7 (4152) 25-23-55 с 9.00 до 17.00 в любой будний день.'),
(5, 'Современный библиотечный центр «Доступный город» открылся в краевой столице', '2019-05-27 00:58:35', 1, NULL, 'В торжественной церемонии открытия принял участие Глава Петропавловск-Камчатского городского округа Виталий Иваненко, заместитель Министра культуры Камчатского края Елена Большакова, депутат краевого Заксобрания Валерий Калашников, руководитель Управления культуры, спорта и молодежной политики городского округа Лилиана Соловьева и другие официальные лица.\r\n\r\nГлава города Виталий Иваненко выразил благодарность Губернатору Камчатского края Владимиру Илюхину за решение передать муниципалитету бывшее помещение МФЦ именно под создание библиотеки.\r\n\r\n«Помещение во многом отвечало тем задачам, которые мы хотели реализовать. – сказал Виталий Иваненко. – Библиотеки меняются, они становятся современными, предстают в новом формате. Тем интереснее нам всем здесь находиться, потому что ничего, на мой взгляд, не заменит то необыкновенное ощущение, когда ты один на один остаешься с книгой».\r\n\r\nПространство помещения организовано в соответствии с функциональными требованиями, предъявляемыми к современной доступной и комфортной библиотеке.\r\n\r\n«Существовали опасения, что информационное пространство настолько поглотит нас, что мы забудем запах страниц зачитанных книг, забудем шорох перебираемых страниц. На самом деле именно у библиотек сейчас важная и ответственная роль помочь разобраться, не запутаться в мире информации и получить именно ту информацию, которая достоверна и нужна человеку. Эту роль библиотеки никто никогда не заменит.Мир книг будет всегда», – сказала Елена Большакова.\r\n\r\nВ Библиотечном центре созданы все условия для людей с ограниченными возможностями здоровья: удобный пологий пандус и широкие проходы между книжными стеллажами. Для слепых и слабовидящих в фонде библиотеки имеются крупношрифтовые книги со шрифтом Брайля и тактильными рельефными иллюстрациями, линзы, тифлоплееры и аудиокниги. На компьютерах установлена программа экранного увеличения текста.\r\n\r\nСпециальное оборудование для слепых и слабовидящих пользователей центра и специализированный книжный фонд приобретены за счет средств муниципальной программы «Создание условий для развития культуры, молодежной политики и спорта Петропавловск-Камчатского городского округа».\r\n\r\nДо этого библиотека располагалась в обычной трехкомнатной квартире на бульваре Рыбацкой Славы. В новом доме для Библиотечного центра не только имеются необходимые помещения, но и само здание находится в удобном, проходимом месте с развитой инфраструктурой. В шаговой доступности располагается «Молодежный центр» Петропавловска-Камчатского, парк Победы.\r\n\r\n«Теперь мы сможем принять гораздо больше людей. У нас нет хранения, теперь весь фонд – 14 тысяч книг – в отрытом доступе. Наша гордость, как и в любой библиотеке, это краеведческий отдел. Мы надеемся, что горожане оценят все, что сделано в новом библиоцентре. Будем рады всем!», – отметила директор ЦГБ Анна Поротникова.\r\n\r\nВ электронном читальном зале – доступ в сеть Интернет. Здесь можно проверить почту, сообщения в социальных сетях, поработать на компьютере или смонтировать свой ролик. Кроме того, электронный читальный зал – это место для проведения лекций, показа спектаклей и видеопросмотров.\r\n\r\n«Доступный город» расположился на проспекте Рыбаков, 13.'),
(6, 'Остались последние дни, чтобы успеть подать заявку для участия в Молодежном образовательном форуме «Амур»', '2019-05-27 00:58:35', 1, NULL, 'В июне этого года форум пройдет на территории Хабаровского края уже в четвертый раз. Местом проведения мероприятия станет многофункциональный центр активной молодежи краевого государственного автономного учреждения «Дом молодежи» (Дом Отдыха «Шарголь»). Планируется проведение двух смен по 200 участников в каждой. Форум открыт для участников из всех субъектов Российской Федерации.\r\n\r\nПодать заявку для участия в форуме можно до 25 мая в АИС “Молодежь России”.\r\n\r\n“В этом году у нас будет двойной отбор. Он предполагает отправку не только общих данных кандидатов, но и уточняющие вопросы – так мы планируем пригласить на форум наиболее подходящих людей для каждой из смен, — рассказал директор молодежного образовательного форума “Амур” Максим Косенко. — Ведь отличие “Амура” от других подобных молодежных ивентов в России — мощный образовательный блок, признанный одним из лучших в стране. “Амурчане” разрабатывают реальные кейсы по различным тематикам, рисуют личные “траектории развития”, воплощают потом все это на практике в успешные творческие, деловые и общественные инициативы”, — подчеркнул он.\r\n\r\nНапомним, молодежный форум “Амур” стартует в июне двумя сменами. Первая — “Культурный максимум” пройдет с 6 по 12 июня и будет приурочена к Году театра в России. На ней ожидают более 200 артистов, музыкантов, художников, танцоров, дизайнеров и фотографов. В рамках второй смены “Компетенции будущего” с 15 по 21 июня пройдут стажировки для представителей работающей молодёжи, специалистов по молодежной политике, индивидуальных предпринимателей.\r\n\r\nВсего за три года проведения форум “Амур” посетило 2250 участников со всей России. 150 проектов были поддержаны государственными грантами, 38 человек стали стажерами в крупных дальневосточных компаниях и правительственных учреждениях.'),
(7, 'В краевой столице подвели итоги конкурса детских театров мод', '2019-05-27 00:58:35', 1, NULL, 'В Петропавловске-Камчатском состоялся Открытый городской конкурс «Мода, молодость, весна» среди учащихся образовательных учреждений города, представителей общественных организаций, творческих коллективов, занимающихся конструированием и изготовлением одежды и аксессуаров.\r\n\r\nНа конкурс было представлено 8 коллекций, среди которых члены жюри определили следующих призеров:\r\n\r\n1. Номинация «Поколение NEXT»:\r\n\r\n– Диплом I степени: Объединение «Дизайн одежды»; МБОУ ДО «Дом детского творчества «Юность»; Педагог: Иодис Ирина Алексеевна;\r\n\r\n– Диплом I степени: Театр моды «Мечта»; МБУ ДО «Дом детского творчества» (г.Вилючинск); Педагог: Шапкина Елена Павловна;\r\n\r\n– Диплом III степени: Объединение «Дизайн одежды»; МБОУ ДО «Дом детского творчества «Юность»; Педагог: Иодис Ирина Алексеевна.\r\n\r\n2. Номинация «Аксессуары»:\r\n\r\n– Диплом II степени: Объединение «Бисерная сказка»; МБОУ ДО «Дом детского творчества «Юность»; Педагог: Рогова Ольга Сергеевна;\r\n\r\n– Диплом III степени: Объединение «Кружевницы»; МБОУ ДО «Дом детского творчества «Юность»; Педагог: Кольчугина Вероника Сергеевна.\r\n\r\n3. Номинация «Рукотворное чудо»\r\n\r\n– Диплом III степени: Объединение «Волшебная нить»; МАОУ «Средняя школа № 27»; Педагог: Деменская Елена Алексеевна\r\n\r\nЧленами жюри выступили: Капустенко Людмила Евгеньевна – учитель технологии высшей квалификационной категории Средней школы № 10; Коляева Татьяна Алексеевна – учитель технологии первой квалификационной категории Средней школы № 11 имени В.Д.Бубенина; Платонов Кирилл Александрович – Art-директор модельного агентства «Fashion star».\r\n\r\nВсе участники конкурса были награждены памятными дипломами, подарочными сертификатами от спонсором конкурса и ценными призами от администрации Петропавловск-Камчатского городского округа.\r\n\r\nНапомним, что конкурс детских театров мод состоялся при поддержке Управления образования администрации Петропавловск-Камчатского городского округа. Организаторами выступил Дом детского творчества «Юность».'),
(8, 'В рамках празднования Международного дня семьи в краевой столице прошел вечер-встреча национальных семей', '2019-05-27 00:58:35', 1, NULL, 'Торжественный вечер «Дружная семья – сильная Камчатка» прошел 16 мая в кафе «Ромашка».В празднике приняли участие 9 семей, которые представляли национальные объединения полуострова.\r\n\r\nПричем, многие из них – интернациональные. Семья Слободчиковых, Кибаловых, Годлевских, Галсановых, Енокян, Гусейновых, Чимидовых, Вердиевых и Чамыян представили свои творческие номера, поведали об истории своей семьи и продемонстрировали фирменные блюда национальной кухни. Музыкальный подарок, теплые песни о любви и семье, исполнили солисты Ольга Буцкая и Андрей Селюк.\r\n\r\nУдивительная Камчатка собрала на своей земле многих, кто помнит обряды и ритуалы своих предков, знает песни и танцы этнической родины, помнит родной язык. Как важно сохранить семейные связи, сберечь родственные отношения. Они как мостик между поколениями, защита, своего рода семейный оберег.\r\n\r\nС Международным днем семьи присутствующих поздравили: Рамазан Гусейнов – председатель Камчатской региональной общественной организации «Содружество», Александр Журавлёв – заместитель руководителя Агентства записи актов гражданского состояния и архивного дела Камчатского края – начальник отдела организации государственной регистрации актов гражданского состояния, Ольга Мурашева – директор Камчатского центра народного творчества, заслуженный работник культуры России. На память об этом прекрасном вечере всем семьям вручили подарки.\r\n\r\nМероприятие было организовано Камчатским центром народного творчества, Камчатской региональной общественной организацией «Содружество» при поддержке Министерства культуры Камчатского края и Агентства по внутренней политике Камчатского края.\r\n'),
(9, 'В краевой столице устанавливают информационные аншлаги рядом с автобусными павильонами', '2019-05-27 00:58:35', 1, NULL, 'В Петропавловске-Камчатском началась установка информационных аншлагов рядом с автобусными павильонами. Об этом сообщили в Службе автомобильных дорог городского округа.\r\n\r\n«Аншлаги установлены специально для размещения информации, объявлений, рекламных листов. Они выполнены из металла и для удобства горожан вынесены за пределы остановочного павильона», – пояснили в Службе.\r\n\r\nНапомним, что горожане, незаконно разместившие объявления и другую информацию на автобусных павильонах, столбах уличного освещения и ограждениях вдоль основных дорожных магистралей, включаются в систему автодозвона. Программа делает звонки с 9 утра до 20 часов вечера. Абонентам сообщается о том, что они нарушили правила благоустройства. Им предлагается в добровольном порядке удалить неправомерно размещенные объявления, афиши, плакаты и сообщить об этом в контрольный орган. Система информирует абонентов до тех пор, пока они не демонтируют незаконный объект. Если абонент выслушал речь робота до конца, то в дальнейшем звонки будут раздаваться каждый час. Если запись с информацией не прослушали, повесив трубку, то программа будет звонить на этот номер с периодичностью 2 минуты.\r\n\r\nВсего в 2019 году планируется установить 28 таких аншлагов на остановках по основным магистралям краевой столицы.'),
(10, 'Краевое государственное бюджетное профессиональное образовательное учреждение «Камчатский колледж искусств»', '2019-05-27 00:59:28', 3, NULL, 'Камчатский колледж искусств – одно из ведущих учебных заведений в сфере искусства на Дальнем Востоке. В мае 2010 г. колледжу исполнилось пятьдесят лет. В колледже работают около 50 квалифицированных преподавателей, некоторые из которых являются гордостью Камчатки и известны не только в России, но и за рубежом.\r\nЕжегодно свыше 70 процентов выпускников колледжа поступают в ведущие консерватории и институты культуры и искусства России, некоторые учатся за рубежом.  Среди бывших выпускников – заслуженные артисты Российской Федерации, лауреаты Международных конкурсов, преподаватели и исполнители известных ВУЗов и творческих коллективов России и ряда зарубежных стран (США, Австрия, Швейцария, Израиль, Германия, Испания, Канада). Только за последние пять лет свыше 30 студентов колледжа стали обладателями ГРАН-ПРИ, лауреатами и дипломантами Российских и Международных конкурсов.\r\nКамчатский колледж искусств – центр музыкальной культуры Камчатского края. Здесь проводятся многочисленные концертные мероприятия с участием приезжих и камчатских артистов, краевые фестивали, конкурсы юных музыкантов.\r\nДиректор колледжа – Марина Анатольевна Акмаева (руководит учебным заведением с 1999 года), выпускница Санкт-Петербургского гуманитарного университета и Академии Государственной службы при Президенте Российской Федерации, в 2005 году защитила диссертацию и является кандидатом социальных наук.\r\nМатериально-техническая база Камчатского колледжа искусств динамично развивается. Особого внимания заслуживает факт получения колледжем в 2007 году лучшего в мире концертного рояля марки «Steinway». В колледже – наиболее полная на Камчатке библиотека музыкальной литературы, имеются кабинеты видео и звукозаписи. '),
(11, 'КГБУ «Камчатская краевая научная библиотека им. С. П. Крашенинникова»', '2019-05-27 00:59:28', 3, NULL, 'НАПРАВЛЕНИЯ ДЕЯТЕЛЬНОСТИ:\r\n культурно-просветительское, информационное, методическое  \r\n\r\nУСЛУГИ ДЛЯ НАСЕЛЕНИЯ:\r\n\r\n- оказание справочной и консультационной помощи в поиске и выборе конкретных документов и других источников информации; \r\n- предоставление информации о составе библиотечного фонда и о наличии в библиотечном фонде конкретных документов через систему каталогов, картотек и другие формы библиотечного информирования;\r\n- выполнение справочно-библиографических и информационных запросов, в том числе в удаленном режиме (виртуальная справочная служба);\r\n- выдача документов из библиотечного фонда во временное пользование в соответствии с правилами пользования библиотекой; \r\n- организация и проведение различных культурно-просветительских мероприятий: выставок, обзоров, семинаров, научно-практических конференций, лекций, вечеров, конкурсов и др. \r\nКЛЮЧЕВЫЕ ДОСТИЖЕНИЯ:\r\nКамчатская краевая библиотека является самым крупным книгохранилищем в регионе, фонды которой представляют большую научную и культурную ценность. Фонд библиотеки - универсальный по содержанию, свыше 565 тысяч изданий.  К услугам пользователей полноценный справочно-библиографический аппарат: традиционные каталоги, картотеки и электронные ресурсы.\r\nЯвляется членом Российской библиотечной ассоциации и Библиотечной ассоциации Камчатки.\r\nЯвляется  участником, инициатором и организатором многих  всероссийских и региональных культурных проектов и акций:  Камчатский форум в поддержку книги и чтения,  День знаний, Дни православной книги на Камчатке,  Дни абитуриента и Дни первокурсника, «Дорога в космос начинается в России, Россия начинается с Камчатки», Буккроссинг на Камчатке, радиоакции «Камчатка читает»,  Акция «Читай и скидки получай», Всероссийской акции Библионочь  и т. д. \r\nВ библиотеке регулярно проходят краевые и городские конкурсы различной тематики для разных целевых групп населения (пенсионеров,  учащихся, молодежи, людей с ограниченными возможностями здоровья, а также для профессионального библиотечного сообщества).  \r\nВ библиотеке работают любительские объединения и клубы по интересам. \r\nКраеведческие и исторические чтения при Камчатской краевой научной библиотеке им. С.П. Крашенинникова известны не только на Камчатке. Они давно признаны специалистами всего Дальнего Востока. В них принимают участие ученые Москвы, Петербурга, Новосибирска и зарубежных стран. \r\nНа сайте библиотеки работает виртуальная справочная служба \"Спроси библиотекаря\".\r\nБиблиотека проводит активную работу по созданию положительного имиджа среди населения и за последние годы деятельность учреждения получила высокую оценку \r\n'),
(12, 'Краевое государственное бюджетное учреждение «Камчатский краевой объединенный музей»', '2019-05-27 00:59:28', 3, NULL, 'Краевое государственное бюджетное учреждение «Камчатский краевой объединенный музей»:\r\n-собирает, сохраняет, изучает и публикует материальные памятники истории и культуры, объекты природы Камчатки;\r\n-способствует сохранению нематериального культурного наследия Камчатки;\r\n-пробуждает и поддерживает интерес  общественности к истории Камчатки. \r\n'),
(13, 'Краевое государственное автономное учреждение «Камчатский театр драмы и комедии»', '2019-05-27 00:59:28', 3, NULL, 'создание (постановка) и прокат театральных  спектаклей;\r\n участие в культурно-развлекательных мероприятиях города, края, Российской Федерации (форумы, конкурсы, творческие проекты, фестивали);\r\n аренда сценической площадки для массовых мероприятий развлекательного, воспитательного, информационного характера;\r\n'),
(14, 'Краевое государственное бюджетное учреждение «Центр культуры и досуга «Сероглазка»', '2019-05-27 00:59:28', 3, NULL, 'Центр культуры и досуга «Сероглазка» имеет статус Краевого учреждения и является одним из основных организаторов  культурных мероприятий полуострова. По масштабу организации и проведения мероприятий, на счету учреждения такие проекты, как, Торжественные приемы Губернатора, посвященные знаменательным государственным праздникам, Краевой конкурс творческой молодежи «Олимпийский драйв», конкурс творчества детей и молодежи «Виват, таланты! Виват, Камчатка!», Всероссийская спортивная акция Финальное празднование «Встречи Олимпийского огня на Камчатке», уникальный творческий проект для детей шоу-театр «Мультиград»  и многие другие. \r\nВ течение многих лет зал ЦКД «Сероглазка» принимает зрителей разного возраста, от самых юных зрителей до людей старшего поколения. Отдельное внимание уделяется социальным проектам. Традиционно, в канун Дня людей с ограниченными возможностями здоровья коллектив Центра культуры организует масштабный Краевой конкурс «Стремиться жить и побеждать». \r\nЗа  47 лет  своего существования  в стенах   Дома культуры  «Сероглазка» были рождены   творческие коллективы, имена которых широко известны не только на территории Камчатского края, но и далеко за его пределами. Профессиональный балетный коллектив «Полный вперед»,   Народный детский театр кукол «Лымныль»,  Народный ансамбль спортивного бального танца «Гейзер», Народный детский цирк «Саквояж»,  Заслуженный  коллектив народного творчества «Хор имени Виктора  Михалева», который в 2014 году отметил свой 45-летний Юбилей. \r\nВ 2008 году  на базе КГБУ ЦКД «Сероглазка» был создан Центр национальных культур. Центр поддерживает тесные связи со всеми диаспорами, автономиями и землячествами Камчатки. \r\n\r\nМы  предоставляет свои услуги по проведению концертов, юбилейных вечеров, фестивалей, как в помещении ЦКД \"Сероглазка\", так и на других сценических площадках нашего города.\r\n'),
(15, 'КГАУ «Камчатский театр кукол»', '2019-05-27 00:59:28', 3, NULL, '6 ноября 1980 года камчатские дети увидели первый спектакль Камчатского театра кукол «Таинственный гиппопотам». Эта дата и считается днем рождения Камчатского областного театра кукол.\r\nУ колыбели этого события стояли герои-первопроходцы – директор Е. Караульный, художник З. Кужелев (ныне – Художественный руководитель театра), главный режиссер В. Куликов и группа артистов – выпускников Ленинградского государственного института музыки и кинематографии в составе актеров-кукловодов Э. Куликовой и А. Мирохина. В это же время в труппу влились несколько актеров из Восточной Сибири во главе с А. Мусиенко.\r\nПрошло тридцать девять лет… \r\nПозади более ста пятидесяти постановок для взрослых и детей, показаны тысячи спектаклей не только на сцене театра, но на фестивалях и гастролях по всей России. Камчатский театр кукол, как участника всероссийских и международных фестивалей, знают и уважают в Хабаровске, Южно-Сахалинске, Благовещенске, Абакане, Томске, Иркутске, Москве, Санкт-Петербурге, Украине и Сербии.\r\nВысоким званием заслуженных артистов России награждены А. Малков, В. Логвинец, О. Бойко, О. Миронов. \r\nБолее 15 работников театра награждены Почетной грамотой и Благодарностью министерства культуры и массовых коммуникаций РФ.\r\nОгромный вклад творческих работников Камчатского театра кукол в духовно-нравственное воспитание, эстетическое и творческое развитие юных и взрослых камчатских зрителей отмечен наградами и премиями Губернатора и Правительства Камчатского края.\r\nВ разное время в театре работали и ставили спектакли замечательные режиссеры: В. Куликов, А. Шкиленок, В. Зарниченко, Е. Егоров, С. Столяров, Т. Воробьева, В. Батуринец, В. Зверовщиков, заслуженные артисты России О. Бойко, В. Логвинец, а также художники-постановщики Л. Краснова, С. Иглакова, С. Кужелева, главный художник театра З. Кужелев. Музыкальной оформление к спектаклям готовили Г. Нелипович, Л. Ярошевская, заслуженный артист России А. Малков.\r\nОколо тридцати восьми лет театром бессменно руководит З. Кужелев, одновременно являющийся главным художником. Тем детям, которые помнят спектакль «Таинственный гиппопотам» уже за сорок лет… Когда-то их сюда приводили мамы и бабушки. Сейчас они сами приводят своих детей. \r\nУчитывая весомые результаты деятельности и большой вклад театра кукол в развитие культуры Камчатского края, Правительством Камчатского края принято решение о строительстве нового здания театра.\r\n\r\nКасса театра\r\nТелефон: 8 (4152) 42-64-40\r\nРежим работы: ВТ-ВС, 11:00-17:00\r\nБилеты также продаются в магазине хороших книг и добрых игр \"Бархатята\" по адресу ул. Пограничная, д. 1 (Офис 202, 2-й этаж)\r\n'),
(16, 'Киноцентр «Лимонад» (ООО «Шамса-Премьера»)', '2019-05-27 00:59:28', 3, NULL, 'Шесть залов, все залы оборудованы для проведения киносеансов для лиц с ограниченными возможностями здоровья (адаптированы к тифлокомментированию и субтитрированию).\r\nОбщая вместимость киноцентра – 788 мест (не считая возможность расширения количества посадочных мест за счет использование пуфов-антимебель).\r\nКиноцентр обеспечен туалетными комнатами, имеется гардероб, на территории киноцентра действует три кафе, имеется зона подиума, часто используемого для проведения различных мероприятий. Имеется автомобильная парковка (предусмотрены места для лиц с ограниченными возможностями здоровья).\r\n\r\nПродажа билета осуществляется через кассы (наличный и безналичный расчет), через терминал на территории кинотеатра (наличный расчет), онлайн-продажа билетов (банковская карта или Pay Pal). Возможно предварительное бронирование билетов (выкуп – не позднее, чем за 30 минут до начала сеанса).\r\n'),
(17, 'КГБУ «Камчатский краевой художественный музей»', '2019-05-27 00:59:28', 3, NULL, 'Камчатский краевой художественный музей - один из самых молодых на дальнем Востоке.  Он был основан 5 января 1992 года.\r\nДеятельность музея обширна и разнопланова. Её основные направления – это собирание, хранение и изучение предметов изобразительного искусства, экспозиционно-выставочная и просветительная работа.\r\nНа сегодняшний день коллекция Камчатского краевого художественного музея насчитывает более трех тысяч произведений живописи, графики, скульптуры, декоративно-прикладного и народного искусства, художественной фотографии и детского творчества.\r\nБольшую роль в формировании коллекции музея сыграл Государственный музейно-выставочный центр – «Росизопропаганда» Министерства культуры Российской Федерации (РОСИЗО, г. Москва). При его содействии в фонды музея были безвозмездно переданы произведения художников из разных городов России от Калининграда до Камчатки. Приоритетным направлением в деятельности музея по изучению и комплектованию фондовой коллекции является творчество дальневосточных художников. Значительную часть музейного собрания составляют произведения художников Камчатки.\r\nВ рамках культурного обмена в 1993 году прошла выставка изобразительного и декоративно-прикладного искусства «От полуострова к полуострову: Калифорния - Камчатка», в результате которой музейная коллекция пополнилась произведениями художников США (штат Калифорния).\r\nНаучная деятельность музея отражена в изучении и научной обработке музейных предметов фондовой коллекции, в издании буклетов и каталогов к выставкам, в создании научно-методического и информационно-справочного материала, в различных публикациях. Научная деятельность музея осуществляется при участии совещательных органов музея: Ученого Совета, научно-методического Совета, фондово-закупочной комиссии. В музее создан и продолжает пополняться научный архив.\r\nИскусствоведами музея проводится экспертиза художественных произведений для вывоза за рубеж.\r\nЭкспозиционно-выставочная работа – один из основных видов деятельности «ККХМ». В залах музея ежегодно проводится около двадцати выставок. По инициативе музея за последние годы камчатские ценители изобразительного искусства смогли познакомиться с произведениями художников Магадана, Хабаровска, Санкт-Петербурга, Москвы, а также с работами мастеров США, Японии, Северной Кореи.\r\nСтало доброй традицией участие музея в ежегодном фестивале искусств «Камчатская весна». Прекрасным дополнением музейных выставочных мероприятий является участие в них камчатских музыкантов, инструментальных, вокальных, хореографических коллективов, в том числе и детских. Выставочная деятельность музея освещается в средствах массовой информации.\r\nХудожественный музей ведет большую культурно-образовательную работу среди учащихся школ, студентов средних и высших учебных заведений, воспитанников детских домов и интернатов. Для них проводятся тематические экскурсии, музейные уроки, конкурсы, мастер-классы, организуются встречи с художниками, фотохудожниками и мастерами декоративно-прикладного и народного искусства.\r\nХудожественное и эстетическое воспитание и образование музей начинает с ранних лет, работая в детских садах. Научные сотрудники музея проводят передвижные тематические выставки, экскурсии, творческие встречи, лекции, консультации, работают в качестве членов жюри на конкурсах детского творчества.\r\nС 2009-2010 гг. научные сотрудники музея используют новые формы просветительской деятельности, созданы специализированные культурно-образовательные программы «Мир русской народной игрушки» для дошкольников, «Путешествие в мир изобразительного искусства» для учашихся 6-7 классов, мультимедийные выставки «Камчатский батик», «Камчатские пейзажи в творчестве камчатского художника Вадима Белоглазова», «Жизнь моя Камчатка» о творчестве Народного художника России Ф.Дьякова.  Работа в этом направлении продолжается.\r\nБольшой популярностью горожан, особенно среди школьников и студентов пользуются автобусные экскурсии различной тематики и маршрутов по городу и краю, охватывающие исторические, культурные и природные памятники нашего региона. Комфортабельный музейный автобус дает возможность вести не только экскурсионную работу, но и проводить передвижные выставки в отдаленных населённых пунктах края.\r\nОсобое внимание в музее уделяется работе с учащимися детских художественных школ и школ искусств города и края.\r\nДорогими и желанными посетителями в музее всегда были и остаются ветераны Великой Отечественной войны, пенсионеры и инвалиды. Они являются частыми гостями музейных мероприятий, для них устраиваются тематические вечера, концерты, экскурсии.\r\nБольшое внимание в своей работе музей уделяет сохранению и развитию художественных промыслов и ремесел коренных малочисленных народов Севера, населяющих Камчатский край. Регулярно в залах музея проводятся выставки произведений народных мастеров и фотовыставки, отображающие быт и традиционную культуру аборигенов Камчатки.\r\nНаучные сотрудники музея принимают участие в научно-практических конференциях, посвященных проблемам развития изобразительного искусства на Камчатке, в 2009 и 2010 гг. приняли участие в международных исторических XXVI и XXVII Крашенинниковских чтениях, представив  темы научных исследований «Предстоящая экспедиция…к славе Российской империи отправлена быть может» /о формировании академического отряда Второй Камчатской экспедиции с участием художников/, «Забытые рисовальщики Второй Камчатской экспедиции Витуса Беринга» /к вопросу биографий/, В.Шохин «По земле отцов» /о Заслуженном художнике России В.Шохине/, «Камчатский батик» /о камчатских художниках -педагогах М.Новиковой, Е.Никольченко, А.Витковской, А.Лыловой и О.Лозенко/.\r\nХудожественный музей работает в тесной связи с учреждениями культуры края – Камчатским краевым объединенным музеем, Камчатским Центром народного творчества, Краевым учебно-методическим центром, общественными организациями – Камчатской организацией Союза художников России, Камчатским отделением Творческого Союза художников России, а также с Камчатским колледжем искусств, Камчатским государственным университетом им. Витуса Беринга и др.\r\nВ 2001 году наш музей вошел в состав Союза Музеев России, а в 2003 году стал членом Ассоциации работников музеев России (г. Москва) и Дальневосточной Ассоциации Музейных работников (г. Хабаровск).\r\n'),
(18, 'КГБУ «Камчатское концертно-филармоническое объединение»', '2019-05-27 00:59:28', 3, NULL, 'В состав камчатской филармонии входят:\r\nЛауреат Всесоюзного и Международных конкурсов - \"Камчатский камерный оркестр имени Георгия Аввакумова\" (художественный руководитель и дирижёр – Заслуженный артист России Александр Гилёв);\r\nЛауреат Международных конкурсов - \"Камчатская хоровая капелла\" (художественный руководитель и дирижёр – Лауреат международных конкурсов Василий Князев);\r\nДипломант Международных конкурсов - \"Русский квартет Камчатка\" (художественный руководитель – Лауреат международных конкурсов Артём Быков);\r\nСтрунный квартет \"Прикосновение\" (художественный руководитель - Ирина Шмидт).\r\nЦели деятельности:\r\n•	реализация государственной политики в области искусства и исполнительского мастерства, направленная на сохранение нематериального культурного наследия и культурных ценностей, исторически сложившихся форм и явлений сценического искусства, являющихся национальным достоянием российской культуры;\r\n•	целенаправленная пропаганда классической музыки и мировой музыкальной культуры, приоритетное развитие филармонической деятельности, пропаганда лучших произведений отечественной и зарубежной симфонической, камерной и вокально-хоровой музыки, музыкально эстетическое воспитание детей и юношества;\r\n•	сохранение и развитие исторически сложившихся форм и явлений сценического искусства, являющихся национальным достоянием российской культуры;\r\n•	сохранение лучших традиций российского сценического искусства, создание и показ высокохудожественных программ, других публичных представлений, пополнение репертуара лучшими образцами русской и зарубежной классики;\r\nЗадачи:\r\n•	создание условий для роста профессионального мастерства творческих работников и коллективов;\r\n•	сотрудничество с российскими и зарубежными организациями и учреждениями;\r\n•	содействие в сохранении и развитии межнациональных, межрегиональных и межгосударственных культурных связей.\r\n \r\nМатериально-техническое обеспечение предоставления услуг.\r\nОфис и репетиционный зал КГБУ «Камчатское концертно-филармоническое объединение» находятся в арендованном помещении по адресу г. Петропавловск-Камчатский, ул. Ленинградская, 100.\r\nКонцертный зал филармонии \"Октябрьский\" расположен по адресу г. Петропавловск-Камчатский, ул. Советская, 35. Зрительный зал рассчитан на 300 мест. \r\nПомещения оборудованы водопроводом, подключены к системам центрального отопления, оборудованы системой охранно-пожарной сигнализации. Помещения оснащены телефонами и интернетом.\r\n\r\nБилеты на филармонические концерты можно приобрести:\r\n В кассах филармонии (ул. Ленинская, 65 и район «КП», ТЦ «Галант-Плаза», вход № 1) и в Камчатском колледже искусств\r\nТелефон: 47-82-47\r\n'),
(19, 'Jazz&Opera', '2019-05-27 01:00:03', 2, NULL, '7 апреля 2019 года. Концертный зал “Октябрьский”. Концерт “Джаз и опера”. Московские солистки Екатерина Лёхина, Ольга Годунова и Камчатский камерный оркестр им. Г. Аввакумова. Фото Вадим Жук.'),
(20, 'Живые страницы истории для юных дипломатов', '2019-05-27 01:00:03', 2, NULL, 'В Международный день театра Вилючинский Народный театр музыкальной комедии и драмы “ТВМ. Театр. Время. Мы” принимал особых гостей – участников образовательной программы Ассоциации российских дипломатов “Дипломаты будущего”. Фото Галины Уркачан'),
(21, 'Jazz, Funk, Italiano', '2019-05-27 01:00:03', 2, NULL, '12 апреля 2019 года. Концертный зал филармонии “Октябрьский”. Грандиозный джазовый вечер подарили камчатским зрителям итальянский вокалист, импровизатор и шоумен Борис Саволделли и московское джазовое трио Григория Зайцева. Фото Вадим Жук'),
(22, 'Танцевальный вернисаж', '2019-05-27 01:00:03', 2, NULL, '25-летие фестиваля хореографического искусства. 24 апреля 2019 года.'),
(23, 'Мужской квартет “Триумф”', '2019-05-27 01:00:03', 2, NULL, 'Концерт “Классика мировой эстрады” 27 апреля в концертном зале “Октябрьский”'),
(24, 'Закрытие фестиваль искусств “Камчатская весна – 2019”', '2019-05-27 01:00:03', 2, NULL, 'Камчатская хоровая капелла им. Е. Морозова под управлением лауреата Всероссийских конкурсов Василия Князева представила премьерную программу – монументальное произведение Сергея Рахманинова – Всенощное бдение.'),
(25, 'Творческая встреча «Шелковые фантазии»', '2019-05-27 01:00:03', 2, NULL, '12 мая в музее состоялась творческая встреча с художниками-участниками выставки декоративно-прикладного искусства «Шелковые фантазии» – Анной Витковской и Еленой Никольченко.'),
(26, '“Ночь музеев” в краевом объединенном музее', '2019-05-27 01:00:03', 2, NULL, 'В рамках акции жителей и гостей краевой столицы ждало настоящее погружение в историю Камчатки.'),
(27, '“Ночь музеев” в краевом художественном музее', '2019-05-27 01:00:03', 2, NULL, '“Элементарная феерия” погрузила посетителей акции в мир творчества, беззаботного веселья и перевоплощения…'),
(28, 'Евгения Кулиш', '2019-05-27 01:15:16', 5, NULL, 'Закончила Камчатский политехнический техникум, по специальности -архитектор. Проработав год в городской администрации, поняла, что это не ее призвание.\r\n\r\nС детства Евгения активно увлекалась рисованием, училась в камчатских художественных школах, у художника Соколова Ширшова Виктора Петровича. Теперь рисование стало главным занятием в ее жизни.\r\n\r\nНа протяжении трех лет она занимается росписью на стенах в квартирах и коммерческих помещениях.  В 2015 году закончила курсы по росписи стен в Санкт-Петербурге,\r\nгде научилась использовать лепку в оформлении стен, а также имитировать фреску.\r\n\r\nНе так давно Женя стала увлекаться изготовлением бижутерии и периодически участвовать со своими изделиями ручной работы в выставках, ярмарках.\r\n\r\nГлавная страсть Евгении – это совы. Она часто использует образ этой милой птички в своих произведениях.'),
(29, 'Антон Шахов', '2019-05-27 01:15:16', 5, NULL, 'Родился в городе Благовещенске, Амурской области. С детства увлекался рисованием, в основном, простой ручкой. Ходил в Изостудию для начинающих, а потом пошёл в Художественную школу. Позже поступил и окончил Амурский Педагогический Колледж, на художественно-графическом отделении. После выпуска поступил в Приморскую Государственную Академию Искусств в городе Владивостоке. Участвовал в совместных художественных студенческих выставках. Сейчас преподаю в Камчатском Колледже Искусств. С детства питал особую любовь к книжной графике, отчего сильно полюбил чёрную гелевую ручку. В этой технике стараюсь поднимать остросоциальные и общечеловеческие проблемы.'),
(30, 'Парфенова Надежда', '2019-05-27 01:15:16', 5, NULL, 'Родилась в 1992 году в г. Петропавловске-Камчатском. Рисовать начала раньше, чем научилась членораздельно говорить. Тогда это было сочетание безумных цветовых пятен, упорно называемое «белочками» и «лошадками». Окончила Детскую Художественную школу по направлению «станковая живопись», в период обучения часто участвовала в различных областных и городских конкурсах. Получила высшее образование в Камчатском Государственном Техническом университете. Надежда отдает предпочтение анималистическому жанру и пейзажу, любит работать в технике «по сырому» акварелью. Не стремится к абсолютно реалистичной, фотографически точной передаче объектов, академически правильной технике – для неё важнее яркая эмоциональная окраска работ, чтобы это были словно «маленькие окошки» в душу автора. Всегда старается писать произведения с позитивным настроем – так они будут приятны глазу и радовать своего обладателя, нести мотивацию на счастье.'),
(31, 'Кирилл Алейников', '2019-05-27 01:15:16', 5, NULL, 'Родился в 1982 году в г. Петропавловске -Камчатском. Получил два высших образования. Пишет стихи с 22 лет.\r\n\r\nПубликовался в литературно-художественных журналах:\r\n– “Дальний Восток” – Хабаровск;\r\n– “Бег” – С-Петербург;\r\n– “Русский писатель” – С-Петербург.\r\n\r\n“Поэзия – это искусство, в котором дух человека неизъяснимым образом соприкасается с непостижимой сутью вещей, в конечном итоге – с высшей красотой, которая сама по себе есть тайна.\r\nИ из этого соприкосновения и появляются настоящие стихи, поэзия – это таинство рождения новой жизни слов и смыслов, и поэт в изумлении видит результаты своего труда, понимая, что он не столько творец, сколько соучастник преступления – через законы формальной логики и обычной жизни языка.”\r\n\r\n<b>Вулкан</b>\r\n\r\nВдоль чешуи вулкана рыщет хмарь.\r\nРучьи змеятся вниз по мерзлым лавам.\r\nБеззвучна и черна, как мертвый пономарь,\r\nНочь вниз лицом упала вдоль увала.\r\n\r\nНа темном шлаке – поросль камней.\r\nТучны поля базальтовых початков.\r\nИ между них луна прокралась, не\r\nОставив ни следов не отпечатков.\r\n\r\nЗабытый, безымянный мавзолей,\r\nПолуразрушен и полуразграблен,\r\nСтоит вулкан.\r\nОн мертв.\r\nНабальзамирован\r\nтаблицей Менделеева.\r\nПарадным,\r\nчеканным шагом караул часов\r\nсменяется у каменной гробницы.\r\n\r\n… И у подножья стынет озерцо\r\nКак колесо истлевшей колесницы.\r\n\r\n\r\n<b>Зима. Меха. Безудержная пляска,</b>\r\nРазгоряченных, с легким паром, губ.\r\nПо ледовитой темени салазки\r\nЗа лошадьми доверчиво бегут.\r\n\r\nКолонны. Мост. От мала до велика\r\nВдоль улицы пешком идут дома\r\nИ голос твой, весь в отблесках и бликах\r\nРассыпался на смех и на слова.\r\n\r\nДа, этой ночью, окаянной, снежной\r\nМеня своим отказом окатив,\r\nТы с вызовом поправила небрежно\r\nЗаснувшего песца поверх груди.\r\n\r\nОткинулась назад. Скрестила руки.\r\nО, безнадежно-серые глаза!\r\nВас самоцветами солдаты разворуют\r\nИ спустят в карты, походив с туза.\r\n\r\nЛед. Колея. Молчишь? Я все приемлю…\r\nДнем эшелон отправится туда,\r\nГде новобранцами на стынущую землю\r\nС разбега падают каленые снега.\r\n\r\nНочь при смерти. Созвездья глухо стонут.\r\nМне страшно. Он меня не оградил:\r\nТвоей рукой мне вложенный в ладони\r\nНательный крест, затихший на груди\r\n\r\nИ вижу я, хватая снег губами:\r\nНа голубого спящего песца\r\nЛожится снег и гаснет…\r\nгаснет пламя\r\nТвоих мехов у бледного лица.\r\n'),
(32, 'Юлия Максимова', '2019-05-27 01:15:16', 5, NULL, 'Профессиональный визажист-бодипэйнтер.\r\n\r\nОфициальный визажист ЛОФТ “Парк культуры”, салона-эксперта красоты “Club-X”, а так же магазина парфюмерии и декоративной косметики “Aquarell’E”. Автор курса по макияжу «Make-up class», которые проводятся в рамках проектов от ЛОФТ «Парк культуры». Сотрудничает с такими проектами как «Подиум», «Мисс Камчатка», «Фестиваль невест», а так же с информационно-развлекательным журналом «Камчатка Life» и «Pro свадьбу».\r\n\r\nХудожник по макияжу – это мое призвание. Хобби детства, рисование и огромная любовь к сцене, привели меня к самореализации своего творчества через боди-арт. При создании различных творческих проектов, постановки боди-арт шоу, я столкнулась с тем, что к красиво украшенному телу  всегда требуется правильно подготовленное лицо. Ведь только тогда образ будет смотреться цельным. Так я вышла на путь моей основной деятельности и профессии визажиста.\r\n\r\nУмение рисовать помогает лучше читать лица, видеть геометрию тела, и воплощать идеи для арт и фото проектов.\r\n\r\nВизаж – это самое настоящее искусство и я рада, что я часть его. Ведь так приятно создавать новые образы, помогать людям открывать новые стороны своей личности и вдохновлять на эксперименты.');
INSERT INTO `publications` (`publication_id`, `publication_title`, `publication_date`, `publication_type_id`, `publication_category_id`, `publication_text`) VALUES
(33, 'Молодежь приглашают принять участие в конкурсе граффити', '2019-05-27 01:15:30', 10, NULL, 'В Петропавловске-Камчатском стартовал прием заявок на участие в конкурсе эскизов в стиле граффити «Стрит-Арт».\r\n\r\nЦелью Конкурса является создание комфортной городской среды, привлечение молодежи к участию в благоустройстве и художественном оформлении города, а также формирование активной жизненной позиции у молодых граждан, пропаганда позитивных примеров использования граффити.\r\n\r\nОсновными критериями оценки конкурсных работ являются: оригинальность дизайнерского решения, наличие ясной, хорошо проработанной идеи эскиза; мастерство и техника исполнения, уникальность и оригинальность идеи, исполнения художественного замысла; художественно-эстетическое впечатление, исполнительское мастерство; возможность реализации идеи автора.\r\n\r\nКонкурс проводится по следующим номинациям: эскизный проект граффити для стены магазина «Гамбринус» (ул. Ключевская, 50); эскизный проект граффити для подпорной стены торговых павильонов ТЦ «БАМ» (пр. Циолковского, 25); эскизный проект граффити для подпорной стены магазина «Гастроном № 5» (ул. Владивостокская, 17).\r\n\r\nПобедитель конкурса летом этого года получит возможность реализовать свой проект на одном из объектов городского округа. Материалы для реализации эскизов: баллоны с краской, кэпы, грунтовка и т.д. авторам предоставят организаторы.\r\n\r\nЗаявки на участие в Конкурсе в соответствии с установленной формой    вместе с комплектом конкурсных материалов принимаются в администрации Петропавловск-Камчатского городского округа по адресу: г. Петропавловск-Камчатский, ул. Ленинская 12, каб. 249 или по электронному адресу: AAlysheva@pkgo.ru в срок до 5 июня.\r\n\r\nНапомним, что проект Стрит-Арт реализуется в краевой столице несколько лет. В 2018 году 8 эскизов украсили разные объекты на улицах Петропавловска-Камчатского.'),
(34, 'Минкультуры России приглашает камчатских школьников принять участие в конкурсах, посвященных Году театра', '2019-05-27 01:15:30', 10, NULL, '23 апреля стартовал прием заявок для участия в конкурсах Всероссийского культурно-образовательного проекта «ТЕАТР – ДЕТИ». Официальный старт проекту был дан в Нижнем Новгороде в рамках Всероссийского театрального марафона.\r\n\r\nПроект включает два направления – всероссийский конкурс театральных рецензий «Пишем о театре!» для школьников в возрасте 11 – 16 лет и абитуриентов 17 – 18 лет, а также конкурс рисунков, посвященных театру, среди детей 6 – 10 лет.\r\n\r\nПрием заявок на участие в конкурсе «Пишем о театре» среди абитуриентов в возрасте от 17 до 18 лет осуществляется до 30 мая 2019 года. Специальное жюри Конкурса определит до 15 победителей. Оценка конкурсных работ будет завершена к 10 июня 2019 года.\r\n\r\nКонкурс «Пишем о театре» среди школьников в возрасте 11 – 16 лет и детский конкурс рисунков, посвященных театру, проводятся в два этапа: региональный и федеральный. Участники регионального этапа Конкурса, получившие наибольшее количество баллов, признаются победителями регионального этапа, и их работы рекомендуются для участия в федеральном этапе.\r\n\r\nРаботы для участия в региональном этапе конкурса необходимо направить в срок до 1 августа 2019 года по адресу электронной почты theaterforchildren@yandex.ru. Телефон для справок (4152)41-70-78.\r\n\r\nБолее подробная информация и положения о конкурсах можно найти на официальном сайте проекта.\r\n'),
(35, '2-й Международный Фестиваль декоративно-прикладного искусства «Руками женщины»', '2019-05-27 01:15:30', 10, NULL, 'Фестиваль пройдет 3 – 4 ноября 2019 года в Москве (Конгресс-Центр ЦМТ), в нем примут участие мастера в сфере декоративно-прикладного искусства из 85 регионов России, стран СНГ и зарубежных стран.\r\n\r\nФестиваль «Руками Женщины» – это фестиваль декоративно прикладного искусства, этнографии, народных промыслов, Handmade, показы этномоды, фотовыставки, концерты с этнографическими коллективами.\r\n\r\n \r\n\r\nНа 2-м Международном фестивале декоративно прикладного искусства «Руками женщины» участникам представится возможность продемонстрировать свою продукцию как часть культурного наследия, предложить свои услуги, технологии, ознакомиться с качеством предлагаемой продукции, а также получить необходимую информацию и консультации.\r\n\r\n \r\n\r\nВ фестивале принимают участие художники, мастера декоративно-прикладного искусства, народного творчества, мастера Handmade, дизайнеры, представители других творческих направлений регионов РФ, стран СНГ, Европы и Азии.\r\n\r\nДля участия в фестивале «Руками женщины» мастерам необходимо пройти регистрацию на официальном сайте проекта www.handswomen.ru\r\n\r\nРегистрация открыта.\r\n\r\nВ рамках фестиваля будут проводиться два Международных фотоконкурса:\r\n\r\n«Мама и дети в национальных костюмах народов мира»\r\n«Окунись в сказку»\r\n     Цели проекта:\r\n\r\nПредставить многонациональное богатство товаров и услуг, производимых народами России, стран СНГ, Европы и Азии.\r\nПривлечь внимание к истокам самобытности женщин народов Российской Федерации, стран СНГ, Европы и Азии.\r\nСохранение материального и духовного культурного наследия народов РФ, стран СНГ, Европы и Азии.\r\nПоказать самобытность и многонациональность регионов Российской Федерации, стран СНГ, Европы и Азии.\r\nСоздать уникальную площадку для сплочения женщин разных конфессий.\r\nПомощь женщинам стать более социально активными.\r\nНа фестивале будут выбраны 15 победителей, которые будут награждены дипломами победителей, подарками, призами и, в дальнейшем, организация персональных выставок на территории РФ и за рубежом.\r\n\r\nВсе участники фестиваля получат дипломы участников 2-го Международного Фестиваля декоративно прикладного искусства «Руками женщины».'),
(36, 'I-й Международный открытый конкурс молодых исполнителей «Розовая чайка»', '2019-05-27 01:15:30', 10, NULL, 'К участию в конкурсе приглашаются молодые музыканты в возрасте от 7 до 21 года. Международный открытый конкурс молодых исполнителей «Розовая чайка» пройдет с 28 июня по 5 июля 2019 года в Якутске в рамках III-го Международного конгресса «Музыка для всех: от международных мастер-классов — к международным конкурсам» по рекомендации II-го Международного конгресса «Музыка для всех: международный мастер-класс».\r\n\r\nКонкурс проводится под патронатом Всемирного общества музыкального образования (ISME) и под эгидой Комиссии Российской Федерации по делам ЮНЕСКО.\r\n\r\nМеждународный конкурс призван:\r\n\r\n— расширить творческие контакты педагогов и детей Республики Саха (Якутия), обучающихся исполнительству на музыкальных инструментах с молодыми музыкантами России, дальнего и ближнего зарубежья;\r\n\r\n— обмену опытом между педагогами отдельных исполнителей;\r\n\r\n— способствовать творческой самореализации подрастающего поколения.\r\n\r\nКонкурс проводится в рамках III Международного конгресса «Музыка для всех: от международных мастер-классов к международным конкурсам», посвященного 5-летию проекта «Музыка для всех» и 25-летию со дня открытия Высшей школы музыки Республики Саха (Якутия).\r\n\r\nКонкурс проводится по четырем номинациям и трем возрастным категориям:\r\n\r\n—Номинация «Фортепиано»\r\n\r\nВозрастные группы:           1 категория — 7-10 лет;\r\n\r\n2 категория — 11-15 лет;\r\n\r\n3 категория — 16-21 лет)\r\n\r\n— Номинация «Скрипка»\r\n\r\nВозрастные группы:           1 категория — 9-13 лет;\r\n\r\n2 категория — 14-16 лет;\r\n\r\n3 категория — 17-21 лет)\r\n\r\n— Номинация «Виолончель»\r\n\r\nВозрастные группы: 1 категория — 10- 12 лет;\r\n\r\n2 категория — 13-15 лет;\r\n\r\n3 категория — 16-21 лет)\r\n\r\n— Номинация «Музыка для всех»\r\n\r\nПроводится по двум направлениям:\r\n\r\n«Солисты» (исполнители на фортепиано, струнных, духовых и народных инструментах)\r\n\r\n«Коллективное творчество» (ансамбли, оркестры разных составов)\r\n\r\nВозрастные группы:           1 категория — 7-10 лет;\r\n\r\n2 категория — 11-15 лет;\r\n\r\n3 категория — 16-21 лет\r\n\r\nКонкурс проходит в два тура. Для участия в Конкурсе необходимо до 30 апреля 2019 года зарегистрироваться на сайте muzforall.ru в разделе «Международный конкурс».\r\n\r\nПроездные расходы для участников конкурса – за счет направляющей стороны. Проживание и питание – за счет принимающей стороны.\r\n\r\nВступительный взнос: солисты – 100 долларов, оркестранты – 30 долларов с каждого участника.\r\n\r\nСправки по телефонам Центра «Музыка для всех»:\r\n\r\nХарайбатова О.М.+7 914 223-99-80, Павлова З.Г.+7 924 166-66-75, Карманова Е.С.+7 924 860-46-40  или по эл.почте: muzforall1322@mail.ru\r\n\r\nБолее подробную информацию о Конкурсе и Программных требованиях можно получить на сайтах: muzforall.ru  или  vschoolmus.ru'),
(37, 'Фестиваль «Поколение NEXT» приглашает талантливых детей Камчатского края принять участие в конкурсе', '2019-05-27 01:15:30', 10, NULL, 'Заявки принимаются до 30 мая 2019 года. Конкурс проходит в трех возрастных категориях: с 4 до 9 лет; с 10 до 13; с 14 до 17 лет.\r\n\r\nЦели конкурса:\r\n\r\nвыявление и поддержка талантливых исполнителей и творческих личностей среди детей и подростков;\r\nукрепление профессиональных и культурных связей между творческими коллективами и руководителями из разных стран и городов;\r\nповышение уровня профессионального мастерства педагогов и руководителей коллективов;\r\nобмен творческим опытом с профессионалами в области вокала, актерского мастерства, хореографии.\r\nФестиваль ежегодно собирает талантливых детей и подростков от 4 до 17 лет из разных регионов России и из-за рубежа на курорте «Роза Хутор» в городе Сочи. В рамках Фестиваля созданы все условия для презентации творческих достижения и сотрудничества: вокальные и танцевальные площадки, возможность стать модельером, блогером, радио и телеведущим, записать авторскую песню и выступить на Гала-концерте, который будет показан на телеканале «Муз-ТВ». Каждое направление курируют высокопрофессиональные наставники: проводятся индивидуальные занятия и мастер-классы.\r\n\r\nФестиваль – это возможность заявить о себе, показать свой талант российским и международным экспертам во всех направлениях искусства. Именно поэтому считаем очень важным, чтобы талантливые дети и подростки со всей страны участвовали и представили себя в творческой лаборатории фестиваля.\r\n\r\nКонкурс состоится с 21 по 30 июня 2019 года на курорте «Роза Хутор» в Сочи.\r\n\r\nПодробная информация на официальном сайте проекта.'),
(38, 'Кинообразовательный фестиваль «КИНООСТРОВ» приглашает к участию творческие коллективы Камчатки', '2019-05-27 01:15:30', 10, NULL, 'XX Всероссийский детский кинообразовательный фестиваль «КИНООСТРОВ» будет проходить с 31 мая по 16 июня 2019 года в Санкт-Петербурге. К участию в проекте приглашаются творческие коллективы кино и медиа школ, театральных и анимационных студий, педагоги, наставники и ученики данных образовательных организаций.\r\n\r\nУчастие фильмов в конкурсной программе – бесплатное. Фильмы, вошедшие в конкурсную программу кинофестиваля, будут показаны в лучших кинотеатрах.\r\n\r\nСтало доброй традицией начинать летние каникулы сбором в Санкт-Петербурге юных кинематографистов со всей России и показом лучшего, что было снято детьми, с участием детей и для детей за прошедший кинематографический год. Тема этого года – «Мир без границ».\r\n\r\nОрганизаторы фестиваля: АНО реализации инновационных проектов развития искусства и культуры «РостИскусства»; Продюсерский центр «Две столицы»; Российская детская киноакадемия «Киноостров» при поддержке Молодежного центра Союза кинематографистов и Международного Центра Детской дипломатии.\r\n\r\nОсновная цель кинофестиваля «КИНООСТРОВ» – помощь подрастающему поколению в формировании творческого мировоззрения; повышение интереса к созданию кинофильмов: игровых, анимационных, документальных – ориентированных на детскую и молодежную аудиторию; приобщение детей и молодежи к киноискусству.\r\n\r\n«Киноостров» ориентирован на всестороннее развитие детей в области их будущего профессионального интереса.\r\n\r\nНа протяжении всей своей истории фестиваль «КИНООСТРОВ» радовал своих участников насыщенной развлекательно-познавательной программой, в этом году ребят также ожидает множество увлекательных мероприятий.\r\n\r\nНеобязательно быть профессионалом в области кино – «Киноостров» будет рад каждому, кто заинтересован в создании фильмов для детей.\r\n\r\nУзнать подробности участия и подать заявку можно на официальном сайте проекта.\r\n'),
(39, 'Камчатские театры приглашают к участию в конкурсе на соискание Российской Национальной театральной премии «Арлекин»', '2019-05-27 01:15:30', 10, NULL, 'По своему масштабу и охвату деятельности «Арлекин» сегодня является самым крупным и представительным российским фестивалем детских спектаклей.\r\n\r\nКРАТКО ОБ «АРЛЕКИНЕ»:\r\n\r\nГод основания – 2004. Фестиваль проводится ежегодно в третьей декаде апреля на базе Санкт-Петербургского государственного детского музыкального театра «Зазеркалье».\r\nУчредитель Российской Национальной премии в области театрального искусства для детей «Арлекин» – Союз театральных деятелей Российской Федерации.\r\nПрезидент Российской Национальной премии в области театрального искусства для детей «Арлекин» – Алексей Владимирович Бородин, художественный руководитель Российского академического Молодежного театра, народный артист Российской Федерации.\r\nАрт-директор Российской Национальной премии в области театрального искусства для детей «Арлекин» – Александр Васильевич Петров, художественный руководитель Санкт-Петербургского государственного Детского музыкального театра «Зазеркалье», народный артист Российской Федерации.\r\nПятнадцать проведённых фестивалей «АРЛЕКИН» (2004 – 2018) – это:\r\n\r\nпоказ 202 лучших российских спектаклей для детей\r\nучастие 137 театров из 88 городов\r\nпроведение более 100 мероприятий Специальной программы\r\n«Арлекин» – не только всероссийский фестиваль, но и единственная в стране театральная премия, подразумевающая как творческое, так и материальное стимулирование сферы детского театра.\r\n\r\nТеатр-лауреат в номинации «Лучший спектакль» ежегодно получает серебряную статуэтку Арлекина и денежную часть премии на постановку нового детского спектакля, который входит затем в конкурсную программу следующего фестиваля «Арлекин» автоматически, без отбора экспертным советом. Изначально эта сумма составляла 300 000 рублей, а с 2018 года размер премии был увеличен до 1 000 000 рублей.  На средства премии уже создано 13 новых детских спектаклей в российских театрах, доказавших свое творческое лидерство в области театра для детей.\r\n\r\nПодробности на сайте организаторов.'),
(40, 'К участию в V-м фестивале православной культуры приглашают творческие коллективы Камчатского края', '2019-05-27 01:15:30', 10, NULL, 'Конкурс православной культуры и традиций малых городов и сёл Руси «София-2019» пройдет с 25 по 27 июля на территории храма Софии Премудрости Божией в Средних Садовниках в Москве. Он приурочен к празднованию Дня Крещения Руси и Дня памяти равноапостольного князя Владимира.\r\n\r\nЗаявки принимают до 31 мая. В конкурсе могут принять участие самодеятельные певческие, танцевальные и инструментальные творческие коллективы, и индивидуальные исполнители духовной, классической и народной музыки из малых городов и сельских поселений России.\r\n\r\nВ феврале 2019 года при поддержке Совета Федерации ФС РФ состоялось открытие V фестиваля православной культуры и традиций малых городов и сельских поселений Руси «София-2019». Культурно-просветительский проект призван помочь в сохранении и развитии самобытной российской культуры и поддержать народные творческие коллективы из российской глубинки.\r\n\r\nКонкурс проводится в два этапа: первый этап – прием заявок (до 31 мая) и отбор участников конкурсной программы (до 10 июня). Отбор производится на основе оценки конкурсной заявки и презентационных материалов творческих коллективов и исполнителей и предусматривает формирование списка участников программ конкурсных дней.\r\n\r\nВторой этап – выступление участников конкурсных программ 25, 26 и 27 июля на территории храма Софии Премудрости Божией в Средних Садовниках и определение победителей.\r\n\r\nЗаявки для участия в конкурсной программе принимаются через электронную форму, размещенную на сайте организатора проекта.\r\n\r\nОрганизаторы конкурса: Благотворительный фонд возрождения культуры и традиций малых городов Руси; приход храма Софии Премудрости Божией в Средних Садовниках.\r\n\r\nКонкурс проводится при поддержке комитета Совета Федерации по аграрно-продовольственной политике и природопользованию.'),
(41, 'ХОРЕОГРАФИЧЕСКИЙ АНСАМБЛЬ \"АКАДЕМИЯ ТАНЦА\"', '2019-05-27 01:15:40', 4, NULL, 'Хореографический ансамбль «Академия танца» был создан в 1986 году на базе Камчатского музыкального училища (ныне Колледж искусств). Изначально созданный как коллектив для концертной практики студентов, ансамбль стал ярким явлением в культурной палитре Камчатского края. В программе «Академия танца» представлены разные стили и направления мировой хореографии, отраженные как в массовых постановках, в которых участвуют 15 и более танцоров («Дон Кихот», «Шопениана», «Барыня»), так и в групповых («Лирический вальс», «Чеботуха», «Русский лирический»), а также дуэтных и сольных номерах («Чайка», «Романс»). \r\n	За эти годы сменилось несколько поколений танцоров, многие из коллектива, получив прекрасный стартовый капитал сценической деятельности в «Академия танца», успешно продолжают свою карьеру как артисты, руководители и хореографы различных коллективов в Камчатском крае и за его пределами (театр танца «Контрасты», Государственный академический корякский национальный ансамбль танца «Мэнго», Кубанский казачий хор, ансамбль «Ритмы планеты» и др.). \r\n	Ансамбль «Академия танца» – постоянный участник различных концертных программ колледжа искусств, творческих мероприятий муниципального и регионального уровней, включая  благотворительные вечера, краевые фестивали и конкурсы («Россия начинается с Камчатки», «Студенческая весна» и др.). Только за последний год  ансамбль имеет благодарности за участие в Краевом фестивале-конкурсе «Камчатка – от флейты до тубы», в Краевом фестивале-конкурсе национальных культур «Дружба без границ». \r\nВ марте 2013 года солистка ансамбля Татьяна Капинос с сольной композицией «Чайка» стала лауреатом 3 премии Всероссийского конкурса хореографического искусства в г. Москве. \r\nВ ноябре 2014 года на международном конкурсе-фестивале хореографического искусства «Легенды Средиземноморья» (Испания) ансамбль стал лауреатом 1 премии в номинации «Классический танец» и лауреатом 1 премии в номинации «Неоклассика».\r\nКоллектив не пугают гастрольные поездки по отдаленным районам Камчатского края (Усть-Большерецкий, Быстринский районы, Мильково и др.), где они не только выступают с концертными программами, но и ведут активную профориентационную работу, а также проводят мастер-классы для детей и юношества. Отличительной чертой ансамбля являются его совместные постановки с коллективом хореографического отделения Детской музыкальной школы при колледже искусств.\r\n	С 1994 года по инициативе руководителя коллектива Туник С.Г. при активном участии ансамбля «Академия танца» проводится ежегодное мероприятие «Танцевальный вернисаж», в котором демонстрируют свои сценические работы  лучшие коллективы Камчатского края. Каждый раз – это уникальное, незабываемое шоу музыки, танца, света и фантазии.\r\n	Бессменным художественным руководителем ансамбля «Академия танца» является Заслуженный работник культуры Российской Федерации Туник Светлана Геннадьевна, которая смогла собрать на отделении народного художественного творчества прекрасную команду хореографов-преподавателей, принимающих участие в работе коллектива. Александрова Анна Михайловна, Кваша Елена Владимировна и Яблочкова Ирина Владленовна ежегодно представляют на суд публики оригинальные постановки в самых разнообразных жанрах, стилях и направлениях.'),
(42, 'Камчатский камерный оркестр имени Георгия Аввакумова', '2019-05-27 01:15:40', 4, NULL, 'Создан в 1973г. Лауреат Всесоюзного и Международных конкурсов. Участвует во всех крупных мероприятиях краевого значения.  Постоянно  проводит концерты в рамках филармонических сезонов. Широкий жанровый и стилевой диапазон оркестра. От миниатюры до симфонии, от Моцарта до современных композиторов. С оркестром в разные годы работало большое количество российских и зарубежных солистов и дирижеров.\r\nЗарубежные гастроли:\r\n1989, 1991, 1992, 1993, 1995 г.г._________   Чехословакия\r\n1994, 1995 г.г._________________________ Австрия\r\n1995г.________________________________ Италия\r\n1994-1995 г.г._________________________  Испания\r\n1999г.________________________________ Чехия\r\n2000г.________________________________ Сербия\r\n2014г.________________________________Австрия\r\n'),
(43, 'Струнный квартет Прикосновение', '2019-05-27 01:15:40', 4, NULL, 'Создан в 2009г.В состав коллектива входят музыканты Камчатского камерного оркестра им. Г. Аввакумова. Проводит концерты в детских садах, школах, интернатах прививая детям любовь к классической музыке, а также проводит концерты на предприятиях, в организациях и  спец. мероприятиях. Репертуар: популярные классические произведения, популярная легкая музыка, специальные детские программы.'),
(44, 'Народный детский цирк «Саквояж»', '2019-05-27 01:15:40', 4, NULL, 'Творческий коллектив НДЦ «Саквояж» является первопроходцем детского циркового искусства на Камчатке. Коллектив готовится отметить свой 25-летний юбилей. За это время коллектив получил признание в России и за рубежом. Сегодня народный детский цирк «Саквояж» - это 200 учащихся, из них 100 детей в возрасте 2-х и 3- лет. В мае каждого года проводится конкурсный отбор среди детей. Учащиеся обучаются основам циркового жанра: гимнастике, акробатике, жонглированию, эквилибристике и хореографии.\r\n			Режим работы:\r\n			Понедельник, вторник, среда, четверг, пятница с 9:00 до 15:00 методическое время.\r\n			Группа «Спутник» - ПН, СР, ПТ с 15:30 до 17:00;\r\n			Основной состав – ПН, СР, ПТ с 17:00 до 19:00, ВТ,ЧТ с 19:00 до 21:00;\r\n			Старшая группа – ПН, СР, ПТ с 19:00 до 21:00;\r\n			Младшая группа – ВТ, ЧТ с 17:30 до 18:00;\r\n			Средняя группа – ВТ, ЧТ с 18:00 до 18:45;\r\n			Постановочный день – СБ с 9:00 до 21:00.\r\n			'),
(45, 'Русский квартет Камчатка', '2019-05-27 01:15:40', 4, NULL, 'Основан в 2006г. Дипломант международного конкурса. Проводит концерты в рамках филармонических сезонов, в детских садах, школах, интернатах, прививая детям любовь к классической музыке, а также проводит концерты на предприятиях, в организациях и  спец. мероприятиях. Репертуар: классика и русский фольклор, сочинения современных авангардистских композиторов, старинные миниатюры и джаз.  Зарубежные гастроли: Греция, Китай.'),
(46, 'Памятник Петру и Павлу', '2019-05-27 01:15:49', 6, 2, 'Настоящим украшением города является высокий шестиметровый памятник из бронзы, изображающий апостолов Петра и Павла. Они вот уже на протяжении нескольких веков являются покровителями города и его заступниками.\r\n\r\nПамятник был изготовлен и установлен под покровительством благотворительного фонда Николая Чудотворца. Памятник открыли 16 октября 2005 года, когда на Камчатке праздновали трёхвековой юбилей православия. До этого момента в городе не было ни одного памятника, который был бы посвящён святым.\r\n\r\nБлаготворительный фонд Николая Чудотворца с начала века занимается благотворительностью, поддерживает строительство и ремонт церквей. Фонд вместе с верующими города совместно обсуждали не только место установки, но и даже макет памятника. Он был выставлен в храме Николая Чудотворца вместе с книгой отзывов и предложений. В ней жители записывали что бы они хотели видеть и своё отношение к этому проекту.\r\n\r\nМесто выбрали почти сразу и после этого площадку под памятник разровняли на берегу бухты Авачинской. Митрополит Смоленский и Калининградский освятил место и теперь восточный рубеж России находится под охраной двух сильнейших апостолов.'),
(47, 'Памятник Святителю Николаю Чудотворцу', '2019-05-27 01:15:49', 6, 2, 'Памятник Николаю Чудотворцу, стоящий в городе Петропавловск-Камчатский, является поистине уникальным. Он является олицетворением иконы, написанной в древности, «Никола Мажайский».\r\n\r\nВ центре города 19 декабря 2008 года состоялась церемония открытия памятника. Этот день был выбран совершенно не случайно, так как именно 19 декабря православные христиане отмечают день Николая Чудотворца. Скульптуру установили рядом с Никольской сопкой за драматическим театром города. Рядом расположена часовня, которая является памятником.\r\n\r\nЭту часовню установили в честь события, произошедшего в 1854 году, когда защитники города отстояли порт, и отразили нападение объединённых сил Англии и Франции, которые в разы превосходили русский гарнизон по численность не только солдат, но и орудий.\r\n\r\nАвтором скульптуры стал художник Сергей Исаков. Монумент был изготовлен на собранные деньги фонда Святителя Николая Чудотворца, который устанавливает подобные памятники святым по всей стране.\r\n\r\nПамятник получился высотой в три с половиной метра и весом более тонны. Его лик обращён на восток, по православной традиции. Весь образ святого воспроизведён с очень древней и редкой иконы, что делает именно эту статую уникальной. В руках святого изображены меч, обращённый остриём вверх и здание храма, как символ силы веры и борьбы  церкви за души людей.'),
(48, 'Памятник английскому мореплавателю Чарльзу Кларку', '2019-05-27 01:15:49', 6, 2, 'Петропавловск-Камчатский — это город, который располагается в непосредственной близости от моря. На улице Ленинской расположен памятник мореплавателю из Англии Чарльзу Кларку. Это единственный памятник на территории России, который  напоминает нам о нескольких кругосветных путешествиях Джеймса Кука.\r\n\r\nКларк участвовал во всех из них, а в третьем был помощником капитана. После того, как Джеймс Кук погиб, Чарльз Кларк возглавил экспедицию. Казалось бы что связывает английских мореходов и Российский город. Но в 1779 году корабль вошёл в Петропавловскую гавань и здесь пополнил запасы продовольствия.\r\n\r\nПечально, но Кларк умер в тот же год. Перед Беренговым проливом моряки попали в ледяной затор и новый капитан подхватил лёгочную чахотку, от которой и скончался. Перед смертью от завещал похоронить себя на Камчатке в деревне под названием Паратунка, где он побывал.\r\n\r\nВ 1804 году корабли под командованием Ивана Фёдоровича Крузенштерна зашли в ту же гавань, находясь в первом кругосветном путешествии. Моряки установили на могиле Чарльза Кларка деревянный памятник, а через 14 лет начальник Камчатки издал указ перенести его в центр города. И уже почти через век английская коллегия установила на могиле своего соотечественника гранитный обелиск, коей и стоит сейчас в городе.'),
(49, 'Памятник Жан-Франсуа Гало Лаперузу', '2019-05-27 01:15:49', 6, 2, 'Находясь в Петропавловске-Камчатском, городе, который является морским портом, совсем не удивительно видеть памятники мореплавателям. Потому одним из самых первых  памятников, которые были установлены в городе, является монумент мореходу из Франции Жану-Франсуа Гало Лаперузу.\r\n\r\nМореплаватель был в этом месте во время своего кругосветного путешествия в 1787 году. Жители города хорошо встретили моряков и всячески оказывали им помощь. Именно это он писал в своих благодарственных и восторженных письмах послу из Франции в Санкт-Петербурге. Данные письма так и хранятся сейчас а архиве института истории.\r\n\r\nК сожалению во время его похода случилось трагедия. Два корабля на которых шли моряки подплывали к берегам Австралии, когда связь с ними прекратилась. Долгое время о судьбе десятков человек не было ничего известно. И только спустя 34 года останки кораблей были найдены совершенно случайно на архипелаге Вера-Крус.\r\n\r\nПамятник им был установлен в Петропавловске-Камчатском в 1843 году. По инициативе французского правительства по высочайшему разрешению из столицы, властям Камчатки передали чертежи памятника. Именно здесь он был изготовлен и установлен между двумя сопками — Никольской и Сигнальной.\r\n\r\nТаким он простоял до 1854 года, когда во время осады порта англо-французская эскадра разрушила памятник. Его восстановили силами учёного поляка Б.И. Дыбовского в 1882 году. Но уже через 10 лет мореплаватели с крейсера «Забияка» на каменное основание старинного памятника установили округлый камень, цепи и якорь. И именно такой вариант власти Камчатки перенесли на улицу Ленинскую в 30-е годы прошлого столетия.'),
(50, 'Памятник Витусу Берингу', '2019-05-27 01:15:49', 6, 2, 'Ученые считают, что памятник был изготовлен в Санкт-Петербурге и является самым старым памятником, установленном на Камчатке.\r\n\r\nПамятник Витусу Берингу расположен в центральной части Петропавловска-Камчатского. Памятник находится на постаменте и представляет собой двухметровую металлическую колону, на конце которой находится капитель. Также, памятник украшен цветками лотоса.\r\n\r\nПамятник установлен в честь основателя Петропавловска-Камчатского Витуса Беринга. К слову, Витус Беринг скончался в 1742 году на необитаемом острове в Тихом Океане.\r\n\r\nНа сегодняшний день этот остров называется в честь великого мореплавателя. Памятник был отлит и установлен на пожертвования морских офицеров. Памятник Витусу Берингу впервые был упомянут Фредериком Бичи, который в 1827 году посетил порт.\r\n\r\nПамятник находится в небольшом зеленом сквере. К памятнику Витуса Беринга ведет широкая дорожка, которая покрыта гравием. После своей установки памятник несколько раз менял место своего нахождения. На улице Ленинской памятник находится и готов для посещения с 16 октября 1945 года.'),
(51, 'Графика Юрия Ви', '2019-06-08 07:01:19', 8, 12, '<p>На сайте художественного музея начнет работу виртуальная выставка произведений известного камчатского художника, члена Союза художников России Юрия Ви (1948-1998), посвященная 70-летию со дня рождения автора.</p>\r\n\r\n	<p>В своем творчестве Юрий Ви отдавал предпочтение графике – рисунку, акварели, занимался офортом, литографией. Вся творческая судьба художника была связана с Камчаткой. Великолепный рисовальщик – он создал целую галерею психологически тонких портретов жителей Севера и деятелей культуры («А.В. Гуторов», «Б. Елтыгин. Бухта Наталии», «Женя Ятгиргин», «Художник Кирилл Килпалин», «Автопортрет», «Радмир Коренев», «Георгий Аввакумов»).</p>\r\n\r\n	<p>Одна из основных тем его творчества – тема жизни и быта народностей Севера, в которой художник запечатлел незатейливый уклад их жизни («Старый рыбак», «Юкольник», «Пейзаж с чайкой», «Натюрморт с батом»). Много работ Юрий Ви посвятил природе Камчатки: озеру Курильскому, бухте Натальи, Налычевской долине и др. В его пейзажах – сдержанность, и поэтичность («Падает снег», серия «Весенний лес. Налычевская долина» и т.д.).</p>\r\n\r\n	<p>В 1994 году во время пребывания на Аляске (США) по приглашению Беринговоморского комитета по культурному обмену, он выполнил серию рисунков – достопримечательностей Уналашки («Русская церковь в Уналашке» и др.).</p>\r\n\r\n	<p>Справка: Юрий Ви родился 15 декабря 1948 года в Корее. В 1948 году семья приехала в поселок Кировский Соболевского района Камчатской области. В 1971 году окончил Московское художественно-промышленное училище им. М. И. Калинина, в 1982 году – Московский полиграфический институт, отделение книжной графики. С 1971 по 1978 годы работал художником на Камчатской студии телевидения, затем в Камчатских художественно-производственных мастерских Художественного фонда РСФСР, с 1995 по 1998 годы – главным художником издательства «Камчатский печатный двор».</p>\r\n\r\n	<p>С 1967года – участник городских, областных, зональных, республиканских, всесоюзных, зарубежных (США, Япония) художественных выставок. Член Союза художников СССР с 1989 года, (с 1992 года – Союза художников России).</p>\r\n\r\n	<p>Произведения Юрия Ви находятся в фондах Камчатского краевого объединенного музея, Камчатского краевого художественного музея, портретной галереи «Скрижали Камчатки», собрании Беринговоморского комитета по культурному обмену (Уналашка, Аляска, США), в частных собраниях России и за рубежом.</p>\r\n\r\n	<p><b>Телефон для справок:</b> 42-39-29</p>'),
(52, 'Памяти французского мореплавателя Лаперуза', '2019-06-08 07:01:19', 8, 12, '<p>Виртуальная выставка, приуроченная к Международному дню памятников и исторических мест (Дню всемирного наследия).</p>\r\n\r\n<p>Один из старейших памятников в Петропавловске-Камчатском – памятник французскому мореплавателю XVIII века Жану-Франсуа де Гало Лаперузу. В центре Петропавловска-Камчатского, установлен памятник в честь визита кругосветной экспедиции Лаперуза на фрегатах «Астролябия» и «Буссоль» в Петропавловскую гавань в 1787 году.</p>\r\n\r\n<p>Данная выставка знакомит с биографией Лаперуза, его жизнью, успехами и поражениями. Представлены фотографии памятника в разные годы, гравюры из фондов музея. Посетителям выставки представится возможность проследить его уникальные экспедиции, прекрасные и удивительные! Выставка сопровождается историческими сведениями о французском мореходе.</p>\r\n\r\n<p>Научно-просветительной целью выставки является распространение сведений о культурно-историческом наследии России, а также развитие и углубление знаний об истории и культуре родного края.</p>\r\n\r\n<p>Проект размещен на <a href=\"http://kamchatka-museum.ru/\">сайте</a> учреждения и доступен широкому кругу пользователей.</p>\r\n\r\n<p><b>Телефон для справок:</b> +7 (4152) 41-26-44</p>'),
(53, 'Мы памятью хранимы', '2019-06-08 07:01:19', 8, 12, '<p>В Мильково откроется выставка предметов Великой Отечественной войны, на которой будут представлены более 50 экспонатов из фондов Мильковского музея.</p>\r\n\r\n<p>Экспозиция, приуроченная к 74 годовщине Победы советского народа в Великой Отечественной войне, представит фотопортреты мильковских ветеранов Великой Отечественной, принесённые в дар музею личные документы, фотографии, предметы военного и мирного быта и многое другое, что хранит память об ушедших из жизни героях войны.</p>\r\n\r\n<p>Целью данной выставки является популяризация музейных коллекций, краеведческих знаний, патриотическое воспитание, укрепление связей с местным сообществом.</p>\r\n\r\n<p>Проект носит просветительский характер и не предполагает возрастных ограничений.</p>\r\n\r\n<p><b>Телефон для справок:</b> +7(4153)-32-25-06</p>'),
(54, 'Древняя Камчатка. Куклы в национальных костюмах', '2019-06-08 07:01:19', 8, 12, '<p>Персональная выставка Анны Манько представит изделия декоративно-прикладного искусства – кукол в национальных костюмах коренных малочисленных народов Севера, проживающих в Камчатском крае.</p>\r\n\r\n<p>В экспозиции выставки будет представлено около тридцати кукол в национальных костюмах ительменов, коряков, эвенов, а также предметы материальной культуры коренных малочисленных народов Севера. Дополнят экспозицию макеты традиционных жилищ северных народов, фотографии, графические произведения.</p>\r\n\r\n<p>Для справки:</p>\r\n\r\n<p>Анна Владимировна Манько обучалась ремеслу и сотрудничала с творческой мастерской «Этнодизайн». Истоки ее творчества – в обращении к своим национальным корням, к искусству ительменского народа. Творчество мастерицы связано с возрождением и развитием традиционной национальной культуры народов Севера.</p>\r\n\r\n<p>Анна Манько проводит мастер-классы по народному декоративно-прикладному искусству во время проведения фестивалей, ярмарок, творческих лабораторий, активно участвует в краевых, всероссийских, международных выставках декоративно-прикладного искусства. Её работы находятся в коллекциях Государственного Российского Дома народного творчества им. В.Д. Поленова, Камчатского краевого художественного музея, Камчатского центра народного творчества, в частных коллекциях в России и за рубежом.</p>\r\n\r\n<p>Мероприятие носит просветительский характер и не предполагает возрастных ограничений.</p>\r\n\r\n<p><b>Телефон для справок:</b> +7 (4152) 42-42-88</p>'),
(55, 'Пластилиновый мир Людмилы Тарчевской', '2019-06-08 07:01:19', 8, 12, '<p>Персональная выставка. В экспозиции будет представлено около 70 работ, выполненных в уникальной технике пластилинографии. Автор, используя богатые художественные возможности пластилина, с большим мастерством «рисует» этим пластичным материалом букеты цветов, пейзажи и сюжетные композиции. Её работы выглядят необыкновенно свежо и сочно, наполнены игрой ярких красок, отражают переменчивые состояния природы, создают иллюзию подвижности и мерцания.</p>\r\n\r\n<p>«Пластилиновая живопись» – не единственное творческое увлечение Людмилы Тарчевской. На своей персональной выставке она представит серию авторских фотографий «Небеса».</p>\r\n\r\n<p>Людмила Анатольевна Тарчевская родилась 29 октября 1952 года в городе Сучане Приморского края. В 1971 году окончила Владивостокское педагогическое училище, дошкольное отделение. В том же году приехала жить на Камчатку. Работала воспитателем и музыкальным руководителем в поселках Новый и Пионерский Елизовского района. С детства увлекалась пением, танцами, рисованием, играла на баяне, фортепиано и гитаре. Впервые «рисовать» пластилином начала в 2008 году. С 2009 года становится участником выставок декоративно-прикладного творчества.</p>\r\n\r\n<p>В рамках работы выставки 29 мая в 17.00 часов в музее состоится творческая встреча с Людмилой Тарчевской.</p>\r\n\r\n<p>Выставка не предполагает возрастных ограничений.</p>\r\n\r\n<p>Телефон для справок: +7 (4152) 42-42-88</p>'),
(56, 'Графика Юрия Ви', '2019-06-09 00:33:08', 8, 22, '\r\n	<p>На сайте художественного музея начнет работу виртуальная выставка произведений известного камчатского художника, члена Союза художников России Юрия Ви (1948-1998), посвященная 70-летию со дня рождения автора.</p>\r\n\r\n	<p>В своем творчестве Юрий Ви отдавал предпочтение графике – рисунку, акварели, занимался офортом, литографией. Вся творческая судьба художника была связана с Камчаткой. Великолепный рисовальщик – он создал целую галерею психологически тонких портретов жителей Севера и деятелей культуры («А.В. Гуторов», «Б. Елтыгин. Бухта Наталии», «Женя Ятгиргин», «Художник Кирилл Килпалин», «Автопортрет», «Радмир Коренев», «Георгий Аввакумов»).</p>\r\n\r\n	<p>Одна из основных тем его творчества – тема жизни и быта народностей Севера, в которой художник запечатлел незатейливый уклад их жизни («Старый рыбак», «Юкольник», «Пейзаж с чайкой», «Натюрморт с батом»). Много работ Юрий Ви посвятил природе Камчатки: озеру Курильскому, бухте Натальи, Налычевской долине и др. В его пейзажах – сдержанность, и поэтичность («Падает снег», серия «Весенний лес. Налычевская долина» и т.д.).</p>\r\n\r\n	<p>В 1994 году во время пребывания на Аляске (США) по приглашению Беринговоморского комитета по культурному обмену, он выполнил серию рисунков – достопримечательностей Уналашки («Русская церковь в Уналашке» и др.).</p>\r\n\r\n	<p>Справка: Юрий Ви родился 15 декабря 1948 года в Корее. В 1948 году семья приехала в поселок Кировский Соболевского района Камчатской области. В 1971 году окончил Московское художественно-промышленное училище им. М. И. Калинина, в 1982 году – Московский полиграфический институт, отделение книжной графики. С 1971 по 1978 годы работал художником на Камчатской студии телевидения, затем в Камчатских художественно-производственных мастерских Художественного фонда РСФСР, с 1995 по 1998 годы – главным художником издательства «Камчатский печатный двор».</p>\r\n\r\n	<p>С 1967года – участник городских, областных, зональных, республиканских, всесоюзных, зарубежных (США, Япония) художественных выставок. Член Союза художников СССР с 1989 года, (с 1992 года – Союза художников России).</p>\r\n\r\n	<p>Произведения Юрия Ви находятся в фондах Камчатского краевого объединенного музея, Камчатского краевого художественного музея, портретной галереи «Скрижали Камчатки», собрании Беринговоморского комитета по культурному обмену (Уналашка, Аляска, США), в частных собраниях России и за рубежом.</p>\r\n\r\n	<p><b>Телефон для справок:</b> 42-39-29</p>'),
(57, 'Памяти французского мореплавателя Лаперуза', '2019-06-09 00:33:08', 8, 22, '<p>Виртуальная выставка, приуроченная к Международному дню памятников и исторических мест (Дню всемирного наследия).</p>\r\n\r\n<p>Один из старейших памятников в Петропавловске-Камчатском – памятник французскому мореплавателю XVIII века Жану-Франсуа де Гало Лаперузу. В центре Петропавловска-Камчатского, установлен памятник в честь визита кругосветной экспедиции Лаперуза на фрегатах «Астролябия» и «Буссоль» в Петропавловскую гавань в 1787 году.</p>\r\n\r\n<p>Данная выставка знакомит с биографией Лаперуза, его жизнью, успехами и поражениями. Представлены фотографии памятника в разные годы, гравюры из фондов музея. Посетителям выставки представится возможность проследить его уникальные экспедиции, прекрасные и удивительные! Выставка сопровождается историческими сведениями о французском мореходе.</p>\r\n\r\n<p>Научно-просветительной целью выставки является распространение сведений о культурно-историческом наследии России, а также развитие и углубление знаний об истории и культуре родного края.</p>\r\n\r\n<p>Проект размещен на <a href=\"http://kamchatka-museum.ru/\">сайте</a> учреждения и доступен широкому кругу пользователей.</p>\r\n\r\n<p><b>Телефон для справок:</b> +7 (4152) 41-26-44</p>'),
(58, 'Мы памятью хранимы', '2019-06-09 00:33:08', 8, 22, '<p>В Мильково откроется выставка предметов Великой Отечественной войны, на которой будут представлены более 50 экспонатов из фондов Мильковского музея.</p>\r\n\r\n<p>Экспозиция, приуроченная к 74 годовщине Победы советского народа в Великой Отечественной войне, представит фотопортреты мильковских ветеранов Великой Отечественной, принесённые в дар музею личные документы, фотографии, предметы военного и мирного быта и многое другое, что хранит память об ушедших из жизни героях войны.</p>\r\n\r\n<p>Целью данной выставки является популяризация музейных коллекций, краеведческих знаний, патриотическое воспитание, укрепление связей с местным сообществом.</p>\r\n\r\n<p>Проект носит просветительский характер и не предполагает возрастных ограничений.</p>\r\n\r\n<p><b>Телефон для справок:</b> +7(4153)-32-25-06</p>'),
(59, 'Древняя Камчатка. Куклы в национальных костюмах', '2019-06-09 00:33:08', 8, 22, '<p>Персональная выставка Анны Манько представит изделия декоративно-прикладного искусства – кукол в национальных костюмах коренных малочисленных народов Севера, проживающих в Камчатском крае.</p>\r\n\r\n<p>В экспозиции выставки будет представлено около тридцати кукол в национальных костюмах ительменов, коряков, эвенов, а также предметы материальной культуры коренных малочисленных народов Севера. Дополнят экспозицию макеты традиционных жилищ северных народов, фотографии, графические произведения.</p>\r\n\r\n<p>Для справки:</p>\r\n\r\n<p>Анна Владимировна Манько обучалась ремеслу и сотрудничала с творческой мастерской «Этнодизайн». Истоки ее творчества – в обращении к своим национальным корням, к искусству ительменского народа. Творчество мастерицы связано с возрождением и развитием традиционной национальной культуры народов Севера.</p>\r\n\r\n<p>Анна Манько проводит мастер-классы по народному декоративно-прикладному искусству во время проведения фестивалей, ярмарок, творческих лабораторий, активно участвует в краевых, всероссийских, международных выставках декоративно-прикладного искусства. Её работы находятся в коллекциях Государственного Российского Дома народного творчества им. В.Д. Поленова, Камчатского краевого художественного музея, Камчатского центра народного творчества, в частных коллекциях в России и за рубежом.</p>\r\n\r\n<p>Мероприятие носит просветительский характер и не предполагает возрастных ограничений.</p>\r\n\r\n<p><b>Телефон для справок:</b> +7 (4152) 42-42-88</p>'),
(60, 'Пластилиновый мир Людмилы Тарчевской', '2019-06-09 00:33:08', 8, 22, '<p>Персональная выставка. В экспозиции будет представлено около 70 работ, выполненных в уникальной технике пластилинографии. Автор, используя богатые художественные возможности пластилина, с большим мастерством «рисует» этим пластичным материалом букеты цветов, пейзажи и сюжетные композиции. Её работы выглядят необыкновенно свежо и сочно, наполнены игрой ярких красок, отражают переменчивые состояния природы, создают иллюзию подвижности и мерцания.</p>\r\n\r\n<p>«Пластилиновая живопись» – не единственное творческое увлечение Людмилы Тарчевской. На своей персональной выставке она представит серию авторских фотографий «Небеса».</p>\r\n\r\n<p>Людмила Анатольевна Тарчевская родилась 29 октября 1952 года в городе Сучане Приморского края. В 1971 году окончила Владивостокское педагогическое училище, дошкольное отделение. В том же году приехала жить на Камчатку. Работала воспитателем и музыкальным руководителем в поселках Новый и Пионерский Елизовского района. С детства увлекалась пением, танцами, рисованием, играла на баяне, фортепиано и гитаре. Впервые «рисовать» пластилином начала в 2008 году. С 2009 года становится участником выставок декоративно-прикладного творчества.</p>\r\n\r\n<p>В рамках работы выставки 29 мая в 17.00 часов в музее состоится творческая встреча с Людмилой Тарчевской.</p>\r\n\r\n<p>Выставка не предполагает возрастных ограничений.</p>\r\n\r\n<p>Телефон для справок: +7 (4152) 42-42-88</p>'),
(61, 'Всероссийский музей А.С. Пушкина объявляет о начале масштабной акции к 220-летию со дня рождения поэта', '2019-06-09 22:58:09', 11, NULL, '<p>До 1 июня 2019 года любой желающий может поздравить Пушкина, разместив свои видео или фотографии с поздравлениями и признаниями в любви великому поэту в социальных сетях.</p>\r\n\r\n<p>Присоединиться к акции можно, разместив свои поздравления в социальных сетях ВКонтакте, Facebook, Tweeter, Instagram с хэштегом #СДнемРожденияПушкин220 или #HappyBirthdayPushkin220 и отметкой Всероссийский музей А. С. Пушкина или оправив их на адрес электронной почты акции <b>pushkinbirthday220@museumpushkin.ru</b>.</p>\r\n\r\n<p>За два года существования акции великого поэта поздравил без преувеличения весь мир. В проекте приняли участие люди самых разных возрастов и социального статуса. Пушкина поздравляли известные деятели культуры и искусства, а также политики. В 2018 году к акции присоединилось Постоянное представительство России при ООН и Русская служба новостей ООН.</p>\r\n\r\n<p>Кульминацией акции по традиции становится трансляция поздравления во дворе знаменитого дома на наб. реки Мойки, 12, во время праздничных мероприятий 6 июня. Все видео с поздравлениями находятся в постоянном доступе на сайте музей.</p>\r\n\r\n<p><a href=\"http://www.museumpushkin.ru/\">Официальный сайт</a> организатора акции</p>'),
(62, 'Минкультуры России приглашает камчатских школьников принять участие в конкурсах, посвященных Году театра', '2019-06-09 22:58:09', 11, NULL, '<p>23 апреля стартовал прием заявок для участия в конкурсах Всероссийского культурно-образовательного проекта «ТЕАТР - ДЕТИ». Официальный старт проекту был дан в Нижнем Новгороде в рамках Всероссийского театрального марафона. </p>\r\n\r\n<p>Проект включает два направления - всероссийский конкурс театральных рецензий «Пишем о театре!» для школьников в возрасте 11 – 16 лет и абитуриентов 17 – 18 лет, а также конкурс рисунков, посвященных театру, среди детей 6 – 10 лет.</p>\r\n\r\n<p>Прием заявок на участие в конкурсе «Пишем о театре» среди абитуриентов в возрасте от 17 до 18 лет осуществляется до 30 мая 2019 года. Специальное жюри Конкурса определит до 15 победителей. Оценка конкурсных работ будет завершена к 10 июня 2019 года.</p>\r\n\r\n<p>Конкурс «Пишем о театре» среди школьников в возрасте 11 – 16 лет и детский конкурс рисунков, посвященных театру, проводятся в два этапа: региональный и федеральный. Участники регионального этапа Конкурса, получившие наибольшее количество баллов, признаются победителями регионального этапа, и их работы рекомендуются для участия в федеральном этапе.</p>\r\n\r\n<p>Работы для участия в региональном этапе конкурса необходимо направить в срок до 1 августа 2019 года по адресу электронной почты theaterforchildren@yandex.ru. <b>Телефон для справок</b> <a href=\"tel:+74152417078\">+7(4152)41-70-78</a>.\r\nБолее подробная информация и положения о конкурсах можно найти на <a href=\"2019.culture.ru/for-children\">официальном сайте</a> проекта.</p>'),
(63, 'Акция «Ночь музеев» пройдет в России уже в тринадцатый раз', '2019-06-09 22:58:09', 11, NULL, '<p>Акция «Ночь музеев» пройдет в России уже в тринадцатый раз, в прошлом году к ней присоединилось более 2 300 000 человек. Это единственное время в году, когда культурные учреждения по всей стране работают в вечернее и ночное время. Картинные галереи и музеи, арт-пространства и театры готовят для посетителей специальные программы: выставки, концерты, квесты и мастер-классы.</p>\r\n\r\n<p>Организаторы акции — Министерство культуры Российской Федерации и портал культурного наследия и традиций России «Культура.РФ». В нашем спецпроекте вы найдете лучшие события «Ночи музеев», истории экспонатов и музейных зданий, интересные факты о шедеврах и их создателях.</p>');
INSERT INTO `publications` (`publication_id`, `publication_title`, `publication_date`, `publication_type_id`, `publication_category_id`, `publication_text`) VALUES
(64, 'Режиссерская лаборатория «КЛАССИКИ - ДЕТЯМ» пройдет в краевой столице', '2019-06-09 22:58:09', 11, NULL, '<p>В течение двух дней 26 и 27 мая зрителям будет доступна возможность увидеть «эскизы» - уникальные мини-спектакли, поучаствовать в их обсуждении и повлиять на судьбу дальнейшей постановки.</p>\r\n\r\n<p>Эскизы подготовят 4 режиссера из Петербурга и Москвы, которые специально приедут на лабораторию по приглашению театра. Мини-спектакли будут поставлены по произведениям русской классики, адресованной детям. Каждый из режиссеров выберет по одному произведению указанных авторов (А.П. Чехова, И.С. Тургенева, Л.Н. Толстого, М.Е. Салтыкова –Щедрина, А. Н Толстого, А.С. Пушкина) и напишет собственную инсценировку, которая будет поставлена за пять дней с участием артистов театра.</p>\r\n\r\n<p>Зрители увидят результат этой напряженной работы на сцене. После спектаклей состоится обсуждение с участием ведущих театральных критиков, которые специально приедут на лабораторию. Лучшие эскизы будут доработаны до полноценных спектаклей и войдут в репертуар Камчатского театра драмы и комедии.</p>\r\n\r\n<p>Лаборатория дает каждому зрителю уникальный шанс увидеть работу театра изнутри, поучаствовать в ней и просто посмотреть раньше других зрителей новый спектакль.</p>\r\n\r\n<p>В рамках лаборатории также запланированы различные формы работы со школами, выступления специалистов по театральной педагогике (отдельные мероприятия, вне показа эскизов).</p>\r\n\r\n<p><b>Показы пройдут</b> 26 мая в 15:00 и 18:00 часов, и 27 мая в 18:00 часов. </p>\r\n\r\n<p><b>Телефон кассы:</b> <a href=\"tel:+74152420294\"></a>8 (4152) 420-294 </p>');

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
  MODIFY `image_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

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
  MODIFY `publication_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `fil_attractions_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `fil_collectivies`
--
ALTER TABLE `fil_collectivies`
  MODIFY `fil_collectivies_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `fil_contests`
--
ALTER TABLE `fil_contests`
  MODIFY `fil_contests_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `fil_events`
--
ALTER TABLE `fil_events`
  MODIFY `fil_events_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `fil_e_books`
--
ALTER TABLE `fil_e_books`
  MODIFY `fil_e_books_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fil_gallery`
--
ALTER TABLE `fil_gallery`
  MODIFY `fil_gallery_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `fil_news`
--
ALTER TABLE `fil_news`
  MODIFY `fil_news_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `fil_organizations`
--
ALTER TABLE `fil_organizations`
  MODIFY `fil_organizations_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `fil_people`
--
ALTER TABLE `fil_people`
  MODIFY `fil_peoples_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `publications`
--
ALTER TABLE `publications`
  MODIFY `publication_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

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
