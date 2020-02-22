-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 22, 2020 at 06:47 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cst-256-milestone`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `IDADDRESS` int(11) NOT NULL,
  `STREET` varchar(45) DEFAULT NULL,
  `CITY` varchar(45) DEFAULT NULL,
  `STATE` varchar(45) DEFAULT NULL,
  `ZIP` int(5) DEFAULT NULL,
  `USERS_IDUSERS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`IDADDRESS`, `STREET`, `CITY`, `STATE`, `ZIP`, `USERS_IDUSERS`) VALUES
(1, 'somewhere', 'Glendale', 'Arizona', 85301, 1),
(3, 'example', 'City', 'State', 987, 10),
(4, NULL, NULL, NULL, NULL, 11),
(5, NULL, NULL, NULL, NULL, 14),
(6, NULL, NULL, NULL, NULL, 15);

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `IDEDUCATION` int(11) NOT NULL,
  `SCHOOL` varchar(50) NOT NULL,
  `DEGREE` varchar(45) NOT NULL,
  `FIELD` varchar(45) NOT NULL,
  `GPA` float NOT NULL,
  `STARTYEAR` int(11) NOT NULL,
  `ENDYEAR` int(11) NOT NULL,
  `USERS_IDUSERS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`IDEDUCATION`, `SCHOOL`, `DEGREE`, `FIELD`, `GPA`, `STARTYEAR`, `ENDYEAR`, `USERS_IDUSERS`) VALUES
(1, 'Grand Canyon University', 'Computer Programming', 'Computer Science', 3.8, 2017, 2021, 1),
(5, 'test', 'test', 'etst', 3, 2019, 2020, 10),
(7, 'test', 'test', 'test', 3.9, 2018, 2019, 1);

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `IDEXPERIENCE` int(11) NOT NULL,
  `TITLE` varchar(45) NOT NULL,
  `COMPANY` varchar(45) NOT NULL,
  `CURRENT` int(11) NOT NULL,
  `STARTYEAR` varchar(45) NOT NULL,
  `ENDYEAR` varchar(45) DEFAULT NULL,
  `DESCRIPTION` text,
  `USERS_IDUSERS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`IDEXPERIENCE`, `TITLE`, `COMPANY`, `CURRENT`, `STARTYEAR`, `ENDYEAR`, `DESCRIPTION`, `USERS_IDUSERS`) VALUES
(1, 'testing', 'testing', 0, '2018', '2019', 'this is a test job', 1),
(7, 'test', 'test', 0, '2019', '2020', 'testing', 10),
(9, 'tester', 'testers testing', 1, '2020', NULL, 'this is a test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jobapplicants`
--

CREATE TABLE `jobapplicants` (
  `JOBS_IDJOBS` int(11) NOT NULL,
  `USERS_IDUSERS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `IDJOBS` int(11) NOT NULL,
  `TITLE` varchar(45) NOT NULL,
  `COMPANY` varchar(45) NOT NULL,
  `STATE` varchar(45) NOT NULL,
  `CITY` varchar(45) NOT NULL,
  `DESCRIPTION` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`IDJOBS`, `TITLE`, `COMPANY`, `STATE`, `CITY`, `DESCRIPTION`) VALUES
(9, 'Job 5', 'Company 2', 'Arizona', 'Phoenix', 'this is a job'),
(10, 'Job 3', 'Company 4', 'California', 'Newport Beach', 'Beach job here');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `IDSKILLS` int(11) NOT NULL,
  `SKILL` varchar(45) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `USERS_IDUSERS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`IDSKILLS`, `SKILL`, `DESCRIPTION`, `USERS_IDUSERS`) VALUES
(9, 'test', 'test', 10),
(10, 'PHP', 'I have a good deal of experience with creating php applications', 1),
(12, 'Java', 'Can make java stuff sometimes', 1),
(15, 'HTML', 'experience with HTML', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `IDUSERS` int(11) NOT NULL,
  `USERNAME` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `FIRSTNAME` varchar(100) NOT NULL,
  `LASTNAME` varchar(100) NOT NULL,
  `STATUS` int(11) NOT NULL DEFAULT '1',
  `ROLE` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`IDUSERS`, `USERNAME`, `PASSWORD`, `EMAIL`, `FIRSTNAME`, `LASTNAME`, `STATUS`, `ROLE`) VALUES
(1, 'tester', 'testing', 'tester@testing.test', 'tester', 'tester', 1, 1),
(10, 'Jacob', 'Ward', 'test@test.test', 'test', 'testing', 1, 0),
(11, 'testing', 'testing', 'test@test.test', 'testing', 'testing', 1, 0),
(14, 'username', 'password', 'test@test.test', 'testing', 'testing', 1, 0),
(15, 'testone', 'test', 'test@test.test', 'testing', 'testing', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `IDUSER_INFO` int(11) NOT NULL,
  `DESCRIPTION` mediumtext,
  `PHONE` varchar(45) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `GENDER` varchar(45) DEFAULT NULL,
  `USERS_IDUSERS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`IDUSER_INFO`, `DESCRIPTION`, `PHONE`, `AGE`, `GENDER`, `USERS_IDUSERS`) VALUES
(3, 'this is an admin account for testing', '4441115555', 18, 'Male', 1),
(5, 'this is just a test user', '123985', 12, 'Female', 10),
(6, NULL, NULL, NULL, NULL, 11),
(7, NULL, NULL, NULL, NULL, 14),
(8, NULL, NULL, NULL, NULL, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`IDADDRESS`),
  ADD KEY `fk_ADDRESS_USERS_idx` (`USERS_IDUSERS`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`IDEDUCATION`),
  ADD KEY `fk_EDUCATION_USERS1_idx` (`USERS_IDUSERS`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`IDEXPERIENCE`),
  ADD KEY `fk_EXPERIENCE_USERS1_idx` (`USERS_IDUSERS`);

--
-- Indexes for table `jobapplicants`
--
ALTER TABLE `jobapplicants`
  ADD PRIMARY KEY (`JOBS_IDJOBS`,`USERS_IDUSERS`),
  ADD KEY `fk_JOBS_has_USERS_USERS1_idx` (`USERS_IDUSERS`),
  ADD KEY `fk_JOBS_has_USERS_JOBS1_idx` (`JOBS_IDJOBS`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`IDJOBS`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`IDSKILLS`),
  ADD KEY `fk_SKILLS_USERS1_idx` (`USERS_IDUSERS`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`IDUSERS`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`IDUSER_INFO`),
  ADD KEY `fk_USER_INFO_USERS1_idx` (`USERS_IDUSERS`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `IDADDRESS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `IDEDUCATION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `IDEXPERIENCE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `IDJOBS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `IDSKILLS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `IDUSERS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `IDUSER_INFO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_ADDRESS_USERS` FOREIGN KEY (`USERS_IDUSERS`) REFERENCES `users` (`IDUSERS`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `fk_EDUCATION_USERS1` FOREIGN KEY (`USERS_IDUSERS`) REFERENCES `users` (`IDUSERS`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `fk_EXPERIENCE_USERS1` FOREIGN KEY (`USERS_IDUSERS`) REFERENCES `users` (`IDUSERS`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `jobapplicants`
--
ALTER TABLE `jobapplicants`
  ADD CONSTRAINT `fk_JOBS_has_USERS_JOBS1` FOREIGN KEY (`JOBS_IDJOBS`) REFERENCES `jobs` (`IDJOBS`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_JOBS_has_USERS_USERS1` FOREIGN KEY (`USERS_IDUSERS`) REFERENCES `users` (`IDUSERS`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `fk_SKILLS_USERS1` FOREIGN KEY (`USERS_IDUSERS`) REFERENCES `users` (`IDUSERS`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_info`
--
ALTER TABLE `user_info`
  ADD CONSTRAINT `fk_USER_INFO_USERS1` FOREIGN KEY (`USERS_IDUSERS`) REFERENCES `users` (`IDUSERS`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
