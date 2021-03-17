-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 17 2021 г., 14:12
-- Версия сервера: 10.4.17-MariaDB
-- Версия PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `wowvendor`
--

-- --------------------------------------------------------

--
-- Структура таблицы `race_results`
--

CREATE TABLE `race_results` (
  `id` int(11) NOT NULL,
  `rock_position` int(11) NOT NULL COMMENT 'Позиция препятствия',
  `race_time` float NOT NULL COMMENT 'Время забега, сек.',
  `jump_distance` int(11) NOT NULL COMMENT 'Дистанция прыжка',
  `rock_size` int(11) NOT NULL COMMENT 'Размер препятствия',
  `is_win` tinyint(1) NOT NULL COMMENT 'Выиграл или нет'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `race_results`
--

INSERT INTO `race_results` (`id`, `rock_position`, `race_time`, `jump_distance`, `rock_size`, `is_win`) VALUES
(7, 302, 5.251, 204, 49, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `race_results`
--
ALTER TABLE `race_results`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `race_results`
--
ALTER TABLE `race_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
