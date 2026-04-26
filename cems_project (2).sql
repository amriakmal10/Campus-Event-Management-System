-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2026 at 05:19 AM
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
-- Database: `cems_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `organizer` varchar(100) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `category` enum('Workshop','Seminar','Competition','Festival','Sport','Course') NOT NULL,
  `venue` varchar(200) NOT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `mode` enum('Physical','Online','Hybrid') NOT NULL,
  `registration_close_date` date NOT NULL,
  `max_participants` int(11) DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT 0.00,
  `remarks` text DEFAULT NULL,
  `poster_path` varchar(255) DEFAULT NULL,
  `status` enum('active','cancelled','completed') DEFAULT 'active',
  `approval_status` enum('pending','approved','rejected') DEFAULT 'approved',
  `is_highlighted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Group Project - Hanbali & Amri';

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `user_id`, `event_name`, `description`, `organizer`, `contact_person`, `contact_no`, `category`, `venue`, `event_date`, `event_time`, `mode`, `registration_close_date`, `max_participants`, `fee`, `remarks`, `poster_path`, `status`, `approval_status`, `is_highlighted`, `created_at`, `updated_at`) VALUES
(3, 4, 'Black Market Window Shopping', 'window shopping at the black market', 'Black Market Club', 'Rulz', '0111111111', 'Course', 'Axiata Arena', '2024-12-15', '10:51:00', 'Physical', '2026-01-12', 3, 0.00, '', '1768092776_logoums.png', 'active', 'approved', 0, '2026-01-11 00:52:56', '2026-01-14 08:45:24'),
(5, 4, 'Sports Festival', 'm', 'Sports Unit', '', '0111111111', 'Sport', 'Stadium', '2026-03-01', '16:51:00', 'Physical', '2026-02-25', 200, 0.00, '', '1768279970_1768094720_logoums.png', 'active', 'approved', 0, '2026-01-13 04:52:50', '2026-01-14 08:48:04'),
(6, 1, 'Sports Festival', 'q', 'Sports Unit', '', '0111111111', 'Competition', 'Stadium', '2024-12-01', '13:04:00', 'Physical', '2026-01-13', 200, 0.00, '', '1768280656_1768280626_1768279970_1768094720_logoums.png', 'completed', 'approved', 0, '2026-01-13 05:04:16', '2026-01-14 08:45:34'),
(13, 4, 'Bank Heist', 'heist heist', 'Finance Club', 'Finance Club President', '0123456789', 'Competition', 'DKP 10', '2026-01-14', '16:57:00', 'Physical', '2026-01-14', 16, 0.00, '', '1768380973_logoums.png', 'active', 'approved', 0, '2026-01-14 08:56:13', '2026-01-14 08:56:13'),
(14, 1, 'Test Feature', 'test', 'Me', 'Me', '0121212121', 'Workshop', 'my house', '2026-01-15', '13:13:00', 'Physical', '2026-01-15', 10, 0.00, '', '1768450398_logoums.png', 'active', 'approved', 0, '2026-01-15 04:13:18', '2026-01-15 04:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `event_feedback`
--

CREATE TABLE `event_feedback` (
  `feedback_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Group Project - Hanbali & Amri';

--
-- Dumping data for table `event_feedback`
--

INSERT INTO `event_feedback` (`feedback_id`, `event_id`, `user_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(1, 6, 4, 5, 'best event', '2026-01-13 05:58:43', '2026-01-13 05:58:43');

-- --------------------------------------------------------

--
-- Table structure for table `event_messages`
--

CREATE TABLE `event_messages` (
  `message_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_messages`
--

INSERT INTO `event_messages` (`message_id`, `event_id`, `sender_id`, `subject`, `message`, `sent_at`) VALUES
(1, 5, 4, 'update', 'program cancelled', '2026-01-13 05:29:21'),
(2, 5, 4, 'update', 'event canceled', '2026-01-14 08:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `event_registrations`
--

CREATE TABLE `event_registrations` (
  `registration_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('registered','cancelled','attended') DEFAULT 'registered',
  `approval_status` enum('pending','approved','rejected') DEFAULT 'approved',
  `attendance_status` enum('present','absent','pending') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_registrations`
--

INSERT INTO `event_registrations` (`registration_id`, `event_id`, `user_id`, `registration_date`, `status`, `approval_status`, `attendance_status`) VALUES
(4, 5, 4, '2026-01-13 04:53:00', 'registered', 'approved', 'pending'),
(5, 6, 4, '2026-01-13 05:04:38', 'registered', 'approved', 'pending'),
(9, 5, 1, '2026-01-14 08:56:54', 'registered', 'approved', 'pending'),
(11, 14, 4, '2026-01-15 04:16:18', 'registered', 'approved', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Group Project - Hanbali & Amri';

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `event_id`, `type`, `title`, `message`, `is_read`, `created_at`) VALUES
(2, 4, 6, 'registration', 'Registration Confirmed', 'You have successfully registered for \'Sports Festival\'. We\'ll send you reminders as the event approaches.', 1, '2026-01-13 05:04:38'),
(3, 4, 5, 'message', 'New Message: update', 'program cancelled', 1, '2026-01-13 05:29:21'),
(8, 4, 5, 'message', 'New Message: update', 'event canceled', 1, '2026-01-14 08:54:54'),
(9, 1, 13, 'registration', 'Registration Confirmed', 'You have successfully registered for \'Bank Heist\'. We\'ll send you reminders as the event approaches.', 0, '2026-01-14 08:56:35'),
(10, 1, 5, 'registration', 'Registration Confirmed', 'You have successfully registered for \'Sports Festival\'. We\'ll send you reminders as the event approaches.', 0, '2026-01-14 08:56:54'),
(11, 1, 13, 'cancellation', 'Registration Cancelled', 'Your registration for \'Bank Heist\' has been cancelled.', 0, '2026-01-14 09:10:12'),
(12, 4, 14, 'registration', 'Registration Confirmed', 'You have successfully registered for \'Test Feature\'. We\'ll send you reminders as the event approaches.', 0, '2026-01-15 04:13:33'),
(13, 4, 14, 'cancellation', 'Registration Cancelled', 'Your registration for \'Test Feature\' has been cancelled.', 0, '2026-01-15 04:16:12'),
(14, 4, 14, 'registration', 'Registration Confirmed', 'You have successfully registered for \'Test Feature\'. We\'ll send you reminders as the event approaches.', 0, '2026-01-15 04:16:18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `category` enum('staff','student','public') NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `is_suspended` tinyint(1) DEFAULT 0,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `organization` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `recommend_events` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `category`, `is_admin`, `is_suspended`, `fullname`, `email`, `phone`, `organization`, `password`, `recommend_events`, `created_at`, `updated_at`) VALUES
(1, 'staff', 1, 0, 'Admin User', 'admin@ums.edu.my', '0123456789', 'UMS', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Workshop,Seminar', '2026-01-09 10:13:02', '2026-01-14 02:35:06'),
(4, 'staff', 0, 0, 'rulz', 'rulz@gmail.com', '0111111111', 'Black Market Club', '$2y$10$hc18OyFevobWZls8ujpuUOpd.Hh3BeSbDTqQX.0NHtvVghhIdWwfK', 'Workshop,Seminar,Competition', '2026-01-11 00:44:32', '2026-01-14 08:46:35'),
(5, 'student', 0, 0, 'rulz2', 'rulz2@gmail.com', '0111111111', 'student', '$2y$10$OjuuX5uExc9G9z1g/OkT3eqqj91aNAHbWcG3QlC34V5yoMUrSSOYm', 'Workshop,Seminar,Competition,Festival,Sport,Course', '2026-01-12 02:11:15', '2026-01-12 02:11:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `event_feedback`
--
ALTER TABLE `event_feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD UNIQUE KEY `unique_feedback` (`event_id`,`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_event_rating` (`event_id`,`rating`);

--
-- Indexes for table `event_messages`
--
ALTER TABLE `event_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `idx_event` (`event_id`),
  ADD KEY `idx_sent` (`sent_at`);

--
-- Indexes for table `event_registrations`
--
ALTER TABLE `event_registrations`
  ADD PRIMARY KEY (`registration_id`),
  ADD UNIQUE KEY `unique_registration` (`event_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `idx_user_read` (`user_id`,`is_read`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `event_feedback`
--
ALTER TABLE `event_feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event_messages`
--
ALTER TABLE `event_messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `event_registrations`
--
ALTER TABLE `event_registrations`
  MODIFY `registration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `event_feedback`
--
ALTER TABLE `event_feedback`
  ADD CONSTRAINT `event_feedback_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_feedback_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `event_messages`
--
ALTER TABLE `event_messages`
  ADD CONSTRAINT `event_messages_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `event_registrations`
--
ALTER TABLE `event_registrations`
  ADD CONSTRAINT `event_registrations_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_registrations_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
