-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 23, 2020 at 05:02 PM
-- Server version: 5.7.28-0ubuntu0.19.04.2
-- PHP Version: 7.0.33-11+ubuntu19.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `structure`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `ID` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`ID`, `title`) VALUES
(1, 'get'),
(2, 'give'),
(3, 'take');

-- --------------------------------------------------------

--
-- Table structure for table `offices`
--

CREATE TABLE `offices` (
  `ID` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offices`
--

INSERT INTO `offices` (`ID`, `title`) VALUES
(1, 'Vitebsk'),
(2, 'LA');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `ID` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(48) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`ID`, `title`) VALUES
(1, 'Intern'),
(2, 'Employee'),
(3, 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `role_id` tinyint(3) UNSIGNED NOT NULL,
  `nascent_coins` tinyint(3) UNSIGNED NOT NULL,
  `bonus_coins` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`role_id`, `nascent_coins`, `bonus_coins`) VALUES
(1, 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `ID` int(11) UNSIGNED NOT NULL,
  `user_id` smallint(5) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nascent_coins` tinyint(3) UNSIGNED NOT NULL,
  `bonus_coins` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`ID`, `user_id`, `date`, `nascent_coins`, `bonus_coins`) VALUES
(1, 1, '2020-01-22 11:51:37', 7, 2),
(2, 2, '2020-01-22 11:50:59', 8, 3),
(3, 4, '2020-01-23 13:56:29', 8, 2),
(4, 3, '2020-01-23 13:57:12', 8, 2),
(5, 7, '2020-01-23 13:57:12', 8, 2),
(6, 8, '2020-01-23 13:57:12', 8, 2),
(7, 6, '2020-01-23 13:57:12', 8, 2),
(8, 9, '2020-01-23 13:57:12', 8, 2),
(9, 5, '2020-01-23 13:57:12', 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `ID` int(11) UNSIGNED NOT NULL,
  `donor_user_id` smallint(5) UNSIGNED NOT NULL,
  `recipient_user_id` smallint(5) UNSIGNED NOT NULL,
  `action_id` tinyint(3) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `coins` tinyint(3) UNSIGNED NOT NULL,
  `comment` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`ID`, `donor_user_id`, `recipient_user_id`, `action_id`, `date`, `coins`, `comment`) VALUES
(2, 2, 1, 1, '2020-01-23 06:10:42', 1, 'good boy'),
(3, 1, 2, 2, '2020-01-23 09:36:53', 1, 'gg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `office_id` tinyint(3) UNSIGNED NOT NULL,
  `role_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `name`, `office_id`, `role_id`) VALUES
(1, 'Valeriy', 1, 1),
(2, 'Denis', 2, 3),
(3, 'Jack', 1, 1),
(4, 'Kim', 1, 1),
(5, 'Nastya', 1, 1),
(6, 'Olga', 1, 1),
(7, 'Victor', 1, 1),
(8, 'Jerry', 2, 1),
(9, 'Tom', 2, 1),
(10, 'Stas', 1, 1),
(11, 'Alexandr', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `id_user` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `action` (`action_id`),
  ADD UNIQUE KEY `user_id` (`donor_user_id`),
  ADD UNIQUE KEY `second_user_id` (`recipient_user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `office_id` (`office_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
  MODIFY `ID` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `role_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `statistics`
--
ALTER TABLE `statistics`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
