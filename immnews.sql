-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2025 at 01:46 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `immnews`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `last updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `content`, `last updated`) VALUES
(1, '            In an ever-changing, tech-driven world, IMM News Network explains, demystifies and guides everyone\r\n        to improve their lives. IMM News is a trusted digital media publication that provides expert\r\n        information, reviews and analysis on consumer technologies, services and trends, to help\r\n        you find exactly what you are looking for. Also, IMM News covers a wide \r\n        range of topics, including consumer electronics, smart home, money, wellness and more.\r\n     \r\n        IMM’s team of editors, reporters and content creators offer expert product reviews, \r\n        how-to guides, videos and news articles that help consumers make informed decisions about \r\n        technology-related purchases and stay up-to-date with the latest industry developments.\r\n   \r\n        ', '2025-11-25 23:53:48'),
(2, '            \r\n                            In an ever-changing, tech-driven world, IMM News Network explains, demystifies and guides everyone\r\n        to improve their lives. IMM News is a trusted digital media publication that provides expert\r\n        information, reviews and analysis on consumer technologies, services and trends, to help\r\n        you find exactly what you are looking for. Also, IMM News covers a wide \r\n        range of topics, including consumer electronics, smart home, money, wellness and more.\r\n     \r\n        IMM’s team of editors, reporters and content creators offer expert product reviews, \r\n        how-to guides, videos and news articles that help consumers make informed decisions about \r\n        technology-related purchases and stay up-to-date with the latest industry developments.\r\n   \r\n        \r\n            \r\n        ', '2025-11-25 23:55:34'),
(3, '            In an ever-changing, tech-driven world, IMM News Network explains, demystifies and guides everyone\r\n        to improve their lives. IMM News is a trusted digital media publication that provides expert\r\n        information, reviews and analysis on consumer technologies, services and trends, to help\r\n        you find exactly what you are looking for. Also, IMM News covers a wide \r\n        range of topics, including consumer electronics, smart home, money, wellness and more.\r\n     \r\n        IMM’s team of editors, reporters and content creators offer expert product reviews, \r\n        how-to guides, videos and news articles that help consumers make informed decisions about \r\n        technology-related purchases and stay up-to-date with the latest industry developments.\r\n   \r\n        ', '2025-11-26 00:14:08'),
(4, '            In an ever-changing, tech-driven world, IMM News Network explains, demystifies and guides everyone\r\n        to improve their lives. IMM News is a trusted digital media publication that provides expert\r\n        information, reviews and analysis on consumer technologies, services and trends, to help\r\n        you find exactly what you are looking for. Also, IMM News covers a wide \r\n        range of topics, including consumer electronics, smart home, money, wellness and more.\r\n     \r\n        IMM’s team of editors, reporters and content creators offer expert product reviews, \r\n        how-to guides, videos and news articles that help consumers make informed decisions about \r\n        technology-related purchases and stay up-to-date with the latest industry developments.\r\n   \r\n        ', '2025-11-26 00:15:48'),
(5, '            In an ever-changing, tech-driven world, IMM News Network explains, demystifies and guides everyone\r\n        to improve their lives. IMM News is a trusted digital media publication that provides expert\r\n        information, reviews and analysis on consumer technologies, services and trends, to help\r\n        you find exactly what you are looking for. Also, IMM News covers a wide \r\n        range of topics, including consumer electronics, smart home, money, wellness and more.\r\n     \r\n        IMM’s team of editors, reporters and content creators offer expert product reviews, \r\n        how-to guides, videos and news articles that help consumers make informed decisions about \r\n        technology-related purchases and stay up-to-date with the latest industry developments.\r\n   \r\n        ', '2025-11-26 00:30:41');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_featured` tinyint(1) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `date_created`, `is_featured`, `author_id`) VALUES
(2, 'Data and Analytics Transformation', 'As data explodes in quantity and complexity companies find it increasingly difficult to unlock its full potential. We take a comprehensive approach to your data challenges, helping you conquer obstacles and become an analytics leader.\r\n\r\nAcross every industry and geography, our Data and Analytics Transformation expertise has helped companies achieve end-to-end analytics mastery. Our pragmatic approach is built on value-added analytics strategy and agile methodology, augmented by the specialized skills of best-of-breed partners. We\'re thought leaders on data and advanced analytics, based not only on our work with clients but also on our many use case products.', '2025-11-25 06:38:27', 0, 1),
(3, 'HP to cut about 6,000 jobs by 2028, ramps up AI efforts', 'Nov 25 (Reuters) - HP Inc (HPQ.N), opens new tab said on Tuesday it expects to cut between 4,000 and 6,000 jobs globally by fiscal 2028 as part of a plan to streamline operations and adopt artificial intelligence to speed up product development, improve customer satisfaction and boost productivity.\r\nHP\'s teams focused on product development, internal operations and customer support will be impacted by the job cuts, CEO Enrique Lores said during a media briefing call.\r\n\r\n\r\n\"We expect this initiative will create $1 billion in gross run rate savings over three years,\" Lores added.\r\nThe company laid off an additional 1,000 to 2,000 employees in February, as part of a previously announced restructuring plan.\r\nDemand for AI-enabled PCs has continued to ramp externally, reaching over 30% of HP\'s shipments in the fourth quarter ended October 31.\r\nA global memory chip price surge brought on by rising demand from data centers could push up costs and pressure profits at consumer electronics makers such as HP, Dell (DELL.N), opens new tab and Acer (2353.TW), opens new tab, Morgan Stanley analysts have warned.\r\n\r\nBig Tech\'s push to build out AI infrastructure has triggered price increases for dynamic random access memory and NAND — two commonly used types of memory chips — amid high competition in the server market.\r\nLores said that HP expects to feel the impact in the second half of fiscal 2026, with higher price increases. HP has enough inventory in hand for the first half.\r\n\"We are taking a prudent approach to our guide for the second half, while at the same time implementing aggressive actions like qualifying lower cost suppliers, reducing memory configurations and taking price actions,\" Lores said.\r\nThe company expects fiscal 2026 adjusted profit per share between $2.90 to $3.20, below analysts\' average estimate of $3.33, according to data compiled by LSEG.\r\nHP expects adjusted first-quarter profit per share between 73 cents and 81 cents, with the midpoint coming below estimates of 79 cents apiece.', '2025-11-25 22:15:47', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contactstable`
--

CREATE TABLE `contactstable` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contactstable`
--

INSERT INTO `contactstable` (`id`, `name`, `email`, `message`, `submission_date`) VALUES
(1, 'Meenal', 'mnakjkag@gmail.com', 'Hi, I would love to join your team.', '2025-11-25 01:33:51'),
(2, 'Aastha', 'aastha@gmail.com', 'Hi, I absolutely enjoy reading some of your technical stuff. I would like to read more about AI and machine learning. Also, if I could contribute in the research, I don\'t mind contributing.', '2025-11-25 01:37:11');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `liked_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `article_id`, `liked_date`) VALUES
(1, 2, 1, '2025-11-25 21:26:28'),
(3, 4, 2, '2025-11-25 21:30:22'),
(4, 1, 2, '2025-11-25 21:48:02'),
(5, 1, 3, '2025-11-25 21:52:40'),
(6, 1, 1, '2025-11-25 21:57:42'),
(10, 2, 2, '2025-11-26 00:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `userstable`
--

CREATE TABLE `userstable` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userstable`
--

INSERT INTO `userstable` (`id`, `name`, `email`, `password`, `role`, `date`) VALUES
(1, 'Meenal', 'mee@gmail.com', '123456', 'admin', '2025-11-26 00:38:00'),
(2, 'Simran', 'simar@gmail.com', 'simar1234', 'member', '2025-11-25 01:31:45'),
(3, 'Aastha', 'sainiaastha@gmail.com', 'paasta', 'member', '2025-11-25 01:32:08'),
(4, 'Aman', 'chahal@gmail.com', 'chahal', 'member', '2025-11-25 01:32:36'),
(5, 'Manpreet', 'hundal@gmail.com', 'man1234', 'member', '2025-11-25 01:33:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contactstable`
--
ALTER TABLE `contactstable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userstable`
--
ALTER TABLE `userstable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contactstable`
--
ALTER TABLE `contactstable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `userstable`
--
ALTER TABLE `userstable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
