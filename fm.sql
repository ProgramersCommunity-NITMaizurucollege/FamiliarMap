-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015 年 8 朁E26 日 22:46
-- サーバのバージョン： 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fm`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `event`
--

CREATE TABLE IF NOT EXISTS `event` (
`event_id` bigint(20) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_place` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `event_content` text NOT NULL,
  `event_location` point NOT NULL,
  `event_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- テーブルのデータのダンプ `event`
--

INSERT INTO `event` (`event_id`, `event_name`, `event_place`, `event_date`, `event_content`, `event_location`, `event_timestamp`) VALUES
(1, '人権啓発セミナー【子どもたちに学んだ人権～京都・弥栄中の取材から～】', '商工観光センター 4階', '2015-08-29', '京都市立弥栄中学校の人権教育を密着取材して感じた人権の現状', '\0\0\0\0\0\0\0M�����`@0�''�A@', '2015-08-26 20:45:54');

-- --------------------------------------------------------

--
-- テーブルの構造 `koutu_rosen`
--

CREATE TABLE IF NOT EXISTS `koutu_rosen` (
`koutu_rosen_id` bigint(20) NOT NULL,
  `koutu_time` date NOT NULL,
  `koutu_station1` varchar(255) NOT NULL,
  `koutu_station2` varchar(255) NOT NULL,
  `koutu_state` varchar(255) NOT NULL,
  `koutu_rosen_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=7 ;

--
-- テーブルのデータのダンプ `koutu_rosen`
--

INSERT INTO `koutu_rosen` (`koutu_rosen_id`, `koutu_time`, `koutu_station1`, `koutu_station2`, `koutu_state`, `koutu_rosen_timestamp`) VALUES
(1, '0000-00-00', '東舞鶴駅', '綾部駅間', '運転再開', '2015-08-26 01:41:10'),
(2, '0000-00-00', '園部駅', '福知山駅間', '運転再開', '2015-08-26 01:41:10'),
(3, '0000-00-00', '福知山駅', '豊岡駅間', '運転見合わせ中', '2015-08-26 01:41:11'),
(4, '0000-00-00', '福知山駅', '篠山口駅間', '運転見合わせ中', '2015-08-26 01:41:11'),
(5, '0000-00-00', '東舞鶴駅', '敦賀駅間', '運転再開', '2015-08-26 01:41:11'),
(6, '0000-00-00', '終日運転取り止め', '', '', '2015-08-26 01:41:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
 ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `koutu_rosen`
--
ALTER TABLE `koutu_rosen`
 ADD PRIMARY KEY (`koutu_rosen_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
MODIFY `event_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `koutu_rosen`
--
ALTER TABLE `koutu_rosen`
MODIFY `koutu_rosen_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
