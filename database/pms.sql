-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2017 at 02:37 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `userid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`userid`, `username`, `password`) VALUES
(1, 'suren', 'suren123'),
(4, 'vikas', 'vikas123'),
(7, 'pms', 'pms123');

-- --------------------------------------------------------

--
-- Table structure for table `case`
--

CREATE TABLE `case` (
  `CID` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `PRISONER_NAME` varchar(30) NOT NULL,
  `CASE_TYPE` varchar(30) NOT NULL,
  `DESCRIPTION` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `case`
--

INSERT INTO `case` (`CID`, `PID`, `PRISONER_NAME`, `CASE_TYPE`, `DESCRIPTION`) VALUES
(3, 58, 'deepali', 'murderer', 'Murdered his husband'),
(4, 54, 'Dinesh', 'Murderer', 'Serial killer,killed 5 people in Mumbai');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FID` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `PRISONER_NAME` varchar(30) NOT NULL,
  `DATE` date NOT NULL,
  `ESCAPE_ATTEMPTS` int(11) NOT NULL,
  `JOB_PERFORMANCE` varchar(30) NOT NULL,
  `COMMENTS` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prisoner`
--

CREATE TABLE `prisoner` (
  `PID` int(11) NOT NULL,
  `PRISONER_NAME` varchar(30) NOT NULL,
  `AGE` int(11) NOT NULL,
  `SEX` varchar(6) NOT NULL,
  `TYPE` varchar(30) NOT NULL,
  `ADDRESS` text NOT NULL,
  `ENTRY_DATE` date NOT NULL,
  `RELEASE_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prisoner`
--

INSERT INTO `prisoner` (`PID`, `PRISONER_NAME`, `AGE`, `SEX`, `TYPE`, `ADDRESS`, `ENTRY_DATE`, `RELEASE_DATE`) VALUES
(54, 'Dinesh', 29, 'Male', 'rapist', 'Delhi', '2014-12-02', '2017-12-01'),
(55, 'bikash', 27, 'Male', 'Robbery', 'Jharkhand,India', '2016-02-04', '2023-01-03'),
(56, 'Sophia', 24, 'Female', 'Thief', 'Chennai', '2016-05-14', '2025-12-12'),
(57, 'Amrit', 32, 'Male', 'terrorist', 'Patna,Bihar', '2017-12-31', '2025-12-13'),
(58, 'Deepali', 25, 'Female', 'murderer', 'Bangalore', '2015-09-30', '2035-06-24');

--
-- Triggers `prisoner`
--
DELIMITER $$
CREATE TRIGGER `createhistory` BEFORE DELETE ON `prisoner` FOR EACH ROW INSERT INTO `prisonerbackup` SET `PID`= OLD.PID,`pname`= OLD.PRISONER_NAME,`PAGE`= OLD.AGE,`PSEX`= OLD.SEX,`PTYPE`= OLD.TYPE,`PADDRESS`= OLD.ADDRESS,`PENTRY`= OLD.ENTRY_DATE,`PRELEASE`= OLD.RELEASE_DATE
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prisonerbackup`
--

CREATE TABLE `prisonerbackup` (
  `PID` int(11) NOT NULL,
  `PNAME` varchar(30) NOT NULL,
  `PAGE` int(11) NOT NULL,
  `PSEX` varchar(30) NOT NULL,
  `PTYPE` varchar(30) NOT NULL,
  `PADDRESS` text NOT NULL,
  `PENTRY` date NOT NULL,
  `PRELEASE` date NOT NULL,
  `DELETION_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prisonerbackup`
--

INSERT INTO `prisonerbackup` (`PID`, `PNAME`, `PAGE`, `PSEX`, `PTYPE`, `PADDRESS`, `PENTRY`, `PRELEASE`, `DELETION_TIME`) VALUES
(26, 'David', 49, 'male', 'murderer', 'Delhi', '2017-11-02', '2017-11-30', '2017-11-06 17:15:17'),
(52, 'Anil', 21, 'Male', 'terrorist', 'Kashmir,India', '2017-11-01', '2017-11-30', '2017-11-07 06:19:43'),
(53, 'Bishal', 21, 'Male', 'murderer', 'Butwal,Nepal', '2017-11-02', '2037-11-30', '2017-11-06 18:43:26'),
(53, 'rajesh', 42, 'Male', 'Thief', 'Bangalore', '2017-12-31', '2042-12-31', '2017-11-07 06:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `SID` int(11) NOT NULL,
  `SNAME` varchar(30) NOT NULL,
  `AGE` int(11) NOT NULL,
  `SEX` varchar(6) NOT NULL,
  `ROLE` varchar(30) NOT NULL,
  `PHONENO` bigint(20) NOT NULL,
  `JOINDATE` date NOT NULL,
  `ADDRESS` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`SID`, `SNAME`, `AGE`, `SEX`, `ROLE`, `PHONENO`, `JOINDATE`, `ADDRESS`) VALUES
(2, 'suren', 25, 'male', 'inspector', 8088208830, '2017-10-01', 'Bangalore'),
(6, 'Divesh', 22, 'Male', 'SSP', 959586562, '2017-12-31', 'Nepalgunj,Nepal'),
(7, 'Vikas', 22, 'Male', 'Jailer', 959586532, '2015-12-01', 'Jammu,India'),
(8, 'vandana', 26, 'Female', 'ssp', 54535, '2017-11-13', 'bangalore');

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `PID` int(11) NOT NULL,
  `VISITOR_NAME` varchar(30) NOT NULL,
  `PRISONER_NAME` varchar(30) NOT NULL,
  `RELATION` varchar(30) NOT NULL,
  `DATE` date NOT NULL,
  `IN_TIME` time NOT NULL,
  `OUT_TIME` time NOT NULL,
  `ISSUING_AUTHORITY` varchar(30) NOT NULL,
  `SID` int(11) NOT NULL,
  `VISITOR_ADDRESS` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`PID`, `VISITOR_NAME`, `PRISONER_NAME`, `RELATION`, `DATE`, `IN_TIME`, `OUT_TIME`, `ISSUING_AUTHORITY`, `SID`, `VISITOR_ADDRESS`) VALUES
(56, 'Sushant', 'Sophia', 'brother', '2017-11-09', '17:58:00', '18:33:00', 'Anil', 2, 'Pune');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `case`
--
ALTER TABLE `case`
  ADD PRIMARY KEY (`CID`),
  ADD KEY `case_ibfk_1` (`PID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FID`),
  ADD KEY `PID` (`PID`);

--
-- Indexes for table `prisoner`
--
ALTER TABLE `prisoner`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `prisonerbackup`
--
ALTER TABLE `prisonerbackup`
  ADD PRIMARY KEY (`PID`,`PNAME`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`SID`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`PID`,`VISITOR_NAME`),
  ADD KEY `visitor_ibfk_2` (`SID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `case`
--
ALTER TABLE `case`
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `FID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prisoner`
--
ALTER TABLE `prisoner`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `SID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `case`
--
ALTER TABLE `case`
  ADD CONSTRAINT `case_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `prisoner` (`PID`) ON DELETE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `prisoner` (`PID`) ON DELETE CASCADE;

--
-- Constraints for table `visitor`
--
ALTER TABLE `visitor`
  ADD CONSTRAINT `visitor_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `prisoner` (`PID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `visitor_ibfk_2` FOREIGN KEY (`SID`) REFERENCES `staff` (`SID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
