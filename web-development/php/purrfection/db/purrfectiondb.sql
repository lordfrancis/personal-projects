-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2022 at 07:52 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `appointment_id` int(5) UNSIGNED ZEROFILL NOT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `type` enum('vaccination','consultation') DEFAULT NULL,
  `status` enum('current','done','cancelled') DEFAULT NULL,
  `id` int(5) UNSIGNED ZEROFILL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `date`, `start_time`, `end_time`, `type`, `status`, `id`) VALUES
(00005, '2021-11-23', '11:00:00', '12:00:00', 'vaccination', 'cancelled', 00014),
(00006, '2021-11-24', '13:00:00', '14:00:00', 'consultation', 'cancelled', 00014),
(00007, '2021-11-20', '11:00:00', '12:00:00', 'vaccination', 'cancelled', 00014),
(00008, '2021-11-23', '09:00:00', '10:00:00', 'vaccination', 'cancelled', 00014),
(00009, '2021-12-29', '14:00:00', '15:00:00', 'consultation', 'cancelled', 00014),
(00010, '2021-12-30', '13:00:00', '14:00:00', 'consultation', 'cancelled', 00014),
(00011, '2021-12-14', '14:00:00', '15:00:00', 'vaccination', 'cancelled', 00022);

-- --------------------------------------------------------

--
-- Table structure for table `consultation`
--

CREATE TABLE `consultation` (
  `consultation_id` int(5) UNSIGNED ZEROFILL NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `findings` varchar(100) DEFAULT NULL,
  `recommendations` varchar(100) DEFAULT NULL,
  `pet_id` int(5) UNSIGNED ZEROFILL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `consultation`
--

INSERT INTO `consultation` (`consultation_id`, `date`, `findings`, `recommendations`, `pet_id`) VALUES
(00001, '2021-12-10 04:28:01', 'Ninghubag ang tiil', 'Putlon ang tiil', 00005),
(00002, '2021-12-10 06:16:57', 'Lice Infestation', '1 bottle of anti kuto every day. ', 00001),
(00003, '2021-12-10 08:00:08', 'Parvo', '1 biogesic per day. ', 00001),
(00004, '2021-12-10 10:29:42', 'asdasdasd', 'dasdasdasd', 00001),
(00005, '2021-12-10 23:37:16', 'Laceration from left leg resulting to infection', 'amputate', 00008);

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `pet_id` int(5) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `pet_type` varchar(25) DEFAULT NULL,
  `breed` varchar(25) DEFAULT NULL,
  `owner_id` int(5) UNSIGNED ZEROFILL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`pet_id`, `name`, `pet_type`, `breed`, `owner_id`) VALUES
(00001, 'Cheska', 'Dog', 'dalmatian', 00014),
(00002, 'Onepunk asdasdasdsadasdas', 'Dogsssss', 'Askal', 00014),
(00005, 'Brownies', 'Dog', 'Dalmatian', 00014),
(00006, 'ssisadihasd', 'Dog', 'aspin', 00014),
(00008, 'Brando', 'Dog', 'Aw aw', 00022);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) UNSIGNED ZEROFILL NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `mname` varchar(25) DEFAULT NULL,
  `lname` varchar(25) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `cnum` varchar(11) DEFAULT NULL,
  `type` enum('c','v','s') DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `mname`, `lname`, `email`, `cnum`, `type`, `username`, `password`) VALUES
(00013, NULL, NULL, NULL, NULL, NULL, 's', 'staff', 'staff'),
(00014, 'Lord Francis', 'Bitancorss', 'Navarrosss', 'franznavars@gmail.com', '09271619546', 'c', 'user', 'user'),
(00016, 'Jennifer', 'Doria', 'Labandria', 'jen@gmail.com', '09271619546', 'c', 'jen', 'jen'),
(00018, NULL, NULL, NULL, NULL, NULL, 'v', 'vet', 'vet'),
(00022, 'Lord Francis', 'Bitancor', 'Navarro', 'francisnavarro@gmail.com', '09281512311', 'c', 'user3', 'user3');

-- --------------------------------------------------------

--
-- Table structure for table `vaccination`
--

CREATE TABLE `vaccination` (
  `vaccination_id` int(5) UNSIGNED ZEROFILL NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type` varchar(15) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `pet_id` int(5) UNSIGNED ZEROFILL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccination`
--

INSERT INTO `vaccination` (`vaccination_id`, `date`, `type`, `remarks`, `pet_id`) VALUES
(00001, '2021-12-10 06:15:46', 'cl', 'Follow up vaccination after 1 month. ', 00005),
(00002, '2021-12-10 08:20:29', 'cr', 'Next Vaccination date is January 15, 2022', 00001),
(00003, '2021-12-10 08:22:17', 'Canine Rabies', 'N/A', 00001),
(00004, '2021-12-10 23:37:43', 'Canine parainfl', 'Next vaccine is on December 14', 00008);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `id` (`id`);

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
  ADD PRIMARY KEY (`pet_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
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
  MODIFY `appointment_id` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `consultation_id` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `pet_id` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `vaccination`
--
ALTER TABLE `vaccination`
  MODIFY `vaccination_id` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`);

--
-- Constraints for table `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `vaccination`
--
ALTER TABLE `vaccination`
  ADD CONSTRAINT `vaccination_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
