-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2023 at 07:15 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zidiscuss`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(8) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_description` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_description`, `created`) VALUES
(1, 'Python', 'Python is an interpreted high-level general-purpose programming language. Python\'s design philosophy emphasizes code readability with its notable use of significant indentation.', '2021-06-15 00:47:18'),
(2, 'JavaScript', 'JavaScript, often abbreviated as JS, is a programming language that conforms to the ECMAScript specification. JavaScript is high-level, often just-in-time compiled, and multi-paradigm.', '2021-06-15 00:48:19'),
(7, 'Django', 'Django is a Python-based free and open-source web framework that follows the model–template–views architectural pattern. ', '2021-06-15 15:53:43'),
(8, 'Flask', 'Flask is a micro web framework written in Python. It is classified as a microframework because it does not require particular tools or libraries.', '2021-06-15 15:54:34'),
(10, 'C', 'C is a programming language', '2022-03-07 16:44:16');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(8) NOT NULL,
  `comment_content` text NOT NULL,
  `thread_id` int(8) NOT NULL,
  `comment_by` int(8) NOT NULL,
  `comment_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_content`, `thread_id`, `comment_by`, `comment_time`) VALUES
(1, 'this is a comment', 1, 1, '2021-06-16 13:55:53'),
(2, 'Kutbuddin', 1, 3, '2021-06-16 15:29:54'),
(16, 'PHP is an acronym for \"PHP: Hypertext Preprocessor\" PHP is a widely-used, open source scripting language PHP scripts are executed on the server PHP is free to download and use\r\n', 1, 5, '2021-06-17 10:55:07'),
(17, 'PHP is a general-purpose scripting language especially suited to web development.[6] It was originally created by Danish-Canadian programmer Rasmus Lerdorf in 1994.[7] The PHP reference implementation is now produced by The PHP Group.[8] PHP originally stood for Personal Home Page,[7] but it now stands for the recursive initialism PHP: Hypertext Preprocessor.[9]\r\n\r\nPHP code is usually processed on a web server by a PHP interpreter implemented as a module, a daemon or as a Common Gateway Interface (CGI) executable. On a web server, the result of the interpreted and executed PHP code – which may be any type of data, such as generated HTML or binary image data – would form the whole or part of an HTTP response. Various web template systems, web content management systems, and web frameworks exist which can be employed to orchestrate or facilitate the generation of that response. Additionally, PHP can be used for many programming tasks outside of the web context, such as standalone graphical applications[10] and robotic drone control.[11] PHP code can also be directly executed from the command line.\r\n', 1, 4, '2021-06-17 10:55:23'),
(18, 'what is javascript\r\n', 8, 6, '2021-06-17 10:56:09'),
(37, 'kkhfa', 1, 3, '2022-04-08 14:21:21'),
(46, 'kkhan', 1, 3, '2022-04-08 16:24:05'),
(47, 'kiya jan na hai tujhe', 45, 5, '2022-04-08 16:33:13'),
(48, 'ham log mast hai aap batyae', 46, 7, '2022-04-08 16:38:02'),
(49, 'hey buddy search goole for this error', 35, 8, '2022-04-09 00:53:45'),
(51, '&lt;script&gt;', 48, 8, '2022-04-09 23:49:53'),
(52, 'java,&lt;&gt;\r\n', 49, 8, '2022-04-09 23:50:49'),
(54, 'c is the basic of programming', 51, 8, '2022-04-17 00:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `thread_id` int(7) NOT NULL,
  `thread_title` varchar(255) NOT NULL,
  `thread_description` text NOT NULL,
  `thread_cat_id` int(7) NOT NULL,
  `thread_user_id` int(7) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`thread_id`, `thread_title`, `thread_description`, `thread_cat_id`, `thread_user_id`, `timestamp`) VALUES
(1, 'Unable to install pyaudio', 'I am not able to install pyaudio on windows10.', 1, 1, '2021-06-15 17:42:51'),
(2, 'Not able to use python', 'Please Help me!!!!!', 1, 2, '2021-06-15 18:02:42'),
(8, 'Fetch API not working', 'I am in trouble my fetch api is not woeking', 2, 4, '2021-06-16 13:27:52'),
(13, 'Django', 'what is django', 7, 6, '2021-06-17 10:56:39'),
(14, 'flask', 'what is flask', 8, 1, '2021-06-17 10:57:23'),
(28, 'python', 'python\r\n', 1, 3, '2022-04-03 11:19:50'),
(35, 'kkhan', 'kkhan', 10, 4, '2022-04-05 14:27:01'),
(36, 'what is indentation', 'indentation', 1, 2, '2022-04-08 15:07:56'),
(43, 'hello', 'kiya mai discussion start kar pa rha ho\r\n', 1, 2, '2022-04-08 16:25:55'),
(44, 'hello', 'kiya forum working hai sahi se\r\n', 1, 3, '2022-04-08 16:31:35'),
(45, 'mujhe kuch', 'jan na hai', 1, 5, '2022-04-08 16:33:02'),
(46, 'hello', 'hello dosto kaise hai aap log', 1, 7, '2022-04-08 16:37:47'),
(47, 'what is this', 'its forum', 1, 8, '2022-04-09 00:44:08'),
(49, 'python', 'javascript<>', 1, 8, '2022-04-09 23:50:39'),
(50, '&lt;script&gt;alert(\"You are hacked\")&lt;/script&gt;', '&lt;script&gt;alert(\"You are hacked\")&lt;/script&gt;', 1, 8, '2022-04-09 23:55:04'),
(51, 'what is C', 'c is a programming language', 1, 8, '2022-04-17 00:29:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `sno` int(8) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`sno`, `user_email`, `user_pass`, `timestamp`) VALUES
(1, 'mohsin@bagwan.com', '123', '2022-04-08 15:05:30'),
(2, 'karishma@masal.com', '$2y$10$qDaiO9Up1ol.0WKvd27q2OpZIUv5sQzSqocqmH6ea9AZyMgDbDG3a', '2022-04-08 15:07:17'),
(3, 'kkhan@gmail.com', '$2y$10$pA/OOvVvmwHq9kb840bgre6hicKg8Hb45SU1klm07zZ3aRTHMxm2S', '2022-04-08 15:11:51'),
(4, 'kutbuddin@gmail.com', '$2y$10$LR7QhgjW43DEEk1d5tmB7OM9yzR64GDsZNpCZHuzLjgZ1gntxCYtW', '2022-04-08 15:12:06'),
(5, 'mohsin@gamil.com', '$2y$10$d7/TBovP7xrSyJ1iWRimdeBD2GXjLdscjkYncRyd/72cybq8wKpjy', '2022-04-08 15:12:19'),
(6, 'karsihma@gmail.com', '$2y$10$o0GQyjDD1ye.9jkxX2.3oOYVtWSLoATY8dQe0VxeQxGEGEwdmqkrG', '2022-04-08 15:12:39'),
(7, 'Kkhan@khan.com', '$2y$10$J1N6yw3lWvSKjDWF7O8LG.Bbk5d7DyOMqi/tLjw8ADxIO66liUXgW', '2022-04-08 16:37:19'),
(8, 'kutbuddin', '$2y$10$y2IfXg6psbRJEILg4NivOuILNjtDQGnMa6f5vCFV.YfPsrDvQf/j6', '2022-04-09 00:43:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`thread_id`);
ALTER TABLE `threads` ADD FULLTEXT KEY `thread_title` (`thread_title`,`thread_description`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `thread_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `sno` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
