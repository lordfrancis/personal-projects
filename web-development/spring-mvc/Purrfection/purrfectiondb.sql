-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 17, 2022 at 03:02 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `purrfectiondb`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(5) NOT NULL,
  `date` date DEFAULT NULL,
  `time_slot` varchar(50) DEFAULT NULL,
  `type` enum('consultation','vaccination') DEFAULT NULL,
  `status` enum('pending','done','cancelled') DEFAULT NULL,
  `owner_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `date`, `time_slot`, `type`, `status`, `owner_id`) VALUES
(4, '2022-12-22', '11:00 AM - 12:00 NN', 'vaccination', 'cancelled', 'user2'),
(5, '2022-12-06', '11:00 AM - 12:00 NN', 'vaccination', 'done', 'user2'),
(9, '2022-12-21', '9:00 AM - 10:00 AM', 'vaccination', 'done', 'user4'),
(10, '2022-12-16', '11:00 AM - 12:00 NN', 'consultation', 'pending', 'user4'),
(11, '2022-12-21', '1:00 PM - 2:00 PM', 'vaccination', 'pending', 'user4'),
(12, '2022-12-31', '1:00 PM - 2:00 PM', 'consultation', 'cancelled', 'john'),
(13, '2022-12-28', '4:00 PM - 5:00 PM', 'vaccination', 'done', 'john');

-- --------------------------------------------------------

--
-- Table structure for table `consultation`
--

CREATE TABLE `consultation` (
  `consultation_id` int(5) NOT NULL,
  `consul_date` date DEFAULT NULL,
  `findings` varchar(50) DEFAULT NULL,
  `recommendations` varchar(50) DEFAULT NULL,
  `pet_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consultation`
--

INSERT INTO `consultation` (`consultation_id`, `consul_date`, `findings`, `recommendations`, `pet_id`) VALUES
(1, '2022-12-23', 'Sakit tiyan diay', 'Pahiran haplas nga pau de arko', 24),
(6, '2022-12-21', 'Signs of Parvo Virus', 'Need CT Scan', 24),
(8, '2022-12-17', 'Sakit tiyan', 'Haplas', 28);

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `pet_id` int(5) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `pet_type` varchar(25) DEFAULT NULL,
  `breed` varchar(25) DEFAULT NULL,
  `owner_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`pet_id`, `name`, `pet_type`, `breed`, `owner_id`) VALUES
(20, 'zzzzzzzzzzzzzzz', 'zzzzzzzzzzzzzzz', 'zzzzzzzzzzzzzzzzzzzzzz', 'admin2'),
(23, 'Brando', 'Dog', 'Sitsu', 'admin3'),
(24, 'xxxx', 'xxx', 'xxx', 'user2'),
(25, 'ddd', 'ddd', 'dddd', 'user2'),
(26, 'qxx', 'wwewew', 'eses', 'user2'),
(27, 'qwe', 'qwe', 'qwe', 'user4'),
(28, 'Brownie', 'Dog', 'Husky', 'john'),
(30, 'Blacky', 'Cat', 'Pomeranian', 'john');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT '123456',
  `access_level` varchar(20) DEFAULT 'ROLE_USER' COMMENT 'ROLE_USER, ROLE_ADMIN',
  `fname` varchar(50) DEFAULT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `email` varchar(50) NOT NULL,
  `cnum` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `password`, `access_level`, `fname`, `mname`, `lname`, `enabled`, `email`, `cnum`) VALUES
('admin', 'admin', 'ROLE_ADMIN', 'qweqweqwe', 'qwewqewqe', 'qwewqewqe', 1, 'qwe@gmail.com', '09674193961'),
('admin2', 'admin2', 'ROLE_ADMIN', 'FRANKLIN LOYDs', 'B.s', 'NAVARROs', 1, 'angklim9@gmail.coms', '096741939612'),
('admin4', 'admin4', 'ROLE_ADMIN', 'Admin 4', 'Admin 4', 'Admin4', 1, 'admin4@gmail.com', '09123123123'),
('john', 'john', 'ROLE_USER', 'John', 'Middle', 'Doe', 1, 'johndoe@gmail.com', '09271619888'),
('user2', 'user2', 'ROLE_USER', 'Lord Francis', 'Bitancor', 'Navarro', 1, 'franznavars@gmail.com', '+639271619546'),
('user4', 'user4', 'ROLE_USER', 'xx', 'xx', 'xx', 1, 'xx', 'xx');

-- --------------------------------------------------------

--
-- Table structure for table `vaccination`
--

CREATE TABLE `vaccination` (
  `vaccination_id` int(5) NOT NULL,
  `vacc_date` date DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `pet_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vaccination`
--

INSERT INTO `vaccination` (`vaccination_id`, `vacc_date`, `type`, `remarks`, `pet_id`) VALUES
(6, '2022-12-29', 'Rabies', 'Healthi', 24),
(8, '2022-12-09', 'Anti Rabies', 'Good', 24),
(9, '2022-12-17', 'Rabies', 'Go back after 1 week', 28);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`consultation_id`),
  ADD KEY `pet_id` (`pet_id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`pet_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccination`
--
ALTER TABLE `vaccination`
  ADD PRIMARY KEY (`vaccination_id`),
  ADD KEY `pet_id` (`pet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `consultation_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `pet_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `vaccination`
--
ALTER TABLE `vaccination`
  MODIFY `vaccination_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`);

--
-- Constraints for table `vaccination`
--
ALTER TABLE `vaccination`
  ADD CONSTRAINT `vaccination_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
