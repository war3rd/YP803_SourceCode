-- phpMyAdmin SQL Dump
-- version 4.2.0
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： 2014 年 09 月 24 日 13:14
-- 伺服器版本: 5.6.17
-- PHP 版本： 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 資料庫： `Fruits`
--

-- --------------------------------------------------------

--
-- 資料表結構 `FruitsItem`
--

CREATE TABLE IF NOT EXISTS `FruitsItem` (
`id` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `EnglishName` varchar(255) NOT NULL,
  `BigImageFileName` varchar(255) NOT NULL,
  `IconImageFileName` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 資料表的匯出資料 `FruitsItem`
--

INSERT INTO `FruitsItem` (`id`, `Title`, `EnglishName`, `BigImageFileName`, `IconImageFileName`) VALUES
(1, '香蕉', 'Banana', 'banana.png', 'banana40x40.png'),
(2, '番茄', 'Tomato', 'tomato.png', 'tomato40x40.png'),
(3, '芭樂', 'Guava', 'guava.png', 'guava40x40.png');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `FruitsItem`
--
ALTER TABLE `FruitsItem`
 ADD PRIMARY KEY (`id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `FruitsItem`
--
ALTER TABLE `FruitsItem`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
