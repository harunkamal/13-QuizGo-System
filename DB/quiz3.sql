-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2019 at 04:49 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz2`
--
CREATE DATABASE IF NOT EXISTS `quiz2` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `quiz2`;

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mark` int(11) NOT NULL,
  `fullMark` int(11) NOT NULL,
  `quizID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_id` (`quizID`),
  KEY `user_id` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `answer`:
--   `quizID`
--       `quiz` -> `id`
--   `userID`
--       `user` -> `id`
--

--
-- Dumping data for table `answer`
--

INSERT IGNORE INTO `answer` (`id`, `mark`, `fullMark`, `quizID`, `userID`) VALUES
(2, 1, 2, 13, 2);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `quizID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quizID`),
  KEY `user_id` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `comment`:
--   `quizID`
--       `quiz` -> `id`
--   `userID`
--       `user` -> `id`
--

--
-- Dumping data for table `comment`
--

INSERT IGNORE INTO `comment` (`id`, `content`, `quizID`, `userID`) VALUES
(1, 'Smash is an awesome quiz', 12, 1),
(2, 'hi there ', 12, 1),
(3, 'I love test 11', 11, 1),
(4, 'Are you ready for this quiz?', 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statement` varchar(255) NOT NULL,
  `a` varchar(255) NOT NULL,
  `b` varchar(255) NOT NULL,
  `c` varchar(255) NOT NULL,
  `d` varchar(255) NOT NULL,
  `correctAnswer` varchar(255) NOT NULL,
  `quizID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quizID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `question`:
--   `quizID`
--       `quiz` -> `id`
--

--
-- Dumping data for table `question`
--

INSERT IGNORE INTO `question` (`id`, `statement`, `a`, `b`, `c`, `d`, `correctAnswer`, `quizID`) VALUES
(7, 'what is the future?', 'nothing special', 'everything', 'Now is the future', 'me', 'Now is the future', 11),
(8, 'who is Marco?', 'Italian doctor', 'Italian plumper', 'Italian cook', 'Italian pizza specialist', 'Italian pizza specialist', 12),
(9, 'who is tan?', 'random name', 'someone\'s bride', 'bowser\'s bride', 'a top tier', 'someone\'s bride', 12),
(10, 'sss', 'ss', 'new correct answer', 'cc', 'old answer', 'new correct answer', 13),
(11, 'new question statement', 'new correct answer', 'gsdvgsdgv', 'old correct', 'asdasdasd', 'new correct answer', 13);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `timer` time NOT NULL,
  `numOfQ` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `quiz`:
--   `userID`
--       `user` -> `id`
--

--
-- Dumping data for table `quiz`
--

INSERT IGNORE INTO `quiz` (`id`, `title`, `description`, `startDate`, `endDate`, `timer`, `numOfQ`, `userID`) VALUES
(11, 'test 11', 'test 11 desc', '2019-01-01 01:00:00', '2019-01-01 01:00:00', '01:00:00', 1, 1),
(12, 'smash on switch', 'smash is a fighting game that has all types of amazing nintendo characters', '2019-08-16 05:50:00', '2034-02-03 01:00:00', '21:00:00', 2, 1),
(13, 'ooad', 'this is ooad quiz desc', '2019-02-02 02:00:00', '2019-02-02 02:00:22', '14:00:00', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `user`:
--

--
-- Dumping data for table `user`
--

INSERT IGNORE INTO `user` (`id`, `firstName`, `last_name`, `email`, `password`, `type`) VALUES
(1, 'Ayman', '', '', '', ''),
(2, 'Maryam', '', '', '', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `quiz_id_cn` FOREIGN KEY (`quizID`) REFERENCES `quiz` (`id`),
  ADD CONSTRAINT `user_id_cn` FOREIGN KEY (`userID`) REFERENCES `user` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `quiz_id_c` FOREIGN KEY (`quizID`) REFERENCES `quiz` (`id`),
  ADD CONSTRAINT `user_id_c` FOREIGN KEY (`userID`) REFERENCES `user` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `quiz_id` FOREIGN KEY (`quizID`) REFERENCES `quiz` (`id`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `fk_userID` FOREIGN KEY (`userID`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
