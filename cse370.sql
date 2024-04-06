-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2024 at 04:12 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `apartment_a2`
--

CREATE TABLE `apartment_a2` (
  `Building_no` int(3) NOT NULL,
  `Road_no` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apartment_a3`
--

CREATE TABLE `apartment_a3` (
  `Building_no` int(3) NOT NULL,
  `Building_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `can_have`
--

CREATE TABLE `can_have` (
  `C_Flat_ID` varchar(10) NOT NULL,
  `C_Request_ID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flat_owner`
--

CREATE TABLE `flat_owner` (
  `O_Resident_ID` varchar(10) NOT NULL,
  `Owner_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `makes`
--

CREATE TABLE `makes` (
  `M_Resident_ID` varchar(10) NOT NULL,
  `M_Request_ID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `owns`
--

CREATE TABLE `owns` (
  `O_Flat_ID` varchar(10) NOT NULL,
  `O_Resident_ID` varchar(10) NOT NULL,
  `O_Owner_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `sells/rents`
--

CREATE TABLE `sells/rents` (
  `S_Owner_ID` varchar(10) NOT NULL,
  `S_Flat_ID` varchar(10) NOT NULL,
  `O_Resident_ID` varchar(10) NOT NULL,
  `Cost` int(10) NOT NULL,
  `Rent/Sale` varchar(20) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `tenant`
--

CREATE TABLE `tenant` (
  `T_Resident_ID` varchar(10) NOT NULL,
  `Tenant_ID` varchar(10) NOT NULL,
  `T_Owner_ID` varchar(10) NOT NULL,
  `T_Flat_ID` varchar(10) NOT NULL,
  `O_Resident_ID` varchar(10) NOT NULL,
  `Month` text NOT NULL,
  `Rent_status` tinyint(1) NOT NULL
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
-- Indexes for table `responds_to`
--
ALTER TABLE `responds_to`
  ADD PRIMARY KEY (`R_Staff_ID`,`R_Request_ID`),
  ADD KEY `R_Request_ID` (`R_Request_ID`);

--
-- Indexes for table `sells/rents`
--
ALTER TABLE `sells/rents`
  ADD PRIMARY KEY (`S_Owner_ID`,`S_Flat_ID`,`O_Resident_ID`),
  ADD KEY `S_Flat_ID` (`S_Flat_ID`),
  ADD KEY `O_Resident_ID` (`O_Resident_ID`);

--
-- Indexes for table `service_and_utility_staff`
--
ALTER TABLE `service_and_utility_staff`
  ADD PRIMARY KEY (`Staff_ID`);

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
-- Constraints for table `responds_to`
--
ALTER TABLE `responds_to`
  ADD CONSTRAINT `responds_to_ibfk_1` FOREIGN KEY (`R_Request_ID`) REFERENCES `maintainence_request` (`Request_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `responds_to_ibfk_2` FOREIGN KEY (`R_Staff_ID`) REFERENCES `service_and_utility_staff` (`Staff_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sells/rents`
--
ALTER TABLE `sells/rents`
  ADD CONSTRAINT `sells/rents_ibfk_1` FOREIGN KEY (`S_Owner_ID`) REFERENCES `flat_owner` (`Owner_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sells/rents_ibfk_2` FOREIGN KEY (`S_Flat_ID`) REFERENCES `apartment_a1` (`Flat_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sells/rents_ibfk_3` FOREIGN KEY (`O_Resident_ID`) REFERENCES `flat_owner` (`O_Resident_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
