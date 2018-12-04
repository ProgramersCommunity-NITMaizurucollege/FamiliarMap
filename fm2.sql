-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017 年 8 月 10 日 08:36
-- サーバのバージョン： 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fm`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `event`
--

CREATE TABLE `event` (
  `event_id` bigint(20) NOT NULL,
  `event_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `event_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `event_date` date NOT NULL,
  `event_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `event_location` point NOT NULL,
  `event_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `event`
--

INSERT INTO `event` (`event_id`, `event_name`, `event_place`, `event_date`, `event_content`, `event_location`, `event_timestamp`) VALUES
(1, 'おもちゃ交換会「かえっこバザール」', '赤れんが4号棟2階', '2015-08-29', '持ってきたおもちゃをポイントと交換。そのポイントで他のおもちゃが買える。\r\n会場での手伝いやワークショップに参加するとポイントを進呈。', '\0\0\0\0\0\0\0MÃÂ¯ÂÂ¤Ã¬`@0Â»\'Â½A@', '2017-08-10 06:35:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD UNIQUE KEY `event_id` (`event_id`),
  ADD UNIQUE KEY `event_name` (`event_name`),
  ADD UNIQUE KEY `event_place` (`event_place`),
  ADD UNIQUE KEY `event_date` (`event_date`),
  ADD UNIQUE KEY `event_timestamp` (`event_timestamp`),
  ADD UNIQUE KEY `event_location` (`event_location`(25));
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
