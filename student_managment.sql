-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2022 at 04:20 PM
-- Server version: 5.5.36
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_managment`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `datetime` date DEFAULT NULL,
  `present` int(11) DEFAULT NULL,
  `remark` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `student_id`, `datetime`, `present`, `remark`) VALUES
(1, 'STUD001', '2022-01-01', 1, 'remark'),
(2, 'STUD004', '2022-01-01', 1, 'remark'),
(3, 'STUD004', '2022-01-02', 1, 'remark'),
(4, 'STUD004', '2022-02-27', 0, 'Absent'),
(5, 'STUD004', '2022-02-20', 0, 'Holiday');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `emp_id` varchar(20) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `fee` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `emp_id`, `name`, `duration`, `type`, `fee`) VALUES
(5, 'EMP003', 'English', '6', 'Half Yeraly', 8500),
(7, 'EMP004', 'GK', '4', 'Quartely', 2100);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `role` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `address` varchar(120) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `name`, `role`, `email`, `phone`, `address`, `gender`) VALUES
('EMP002', 'surbhi', 'role', 'emp@gmai.com', '7737692289', 'hesdf sdf llodfs', 'Male'),
('EMP003', 'sadsa', 'role', 'e@gmail.com', '7867867', '11 dsf sdf fs', 'Female'),
('EMP004', 'sadsa', 'role', 'd@gmail.com', '7867867', 'dsfsdf dsfsdf', 'Female'),
('EMP005', 'teacher', 'role', 't@gmail.com', '9876543210', 'asd asdasd sad', 'Male'),
('EMP006', 'teacher1', 'role', 'teacher1@gmail.com', '7879', 'sgdu sdfh sdhf sdf89 sdf', 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `course_id` varchar(20) DEFAULT NULL,
  `grade` varchar(20) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `student_id`, `course_id`, `grade`, `remark`) VALUES
(1, 'STUD001', '1', 'A', 'remark'),
(2, 'STUD004', '5', 'A', 'remark'),
(3, 'STUD004', '5', 'B', 'remark'),
(4, 'STUD004', 'undefined', 'F', 'Fail, Very poor');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `status` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `student_id`, `course_id`, `payment_date`, `total_amount`, `payment_method`, `status`) VALUES
(8, 'STUD004', 5, '2022-02-27', 8500, 'Net Banking', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `enroll_no` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `email` varchar(120) NOT NULL,
  `phone` int(10) NOT NULL,
  `dob` date NOT NULL,
  `standard` varchar(20) NOT NULL,
  `address` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`enroll_no`, `name`, `gender`, `email`, `phone`, `dob`, `standard`, `address`) VALUES
('STUD001', 'rasda', 'Male', 'r@gmai.com', 2147483647, '1993-02-12', '10th', 'sdfjsdkfjsdlf'),
('STUD002', 'student', 'Male', 's@gmail.com', 89789789, '2022-02-18', '5', 'jbmn hgj'),
('STUD003', 'xczx', 'Female', 'zxczx@sad.sd', 343543, '2022-02-11', '3', 'dsfsd'),
('STUD004', 'stud', 'Male', 'stud@gmail.com', 789789798, '2022-02-10', '6', 'sdasd sdasd dsfsd dsfsdf');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `user_id`, `role`) VALUES
(8, 'rahul91', '0f98df87c7440c045496f705c7295344', 'STUD001', 'student'),
(9, 'emp91', '7b7f71bff78951c020e9c647a32bb839', 'EMP002', 'employee'),
(10, 'admin', '21232f297a57a5a743894a0e4a801fc3', '0', 'admin'),
(11, 'sad', 'fhgfgh', 'EMP003', 'employee'),
(12, 'sadjhgj', '3f3723f3390e5196a1f0b0a289988d7e', 'EMP004', 'employee'),
(13, 'teacher', '8d788385431273d11e8b43bb78f3aa41', 'EMP005', 'employee'),
(14, 'student', 'cd73502828457d15655bbd7a63fb0bc8', 'STUD002', 'student'),
(15, 'xsad', '49f0bad299687c62334182178bfd75d8', 'STUD003', 'student'),
(16, 'teacher1', '41c8949aa55b8cb5dbec662f34b62df3', 'EMP006', 'employee'),
(18, 'stud', 'b9ac0988cdd72928bc964d81d5858bb7', 'STUD004', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `course_emp_id` (`emp_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `course_studnet_id` (`student_id`),
  ADD KEY `payment_course_id` (`course_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`enroll_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`enroll_no`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `course_studnet_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`enroll_no`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `payment_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
