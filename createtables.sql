-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 12, 2023 at 07:39 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `afl`
--

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `logo` varchar(256) NOT NULL,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `logo`, `updated`) VALUES
(1, 'Melbourne', 'Melbourne', '2023-10-23 17:58:19');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `item_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `item_price` float(10,2) DEFAULT NULL,
  `item_price_currency` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payer_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payer_name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payer_email` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payer_country` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `merchant_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `merchant_email` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_id` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `transaction_id` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `paid_amount` float(10,2) NOT NULL,
  `paid_amount_currency` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `payment_source` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_status` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `phoneno` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pswd` varbinary(128) NOT NULL,
  `deposits` float NOT NULL DEFAULT '0',
  `withdrawalrequests` float NOT NULL DEFAULT '0',
  `withdrawalscompleted` float NOT NULL DEFAULT '0',
  `datecreated` date DEFAULT NULL,
  `dateupdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phoneno`, `pswd`, `deposits`, `withdrawalrequests`, `withdrawalscompleted`, `datecreated`, `dateupdated`) VALUES
(10, NULL, 'john@me.com', '', 0x3164363931316466373931323533383339316331646536663833383037373538, 0, 0, 0, '2023-11-12', '2023-11-12 10:18:30'),
(11, '', 'chris@me.com', '', 0x3662333466653234616332666638313033663666636531663064613265663537, 0, 0, 0, '2023-11-12', '2023-11-12 09:53:35'),
(12, NULL, 'david@me.com', NULL, 0x3136313038333837343363633930653365346664646137343832383264396238, 0, 0, 0, '2023-11-12', '2023-11-12 09:53:35'),
(13, NULL, 'ollie@a.com', NULL, 0x3164333161363864393633383434633732376362633765356262653264343365, 0, 0, 0, '2023-11-12', '2023-11-12 09:53:35'),
(14, NULL, 'peter@parker.com', NULL, 0x3531646333306464633437336434336136303131653965626261366361373730, 0, 0, 0, '2023-11-12', '2023-11-12 09:53:35');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


CREATE TABLE `bets` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `betthisjson` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`betthisjson`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `bets`
--
ALTER TABLE `bets`
  ADD PRIMARY KEY (`id`);