-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2019 at 05:00 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin_trainapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admintable`
--

CREATE TABLE `admintable` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `address` varchar(170) NOT NULL,
  `phonenumber` varchar(20) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admintable`
--

INSERT INTO `admintable` (`id`, `first_name`, `last_name`, `address`, `phonenumber`, `email`, `password`) VALUES
(1, 'Ranveer', 'muhamad', '34,4/5 petersonlane', '0771772876', 'Ranveer@gmail.com', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `User_id` int(100) NOT NULL,
  `Phone_number` int(100) NOT NULL,
  `Email_Address` varchar(100) NOT NULL,
  `Start_Station` varchar(100) NOT NULL,
  `End_Station` varchar(100) NOT NULL,
  `User_Date` int(100) NOT NULL,
  `User_Class` int(100) NOT NULL,
  `Seat_Number` int(100) NOT NULL,
  `User_Price` int(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`User_id`, `Phone_number`, `Email_Address`, `Start_Station`, `End_Station`, `User_Date`, `User_Class`, `Seat_Number`, `User_Price`) VALUES
(4, 123, 'iit', 'kandy', 'matara', 20, 2, 31, 500),
(5, 123, '345', 'uk', 'ertuk', 56, 2, 56, 1234),
(7, 774804931, 'qaz@qaz.com', 'qazwsx', 'wsxxedc', 20131031, 1, 5, 1236);

-- --------------------------------------------------------

--
-- Table structure for table `bookingtable`
--

CREATE TABLE `bookingtable` (
  `id` int(11) NOT NULL,
  `Phone_number` varchar(100) NOT NULL,
  `Email_Address` varchar(100) NOT NULL,
  `Start_Station` varchar(100) NOT NULL,
  `End_Station` varchar(100) NOT NULL,
  `User_Date` varchar(100) NOT NULL,
  `User_Class` varchar(100) NOT NULL,
  `Seat_Number` varchar(100) NOT NULL,
  `User_Price` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookingtable`
--

INSERT INTO `bookingtable` (`id`, `Phone_number`, `Email_Address`, `Start_Station`, `End_Station`, `User_Date`, `User_Class`, `Seat_Number`, `User_Price`) VALUES
(1, '0774804931', 'qsdfcvbnm', 'wertyu', 'edfghjm', '345678', 'dfghjm', '1234567', '1234567890');

-- --------------------------------------------------------

--
-- Table structure for table `daily`
--

CREATE TABLE `daily` (
  `user_ID` int(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `phone_number` int(100) NOT NULL,
  `start_station` varchar(100) NOT NULL,
  `end_station` varchar(100) NOT NULL,
  `user_price` varchar(100) NOT NULL,
  `user_class` int(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daily`
--

INSERT INTO `daily` (`user_ID`, `user_name`, `phone_number`, `start_station`, `end_station`, `user_price`, `user_class`) VALUES
(8, 'usdewww', 594, 'nassdd', 'jafna', '345', 2);

-- --------------------------------------------------------

--
-- Table structure for table `officers`
--

CREATE TABLE `officers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `age` varchar(3) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `officers`
--

INSERT INTO `officers` (`id`, `first_name`, `last_name`, `address`, `phone_number`, `age`, `email`, `password`) VALUES
(1, 'Shajeeran', 'Manoharan', '34,3/4, peterson Lane', '0771772876', '18', 'shajeemano88@gmail.c', '12344'),
(2, 'Shajeeran', 'Froster', '45,67,wenperera lane', '00000000026', '66', 'viveksuben@yahoo.com', 'bowborr'),
(3, 'thrindu', 'johneee', '45,67,wenperera lane', '0888888888', '19', 'tharindu@gmail.com', '12344');

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `user_ID` int(100) NOT NULL,
  `start_station` varchar(100) NOT NULL,
  `end_station` varchar(100) NOT NULL,
  `class_one` int(100) NOT NULL,
  `class_two` int(100) NOT NULL,
  `class_three` int(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`user_ID`, `start_station`, `end_station`, `class_one`, `class_two`, `class_three`) VALUES
(6, 'kandy', 'colombo', 123456, 20, 5);

-- --------------------------------------------------------

--
-- Table structure for table `reserve`
--

CREATE TABLE `reserve` (
  `user_ID` int(100) NOT NULL,
  `start_station` varchar(100) NOT NULL,
  `end_station` varchar(100) NOT NULL,
  `user_date` int(11) NOT NULL,
  `user_time` int(100) NOT NULL,
  `user_class` int(100) NOT NULL,
  `seat_number` int(100) NOT NULL,
  `user_price` int(100) NOT NULL,
  `ref_number` int(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reserve`
--

INSERT INTO `reserve` (`user_ID`, `start_station`, `end_station`, `user_date`, `user_time`, `user_class`, `seat_number`, `user_price`, `ref_number`) VALUES
(1, 'jafna', 'mathara', 20, 20, 20, 20, 20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `ticketdetails`
--

CREATE TABLE `ticketdetails` (
  `ticketId` int(11) NOT NULL,
  `departure` varchar(30) NOT NULL,
  `departureTime` time NOT NULL,
  `arrival` varchar(30) NOT NULL,
  `arrivalTime` time NOT NULL,
  `refNo` int(11) NOT NULL,
  `date` date NOT NULL,
  `bookingDate` datetime NOT NULL,
  `payment` varchar(20) NOT NULL,
  `noSeats` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticketdetails`
--

INSERT INTO `ticketdetails` (`ticketId`, `departure`, `departureTime`, `arrival`, `arrivalTime`, `refNo`, `date`, `bookingDate`, `payment`, `noSeats`, `userId`) VALUES
(1, 'Colombo Fort', '22:25:00', 'Kandy', '12:00:00', 1002, '2019-08-04', '2019-07-09 09:16:15', 'Rs.150', 8, 2),
(2, 'Galle', '14:00:00', 'Panadura', '16:00:00', 1001, '2019-09-11', '2019-08-07 07:28:24', 'Rs.100', 7, 1),
(3, 'Maradana', '14:00:00', 'Jaffna', '16:30:00', 1034, '2019-06-13', '2019-07-09 09:16:15', 'Rs.500', 8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `user_ID` int(100) NOT NULL,
  `train_id` int(100) NOT NULL,
  `train_type` varchar(100) NOT NULL,
  `start_station` varchar(100) NOT NULL,
  `start_time` int(100) NOT NULL,
  `end_station` varchar(100) NOT NULL,
  `end_time` int(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`user_ID`, `train_id`, `train_type`, `start_station`, `start_time`, `end_station`, `end_time`) VALUES
(10, 123, 'abc', 'uk', 12, 'usasrilanka', 148),
(12, 2, 'slooww', 'mathara', 1, 'england', 88),
(15, 1, 'asd', 'gampaha', 234, 'hjyu', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `userPassword` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `userName`, `phoneNumber`, `userEmail`, `userPassword`) VALUES
(1, 'Sarahhah Corner', '0772345678', 'corner@yahoo.com', 'hello1234'),
(2, ' John Corner', '0773452298', 'john@gmail.com', '1234hello'),
(4, 'Kamani Perera', '07727655439', 'perera@gmail.com', '1234567');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admintable`
--
ALTER TABLE `admintable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`User_id`);

--
-- Indexes for table `bookingtable`
--
ALTER TABLE `bookingtable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daily`
--
ALTER TABLE `daily`
  ADD PRIMARY KEY (`user_ID`);

--
-- Indexes for table `officers`
--
ALTER TABLE `officers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`user_ID`);

--
-- Indexes for table `reserve`
--
ALTER TABLE `reserve`
  ADD PRIMARY KEY (`user_ID`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`user_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admintable`
--
ALTER TABLE `admintable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `User_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bookingtable`
--
ALTER TABLE `bookingtable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `daily`
--
ALTER TABLE `daily`
  MODIFY `user_ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `officers`
--
ALTER TABLE `officers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `price`
--
ALTER TABLE `price`
  MODIFY `user_ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `reserve`
--
ALTER TABLE `reserve`
  MODIFY `user_ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `user_ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
