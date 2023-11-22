-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 22, 2023 at 04:18 PM
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
-- Table structure for table `bets`
--

DROP TABLE IF EXISTS `bets`;
CREATE TABLE IF NOT EXISTS `bets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `betthisjson` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ;

--
-- Dumping data for table `bets`
--

INSERT INTO `bets` (`id`, `email`, `betthisjson`, `amount`, `datecreated`) VALUES
(1, 'john.horton86@gmail.com', '[{\"gameid\":\"4787\",\"homename\":\"Richmond\",\"homeimg\":\"Richmond.svg\",\"awayname\":\"Carlton\",\"awayimg\":\"Carlton.svg\",\"checked\":true,\"winname\":\"Richmond\"},{\"gameid\":\"4786\",\"homename\":\"Geelong Cats\",\"homeimg\":\"GeelongCats.svg\",\"awayname\":\"Collingwood\",\"awayimg\":\"Collingwood.svg\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"gameid\":\"4785\",\"homename\":\"North Melbourne\",\"homeimg\":\"NorthMelbourne.svg\",\"awayname\":\"West Coast Eagles\",\"awayimg\":\"WestCoastEagles.svg\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"gameid\":\"4789\",\"homename\":\"Gold Coast Suns\",\"homeimg\":\"GoldCoastSuns.svg\",\"awayname\":\"Sydney Swans\",\"awayimg\":\"SydneySwans.svg\",\"checked\":true,\"winname\":\"Gold Coast Suns\"},{\"gameid\":\"4790\",\"homename\":\"GWS Giants\",\"homeimg\":\"GWSGiants.svg\",\"awayname\":\"Adelaide Crows\",\"awayimg\":\"AdelaideCrows.svg\",\"checked\":true,\"winname\":\"GWS Giants\"},{\"gameid\":\"4792\",\"homename\":\"Hawthorn\",\"homeimg\":\"Hawthorn.svg\",\"awayname\":\"Essendon\",\"awayimg\":\"Essendon.svg\",\"checked\":true,\"winname\":\"Essendon\"}]', '0', '2023-11-21 16:52:21'),
(2, 'john.horton86@gmail.com', '[{\"gameid\":\"4787\",\"homename\":\"Richmond\",\"homeimg\":\"Richmond.svg\",\"awayname\":\"Carlton\",\"awayimg\":\"Carlton.svg\",\"checked\":true,\"winname\":\"Richmond\"},{\"gameid\":\"4786\",\"homename\":\"Geelong Cats\",\"homeimg\":\"GeelongCats.svg\",\"awayname\":\"Collingwood\",\"awayimg\":\"Collingwood.svg\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"gameid\":\"4785\",\"homename\":\"North Melbourne\",\"homeimg\":\"NorthMelbourne.svg\",\"awayname\":\"West Coast Eagles\",\"awayimg\":\"WestCoastEagles.svg\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"gameid\":\"4788\",\"homename\":\"Port Adelaide\",\"homeimg\":\"PortAdelaide.svg\",\"awayname\":\"Brisbane Lions\",\"awayimg\":\"BrisbaneLions.svg\",\"checked\":true,\"winname\":\"Port Adelaide\"},{\"gameid\":\"4791\",\"homename\":\"Melbourne\",\"homeimg\":\"Melbourne.svg\",\"awayname\":\"Western Bulldogs\",\"awayimg\":\"WesternBulldogs.svg\",\"checked\":true,\"winname\":\"Melbourne\"},{\"gameid\":\"4789\",\"homename\":\"Gold Coast Suns\",\"homeimg\":\"GoldCoastSuns.svg\",\"awayname\":\"Sydney Swans\",\"awayimg\":\"SydneySwans.svg\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '0', '2023-11-21 23:01:22'),
(3, 'john.horton86@gmail.com', '[{\"gameid\":\"4787\",\"homename\":\"Richmond\",\"homeimg\":\"Richmond.svg\",\"awayname\":\"Carlton\",\"awayimg\":\"Carlton.svg\",\"checked\":true,\"winname\":\"Richmond\"},{\"gameid\":\"4786\",\"homename\":\"Geelong Cats\",\"homeimg\":\"GeelongCats.svg\",\"awayname\":\"Collingwood\",\"awayimg\":\"Collingwood.svg\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"gameid\":\"4785\",\"homename\":\"North Melbourne\",\"homeimg\":\"NorthMelbourne.svg\",\"awayname\":\"West Coast Eagles\",\"awayimg\":\"WestCoastEagles.svg\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"gameid\":\"4788\",\"homename\":\"Port Adelaide\",\"homeimg\":\"PortAdelaide.svg\",\"awayname\":\"Brisbane Lions\",\"awayimg\":\"BrisbaneLions.svg\",\"checked\":true,\"winname\":\"Port Adelaide\"},{\"gameid\":\"4791\",\"homename\":\"Melbourne\",\"homeimg\":\"Melbourne.svg\",\"awayname\":\"Western Bulldogs\",\"awayimg\":\"WesternBulldogs.svg\",\"checked\":true,\"winname\":\"Melbourne\"},{\"gameid\":\"4789\",\"homename\":\"Gold Coast Suns\",\"homeimg\":\"GoldCoastSuns.svg\",\"awayname\":\"Sydney Swans\",\"awayimg\":\"SydneySwans.svg\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '0', '2023-11-21 23:02:50');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
CREATE TABLE IF NOT EXISTS `deposits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `item_number`, `item_name`, `item_price`, `item_price_currency`, `payer_id`, `payer_name`, `payer_email`, `payer_country`, `merchant_id`, `merchant_email`, `order_id`, `transaction_id`, `paid_amount`, `paid_amount_currency`, `payment_source`, `payment_status`, `created`, `modified`) VALUES
(1, 'BET20', 'Pool ticket', 0.00, 'AUD', '2Q7UJUP9C93MN', 'chris vs', 'john.horton86@gmail.com', 'AU', 'N8LQYXWSLFUVY', 'john.horton86-facilitator@gmail.com', '1FE82537D55977259', '32U15850TN3205538', 200.00, 'AUD', 'paypal', 'PENDING', '2023-11-15 14:25:00', '2023-11-15 16:27:30'),
(2, 'BET20', 'Pool ticket', 0.00, 'AUD', 'M339TR7MFUTKU', 'prep ician', 'prepitician@gmail.com', 'AU', 'N8LQYXWSLFUVY', 'john.horton86-facilitator@gmail.com', '8PU21850A4264571F', '42G73688T1691022N', 200.00, 'AUD', 'paypal', 'PENDING', '2023-11-15 14:38:22', '2023-11-15 16:40:34');

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
  `datecreated` date DEFAULT NULL,
  `dateupdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phoneno`, `pswd`, `datecreated`, `dateupdated`) VALUES
(15, NULL, 'john.horton86@gmail.com', NULL, 0x6365363961613963366633326562656564366639383036316363623864303562, '2023-11-17', '2023-11-18 23:42:22'),
(16, NULL, 'tiffaman@gmail.com', NULL, 0x3062303764353236356539666234363761623538376135666432343965396464, '2023-11-17', '2023-11-17 08:43:23');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawalcompleted`
--

DROP TABLE IF EXISTS `withdrawalcompleted`;
CREATE TABLE IF NOT EXISTS `withdrawalcompleted` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `requestid` int NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawalrequests`
--

DROP TABLE IF EXISTS `withdrawalrequests`;
CREATE TABLE IF NOT EXISTS `withdrawalrequests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
