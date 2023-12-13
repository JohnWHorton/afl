-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 13, 2023 at 06:54 AM
-- Server version: 8.0.35-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.14

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

DROP DATABASE `afl`;

CREATE DATABASE IF NOT EXISTS `afl` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `afl`;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
CREATE TABLE `deposits` (
  `id` int NOT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `email`, `amount`, `datecreated`) VALUES
(3, 'john.horton86@gmail.com', '450', '2023-11-26 12:52:00'),
(6, 'tiffaman@gmail.com', '300', '2023-11-30 16:18:59'),
(7, 'john.horton86@gmail.com', '200', '2023-12-03 07:24:18'),
(8, 'john.horton86@gmail.com', '100', '2023-12-03 07:25:08'),
(9, 'tiffaman@gmail.com', '500', '2023-12-04 13:29:31'),
(10, 'aflpools@gmail.com', '100', '2023-12-09 12:07:49'),
(11, 'testuser4@afltest.com', '20', '2023-12-09 13:15:11'),
(12, 'testuser5@afltest.com', '20', '2023-12-11 10:00:50'),
(13, 'testuser5@afltest.com', '120', '2023-12-11 10:11:27'),
(14, 'john.horton86@gmail.com', '220', '2023-12-11 10:43:56'),
(15, 'aflpools@gmail.com', '500', '2023-12-11 11:30:08');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
  `id` int NOT NULL,
  `roundid` int NOT NULL,
  `roundnumber` int NOT NULL,
  `roundname` varchar(64) NOT NULL,
  `gameid` int NOT NULL,
  `venue` varchar(64) NOT NULL,
  `location` varchar(64) NOT NULL,
  `state` varchar(64) NOT NULL,
  `timezone` varchar(128) NOT NULL,
  `utcStartTime` varchar(64) NOT NULL,
  `hometeamid` int NOT NULL,
  `hometeamname` varchar(64) NOT NULL,
  `hometeamnickname` varchar(64) NOT NULL,
  `awayteamid` int NOT NULL,
  `awayteamname` varchar(64) NOT NULL,
  `awayteamnickname` varchar(64) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `result` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `roundid`, `roundnumber`, `roundname`, `gameid`, `venue`, `location`, `state`, `timezone`, `utcStartTime`, `hometeamid`, `hometeamname`, `hometeamnickname`, `awayteamid`, `awayteamname`, `awayteamnickname`, `completed`, `result`) VALUES
(1, 955, 1, 'Round 1', 5899, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-03-14T08:30:00.000+0000', 5, 'Carlton', 'Blues', 16, 'Richmond', 'Tigers', 1, 'Carlton'),
(2, 955, 1, 'Round 1', 5900, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-03-15T08:40:00.000+0000', 3, 'Collingwood', 'Magpies', 13, 'Sydney Swans', 'Swans', 1, 'Collingwood'),
(3, 955, 1, 'Round 1', 5901, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-03-16T02:45:00.000+0000', 12, 'Essendon', 'Bombers', 9, 'Hawthorn', 'Hawks', 1, 'Essendon'),
(4, 955, 1, 'Round 1', 5902, 'GIANTS Stadium', 'Sydney', 'NSW', 'Australia/Sydney', '2024-03-16T05:35:00.000+0000', 15, 'GWS Giants', 'Giants', 6, 'North Melbourne', 'Kangaroos', 1, 'GWS Giants'),
(5, 955, 1, 'Round 1', 5904, 'GMHBA Stadium', 'Geelong', 'VIC', 'Australia/Melbourne', '2024-03-16T08:30:00.000+0000', 10, 'Geelong Cats', 'Cats', 11, 'St Kilda', 'Saints', 1, 'Geelong Cats'),
(6, 955, 1, 'Round 1', 5903, 'Heritage Bank Stadium', 'Gold Coast', 'QLD', 'Australia/Brisbane', '2024-03-16T09:10:00.000+0000', 4, 'Gold Coast Suns', 'Suns', 1, 'Adelaide Crows', 'Crows', 1, 'Gold Coast Suns'),
(7, 955, 1, 'Round 1', 5905, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-03-17T02:00:00.000+0000', 17, 'Melbourne', 'Demons', 8, 'Western Bulldogs', 'Bulldogs', 1, 'Melbourne'),
(8, 955, 1, 'Round 1', 5906, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-03-17T05:00:00.000+0000', 7, 'Port Adelaide', 'Power', 18, 'West Coast Eagles', 'Eagles', 1, 'Port Adelaide'),
(9, 955, 1, 'Round 1', 5907, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-03-17T07:50:00.000+0000', 14, 'Fremantle', 'Dockers', 2, 'Brisbane Lions', 'Lions', 1, 'Fremantle'),
(10, 956, 2, 'Round 2', 5908, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-03-21T08:30:00.000+0000', 11, 'St Kilda', 'Saints', 3, 'Collingwood', 'Magpies', 0, ''),
(11, 956, 2, 'Round 2', 5909, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-03-22T08:40:00.000+0000', 1, 'Adelaide Crows', 'Crows', 10, 'Geelong Cats', 'Cats', 0, ''),
(12, 956, 2, 'Round 2', 5910, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-03-23T02:45:00.000+0000', 6, 'North Melbourne', 'Kangaroos', 14, 'Fremantle', 'Dockers', 0, ''),
(13, 956, 2, 'Round 2', 5911, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-03-23T05:35:00.000+0000', 9, 'Hawthorn', 'Hawks', 17, 'Melbourne', 'Demons', 0, ''),
(14, 956, 2, 'Round 2', 5912, 'SCG', 'Sydney', 'NSW', 'Australia/Sydney', '2024-03-23T08:30:00.000+0000', 13, 'Sydney Swans', 'Swans', 12, 'Essendon', 'Bombers', 0, ''),
(15, 956, 2, 'Round 2', 5913, 'Mars Stadium', 'Ballarat', 'VIC', 'Australia/Melbourne', '2024-03-24T02:00:00.000+0000', 8, 'Western Bulldogs', 'Bulldogs', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(16, 956, 2, 'Round 2', 5915, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-03-24T05:00:00.000+0000', 16, 'Richmond', 'Tigers', 7, 'Port Adelaide', 'Power', 0, ''),
(17, 956, 2, 'Round 2', 5914, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-03-24T07:50:00.000+0000', 18, 'West Coast Eagles', 'Eagles', 15, 'GWS Giants', 'Giants', 0, ''),
(18, 957, 3, 'Round 3', 5916, 'Gabba', 'Brisbane', 'QLD', 'Australia/Brisbane', '2024-03-28T08:30:00.000+0000', 2, 'Brisbane Lions', 'Lions', 3, 'Collingwood', 'Magpies', 0, ''),
(19, 957, 3, 'Round 3', 5917, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-03-29T05:20:00.000+0000', 6, 'North Melbourne', 'Kangaroos', 5, 'Carlton', 'Blues', 0, ''),
(20, 957, 3, 'Round 3', 5918, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-03-29T08:20:00.000+0000', 14, 'Fremantle', 'Dockers', 1, 'Adelaide Crows', 'Crows', 0, ''),
(21, 957, 3, 'Round 3', 5919, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-03-30T05:20:00.000+0000', 12, 'Essendon', 'Bombers', 11, 'St Kilda', 'Saints', 0, ''),
(22, 957, 3, 'Round 3', 5920, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-03-30T08:30:00.000+0000', 7, 'Port Adelaide', 'Power', 17, 'Melbourne', 'Demons', 0, ''),
(23, 957, 3, 'Round 3', 5921, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-03-31T02:00:00.000+0000', 8, 'Western Bulldogs', 'Bulldogs', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(24, 957, 3, 'Round 3', 5922, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-03-31T05:00:00.000+0000', 16, 'Richmond', 'Tigers', 13, 'Sydney Swans', 'Swans', 0, ''),
(25, 957, 3, 'Round 3', 5923, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-04-01T04:20:00.000+0000', 9, 'Hawthorn', 'Hawks', 10, 'Geelong Cats', 'Cats', 0, ''),
(26, 958, 4, 'Round 4', 5924, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-04-04T08:40:00.000+0000', 1, 'Adelaide Crows', 'Crows', 17, 'Melbourne', 'Demons', 0, ''),
(27, 958, 4, 'Round 4', 5925, 'Norwood Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-04-05T06:10:00.000+0000', 2, 'Brisbane Lions', 'Lions', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(28, 958, 4, 'Round 4', 5926, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-04-05T09:10:00.000+0000', 7, 'Port Adelaide', 'Power', 12, 'Essendon', 'Bombers', 0, ''),
(29, 958, 4, 'Round 4', 5927, 'Adelaide Hills', 'Mt Barker', 'SA', 'Australia/Adelaide', '2024-04-06T02:30:00.000+0000', 18, 'West Coast Eagles', 'Eagles', 13, 'Sydney Swans', 'Swans', 0, ''),
(30, 958, 4, 'Round 4', 5928, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-04-06T05:20:00.000+0000', 14, 'Fremantle', 'Dockers', 5, 'Carlton', 'Blues', 0, ''),
(31, 958, 4, 'Round 4', 5929, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-04-06T09:10:00.000+0000', 8, 'Western Bulldogs', 'Bulldogs', 10, 'Geelong Cats', 'Cats', 0, ''),
(32, 958, 4, 'Round 4', 5930, 'Adelaide Hills', 'Mt Barker', 'SA', 'Australia/Adelaide', '2024-04-07T02:30:00.000+0000', 4, 'Gold Coast Suns', 'Suns', 15, 'GWS Giants', 'Giants', 0, ''),
(33, 958, 4, 'Round 4', 5931, 'Norwood Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-04-07T05:20:00.000+0000', 16, 'Richmond', 'Tigers', 11, 'St Kilda', 'Saints', 0, ''),
(34, 958, 4, 'Round 4', 5932, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-04-07T07:10:00.000+0000', 3, 'Collingwood', 'Magpies', 9, 'Hawthorn', 'Hawks', 0, ''),
(35, 959, 5, 'Round 5', 5933, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-04-11T09:30:00.000+0000', 17, 'Melbourne', 'Demons', 2, 'Brisbane Lions', 'Lions', 0, ''),
(36, 959, 5, 'Round 5', 5934, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-04-12T09:40:00.000+0000', 8, 'Western Bulldogs', 'Bulldogs', 12, 'Essendon', 'Bombers', 0, ''),
(37, 959, 5, 'Round 5', 5935, 'Manuka Oval', 'Canberra', 'ACT', 'Australia/Canberra', '2024-04-13T03:45:00.000+0000', 15, 'GWS Giants', 'Giants', 11, 'St Kilda', 'Saints', 0, ''),
(38, 959, 5, 'Round 5', 5936, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-04-13T06:35:00.000+0000', 5, 'Carlton', 'Blues', 1, 'Adelaide Crows', 'Crows', 0, ''),
(39, 959, 5, 'Round 5', 5938, 'Heritage Bank Stadium', 'Gold Coast', 'QLD', 'Australia/Brisbane', '2024-04-13T09:30:00.000+0000', 4, 'Gold Coast Suns', 'Suns', 9, 'Hawthorn', 'Hawks', 0, ''),
(40, 959, 5, 'Round 5', 5937, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-04-13T09:30:00.000+0000', 7, 'Port Adelaide', 'Power', 14, 'Fremantle', 'Dockers', 0, ''),
(41, 959, 5, 'Round 5', 5939, 'GMHBA Stadium', 'Geelong', 'VIC', 'Australia/Melbourne', '2024-04-14T03:00:00.000+0000', 10, 'Geelong Cats', 'Cats', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(42, 959, 5, 'Round 5', 5940, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-04-14T06:00:00.000+0000', 18, 'West Coast Eagles', 'Eagles', 16, 'Richmond', 'Tigers', 0, ''),
(43, 960, 6, 'Round 6', 5941, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-04-18T09:30:00.000+0000', 11, 'St Kilda', 'Saints', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(44, 960, 6, 'Round 6', 5942, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-04-19T09:40:00.000+0000', 1, 'Adelaide Crows', 'Crows', 12, 'Essendon', 'Bombers', 0, ''),
(45, 960, 6, 'Round 6', 5943, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-04-20T03:45:00.000+0000', 3, 'Collingwood', 'Magpies', 7, 'Port Adelaide', 'Power', 0, ''),
(46, 960, 6, 'Round 6', 5944, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-04-20T06:35:00.000+0000', 5, 'Carlton', 'Blues', 15, 'GWS Giants', 'Giants', 0, ''),
(47, 960, 6, 'Round 6', 5946, 'Gabba', 'Brisbane', 'QLD', 'Australia/Brisbane', '2024-04-20T09:30:00.000+0000', 2, 'Brisbane Lions', 'Lions', 10, 'Geelong Cats', 'Cats', 0, ''),
(48, 960, 6, 'Round 6', 5945, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-04-20T10:10:00.000+0000', 18, 'West Coast Eagles', 'Eagles', 14, 'Fremantle', 'Dockers', 0, ''),
(49, 960, 6, 'Round 6', 5947, 'SCG', 'Sydney', 'NSW', 'Australia/Sydney', '2024-04-21T03:00:00.000+0000', 13, 'Sydney Swans', 'Swans', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(50, 960, 6, 'Round 6', 5948, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-04-21T06:00:00.000+0000', 6, 'North Melbourne', 'Kangaroos', 9, 'Hawthorn', 'Hawks', 0, ''),
(51, 961, 7, 'Round 7', 5949, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-04-24T09:25:00.000+0000', 16, 'Richmond', 'Tigers', 17, 'Melbourne', 'Demons', 0, ''),
(52, 961, 7, 'Round 7', 5950, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-04-25T05:20:00.000+0000', 12, 'Essendon', 'Bombers', 3, 'Collingwood', 'Magpies', 0, ''),
(53, 961, 7, 'Round 7', 5951, 'Manuka Oval', 'Canberra', 'ACT', 'Australia/Canberra', '2024-04-25T09:30:00.000+0000', 15, 'GWS Giants', 'Giants', 2, 'Brisbane Lions', 'Lions', 0, ''),
(54, 961, 7, 'Round 7', 5952, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-04-26T09:40:00.000+0000', 7, 'Port Adelaide', 'Power', 11, 'St Kilda', 'Saints', 0, ''),
(55, 961, 7, 'Round 7', 5953, 'Blundstone Arena', 'Hobart', 'TAS', 'Australia/Hobart', '2024-04-27T03:45:00.000+0000', 6, 'North Melbourne', 'Kangaroos', 1, 'Adelaide Crows', 'Crows', 0, ''),
(56, 961, 7, 'Round 7', 5954, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-04-27T06:35:00.000+0000', 10, 'Geelong Cats', 'Cats', 5, 'Carlton', 'Blues', 0, ''),
(57, 961, 7, 'Round 7', 5955, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-04-27T09:30:00.000+0000', 14, 'Fremantle', 'Dockers', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(58, 961, 7, 'Round 7', 5956, 'Heritage Bank Stadium', 'Gold Coast', 'QLD', 'Australia/Brisbane', '2024-04-28T03:00:00.000+0000', 4, 'Gold Coast Suns', 'Suns', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(59, 961, 7, 'Round 7', 5957, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-04-28T06:00:00.000+0000', 9, 'Hawthorn', 'Hawks', 13, 'Sydney Swans', 'Swans', 0, ''),
(60, 962, 8, 'Round 8', 5958, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-05-02T09:30:00.000+0000', 1, 'Adelaide Crows', 'Crows', 7, 'Port Adelaide', 'Power', 0, ''),
(61, 962, 8, 'Round 8', 5959, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-03T09:40:00.000+0000', 5, 'Carlton', 'Blues', 3, 'Collingwood', 'Magpies', 0, ''),
(62, 962, 8, 'Round 8', 5960, 'SCG', 'Sydney', 'NSW', 'Australia/Sydney', '2024-05-04T03:45:00.000+0000', 13, 'Sydney Swans', 'Swans', 15, 'GWS Giants', 'Giants', 0, ''),
(63, 962, 8, 'Round 8', 5961, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-04T06:35:00.000+0000', 11, 'St Kilda', 'Saints', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(64, 962, 8, 'Round 8', 5963, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-04T09:30:00.000+0000', 17, 'Melbourne', 'Demons', 10, 'Geelong Cats', 'Cats', 0, ''),
(65, 962, 8, 'Round 8', 5962, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-05-04T10:10:00.000+0000', 18, 'West Coast Eagles', 'Eagles', 12, 'Essendon', 'Bombers', 0, ''),
(66, 962, 8, 'Round 8', 5964, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-05T03:00:00.000+0000', 16, 'Richmond', 'Tigers', 14, 'Fremantle', 'Dockers', 0, ''),
(67, 962, 8, 'Round 8', 5965, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-05T06:00:00.000+0000', 8, 'Western Bulldogs', 'Bulldogs', 9, 'Hawthorn', 'Hawks', 0, ''),
(68, 962, 8, 'Round 8', 5966, 'Gabba', 'Brisbane', 'QLD', 'Australia/Brisbane', '2024-05-05T09:10:00.000+0000', 2, 'Brisbane Lions', 'Lions', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(69, 963, 9, 'Round 9', 5967, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-09T09:30:00.000+0000', 5, 'Carlton', 'Blues', 17, 'Melbourne', 'Demons', 0, ''),
(70, 963, 9, 'Round 9', 5969, 'GMHBA Stadium', 'Geelong', 'VIC', 'Australia/Melbourne', '2024-05-10T09:10:00.000+0000', 10, 'Geelong Cats', 'Cats', 7, 'Port Adelaide', 'Power', 0, ''),
(71, 963, 9, 'Round 9', 5968, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-05-10T10:20:00.000+0000', 14, 'Fremantle', 'Dockers', 13, 'Sydney Swans', 'Swans', 0, ''),
(72, 963, 9, 'Round 9', 5970, 'UTAS Stadium', 'Launceston', 'TAS', 'Australia/Hobart', '2024-05-11T03:45:00.000+0000', 9, 'Hawthorn', 'Hawks', 11, 'St Kilda', 'Saints', 0, ''),
(73, 963, 9, 'Round 9', 5971, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-11T06:35:00.000+0000', 12, 'Essendon', 'Bombers', 15, 'GWS Giants', 'Giants', 0, ''),
(74, 963, 9, 'Round 9', 5973, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-11T09:30:00.000+0000', 16, 'Richmond', 'Tigers', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(75, 963, 9, 'Round 9', 5972, 'TIO Stadium', 'Darwin', 'NT', 'Australia/Darwin', '2024-05-11T09:30:00.000+0000', 4, 'Gold Coast Suns', 'Suns', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(76, 963, 9, 'Round 9', 5974, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-12T03:00:00.000+0000', 3, 'Collingwood', 'Magpies', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(77, 963, 9, 'Round 9', 5975, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-05-12T06:00:00.000+0000', 1, 'Adelaide Crows', 'Crows', 2, 'Brisbane Lions', 'Lions', 0, ''),
(78, 964, 10, 'Round 10', 5976, 'TIO Stadium', 'Darwin', 'NT', 'Australia/Darwin', '2024-05-16T09:30:00.000+0000', 4, 'Gold Coast Suns', 'Suns', 10, 'Geelong Cats', 'Cats', 0, ''),
(79, 964, 10, 'Round 10', 5977, 'SCG', 'Sydney', 'NSW', 'Australia/Sydney', '2024-05-17T09:40:00.000+0000', 13, 'Sydney Swans', 'Swans', 5, 'Carlton', 'Blues', 0, ''),
(80, 964, 10, 'Round 10', 5978, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-18T03:45:00.000+0000', 3, 'Collingwood', 'Magpies', 1, 'Adelaide Crows', 'Crows', 0, ''),
(81, 964, 10, 'Round 10', 5979, 'GIANTS Stadium', 'Sydney', 'NSW', 'Australia/Sydney', '2024-05-18T06:35:00.000+0000', 15, 'GWS Giants', 'Giants', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(82, 964, 10, 'Round 10', 5980, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-18T09:30:00.000+0000', 11, 'St Kilda', 'Saints', 14, 'Fremantle', 'Dockers', 0, ''),
(83, 964, 10, 'Round 10', 5981, 'Gabba', 'Brisbane', 'QLD', 'Australia/Brisbane', '2024-05-18T09:30:00.000+0000', 2, 'Brisbane Lions', 'Lions', 16, 'Richmond', 'Tigers', 0, ''),
(84, 964, 10, 'Round 10', 5982, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-19T03:10:00.000+0000', 12, 'Essendon', 'Bombers', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(85, 964, 10, 'Round 10', 5983, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-05-19T05:20:00.000+0000', 7, 'Port Adelaide', 'Power', 9, 'Hawthorn', 'Hawks', 0, ''),
(86, 964, 10, 'Round 10', 5984, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-05-19T08:20:00.000+0000', 18, 'West Coast Eagles', 'Eagles', 17, 'Melbourne', 'Demons', 0, ''),
(87, 965, 11, 'Round 11', 5985, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-23T09:30:00.000+0000', 8, 'Western Bulldogs', 'Bulldogs', 13, 'Sydney Swans', 'Swans', 0, ''),
(88, 965, 11, 'Round 11', 5986, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-05-24T10:10:00.000+0000', 14, 'Fremantle', 'Dockers', 3, 'Collingwood', 'Magpies', 0, ''),
(89, 965, 11, 'Round 11', 5987, 'Blundstone Arena', 'Hobart', 'TAS', 'Australia/Hobart', '2024-05-25T03:45:00.000+0000', 6, 'North Melbourne', 'Kangaroos', 7, 'Port Adelaide', 'Power', 0, ''),
(90, 965, 11, 'Round 11', 5988, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-25T03:45:00.000+0000', 5, 'Carlton', 'Blues', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(91, 965, 11, 'Round 11', 5989, 'GMHBA Stadium', 'Geelong', 'VIC', 'Australia/Melbourne', '2024-05-25T06:35:00.000+0000', 10, 'Geelong Cats', 'Cats', 15, 'GWS Giants', 'Giants', 0, ''),
(92, 965, 11, 'Round 11', 5990, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-25T09:40:00.000+0000', 16, 'Richmond', 'Tigers', 12, 'Essendon', 'Bombers', 0, ''),
(93, 965, 11, 'Round 11', 5991, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-26T03:10:00.000+0000', 9, 'Hawthorn', 'Hawks', 2, 'Brisbane Lions', 'Lions', 0, ''),
(94, 965, 11, 'Round 11', 5992, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-26T05:20:00.000+0000', 17, 'Melbourne', 'Demons', 11, 'St Kilda', 'Saints', 0, ''),
(95, 965, 11, 'Round 11', 5993, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-05-26T06:40:00.000+0000', 1, 'Adelaide Crows', 'Crows', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(96, 966, 12, 'Round 12', 5994, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-05-30T09:30:00.000+0000', 7, 'Port Adelaide', 'Power', 5, 'Carlton', 'Blues', 0, ''),
(97, 966, 12, 'Round 12', 5995, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-05-31T09:40:00.000+0000', 3, 'Collingwood', 'Magpies', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(98, 966, 12, 'Round 12', 5996, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-06-01T03:45:00.000+0000', 9, 'Hawthorn', 'Hawks', 1, 'Adelaide Crows', 'Crows', 0, ''),
(99, 966, 12, 'Round 12', 5997, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-06-01T06:35:00.000+0000', 18, 'West Coast Eagles', 'Eagles', 11, 'St Kilda', 'Saints', 0, ''),
(100, 966, 12, 'Round 12', 5998, 'GMHBA Stadium', 'Geelong', 'VIC', 'Australia/Melbourne', '2024-06-01T09:30:00.000+0000', 10, 'Geelong Cats', 'Cats', 16, 'Richmond', 'Tigers', 0, ''),
(101, 966, 12, 'Round 12', 5999, 'TIO Traeger Park', 'Alice Springs', 'NT', 'Australia/Darwin', '2024-06-02T03:00:00.000+0000', 17, 'Melbourne', 'Demons', 14, 'Fremantle', 'Dockers', 0, ''),
(102, 966, 12, 'Round 12', 6000, 'Heritage Bank Stadium', 'Gold Coast', 'QLD', 'Australia/Brisbane', '2024-06-02T06:00:00.000+0000', 4, 'Gold Coast Suns', 'Suns', 12, 'Essendon', 'Bombers', 0, ''),
(103, 967, 13, 'Round 13', 6001, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-06-06T09:30:00.000+0000', 1, 'Adelaide Crows', 'Crows', 16, 'Richmond', 'Tigers', 0, ''),
(104, 967, 13, 'Round 13', 6002, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-06-07T09:40:00.000+0000', 8, 'Western Bulldogs', 'Bulldogs', 2, 'Brisbane Lions', 'Lions', 0, ''),
(105, 967, 13, 'Round 13', 6003, 'UTAS Stadium', 'Launceston', 'TAS', 'Australia/Hobart', '2024-06-08T03:45:00.000+0000', 9, 'Hawthorn', 'Hawks', 15, 'GWS Giants', 'Giants', 0, ''),
(106, 967, 13, 'Round 13', 6004, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-06-08T06:35:00.000+0000', 18, 'West Coast Eagles', 'Eagles', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(107, 967, 13, 'Round 13', 6005, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-06-08T09:30:00.000+0000', 11, 'St Kilda', 'Saints', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(108, 967, 13, 'Round 13', 6006, 'SCG', 'Sydney', 'NSW', 'Australia/Sydney', '2024-06-09T05:20:00.000+0000', 13, 'Sydney Swans', 'Swans', 10, 'Geelong Cats', 'Cats', 0, ''),
(109, 967, 13, 'Round 13', 6007, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-06-09T09:20:00.000+0000', 12, 'Essendon', 'Bombers', 5, 'Carlton', 'Blues', 0, ''),
(110, 967, 13, 'Round 13', 6008, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-06-10T05:20:00.000+0000', 3, 'Collingwood', 'Magpies', 17, 'Melbourne', 'Demons', 0, ''),
(111, 968, 14, 'Round 14', 6009, 'Gabba', 'Brisbane', 'QLD', 'Australia/Brisbane', '2024-06-14T09:40:00.000+0000', 2, 'Brisbane Lions', 'Lions', 11, 'St Kilda', 'Saints', 0, ''),
(112, 968, 14, 'Round 14', 6010, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-06-15T03:45:00.000+0000', 8, 'Western Bulldogs', 'Bulldogs', 14, 'Fremantle', 'Dockers', 0, ''),
(113, 968, 14, 'Round 14', 6011, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-06-15T06:35:00.000+0000', 16, 'Richmond', 'Tigers', 9, 'Hawthorn', 'Hawks', 0, ''),
(114, 968, 14, 'Round 14', 6012, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-06-15T09:30:00.000+0000', 1, 'Adelaide Crows', 'Crows', 13, 'Sydney Swans', 'Swans', 0, ''),
(115, 968, 14, 'Round 14', 6013, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-06-16T03:00:00.000+0000', 6, 'North Melbourne', 'Kangaroos', 3, 'Collingwood', 'Magpies', 0, ''),
(116, 968, 14, 'Round 14', 6014, 'GIANTS Stadium', 'Sydney', 'NSW', 'Australia/Sydney', '2024-06-16T06:00:00.000+0000', 15, 'GWS Giants', 'Giants', 7, 'Port Adelaide', 'Power', 0, ''),
(117, 969, 15, 'Round 15', 6015, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-06-21T09:40:00.000+0000', 5, 'Carlton', 'Blues', 10, 'Geelong Cats', 'Cats', 0, ''),
(118, 969, 15, 'Round 15', 6016, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-06-22T03:45:00.000+0000', 7, 'Port Adelaide', 'Power', 2, 'Brisbane Lions', 'Lions', 0, ''),
(119, 969, 15, 'Round 15', 6017, 'GIANTS Stadium', 'Sydney', 'NSW', 'Australia/Sydney', '2024-06-22T06:35:00.000+0000', 15, 'GWS Giants', 'Giants', 13, 'Sydney Swans', 'Swans', 0, ''),
(120, 969, 15, 'Round 15', 6018, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-06-22T09:30:00.000+0000', 17, 'Melbourne', 'Demons', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(121, 969, 15, 'Round 15', 6019, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-06-23T03:00:00.000+0000', 12, 'Essendon', 'Bombers', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(122, 969, 15, 'Round 15', 6020, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-06-23T06:00:00.000+0000', 14, 'Fremantle', 'Dockers', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(123, 970, 16, 'Round 16', 6022, 'Gabba', 'Brisbane', 'QLD', 'Australia/Brisbane', '2024-06-28T02:00:00.000+0000', 2, 'Brisbane Lions', 'Lions', 17, 'Melbourne', 'Demons', 0, ''),
(124, 970, 16, 'Round 16', 6023, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-06-28T02:00:00.000+0000', 10, 'Geelong Cats', 'Cats', 12, 'Essendon', 'Bombers', 0, ''),
(125, 970, 16, 'Round 16', 6024, 'Heritage Bank Stadium', 'Gold Coast', 'QLD', 'Australia/Brisbane', '2024-06-28T02:00:00.000+0000', 4, 'Gold Coast Suns', 'Suns', 3, 'Collingwood', 'Magpies', 0, ''),
(126, 970, 16, 'Round 16', 6025, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-06-28T02:00:00.000+0000', 6, 'North Melbourne', 'Kangaroos', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(127, 970, 16, 'Round 16', 6026, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-06-28T02:00:00.000+0000', 16, 'Richmond', 'Tigers', 5, 'Carlton', 'Blues', 0, ''),
(128, 970, 16, 'Round 16', 6027, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-06-28T02:00:00.000+0000', 11, 'St Kilda', 'Saints', 7, 'Port Adelaide', 'Power', 0, ''),
(129, 970, 16, 'Round 16', 6028, 'SCG', 'Sydney', 'NSW', 'Australia/Sydney', '2024-06-28T02:00:00.000+0000', 13, 'Sydney Swans', 'Swans', 14, 'Fremantle', 'Dockers', 0, ''),
(130, 970, 16, 'Round 16', 6021, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-06-28T02:30:00.000+0000', 1, 'Adelaide Crows', 'Crows', 15, 'GWS Giants', 'Giants', 0, ''),
(131, 970, 16, 'Round 16', 6029, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-06-28T04:00:00.000+0000', 18, 'West Coast Eagles', 'Eagles', 9, 'Hawthorn', 'Hawks', 0, ''),
(132, 971, 17, 'Round 17', 6030, 'Gabba', 'Brisbane', 'QLD', 'Australia/Brisbane', '2024-07-05T02:00:00.000+0000', 2, 'Brisbane Lions', 'Lions', 1, 'Adelaide Crows', 'Crows', 0, ''),
(133, 971, 17, 'Round 17', 6031, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-05T02:00:00.000+0000', 3, 'Collingwood', 'Magpies', 12, 'Essendon', 'Bombers', 0, ''),
(134, 971, 17, 'Round 17', 6033, 'GMHBA Stadium', 'Geelong', 'VIC', 'Australia/Melbourne', '2024-07-05T02:00:00.000+0000', 10, 'Geelong Cats', 'Cats', 9, 'Hawthorn', 'Hawks', 0, ''),
(135, 971, 17, 'Round 17', 6034, 'GIANTS Stadium', 'Sydney', 'NSW', 'Australia/Sydney', '2024-07-05T02:00:00.000+0000', 15, 'GWS Giants', 'Giants', 5, 'Carlton', 'Blues', 0, ''),
(136, 971, 17, 'Round 17', 6035, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-05T02:00:00.000+0000', 17, 'Melbourne', 'Demons', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(137, 971, 17, 'Round 17', 6036, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-05T02:00:00.000+0000', 6, 'North Melbourne', 'Kangaroos', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(138, 971, 17, 'Round 17', 6037, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-05T02:00:00.000+0000', 11, 'St Kilda', 'Saints', 13, 'Sydney Swans', 'Swans', 0, ''),
(139, 971, 17, 'Round 17', 6038, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-07-05T02:30:00.000+0000', 7, 'Port Adelaide', 'Power', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(140, 971, 17, 'Round 17', 6032, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-07-05T04:00:00.000+0000', 14, 'Fremantle', 'Dockers', 16, 'Richmond', 'Tigers', 0, ''),
(141, 972, 18, 'Round 18', 6046, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-12T02:00:00.000+0000', 3, 'Collingwood', 'Magpies', 10, 'Geelong Cats', 'Cats', 0, ''),
(142, 972, 18, 'Round 18', 6047, 'Heritage Bank Stadium', 'Gold Coast', 'QLD', 'Australia/Brisbane', '2024-07-12T02:00:00.000+0000', 4, 'Gold Coast Suns', 'Suns', 7, 'Port Adelaide', 'Power', 0, ''),
(143, 972, 18, 'Round 18', 6040, 'UTAS Stadium', 'Launceston', 'TAS', 'Australia/Hobart', '2024-07-12T02:00:00.000+0000', 9, 'Hawthorn', 'Hawks', 14, 'Fremantle', 'Dockers', 0, ''),
(144, 972, 18, 'Round 18', 6041, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-12T02:00:00.000+0000', 17, 'Melbourne', 'Demons', 12, 'Essendon', 'Bombers', 0, ''),
(145, 972, 18, 'Round 18', 6042, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-12T02:00:00.000+0000', 16, 'Richmond', 'Tigers', 15, 'GWS Giants', 'Giants', 0, ''),
(146, 972, 18, 'Round 18', 6043, 'SCG', 'Sydney', 'NSW', 'Australia/Sydney', '2024-07-12T02:00:00.000+0000', 13, 'Sydney Swans', 'Swans', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(147, 972, 18, 'Round 18', 6045, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-12T02:00:00.000+0000', 8, 'Western Bulldogs', 'Bulldogs', 5, 'Carlton', 'Blues', 0, ''),
(148, 972, 18, 'Round 18', 6039, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-07-12T02:30:00.000+0000', 1, 'Adelaide Crows', 'Crows', 11, 'St Kilda', 'Saints', 0, ''),
(149, 972, 18, 'Round 18', 6044, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-07-12T04:00:00.000+0000', 18, 'West Coast Eagles', 'Eagles', 2, 'Brisbane Lions', 'Lions', 0, ''),
(150, 973, 19, 'Round 19', 6048, 'Gabba', 'Brisbane', 'QLD', 'Australia/Brisbane', '2024-07-19T02:00:00.000+0000', 2, 'Brisbane Lions', 'Lions', 13, 'Sydney Swans', 'Swans', 0, ''),
(151, 973, 19, 'Round 19', 6049, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-19T02:00:00.000+0000', 5, 'Carlton', 'Blues', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(152, 973, 19, 'Round 19', 6050, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-19T02:00:00.000+0000', 12, 'Essendon', 'Bombers', 1, 'Adelaide Crows', 'Crows', 0, ''),
(153, 973, 19, 'Round 19', 6052, 'GMHBA Stadium', 'Geelong', 'VIC', 'Australia/Melbourne', '2024-07-19T02:00:00.000+0000', 10, 'Geelong Cats', 'Cats', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(154, 973, 19, 'Round 19', 6053, 'GIANTS Stadium', 'Sydney', 'NSW', 'Australia/Sydney', '2024-07-19T02:00:00.000+0000', 15, 'GWS Giants', 'Giants', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(155, 973, 19, 'Round 19', 6054, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-19T02:00:00.000+0000', 9, 'Hawthorn', 'Hawks', 3, 'Collingwood', 'Magpies', 0, ''),
(156, 973, 19, 'Round 19', 6056, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-19T02:00:00.000+0000', 11, 'St Kilda', 'Saints', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(157, 973, 19, 'Round 19', 6055, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-07-19T02:30:00.000+0000', 7, 'Port Adelaide', 'Power', 16, 'Richmond', 'Tigers', 0, ''),
(158, 973, 19, 'Round 19', 6051, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-07-19T04:00:00.000+0000', 14, 'Fremantle', 'Dockers', 17, 'Melbourne', 'Demons', 0, ''),
(159, 974, 20, 'Round 20', 6058, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-26T02:00:00.000+0000', 5, 'Carlton', 'Blues', 7, 'Port Adelaide', 'Power', 0, ''),
(160, 974, 20, 'Round 20', 6059, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-26T02:00:00.000+0000', 3, 'Collingwood', 'Magpies', 16, 'Richmond', 'Tigers', 0, ''),
(161, 974, 20, 'Round 20', 6061, 'Heritage Bank Stadium', 'Gold Coast', 'QLD', 'Australia/Brisbane', '2024-07-26T02:00:00.000+0000', 4, 'Gold Coast Suns', 'Suns', 2, 'Brisbane Lions', 'Lions', 0, ''),
(162, 974, 20, 'Round 20', 6063, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-26T02:00:00.000+0000', 17, 'Melbourne', 'Demons', 15, 'GWS Giants', 'Giants', 0, ''),
(163, 974, 20, 'Round 20', 6062, 'Blundstone Arena', 'Hobart', 'TAS', 'Australia/Hobart', '2024-07-26T02:00:00.000+0000', 6, 'North Melbourne', 'Kangaroos', 10, 'Geelong Cats', 'Cats', 0, ''),
(164, 974, 20, 'Round 20', 6064, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-07-26T02:00:00.000+0000', 11, 'St Kilda', 'Saints', 12, 'Essendon', 'Bombers', 0, ''),
(165, 974, 20, 'Round 20', 6065, 'SCG', 'Sydney', 'NSW', 'Australia/Sydney', '2024-07-26T02:00:00.000+0000', 13, 'Sydney Swans', 'Swans', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(166, 974, 20, 'Round 20', 6057, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-07-26T02:30:00.000+0000', 1, 'Adelaide Crows', 'Crows', 9, 'Hawthorn', 'Hawks', 0, ''),
(167, 974, 20, 'Round 20', 6060, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-07-26T04:00:00.000+0000', 14, 'Fremantle', 'Dockers', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(168, 975, 21, 'Round 21', 6067, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-02T02:00:00.000+0000', 3, 'Collingwood', 'Magpies', 5, 'Carlton', 'Blues', 0, ''),
(169, 975, 21, 'Round 21', 6066, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-02T02:00:00.000+0000', 12, 'Essendon', 'Bombers', 14, 'Fremantle', 'Dockers', 0, ''),
(170, 975, 21, 'Round 21', 6068, 'GMHBA Stadium', 'Geelong', 'VIC', 'Australia/Melbourne', '2024-08-02T02:00:00.000+0000', 10, 'Geelong Cats', 'Cats', 1, 'Adelaide Crows', 'Crows', 0, ''),
(171, 975, 21, 'Round 21', 6069, 'Manuka Oval', 'Canberra', 'ACT', 'Australia/Canberra', '2024-08-02T02:00:00.000+0000', 15, 'GWS Giants', 'Giants', 9, 'Hawthorn', 'Hawks', 0, ''),
(172, 975, 21, 'Round 21', 6070, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-02T02:00:00.000+0000', 6, 'North Melbourne', 'Kangaroos', 16, 'Richmond', 'Tigers', 0, ''),
(173, 975, 21, 'Round 21', 6072, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-02T02:00:00.000+0000', 11, 'St Kilda', 'Saints', 2, 'Brisbane Lions', 'Lions', 0, ''),
(174, 975, 21, 'Round 21', 6074, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-02T02:00:00.000+0000', 8, 'Western Bulldogs', 'Bulldogs', 17, 'Melbourne', 'Demons', 0, ''),
(175, 975, 21, 'Round 21', 6071, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-08-02T02:30:00.000+0000', 7, 'Port Adelaide', 'Power', 13, 'Sydney Swans', 'Swans', 0, ''),
(176, 975, 21, 'Round 21', 6073, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-08-02T04:00:00.000+0000', 18, 'West Coast Eagles', 'Eagles', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(177, 976, 22, 'Round 22', 6076, 'Gabba', 'Brisbane', 'QLD', 'Australia/Brisbane', '2024-08-09T02:00:00.000+0000', 2, 'Brisbane Lions', 'Lions', 15, 'GWS Giants', 'Giants', 0, ''),
(178, 976, 22, 'Round 22', 6077, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-09T02:00:00.000+0000', 5, 'Carlton', 'Blues', 9, 'Hawthorn', 'Hawks', 0, ''),
(179, 976, 22, 'Round 22', 6078, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-09T02:00:00.000+0000', 12, 'Essendon', 'Bombers', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(180, 976, 22, 'Round 22', 6080, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-09T02:00:00.000+0000', 17, 'Melbourne', 'Demons', 7, 'Port Adelaide', 'Power', 0, ''),
(181, 976, 22, 'Round 22', 6081, 'Blundstone Arena', 'Hobart', 'TAS', 'Australia/Hobart', '2024-08-09T02:00:00.000+0000', 6, 'North Melbourne', 'Kangaroos', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(182, 976, 22, 'Round 22', 6082, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-09T02:00:00.000+0000', 16, 'Richmond', 'Tigers', 11, 'St Kilda', 'Saints', 0, ''),
(183, 976, 22, 'Round 22', 6083, 'SCG', 'Sydney', 'NSW', 'Australia/Sydney', '2024-08-09T02:00:00.000+0000', 13, 'Sydney Swans', 'Swans', 3, 'Collingwood', 'Magpies', 0, ''),
(184, 976, 22, 'Round 22', 6075, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-08-09T02:30:00.000+0000', 1, 'Adelaide Crows', 'Crows', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(185, 976, 22, 'Round 22', 6079, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-08-09T04:00:00.000+0000', 14, 'Fremantle', 'Dockers', 10, 'Geelong Cats', 'Cats', 0, ''),
(186, 977, 23, 'Round 23', 6084, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-16T02:00:00.000+0000', 3, 'Collingwood', 'Magpies', 2, 'Brisbane Lions', 'Lions', 0, ''),
(187, 977, 23, 'Round 23', 6085, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-16T02:00:00.000+0000', 12, 'Essendon', 'Bombers', 13, 'Sydney Swans', 'Swans', 0, ''),
(188, 977, 23, 'Round 23', 6086, 'Heritage Bank Stadium', 'Gold Coast', 'QLD', 'Australia/Brisbane', '2024-08-16T02:00:00.000+0000', 4, 'Gold Coast Suns', 'Suns', 17, 'Melbourne', 'Demons', 0, ''),
(189, 977, 23, 'Round 23', 6087, 'GIANTS Stadium', 'Sydney', 'NSW', 'Australia/Sydney', '2024-08-16T02:00:00.000+0000', 15, 'GWS Giants', 'Giants', 14, 'Fremantle', 'Dockers', 0, ''),
(190, 977, 23, 'Round 23', 6088, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-16T02:00:00.000+0000', 9, 'Hawthorn', 'Hawks', 16, 'Richmond', 'Tigers', 0, ''),
(191, 977, 23, 'Round 23', 6090, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-16T02:00:00.000+0000', 11, 'St Kilda', 'Saints', 10, 'Geelong Cats', 'Cats', 0, ''),
(192, 977, 23, 'Round 23', 6092, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-16T02:00:00.000+0000', 8, 'Western Bulldogs', 'Bulldogs', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(193, 977, 23, 'Round 23', 6089, 'Adelaide Oval', 'Adelaide', 'SA', 'Australia/Adelaide', '2024-08-16T02:30:00.000+0000', 7, 'Port Adelaide', 'Power', 1, 'Adelaide Crows', 'Crows', 0, ''),
(194, 977, 23, 'Round 23', 6091, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-08-16T04:00:00.000+0000', 18, 'West Coast Eagles', 'Eagles', 5, 'Carlton', 'Blues', 0, ''),
(195, 978, 24, 'Round 24', 6093, 'Gabba', 'Brisbane', 'QLD', 'Australia/Brisbane', '2024-08-23T02:00:00.000+0000', 2, 'Brisbane Lions', 'Lions', 12, 'Essendon', 'Bombers', 0, ''),
(196, 978, 24, 'Round 24', 6094, 'Marvel Stadium', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-23T02:00:00.000+0000', 5, 'Carlton', 'Blues', 11, 'St Kilda', 'Saints', 0, ''),
(197, 978, 24, 'Round 24', 6096, 'GMHBA Stadium', 'Geelong', 'VIC', 'Australia/Melbourne', '2024-08-23T02:00:00.000+0000', 10, 'Geelong Cats', 'Cats', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(198, 978, 24, 'Round 24', 6097, 'UTAS Stadium', 'Launceston', 'TAS', 'Australia/Hobart', '2024-08-23T02:00:00.000+0000', 9, 'Hawthorn', 'Hawks', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(199, 978, 24, 'Round 24', 6098, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-23T02:00:00.000+0000', 17, 'Melbourne', 'Demons', 3, 'Collingwood', 'Magpies', 0, ''),
(200, 978, 24, 'Round 24', 6099, 'MCG', 'Melbourne', 'VIC', 'Australia/Melbourne', '2024-08-23T02:00:00.000+0000', 16, 'Richmond', 'Tigers', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(201, 978, 24, 'Round 24', 6100, 'SCG', 'Sydney', 'NSW', 'Australia/Sydney', '2024-08-23T02:00:00.000+0000', 13, 'Sydney Swans', 'Swans', 1, 'Adelaide Crows', 'Crows', 0, ''),
(202, 978, 24, 'Round 24', 6101, 'Mars Stadium', 'Ballarat', 'VIC', 'Australia/Melbourne', '2024-08-23T02:00:00.000+0000', 8, 'Western Bulldogs', 'Bulldogs', 15, 'GWS Giants', 'Giants', 0, ''),
(203, 978, 24, 'Round 24', 6095, 'Optus Stadium', 'Perth', 'WA', 'Australia/Perth', '2024-08-23T04:00:00.000+0000', 14, 'Fremantle', 'Dockers', 7, 'Port Adelaide', 'Power', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `predictions`
--

DROP TABLE IF EXISTS `predictions`;
CREATE TABLE `predictions` (
  `id` int NOT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `roundnumber` float NOT NULL,
  `predictthisjson` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `correct_count` int NOT NULL DEFAULT '0',
  `winner` tinyint(1) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `predictions`
--

INSERT INTO `predictions` (`id`, `email`, `roundnumber`, `predictthisjson`, `amount`, `correct_count`, `winner`, `datecreated`) VALUES
(6, 'aflpools@gmail.com', 1, '[{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Collingwood\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Essendon\",\"checked\":true},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"GWS Giants\",\"checked\":true},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Gold Coast Suns\",\"checked\":true},{\"id\":\"8\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5905\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"17\",\"hometeamname\":\"Melbourne\",\"hometeamnickname\":\"Demons\",\"awayteamid\":\"8\",\"awayteamname\":\"Western Bulldogs\",\"awayteamnickname\":\"Bulldogs\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Melbourne\",\"checked\":true},{\"id\":\"9\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5906\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"7\",\"hometeamname\":\"Port Adelaide\",\"hometeamnickname\":\"Power\",\"awayteamid\":\"18\",\"awayteamname\":\"West Coast Eagles\",\"awayteamnickname\":\"Eagles\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Port Adelaide\",\"checked\":true}]', '20', 6, 1, '2023-11-29 14:42:51'),
(7, 'testuser2@afltest.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Carlton\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 3, 0, '2023-11-29 14:42:51'),
(16, 'testuser10@afltest.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(17, 'testuser11@afltest.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(18, 'testuser12@afltest.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(19, 'testuser13@afltest.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(20, 'testuser14@afltest.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(21, 'testuser15@afltest.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(22, 'testuser16@afltest.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(23, 'tiffaman@gmail.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(24, 'tiffaman@gmail.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(25, 'tiffaman@gmail.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(26, 'testuser20@afltest.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(27, 'testuser21@afltest.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(28, 'testuser22@afltest.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(29, 'testuser23@afltest.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(30, 'testuser24@afltest.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(31, 'testuser24@afltest.com', 1, '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Richmond\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '20', 2, 0, '2023-11-29 14:44:56'),
(32, 'john.horton86@gmail.com', 1, '[{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Hawthorn\",\"checked\":true},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"St Kilda\",\"checked\":true},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Gold Coast Suns\",\"checked\":true},{\"id\":\"9\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5906\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"7\",\"hometeamname\":\"Port Adelaide\",\"hometeamnickname\":\"Power\",\"awayteamid\":\"18\",\"awayteamname\":\"West Coast Eagles\",\"awayteamnickname\":\"Eagles\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Port Adelaide\",\"checked\":true},{\"id\":\"10\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5907\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"14\",\"hometeamname\":\"Fremantle\",\"hometeamnickname\":\"Dockers\",\"awayteamid\":\"2\",\"awayteamname\":\"Brisbane Lions\",\"awayteamnickname\":\"Lions\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Brisbane Lions\",\"checked\":true}]', '20', 2, 0, '2023-11-30 09:51:11');
INSERT INTO `predictions` (`id`, `email`, `roundnumber`, `predictthisjson`, `amount`, `correct_count`, `winner`, `datecreated`) VALUES
(33, 'john.horton86@gmail.com', 1, '[{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Collingwood\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Essendon\",\"checked\":true},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"GWS Giants\",\"checked\":true},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Gold Coast Suns\",\"checked\":true},{\"id\":\"8\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5905\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"17\",\"hometeamname\":\"Melbourne\",\"hometeamnickname\":\"Demons\",\"awayteamid\":\"8\",\"awayteamname\":\"Western Bulldogs\",\"awayteamnickname\":\"Bulldogs\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Melbourne\",\"checked\":true},{\"id\":\"9\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5906\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"7\",\"hometeamname\":\"Port Adelaide\",\"hometeamnickname\":\"Power\",\"awayteamid\":\"18\",\"awayteamname\":\"West Coast Eagles\",\"awayteamnickname\":\"Eagles\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Port Adelaide\",\"checked\":true}]', '20', 6, 1, '2023-11-30 10:01:56'),
(34, 'john.horton86@gmail.com', 1, '[{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Essendon\",\"checked\":true},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"GWS Giants\",\"checked\":true},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Gold Coast Suns\",\"checked\":true},{\"id\":\"8\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5905\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"17\",\"hometeamname\":\"Melbourne\",\"hometeamnickname\":\"Demons\",\"awayteamid\":\"8\",\"awayteamname\":\"Western Bulldogs\",\"awayteamnickname\":\"Bulldogs\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Melbourne\",\"checked\":true},{\"id\":\"9\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5906\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"7\",\"hometeamname\":\"Port Adelaide\",\"hometeamnickname\":\"Power\",\"awayteamid\":\"18\",\"awayteamname\":\"West Coast Eagles\",\"awayteamnickname\":\"Eagles\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Port Adelaide\",\"checked\":true}]', '20', 5, 0, '2023-11-30 12:09:24'),
(35, 'john.horton86@gmail.com', 2, '[{\"id\":\"89\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5908\",\"utcStartTime\":\"0\",\"hometeamid\":\"11\",\"hometeamname\":\"St Kilda\",\"hometeamnickname\":\"Saints\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Collingwood\"},{\"id\":\"90\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5909\",\"utcStartTime\":\"1\",\"hometeamid\":\"1\",\"hometeamname\":\"Adelaide Crows\",\"hometeamnickname\":\"Crows\",\"awayteamid\":\"10\",\"awayteamname\":\"Geelong Cats\",\"awayteamnickname\":\"Cats\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Geelong Cats\",\"checked\":true},{\"id\":\"91\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"utcStartTime\":\"2\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"North Melbourne\",\"checked\":true},{\"id\":\"94\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5913\",\"utcStartTime\":\"5\",\"hometeamid\":\"8\",\"hometeamname\":\"Western Bulldogs\",\"hometeamnickname\":\"Bulldogs\",\"awayteamid\":\"4\",\"awayteamname\":\"Gold Coast Suns\",\"awayteamnickname\":\"Suns\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Gold Coast Suns\",\"checked\":true},{\"id\":\"95\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5915\",\"utcStartTime\":\"6\",\"hometeamid\":\"16\",\"hometeamname\":\"Richmond\",\"hometeamnickname\":\"Tigers\",\"awayteamid\":\"7\",\"awayteamname\":\"Port Adelaide\",\"awayteamnickname\":\"Power\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Richmond\",\"checked\":true},{\"id\":\"96\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5914\",\"utcStartTime\":\"7\",\"hometeamid\":\"18\",\"hometeamname\":\"West Coast Eagles\",\"hometeamnickname\":\"Eagles\",\"awayteamid\":\"15\",\"awayteamname\":\"GWS Giants\",\"awayteamnickname\":\"Giants\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"West Coast Eagles\",\"checked\":true}]', '20', 0, 0, '2023-12-03 08:43:41'),
(36, 'john.horton86@gmail.com', 2, '[{\"id\":\"89\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5908\",\"utcStartTime\":\"0\",\"hometeamid\":\"11\",\"hometeamname\":\"St Kilda\",\"hometeamnickname\":\"Saints\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"St Kilda\"},{\"id\":\"90\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5909\",\"utcStartTime\":\"1\",\"hometeamid\":\"1\",\"hometeamname\":\"Adelaide Crows\",\"hometeamnickname\":\"Crows\",\"awayteamid\":\"10\",\"awayteamname\":\"Geelong Cats\",\"awayteamnickname\":\"Cats\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Geelong Cats\",\"checked\":true},{\"id\":\"91\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"utcStartTime\":\"2\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Fremantle\",\"checked\":true},{\"id\":\"93\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5912\",\"utcStartTime\":\"4\",\"hometeamid\":\"13\",\"hometeamname\":\"Sydney Swans\",\"hometeamnickname\":\"Swans\",\"awayteamid\":\"12\",\"awayteamname\":\"Essendon\",\"awayteamnickname\":\"Bombers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Sydney Swans\",\"checked\":true},{\"id\":\"95\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5915\",\"utcStartTime\":\"6\",\"hometeamid\":\"16\",\"hometeamname\":\"Richmond\",\"hometeamnickname\":\"Tigers\",\"awayteamid\":\"7\",\"awayteamname\":\"Port Adelaide\",\"awayteamnickname\":\"Power\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Richmond\",\"checked\":true},{\"id\":\"96\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5914\",\"utcStartTime\":\"7\",\"hometeamid\":\"18\",\"hometeamname\":\"West Coast Eagles\",\"hometeamnickname\":\"Eagles\",\"awayteamid\":\"15\",\"awayteamname\":\"GWS Giants\",\"awayteamnickname\":\"Giants\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"GWS Giants\",\"checked\":true}]', '20', 0, 0, '2023-12-03 09:12:28'),
(37, 'john.horton86@gmail.com', 2, '[{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Collingwood\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Essendon\",\"checked\":true},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"GWS Giants\",\"checked\":true},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Gold Coast Suns\",\"checked\":true},{\"id\":\"8\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5905\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"17\",\"hometeamname\":\"Melbourne\",\"hometeamnickname\":\"Demons\",\"awayteamid\":\"8\",\"awayteamname\":\"Western Bulldogs\",\"awayteamnickname\":\"Bulldogs\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Melbourne\",\"checked\":true},{\"id\":\"9\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5906\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"7\",\"hometeamname\":\"Port Adelaide\",\"hometeamnickname\":\"Power\",\"awayteamid\":\"18\",\"awayteamname\":\"West Coast Eagles\",\"awayteamnickname\":\"Eagles\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Port Adelaide\",\"checked\":true}]', '20', 0, 0, '2023-12-03 09:12:43'),
(38, 'tiffaman@gmail.com', 2, '[{\"id\":\"89\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5908\",\"utcStartTime\":\"0\",\"hometeamid\":\"11\",\"hometeamname\":\"St Kilda\",\"hometeamnickname\":\"Saints\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Collingwood\"},{\"id\":\"90\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5909\",\"utcStartTime\":\"1\",\"hometeamid\":\"1\",\"hometeamname\":\"Adelaide Crows\",\"hometeamnickname\":\"Crows\",\"awayteamid\":\"10\",\"awayteamname\":\"Geelong Cats\",\"awayteamnickname\":\"Cats\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Geelong Cats\",\"checked\":true},{\"id\":\"91\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"utcStartTime\":\"2\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Fremantle\",\"checked\":true},{\"id\":\"92\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5911\",\"utcStartTime\":\"3\",\"hometeamid\":\"9\",\"hometeamname\":\"Hawthorn\",\"hometeamnickname\":\"Hawks\",\"awayteamid\":\"17\",\"awayteamname\":\"Melbourne\",\"awayteamnickname\":\"Demons\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Melbourne\",\"checked\":true},{\"id\":\"93\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5912\",\"utcStartTime\":\"4\",\"hometeamid\":\"13\",\"hometeamname\":\"Sydney Swans\",\"hometeamnickname\":\"Swans\",\"awayteamid\":\"12\",\"awayteamname\":\"Essendon\",\"awayteamnickname\":\"Bombers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Essendon\",\"checked\":true},{\"id\":\"94\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5913\",\"utcStartTime\":\"5\",\"hometeamid\":\"8\",\"hometeamname\":\"Western Bulldogs\",\"hometeamnickname\":\"Bulldogs\",\"awayteamid\":\"4\",\"awayteamname\":\"Gold Coast Suns\",\"awayteamnickname\":\"Suns\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Gold Coast Suns\",\"checked\":true}]', '20', 0, 0, '2023-12-04 11:12:01'),
(39, 'tiffaman@gmail.com', 2, '[{\"id\":\"89\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5908\",\"utcStartTime\":\"0\",\"hometeamid\":\"11\",\"hometeamname\":\"St Kilda\",\"hometeamnickname\":\"Saints\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Collingwood\"},{\"id\":\"90\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5909\",\"utcStartTime\":\"1\",\"hometeamid\":\"1\",\"hometeamname\":\"Adelaide Crows\",\"hometeamnickname\":\"Crows\",\"awayteamid\":\"10\",\"awayteamname\":\"Geelong Cats\",\"awayteamnickname\":\"Cats\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Geelong Cats\",\"checked\":true},{\"id\":\"91\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"utcStartTime\":\"2\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Fremantle\",\"checked\":true},{\"id\":\"93\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5912\",\"utcStartTime\":\"4\",\"hometeamid\":\"13\",\"hometeamname\":\"Sydney Swans\",\"hometeamnickname\":\"Swans\",\"awayteamid\":\"12\",\"awayteamname\":\"Essendon\",\"awayteamnickname\":\"Bombers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Essendon\",\"checked\":true},{\"id\":\"95\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5915\",\"utcStartTime\":\"6\",\"hometeamid\":\"16\",\"hometeamname\":\"Richmond\",\"hometeamnickname\":\"Tigers\",\"awayteamid\":\"7\",\"awayteamname\":\"Port Adelaide\",\"awayteamnickname\":\"Power\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Port Adelaide\",\"checked\":true},{\"id\":\"96\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5914\",\"utcStartTime\":\"7\",\"hometeamid\":\"18\",\"hometeamname\":\"West Coast Eagles\",\"hometeamnickname\":\"Eagles\",\"awayteamid\":\"15\",\"awayteamname\":\"GWS Giants\",\"awayteamnickname\":\"Giants\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"West Coast Eagles\",\"checked\":true}]', '20', 0, 0, '2023-12-04 11:23:04'),
(40, 'tiffaman@gmail.com', 2, '[{\"id\":\"89\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5908\",\"utcStartTime\":\"0\",\"hometeamid\":\"11\",\"hometeamname\":\"St Kilda\",\"hometeamnickname\":\"Saints\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"St Kilda\"},{\"id\":\"90\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5909\",\"utcStartTime\":\"1\",\"hometeamid\":\"1\",\"hometeamname\":\"Adelaide Crows\",\"hometeamnickname\":\"Crows\",\"awayteamid\":\"10\",\"awayteamname\":\"Geelong Cats\",\"awayteamnickname\":\"Cats\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Adelaide Crows\",\"checked\":true},{\"id\":\"91\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"utcStartTime\":\"2\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"North Melbourne\",\"checked\":true},{\"id\":\"94\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5913\",\"utcStartTime\":\"5\",\"hometeamid\":\"8\",\"hometeamname\":\"Western Bulldogs\",\"hometeamnickname\":\"Bulldogs\",\"awayteamid\":\"4\",\"awayteamname\":\"Gold Coast Suns\",\"awayteamnickname\":\"Suns\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Western Bulldogs\",\"checked\":true},{\"id\":\"95\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5915\",\"utcStartTime\":\"6\",\"hometeamid\":\"16\",\"hometeamname\":\"Richmond\",\"hometeamnickname\":\"Tigers\",\"awayteamid\":\"7\",\"awayteamname\":\"Port Adelaide\",\"awayteamnickname\":\"Power\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Port Adelaide\",\"checked\":true},{\"id\":\"96\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5914\",\"utcStartTime\":\"7\",\"hometeamid\":\"18\",\"hometeamname\":\"West Coast Eagles\",\"hometeamnickname\":\"Eagles\",\"awayteamid\":\"15\",\"awayteamname\":\"GWS Giants\",\"awayteamnickname\":\"Giants\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"GWS Giants\",\"checked\":true}]', '20', 0, 0, '2023-12-04 13:28:57'),
(41, 'tiffaman@gmail.com', 2, '[{\"id\":\"10\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5908\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-21T08:30:00.000+0000\",\"hometeamid\":\"11\",\"hometeamname\":\"St Kilda\",\"hometeamnickname\":\"Saints\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"St Kilda\"},{\"id\":\"11\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5909\",\"venue\":\"Adelaide Oval\",\"location\":\"Adelaide\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-03-22T08:40:00.000+0000\",\"hometeamid\":\"1\",\"hometeamname\":\"Adelaide Crows\",\"hometeamnickname\":\"Crows\",\"awayteamid\":\"10\",\"awayteamname\":\"Geelong Cats\",\"awayteamnickname\":\"Cats\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Adelaide Crows\",\"checked\":true},{\"id\":\"12\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"venue\":\"Marvel Stadium\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T02:45:00.000+0000\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"North Melbourne\",\"checked\":true},{\"id\":\"13\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5911\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T05:35:00.000+0000\",\"hometeamid\":\"9\",\"hometeamname\":\"Hawthorn\",\"hometeamnickname\":\"Hawks\",\"awayteamid\":\"17\",\"awayteamname\":\"Melbourne\",\"awayteamnickname\":\"Demons\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Hawthorn\",\"checked\":true},{\"id\":\"14\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5912\",\"venue\":\"SCG\",\"location\":\"Sydney\",\"state\":\"NSW\",\"timezone\":\"Australia/Sydney\",\"utcStartTime\":\"2024-03-23T08:30:00.000+0000\",\"hometeamid\":\"13\",\"hometeamname\":\"Sydney Swans\",\"hometeamnickname\":\"Swans\",\"awayteamid\":\"12\",\"awayteamname\":\"Essendon\",\"awayteamnickname\":\"Bombers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Sydney Swans\",\"checked\":true},{\"id\":\"15\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5913\",\"venue\":\"Mars Stadium\",\"location\":\"Ballarat\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-24T02:00:00.000+0000\",\"hometeamid\":\"8\",\"hometeamname\":\"Western Bulldogs\",\"hometeamnickname\":\"Bulldogs\",\"awayteamid\":\"4\",\"awayteamname\":\"Gold Coast Suns\",\"awayteamnickname\":\"Suns\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Western Bulldogs\",\"checked\":true}]', '20', 0, 0, '2023-12-06 20:50:12'),
(42, 'tiffaman@gmail.com', 3, '[{\"id\":\"18\",\"roundid\":\"957\",\"roundnumber\":\"3\",\"roundname\":\"Round 3\",\"gameid\":\"5916\",\"venue\":\"Gabba\",\"location\":\"Brisbane\",\"state\":\"QLD\",\"timezone\":\"Australia/Brisbane\",\"utcStartTime\":\"2024-03-28T08:30:00.000+0000\",\"hometeamid\":\"2\",\"hometeamname\":\"Brisbane Lions\",\"hometeamnickname\":\"Lions\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Collingwood\"},{\"id\":\"19\",\"roundid\":\"957\",\"roundnumber\":\"3\",\"roundname\":\"Round 3\",\"gameid\":\"5917\",\"venue\":\"Marvel Stadium\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-29T05:20:00.000+0000\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"5\",\"awayteamname\":\"Carlton\",\"awayteamnickname\":\"Blues\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"North Melbourne\",\"checked\":true},{\"id\":\"20\",\"roundid\":\"957\",\"roundnumber\":\"3\",\"roundname\":\"Round 3\",\"gameid\":\"5918\",\"venue\":\"Optus Stadium\",\"location\":\"Perth\",\"state\":\"WA\",\"timezone\":\"Australia/Perth\",\"utcStartTime\":\"2024-03-29T08:20:00.000+0000\",\"hometeamid\":\"14\",\"hometeamname\":\"Fremantle\",\"hometeamnickname\":\"Dockers\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Adelaide Crows\",\"checked\":true},{\"id\":\"21\",\"roundid\":\"957\",\"roundnumber\":\"3\",\"roundname\":\"Round 3\",\"gameid\":\"5919\",\"venue\":\"Marvel Stadium\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-30T05:20:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Essendon\",\"checked\":true},{\"id\":\"22\",\"roundid\":\"957\",\"roundnumber\":\"3\",\"roundname\":\"Round 3\",\"gameid\":\"5920\",\"venue\":\"Adelaide Oval\",\"location\":\"Adelaide\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-03-30T08:30:00.000+0000\",\"hometeamid\":\"7\",\"hometeamname\":\"Port Adelaide\",\"hometeamnickname\":\"Power\",\"awayteamid\":\"17\",\"awayteamname\":\"Melbourne\",\"awayteamnickname\":\"Demons\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Port Adelaide\",\"checked\":true},{\"id\":\"23\",\"roundid\":\"957\",\"roundnumber\":\"3\",\"roundname\":\"Round 3\",\"gameid\":\"5921\",\"venue\":\"Marvel Stadium\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-31T02:00:00.000+0000\",\"hometeamid\":\"8\",\"hometeamname\":\"Western Bulldogs\",\"hometeamnickname\":\"Bulldogs\",\"awayteamid\":\"18\",\"awayteamname\":\"West Coast Eagles\",\"awayteamnickname\":\"Eagles\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"West Coast Eagles\",\"checked\":true}]', '20', 0, 0, '2023-12-08 12:13:04'),
(43, 'tiffaman@gmail.com', 4, '[{\"id\":\"26\",\"roundid\":\"958\",\"roundnumber\":\"4\",\"roundname\":\"Round 4\",\"gameid\":\"5924\",\"venue\":\"Adelaide Oval\",\"location\":\"Adelaide\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-04-04T08:40:00.000+0000\",\"hometeamid\":\"1\",\"hometeamname\":\"Adelaide Crows\",\"hometeamnickname\":\"Crows\",\"awayteamid\":\"17\",\"awayteamname\":\"Melbourne\",\"awayteamnickname\":\"Demons\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Adelaide Crows\"},{\"id\":\"27\",\"roundid\":\"958\",\"roundnumber\":\"4\",\"roundname\":\"Round 4\",\"gameid\":\"5925\",\"venue\":\"Norwood Oval\",\"location\":\"Adelaide\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-04-05T06:10:00.000+0000\",\"hometeamid\":\"2\",\"hometeamname\":\"Brisbane Lions\",\"hometeamnickname\":\"Lions\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Brisbane Lions\",\"checked\":true},{\"id\":\"28\",\"roundid\":\"958\",\"roundnumber\":\"4\",\"roundname\":\"Round 4\",\"gameid\":\"5926\",\"venue\":\"Adelaide Oval\",\"location\":\"Adelaide\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-04-05T09:10:00.000+0000\",\"hometeamid\":\"7\",\"hometeamname\":\"Port Adelaide\",\"hometeamnickname\":\"Power\",\"awayteamid\":\"12\",\"awayteamname\":\"Essendon\",\"awayteamnickname\":\"Bombers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Port Adelaide\",\"checked\":true},{\"id\":\"29\",\"roundid\":\"958\",\"roundnumber\":\"4\",\"roundname\":\"Round 4\",\"gameid\":\"5927\",\"venue\":\"Adelaide Hills\",\"location\":\"Mt Barker\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-04-06T02:30:00.000+0000\",\"hometeamid\":\"18\",\"hometeamname\":\"West Coast Eagles\",\"hometeamnickname\":\"Eagles\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"West Coast Eagles\",\"checked\":true},{\"id\":\"33\",\"roundid\":\"958\",\"roundnumber\":\"4\",\"roundname\":\"Round 4\",\"gameid\":\"5931\",\"venue\":\"Norwood Oval\",\"location\":\"Adelaide\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-04-07T05:20:00.000+0000\",\"hometeamid\":\"16\",\"hometeamname\":\"Richmond\",\"hometeamnickname\":\"Tigers\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Richmond\",\"checked\":true},{\"id\":\"34\",\"roundid\":\"958\",\"roundnumber\":\"4\",\"roundname\":\"Round 4\",\"gameid\":\"5932\",\"venue\":\"Adelaide Oval\",\"location\":\"Adelaide\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-04-07T07:10:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Collingwood\",\"checked\":true}]', '20', 0, 0, '2023-12-08 12:15:57'),
(44, 'aflpools@gmail.com', 2, '[{\"id\":\"10\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5908\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-21T08:30:00.000+0000\",\"hometeamid\":\"11\",\"hometeamname\":\"St Kilda\",\"hometeamnickname\":\"Saints\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"St Kilda\"},{\"id\":\"11\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5909\",\"venue\":\"Adelaide Oval\",\"location\":\"Adelaide\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-03-22T08:40:00.000+0000\",\"hometeamid\":\"1\",\"hometeamname\":\"Adelaide Crows\",\"hometeamnickname\":\"Crows\",\"awayteamid\":\"10\",\"awayteamname\":\"Geelong Cats\",\"awayteamnickname\":\"Cats\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Geelong Cats\",\"checked\":true},{\"id\":\"12\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"venue\":\"Marvel Stadium\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T02:45:00.000+0000\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"North Melbourne\",\"checked\":true},{\"id\":\"13\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5911\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T05:35:00.000+0000\",\"hometeamid\":\"9\",\"hometeamname\":\"Hawthorn\",\"hometeamnickname\":\"Hawks\",\"awayteamid\":\"17\",\"awayteamname\":\"Melbourne\",\"awayteamnickname\":\"Demons\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Hawthorn\",\"checked\":true},{\"id\":\"14\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5912\",\"venue\":\"SCG\",\"location\":\"Sydney\",\"state\":\"NSW\",\"timezone\":\"Australia/Sydney\",\"utcStartTime\":\"2024-03-23T08:30:00.000+0000\",\"hometeamid\":\"13\",\"hometeamname\":\"Sydney Swans\",\"hometeamnickname\":\"Swans\",\"awayteamid\":\"12\",\"awayteamname\":\"Essendon\",\"awayteamnickname\":\"Bombers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Essendon\",\"checked\":true},{\"id\":\"15\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5913\",\"venue\":\"Mars Stadium\",\"location\":\"Ballarat\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-24T02:00:00.000+0000\",\"hometeamid\":\"8\",\"hometeamname\":\"Western Bulldogs\",\"hometeamnickname\":\"Bulldogs\",\"awayteamid\":\"4\",\"awayteamname\":\"Gold Coast Suns\",\"awayteamnickname\":\"Suns\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Gold Coast Suns\",\"checked\":true}]', '20', 0, 0, '2023-12-09 12:08:41'),
(45, 'aflpools@gmail.com', 2, '[{\"id\":\"10\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5908\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-21T08:30:00.000+0000\",\"hometeamid\":\"11\",\"hometeamname\":\"St Kilda\",\"hometeamnickname\":\"Saints\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"St Kilda\"},{\"id\":\"11\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5909\",\"venue\":\"Adelaide Oval\",\"location\":\"Adelaide\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-03-22T08:40:00.000+0000\",\"hometeamid\":\"1\",\"hometeamname\":\"Adelaide Crows\",\"hometeamnickname\":\"Crows\",\"awayteamid\":\"10\",\"awayteamname\":\"Geelong Cats\",\"awayteamnickname\":\"Cats\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Geelong Cats\",\"checked\":true},{\"id\":\"12\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"venue\":\"Marvel Stadium\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T02:45:00.000+0000\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"North Melbourne\",\"checked\":true},{\"id\":\"13\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5911\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T05:35:00.000+0000\",\"hometeamid\":\"9\",\"hometeamname\":\"Hawthorn\",\"hometeamnickname\":\"Hawks\",\"awayteamid\":\"17\",\"awayteamname\":\"Melbourne\",\"awayteamnickname\":\"Demons\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Hawthorn\",\"checked\":true},{\"id\":\"14\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5912\",\"venue\":\"SCG\",\"location\":\"Sydney\",\"state\":\"NSW\",\"timezone\":\"Australia/Sydney\",\"utcStartTime\":\"2024-03-23T08:30:00.000+0000\",\"hometeamid\":\"13\",\"hometeamname\":\"Sydney Swans\",\"hometeamnickname\":\"Swans\",\"awayteamid\":\"12\",\"awayteamname\":\"Essendon\",\"awayteamnickname\":\"Bombers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Essendon\",\"checked\":true},{\"id\":\"15\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5913\",\"venue\":\"Mars Stadium\",\"location\":\"Ballarat\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-24T02:00:00.000+0000\",\"hometeamid\":\"8\",\"hometeamname\":\"Western Bulldogs\",\"hometeamnickname\":\"Bulldogs\",\"awayteamid\":\"4\",\"awayteamname\":\"Gold Coast Suns\",\"awayteamnickname\":\"Suns\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Gold Coast Suns\",\"checked\":true}]', '20', 0, 0, '2023-12-09 12:08:44'),
(46, 'aflpools@gmail.com', 2, '[{\"id\":\"10\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5908\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-21T08:30:00.000+0000\",\"hometeamid\":\"11\",\"hometeamname\":\"St Kilda\",\"hometeamnickname\":\"Saints\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Collingwood\"},{\"id\":\"11\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5909\",\"venue\":\"Adelaide Oval\",\"location\":\"Adelaide\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-03-22T08:40:00.000+0000\",\"hometeamid\":\"1\",\"hometeamname\":\"Adelaide Crows\",\"hometeamnickname\":\"Crows\",\"awayteamid\":\"10\",\"awayteamname\":\"Geelong Cats\",\"awayteamnickname\":\"Cats\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Adelaide Crows\",\"checked\":true},{\"id\":\"12\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"venue\":\"Marvel Stadium\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T02:45:00.000+0000\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"North Melbourne\",\"checked\":true},{\"id\":\"13\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5911\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T05:35:00.000+0000\",\"hometeamid\":\"9\",\"hometeamname\":\"Hawthorn\",\"hometeamnickname\":\"Hawks\",\"awayteamid\":\"17\",\"awayteamname\":\"Melbourne\",\"awayteamnickname\":\"Demons\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Melbourne\",\"checked\":true},{\"id\":\"14\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5912\",\"venue\":\"SCG\",\"location\":\"Sydney\",\"state\":\"NSW\",\"timezone\":\"Australia/Sydney\",\"utcStartTime\":\"2024-03-23T08:30:00.000+0000\",\"hometeamid\":\"13\",\"hometeamname\":\"Sydney Swans\",\"hometeamnickname\":\"Swans\",\"awayteamid\":\"12\",\"awayteamname\":\"Essendon\",\"awayteamnickname\":\"Bombers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Essendon\",\"checked\":true},{\"id\":\"15\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5913\",\"venue\":\"Mars Stadium\",\"location\":\"Ballarat\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-24T02:00:00.000+0000\",\"hometeamid\":\"8\",\"hometeamname\":\"Western Bulldogs\",\"hometeamnickname\":\"Bulldogs\",\"awayteamid\":\"4\",\"awayteamname\":\"Gold Coast Suns\",\"awayteamnickname\":\"Suns\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Gold Coast Suns\",\"checked\":true}]', '20', 0, 0, '2023-12-10 08:15:16'),
(47, 'testuser5@afltest.com', 2, '[{\"id\":\"10\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5908\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-21T08:30:00.000+0000\",\"hometeamid\":\"11\",\"hometeamname\":\"St Kilda\",\"hometeamnickname\":\"Saints\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"St Kilda\"},{\"id\":\"11\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5909\",\"venue\":\"Adelaide Oval\",\"location\":\"Adelaide\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-03-22T08:40:00.000+0000\",\"hometeamid\":\"1\",\"hometeamname\":\"Adelaide Crows\",\"hometeamnickname\":\"Crows\",\"awayteamid\":\"10\",\"awayteamname\":\"Geelong Cats\",\"awayteamnickname\":\"Cats\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Adelaide Crows\",\"checked\":true},{\"id\":\"12\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"venue\":\"Marvel Stadium\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T02:45:00.000+0000\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"North Melbourne\",\"checked\":true},{\"id\":\"13\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5911\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T05:35:00.000+0000\",\"hometeamid\":\"9\",\"hometeamname\":\"Hawthorn\",\"hometeamnickname\":\"Hawks\",\"awayteamid\":\"17\",\"awayteamname\":\"Melbourne\",\"awayteamnickname\":\"Demons\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Hawthorn\",\"checked\":true},{\"id\":\"14\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5912\",\"venue\":\"SCG\",\"location\":\"Sydney\",\"state\":\"NSW\",\"timezone\":\"Australia/Sydney\",\"utcStartTime\":\"2024-03-23T08:30:00.000+0000\",\"hometeamid\":\"13\",\"hometeamname\":\"Sydney Swans\",\"hometeamnickname\":\"Swans\",\"awayteamid\":\"12\",\"awayteamname\":\"Essendon\",\"awayteamnickname\":\"Bombers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Sydney Swans\",\"checked\":true},{\"id\":\"15\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5913\",\"venue\":\"Mars Stadium\",\"location\":\"Ballarat\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-24T02:00:00.000+0000\",\"hometeamid\":\"8\",\"hometeamname\":\"Western Bulldogs\",\"hometeamnickname\":\"Bulldogs\",\"awayteamid\":\"4\",\"awayteamname\":\"Gold Coast Suns\",\"awayteamnickname\":\"Suns\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Western Bulldogs\",\"checked\":true}]', '20', 0, 0, '2023-12-11 10:00:56'),
(48, 'testuser5@afltest.com', 2, '[{\"id\":\"10\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5908\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-21T08:30:00.000+0000\",\"hometeamid\":\"11\",\"hometeamname\":\"St Kilda\",\"hometeamnickname\":\"Saints\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Collingwood\"},{\"id\":\"11\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5909\",\"venue\":\"Adelaide Oval\",\"location\":\"Adelaide\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-03-22T08:40:00.000+0000\",\"hometeamid\":\"1\",\"hometeamname\":\"Adelaide Crows\",\"hometeamnickname\":\"Crows\",\"awayteamid\":\"10\",\"awayteamname\":\"Geelong Cats\",\"awayteamnickname\":\"Cats\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Geelong Cats\",\"checked\":true},{\"id\":\"12\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"venue\":\"Marvel Stadium\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T02:45:00.000+0000\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"North Melbourne\",\"checked\":true},{\"id\":\"13\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5911\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T05:35:00.000+0000\",\"hometeamid\":\"9\",\"hometeamname\":\"Hawthorn\",\"hometeamnickname\":\"Hawks\",\"awayteamid\":\"17\",\"awayteamname\":\"Melbourne\",\"awayteamnickname\":\"Demons\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Hawthorn\",\"checked\":true},{\"id\":\"14\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5912\",\"venue\":\"SCG\",\"location\":\"Sydney\",\"state\":\"NSW\",\"timezone\":\"Australia/Sydney\",\"utcStartTime\":\"2024-03-23T08:30:00.000+0000\",\"hometeamid\":\"13\",\"hometeamname\":\"Sydney Swans\",\"hometeamnickname\":\"Swans\",\"awayteamid\":\"12\",\"awayteamname\":\"Essendon\",\"awayteamnickname\":\"Bombers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Sydney Swans\",\"checked\":true},{\"id\":\"15\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5913\",\"venue\":\"Mars Stadium\",\"location\":\"Ballarat\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-24T02:00:00.000+0000\",\"hometeamid\":\"8\",\"hometeamname\":\"Western Bulldogs\",\"hometeamnickname\":\"Bulldogs\",\"awayteamid\":\"4\",\"awayteamname\":\"Gold Coast Suns\",\"awayteamnickname\":\"Suns\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Western Bulldogs\",\"checked\":true}]', '20', 0, 0, '2023-12-11 10:11:39'),
(49, 'aflpools@gmail.com', 2, '[{\"id\":\"10\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5908\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-21T08:30:00.000+0000\",\"hometeamid\":\"11\",\"hometeamname\":\"St Kilda\",\"hometeamnickname\":\"Saints\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Collingwood\"},{\"id\":\"12\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"venue\":\"Marvel Stadium\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T02:45:00.000+0000\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"North Melbourne\",\"checked\":true},{\"id\":\"14\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5912\",\"venue\":\"SCG\",\"location\":\"Sydney\",\"state\":\"NSW\",\"timezone\":\"Australia/Sydney\",\"utcStartTime\":\"2024-03-23T08:30:00.000+0000\",\"hometeamid\":\"13\",\"hometeamname\":\"Sydney Swans\",\"hometeamnickname\":\"Swans\",\"awayteamid\":\"12\",\"awayteamname\":\"Essendon\",\"awayteamnickname\":\"Bombers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Essendon\",\"checked\":true},{\"id\":\"15\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5913\",\"venue\":\"Mars Stadium\",\"location\":\"Ballarat\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-24T02:00:00.000+0000\",\"hometeamid\":\"8\",\"hometeamname\":\"Western Bulldogs\",\"hometeamnickname\":\"Bulldogs\",\"awayteamid\":\"4\",\"awayteamname\":\"Gold Coast Suns\",\"awayteamnickname\":\"Suns\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Western Bulldogs\",\"checked\":true},{\"id\":\"16\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5915\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-24T05:00:00.000+0000\",\"hometeamid\":\"16\",\"hometeamname\":\"Richmond\",\"hometeamnickname\":\"Tigers\",\"awayteamid\":\"7\",\"awayteamname\":\"Port Adelaide\",\"awayteamnickname\":\"Power\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Port Adelaide\",\"checked\":true},{\"id\":\"17\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5914\",\"venue\":\"Optus Stadium\",\"location\":\"Perth\",\"state\":\"WA\",\"timezone\":\"Australia/Perth\",\"utcStartTime\":\"2024-03-24T07:50:00.000+0000\",\"hometeamid\":\"18\",\"hometeamname\":\"West Coast Eagles\",\"hometeamnickname\":\"Eagles\",\"awayteamid\":\"15\",\"awayteamname\":\"GWS Giants\",\"awayteamnickname\":\"Giants\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"West Coast Eagles\",\"checked\":true}]', '20', 0, 0, '2023-12-11 11:33:41');
INSERT INTO `predictions` (`id`, `email`, `roundnumber`, `predictthisjson`, `amount`, `correct_count`, `winner`, `datecreated`) VALUES
(50, 'john.horton86@gmail.com', 2, '[{\"id\":\"10\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5908\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-21T08:30:00.000+0000\",\"hometeamid\":\"11\",\"hometeamname\":\"St Kilda\",\"hometeamnickname\":\"Saints\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Collingwood\"},{\"id\":\"11\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5909\",\"venue\":\"Adelaide Oval\",\"location\":\"Adelaide\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-03-22T08:40:00.000+0000\",\"hometeamid\":\"1\",\"hometeamname\":\"Adelaide Crows\",\"hometeamnickname\":\"Crows\",\"awayteamid\":\"10\",\"awayteamname\":\"Geelong Cats\",\"awayteamnickname\":\"Cats\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Adelaide Crows\",\"checked\":true},{\"id\":\"12\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"venue\":\"Marvel Stadium\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T02:45:00.000+0000\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"North Melbourne\",\"checked\":true},{\"id\":\"13\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5911\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T05:35:00.000+0000\",\"hometeamid\":\"9\",\"hometeamname\":\"Hawthorn\",\"hometeamnickname\":\"Hawks\",\"awayteamid\":\"17\",\"awayteamname\":\"Melbourne\",\"awayteamnickname\":\"Demons\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Melbourne\",\"checked\":true},{\"id\":\"14\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5912\",\"venue\":\"SCG\",\"location\":\"Sydney\",\"state\":\"NSW\",\"timezone\":\"Australia/Sydney\",\"utcStartTime\":\"2024-03-23T08:30:00.000+0000\",\"hometeamid\":\"13\",\"hometeamname\":\"Sydney Swans\",\"hometeamnickname\":\"Swans\",\"awayteamid\":\"12\",\"awayteamname\":\"Essendon\",\"awayteamnickname\":\"Bombers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Sydney Swans\",\"checked\":true},{\"id\":\"15\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5913\",\"venue\":\"Mars Stadium\",\"location\":\"Ballarat\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-24T02:00:00.000+0000\",\"hometeamid\":\"8\",\"hometeamname\":\"Western Bulldogs\",\"hometeamnickname\":\"Bulldogs\",\"awayteamid\":\"4\",\"awayteamname\":\"Gold Coast Suns\",\"awayteamnickname\":\"Suns\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Gold Coast Suns\",\"checked\":true}]', '20', 0, 0, '2023-12-11 12:05:25'),
(51, 'john.horton86@gmail.com', 2, '[{\"id\":\"10\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5908\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-21T08:30:00.000+0000\",\"hometeamid\":\"11\",\"hometeamname\":\"St Kilda\",\"hometeamnickname\":\"Saints\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Collingwood\"},{\"id\":\"11\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5909\",\"venue\":\"Adelaide Oval\",\"location\":\"Adelaide\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-03-22T08:40:00.000+0000\",\"hometeamid\":\"1\",\"hometeamname\":\"Adelaide Crows\",\"hometeamnickname\":\"Crows\",\"awayteamid\":\"10\",\"awayteamname\":\"Geelong Cats\",\"awayteamnickname\":\"Cats\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Geelong Cats\",\"checked\":true},{\"id\":\"12\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"venue\":\"Marvel Stadium\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T02:45:00.000+0000\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Fremantle\",\"checked\":true},{\"id\":\"13\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5911\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T05:35:00.000+0000\",\"hometeamid\":\"9\",\"hometeamname\":\"Hawthorn\",\"hometeamnickname\":\"Hawks\",\"awayteamid\":\"17\",\"awayteamname\":\"Melbourne\",\"awayteamnickname\":\"Demons\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Melbourne\",\"checked\":true},{\"id\":\"14\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5912\",\"venue\":\"SCG\",\"location\":\"Sydney\",\"state\":\"NSW\",\"timezone\":\"Australia/Sydney\",\"utcStartTime\":\"2024-03-23T08:30:00.000+0000\",\"hometeamid\":\"13\",\"hometeamname\":\"Sydney Swans\",\"hometeamnickname\":\"Swans\",\"awayteamid\":\"12\",\"awayteamname\":\"Essendon\",\"awayteamnickname\":\"Bombers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Essendon\",\"checked\":true},{\"id\":\"15\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5913\",\"venue\":\"Mars Stadium\",\"location\":\"Ballarat\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-24T02:00:00.000+0000\",\"hometeamid\":\"8\",\"hometeamname\":\"Western Bulldogs\",\"hometeamnickname\":\"Bulldogs\",\"awayteamid\":\"4\",\"awayteamname\":\"Gold Coast Suns\",\"awayteamnickname\":\"Suns\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Gold Coast Suns\",\"checked\":true}]', '20', 0, 0, '2023-12-11 12:30:25'),
(52, 'john.horton86@gmail.com', 2, '[{\"id\":\"12\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"venue\":\"Marvel Stadium\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T02:45:00.000+0000\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Fremantle\",\"checked\":true},{\"id\":\"13\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5911\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T05:35:00.000+0000\",\"hometeamid\":\"9\",\"hometeamname\":\"Hawthorn\",\"hometeamnickname\":\"Hawks\",\"awayteamid\":\"17\",\"awayteamname\":\"Melbourne\",\"awayteamnickname\":\"Demons\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Melbourne\",\"checked\":true},{\"id\":\"14\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5912\",\"venue\":\"SCG\",\"location\":\"Sydney\",\"state\":\"NSW\",\"timezone\":\"Australia/Sydney\",\"utcStartTime\":\"2024-03-23T08:30:00.000+0000\",\"hometeamid\":\"13\",\"hometeamname\":\"Sydney Swans\",\"hometeamnickname\":\"Swans\",\"awayteamid\":\"12\",\"awayteamname\":\"Essendon\",\"awayteamnickname\":\"Bombers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Essendon\",\"checked\":true},{\"id\":\"15\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5913\",\"venue\":\"Mars Stadium\",\"location\":\"Ballarat\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-24T02:00:00.000+0000\",\"hometeamid\":\"8\",\"hometeamname\":\"Western Bulldogs\",\"hometeamnickname\":\"Bulldogs\",\"awayteamid\":\"4\",\"awayteamname\":\"Gold Coast Suns\",\"awayteamnickname\":\"Suns\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Gold Coast Suns\",\"checked\":true},{\"id\":\"16\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5915\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-24T05:00:00.000+0000\",\"hometeamid\":\"16\",\"hometeamname\":\"Richmond\",\"hometeamnickname\":\"Tigers\",\"awayteamid\":\"7\",\"awayteamname\":\"Port Adelaide\",\"awayteamnickname\":\"Power\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Port Adelaide\",\"checked\":true},{\"id\":\"17\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5914\",\"venue\":\"Optus Stadium\",\"location\":\"Perth\",\"state\":\"WA\",\"timezone\":\"Australia/Perth\",\"utcStartTime\":\"2024-03-24T07:50:00.000+0000\",\"hometeamid\":\"18\",\"hometeamname\":\"West Coast Eagles\",\"hometeamnickname\":\"Eagles\",\"awayteamid\":\"15\",\"awayteamname\":\"GWS Giants\",\"awayteamnickname\":\"Giants\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"GWS Giants\"}]', '20', 0, 0, '2023-12-11 12:34:26'),
(53, 'aflpools@gmail.com', 2, '[{\"id\":\"10\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5908\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-21T08:30:00.000+0000\",\"hometeamid\":\"11\",\"hometeamname\":\"St Kilda\",\"hometeamnickname\":\"Saints\",\"awayteamid\":\"3\",\"awayteamname\":\"Collingwood\",\"awayteamnickname\":\"Magpies\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Collingwood\"},{\"id\":\"11\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5909\",\"venue\":\"Adelaide Oval\",\"location\":\"Adelaide\",\"state\":\"SA\",\"timezone\":\"Australia/Adelaide\",\"utcStartTime\":\"2024-03-22T08:40:00.000+0000\",\"hometeamid\":\"1\",\"hometeamname\":\"Adelaide Crows\",\"hometeamnickname\":\"Crows\",\"awayteamid\":\"10\",\"awayteamname\":\"Geelong Cats\",\"awayteamnickname\":\"Cats\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Adelaide Crows\",\"checked\":true},{\"id\":\"12\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5910\",\"venue\":\"Marvel Stadium\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-23T02:45:00.000+0000\",\"hometeamid\":\"6\",\"hometeamname\":\"North Melbourne\",\"hometeamnickname\":\"Kangaroos\",\"awayteamid\":\"14\",\"awayteamname\":\"Fremantle\",\"awayteamnickname\":\"Dockers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Fremantle\",\"checked\":true},{\"id\":\"14\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5912\",\"venue\":\"SCG\",\"location\":\"Sydney\",\"state\":\"NSW\",\"timezone\":\"Australia/Sydney\",\"utcStartTime\":\"2024-03-23T08:30:00.000+0000\",\"hometeamid\":\"13\",\"hometeamname\":\"Sydney Swans\",\"hometeamnickname\":\"Swans\",\"awayteamid\":\"12\",\"awayteamname\":\"Essendon\",\"awayteamnickname\":\"Bombers\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Essendon\",\"checked\":true},{\"id\":\"16\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5915\",\"venue\":\"MCG\",\"location\":\"Melbourne\",\"state\":\"VIC\",\"timezone\":\"Australia/Melbourne\",\"utcStartTime\":\"2024-03-24T05:00:00.000+0000\",\"hometeamid\":\"16\",\"hometeamname\":\"Richmond\",\"hometeamnickname\":\"Tigers\",\"awayteamid\":\"7\",\"awayteamname\":\"Port Adelaide\",\"awayteamnickname\":\"Power\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"Port Adelaide\",\"checked\":true},{\"id\":\"17\",\"roundid\":\"956\",\"roundnumber\":\"2\",\"roundname\":\"Round 2\",\"gameid\":\"5914\",\"venue\":\"Optus Stadium\",\"location\":\"Perth\",\"state\":\"WA\",\"timezone\":\"Australia/Perth\",\"utcStartTime\":\"2024-03-24T07:50:00.000+0000\",\"hometeamid\":\"18\",\"hometeamname\":\"West Coast Eagles\",\"hometeamnickname\":\"Eagles\",\"awayteamid\":\"15\",\"awayteamname\":\"GWS Giants\",\"awayteamnickname\":\"Giants\",\"completed\":\"0\",\"result\":\"\",\"winname\":\"West Coast Eagles\",\"checked\":true}]', '20', 0, 0, '2023-12-11 12:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `prizepool`
--

DROP TABLE IF EXISTS `prizepool`;
CREATE TABLE `prizepool` (
  `id` int NOT NULL,
  `roundnumber` int NOT NULL,
  `amount` float NOT NULL,
  `dateupdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prizepool`
--

INSERT INTO `prizepool` (`id`, `roundnumber`, `amount`, `dateupdated`) VALUES
(2, 1, 420, '2023-12-07 11:11:23'),
(3, 2, 0, '2023-12-08 12:57:30'),
(4, 3, 0, '2023-12-08 12:57:30'),
(5, 4, 0, '2023-12-08 12:57:30'),
(6, 5, 0, '2023-12-08 12:57:30'),
(7, 6, 0, '2023-12-08 12:57:31'),
(8, 7, 0, '2023-12-08 12:57:31'),
(9, 8, 0, '2023-12-08 12:57:31'),
(10, 9, 0, '2023-12-08 12:57:31'),
(11, 10, 0, '2023-12-08 12:57:31'),
(12, 11, 0, '2023-12-08 12:57:31'),
(13, 12, 0, '2023-12-08 12:57:31'),
(14, 13, 0, '2023-12-08 12:57:31'),
(15, 14, 0, '2023-12-08 12:57:31'),
(16, 15, 0, '2023-12-08 12:57:31'),
(17, 16, 0, '2023-12-08 12:57:31'),
(18, 17, 0, '2023-12-08 12:57:31'),
(19, 18, 0, '2023-12-08 12:57:31'),
(20, 19, 0, '2023-12-08 12:57:32'),
(21, 20, 0, '2023-12-08 12:57:32'),
(22, 21, 0, '2023-12-08 12:57:32'),
(23, 22, 0, '2023-12-08 12:57:32'),
(24, 23, 0, '2023-12-08 12:57:32'),
(25, 24, 0, '2023-12-08 12:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `id` int NOT NULL,
  `email` varchar(128) NOT NULL,
  `roundnumber` int NOT NULL,
  `gameid` int NOT NULL,
  `predictionid` int NOT NULL,
  `gamedesc` varchar(128) NOT NULL,
  `winner` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `predicted` varchar(64) NOT NULL,
  `outcome` int NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `email`, `roundnumber`, `gameid`, `predictionid`, `gamedesc`, `winner`, `predicted`, `outcome`, `datecreated`) VALUES
(1, 'aflpools@gmail.com', 1, 5900, 6, 'Collingwood vs Sydney Swans', 'Collingwood', 'Collingwood', 1, '2023-12-04 14:40:49'),
(2, 'aflpools@gmail.com', 1, 5901, 6, 'Essendon vs Hawthorn', 'Essendon', 'Essendon', 1, '2023-12-04 14:40:49'),
(3, 'aflpools@gmail.com', 1, 5902, 6, 'GWS Giants vs North Melbourne', 'GWS Giants', 'GWS Giants', 1, '2023-12-04 14:40:49'),
(4, 'aflpools@gmail.com', 1, 5903, 6, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:49'),
(5, 'aflpools@gmail.com', 1, 5905, 6, 'Melbourne vs Western Bulldogs', 'Melbourne', 'Melbourne', 1, '2023-12-04 14:40:49'),
(6, 'aflpools@gmail.com', 1, 5906, 6, 'Port Adelaide vs West Coast Eagles', 'Port Adelaide', 'Port Adelaide', 1, '2023-12-04 14:40:49'),
(7, 'tiffaman@gmail.com', 1, 5899, 7, 'Carlton vs Richmond', 'Carlton', 'Carlton', 1, '2023-12-04 14:40:49'),
(8, 'tiffaman@gmail.com', 1, 5900, 7, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:50'),
(9, 'tiffaman@gmail.com', 1, 5901, 7, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:50'),
(10, 'tiffaman@gmail.com', 1, 5902, 7, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:50'),
(11, 'tiffaman@gmail.com', 1, 5904, 7, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:50'),
(12, 'tiffaman@gmail.com', 1, 5903, 7, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:50'),
(13, 'tiffaman@gmail.com', 1, 5899, 16, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:50'),
(14, 'tiffaman@gmail.com', 1, 5900, 16, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:50'),
(15, 'tiffaman@gmail.com', 1, 5901, 16, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:50'),
(16, 'tiffaman@gmail.com', 1, 5902, 16, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:50'),
(17, 'tiffaman@gmail.com', 1, 5904, 16, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:50'),
(18, 'tiffaman@gmail.com', 1, 5903, 16, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:50'),
(19, 'tiffaman@gmail.com', 1, 5899, 17, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:51'),
(20, 'tiffaman@gmail.com', 1, 5900, 17, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:51'),
(21, 'tiffaman@gmail.com', 1, 5901, 17, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:51'),
(22, 'tiffaman@gmail.com', 1, 5902, 17, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:51'),
(23, 'tiffaman@gmail.com', 1, 5904, 17, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:51'),
(24, 'tiffaman@gmail.com', 1, 5903, 17, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:51'),
(25, 'testuser12@afltest.com', 1, 5899, 18, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:51'),
(26, 'testuser12@afltest.com', 1, 5900, 18, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:51'),
(27, 'testuser12@afltest.com', 1, 5901, 18, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:51'),
(28, 'testuser12@afltest.com', 1, 5902, 18, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:51'),
(29, 'testuser12@afltest.com', 1, 5904, 18, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:52'),
(30, 'testuser12@afltest.com', 1, 5903, 18, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:52'),
(31, 'testuser13@afltest.com', 1, 5899, 19, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:52'),
(32, 'testuser13@afltest.com', 1, 5900, 19, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:52'),
(33, 'testuser13@afltest.com', 1, 5901, 19, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:52'),
(34, 'testuser13@afltest.com', 1, 5902, 19, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:52'),
(35, 'testuser13@afltest.com', 1, 5904, 19, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:52'),
(36, 'testuser13@afltest.com', 1, 5903, 19, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:52'),
(37, 'testuser14@afltest.com', 1, 5899, 20, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:52'),
(38, 'testuser14@afltest.com', 1, 5900, 20, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:52'),
(39, 'testuser14@afltest.com', 1, 5901, 20, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:52'),
(40, 'testuser14@afltest.com', 1, 5902, 20, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:53'),
(41, 'testuser14@afltest.com', 1, 5904, 20, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:53'),
(42, 'testuser14@afltest.com', 1, 5903, 20, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:53'),
(43, 'testuser15@afltest.com', 1, 5899, 21, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:53'),
(44, 'testuser15@afltest.com', 1, 5900, 21, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:53'),
(45, 'testuser15@afltest.com', 1, 5901, 21, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:53'),
(46, 'testuser15@afltest.com', 1, 5902, 21, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:53'),
(47, 'testuser15@afltest.com', 1, 5904, 21, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:53'),
(48, 'testuser15@afltest.com', 1, 5903, 21, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:53'),
(49, 'testuser16@afltest.com', 1, 5899, 22, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:53'),
(50, 'testuser16@afltest.com', 1, 5900, 22, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:53'),
(51, 'testuser16@afltest.com', 1, 5901, 22, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:54'),
(52, 'testuser16@afltest.com', 1, 5902, 22, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:54'),
(53, 'testuser16@afltest.com', 1, 5904, 22, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:54'),
(54, 'testuser16@afltest.com', 1, 5903, 22, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:54'),
(55, 'testuser17@afltest.com', 1, 5899, 23, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:54'),
(56, 'testuser17@afltest.com', 1, 5900, 23, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:54'),
(57, 'testuser17@afltest.com', 1, 5901, 23, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:54'),
(58, 'testuser17@afltest.com', 1, 5902, 23, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:54'),
(59, 'testuser17@afltest.com', 1, 5904, 23, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:54'),
(60, 'testuser17@afltest.com', 1, 5903, 23, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:54'),
(61, 'testuser18@afltest.com', 1, 5899, 24, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:55'),
(62, 'testuser18@afltest.com', 1, 5900, 24, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:55'),
(63, 'testuser18@afltest.com', 1, 5901, 24, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:55'),
(64, 'testuser18@afltest.com', 1, 5902, 24, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:55'),
(65, 'testuser18@afltest.com', 1, 5904, 24, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:55'),
(66, 'testuser18@afltest.com', 1, 5903, 24, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:55'),
(67, 'testuser19@afltest.com', 1, 5899, 25, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:55'),
(68, 'testuser19@afltest.com', 1, 5900, 25, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:55'),
(69, 'testuser19@afltest.com', 1, 5901, 25, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:55'),
(70, 'testuser19@afltest.com', 1, 5902, 25, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:55'),
(71, 'testuser19@afltest.com', 1, 5904, 25, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:55'),
(72, 'testuser19@afltest.com', 1, 5903, 25, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:55'),
(73, 'testuser20@afltest.com', 1, 5899, 26, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:56'),
(74, 'testuser20@afltest.com', 1, 5900, 26, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:56'),
(75, 'testuser20@afltest.com', 1, 5901, 26, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:56'),
(76, 'testuser20@afltest.com', 1, 5902, 26, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:56'),
(77, 'testuser20@afltest.com', 1, 5904, 26, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:56'),
(78, 'testuser20@afltest.com', 1, 5903, 26, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:56'),
(79, 'testuser21@afltest.com', 1, 5899, 27, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:56'),
(80, 'testuser21@afltest.com', 1, 5900, 27, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:56'),
(81, 'testuser21@afltest.com', 1, 5901, 27, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:56'),
(82, 'testuser21@afltest.com', 1, 5902, 27, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:56'),
(83, 'testuser21@afltest.com', 1, 5904, 27, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:57'),
(84, 'testuser21@afltest.com', 1, 5903, 27, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:57'),
(85, 'testuser22@afltest.com', 1, 5899, 28, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:57'),
(86, 'testuser22@afltest.com', 1, 5900, 28, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:57'),
(87, 'testuser22@afltest.com', 1, 5901, 28, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:57'),
(88, 'testuser22@afltest.com', 1, 5902, 28, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:57'),
(89, 'testuser22@afltest.com', 1, 5904, 28, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:57'),
(90, 'testuser22@afltest.com', 1, 5903, 28, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:57'),
(91, 'testuser23@afltest.com', 1, 5899, 29, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:57'),
(92, 'testuser23@afltest.com', 1, 5900, 29, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:57'),
(93, 'testuser23@afltest.com', 1, 5901, 29, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:57'),
(94, 'testuser23@afltest.com', 1, 5902, 29, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:58'),
(95, 'testuser23@afltest.com', 1, 5904, 29, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:58'),
(96, 'testuser23@afltest.com', 1, 5903, 29, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:58'),
(97, 'testuser24@afltest.com', 1, 5899, 30, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:58'),
(98, 'testuser24@afltest.com', 1, 5900, 30, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:58'),
(99, 'testuser24@afltest.com', 1, 5901, 30, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:58'),
(100, 'testuser24@afltest.com', 1, 5902, 30, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:58'),
(101, 'testuser24@afltest.com', 1, 5904, 30, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:58'),
(102, 'testuser24@afltest.com', 1, 5903, 30, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:58'),
(103, 'testuser24@afltest.com', 1, 5899, 31, 'Carlton vs Richmond', 'Carlton', 'Richmond', 0, '2023-12-04 14:40:58'),
(104, 'testuser24@afltest.com', 1, 5900, 31, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:59'),
(105, 'testuser24@afltest.com', 1, 5901, 31, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:59'),
(106, 'testuser24@afltest.com', 1, 5902, 31, 'GWS Giants vs North Melbourne', 'GWS Giants', 'North Melbourne', 0, '2023-12-04 14:40:59'),
(107, 'testuser24@afltest.com', 1, 5904, 31, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'Geelong Cats', 1, '2023-12-04 14:40:59'),
(108, 'testuser24@afltest.com', 1, 5903, 31, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:59'),
(109, 'john.horton86@gmail.com', 1, 5900, 32, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:40:59'),
(110, 'john.horton86@gmail.com', 1, 5901, 32, 'Essendon vs Hawthorn', 'Essendon', 'Hawthorn', 0, '2023-12-04 14:40:59'),
(111, 'john.horton86@gmail.com', 1, 5904, 32, 'Geelong Cats vs St Kilda', 'Geelong Cats', 'St Kilda', 0, '2023-12-04 14:40:59'),
(112, 'john.horton86@gmail.com', 1, 5903, 32, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:40:59'),
(113, 'john.horton86@gmail.com', 1, 5906, 32, 'Port Adelaide vs West Coast Eagles', 'Port Adelaide', 'Port Adelaide', 1, '2023-12-04 14:40:59'),
(114, 'john.horton86@gmail.com', 1, 5907, 32, 'Fremantle vs Brisbane Lions', 'Fremantle', 'Brisbane Lions', 0, '2023-12-04 14:40:59'),
(115, 'john.horton86@gmail.com', 1, 5900, 33, 'Collingwood vs Sydney Swans', 'Collingwood', 'Collingwood', 1, '2023-12-04 14:41:00'),
(116, 'john.horton86@gmail.com', 1, 5901, 33, 'Essendon vs Hawthorn', 'Essendon', 'Essendon', 1, '2023-12-04 14:41:00'),
(117, 'john.horton86@gmail.com', 1, 5902, 33, 'GWS Giants vs North Melbourne', 'GWS Giants', 'GWS Giants', 1, '2023-12-04 14:41:00'),
(118, 'john.horton86@gmail.com', 1, 5903, 33, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:41:00'),
(119, 'john.horton86@gmail.com', 1, 5905, 33, 'Melbourne vs Western Bulldogs', 'Melbourne', 'Melbourne', 1, '2023-12-04 14:41:00'),
(120, 'john.horton86@gmail.com', 1, 5906, 33, 'Port Adelaide vs West Coast Eagles', 'Port Adelaide', 'Port Adelaide', 1, '2023-12-04 14:41:00'),
(121, 'john.horton86@gmail.com', 1, 5900, 34, 'Collingwood vs Sydney Swans', 'Collingwood', 'Sydney Swans', 0, '2023-12-04 14:41:00'),
(122, 'john.horton86@gmail.com', 1, 5901, 34, 'Essendon vs Hawthorn', 'Essendon', 'Essendon', 1, '2023-12-04 14:41:00'),
(123, 'john.horton86@gmail.com', 1, 5902, 34, 'GWS Giants vs North Melbourne', 'GWS Giants', 'GWS Giants', 1, '2023-12-04 14:41:00'),
(124, 'john.horton86@gmail.com', 1, 5903, 34, 'Gold Coast Suns vs Adelaide Crows', 'Gold Coast Suns', 'Gold Coast Suns', 1, '2023-12-04 14:41:00'),
(125, 'john.horton86@gmail.com', 1, 5905, 34, 'Melbourne vs Western Bulldogs', 'Melbourne', 'Melbourne', 1, '2023-12-04 14:41:00'),
(126, 'john.horton86@gmail.com', 1, 5906, 34, 'Port Adelaide vs West Coast Eagles', 'Port Adelaide', 'Port Adelaide', 1, '2023-12-04 14:41:01'),
(127, 'aflpools@gmail.com', 1, 5900, 6, 'Collingwood vs Sydney Swans', '', 'Collingwood', 1, '2023-12-12 11:53:55'),
(128, 'aflpools@gmail.com', 1, 5901, 6, 'Essendon vs Hawthorn', '', 'Essendon', 1, '2023-12-12 11:53:55'),
(129, 'aflpools@gmail.com', 1, 5902, 6, 'GWS Giants vs North Melbourne', '', 'GWS Giants', 1, '2023-12-12 11:53:55'),
(130, 'aflpools@gmail.com', 1, 5903, 6, 'Gold Coast Suns vs Adelaide Crows', '', 'Gold Coast Suns', 1, '2023-12-12 11:53:55'),
(131, 'aflpools@gmail.com', 1, 5905, 6, 'Melbourne vs Western Bulldogs', '', 'Melbourne', 1, '2023-12-12 11:53:55'),
(132, 'aflpools@gmail.com', 1, 5906, 6, 'Port Adelaide vs West Coast Eagles', '', 'Port Adelaide', 1, '2023-12-12 11:53:55'),
(133, 'testuser2@afltest.com', 1, 5899, 7, 'Carlton vs Richmond', '', 'Carlton', 1, '2023-12-12 11:53:56'),
(134, 'testuser2@afltest.com', 1, 5900, 7, 'Collingwood vs Sydney Swans', '', 'Sydney Swans', 0, '2023-12-12 11:53:56'),
(135, 'testuser2@afltest.com', 1, 5901, 7, 'Essendon vs Hawthorn', '', 'Hawthorn', 0, '2023-12-12 11:53:56'),
(136, 'testuser2@afltest.com', 1, 5902, 7, 'GWS Giants vs North Melbourne', '', 'North Melbourne', 0, '2023-12-12 11:53:56'),
(137, 'testuser2@afltest.com', 1, 5904, 7, 'Geelong Cats vs St Kilda', '', 'Geelong Cats', 1, '2023-12-12 11:53:56'),
(138, 'testuser2@afltest.com', 1, 5903, 7, 'Gold Coast Suns vs Adelaide Crows', '', 'Gold Coast Suns', 1, '2023-12-12 11:53:56'),
(139, 'testuser10@afltest.com', 1, 5899, 16, 'Carlton vs Richmond', '', 'Richmond', 0, '2023-12-12 11:53:56'),
(140, 'testuser10@afltest.com', 1, 5900, 16, 'Collingwood vs Sydney Swans', '', 'Sydney Swans', 0, '2023-12-12 11:53:56'),
(141, 'testuser10@afltest.com', 1, 5901, 16, 'Essendon vs Hawthorn', '', 'Hawthorn', 0, '2023-12-12 11:53:56'),
(142, 'testuser10@afltest.com', 1, 5902, 16, 'GWS Giants vs North Melbourne', '', 'North Melbourne', 0, '2023-12-12 11:53:56'),
(143, 'testuser10@afltest.com', 1, 5904, 16, 'Geelong Cats vs St Kilda', '', 'Geelong Cats', 1, '2023-12-12 11:53:56'),
(144, 'testuser10@afltest.com', 1, 5903, 16, 'Gold Coast Suns vs Adelaide Crows', '', 'Gold Coast Suns', 1, '2023-12-12 11:53:57'),
(145, 'testuser11@afltest.com', 1, 5899, 17, 'Carlton vs Richmond', '', 'Richmond', 0, '2023-12-12 11:53:57'),
(146, 'testuser11@afltest.com', 1, 5900, 17, 'Collingwood vs Sydney Swans', '', 'Sydney Swans', 0, '2023-12-12 11:53:57'),
(147, 'testuser11@afltest.com', 1, 5901, 17, 'Essendon vs Hawthorn', '', 'Hawthorn', 0, '2023-12-12 11:53:57'),
(148, 'testuser11@afltest.com', 1, 5902, 17, 'GWS Giants vs North Melbourne', '', 'North Melbourne', 0, '2023-12-12 11:53:57'),
(149, 'testuser11@afltest.com', 1, 5904, 17, 'Geelong Cats vs St Kilda', '', 'Geelong Cats', 1, '2023-12-12 11:53:57'),
(150, 'testuser11@afltest.com', 1, 5903, 17, 'Gold Coast Suns vs Adelaide Crows', '', 'Gold Coast Suns', 1, '2023-12-12 11:53:57'),
(151, 'testuser12@afltest.com', 1, 5899, 18, 'Carlton vs Richmond', '', 'Richmond', 0, '2023-12-12 11:53:57'),
(152, 'testuser12@afltest.com', 1, 5900, 18, 'Collingwood vs Sydney Swans', '', 'Sydney Swans', 0, '2023-12-12 11:53:57'),
(153, 'testuser12@afltest.com', 1, 5901, 18, 'Essendon vs Hawthorn', '', 'Hawthorn', 0, '2023-12-12 11:53:57'),
(154, 'testuser12@afltest.com', 1, 5902, 18, 'GWS Giants vs North Melbourne', '', 'North Melbourne', 0, '2023-12-12 11:53:57'),
(155, 'testuser12@afltest.com', 1, 5904, 18, 'Geelong Cats vs St Kilda', '', 'Geelong Cats', 1, '2023-12-12 11:53:58'),
(156, 'testuser12@afltest.com', 1, 5903, 18, 'Gold Coast Suns vs Adelaide Crows', '', 'Gold Coast Suns', 1, '2023-12-12 11:53:58'),
(157, 'testuser13@afltest.com', 1, 5899, 19, 'Carlton vs Richmond', '', 'Richmond', 0, '2023-12-12 11:53:58'),
(158, 'testuser13@afltest.com', 1, 5900, 19, 'Collingwood vs Sydney Swans', '', 'Sydney Swans', 0, '2023-12-12 11:53:58'),
(159, 'testuser13@afltest.com', 1, 5901, 19, 'Essendon vs Hawthorn', '', 'Hawthorn', 0, '2023-12-12 11:53:58'),
(160, 'testuser13@afltest.com', 1, 5902, 19, 'GWS Giants vs North Melbourne', '', 'North Melbourne', 0, '2023-12-12 11:53:58'),
(161, 'testuser13@afltest.com', 1, 5904, 19, 'Geelong Cats vs St Kilda', '', 'Geelong Cats', 1, '2023-12-12 11:53:58'),
(162, 'testuser13@afltest.com', 1, 5903, 19, 'Gold Coast Suns vs Adelaide Crows', '', 'Gold Coast Suns', 1, '2023-12-12 11:53:58'),
(163, 'testuser14@afltest.com', 1, 5899, 20, 'Carlton vs Richmond', '', 'Richmond', 0, '2023-12-12 11:53:58'),
(164, 'testuser14@afltest.com', 1, 5900, 20, 'Collingwood vs Sydney Swans', '', 'Sydney Swans', 0, '2023-12-12 11:53:58'),
(165, 'testuser14@afltest.com', 1, 5901, 20, 'Essendon vs Hawthorn', '', 'Hawthorn', 0, '2023-12-12 11:53:58'),
(166, 'testuser14@afltest.com', 1, 5902, 20, 'GWS Giants vs North Melbourne', '', 'North Melbourne', 0, '2023-12-12 11:53:59'),
(167, 'testuser14@afltest.com', 1, 5904, 20, 'Geelong Cats vs St Kilda', '', 'Geelong Cats', 1, '2023-12-12 11:53:59'),
(168, 'testuser14@afltest.com', 1, 5903, 20, 'Gold Coast Suns vs Adelaide Crows', '', 'Gold Coast Suns', 1, '2023-12-12 11:53:59'),
(169, 'testuser15@afltest.com', 1, 5899, 21, 'Carlton vs Richmond', '', 'Richmond', 0, '2023-12-12 11:53:59'),
(170, 'testuser15@afltest.com', 1, 5900, 21, 'Collingwood vs Sydney Swans', '', 'Sydney Swans', 0, '2023-12-12 11:53:59'),
(171, 'testuser15@afltest.com', 1, 5901, 21, 'Essendon vs Hawthorn', '', 'Hawthorn', 0, '2023-12-12 11:53:59'),
(172, 'testuser15@afltest.com', 1, 5902, 21, 'GWS Giants vs North Melbourne', '', 'North Melbourne', 0, '2023-12-12 11:53:59'),
(173, 'testuser15@afltest.com', 1, 5904, 21, 'Geelong Cats vs St Kilda', '', 'Geelong Cats', 1, '2023-12-12 11:53:59'),
(174, 'testuser15@afltest.com', 1, 5903, 21, 'Gold Coast Suns vs Adelaide Crows', '', 'Gold Coast Suns', 1, '2023-12-12 11:53:59'),
(175, 'testuser16@afltest.com', 1, 5899, 22, 'Carlton vs Richmond', '', 'Richmond', 0, '2023-12-12 11:53:59'),
(176, 'testuser16@afltest.com', 1, 5900, 22, 'Collingwood vs Sydney Swans', '', 'Sydney Swans', 0, '2023-12-12 11:53:59'),
(177, 'testuser16@afltest.com', 1, 5901, 22, 'Essendon vs Hawthorn', '', 'Hawthorn', 0, '2023-12-12 11:54:00'),
(178, 'testuser16@afltest.com', 1, 5902, 22, 'GWS Giants vs North Melbourne', '', 'North Melbourne', 0, '2023-12-12 11:54:00'),
(179, 'testuser16@afltest.com', 1, 5904, 22, 'Geelong Cats vs St Kilda', '', 'Geelong Cats', 1, '2023-12-12 11:54:00'),
(180, 'testuser16@afltest.com', 1, 5903, 22, 'Gold Coast Suns vs Adelaide Crows', '', 'Gold Coast Suns', 1, '2023-12-12 11:54:00'),
(181, 'tiffaman@gmail.com', 1, 5899, 23, 'Carlton vs Richmond', '', 'Richmond', 0, '2023-12-12 11:54:00'),
(182, 'tiffaman@gmail.com', 1, 5900, 23, 'Collingwood vs Sydney Swans', '', 'Sydney Swans', 0, '2023-12-12 11:54:00'),
(183, 'tiffaman@gmail.com', 1, 5901, 23, 'Essendon vs Hawthorn', '', 'Hawthorn', 0, '2023-12-12 11:54:00'),
(184, 'tiffaman@gmail.com', 1, 5902, 23, 'GWS Giants vs North Melbourne', '', 'North Melbourne', 0, '2023-12-12 11:54:00'),
(185, 'tiffaman@gmail.com', 1, 5904, 23, 'Geelong Cats vs St Kilda', '', 'Geelong Cats', 1, '2023-12-12 11:54:00'),
(186, 'tiffaman@gmail.com', 1, 5903, 23, 'Gold Coast Suns vs Adelaide Crows', '', 'Gold Coast Suns', 1, '2023-12-12 11:54:00'),
(187, 'tiffaman@gmail.com', 1, 5899, 24, 'Carlton vs Richmond', '', 'Richmond', 0, '2023-12-12 11:54:00'),
(188, 'tiffaman@gmail.com', 1, 5900, 24, 'Collingwood vs Sydney Swans', '', 'Sydney Swans', 0, '2023-12-12 11:54:01'),
(189, 'tiffaman@gmail.com', 1, 5901, 24, 'Essendon vs Hawthorn', '', 'Hawthorn', 0, '2023-12-12 11:54:01'),
(190, 'tiffaman@gmail.com', 1, 5902, 24, 'GWS Giants vs North Melbourne', '', 'North Melbourne', 0, '2023-12-12 11:54:01'),
(191, 'tiffaman@gmail.com', 1, 5904, 24, 'Geelong Cats vs St Kilda', '', 'Geelong Cats', 1, '2023-12-12 11:54:01'),
(192, 'tiffaman@gmail.com', 1, 5903, 24, 'Gold Coast Suns vs Adelaide Crows', '', 'Gold Coast Suns', 1, '2023-12-12 11:54:01'),
(193, 'tiffaman@gmail.com', 1, 5899, 25, 'Carlton vs Richmond', '', 'Richmond', 0, '2023-12-12 11:54:01'),
(194, 'tiffaman@gmail.com', 1, 5900, 25, 'Collingwood vs Sydney Swans', '', 'Sydney Swans', 0, '2023-12-12 11:54:01'),
(195, 'tiffaman@gmail.com', 1, 5901, 25, 'Essendon vs Hawthorn', '', 'Hawthorn', 0, '2023-12-12 11:54:01'),
(196, 'tiffaman@gmail.com', 1, 5902, 25, 'GWS Giants vs North Melbourne', '', 'North Melbourne', 0, '2023-12-12 11:54:01'),
(197, 'tiffaman@gmail.com', 1, 5904, 25, 'Geelong Cats vs St Kilda', '', 'Geelong Cats', 1, '2023-12-12 11:54:01'),
(198, 'tiffaman@gmail.com', 1, 5903, 25, 'Gold Coast Suns vs Adelaide Crows', '', 'Gold Coast Suns', 1, '2023-12-12 11:54:01'),
(199, 'testuser20@afltest.com', 1, 5899, 26, 'Carlton vs Richmond', '', 'Richmond', 0, '2023-12-12 11:54:02'),
(200, 'testuser20@afltest.com', 1, 5900, 26, 'Collingwood vs Sydney Swans', '', 'Sydney Swans', 0, '2023-12-12 11:54:02'),
(201, 'testuser20@afltest.com', 1, 5901, 26, 'Essendon vs Hawthorn', '', 'Hawthorn', 0, '2023-12-12 11:54:02'),
(202, 'testuser20@afltest.com', 1, 5902, 26, 'GWS Giants vs North Melbourne', '', 'North Melbourne', 0, '2023-12-12 11:54:02'),
(203, 'aflpools@gmail.com', 1, 5900, 6, 'Collingwood vs Sydney Swans', '', 'Collingwood', 1, '2023-12-12 11:57:11'),
(204, 'aflpools@gmail.com', 1, 5901, 6, 'Essendon vs Hawthorn', '', 'Essendon', 1, '2023-12-12 11:57:11'),
(205, 'aflpools@gmail.com', 1, 5902, 6, 'GWS Giants vs North Melbourne', '', 'GWS Giants', 1, '2023-12-12 11:57:11'),
(206, 'aflpools@gmail.com', 1, 5903, 6, 'Gold Coast Suns vs Adelaide Crows', '', 'Gold Coast Suns', 1, '2023-12-12 11:57:11'),
(207, 'aflpools@gmail.com', 1, 5905, 6, 'Melbourne vs Western Bulldogs', '', 'Melbourne', 1, '2023-12-12 11:57:12'),
(208, 'aflpools@gmail.com', 1, 5906, 6, 'Port Adelaide vs West Coast Eagles', '', 'Port Adelaide', 1, '2023-12-12 11:57:12'),
(209, 'testuser2@afltest.com', 1, 5899, 7, 'Carlton vs Richmond', '', 'Carlton', 1, '2023-12-12 11:57:12'),
(210, 'testuser2@afltest.com', 1, 5900, 7, 'Collingwood vs Sydney Swans', '', 'Sydney Swans', 0, '2023-12-12 11:57:12'),
(211, 'testuser2@afltest.com', 1, 5901, 7, 'Essendon vs Hawthorn', '', 'Hawthorn', 0, '2023-12-12 11:57:12'),
(212, 'testuser2@afltest.com', 1, 5902, 7, 'GWS Giants vs North Melbourne', '', 'North Melbourne', 0, '2023-12-12 11:57:12'),
(213, 'testuser2@afltest.com', 1, 5904, 7, 'Geelong Cats vs St Kilda', '', 'Geelong Cats', 1, '2023-12-12 11:57:12'),
(214, 'testuser2@afltest.com', 1, 5903, 7, 'Gold Coast Suns vs Adelaide Crows', '', 'Gold Coast Suns', 1, '2023-12-12 11:57:12'),
(215, 'testuser10@afltest.com', 1, 5899, 16, 'Carlton vs Richmond', '', 'Richmond', 0, '2023-12-12 11:57:12'),
(216, 'testuser10@afltest.com', 1, 5900, 16, 'Collingwood vs Sydney Swans', '', 'Sydney Swans', 0, '2023-12-12 11:57:12'),
(217, 'testuser10@afltest.com', 1, 5901, 16, 'Essendon vs Hawthorn', '', 'Hawthorn', 0, '2023-12-12 11:57:12'),
(218, 'testuser10@afltest.com', 1, 5902, 16, 'GWS Giants vs North Melbourne', '', 'North Melbourne', 0, '2023-12-12 11:57:13'),
(219, 'testuser10@afltest.com', 1, 5904, 16, 'Geelong Cats vs St Kilda', '', 'Geelong Cats', 1, '2023-12-12 11:57:13'),
(220, 'testuser10@afltest.com', 1, 5903, 16, 'Gold Coast Suns vs Adelaide Crows', '', 'Gold Coast Suns', 1, '2023-12-12 11:57:13');

-- --------------------------------------------------------

--
-- Table structure for table `rounds`
--

DROP TABLE IF EXISTS `rounds`;
CREATE TABLE `rounds` (
  `id` int NOT NULL,
  `roundnumber` int NOT NULL,
  `roundname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `closedate` datetime NOT NULL DEFAULT '2024-12-31 12:00:00',
  `no_of_predictions` int NOT NULL DEFAULT '0',
  `prize_pool` float NOT NULL DEFAULT '0',
  `no_of_winners` int NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rounds`
--

INSERT INTO `rounds` (`id`, `roundnumber`, `roundname`, `closedate`, `no_of_predictions`, `prize_pool`, `no_of_winners`, `completed`, `datecreated`) VALUES
(1, 1, 'Round 1', '2023-11-30 12:00:00', 21, 420, 2, 1, '2023-11-28 10:35:43'),
(2, 2, 'Round 2', '2024-12-31 12:00:00', 17, 340, 0, 0, '2023-11-28 10:35:43'),
(3, 3, 'Round 3', '2024-12-31 12:00:00', 1, 20, 0, 0, '2023-11-28 10:35:43'),
(4, 4, 'Round 4', '2024-12-31 12:00:00', 1, 20, 0, 0, '2023-11-28 10:35:43'),
(5, 5, 'Round 5', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(6, 6, 'Round 6', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(7, 7, 'Round 7', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(8, 8, 'Round 8', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(9, 9, 'Round 9', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(10, 10, 'Round 10', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(11, 11, 'Round 11', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(12, 12, 'Round 12', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(13, 13, 'Round 13', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(14, 14, 'Round 14', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(15, 15, 'Round 15', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(16, 16, 'Round 16', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(17, 17, 'Round 17', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(18, 18, 'Round 18', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(19, 19, 'Round 19', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(20, 20, 'Round 20', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(21, 21, 'Round 21', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(22, 22, 'Round 22', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(23, 23, 'Round 23', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43'),
(24, 24, 'Round 24', '2024-12-31 12:00:00', 0, 0, 0, 0, '2023-11-28 10:35:43');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
  `id` int NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
CREATE TABLE `transactions` (
  `id` int NOT NULL,
  `item_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_price` float(10,2) DEFAULT NULL,
  `item_price_currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payer_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payer_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payer_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payer_country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `merchant_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `merchant_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `paid_amount` float(10,2) NOT NULL,
  `paid_amount_currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `payment_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_status` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `item_number`, `item_name`, `item_price`, `item_price_currency`, `payer_id`, `payer_name`, `payer_email`, `payer_country`, `merchant_id`, `merchant_email`, `order_id`, `transaction_id`, `paid_amount`, `paid_amount_currency`, `payment_source`, `payment_status`, `created`, `modified`) VALUES
(1, 'BET20', 'Pool ticket', 0.00, 'AUD', '2Q7UJUP9C93MN', 'chris vs', 'john.horton86@gmail.com', 'AU', 'N8LQYXWSLFUVY', 'john.horton86-facilitator@gmail.com', '1FE82537D55977259', '32U15850TN3205538', 200.00, 'AUD', 'paypal', 'PENDING', '2023-11-15 14:25:00', '2023-11-15 16:27:30'),
(2, 'BET20', 'Pool ticket', 0.00, 'AUD', 'M339TR7MFUTKU', 'prep ician', 'prepitician@gmail.com', 'AU', 'N8LQYXWSLFUVY', 'john.horton86-facilitator@gmail.com', '8PU21850A4264571F', '42G73688T1691022N', 200.00, 'AUD', 'paypal', 'PENDING', '2023-11-15 14:38:22', '2023-11-15 16:40:34');

-- --------------------------------------------------------

--
-- Stand-in structure for view `trans_history`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `trans_history`;
CREATE TABLE `trans_history` (
`amount` decimal(16,0)
,`Date` datetime
,`email` varchar(128)
,`transtype` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phoneno` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pswd` varbinary(128) NOT NULL,
  `datecreated` date DEFAULT NULL,
  `dateupdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phoneno`, `pswd`, `datecreated`, `dateupdated`) VALUES
(15, NULL, 'john.horton86@gmail.com', NULL, 0x6365363961613963366633326562656564366639383036316363623864303562, '2023-11-17', '2023-11-26 10:16:32'),
(16, NULL, 'tiffaman@gmail.com', NULL, 0x3732363763343565333336623233666263653631323237303362363737333036, '2023-11-17', '2023-11-17 08:43:23'),
(22, NULL, 'testuser0@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(23, NULL, 'testuser1@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(24, NULL, 'testuser2@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(25, NULL, 'testuser3@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(26, NULL, 'testuser4@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(27, NULL, 'testuser5@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(28, NULL, 'testuser6@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(29, NULL, 'testuser7@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(30, NULL, 'testuser8@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(31, NULL, 'testuser9@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(32, NULL, 'testuser10@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(33, NULL, 'testuser11@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(34, NULL, 'testuser12@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(35, NULL, 'testuser13@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(36, NULL, 'testuser14@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(37, NULL, 'testuser15@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(38, NULL, 'testuser16@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(39, NULL, 'testuser17@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(40, NULL, 'testuser18@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(41, NULL, 'testuser19@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(42, NULL, 'testuser20@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(43, NULL, 'testuser21@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(44, NULL, 'testuser22@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(45, NULL, 'testuser23@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(46, NULL, 'testuser24@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(47, NULL, 'testuser25@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(48, NULL, 'testuser26@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(49, NULL, 'testuser27@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(50, NULL, 'testuser28@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(51, NULL, 'testuser29@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(52, NULL, 'testuser30@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(53, NULL, 'testuser31@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(54, NULL, 'testuser32@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(55, NULL, 'testuser33@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(56, NULL, 'testuser34@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(57, NULL, 'testuser35@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(58, NULL, 'testuser36@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(59, NULL, 'testuser37@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(60, NULL, 'testuser38@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(61, NULL, 'testuser39@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(62, NULL, 'testuser40@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(63, NULL, 'testuser41@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(64, NULL, 'testuser42@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(65, NULL, 'testuser43@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(66, NULL, 'testuser44@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(67, NULL, 'testuser45@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(68, NULL, 'testuser46@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(69, NULL, 'testuser47@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(70, NULL, 'testuser48@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(71, NULL, 'testuser49@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(72, NULL, 'testuser50@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(73, NULL, 'testuser51@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(74, NULL, 'testuser52@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(75, NULL, 'testuser53@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(76, NULL, 'testuser54@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(77, NULL, 'testuser55@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(78, NULL, 'testuser56@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(79, NULL, 'testuser57@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(80, NULL, 'testuser58@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(81, NULL, 'testuser59@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(82, NULL, 'testuser60@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(83, NULL, 'testuser61@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(84, NULL, 'testuser62@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(85, NULL, 'testuser63@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(86, NULL, 'testuser64@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(87, NULL, 'testuser65@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(88, NULL, 'testuser66@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(89, NULL, 'testuser67@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(90, NULL, 'testuser68@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(91, NULL, 'testuser69@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(92, NULL, 'testuser70@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(93, NULL, 'testuser71@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(94, NULL, 'testuser72@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(95, NULL, 'testuser73@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(96, NULL, 'testuser74@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(97, NULL, 'testuser75@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(98, NULL, 'testuser76@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(99, NULL, 'testuser77@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(100, NULL, 'testuser78@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(101, NULL, 'testuser79@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(102, NULL, 'testuser80@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(103, NULL, 'testuser81@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(104, NULL, 'testuser82@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(105, NULL, 'testuser83@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(106, NULL, 'testuser84@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(107, NULL, 'testuser85@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(108, NULL, 'testuser86@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(109, NULL, 'testuser87@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(110, NULL, 'testuser88@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(111, NULL, 'testuser89@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(112, NULL, 'testuser90@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(113, NULL, 'testuser91@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(114, NULL, 'testuser92@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(115, NULL, 'testuser93@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(116, NULL, 'testuser94@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(117, NULL, 'testuser95@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(118, NULL, 'testuser96@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(119, NULL, 'testuser97@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(120, NULL, 'testuser98@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(121, NULL, 'testuser99@afltest.com', NULL, 0x6237303638333564653739613262346538303530366635383261663336373661, '2023-11-29', '2023-11-29 14:32:19'),
(124, NULL, 'aflpools@gmail.com', NULL, 0x3732363763343565333336623233666263653631323237303362363737333036, '2023-12-09', '2023-12-09 08:43:30'),
(125, NULL, 'dummy@gmail.com', NULL, 0x3230326362393632616335393037356239363462303731353264323334623730, '2023-12-09', '2023-12-09 10:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `winnings`
--

DROP TABLE IF EXISTS `winnings`;
CREATE TABLE `winnings` (
  `id` int NOT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `roundnumber` int NOT NULL,
  `predictionid` int NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawalrequests`
--

DROP TABLE IF EXISTS `withdrawalrequests`;
CREATE TABLE `withdrawalrequests` (
  `id` int NOT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `withdrawalrequests`
--

INSERT INTO `withdrawalrequests` (`id`, `email`, `amount`, `datecreated`) VALUES
(1, 'john.horton86@gmail.com', '100', '2023-11-26 19:36:43'),
(2, 'john.horton86@gmail.com', '100', '2023-11-30 12:11:05'),
(3, 'john.horton86@gmail.com', '60', '2023-11-30 12:17:41'),
(4, 'tiffaman@gmail.com', '50', '2023-11-30 16:20:30'),
(5, 'john.horton86@gmail.com', '100', '2023-12-03 08:39:49'),
(6, 'tiffaman@gmail.com', '500', '2023-12-04 13:29:15'),
(7, 'aflpools@gmail.com', '20', '2023-12-09 12:07:21'),
(8, 'testuser4@afltest.com', '20', '2023-12-09 13:14:09'),
(9, 'john.horton86@gmail.com', '220', '2023-12-11 10:39:35'),
(10, 'aflpools@gmail.com', '200', '2023-12-11 11:32:50'),
(11, 'aflpools@gmail.com', '80', '2023-12-11 12:38:45');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawalscompleted`
--

DROP TABLE IF EXISTS `withdrawalscompleted`;
CREATE TABLE `withdrawalscompleted` (
  `id` int NOT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `requestid` int NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `withdrawalscompleted`
--

INSERT INTO `withdrawalscompleted` (`id`, `email`, `requestid`, `amount`, `datecreated`) VALUES
(1, 'john.horton86@gmail.com', 1, '50', '2023-11-26 13:06:23');

-- --------------------------------------------------------

--
-- Structure for view `trans_history`
--
DROP TABLE IF EXISTS `trans_history`;

DROP VIEW IF EXISTS `trans_history`;
select `afl`.`deposits`.`email` AS `email`,'Deposit' AS `transtype`,`afl`.`deposits`.`amount` AS `amount`,`afl`.`deposits`.`datecreated` AS `Date` from `afl`.`deposits` 
union 
select `afl`.`withdrawalrequests`.`email` AS `email`,'Withdrawal Request' AS `transtype`,`afl`.`withdrawalrequests`.`amount` AS `amount`,`afl`.`withdrawalrequests`.`datecreated` AS `Date` from `afl`.`withdrawalrequests` 
union 
select `afl`.`withdrawalscompleted`.`email` AS `email`,'Withdrawal Completed' AS `transtype`,`afl`.`withdrawalscompleted`.`amount` AS `amount`,`afl`.`withdrawalscompleted`.`datecreated` AS `Date` from `afl`.`withdrawalscompleted` 
union 
select `afl`.`predictions`.`email` AS `email`,'Prediction' AS `transtype`,`afl`.`predictions`.`amount` AS `amount`,`afl`.`predictions`.`datecreated` AS `Date` from `afl`.`predictions` 
union 
select `afl`.`winnings`.`email` AS `email`,'Winnings' AS `transtype`,`afl`.`winnings`.`amount` AS `amount`,`afl`.`winnings`.`datecreated` AS `Date` from `afl`.`winnings`

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EMAIL` (`email`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD UNIQUE KEY `GAMESPRIMARY` (`id`);

--
-- Indexes for table `predictions`
--
ALTER TABLE `predictions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EMAIL` (`email`);

--
-- Indexes for table `prizepool`
--
ALTER TABLE `prizepool`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rounds`
--
ALTER TABLE `rounds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EMAIL` (`payer_email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `winnings`
--
ALTER TABLE `winnings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PREDICTION` (`predictionid`);

--
-- Indexes for table `withdrawalrequests`
--
ALTER TABLE `withdrawalrequests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EMAIL` (`email`);

--
-- Indexes for table `withdrawalscompleted`
--
ALTER TABLE `withdrawalscompleted`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EMAIL` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `predictions`
--
ALTER TABLE `predictions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `prizepool`
--
ALTER TABLE `prizepool`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `rounds`
--
ALTER TABLE `rounds`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `winnings`
--
ALTER TABLE `winnings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdrawalrequests`
--
ALTER TABLE `withdrawalrequests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `withdrawalscompleted`
--
ALTER TABLE `withdrawalscompleted`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
