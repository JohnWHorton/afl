-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 26, 2023 at 11:56 AM
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
-- Stand-in structure for view `balance`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `balance`;
CREATE TABLE IF NOT EXISTS `balance` (
`dep` decimal(10,0)
,`email` varchar(128)
,`withd` decimal(10,0)
);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bets`
--

INSERT INTO `bets` (`id`, `email`, `betthisjson`, `amount`, `datecreated`) VALUES
(1, 'john.horton86@gmail.com', '[{\"gameid\":\"4787\",\"homename\":\"Richmond\",\"homeimg\":\"Richmond.svg\",\"awayname\":\"Carlton\",\"awayimg\":\"Carlton.svg\",\"checked\":true,\"winname\":\"Richmond\"},{\"gameid\":\"4786\",\"homename\":\"Geelong Cats\",\"homeimg\":\"GeelongCats.svg\",\"awayname\":\"Collingwood\",\"awayimg\":\"Collingwood.svg\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"gameid\":\"4785\",\"homename\":\"North Melbourne\",\"homeimg\":\"NorthMelbourne.svg\",\"awayname\":\"West Coast Eagles\",\"awayimg\":\"WestCoastEagles.svg\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"gameid\":\"4789\",\"homename\":\"Gold Coast Suns\",\"homeimg\":\"GoldCoastSuns.svg\",\"awayname\":\"Sydney Swans\",\"awayimg\":\"SydneySwans.svg\",\"checked\":true,\"winname\":\"Gold Coast Suns\"},{\"gameid\":\"4790\",\"homename\":\"GWS Giants\",\"homeimg\":\"GWSGiants.svg\",\"awayname\":\"Adelaide Crows\",\"awayimg\":\"AdelaideCrows.svg\",\"checked\":true,\"winname\":\"GWS Giants\"},{\"gameid\":\"4792\",\"homename\":\"Hawthorn\",\"homeimg\":\"Hawthorn.svg\",\"awayname\":\"Essendon\",\"awayimg\":\"Essendon.svg\",\"checked\":true,\"winname\":\"Essendon\"}]', '0', '2023-11-21 16:52:21'),
(2, 'john.horton86@gmail.com', '[{\"gameid\":\"4787\",\"homename\":\"Richmond\",\"homeimg\":\"Richmond.svg\",\"awayname\":\"Carlton\",\"awayimg\":\"Carlton.svg\",\"checked\":true,\"winname\":\"Richmond\"},{\"gameid\":\"4786\",\"homename\":\"Geelong Cats\",\"homeimg\":\"GeelongCats.svg\",\"awayname\":\"Collingwood\",\"awayimg\":\"Collingwood.svg\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"gameid\":\"4785\",\"homename\":\"North Melbourne\",\"homeimg\":\"NorthMelbourne.svg\",\"awayname\":\"West Coast Eagles\",\"awayimg\":\"WestCoastEagles.svg\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"gameid\":\"4788\",\"homename\":\"Port Adelaide\",\"homeimg\":\"PortAdelaide.svg\",\"awayname\":\"Brisbane Lions\",\"awayimg\":\"BrisbaneLions.svg\",\"checked\":true,\"winname\":\"Port Adelaide\"},{\"gameid\":\"4791\",\"homename\":\"Melbourne\",\"homeimg\":\"Melbourne.svg\",\"awayname\":\"Western Bulldogs\",\"awayimg\":\"WesternBulldogs.svg\",\"checked\":true,\"winname\":\"Melbourne\"},{\"gameid\":\"4789\",\"homename\":\"Gold Coast Suns\",\"homeimg\":\"GoldCoastSuns.svg\",\"awayname\":\"Sydney Swans\",\"awayimg\":\"SydneySwans.svg\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '0', '2023-11-21 23:01:22'),
(3, 'john.horton86@gmail.com', '[{\"gameid\":\"4787\",\"homename\":\"Richmond\",\"homeimg\":\"Richmond.svg\",\"awayname\":\"Carlton\",\"awayimg\":\"Carlton.svg\",\"checked\":true,\"winname\":\"Richmond\"},{\"gameid\":\"4786\",\"homename\":\"Geelong Cats\",\"homeimg\":\"GeelongCats.svg\",\"awayname\":\"Collingwood\",\"awayimg\":\"Collingwood.svg\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"gameid\":\"4785\",\"homename\":\"North Melbourne\",\"homeimg\":\"NorthMelbourne.svg\",\"awayname\":\"West Coast Eagles\",\"awayimg\":\"WestCoastEagles.svg\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"gameid\":\"4788\",\"homename\":\"Port Adelaide\",\"homeimg\":\"PortAdelaide.svg\",\"awayname\":\"Brisbane Lions\",\"awayimg\":\"BrisbaneLions.svg\",\"checked\":true,\"winname\":\"Port Adelaide\"},{\"gameid\":\"4791\",\"homename\":\"Melbourne\",\"homeimg\":\"Melbourne.svg\",\"awayname\":\"Western Bulldogs\",\"awayimg\":\"WesternBulldogs.svg\",\"checked\":true,\"winname\":\"Melbourne\"},{\"gameid\":\"4789\",\"homename\":\"Gold Coast Suns\",\"homeimg\":\"GoldCoastSuns.svg\",\"awayname\":\"Sydney Swans\",\"awayimg\":\"SydneySwans.svg\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '0', '2023-11-21 23:02:50'),
(4, 'john.horton86@gmail.com', '[{\"id\":\"2\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5899\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"5\",\"hometeamname\":\"Carlton\",\"hometeamnickname\":\"Blues\",\"awayteamid\":\"16\",\"awayteamname\":\"Richmond\",\"awayteamnickname\":\"Tigers\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Carlton\"},{\"id\":\"3\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5900\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"3\",\"hometeamname\":\"Collingwood\",\"hometeamnickname\":\"Magpies\",\"awayteamid\":\"13\",\"awayteamname\":\"Sydney Swans\",\"awayteamnickname\":\"Swans\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Sydney Swans\"},{\"id\":\"4\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5901\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"12\",\"hometeamname\":\"Essendon\",\"hometeamnickname\":\"Bombers\",\"awayteamid\":\"9\",\"awayteamname\":\"Hawthorn\",\"awayteamnickname\":\"Hawks\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Hawthorn\"},{\"id\":\"5\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5902\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"15\",\"hometeamname\":\"GWS Giants\",\"hometeamnickname\":\"Giants\",\"awayteamid\":\"6\",\"awayteamname\":\"North Melbourne\",\"awayteamnickname\":\"Kangaroos\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"North Melbourne\"},{\"id\":\"6\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5904\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"10\",\"hometeamname\":\"Geelong Cats\",\"hometeamnickname\":\"Cats\",\"awayteamid\":\"11\",\"awayteamname\":\"St Kilda\",\"awayteamnickname\":\"Saints\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Geelong Cats\"},{\"id\":\"7\",\"roundid\":\"955\",\"roundnumber\":\"1\",\"roundname\":\"Round 1\",\"gameid\":\"5903\",\"utcStartTime\":\"2024-03-14T08:30:00.000+0000\",\"hometeamid\":\"4\",\"hometeamname\":\"Gold Coast Suns\",\"hometeamnickname\":\"Suns\",\"awayteamid\":\"1\",\"awayteamname\":\"Adelaide Crows\",\"awayteamnickname\":\"Crows\",\"completed\":\"0\",\"result\":\"\",\"checked\":true,\"winname\":\"Gold Coast Suns\"}]', '0', '2023-11-25 22:58:37');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
CREATE TABLE IF NOT EXISTS `deposits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `email`, `amount`, `datecreated`) VALUES
(3, 'john.horton86@gmail.com', '150', '2023-11-26 12:52:00'),
(4, 'john.horton86@gmail.com', '201', '2023-11-26 12:55:24');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
CREATE TABLE IF NOT EXISTS `games` (
  `id` int NOT NULL,
  `roundid` int NOT NULL,
  `roundnumber` int NOT NULL,
  `roundname` varchar(64) NOT NULL,
  `gameid` int NOT NULL,
  `utcStartTime` varchar(64) NOT NULL,
  `hometeamid` int NOT NULL,
  `hometeamname` varchar(64) NOT NULL,
  `hometeamnickname` varchar(64) NOT NULL,
  `awayteamid` int NOT NULL,
  `awayteamname` varchar(64) NOT NULL,
  `awayteamnickname` varchar(64) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `result` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `roundid`, `roundnumber`, `roundname`, `gameid`, `utcStartTime`, `hometeamid`, `hometeamname`, `hometeamnickname`, `awayteamid`, `awayteamname`, `awayteamnickname`, `completed`, `result`) VALUES
(2, 955, 1, 'Round 1', 5899, '2024-03-14T08:30:00.000+0000', 5, 'Carlton', 'Blues', 16, 'Richmond', 'Tigers', 0, ''),
(3, 955, 1, 'Round 1', 5900, '2024-03-14T08:30:00.000+0000', 3, 'Collingwood', 'Magpies', 13, 'Sydney Swans', 'Swans', 0, ''),
(4, 955, 1, 'Round 1', 5901, '2024-03-14T08:30:00.000+0000', 12, 'Essendon', 'Bombers', 9, 'Hawthorn', 'Hawks', 0, ''),
(5, 955, 1, 'Round 1', 5902, '2024-03-14T08:30:00.000+0000', 15, 'GWS Giants', 'Giants', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(6, 955, 1, 'Round 1', 5904, '2024-03-14T08:30:00.000+0000', 10, 'Geelong Cats', 'Cats', 11, 'St Kilda', 'Saints', 0, ''),
(7, 955, 1, 'Round 1', 5903, '2024-03-14T08:30:00.000+0000', 4, 'Gold Coast Suns', 'Suns', 1, 'Adelaide Crows', 'Crows', 0, ''),
(8, 955, 1, 'Round 1', 5905, '2024-03-14T08:30:00.000+0000', 17, 'Melbourne', 'Demons', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(9, 955, 1, 'Round 1', 5906, '2024-03-14T08:30:00.000+0000', 7, 'Port Adelaide', 'Power', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(10, 955, 1, 'Round 1', 5907, '2024-03-14T08:30:00.000+0000', 14, 'Fremantle', 'Dockers', 2, 'Brisbane Lions', 'Lions', 0, ''),
(89, 956, 2, 'Round 2', 5908, '0', 11, 'St Kilda', 'Saints', 3, 'Collingwood', 'Magpies', 0, ''),
(90, 956, 2, 'Round 2', 5909, '1', 1, 'Adelaide Crows', 'Crows', 10, 'Geelong Cats', 'Cats', 0, ''),
(91, 956, 2, 'Round 2', 5910, '2', 6, 'North Melbourne', 'Kangaroos', 14, 'Fremantle', 'Dockers', 0, ''),
(92, 956, 2, 'Round 2', 5911, '3', 9, 'Hawthorn', 'Hawks', 17, 'Melbourne', 'Demons', 0, ''),
(93, 956, 2, 'Round 2', 5912, '4', 13, 'Sydney Swans', 'Swans', 12, 'Essendon', 'Bombers', 0, ''),
(94, 956, 2, 'Round 2', 5913, '5', 8, 'Western Bulldogs', 'Bulldogs', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(95, 956, 2, 'Round 2', 5915, '6', 16, 'Richmond', 'Tigers', 7, 'Port Adelaide', 'Power', 0, ''),
(96, 956, 2, 'Round 2', 5914, '7', 18, 'West Coast Eagles', 'Eagles', 15, 'GWS Giants', 'Giants', 0, ''),
(97, 957, 3, 'Round 3', 5916, '0', 2, 'Brisbane Lions', 'Lions', 3, 'Collingwood', 'Magpies', 0, ''),
(98, 957, 3, 'Round 3', 5917, '1', 6, 'North Melbourne', 'Kangaroos', 5, 'Carlton', 'Blues', 0, ''),
(99, 957, 3, 'Round 3', 5918, '2', 14, 'Fremantle', 'Dockers', 1, 'Adelaide Crows', 'Crows', 0, ''),
(100, 957, 3, 'Round 3', 5919, '3', 12, 'Essendon', 'Bombers', 11, 'St Kilda', 'Saints', 0, ''),
(101, 957, 3, 'Round 3', 5920, '4', 7, 'Port Adelaide', 'Power', 17, 'Melbourne', 'Demons', 0, ''),
(102, 957, 3, 'Round 3', 5921, '5', 8, 'Western Bulldogs', 'Bulldogs', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(103, 957, 3, 'Round 3', 5922, '6', 16, 'Richmond', 'Tigers', 13, 'Sydney Swans', 'Swans', 0, ''),
(104, 957, 3, 'Round 3', 5923, '7', 9, 'Hawthorn', 'Hawks', 10, 'Geelong Cats', 'Cats', 0, ''),
(105, 958, 4, 'Round 4', 5924, '0', 1, 'Adelaide Crows', 'Crows', 17, 'Melbourne', 'Demons', 0, ''),
(106, 958, 4, 'Round 4', 5925, '1', 2, 'Brisbane Lions', 'Lions', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(107, 958, 4, 'Round 4', 5926, '2', 7, 'Port Adelaide', 'Power', 12, 'Essendon', 'Bombers', 0, ''),
(108, 958, 4, 'Round 4', 5927, '3', 18, 'West Coast Eagles', 'Eagles', 13, 'Sydney Swans', 'Swans', 0, ''),
(109, 958, 4, 'Round 4', 5928, '4', 14, 'Fremantle', 'Dockers', 5, 'Carlton', 'Blues', 0, ''),
(110, 958, 4, 'Round 4', 5929, '5', 8, 'Western Bulldogs', 'Bulldogs', 10, 'Geelong Cats', 'Cats', 0, ''),
(111, 958, 4, 'Round 4', 5930, '6', 4, 'Gold Coast Suns', 'Suns', 15, 'GWS Giants', 'Giants', 0, ''),
(112, 958, 4, 'Round 4', 5931, '7', 16, 'Richmond', 'Tigers', 11, 'St Kilda', 'Saints', 0, ''),
(113, 958, 4, 'Round 4', 5932, '8', 3, 'Collingwood', 'Magpies', 9, 'Hawthorn', 'Hawks', 0, ''),
(114, 959, 5, 'Round 5', 5933, '0', 17, 'Melbourne', 'Demons', 2, 'Brisbane Lions', 'Lions', 0, ''),
(115, 959, 5, 'Round 5', 5934, '1', 8, 'Western Bulldogs', 'Bulldogs', 12, 'Essendon', 'Bombers', 0, ''),
(116, 959, 5, 'Round 5', 5935, '2', 15, 'GWS Giants', 'Giants', 11, 'St Kilda', 'Saints', 0, ''),
(117, 959, 5, 'Round 5', 5936, '3', 5, 'Carlton', 'Blues', 1, 'Adelaide Crows', 'Crows', 0, ''),
(118, 959, 5, 'Round 5', 5938, '4', 4, 'Gold Coast Suns', 'Suns', 9, 'Hawthorn', 'Hawks', 0, ''),
(119, 959, 5, 'Round 5', 5937, '5', 7, 'Port Adelaide', 'Power', 14, 'Fremantle', 'Dockers', 0, ''),
(120, 959, 5, 'Round 5', 5939, '6', 10, 'Geelong Cats', 'Cats', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(121, 959, 5, 'Round 5', 5940, '7', 18, 'West Coast Eagles', 'Eagles', 16, 'Richmond', 'Tigers', 0, ''),
(122, 960, 6, 'Round 6', 5941, '0', 11, 'St Kilda', 'Saints', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(123, 960, 6, 'Round 6', 5942, '1', 1, 'Adelaide Crows', 'Crows', 12, 'Essendon', 'Bombers', 0, ''),
(124, 960, 6, 'Round 6', 5943, '2', 3, 'Collingwood', 'Magpies', 7, 'Port Adelaide', 'Power', 0, ''),
(125, 960, 6, 'Round 6', 5944, '3', 5, 'Carlton', 'Blues', 15, 'GWS Giants', 'Giants', 0, ''),
(126, 960, 6, 'Round 6', 5946, '4', 2, 'Brisbane Lions', 'Lions', 10, 'Geelong Cats', 'Cats', 0, ''),
(127, 960, 6, 'Round 6', 5945, '5', 18, 'West Coast Eagles', 'Eagles', 14, 'Fremantle', 'Dockers', 0, ''),
(128, 960, 6, 'Round 6', 5947, '6', 13, 'Sydney Swans', 'Swans', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(129, 960, 6, 'Round 6', 5948, '7', 6, 'North Melbourne', 'Kangaroos', 9, 'Hawthorn', 'Hawks', 0, ''),
(130, 961, 7, 'Round 7', 5949, '0', 16, 'Richmond', 'Tigers', 17, 'Melbourne', 'Demons', 0, ''),
(131, 961, 7, 'Round 7', 5950, '1', 12, 'Essendon', 'Bombers', 3, 'Collingwood', 'Magpies', 0, ''),
(132, 961, 7, 'Round 7', 5951, '2', 15, 'GWS Giants', 'Giants', 2, 'Brisbane Lions', 'Lions', 0, ''),
(133, 961, 7, 'Round 7', 5952, '3', 7, 'Port Adelaide', 'Power', 11, 'St Kilda', 'Saints', 0, ''),
(134, 961, 7, 'Round 7', 5953, '4', 6, 'North Melbourne', 'Kangaroos', 1, 'Adelaide Crows', 'Crows', 0, ''),
(135, 961, 7, 'Round 7', 5954, '5', 10, 'Geelong Cats', 'Cats', 5, 'Carlton', 'Blues', 0, ''),
(136, 961, 7, 'Round 7', 5955, '6', 14, 'Fremantle', 'Dockers', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(137, 961, 7, 'Round 7', 5956, '7', 4, 'Gold Coast Suns', 'Suns', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(138, 961, 7, 'Round 7', 5957, '8', 9, 'Hawthorn', 'Hawks', 13, 'Sydney Swans', 'Swans', 0, ''),
(139, 962, 8, 'Round 8', 5958, '0', 1, 'Adelaide Crows', 'Crows', 7, 'Port Adelaide', 'Power', 0, ''),
(140, 962, 8, 'Round 8', 5959, '1', 5, 'Carlton', 'Blues', 3, 'Collingwood', 'Magpies', 0, ''),
(141, 962, 8, 'Round 8', 5960, '2', 13, 'Sydney Swans', 'Swans', 15, 'GWS Giants', 'Giants', 0, ''),
(142, 962, 8, 'Round 8', 5961, '3', 11, 'St Kilda', 'Saints', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(143, 962, 8, 'Round 8', 5963, '4', 17, 'Melbourne', 'Demons', 10, 'Geelong Cats', 'Cats', 0, ''),
(144, 962, 8, 'Round 8', 5962, '5', 18, 'West Coast Eagles', 'Eagles', 12, 'Essendon', 'Bombers', 0, ''),
(145, 962, 8, 'Round 8', 5964, '6', 16, 'Richmond', 'Tigers', 14, 'Fremantle', 'Dockers', 0, ''),
(146, 962, 8, 'Round 8', 5965, '7', 8, 'Western Bulldogs', 'Bulldogs', 9, 'Hawthorn', 'Hawks', 0, ''),
(147, 962, 8, 'Round 8', 5966, '8', 2, 'Brisbane Lions', 'Lions', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(148, 963, 9, 'Round 9', 5967, '0', 5, 'Carlton', 'Blues', 17, 'Melbourne', 'Demons', 0, ''),
(149, 963, 9, 'Round 9', 5969, '1', 10, 'Geelong Cats', 'Cats', 7, 'Port Adelaide', 'Power', 0, ''),
(150, 963, 9, 'Round 9', 5968, '2', 14, 'Fremantle', 'Dockers', 13, 'Sydney Swans', 'Swans', 0, ''),
(151, 963, 9, 'Round 9', 5970, '3', 9, 'Hawthorn', 'Hawks', 11, 'St Kilda', 'Saints', 0, ''),
(152, 963, 9, 'Round 9', 5971, '4', 12, 'Essendon', 'Bombers', 15, 'GWS Giants', 'Giants', 0, ''),
(153, 963, 9, 'Round 9', 5973, '5', 16, 'Richmond', 'Tigers', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(154, 963, 9, 'Round 9', 5972, '6', 4, 'Gold Coast Suns', 'Suns', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(155, 963, 9, 'Round 9', 5974, '7', 3, 'Collingwood', 'Magpies', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(156, 963, 9, 'Round 9', 5975, '8', 1, 'Adelaide Crows', 'Crows', 2, 'Brisbane Lions', 'Lions', 0, ''),
(157, 964, 10, 'Round 10', 5976, '0', 4, 'Gold Coast Suns', 'Suns', 10, 'Geelong Cats', 'Cats', 0, ''),
(158, 964, 10, 'Round 10', 5977, '1', 13, 'Sydney Swans', 'Swans', 5, 'Carlton', 'Blues', 0, ''),
(159, 964, 10, 'Round 10', 5978, '2', 3, 'Collingwood', 'Magpies', 1, 'Adelaide Crows', 'Crows', 0, ''),
(160, 964, 10, 'Round 10', 5979, '3', 15, 'GWS Giants', 'Giants', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(161, 964, 10, 'Round 10', 5980, '4', 11, 'St Kilda', 'Saints', 14, 'Fremantle', 'Dockers', 0, ''),
(162, 964, 10, 'Round 10', 5981, '5', 2, 'Brisbane Lions', 'Lions', 16, 'Richmond', 'Tigers', 0, ''),
(163, 964, 10, 'Round 10', 5982, '6', 12, 'Essendon', 'Bombers', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(164, 964, 10, 'Round 10', 5983, '7', 7, 'Port Adelaide', 'Power', 9, 'Hawthorn', 'Hawks', 0, ''),
(165, 964, 10, 'Round 10', 5984, '8', 18, 'West Coast Eagles', 'Eagles', 17, 'Melbourne', 'Demons', 0, ''),
(166, 965, 11, 'Round 11', 5985, '0', 8, 'Western Bulldogs', 'Bulldogs', 13, 'Sydney Swans', 'Swans', 0, ''),
(167, 965, 11, 'Round 11', 5986, '1', 14, 'Fremantle', 'Dockers', 3, 'Collingwood', 'Magpies', 0, ''),
(168, 965, 11, 'Round 11', 5987, '2', 6, 'North Melbourne', 'Kangaroos', 7, 'Port Adelaide', 'Power', 0, ''),
(169, 965, 11, 'Round 11', 5988, '3', 5, 'Carlton', 'Blues', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(170, 965, 11, 'Round 11', 5989, '4', 10, 'Geelong Cats', 'Cats', 15, 'GWS Giants', 'Giants', 0, ''),
(171, 965, 11, 'Round 11', 5990, '5', 16, 'Richmond', 'Tigers', 12, 'Essendon', 'Bombers', 0, ''),
(172, 965, 11, 'Round 11', 5991, '6', 9, 'Hawthorn', 'Hawks', 2, 'Brisbane Lions', 'Lions', 0, ''),
(173, 965, 11, 'Round 11', 5992, '7', 17, 'Melbourne', 'Demons', 11, 'St Kilda', 'Saints', 0, ''),
(174, 965, 11, 'Round 11', 5993, '8', 1, 'Adelaide Crows', 'Crows', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(175, 966, 12, 'Round 12', 5994, '0', 7, 'Port Adelaide', 'Power', 5, 'Carlton', 'Blues', 0, ''),
(176, 966, 12, 'Round 12', 5995, '1', 3, 'Collingwood', 'Magpies', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(177, 966, 12, 'Round 12', 5996, '2', 9, 'Hawthorn', 'Hawks', 1, 'Adelaide Crows', 'Crows', 0, ''),
(178, 966, 12, 'Round 12', 5997, '3', 18, 'West Coast Eagles', 'Eagles', 11, 'St Kilda', 'Saints', 0, ''),
(179, 966, 12, 'Round 12', 5998, '4', 10, 'Geelong Cats', 'Cats', 16, 'Richmond', 'Tigers', 0, ''),
(180, 966, 12, 'Round 12', 5999, '5', 17, 'Melbourne', 'Demons', 14, 'Fremantle', 'Dockers', 0, ''),
(181, 966, 12, 'Round 12', 6000, '6', 4, 'Gold Coast Suns', 'Suns', 12, 'Essendon', 'Bombers', 0, ''),
(182, 967, 13, 'Round 13', 6001, '0', 1, 'Adelaide Crows', 'Crows', 16, 'Richmond', 'Tigers', 0, ''),
(183, 967, 13, 'Round 13', 6002, '1', 8, 'Western Bulldogs', 'Bulldogs', 2, 'Brisbane Lions', 'Lions', 0, ''),
(184, 967, 13, 'Round 13', 6003, '2', 9, 'Hawthorn', 'Hawks', 15, 'GWS Giants', 'Giants', 0, ''),
(185, 967, 13, 'Round 13', 6004, '3', 18, 'West Coast Eagles', 'Eagles', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(186, 967, 13, 'Round 13', 6005, '4', 11, 'St Kilda', 'Saints', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(187, 967, 13, 'Round 13', 6006, '5', 13, 'Sydney Swans', 'Swans', 10, 'Geelong Cats', 'Cats', 0, ''),
(188, 967, 13, 'Round 13', 6007, '6', 12, 'Essendon', 'Bombers', 5, 'Carlton', 'Blues', 0, ''),
(189, 967, 13, 'Round 13', 6008, '7', 3, 'Collingwood', 'Magpies', 17, 'Melbourne', 'Demons', 0, ''),
(190, 968, 14, 'Round 14', 6009, '0', 2, 'Brisbane Lions', 'Lions', 11, 'St Kilda', 'Saints', 0, ''),
(191, 968, 14, 'Round 14', 6010, '1', 8, 'Western Bulldogs', 'Bulldogs', 14, 'Fremantle', 'Dockers', 0, ''),
(192, 968, 14, 'Round 14', 6011, '2', 16, 'Richmond', 'Tigers', 9, 'Hawthorn', 'Hawks', 0, ''),
(193, 968, 14, 'Round 14', 6012, '3', 1, 'Adelaide Crows', 'Crows', 13, 'Sydney Swans', 'Swans', 0, ''),
(194, 968, 14, 'Round 14', 6013, '4', 6, 'North Melbourne', 'Kangaroos', 3, 'Collingwood', 'Magpies', 0, ''),
(195, 968, 14, 'Round 14', 6014, '5', 15, 'GWS Giants', 'Giants', 7, 'Port Adelaide', 'Power', 0, ''),
(196, 969, 15, 'Round 15', 6015, '0', 5, 'Carlton', 'Blues', 10, 'Geelong Cats', 'Cats', 0, ''),
(197, 969, 15, 'Round 15', 6016, '1', 7, 'Port Adelaide', 'Power', 2, 'Brisbane Lions', 'Lions', 0, ''),
(198, 969, 15, 'Round 15', 6017, '2', 15, 'GWS Giants', 'Giants', 13, 'Sydney Swans', 'Swans', 0, ''),
(199, 969, 15, 'Round 15', 6018, '3', 17, 'Melbourne', 'Demons', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(200, 969, 15, 'Round 15', 6019, '4', 12, 'Essendon', 'Bombers', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(201, 969, 15, 'Round 15', 6020, '5', 14, 'Fremantle', 'Dockers', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(202, 970, 16, 'Round 16', 6022, '0', 2, 'Brisbane Lions', 'Lions', 17, 'Melbourne', 'Demons', 0, ''),
(203, 970, 16, 'Round 16', 6023, '1', 10, 'Geelong Cats', 'Cats', 12, 'Essendon', 'Bombers', 0, ''),
(204, 970, 16, 'Round 16', 6024, '2', 4, 'Gold Coast Suns', 'Suns', 3, 'Collingwood', 'Magpies', 0, ''),
(205, 970, 16, 'Round 16', 6025, '3', 6, 'North Melbourne', 'Kangaroos', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(206, 970, 16, 'Round 16', 6026, '4', 16, 'Richmond', 'Tigers', 5, 'Carlton', 'Blues', 0, ''),
(207, 970, 16, 'Round 16', 6027, '5', 11, 'St Kilda', 'Saints', 7, 'Port Adelaide', 'Power', 0, ''),
(208, 970, 16, 'Round 16', 6028, '6', 13, 'Sydney Swans', 'Swans', 14, 'Fremantle', 'Dockers', 0, ''),
(209, 970, 16, 'Round 16', 6021, '7', 1, 'Adelaide Crows', 'Crows', 15, 'GWS Giants', 'Giants', 0, ''),
(210, 970, 16, 'Round 16', 6029, '8', 18, 'West Coast Eagles', 'Eagles', 9, 'Hawthorn', 'Hawks', 0, ''),
(211, 971, 17, 'Round 17', 6030, '0', 2, 'Brisbane Lions', 'Lions', 1, 'Adelaide Crows', 'Crows', 0, ''),
(212, 971, 17, 'Round 17', 6031, '1', 3, 'Collingwood', 'Magpies', 12, 'Essendon', 'Bombers', 0, ''),
(213, 971, 17, 'Round 17', 6033, '2', 10, 'Geelong Cats', 'Cats', 9, 'Hawthorn', 'Hawks', 0, ''),
(214, 971, 17, 'Round 17', 6034, '3', 15, 'GWS Giants', 'Giants', 5, 'Carlton', 'Blues', 0, ''),
(215, 971, 17, 'Round 17', 6035, '4', 17, 'Melbourne', 'Demons', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(216, 971, 17, 'Round 17', 6036, '5', 6, 'North Melbourne', 'Kangaroos', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(217, 971, 17, 'Round 17', 6037, '6', 11, 'St Kilda', 'Saints', 13, 'Sydney Swans', 'Swans', 0, ''),
(218, 971, 17, 'Round 17', 6038, '7', 7, 'Port Adelaide', 'Power', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(219, 971, 17, 'Round 17', 6032, '8', 14, 'Fremantle', 'Dockers', 16, 'Richmond', 'Tigers', 0, ''),
(220, 972, 18, 'Round 18', 6046, '0', 3, 'Collingwood', 'Magpies', 10, 'Geelong Cats', 'Cats', 0, ''),
(221, 972, 18, 'Round 18', 6047, '1', 4, 'Gold Coast Suns', 'Suns', 7, 'Port Adelaide', 'Power', 0, ''),
(222, 972, 18, 'Round 18', 6040, '2', 9, 'Hawthorn', 'Hawks', 14, 'Fremantle', 'Dockers', 0, ''),
(223, 972, 18, 'Round 18', 6041, '3', 17, 'Melbourne', 'Demons', 12, 'Essendon', 'Bombers', 0, ''),
(224, 972, 18, 'Round 18', 6042, '4', 16, 'Richmond', 'Tigers', 15, 'GWS Giants', 'Giants', 0, ''),
(225, 972, 18, 'Round 18', 6043, '5', 13, 'Sydney Swans', 'Swans', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(226, 972, 18, 'Round 18', 6045, '6', 8, 'Western Bulldogs', 'Bulldogs', 5, 'Carlton', 'Blues', 0, ''),
(227, 972, 18, 'Round 18', 6039, '7', 1, 'Adelaide Crows', 'Crows', 11, 'St Kilda', 'Saints', 0, ''),
(228, 972, 18, 'Round 18', 6044, '8', 18, 'West Coast Eagles', 'Eagles', 2, 'Brisbane Lions', 'Lions', 0, ''),
(229, 973, 19, 'Round 19', 6048, '0', 2, 'Brisbane Lions', 'Lions', 13, 'Sydney Swans', 'Swans', 0, ''),
(230, 973, 19, 'Round 19', 6049, '1', 5, 'Carlton', 'Blues', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(231, 973, 19, 'Round 19', 6050, '2', 12, 'Essendon', 'Bombers', 1, 'Adelaide Crows', 'Crows', 0, ''),
(232, 973, 19, 'Round 19', 6052, '3', 10, 'Geelong Cats', 'Cats', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(233, 973, 19, 'Round 19', 6053, '4', 15, 'GWS Giants', 'Giants', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(234, 973, 19, 'Round 19', 6054, '5', 9, 'Hawthorn', 'Hawks', 3, 'Collingwood', 'Magpies', 0, ''),
(235, 973, 19, 'Round 19', 6056, '6', 11, 'St Kilda', 'Saints', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(236, 973, 19, 'Round 19', 6055, '7', 7, 'Port Adelaide', 'Power', 16, 'Richmond', 'Tigers', 0, ''),
(237, 973, 19, 'Round 19', 6051, '8', 14, 'Fremantle', 'Dockers', 17, 'Melbourne', 'Demons', 0, ''),
(238, 974, 20, 'Round 20', 6058, '0', 5, 'Carlton', 'Blues', 7, 'Port Adelaide', 'Power', 0, ''),
(239, 974, 20, 'Round 20', 6059, '1', 3, 'Collingwood', 'Magpies', 16, 'Richmond', 'Tigers', 0, ''),
(240, 974, 20, 'Round 20', 6061, '2', 4, 'Gold Coast Suns', 'Suns', 2, 'Brisbane Lions', 'Lions', 0, ''),
(241, 974, 20, 'Round 20', 6063, '3', 17, 'Melbourne', 'Demons', 15, 'GWS Giants', 'Giants', 0, ''),
(242, 974, 20, 'Round 20', 6062, '4', 6, 'North Melbourne', 'Kangaroos', 10, 'Geelong Cats', 'Cats', 0, ''),
(243, 974, 20, 'Round 20', 6064, '5', 11, 'St Kilda', 'Saints', 12, 'Essendon', 'Bombers', 0, ''),
(244, 974, 20, 'Round 20', 6065, '6', 13, 'Sydney Swans', 'Swans', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(245, 974, 20, 'Round 20', 6057, '7', 1, 'Adelaide Crows', 'Crows', 9, 'Hawthorn', 'Hawks', 0, ''),
(246, 974, 20, 'Round 20', 6060, '8', 14, 'Fremantle', 'Dockers', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(247, 975, 21, 'Round 21', 6067, '0', 3, 'Collingwood', 'Magpies', 5, 'Carlton', 'Blues', 0, ''),
(248, 975, 21, 'Round 21', 6066, '1', 12, 'Essendon', 'Bombers', 14, 'Fremantle', 'Dockers', 0, ''),
(249, 975, 21, 'Round 21', 6068, '2', 10, 'Geelong Cats', 'Cats', 1, 'Adelaide Crows', 'Crows', 0, ''),
(250, 975, 21, 'Round 21', 6069, '3', 15, 'GWS Giants', 'Giants', 9, 'Hawthorn', 'Hawks', 0, ''),
(251, 975, 21, 'Round 21', 6070, '4', 6, 'North Melbourne', 'Kangaroos', 16, 'Richmond', 'Tigers', 0, ''),
(252, 975, 21, 'Round 21', 6072, '5', 11, 'St Kilda', 'Saints', 2, 'Brisbane Lions', 'Lions', 0, ''),
(253, 975, 21, 'Round 21', 6074, '6', 8, 'Western Bulldogs', 'Bulldogs', 17, 'Melbourne', 'Demons', 0, ''),
(254, 975, 21, 'Round 21', 6071, '7', 7, 'Port Adelaide', 'Power', 13, 'Sydney Swans', 'Swans', 0, ''),
(255, 975, 21, 'Round 21', 6073, '8', 18, 'West Coast Eagles', 'Eagles', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(256, 976, 22, 'Round 22', 6076, '0', 2, 'Brisbane Lions', 'Lions', 15, 'GWS Giants', 'Giants', 0, ''),
(257, 976, 22, 'Round 22', 6077, '1', 5, 'Carlton', 'Blues', 9, 'Hawthorn', 'Hawks', 0, ''),
(258, 976, 22, 'Round 22', 6078, '2', 12, 'Essendon', 'Bombers', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(259, 976, 22, 'Round 22', 6080, '3', 17, 'Melbourne', 'Demons', 7, 'Port Adelaide', 'Power', 0, ''),
(260, 976, 22, 'Round 22', 6081, '4', 6, 'North Melbourne', 'Kangaroos', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(261, 976, 22, 'Round 22', 6082, '5', 16, 'Richmond', 'Tigers', 11, 'St Kilda', 'Saints', 0, ''),
(262, 976, 22, 'Round 22', 6083, '6', 13, 'Sydney Swans', 'Swans', 3, 'Collingwood', 'Magpies', 0, ''),
(263, 976, 22, 'Round 22', 6075, '7', 1, 'Adelaide Crows', 'Crows', 8, 'Western Bulldogs', 'Bulldogs', 0, ''),
(264, 976, 22, 'Round 22', 6079, '8', 14, 'Fremantle', 'Dockers', 10, 'Geelong Cats', 'Cats', 0, ''),
(265, 977, 23, 'Round 23', 6084, '0', 3, 'Collingwood', 'Magpies', 2, 'Brisbane Lions', 'Lions', 0, ''),
(266, 977, 23, 'Round 23', 6085, '1', 12, 'Essendon', 'Bombers', 13, 'Sydney Swans', 'Swans', 0, ''),
(267, 977, 23, 'Round 23', 6086, '2', 4, 'Gold Coast Suns', 'Suns', 17, 'Melbourne', 'Demons', 0, ''),
(268, 977, 23, 'Round 23', 6087, '3', 15, 'GWS Giants', 'Giants', 14, 'Fremantle', 'Dockers', 0, ''),
(269, 977, 23, 'Round 23', 6088, '4', 9, 'Hawthorn', 'Hawks', 16, 'Richmond', 'Tigers', 0, ''),
(270, 977, 23, 'Round 23', 6090, '5', 11, 'St Kilda', 'Saints', 10, 'Geelong Cats', 'Cats', 0, ''),
(271, 977, 23, 'Round 23', 6092, '6', 8, 'Western Bulldogs', 'Bulldogs', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(272, 977, 23, 'Round 23', 6089, '7', 7, 'Port Adelaide', 'Power', 1, 'Adelaide Crows', 'Crows', 0, ''),
(273, 977, 23, 'Round 23', 6091, '8', 18, 'West Coast Eagles', 'Eagles', 5, 'Carlton', 'Blues', 0, ''),
(274, 978, 24, 'Round 24', 6093, '0', 2, 'Brisbane Lions', 'Lions', 12, 'Essendon', 'Bombers', 0, ''),
(275, 978, 24, 'Round 24', 6094, '1', 5, 'Carlton', 'Blues', 11, 'St Kilda', 'Saints', 0, ''),
(276, 978, 24, 'Round 24', 6096, '2', 10, 'Geelong Cats', 'Cats', 18, 'West Coast Eagles', 'Eagles', 0, ''),
(277, 978, 24, 'Round 24', 6097, '3', 9, 'Hawthorn', 'Hawks', 6, 'North Melbourne', 'Kangaroos', 0, ''),
(278, 978, 24, 'Round 24', 6098, '4', 17, 'Melbourne', 'Demons', 3, 'Collingwood', 'Magpies', 0, ''),
(279, 978, 24, 'Round 24', 6099, '5', 16, 'Richmond', 'Tigers', 4, 'Gold Coast Suns', 'Suns', 0, ''),
(280, 978, 24, 'Round 24', 6100, '6', 13, 'Sydney Swans', 'Swans', 1, 'Adelaide Crows', 'Crows', 0, ''),
(281, 978, 24, 'Round 24', 6101, '7', 8, 'Western Bulldogs', 'Bulldogs', 15, 'GWS Giants', 'Giants', 0, ''),
(282, 978, 24, 'Round 24', 6095, '8', 14, 'Fremantle', 'Dockers', 7, 'Port Adelaide', 'Power', 0, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `item_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `item_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `item_price` float(10,2) DEFAULT NULL,
  `item_price_currency` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payer_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payer_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payer_email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payer_country` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `merchant_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `merchant_email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `transaction_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `paid_amount` float(10,2) NOT NULL,
  `paid_amount_currency` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payment_source` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_status` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phoneno`, `pswd`, `datecreated`, `dateupdated`) VALUES
(15, NULL, 'john.horton86@gmail.com', NULL, 0x6365363961613963366633326562656564366639383036316363623864303562, '2023-11-17', '2023-11-26 10:16:32'),
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `withdrawalcompleted`
--

INSERT INTO `withdrawalcompleted` (`id`, `email`, `requestid`, `amount`, `datecreated`) VALUES
(1, 'john.horton86@gmail.com', 1, '50', '2023-11-26 13:06:23');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure for view `balance`
--
DROP TABLE IF EXISTS `balance`;

DROP VIEW IF EXISTS `balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`john`@`%` SQL SECURITY DEFINER VIEW `balance`  AS SELECT `d`.`email` AS `email`, `d`.`amount` AS `dep`, 0 AS `withd` FROM `deposits` AS `d` union select `w`.`email` AS `email`,0 AS `dep`,`w`.`amount` AS `withd` from `withdrawalcompleted` `w`  ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
