-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 02, 2014 at 09:49 PM
-- Server version: 5.5.34-0ubuntu0.13.04.1
-- PHP Version: 5.4.9-4ubuntu2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rentable`
--

-- --------------------------------------------------------

--
-- Table structure for table `Book`
--

CREATE TABLE IF NOT EXISTS `Book` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `abstract` varchar(255) DEFAULT NULL,
  `author` tinytext,
  `publisher` tinytext,
  `subject` tinytext,
  `ranting` int(10) DEFAULT NULL,
  `link` varchar(150) DEFAULT NULL,
  `Languageid` int(10) NOT NULL,
  `UserId` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBook121789` (`Languageid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `Bookid` int(10) NOT NULL,
  `Languageid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcategory556514` (`Languageid`),
  KEY `FKcategory40710` (`Bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `countries` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Genre`
--

CREATE TABLE IF NOT EXISTS `Genre` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Language`
--

CREATE TABLE IF NOT EXISTS `Language` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `language` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `MovieCD`
--

CREATE TABLE IF NOT EXISTS `MovieCD` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `ranting` int(10) DEFAULT NULL,
  `director` tinytext,
  `writer` tinytext,
  `description` varchar(255) DEFAULT NULL,
  `country` int(10) DEFAULT NULL,
  `runtime` int(10) DEFAULT NULL,
  `premier` int(10) DEFAULT NULL,
  `link` varchar(150) DEFAULT NULL,
  `Languageid` int(10) NOT NULL,
  `Genreid` int(10) NOT NULL,
  `UserId` int(10) NOT NULL,
  `countryid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKMovieCD865838` (`countryid`),
  KEY `FKMovieCD949815` (`Genreid`),
  KEY `FKMovieCD578119` (`Languageid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `MusicCD`
--

CREATE TABLE IF NOT EXISTS `MusicCD` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `album` tinytext,
  `year` int(10) DEFAULT NULL,
  `language` tinytext,
  `publisher` tinytext,
  `singer` tinytext,
  `runtime` int(10) DEFAULT NULL,
  `link` varchar(150) DEFAULT NULL,
  `Languageid` int(10) NOT NULL,
  `Typeid` int(10) NOT NULL,
  `UserId` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKMusicCD39017` (`Typeid`),
  KEY `FKMusicCD575529` (`Languageid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Type`
--

CREATE TABLE IF NOT EXISTS `Type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Book`
--
ALTER TABLE `Book`
  ADD CONSTRAINT `FKBook121789` FOREIGN KEY (`Languageid`) REFERENCES `Language` (`id`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FKcategory40710` FOREIGN KEY (`Bookid`) REFERENCES `Book` (`id`),
  ADD CONSTRAINT `FKcategory556514` FOREIGN KEY (`Languageid`) REFERENCES `Language` (`id`);

--
-- Constraints for table `MovieCD`
--
ALTER TABLE `MovieCD`
  ADD CONSTRAINT `FKMovieCD578119` FOREIGN KEY (`Languageid`) REFERENCES `Language` (`id`),
  ADD CONSTRAINT `FKMovieCD865838` FOREIGN KEY (`countryid`) REFERENCES `country` (`id`),
  ADD CONSTRAINT `FKMovieCD949815` FOREIGN KEY (`Genreid`) REFERENCES `Genre` (`id`);

--
-- Constraints for table `MusicCD`
--
ALTER TABLE `MusicCD`
  ADD CONSTRAINT `FKMusicCD39017` FOREIGN KEY (`Typeid`) REFERENCES `Type` (`id`),
  ADD CONSTRAINT `FKMusicCD575529` FOREIGN KEY (`Languageid`) REFERENCES `Language` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
