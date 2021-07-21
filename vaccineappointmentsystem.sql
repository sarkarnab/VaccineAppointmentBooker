-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2021 at 06:22 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vaccineappointmentsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `prescription` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appid`, `patientid`, `doctorid`, `date`, `time`, `prescription`) VALUES
(1, 3, 1, '2016-04-08', '10:00:00.000000', 'Covishield'),
(6, 3, 2, '2016-04-19', '17:00:00.000000', 'Covaxin'),
(9, 2, 2, '2016-04-17', '11:00:00.000000', ''),
(31, 1, 3, '2017-03-14', '09:30:00.000000', ''),
(34, 13, 2, '2021-07-01', '11:00:00.000000', ''),
(35, 13, 1, '2021-07-30', '17:30:00.000000', ''),
(36, 13, 3, '2021-07-30', '10:30:00.000000', ''),
(37, 1, 3, '2021-07-30', '12:30:00.000000', '');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `email` varchar(50) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `starttime` time(6) NOT NULL,
  `endtime` time(6) NOT NULL,
  `specialization` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`email`, `doctorid`, `starttime`, `endtime`, `specialization`) VALUES
('covaxin@test.com', 1, '10:00:00.000000', '18:00:00.000000', 'Covaxin'),
('covishield@test.com', 2, '09:00:00.000000', '12:00:00.000000', 'Covishield'),
('sputnik@test.com', 3, '08:00:00.000000', '16:00:00.000000', 'Sputnik');

-- --------------------------------------------------------

--
-- Table structure for table `doctorreview`
--

CREATE TABLE `doctorreview` (
  `docreviewid` int(10) NOT NULL,
  `appid` int(11) NOT NULL,
  `rating` int(5) NOT NULL,
  `review` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorreview`
--

INSERT INTO `doctorreview` (`docreviewid`, `appid`, `rating`, `review`) VALUES
(1, 1, 3, 'Good'),
(6, 6, 3, 'Better'),
(9, 9, 4, 'Best'),
(10, 34, 5, 'nice'),
(11, 31, 4, 'good');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `password`, `role`) VALUES
('arnabsarkarworld@gmail.com', '12345', 'patient'),
('arnabsarkarworld@outlook.com', '12345', 'receptionist'),
('covaxin@test.com', '12345', 'doctor'),
('covishield@test.com', '12345', 'doctor'),
('mainak.savecontact@gmail.com', '12345', 'patient'),
('sputnik@test.com', '12345', 'doctor'),
('test2@test.com', '12345', 'patient'),
('test@test.com', '12345', 'patient'),
('tuhinsarkarbolpur2000@gmail.com', '12345', 'patient');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientid` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `predoctor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientid`, `email`, `predoctor`) VALUES
(1, 'arnabsarkarworld@gmail.com', 'covaxin@test.com'),
(2, 'mainak.savecontact@gmail.com', 'covaxin@test.com'),
(3, 'tuhinsarkarbolpur2000@gmail.com', 'covishield@test.com'),
(13, 'test2@test.com', 'covishield@test.com');

-- --------------------------------------------------------

--
-- Table structure for table `paymenthistory`
--

CREATE TABLE `paymenthistory` (
  `paymendid` int(50) NOT NULL,
  `appid` int(50) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymenthistory`
--

INSERT INTO `paymenthistory` (`paymendid`, `appid`, `amount`) VALUES
(2, 1, 150);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `email` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phonenumber` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `streetaddress` varchar(200) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`email`, `fname`, `lname`, `gender`, `phonenumber`, `dob`, `streetaddress`, `city`, `state`, `pincode`, `role`) VALUES
('arnabsarkarworld@gmail.com', 'Arnab', 'Sarkar', 'Male', '9476409837', '1998-04-10', 'Makrampur', 'Bolpur', 'West Bengal', '731204', 'patient'),
('arnabsarkarworld@outlook.com', 'Arnab', 'Receptionist', 'Male', '1231231234', '1999-03-05', 'Makrampur', 'Bolpur', 'West Bengal', '731204', 'receptionist'),
('covaxin@test.com', 'Covaxin', 'Covaxin', 'Male', '1232345612', '1992-09-09', '1001 Ashford', 'Charlotte', 'NC', '28765', 'doctor'),
('covishield@test.com', 'Covishield', 'Covishield', 'Female', '9990099900', '1990-05-16', '9501', 'Charlotte', 'NC', '28262', 'doctor'),
('mainak.savecontact@gmail.com', 'Mainak', 'Sarkar', 'Male', '7001299161', '2000-04-05', 'Santiniketan', 'Bolpur', 'West Bengal', '731235', 'patient'),
('sputnik@test.com', 'Sputnik', 'V', 'Male', '1234567654', '1898-07-02', 'Cali street', 'New York', 'New York', '23451', 'doctor'),
('test2@test.com', 'g', 't', 'Male', '9475251384', '1995-05-10', 'f', 'g', 'West Bengal', '731235', 'patient'),
('test@test.com', 'Test', 'Test', 'Male', '7908344475', '1998-01-10', 'f', 'f', 'West Bengal', '731204', 'patient'),
('tuhinsarkarbolpur2000@gmail.com', 'Tuhin', 'Sarkar', 'Male', '7074783026', '1997-04-07', 'Santiniketan', 'Bolpur', 'West Bengal', '731235', 'patient');

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `email` varchar(50) NOT NULL,
  `receptionid` int(11) NOT NULL,
  `shift` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receptionist`
--

INSERT INTO `receptionist` (`email`, `receptionid`, `shift`) VALUES
('arnabsarkarworld@outlook.com', 1, 'morning');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appid`),
  ADD KEY `patientid` (`patientid`),
  ADD KEY `doctorid` (`doctorid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorid`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `doctorreview`
--
ALTER TABLE `doctorreview`
  ADD PRIMARY KEY (`docreviewid`),
  ADD UNIQUE KEY `appid` (`appid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientid`),
  ADD UNIQUE KEY `email_3` (`email`),
  ADD KEY `email` (`email`),
  ADD KEY `email_2` (`email`),
  ADD KEY `predoctor` (`predoctor`);

--
-- Indexes for table `paymenthistory`
--
ALTER TABLE `paymenthistory`
  ADD PRIMARY KEY (`paymendid`),
  ADD UNIQUE KEY `appid_2` (`appid`),
  ADD KEY `appid` (`appid`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`receptionid`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `doctorreview`
--
ALTER TABLE `doctorreview`
  MODIFY `docreviewid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `paymenthistory`
--
ALTER TABLE `paymenthistory`
  MODIFY `paymendid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `receptionist`
--
ALTER TABLE `receptionist`
  MODIFY `receptionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`email`) REFERENCES `person` (`email`);

--
-- Constraints for table `doctorreview`
--
ALTER TABLE `doctorreview`
  ADD CONSTRAINT `doctorreview_ibfk_1` FOREIGN KEY (`appid`) REFERENCES `appointment` (`appid`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`email`) REFERENCES `person` (`email`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`predoctor`) REFERENCES `doctor` (`email`);

--
-- Constraints for table `paymenthistory`
--
ALTER TABLE `paymenthistory`
  ADD CONSTRAINT `paymenthistory_ibfk_1` FOREIGN KEY (`appid`) REFERENCES `appointment` (`appid`);

--
-- Constraints for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD CONSTRAINT `receptionist_ibfk_1` FOREIGN KEY (`email`) REFERENCES `person` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
