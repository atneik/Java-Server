-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 10, 2012 at 09:16 PM
-- Server version: 5.5.20
-- PHP Version: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `adflydatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

CREATE TABLE IF NOT EXISTS `advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `category` varchar(50) NOT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `advertisement`
--

INSERT INTO `advertisement` (`id`, `product_name`, `description`, `category`, `image_url`, `uid`) VALUES
(2, 'home loan', 'icici home loans', 'banking', NULL, 1),
(3, 'notebook', 'notebook description', 'educational', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `space`
--

CREATE TABLE IF NOT EXISTS `space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(50) NOT NULL,
  `site_description` varchar(300) NOT NULL,
  `price` double NOT NULL,
  `category` varchar(50) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `space`
--

INSERT INTO `space` (`id`, `site_name`, `site_description`, `price`, `category`, `uid`) VALUES
(1, 'mymail', 'mymail description', 10, 'mail', 2),
(2, 'javatut', 'javatut description', 5, 'educational', 1);

-- --------------------------------------------------------

--
-- Table structure for table `space_add`
--

CREATE TABLE IF NOT EXISTS `space_add` (
  `aid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `remaining_displays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `space_add`
--

INSERT INTO `space_add` (`aid`, `sid`, `remaining_displays`) VALUES
(1, 1, 15),
(2, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`) VALUES
(1, 'Sanjana', 'sanjana@gmail.com'),
(2, 'Aniket', 'aniket@gmail.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD CONSTRAINT `advertisement_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`);

--
-- Constraints for table `space`
--
ALTER TABLE `space`
  ADD CONSTRAINT `space_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
