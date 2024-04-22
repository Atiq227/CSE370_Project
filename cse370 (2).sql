-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2024 at 12:53 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cse370`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartment_a1`
--

CREATE TABLE `apartment_a1` (
  `Flat_ID` varchar(10) NOT NULL,
  `Floor_no` int(2) NOT NULL,
  `Flat_no` int(3) NOT NULL,
  `Building_no` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apartment_a1`
--

INSERT INTO `apartment_a1` (`Flat_ID`, `Floor_no`, `Flat_no`, `Building_no`) VALUES
('F1', 1, 2, 3),
('F100', 8, 100, 6),
('F2', 1, 2, 5),
('F200', 1, 2, 1),
('F3', 3, 4, 7),
('F4', 7, 8, 8),
('F5', 10, 11, 10),
('F6', 8, 9, 11);

-- --------------------------------------------------------

--
-- Table structure for table `apartment_a2`
--

CREATE TABLE `apartment_a2` (
  `Building_no` int(3) NOT NULL,
  `Road_no` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apartment_a2`
--

INSERT INTO `apartment_a2` (`Building_no`, `Road_no`) VALUES
(1, 2),
(3, 4),
(5, 6),
(6, 6),
(7, 8),
(8, 9),
(10, 11),
(11, 12);

-- --------------------------------------------------------

--
-- Table structure for table `apartment_a3`
--

CREATE TABLE `apartment_a3` (
  `Building_no` int(3) NOT NULL,
  `Building_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apartment_a3`
--

INSERT INTO `apartment_a3` (`Building_no`, `Building_name`) VALUES
(1, 'Jahanara Garden'),
(3, 'Shoikat Misha'),
(5, 'Sunset Villa'),
(6, 'Baganbari Tower'),
(7, 'Enchanted Cottage'),
(8, 'Serene Haven'),
(10, 'Nakshi Garden'),
(11, 'RSA Tower');

-- --------------------------------------------------------

--
-- Table structure for table `can_have`
--

CREATE TABLE `can_have` (
  `C_Flat_ID` varchar(10) NOT NULL,
  `C_Request_ID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `can_have`
--

INSERT INTO `can_have` (`C_Flat_ID`, `C_Request_ID`) VALUES
('F4', 1);

-- --------------------------------------------------------

--
-- Table structure for table `flat_owner`
--

CREATE TABLE `flat_owner` (
  `O_Resident_ID` varchar(10) NOT NULL,
  `Owner_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flat_owner`
--

INSERT INTO `flat_owner` (`O_Resident_ID`, `Owner_ID`) VALUES
('R100', 'O100'),
('R200', 'O200');

-- --------------------------------------------------------

--
-- Table structure for table `maintainence_request`
--

CREATE TABLE `maintainence_request` (
  `Request_ID` int(3) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Request_description` text NOT NULL,
  `Required_role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintainence_request`
--

INSERT INTO `maintainence_request` (`Request_ID`, `Status`, `Request_description`, `Required_role`) VALUES
(1, 0, 'Water Tap broken', 'Plumber');

-- --------------------------------------------------------

--
-- Table structure for table `makes`
--

CREATE TABLE `makes` (
  `M_Resident_ID` varchar(10) NOT NULL,
  `M_Request_ID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `makes`
--

INSERT INTO `makes` (`M_Resident_ID`, `M_Request_ID`) VALUES
('R200', 1);

-- --------------------------------------------------------

--
-- Table structure for table `owns`
--

CREATE TABLE `owns` (
  `O_Flat_ID` varchar(10) NOT NULL,
  `O_Resident_ID` varchar(10) NOT NULL,
  `O_Owner_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owns`
--

INSERT INTO `owns` (`O_Flat_ID`, `O_Resident_ID`, `O_Owner_ID`) VALUES
('F100', 'R100', 'O100'),
('F2', 'R100', 'O100'),
('F4', 'R200', 'O200');

-- --------------------------------------------------------

--
-- Table structure for table `resident`
--

CREATE TABLE `resident` (
  `Resident_ID` varchar(10) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Name` text NOT NULL,
  `Contact_num` int(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resident`
--

INSERT INTO `resident` (`Resident_ID`, `Password`, `Name`, `Contact_num`) VALUES
('R100', 'Far', 'Tanjila', 1234),
('R200', 'Far', 'Fariha', 1945344268);

-- --------------------------------------------------------

--
-- Table structure for table `resident_notification`
--

CREATE TABLE `resident_notification` (
  `Resident_ID` varchar(10) NOT NULL,
  `notification` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `responds_to`
--

CREATE TABLE `responds_to` (
  `R_Staff_ID` varchar(10) NOT NULL,
  `R_Request_ID` int(3) NOT NULL,
  `Wage` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sellsorrents`
--

CREATE TABLE `sellsorrents` (
  `S_Owner_ID` varchar(10) NOT NULL,
  `S_Flat_ID` varchar(10) NOT NULL,
  `O_Resident_ID` varchar(10) NOT NULL,
  `Cost` int(10) NOT NULL,
  `rent_or_sell` varchar(20) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellsorrents`
--

INSERT INTO `sellsorrents` (`S_Owner_ID`, `S_Flat_ID`, `O_Resident_ID`, `Cost`, `rent_or_sell`, `Description`) VALUES
('O200', 'F4', 'R200', 123, 'Rent', '1200 sqft');

-- --------------------------------------------------------

--
-- Table structure for table `service_and_utility_staff`
--

CREATE TABLE `service_and_utility_staff` (
  `Staff_ID` varchar(10) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Name` text NOT NULL,
  `Role` text NOT NULL,
  `Contact_num` int(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_notification`
--

CREATE TABLE `staff_notification` (
  `Staff_ID` varchar(10) NOT NULL,
  `notification` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenant`
--

CREATE TABLE `tenant` (
  `T_Resident_ID` varchar(10) NOT NULL,
  `Tenant_ID` varchar(10) NOT NULL,
  `T_Owner_ID` varchar(10) NOT NULL,
  `T_Flat_ID` varchar(10) NOT NULL,
  `O_Resident_ID` varchar(10) NOT NULL,
  `Rent_from` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartment_a1`
--
ALTER TABLE `apartment_a1`
  ADD PRIMARY KEY (`Flat_ID`),
  ADD KEY `Building_no` (`Building_no`);

--
-- Indexes for table `apartment_a2`
--
ALTER TABLE `apartment_a2`
  ADD PRIMARY KEY (`Building_no`);

--
-- Indexes for table `apartment_a3`
--
ALTER TABLE `apartment_a3`
  ADD PRIMARY KEY (`Building_no`);

--
-- Indexes for table `can_have`
--
ALTER TABLE `can_have`
  ADD PRIMARY KEY (`C_Flat_ID`,`C_Request_ID`),
  ADD KEY `C_Request_ID` (`C_Request_ID`);

--
-- Indexes for table `flat_owner`
--
ALTER TABLE `flat_owner`
  ADD PRIMARY KEY (`O_Resident_ID`,`Owner_ID`),
  ADD KEY `Owner_ID` (`Owner_ID`);

--
-- Indexes for table `maintainence_request`
--
ALTER TABLE `maintainence_request`
  ADD PRIMARY KEY (`Request_ID`);

--
-- Indexes for table `makes`
--
ALTER TABLE `makes`
  ADD PRIMARY KEY (`M_Resident_ID`,`M_Request_ID`),
  ADD KEY `M_Request_ID` (`M_Request_ID`);

--
-- Indexes for table `owns`
--
ALTER TABLE `owns`
  ADD PRIMARY KEY (`O_Flat_ID`,`O_Resident_ID`,`O_Owner_ID`),
  ADD KEY `O_Resident_ID` (`O_Resident_ID`),
  ADD KEY `O_Owner_ID` (`O_Owner_ID`);

--
-- Indexes for table `resident`
--
ALTER TABLE `resident`
  ADD PRIMARY KEY (`Resident_ID`);

--
-- Indexes for table `resident_notification`
--
ALTER TABLE `resident_notification`
  ADD PRIMARY KEY (`Resident_ID`,`notification`);

--
-- Indexes for table `responds_to`
--
ALTER TABLE `responds_to`
  ADD PRIMARY KEY (`R_Staff_ID`,`R_Request_ID`),
  ADD KEY `R_Request_ID` (`R_Request_ID`);

--
-- Indexes for table `sellsorrents`
--
ALTER TABLE `sellsorrents`
  ADD PRIMARY KEY (`S_Owner_ID`,`S_Flat_ID`,`O_Resident_ID`),
  ADD KEY `S_Flat_ID` (`S_Flat_ID`),
  ADD KEY `O_Resident_ID` (`O_Resident_ID`);

--
-- Indexes for table `service_and_utility_staff`
--
ALTER TABLE `service_and_utility_staff`
  ADD PRIMARY KEY (`Staff_ID`);

--
-- Indexes for table `staff_notification`
--
ALTER TABLE `staff_notification`
  ADD PRIMARY KEY (`Staff_ID`,`notification`);

--
-- Indexes for table `tenant`
--
ALTER TABLE `tenant`
  ADD PRIMARY KEY (`T_Resident_ID`,`Tenant_ID`,`T_Owner_ID`,`T_Flat_ID`,`O_Resident_ID`),
  ADD KEY `T_Owner_ID` (`T_Owner_ID`),
  ADD KEY `T_Flat_ID` (`T_Flat_ID`),
  ADD KEY `O_Resident_ID` (`O_Resident_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apartment_a1`
--
ALTER TABLE `apartment_a1`
  ADD CONSTRAINT `apartment_a1_ibfk_1` FOREIGN KEY (`Building_no`) REFERENCES `apartment_a2` (`Building_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `apartment_a3`
--
ALTER TABLE `apartment_a3`
  ADD CONSTRAINT `apartment_a3_ibfk_1` FOREIGN KEY (`Building_no`) REFERENCES `apartment_a2` (`Building_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `can_have`
--
ALTER TABLE `can_have`
  ADD CONSTRAINT `can_have_ibfk_1` FOREIGN KEY (`C_Flat_ID`) REFERENCES `apartment_a1` (`Flat_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `can_have_ibfk_2` FOREIGN KEY (`C_Request_ID`) REFERENCES `maintainence_request` (`Request_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `flat_owner`
--
ALTER TABLE `flat_owner`
  ADD CONSTRAINT `flat_owner_ibfk_1` FOREIGN KEY (`O_Resident_ID`) REFERENCES `resident` (`Resident_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `makes`
--
ALTER TABLE `makes`
  ADD CONSTRAINT `makes_ibfk_1` FOREIGN KEY (`M_Resident_ID`) REFERENCES `resident` (`Resident_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `makes_ibfk_2` FOREIGN KEY (`M_Request_ID`) REFERENCES `maintainence_request` (`Request_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `owns`
--
ALTER TABLE `owns`
  ADD CONSTRAINT `owns_ibfk_1` FOREIGN KEY (`O_Flat_ID`) REFERENCES `apartment_a1` (`Flat_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `owns_ibfk_2` FOREIGN KEY (`O_Resident_ID`) REFERENCES `flat_owner` (`O_Resident_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `owns_ibfk_3` FOREIGN KEY (`O_Owner_ID`) REFERENCES `flat_owner` (`Owner_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resident_notification`
--
ALTER TABLE `resident_notification`
  ADD CONSTRAINT `resident_notification_ibfk_1` FOREIGN KEY (`Resident_ID`) REFERENCES `resident` (`Resident_ID`);

--
-- Constraints for table `responds_to`
--
ALTER TABLE `responds_to`
  ADD CONSTRAINT `responds_to_ibfk_1` FOREIGN KEY (`R_Request_ID`) REFERENCES `maintainence_request` (`Request_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `responds_to_ibfk_2` FOREIGN KEY (`R_Staff_ID`) REFERENCES `service_and_utility_staff` (`Staff_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sellsorrents`
--
ALTER TABLE `sellsorrents`
  ADD CONSTRAINT `sellsorrents_ibfk_1` FOREIGN KEY (`S_Owner_ID`) REFERENCES `flat_owner` (`Owner_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sellsorrents_ibfk_2` FOREIGN KEY (`S_Flat_ID`) REFERENCES `apartment_a1` (`Flat_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sellsorrents_ibfk_3` FOREIGN KEY (`O_Resident_ID`) REFERENCES `flat_owner` (`O_Resident_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_notification`
--
ALTER TABLE `staff_notification`
  ADD CONSTRAINT `staff_notification_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `service_and_utility_staff` (`Staff_ID`);

--
-- Constraints for table `tenant`
--
ALTER TABLE `tenant`
  ADD CONSTRAINT `tenant_ibfk_1` FOREIGN KEY (`T_Resident_ID`) REFERENCES `resident` (`Resident_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tenant_ibfk_2` FOREIGN KEY (`T_Owner_ID`) REFERENCES `flat_owner` (`Owner_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tenant_ibfk_3` FOREIGN KEY (`T_Flat_ID`) REFERENCES `apartment_a1` (`Flat_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tenant_ibfk_4` FOREIGN KEY (`O_Resident_ID`) REFERENCES `flat_owner` (`O_Resident_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
