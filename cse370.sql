-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2024 at 08:28 AM
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
  `Flat_ID` int(6) NOT NULL,
  `Floor_no` int(4) NOT NULL,
  `Flat_no` int(6) NOT NULL,
  `Building_no` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apartment_a2`
--

CREATE TABLE `apartment_a2` (
  `Building_no` int(6) NOT NULL,
  `Road_no` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apartment_a3`
--

CREATE TABLE `apartment_a3` (
  `Building_no` int(6) NOT NULL,
  `Building_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `can_have`
--

CREATE TABLE `can_have` (
  `C_Flat_ID` int(6) NOT NULL,
  `C_Request_ID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flat_owner`
--

CREATE TABLE `flat_owner` (
  `O_Resident_ID` int(6) NOT NULL,
  `Owner_ID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maintainence_request`
--

CREATE TABLE `maintainence_request` (
  `Request_ID` int(6) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Request_description` text NOT NULL,
  `Required_role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `makes`
--

CREATE TABLE `makes` (
  `M_Resident_ID` int(6) NOT NULL,
  `M_Request_ID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `owns`
--

CREATE TABLE `owns` (
  `O_Flat_ID` int(6) NOT NULL,
  `O_Resident_ID` int(6) NOT NULL,
  `O_Owner_ID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resident`
--

CREATE TABLE `resident` (
  `Resident_ID` int(6) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Name` text NOT NULL,
  `Contact_num` int(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `responds_to`
--

CREATE TABLE `responds_to` (
  `R_Staff_ID` int(6) NOT NULL,
  `R_Request_ID` int(11) NOT NULL,
  `Wage` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sells/rent`
--

CREATE TABLE `sells/rent` (
  `S_Owner_ID` int(6) NOT NULL,
  `S_Flat_ID` int(6) NOT NULL,
  `O_Resident_ID` int(6) NOT NULL,
  `Cost` int(6) NOT NULL,
  `Rent/Sale` int(3) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_and_utility_staff`
--

CREATE TABLE `service_and_utility_staff` (
  `Staff_ID` int(6) NOT NULL,
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
  `T_Resident_ID` int(6) NOT NULL,
  `Tenant_ID` int(6) NOT NULL,
  `T_Owner_ID` int(6) NOT NULL,
  `T_Flat_ID` int(6) NOT NULL,
  `O_Resident_ID` int(6) NOT NULL,
  `Month` text NOT NULL,
  `Rent_Status` tinyint(1) NOT NULL
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
  ADD KEY `Building_no` (`Building_no`);

--
-- Indexes for table `can_have`
--
ALTER TABLE `can_have`
  ADD KEY `C_Flat_ID` (`C_Flat_ID`),
  ADD KEY `C_Request_ID` (`C_Request_ID`);

--
-- Indexes for table `flat_owner`
--
ALTER TABLE `flat_owner`
  ADD PRIMARY KEY (`Owner_ID`),
  ADD KEY `O_Resident_ID` (`O_Resident_ID`);

--
-- Indexes for table `maintainence_request`
--
ALTER TABLE `maintainence_request`
  ADD PRIMARY KEY (`Request_ID`);

--
-- Indexes for table `makes`
--
ALTER TABLE `makes`
  ADD KEY `M_Request_ID` (`M_Request_ID`),
  ADD KEY `makes_ibfk_2` (`M_Resident_ID`);

--
-- Indexes for table `owns`
--
ALTER TABLE `owns`
  ADD KEY `O_Flat_ID` (`O_Flat_ID`),
  ADD KEY `O_Owner_ID` (`O_Owner_ID`),
  ADD KEY `O_Resident_ID` (`O_Resident_ID`);

--
-- Indexes for table `resident`
--
ALTER TABLE `resident`
  ADD PRIMARY KEY (`Resident_ID`);

--
-- Indexes for table `responds_to`
--
ALTER TABLE `responds_to`
  ADD KEY `R_Staff_ID` (`R_Staff_ID`),
  ADD KEY `R_Request_ID` (`R_Request_ID`);

--
-- Indexes for table `sells/rent`
--
ALTER TABLE `sells/rent`
  ADD KEY `S_Owner_ID` (`S_Owner_ID`),
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
  ADD PRIMARY KEY (`Tenant_ID`),
  ADD KEY `T_Resident_ID` (`T_Resident_ID`),
  ADD KEY `T_Owner_ID` (`T_Owner_ID`),
  ADD KEY `T_Flat_ID` (`T_Flat_ID`),
  ADD KEY `O_Resident_ID` (`O_Resident_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartment_a1`
--
ALTER TABLE `apartment_a1`
  MODIFY `Flat_ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apartment_a2`
--
ALTER TABLE `apartment_a2`
  MODIFY `Building_no` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flat_owner`
--
ALTER TABLE `flat_owner`
  MODIFY `Owner_ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintainence_request`
--
ALTER TABLE `maintainence_request`
  MODIFY `Request_ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resident`
--
ALTER TABLE `resident`
  MODIFY `Resident_ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_and_utility_staff`
--
ALTER TABLE `service_and_utility_staff`
  MODIFY `Staff_ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenant`
--
ALTER TABLE `tenant`
  MODIFY `Tenant_ID` int(6) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `can_have_ibfk_2` FOREIGN KEY (`C_Request_ID`) REFERENCES `maintainence_request` (`Request_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flat_owner`
--
ALTER TABLE `flat_owner`
  ADD CONSTRAINT `flat_owner_ibfk_1` FOREIGN KEY (`O_Resident_ID`) REFERENCES `resident` (`Resident_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `makes`
--
ALTER TABLE `makes`
  ADD CONSTRAINT `makes_ibfk_1` FOREIGN KEY (`M_Request_ID`) REFERENCES `maintainence_request` (`Request_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `makes_ibfk_2` FOREIGN KEY (`M_Resident_ID`) REFERENCES `resident` (`Resident_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `owns`
--
ALTER TABLE `owns`
  ADD CONSTRAINT `owns_ibfk_1` FOREIGN KEY (`O_Flat_ID`) REFERENCES `apartment_a1` (`Flat_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `owns_ibfk_2` FOREIGN KEY (`O_Owner_ID`) REFERENCES `flat_owner` (`Owner_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `owns_ibfk_3` FOREIGN KEY (`O_Resident_ID`) REFERENCES `flat_owner` (`O_Resident_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `responds_to`
--
ALTER TABLE `responds_to`
  ADD CONSTRAINT `responds_to_ibfk_1` FOREIGN KEY (`R_Staff_ID`) REFERENCES `service_and_utility_staff` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `responds_to_ibfk_2` FOREIGN KEY (`R_Request_ID`) REFERENCES `maintainence_request` (`Request_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sells/rent`
--
ALTER TABLE `sells/rent`
  ADD CONSTRAINT `sells/rent_ibfk_1` FOREIGN KEY (`S_Owner_ID`) REFERENCES `flat_owner` (`Owner_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sells/rent_ibfk_2` FOREIGN KEY (`S_Flat_ID`) REFERENCES `apartment_a1` (`Flat_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sells/rent_ibfk_3` FOREIGN KEY (`O_Resident_ID`) REFERENCES `flat_owner` (`O_Resident_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
