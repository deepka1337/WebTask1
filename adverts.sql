-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Октябрь 29 2023 г., 13:12
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `adverts`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ads`
--

CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ads`
--

INSERT INTO `ads` (`id`, `user_id`, `title`, `description`) VALUES
(1, 1, '3123123hdfgsdfas', 'gdsdgsdgsdgsd'),
(2, 1, 'rebs', 'reb'),
(3, 1, '213', '213'),
(4, 1, '123', '123'),
(5, 1, 'nil', 'kigers'),
(6, 1, '123123', '123123'),
(7, 1, '123123', '123123123123'),
(8, 1, '123asd', '123asd'),
(9, 1, 'фыафы', 'пвы'),
(10, 1, 'фыафы', 'пвы'),
(11, 1, '423gsdf', 'ghbfn'),
(12, 1, '123', '8763634'),
(13, 1, '3123123hdfgsdfas', 'gdsdgsdgsdgsd'),
(14, 1, '123', '123'),
(15, 1, '12445ен', 'орпа'),
(16, 1, '12445ен', 'орпа'),
(17, 1, '412', 'gfsd'),
(18, 1, 'priv', 'priv'),
(19, 1, '', ''),
(20, 1, '', ''),
(21, 1, '213', 'sda'),
(22, 1, '', ''),
(23, 1, '', ''),
(24, 1, '2314', 'ghf'),
(25, 8, '123123', '123123'),
(26, 8, 'sadsa', 'sads'),
(27, 8, 'mambek', 'mambek');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`) VALUES
(1, '123', '$2y$10$NmbL/GXhqEfDDVbVvzVuAOK7If8TqFCvb.fzZSLTtHHxjjJVUMkMW', '123@123'),
(2, '123456', '$2y$10$rpntM4zBL8jcfPfGEZtsmeNXz7FpzO./M3OCKkQFmH1sUrVgHSDiG', '12@12'),
(3, '123456123456', '$2y$10$bzmrclfAoV8biPT73gTxdO2WFcKWXH3RVmjaIP7zlfdrSZlw8kmtW', '123456123456@123456'),
(4, '123456123456123456', '$2y$10$JmEKVC/VszmTgkF6ZX7GJ.Gesc.E7/USnJglSJAITTXnQXHIQBD0C', '123456123456@123456123456'),
(5, '123456123456123456123456', '$2y$10$i6.AHM7CAtO0ppn9rW.3ieCN1K5bKETgZfnl7VUNbbTb3wD8k.FPO', '123456123456@123456123123456456'),
(6, '123456123456123456123456123456', '$2y$10$rcyn6CaK50681TvxFB0EtuuOmnFq4RxPkjiPvNZSRVXo4CwLamS7a', '123456123123456456@123456123123456456'),
(7, '123456123456123456123456123456123456', '$2y$10$46Nlkzq4krrkz0N8KdxVGudY1N1doXUMTWgFR4newL1FIV1gaXizi', '123456123123412345656456@123456123123456456'),
(8, '123123', '$2y$10$BwYlBb.tDZVZokkRC74rLuynRVdU/ZlIcA8Si2/rnFQnIMizNp0Yq', '123123@123123');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ads`
--
ALTER TABLE `ads`
  ADD CONSTRAINT `ads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
