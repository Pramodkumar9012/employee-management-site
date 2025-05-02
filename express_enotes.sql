-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2024 at 06:00 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `express_enotes`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_name` varchar(50) DEFAULT NULL,
  `Admin_email` varchar(50) NOT NULL,
  `Admin_password` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_name`, `Admin_email`, `Admin_password`) VALUES
('Sagar Chaudhary', 'sagar.chaudhary25008@gmail.com', 'sagar@123');

-- --------------------------------------------------------

--
-- Table structure for table `students_table`
--

CREATE TABLE `students_table` (
  `student_name` varchar(100) DEFAULT NULL,
  `student_email` varchar(100) NOT NULL,
  `student_password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students_table`
--

INSERT INTO `students_table` (`student_name`, `student_email`, `student_password`) VALUES
('rahul', 'rahul@gamil.com', 'rahul1'),
('Sagar Chaudhary', 'sagar.chaudhary25008@gmail.com', 'sagar@123'),
('Sumit Sharma', 'sumit@1234', 'sumit@123'),
('Sumit Sharma', 'sumit@gmail.com', 'sum@123'),
('yogesh', 'yogesh@gamil.com', 'yogesh1');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_table`
--

CREATE TABLE `teacher_table` (
  `teacher_name` varchar(100) DEFAULT NULL,
  `teacher_email` varchar(100) NOT NULL,
  `teacher_password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_table`
--

INSERT INTO `teacher_table` (`teacher_name`, `teacher_email`, `teacher_password`) VALUES
('Deepak', 'admin@gmail.com', 'admin1'),
('Ashish', 'as@yahoo.com', 't123@'),
('Deepak', 'Deepak@gmail.com', 'admin1'),
('sagar Chaudhary', 'sagar.chaudhary25008@gmail.com', 'sagar@123'),
('VArun', 'var@yahoo.com', 't123@'),
('yogesh sharma', 'yogesh@gmail.com', 'dd@123');

-- --------------------------------------------------------

--
-- Table structure for table `write_notes`
--

CREATE TABLE `write_notes` (
  `Subject` varchar(100) NOT NULL,
  `Topic` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `write_notes`
--

INSERT INTO `write_notes` (`Subject`, `Topic`, `content`, `Time`) VALUES
('Science', 'Chemical Bond', 'chemical bonding, any of the interactions that account for the association of atoms into molecules, ions, crystals, and other stable species that make up the familiar substances of the everyday world.', '2023-09-30 02:56:27'),
('Database', 'What is DBSM', 'Database Management Systems (DBMS) are software systems used to store, retrieve, and run queries on data. A DBMS serves as an interface between an end-user and a database, allowing users to create, read, update, and delete data in the database', '2023-10-03 02:22:16'),
('Computer', 'what is Mouse', 'A mouse is a small device that a computer user pushes across a desk surface in order to point to a place on a display screen and to select one or more actions to take from that position. The mouse first became a widely used computer tool when Apple Computer made it a standard part of the Apple Macintosh.', '2023-10-03 02:23:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_email`);

--
-- Indexes for table `students_table`
--
ALTER TABLE `students_table`
  ADD PRIMARY KEY (`student_email`);

--
-- Indexes for table `teacher_table`
--
ALTER TABLE `teacher_table`
  ADD PRIMARY KEY (`teacher_email`);

--
-- Indexes for table `write_notes`
--
ALTER TABLE `write_notes`
  ADD PRIMARY KEY (`Topic`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
