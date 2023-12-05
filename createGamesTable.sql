-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 05, 2023 at 11:19 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

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
-- Table structure for table `games`
--
DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `roundid` int(11) NOT NULL,
  `roundnumber` int(11) NOT NULL,
  `roundname` varchar(64) NOT NULL,
  `gameid` int(11) NOT NULL,
  `venue` varchar(64) NOT NULL,
  `location` varchar(64) NOT NULL,
  `state` varchar(64) NOT NULL,
  `timezone` varchar(128) NOT NULL,
  `utcStartTime` varchar(64) NOT NULL,
  `hometeamid` int(11) NOT NULL,
  `hometeamname` varchar(64) NOT NULL,
  `hometeamnickname` varchar(64) NOT NULL,
  `awayteamid` int(11) NOT NULL,
  `awayteamname` varchar(64) NOT NULL,
  `awayteamnickname` varchar(64) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `result` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD UNIQUE KEY `GAMESPRIMARY` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
