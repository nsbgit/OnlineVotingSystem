-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 21, 2014 at 01:46 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `the_voting_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_registration_information`
--

CREATE TABLE IF NOT EXISTS `admin_registration_information` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `organisationName` varchar(50) NOT NULL,
  `eMail` varchar(50) NOT NULL,
  `userID` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `organisationAddress` varchar(200) NOT NULL,
  `agree` varchar(20) NOT NULL,
  `fileName` varchar(20) NOT NULL,
  `registrationDate` varchar(20) NOT NULL,
  `registrationDay` varchar(20) NOT NULL,
  `registrationTime` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `admin_registration_information`
--

INSERT INTO `admin_registration_information` (`id`, `firstName`, `lastName`, `organisationName`, `eMail`, `userID`, `password`, `organisationAddress`, `agree`, `fileName`, `registrationDate`, `registrationDay`, `registrationTime`) VALUES
(1, 'Sukanta', 'Sharma', 'JIS College of Engineering', 'onlinewrk@live.in', 'shanu', '1234/.,m', 'Kalyani', 'on', '05012014120647.jpg', '30/11/2013', 'Monday', '9:58:32 PM'),
(3, 'sadf', 'afasdf', 'sadfsaf', 'dasdfsa@m.bi', 'fsadfsa', '1234abc.', 'safsafsaf', 'on', '', '1/0/2014', 'Wednesday', '11:47:17 PM'),
(4, 'Arbind Kumar', 'Mahato', 'Google', 'akjisce@gmail.com', 'akjisce', '12345abc@', 'Kolkata, India', 'on', '', '2/0/2014', 'Thursday', '1:36:17 PM'),
(5, 'Abhijeet', 'Shaw', 'Webel', 'abhi.cool@gmail.com', 'abhi', '12345abc@', 'KOlkata, India', 'on', '', '2/0/2014', 'Thursday', '1:37:49 PM'),
(6, 'Arpana', 'Kumari', 'IBM', 'arpanagayacse@gmail.com', 'arpana', '12345abc@', 'Delhi, India', 'on', '', '2/0/2014', 'Thursday', '1:39:55 PM'),
(8, 'Vikash', 'Singh', 'Life Style', 'vikashcse19@gmail.com', 'vikash', '123456abc!@#', 'KOlkata', 'on', '', '2/0/2014', 'Thursday', '1:47:13 PM'),
(9, 'Bandana', 'Yadav', 'Model Rock', 'vandu.cse@gmail.com', 'vandu', '124578bgt#@!', 'Kolkata, India', 'on', '', '2/0/2014', 'Thursday', '1:49:16 PM'),
(10, 'Swati', 'Panday', 'Google', 'swatipanday@gmail.com', 'swati', '123456789a!@', 'Kolkata, India', 'on', '', '2/0/2014', 'Thursday', '1:52:35 PM'),
(11, 'Pooja', 'Singh', 'P.N.Lmt.', 'poojasingh12@gmail.com', 'pooja', '159753pp!@#', 'Delhi, India', 'on', '', '2/0/2014', 'Thursday', '1:54:28 PM'),
(12, 'Radha', 'Agarwal', 'Wipro', 'radha@gmail.com', 'radha', '124578as!@', 'Patana, India', 'on', '', '2/0/2014', 'Thursday', '1:56:42 PM'),
(13, 'Dayanand', 'Sagar', 'Google', 'dayanandcse37@gmail.com', 'daya', '789456123da!@#', 'Gaya, India', 'on', '', '2/0/2014', 'Thursday', '1:59:26 PM'),
(14, 'Bishwajeet', 'Gupta', 'L.N.T.', '01bishwajeet@gmail.com', '01bish', '456123bhu$%', 'Kolkata, India', 'on', '', '2/0/2014', 'Thursday', '2:2:14 PM'),
(15, 'Amit', 'Sharma', 'E.Lmtd', 'amit01@gmail.com', 'amit', '15632am@!', 'UP, India', 'on', '', '2/0/2014', 'Thursday', '2:6:21 PM'),
(16, 'Bikash', 'Bandari', 'E.Lmtd', 'biokash@gmail.com', 'bikash', '1230bik~!@', 'Goa, India', 'on', '', '2/0/2014', 'Thursday', '2:14:5 PM'),
(17, 'Ram', 'Sharma', 'L.N.T.', 'ramlal@gmail.com', 'ramlal', '12369ram~!@', 'Kalyani, W.B', 'on', '', '2/0/2014', 'Thursday', '2:16:43 PM'),
(18, 'Amandip', 'Singha', 'Google', 'amandip@gmail.com', 'amandip', '456123aman!@#', 'Kolkata, India', 'on', '', '2/0/2014', 'Thursday', '2:18:4 PM'),
(19, 'Katrina', 'Kaif', 'Bollywood', 'sukantaskat@live.com', 'cat', '1234/.,m', 'Mumbai\r\nIndia', 'on', '04012014114840.jpg', '5/1/2014', 'Sunday', '0:7:12 AM'),
(20, 'Saikat', 'Biswas', 'JNV Kalyani Nadia', 'saikatb53@gmail.com', 'Hrtbrkrsaikat', '1234/.,m', 'Kalyani, Nadia, WB', 'on', '05012014105854.jpg', '5/1/2014', 'Sunday', '10:58:54 AM'),
(21, 'Vikash', 'Singh', 'JIS College of Engineering', 'vikascse19jan@gmail.com', 'shanr', '1234/.,m', 'bihar', 'on', '05012014022248.jpg', '5/1/2014', 'Sunday', '2:22:48 PM'),
(22, 'Ritu', 'Singh', 'Aambagan', 'vikascse19jan@gmail.com', 'vik', '1234/.,m', 'Naihati', 'on', '05012014035745.jpg', '5/1/2014', 'Sunday', '4:2:15 PM'),
(23, 'Shanu', 'Sharma', 'JIS College of Engineering', 'onlinewrk@live.in', 'sukanta', '1234/.,m', 'G G Road\r\nNarkel Bagan\r\nNaihati', 'on', '12012014013843.jpg', '12/1/2014', 'Sunday', '1:39:45 PM'),
(24, 'Vikash', 'Singh', 'Jis', 'vikashcse19@gmail.com', 'SinghisKing', 'wXmF986:', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nBihar\r\n\r\n\r\n\r\n', 'on', '20012014041814.jpg', '20/1/2014', 'Monday', '4:18:14 PM');

-- --------------------------------------------------------

--
-- Table structure for table `admin_sign_in_history`
--

CREATE TABLE IF NOT EXISTS `admin_sign_in_history` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `fId` varchar(20) NOT NULL,
  `signInDate` varchar(20) NOT NULL,
  `signInDay` varchar(20) NOT NULL,
  `signInTime` varchar(20) NOT NULL,
  `signOutDate` varchar(20) NOT NULL,
  `signOutDay` varchar(20) NOT NULL,
  `signOutTime` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=98 ;

--
-- Dumping data for table `admin_sign_in_history`
--

INSERT INTO `admin_sign_in_history` (`id`, `fId`, `signInDate`, `signInDay`, `signInTime`, `signOutDate`, `signOutDay`, `signOutTime`) VALUES
(1, '1', '2/0/2014', 'Thursday', '3:4:39 AM', '-', '-', '-'),
(2, '1', '2/0/2014', 'Thursday', '3:8:26 AM', '-', '-', '-'),
(3, '1', '2/0/2014', 'Thursday', '3:15:47 AM', '-', '-', '-'),
(4, '3', '2/0/2014', 'Thursday', '3:19:58 AM', '-', '-', '-'),
(5, '1', '2/0/2014', 'Thursday', '7:38:2 PM', '    -    ', '    -    ', '    -    '),
(6, '1', '2/1/2014', 'Thursday', '7:48:8 PM', '    -    ', '    -    ', '    -    '),
(7, '1', '2/1/2014', 'Thursday', '7:49:3 PM', '    -    ', '    -    ', '    -    '),
(8, '1', '2/1/2014', 'Thursday', '8:23:43 PM', '    -    ', '    -    ', '    -    '),
(9, '1', '2/1/2014', 'Thursday', '8:43:52 PM', '    -    ', '    -    ', '    -    '),
(10, '1', '2/1/2014', 'Thursday', '8:58:52 PM', '    -    ', '    -    ', '    -    '),
(11, '1', '2/1/2014', 'Thursday', '9:29:49 PM', '    -    ', '    -    ', '    -    '),
(12, '1', '2/1/2014', 'Thursday', '9:34:31 PM', '    -    ', '    -    ', '    -    '),
(13, '1', '2/1/2014', 'Thursday', '9:36:4 PM', '    -    ', '    -    ', '    -    '),
(14, '1', '2/1/2014', 'Thursday', '9:37:13 PM', '    -    ', '    -    ', '    -    '),
(15, '1', '2/1/2014', 'Thursday', '11:6:41 PM', '    -    ', '    -    ', '    -    '),
(16, '1', '2/1/2014', 'Thursday', '11:27:0 PM', '    -    ', '    -    ', '    -    '),
(17, '1', '3/1/2014', 'Friday', '1:37:4 AM', '    -    ', '    -    ', '    -    '),
(18, '1', '3/1/2014', 'Friday', '2:7:39 AM', '    -    ', '    -    ', '    -    '),
(19, '1', '3/1/2014', 'Friday', '2:39:22 AM', '    -    ', '    -    ', '    -    '),
(20, '1', '3/1/2014', 'Friday', '2:48:8 AM', '    -    ', '    -    ', '    -    '),
(21, '1', '3/1/2014', 'Friday', '8:56:20 AM', '    -    ', '    -    ', '    -    '),
(22, '19', '5/1/2014', 'Sunday', '0:10:13 AM', '    -    ', '    -    ', '    -    '),
(23, '19', '5/1/2014', 'Sunday', '0:41:14 AM', '    -    ', '    -    ', '    -    '),
(24, '1', '5/1/2014', 'Sunday', '1:10:2 AM', '    -    ', '    -    ', '    -    '),
(25, '20', '5/1/2014', 'Sunday', '10:59:21 AM', '    -    ', '    -    ', '    -    '),
(26, '21', '5/1/2014', 'Sunday', '2:24:30 PM', '    -    ', '    -    ', '    -    '),
(27, '22', '5/1/2014', 'Sunday', '4:8:24 PM', '    -    ', '    -    ', '    -    '),
(28, '1', '5/1/2014', 'Sunday', '9:26:50 PM', '    -    ', '    -    ', '    -    '),
(29, '1', '5/1/2014', 'Sunday', '9:41:42 PM', '    -    ', '    -    ', '    -    '),
(30, '1', '5/1/2014', 'Sunday', '9:56:54 PM', '    -    ', '    -    ', '    -    '),
(31, '1', '6/1/2014', 'Monday', '9:44:48 AM', '    -    ', '    -    ', '    -    '),
(32, '1', '6/1/2014', 'Monday', '0:30:43 PM', '    -    ', '    -    ', '    -    '),
(33, '1', '6/1/2014', 'Monday', '0:45:2 PM', '    -    ', '    -    ', '    -    '),
(34, '1', '6/1/2014', 'Monday', '0:50:15 PM', '    -    ', '    -    ', '    -    '),
(35, '1', '6/1/2014', 'Monday', '1:4:47 PM', '    -    ', '    -    ', '    -    '),
(36, '1', '6/1/2014', 'Monday', '1:12:39 PM', '    -    ', '    -    ', '    -    '),
(37, '1', '6/1/2014', 'Monday', '1:39:58 PM', '    -    ', '    -    ', '    -    '),
(38, '1', '6/1/2014', 'Monday', '9:23:31 PM', '    -    ', '    -    ', '    -    '),
(39, '1', '6/1/2014', 'Monday', '9:43:48 PM', '    -    ', '    -    ', '    -    '),
(40, '1', '6/1/2014', 'Monday', '9:46:7 PM', '    -    ', '    -    ', '    -    '),
(41, '1', '6/1/2014', 'Monday', '11:11:8 PM', '    -    ', '    -    ', '    -    '),
(42, '1', '6/1/2014', 'Monday', '11:15:28 PM', '    -    ', '    -    ', '    -    '),
(43, '1', '6/1/2014', 'Monday', '11:50:55 PM', '    -    ', '    -    ', '    -    '),
(44, '1', '7/1/2014', 'Tuesday', '0:11:41 AM', '    -    ', '    -    ', '    -    '),
(45, '1', '7/1/2014', 'Tuesday', '0:16:32 AM', '    -    ', '    -    ', '    -    '),
(46, '1', '7/1/2014', 'Tuesday', '0:21:1 PM', '    -    ', '    -    ', '    -    '),
(47, '1', '7/1/2014', 'Tuesday', '0:22:14 PM', '    -    ', '    -    ', '    -    '),
(48, '19', '7/1/2014', 'Tuesday', '0:25:28 PM', '    -    ', '    -    ', '    -    '),
(49, '19', '7/1/2014', 'Tuesday', '0:33:55 PM', '    -    ', '    -    ', '    -    '),
(50, '19', '7/1/2014', 'Tuesday', '1:20:50 PM', '    -    ', '    -    ', '    -    '),
(51, '1', '7/1/2014', 'Tuesday', '1:26:12 PM', '    -    ', '    -    ', '    -    '),
(52, '1', '7/1/2014', 'Tuesday', '1:33:54 PM', '    -    ', '    -    ', '    -    '),
(53, '1', '8/1/2014', 'Wednesday', '0:44:5 PM', '    -    ', '    -    ', '    -    '),
(54, '1', '8/1/2014', 'Wednesday', '1:22:10 PM', '    -    ', '    -    ', '    -    '),
(55, '1', '8/1/2014', 'Wednesday', '1:45:31 PM', '    -    ', '    -    ', '    -    '),
(56, '4', '8/1/2014', 'Wednesday', '10:23:55 PM', '    -    ', '    -    ', '    -    '),
(57, '1', '8/1/2014', 'Wednesday', '10:25:42 PM', '    -    ', '    -    ', '    -    '),
(58, '22', '8/1/2014', 'Wednesday', '10:37:7 PM', '    -    ', '    -    ', '    -    '),
(59, '1', '9/1/2014', 'Thursday', '0:21:5 PM', '    -    ', '    -    ', '    -    '),
(60, '1', '9/1/2014', 'Thursday', '2:13:14 PM', '    -    ', '    -    ', '    -    '),
(61, '1', '9/1/2014', 'Thursday', '2:23:27 PM', '    -    ', '    -    ', '    -    '),
(62, '1', '9/1/2014', 'Thursday', '2:46:0 PM', '    -    ', '    -    ', '    -    '),
(63, '1', '10/1/2014', 'Friday', '1:41:20 AM', '    -    ', '    -    ', '    -    '),
(64, '1', '10/1/2014', 'Friday', '2:9:11 AM', '    -    ', '    -    ', '    -    '),
(65, '1', '10/1/2014', 'Friday', '0:42:49 PM', '    -    ', '    -    ', '    -    '),
(66, '1', '10/1/2014', 'Friday', '2:9:50 PM', '    -    ', '    -    ', '    -    '),
(67, '1', '10/1/2014', 'Friday', '2:20:19 PM', '    -    ', '    -    ', '    -    '),
(68, '1', '10/1/2014', 'Friday', '2:23:59 PM', '    -    ', '    -    ', '    -    '),
(69, '1', '10/1/2014', 'Friday', '2:35:55 PM', '    -    ', '    -    ', '    -    '),
(70, '1', '10/1/2014', 'Friday', '9:57:46 PM', '    -    ', '    -    ', '    -    '),
(71, '1', '10/1/2014', 'Friday', '10:20:22 PM', '    -    ', '    -    ', '    -    '),
(72, '1', '10/1/2014', 'Friday', '11:24:51 PM', '    -    ', '    -    ', '    -    '),
(73, '1', '12/1/2014', 'Sunday', '10:35:42 AM', '    -    ', '    -    ', '    -    '),
(74, '23', '12/1/2014', 'Sunday', '2:31:59 PM', '    -    ', '    -    ', '    -    '),
(75, '1', '12/1/2014', 'Sunday', '5:16:42 PM', '    -    ', '    -    ', '    -    '),
(76, '1', '12/1/2014', 'Sunday', '6:16:6 PM', '    -    ', '    -    ', '    -    '),
(77, '1', '14/1/2014', 'Tuesday', '2:31:43 PM', '    -    ', '    -    ', '    -    '),
(78, '19', '15/1/2014', 'Wednesday', '1:26:33 AM', '    -    ', '    -    ', '    -    '),
(79, '19', '15/1/2014', 'Wednesday', '1:29:38 AM', '    -    ', '    -    ', '    -    '),
(80, '19', '15/1/2014', 'Wednesday', '1:48:52 AM', '    -    ', '    -    ', '    -    '),
(81, '19', '15/1/2014', 'Wednesday', '1:57:48 AM', '    -    ', '    -    ', '    -    '),
(82, '1', '15/1/2014', 'Wednesday', '0:44:51 PM', '    -    ', '    -    ', '    -    '),
(83, '19', '16/1/2014', 'Thursday', '10:42:55 AM', '    -    ', '    -    ', '    -    '),
(84, '1', '16/1/2014', 'Thursday', '10:43:9 AM', '    -    ', '    -    ', '    -    '),
(85, '1', '15/1/2014', 'Wednesday', '11:29:27 AM', '    -    ', '    -    ', '    -    '),
(86, '1', '17/1/2014', 'Friday', '10:59:0 AM', '    -    ', '    -    ', '    -    '),
(87, '19', '17/1/2014', 'Friday', '11:3:24 AM', '    -    ', '    -    ', '    -    '),
(88, '19', '17/1/2014', 'Friday', '11:16:25 AM', '    -    ', '    -    ', '    -    '),
(89, '1', '17/1/2014', 'Friday', '0:9:2 PM', '    -    ', '    -    ', '    -    '),
(90, '1', '18/1/2014', 'Satuarday', '3:34:1 PM', '    -    ', '    -    ', '    -    '),
(91, '1', '18/1/2014', 'Satuarday', '4:12:23 PM', '    -    ', '    -    ', '    -    '),
(92, '1', '18/1/2014', 'Satuarday', '8:46:22 PM', '    -    ', '    -    ', '    -    '),
(93, '1', '20/1/2014', 'Monday', '11:57:52 AM', '    -    ', '    -    ', '    -    '),
(94, '1', '20/1/2014', 'Monday', '0:48:8 PM', '    -    ', '    -    ', '    -    '),
(95, '1', '20/1/2014', 'Monday', '4:36:21 PM', '    -    ', '    -    ', '    -    '),
(96, '1', '20/1/2014', 'Monday', '5:2:54 PM', '    -    ', '    -    ', '    -    '),
(97, '1', '20/1/2014', 'Monday', '5:10:39 PM', '    -    ', '    -    ', '    -    ');

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE IF NOT EXISTS `vote` (
  `idVote` int(200) NOT NULL AUTO_INCREMENT,
  `fIdAdminRegInfo` int(200) NOT NULL,
  `fIdVoterInfo` int(200) NOT NULL,
  `fIdVotingSchedule` int(200) NOT NULL,
  `fIdVotingCandidate` int(200) NOT NULL,
  `currentDate` date NOT NULL,
  `currentTime` time NOT NULL,
  PRIMARY KEY (`idVote`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `vote`
--

INSERT INTO `vote` (`idVote`, `fIdAdminRegInfo`, `fIdVoterInfo`, `fIdVotingSchedule`, `fIdVotingCandidate`, `currentDate`, `currentTime`) VALUES
(1, 1, 1, 6, 15, '2014-01-15', '15:10:18'),
(2, 1, 1, 6, 15, '2014-01-15', '11:32:09'),
(3, 1, 1, 6, 15, '2014-01-15', '11:32:14'),
(4, 1, 1, 6, 16, '2014-01-15', '11:32:16'),
(5, 1, 1, 6, 15, '2014-01-15', '11:32:18'),
(6, 1, 1, 6, 16, '2014-01-15', '11:32:20'),
(7, 1, 1, 6, 15, '2014-01-15', '11:32:23'),
(8, 1, 1, 6, 16, '2014-01-15', '11:32:25'),
(9, 1, 1, 6, 15, '2014-01-15', '11:32:27'),
(10, 1, 1, 6, 16, '2014-01-15', '11:32:30'),
(11, 1, 1, 6, 15, '2014-01-15', '11:32:33'),
(12, 1, 1, 6, 15, '2014-01-15', '11:32:35'),
(13, 1, 1, 6, 15, '2014-01-15', '11:32:37'),
(14, 1, 1, 6, 16, '2014-01-15', '11:32:40'),
(15, 1, 1, 6, 15, '2014-01-15', '11:32:44'),
(16, 1, 1, 6, 15, '2014-01-15', '11:32:47'),
(17, 1, 1, 6, 15, '2014-01-15', '11:32:51'),
(18, 1, 1, 6, 17, '2014-01-15', '12:09:16'),
(19, 1, 1, 6, 19, '2014-01-15', '12:09:19'),
(23, 1, 1, 14, 32, '2014-01-17', '13:05:33'),
(24, 1, 1, 9, 21, '2014-01-17', '13:08:30'),
(25, 1, 4, 14, 32, '2014-01-17', '13:21:07'),
(26, 1, 4, 9, 22, '2014-01-17', '13:21:37'),
(27, 1, 4, 11, 27, '2014-01-17', '13:22:03'),
(28, 1, 4, 10, 25, '2014-01-17', '13:22:26'),
(29, 1, 5, 9, 21, '2014-01-17', '13:34:06'),
(30, 1, 5, 14, 32, '2014-01-17', '13:35:30'),
(31, 1, 5, 11, 26, '2014-01-17', '13:35:34'),
(32, 1, 5, 10, 24, '2014-01-17', '13:35:37'),
(35, 1, 6, 11, 26, '2014-01-17', '13:36:16'),
(36, 1, 6, 14, 32, '2014-01-17', '13:36:25'),
(37, 1, 1, 15, 35, '2014-01-18', '16:16:49'),
(38, 1, 4, 15, 35, '2014-01-18', '16:17:36'),
(39, 1, 1, 16, 38, '2014-01-18', '20:58:32'),
(40, 1, 1, 17, 40, '2014-01-20', '12:08:11'),
(41, 1, 1, 18, 43, '2014-01-20', '12:36:11'),
(42, 24, 11, 19, 46, '2014-01-20', '16:51:43'),
(43, 1, 1, 20, 47, '2014-01-20', '17:13:41'),
(44, 1, 4, 20, 47, '2014-01-20', '17:14:12'),
(45, 1, 5, 20, 48, '2014-01-20', '17:14:49');

-- --------------------------------------------------------

--
-- Table structure for table `voter_registration_information`
--

CREATE TABLE IF NOT EXISTS `voter_registration_information` (
  `idVoterRegistrationInformation` int(200) NOT NULL AUTO_INCREMENT,
  `fIdAdminRegInfo` int(20) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `fileName` varchar(20) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `eMail` varchar(50) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `po` varchar(20) NOT NULL,
  `postalCode` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `registrationDate` varchar(20) NOT NULL,
  `registrationDay` varchar(20) NOT NULL,
  `registrationTime` varchar(20) NOT NULL,
  `approved` int(20) NOT NULL,
  PRIMARY KEY (`idVoterRegistrationInformation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `voter_registration_information`
--

INSERT INTO `voter_registration_information` (`idVoterRegistrationInformation`, `fIdAdminRegInfo`, `firstName`, `lastName`, `fileName`, `dob`, `eMail`, `userId`, `password`, `address`, `po`, `postalCode`, `state`, `registrationDate`, `registrationDay`, `registrationTime`, `approved`) VALUES
(1, 1, 'Sukanta', 'Sharma', '12012014092039.jpg', '09-07-1994', 'onlinewrk@live.in', 'shanuv', '1234/.,m', 'Narkel Bagan', 'Garifa', '743166', 'West Bengal', '12/1/2014', 'Sunday', '9:22:34 PM', 0),
(2, 1, 'first', 'last', '15012014125214.jpg', '09-01-2014', 'onlinewrk@live.in', 'shanu', '1234/.,m', 'add', 'Garifa', '743166', 'Goa', '15/1/2014', 'Wednesday', '0:53:7 AM', 0),
(3, 19, 'kat', 'Singh', '15012014020513.jpg', '13-01-2014', 'vikascse19jan@gmail.com', 'cat', '1234/.,m', 'dfgdg', 'Garifa', '743166', 'Daman and Diu', '15/1/2014', 'Wednesday', '2:5:25 AM', 0),
(4, 1, 'shanua', 'shanua', '17012014110851.sql', '16-01-2014', 'onlinewrk@live.in', 'shanua', '1234/.,m', 'shanua', 'shanua', 'shanua', 'Daman and Diu', '17/1/2014', 'Friday', '11:9:36 AM', 0),
(5, 1, 'shanub', 'shanub', '17012014111203.sql', '17-01-2014', 'onlinewrk@live.in', 'shanub', '1234/.,m', 'shanub', 'shanub', 'shanub', 'Goa', '17/1/2014', 'Friday', '11:12:3 AM', 0),
(6, 1, 'shanuc', 'shanuc', '17012014111256.sql', '17-01-2014', 'onlinewrk@live.in', 'shanuc', '1234/.,m', 'shanuc', 'shanuc', 'shanuc', 'Himachal Pradesh', '17/1/2014', 'Friday', '11:12:56 AM', 0),
(7, 19, 'cata', 'cata', '17012014111347.sql', '17-01-2014', 'onlinewrk@live.in', 'cata', '1234/.,m', 'cata', 'cata', 'cata', 'Haryana', '17/1/2014', 'Friday', '11:13:47 AM', 0),
(8, 19, 'catb', 'catb', '17012014111424.sql', '17-01-2014', 'onlinewrk@live.in', 'catb', '1234/.,m', 'catb', 'catb', 'catb', 'Goa', '17/1/2014', 'Friday', '11:14:24 AM', 0),
(9, 19, 'catc', 'catc', '17012014111503.sql', '17-01-2014', 'onlinewrk@live.in', 'catc', '1234/.,m', 'catc', 'catc', 'catc', 'Goa', '17/1/2014', 'Friday', '11:15:3 AM', 0),
(10, 1, 'Sukanta', 'Sharma', '20012014042729.jpg', '22-01-2014', 'vikashcse19@gmail.com', 'shanuvh', '1234/.,m', 'Naihati', 'Garifa', '743166', 'Lakshadweep', '20/1/2014', 'Monday', '4:27:29 PM', 0),
(11, 24, 'Vikash', 'Singh', '20012014044722.jpg', '13-01-1993', 'vikashcse19@gmail.com', 'SinghisKing', 'mpXX491&', 'Bihar', 'Chand', '123456', 'Bihar', '20/1/2014', 'Monday', '4:47:22 PM', 0),
(12, 1, 'Vikash Kumar', 'Singh', '20012014045801.jpg', '18-01-2014', 'onlinewrk@live.in', 'Bikash', 'kicr240#', 'Bihar', 'Chand', '123456', 'Bihar', '20/1/2014', 'Monday', '4:58:1 PM', 0);

-- --------------------------------------------------------

--
-- Table structure for table `voter_sign_in_history`
--

CREATE TABLE IF NOT EXISTS `voter_sign_in_history` (
  `idVoterSignInHistory` int(200) NOT NULL AUTO_INCREMENT,
  `fIdVoterRegistrationInformation` int(200) NOT NULL,
  `signInDate` varchar(20) NOT NULL,
  `signInDay` varchar(20) NOT NULL,
  `signInTime` varchar(20) NOT NULL,
  `signOutDate` varchar(20) NOT NULL,
  `signOutDay` varchar(20) NOT NULL,
  `signOutTime` varchar(20) NOT NULL,
  PRIMARY KEY (`idVoterSignInHistory`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=122 ;

--
-- Dumping data for table `voter_sign_in_history`
--

INSERT INTO `voter_sign_in_history` (`idVoterSignInHistory`, `fIdVoterRegistrationInformation`, `signInDate`, `signInDay`, `signInTime`, `signOutDate`, `signOutDay`, `signOutTime`) VALUES
(1, 1, '14/1/2014', 'Tuesday', '1:55:20 PM', '    -    ', '    -    ', '    -    '),
(2, 1, '14/1/2014', 'Tuesday', '1:56:7 PM', '    -    ', '    -    ', '    -    '),
(3, 1, '14/1/2014', 'Tuesday', '2:11:55 PM', '    -    ', '    -    ', '    -    '),
(4, 1, '14/1/2014', 'Tuesday', '2:12:31 PM', '    -    ', '    -    ', '    -    '),
(5, 1, '14/1/2014', 'Tuesday', '9:14:6 PM', '    -    ', '    -    ', '    -    '),
(6, 1, '14/1/2014', 'Tuesday', '9:24:5 PM', '    -    ', '    -    ', '    -    '),
(7, 1, '15/1/2014', 'Wednesday', '1:58:22 AM', '    -    ', '    -    ', '    -    '),
(8, 3, '15/1/2014', 'Wednesday', '2:7:4 AM', '    -    ', '    -    ', '    -    '),
(9, 3, '15/1/2014', 'Wednesday', '2:17:14 AM', '    -    ', '    -    ', '    -    '),
(10, 3, '15/1/2014', 'Wednesday', '2:18:33 AM', '    -    ', '    -    ', '    -    '),
(11, 3, '15/1/2014', 'Wednesday', '2:20:31 AM', '    -    ', '    -    ', '    -    '),
(12, 3, '15/1/2014', 'Wednesday', '2:20:51 AM', '    -    ', '    -    ', '    -    '),
(13, 3, '15/1/2014', 'Wednesday', '2:21:20 AM', '    -    ', '    -    ', '    -    '),
(14, 3, '15/1/2014', 'Wednesday', '2:23:19 AM', '    -    ', '    -    ', '    -    '),
(15, 3, '15/1/2014', 'Wednesday', '2:24:2 AM', '    -    ', '    -    ', '    -    '),
(16, 1, '15/1/2014', 'Wednesday', '0:48:0 PM', '    -    ', '    -    ', '    -    '),
(17, 1, '15/1/2014', 'Wednesday', '1:20:44 PM', '    -    ', '    -    ', '    -    '),
(18, 1, '15/1/2014', 'Wednesday', '2:12:31 PM', '    -    ', '    -    ', '    -    '),
(19, 1, '15/1/2014', 'Wednesday', '2:13:21 PM', '    -    ', '    -    ', '    -    '),
(20, 1, '15/1/2014', 'Wednesday', '2:30:19 PM', '    -    ', '    -    ', '    -    '),
(21, 1, '15/1/2014', 'Wednesday', '2:31:16 PM', '    -    ', '    -    ', '    -    '),
(22, 1, '15/1/2014', 'Wednesday', '2:32:52 PM', '    -    ', '    -    ', '    -    '),
(23, 1, '15/1/2014', 'Wednesday', '3:9:57 PM', '    -    ', '    -    ', '    -    '),
(24, 1, '16/1/2014', 'Thursday', '10:48:9 AM', '    -    ', '    -    ', '    -    '),
(25, 1, '15/1/2014', 'Wednesday', '11:32:2 AM', '    -    ', '    -    ', '    -    '),
(26, 1, '15/1/2014', 'Wednesday', '11:41:25 AM', '    -    ', '    -    ', '    -    '),
(27, 1, '15/1/2014', 'Wednesday', '11:47:9 AM', '    -    ', '    -    ', '    -    '),
(28, 1, '15/1/2014', 'Wednesday', '11:49:1 AM', '    -    ', '    -    ', '    -    '),
(29, 1, '15/1/2014', 'Wednesday', '11:51:4 AM', '    -    ', '    -    ', '    -    '),
(30, 1, '15/1/2014', 'Wednesday', '11:52:45 AM', '    -    ', '    -    ', '    -    '),
(31, 1, '15/1/2014', 'Wednesday', '11:56:11 AM', '    -    ', '    -    ', '    -    '),
(32, 1, '15/1/2014', 'Wednesday', '11:58:14 AM', '    -    ', '    -    ', '    -    '),
(33, 1, '15/1/2014', 'Wednesday', '0:3:5 PM', '    -    ', '    -    ', '    -    '),
(34, 1, '15/1/2014', 'Wednesday', '0:34:42 PM', '    -    ', '    -    ', '    -    '),
(35, 1, '15/1/2014', 'Wednesday', '0:34:42 PM', '    -    ', '    -    ', '    -    '),
(36, 1, '15/1/2014', 'Wednesday', '0:36:4 PM', '    -    ', '    -    ', '    -    '),
(37, 1, '15/1/2014', 'Wednesday', '0:37:45 PM', '    -    ', '    -    ', '    -    '),
(38, 1, '15/1/2014', 'Wednesday', '1:11:27 PM', '    -    ', '    -    ', '    -    '),
(39, 1, '15/1/2014', 'Wednesday', '2:24:32 PM', '    -    ', '    -    ', '    -    '),
(40, 1, '15/1/2014', 'Wednesday', '2:30:27 PM', '    -    ', '    -    ', '    -    '),
(41, 1, '15/1/2014', 'Wednesday', '3:7:4 PM', '    -    ', '    -    ', '    -    '),
(42, 1, '15/1/2014', 'Wednesday', '3:13:48 PM', '    -    ', '    -    ', '    -    '),
(43, 1, '15/1/2014', 'Wednesday', '3:24:0 PM', '    -    ', '    -    ', '    -    '),
(44, 1, '15/1/2014', 'Wednesday', '3:26:41 PM', '    -    ', '    -    ', '    -    '),
(45, 1, '15/1/2014', 'Wednesday', '3:30:23 PM', '    -    ', '    -    ', '    -    '),
(46, 1, '15/1/2014', 'Wednesday', '3:53:3 PM', '    -    ', '    -    ', '    -    '),
(47, 1, '15/1/2014', 'Wednesday', '3:57:40 PM', '    -    ', '    -    ', '    -    '),
(48, 1, '15/1/2014', 'Wednesday', '4:4:31 PM', '    -    ', '    -    ', '    -    '),
(49, 1, '15/1/2014', 'Wednesday', '4:6:36 PM', '    -    ', '    -    ', '    -    '),
(50, 1, '15/1/2014', 'Wednesday', '4:38:55 PM', '    -    ', '    -    ', '    -    '),
(51, 1, '15/1/2014', 'Wednesday', '4:42:7 PM', '    -    ', '    -    ', '    -    '),
(52, 1, '17/1/2014', 'Friday', '10:58:28 AM', '    -    ', '    -    ', '    -    '),
(53, 1, '17/1/2014', 'Friday', '11:20:43 AM', '    -    ', '    -    ', '    -    '),
(54, 1, '17/1/2014', 'Friday', '11:24:17 AM', '    -    ', '    -    ', '    -    '),
(55, 1, '17/1/2014', 'Friday', '11:28:37 AM', '    -    ', '    -    ', '    -    '),
(56, 1, '17/1/2014', 'Friday', '11:40:9 AM', '    -    ', '    -    ', '    -    '),
(57, 1, '17/1/2014', 'Friday', '11:46:14 AM', '    -    ', '    -    ', '    -    '),
(58, 1, '17/1/2014', 'Friday', '11:49:2 AM', '    -    ', '    -    ', '    -    '),
(59, 4, '17/1/2014', 'Friday', '11:52:46 AM', '    -    ', '    -    ', '    -    '),
(60, 1, '17/1/2014', 'Friday', '0:12:4 PM', '    -    ', '    -    ', '    -    '),
(61, 1, '17/1/2014', 'Friday', '0:20:33 PM', '    -    ', '    -    ', '    -    '),
(62, 1, '17/1/2014', 'Friday', '0:21:58 PM', '    -    ', '    -    ', '    -    '),
(63, 1, '17/1/2014', 'Friday', '0:22:53 PM', '    -    ', '    -    ', '    -    '),
(64, 1, '17/1/2014', 'Friday', '0:37:3 PM', '    -    ', '    -    ', '    -    '),
(65, 1, '17/1/2014', 'Friday', '0:53:32 PM', '    -    ', '    -    ', '    -    '),
(66, 1, '17/1/2014', 'Friday', '1:2:55 PM', '    -    ', '    -    ', '    -    '),
(67, 1, '17/1/2014', 'Friday', '1:4:54 PM', '    -    ', '    -    ', '    -    '),
(68, 4, '17/1/2014', 'Friday', '1:20:46 PM', '    -    ', '    -    ', '    -    '),
(69, 5, '17/1/2014', 'Friday', '1:29:2 PM', '    -    ', '    -    ', '    -    '),
(70, 5, '17/1/2014', 'Friday', '1:32:52 PM', '    -    ', '    -    ', '    -    '),
(71, 6, '17/1/2014', 'Friday', '1:35:56 PM', '    -    ', '    -    ', '    -    '),
(72, 4, '17/1/2014', 'Friday', '1:36:50 PM', '    -    ', '    -    ', '    -    '),
(73, 1, '18/1/2014', 'Satuarday', '3:48:21 PM', '    -    ', '    -    ', '    -    '),
(74, 1, '18/1/2014', 'Satuarday', '9:48:44 AM', '    -    ', '    -    ', '    -    '),
(75, 1, '18/1/2014', 'Satuarday', '9:52:16 AM', '    -    ', '    -    ', '    -    '),
(76, 1, '18/1/2014', 'Satuarday', '9:57:9 AM', '    -    ', '    -    ', '    -    '),
(77, 1, '18/1/2014', 'Satuarday', '4:16:32 PM', '    -    ', '    -    ', '    -    '),
(78, 4, '18/1/2014', 'Satuarday', '4:17:31 PM', '    -    ', '    -    ', '    -    '),
(79, 1, '18/1/2014', 'Satuarday', '5:35:35 PM', '    -    ', '    -    ', '    -    '),
(80, 1, '18/1/2014', 'Satuarday', '8:29:23 PM', '    -    ', '    -    ', '    -    '),
(81, 1, '18/1/2014', 'Satuarday', '8:57:30 PM', '    -    ', '    -    ', '    -    '),
(82, 1, '18/1/2014', 'Satuarday', '11:21:26 PM', '    -    ', '    -    ', '    -    '),
(83, 1, '18/1/2014', 'Satuarday', '11:22:36 PM', '    -    ', '    -    ', '    -    '),
(84, 1, '19/1/2014', 'Sunday', '10:11:32 AM', '    -    ', '    -    ', '    -    '),
(85, 1, '19/1/2014', 'Sunday', '10:16:48 AM', '    -    ', '    -    ', '    -    '),
(86, 1, '19/1/2014', 'Sunday', '10:51:48 AM', '    -    ', '    -    ', '    -    '),
(87, 1, '19/1/2014', 'Sunday', '10:53:49 AM', '    -    ', '    -    ', '    -    '),
(88, 1, '19/1/2014', 'Sunday', '11:5:13 AM', '    -    ', '    -    ', '    -    '),
(89, 1, '19/1/2014', 'Sunday', '1:14:53 PM', '    -    ', '    -    ', '    -    '),
(90, 1, '19/1/2014', 'Sunday', '1:19:31 PM', '    -    ', '    -    ', '    -    '),
(91, 1, '19/1/2014', 'Sunday', '3:4:10 PM', '    -    ', '    -    ', '    -    '),
(92, 1, '19/1/2014', 'Sunday', '4:50:28 PM', '    -    ', '    -    ', '    -    '),
(93, 1, '19/1/2014', 'Sunday', '5:10:16 PM', '    -    ', '    -    ', '    -    '),
(94, 1, '19/1/2014', 'Sunday', '5:14:28 PM', '    -    ', '    -    ', '    -    '),
(95, 1, '19/1/2014', 'Sunday', '6:18:28 PM', '    -    ', '    -    ', '    -    '),
(96, 1, '20/1/2014', 'Monday', '10:18:12 AM', '    -    ', '    -    ', '    -    '),
(97, 1, '20/1/2014', 'Monday', '11:33:3 AM', '    -    ', '    -    ', '    -    '),
(98, 1, '20/1/2014', 'Monday', '11:47:46 AM', '    -    ', '    -    ', '    -    '),
(99, 1, '20/1/2014', 'Monday', '11:56:18 AM', '    -    ', '    -    ', '    -    '),
(100, 1, '20/1/2014', 'Monday', '11:57:21 AM', '    -    ', '    -    ', '    -    '),
(101, 1, '20/1/2014', 'Monday', '0:7:25 PM', '    -    ', '    -    ', '    -    '),
(102, 1, '20/1/2014', 'Monday', '0:25:34 PM', '    -    ', '    -    ', '    -    '),
(103, 1, '20/1/2014', 'Monday', '0:30:59 PM', '    -    ', '    -    ', '    -    '),
(104, 1, '20/1/2014', 'Monday', '0:57:58 PM', '    -    ', '    -    ', '    -    '),
(105, 1, '20/1/2014', 'Monday', '0:58:29 PM', '    -    ', '    -    ', '    -    '),
(106, 1, '20/1/2014', 'Monday', '1:51:43 PM', '    -    ', '    -    ', '    -    '),
(107, 1, '20/1/2014', 'Monday', '1:56:16 PM', '    -    ', '    -    ', '    -    '),
(108, 1, '20/1/2014', 'Monday', '1:56:43 PM', '    -    ', '    -    ', '    -    '),
(109, 1, '20/1/2014', 'Monday', '1:58:16 PM', '    -    ', '    -    ', '    -    '),
(110, 1, '20/1/2014', 'Monday', '1:58:31 PM', '    -    ', '    -    ', '    -    '),
(111, 1, '20/1/2014', 'Monday', '1:58:49 PM', '    -    ', '    -    ', '    -    '),
(112, 1, '20/1/2014', 'Monday', '1:59:5 PM', '    -    ', '    -    ', '    -    '),
(113, 1, '20/1/2014', 'Monday', '1:59:22 PM', '    -    ', '    -    ', '    -    '),
(114, 1, '20/1/2014', 'Monday', '4:28:25 PM', '    -    ', '    -    ', '    -    '),
(115, 1, '20/1/2014', 'Monday', '4:31:12 PM', '    -    ', '    -    ', '    -    '),
(116, 10, '20/1/2014', 'Monday', '4:34:33 PM', '    -    ', '    -    ', '    -    '),
(117, 11, '20/1/2014', 'Monday', '4:48:55 PM', '    -    ', '    -    ', '    -    '),
(118, 2, '20/1/2014', 'Monday', '5:1:7 PM', '    -    ', '    -    ', '    -    '),
(119, 1, '20/1/2014', 'Monday', '5:12:54 PM', '    -    ', '    -    ', '    -    '),
(120, 4, '20/1/2014', 'Monday', '5:13:57 PM', '    -    ', '    -    ', '    -    '),
(121, 5, '20/1/2014', 'Monday', '5:14:37 PM', '    -    ', '    -    ', '    -    ');

-- --------------------------------------------------------

--
-- Table structure for table `voting_candidate`
--

CREATE TABLE IF NOT EXISTS `voting_candidate` (
  `idVotingCandidate` int(200) NOT NULL AUTO_INCREMENT,
  `fidVotingSchedule` int(200) NOT NULL,
  `partyName` varchar(20) NOT NULL,
  `partyLeader` varchar(20) NOT NULL,
  `voteCount` int(200) NOT NULL,
  PRIMARY KEY (`idVotingCandidate`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `voting_candidate`
--

INSERT INTO `voting_candidate` (`idVotingCandidate`, `fidVotingSchedule`, `partyName`, `partyLeader`, `voteCount`) VALUES
(1, 1, 'JIS', 'Sukanta', 0),
(2, 1, 'Webel', 'Srobona', 0),
(3, 2, 'JIS', 'Sukanta', 0),
(4, 2, 'Webel', 'Panchu', 0),
(5, 2, 'Debraj', 'Srobona', 0),
(6, 2, 'Globsyn', 'Vikash', 0),
(7, 3, 'Webel', 'Panchu', 0),
(8, 3, 'Debraj', 'Srobona', 0),
(9, 3, 'Debraj', 'Panchu', 0),
(10, 3, 'Webelfdd', 'Srobonadsfsf', 0),
(11, 4, 'aaaa', '1111', 0),
(12, 4, 'bbbb', '2222', 0),
(13, 5, 'aaaa', '1111', 0),
(14, 5, 'bbbb', '2222', 0),
(15, 6, 'JIS', 'Sukanta', 0),
(16, 6, 'webel', 'vikash', 0),
(17, 7, 'ccc', '333', 0),
(18, 7, 'ddd', '444', 0),
(19, 8, 'xxx', 'XXX', 0),
(20, 8, 'yyy', 'YYY', 0),
(21, 9, '1234', 'abcd', 0),
(22, 9, '5678', 'efgh', 0),
(23, 9, '910', 'ij', 0),
(24, 10, '2nd1', '2nda', 0),
(25, 10, '2nd2', '2ndb', 0),
(26, 11, '3rd1', '3rda', 0),
(27, 11, '3rd2', '3rdb', 0),
(28, 12, '1stcat1', '1stcata', 0),
(29, 12, '1stcat2', '1stcatb', 0),
(30, 13, '2ndcat1', '2ndcata', 0),
(31, 13, '2ndcat2', '2ndcatb', 0),
(32, 14, 'jis1', 'jisa', 0),
(33, 14, 'jis2', 'jisb', 0),
(34, 14, 'jis3', 'jisc', 0),
(35, 15, 'party1', 'leader1', 0),
(36, 15, 'party2', 'leader2', 0),
(37, 15, 'party3', 'leader3', 0),
(38, 16, 'vote pary name 1', 'vote leader 1', 0),
(39, 16, 'vote pary name 2', 'vote leader 2', 0),
(40, 17, 'Man', 'Sukanta', 0),
(41, 17, 'Woman', 'Sharma', 0),
(42, 17, '3rd Person', 'Singular Number', 0),
(43, 18, 'p1', 'l1', 0),
(44, 18, 'p2', 'l2', 0),
(45, 19, 'BJP', 'Modi', 0),
(46, 19, 'AAM AADMI', 'Arbind Kegiriwal', 0),
(47, 20, 'AAP', 'Arbind Kegiriwal', 0),
(48, 20, 'BJP', 'LALIT MODI', 0);

-- --------------------------------------------------------

--
-- Table structure for table `voting_schedule`
--

CREATE TABLE IF NOT EXISTS `voting_schedule` (
  `idVotingSchedule` int(200) NOT NULL AUTO_INCREMENT,
  `fidAdminRegistrationInformation` int(200) NOT NULL,
  `electionDate` date NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `voteName` varchar(50) NOT NULL,
  PRIMARY KEY (`idVotingSchedule`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `voting_schedule`
--

INSERT INTO `voting_schedule` (`idVotingSchedule`, `fidAdminRegistrationInformation`, `electionDate`, `startTime`, `endTime`, `voteName`) VALUES
(1, 1, '2014-01-24', '01:09:00', '17:30:00', 'a'),
(2, 1, '1994-07-09', '07:30:00', '20:30:00', 'b'),
(3, 1, '2014-01-12', '07:00:00', '13:00:00', 'c'),
(4, 1, '2014-01-14', '06:00:00', '17:00:00', 'd'),
(5, 19, '2014-01-14', '00:00:00', '05:00:00', 'e'),
(6, 1, '2014-01-15', '00:00:00', '20:00:00', 'f'),
(7, 1, '2014-01-15', '01:00:00', '21:00:00', 'g'),
(8, 1, '2014-01-15', '02:00:00', '22:00:00', 'h'),
(9, 1, '2014-01-17', '00:00:00', '23:00:00', 'i'),
(10, 1, '2014-01-17', '00:00:00', '23:00:00', 'j'),
(11, 1, '2014-01-17', '00:00:00', '10:00:00', 'k'),
(12, 19, '2014-01-17', '00:00:00', '23:00:00', 'l'),
(13, 19, '2014-01-17', '00:00:00', '23:00:00', 'm'),
(14, 1, '2014-01-17', '00:00:00', '19:00:00', 'n'),
(15, 1, '2014-01-18', '16:15:00', '16:20:00', 'President Election'),
(16, 1, '2014-01-18', '20:58:00', '21:30:00', 'Vote Name'),
(17, 1, '2014-01-20', '12:08:00', '12:45:00', 'Tarung Sangha'),
(18, 1, '2014-01-20', '12:13:00', '12:40:00', 'vote name'),
(19, 24, '2014-01-20', '04:50:00', '17:00:00', 'ChifeMinister'),
(20, 1, '2014-01-20', '10:00:00', '20:00:00', 'PRESIDENT ELECTION');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
