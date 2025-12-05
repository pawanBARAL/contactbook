-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2025 at 11:29 AM
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
-- Database: `contact_book`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `street` varchar(150) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `contact_id`, `street`, `city`, `state`, `postal_code`) VALUES
(31, 126, NULL, NULL, NULL, NULL),
(32, 127, NULL, NULL, NULL, NULL),
(33, 128, NULL, NULL, NULL, NULL),
(34, 129, NULL, NULL, NULL, NULL),
(35, 130, NULL, NULL, NULL, NULL),
(36, 131, NULL, NULL, NULL, NULL),
(37, 132, NULL, NULL, NULL, NULL),
(38, 133, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_logs`
--

CREATE TABLE `admin_logs` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `action` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_logs`
--

INSERT INTO `admin_logs` (`id`, `admin_id`, `role`, `action`, `description`, `ip_address`, `user_agent`, `created_at`) VALUES
(1, 8, 'user', 'user_create', 'Created new user: hangulama6969@gmail.com (ID: 12)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-25 19:44:33'),
(2, 8, 'user', 'user_delete', 'User ID: 6 deleted (Name: shabrina chowdhury, Email: sabrinachowdhury255@gmail.com)', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-25 19:48:28'),
(3, 8, 'user', 'user_make_admin', 'User ID: 11 promoted to admin', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '2025-11-25 22:56:01');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `country_code` varchar(6) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `group_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_favourite` tinyint(1) NOT NULL DEFAULT 0,
  `favourite_note` text DEFAULT NULL,
  `favourite_reminder` datetime DEFAULT NULL,
  `reminder_note` text DEFAULT NULL,
  `reminder_date` date DEFAULT NULL,
  `reminder_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `user_id`, `name`, `phone`, `country_code`, `email`, `created_at`, `group_id`, `deleted_at`, `is_favourite`, `favourite_note`, `favourite_reminder`, `reminder_note`, `reminder_date`, `reminder_time`) VALUES
(126, 29, 'Rabin Bhattarai', '12345678', '+45', NULL, '2025-11-28 11:02:57', 13, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(127, 29, 'Dawa Tamang', '9876543', '+45', 'hangulama69@gmail.com', '2025-11-28 11:03:32', 13, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(128, 29, 'Sandesh Bastola', '12332145', '+45', NULL, '2025-11-28 11:03:55', 13, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(129, 29, 'Sabrina Carpenter', '2423850987', '+45', NULL, '2025-11-28 11:04:49', 13, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(130, 29, 'Andre Glamborn', '12344321', '+1', 'andreglamborn123@gmail.com', '2025-11-28 11:06:02', 15, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(131, 29, 'Kevin Antonio', '435789478', '+44', NULL, '2025-11-28 11:06:24', 15, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(132, 29, 'Lekh Bahadur Baral', '80986458', '+61', NULL, '2025-11-28 11:06:51', 12, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(133, 29, 'Bal Kumari Baral', '98432793', '+971', NULL, '2025-11-28 11:10:51', 12, NULL, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `favourite_settings`
--

CREATE TABLE `favourite_settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `is_urgent` bit(1) NOT NULL DEFAULT b'0',
  `priority_score` decimal(4,2) DEFAULT NULL,
  `colour_tag` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favourite_settings`
--

INSERT INTO `favourite_settings` (`id`, `user_id`, `contact_id`, `is_urgent`, `priority_score`, `colour_tag`, `description`, `created_at`) VALUES
(1, 6, 0, b'1', 4.00, 'red', 'i dont know', '2025-11-25 08:42:04'),
(2, 6, 0, b'1', 4.00, 'red', 'i dont know', '2025-11-25 08:42:22');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `is_favorite` tinyint(1) DEFAULT 0,
  `status` enum('active','archived') DEFAULT 'active',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `user_id`, `name`, `color`, `is_favorite`, `status`, `created_at`, `updated_at`) VALUES
(11, 5, 'Sandesh Bastola', NULL, 1, 'active', '2025-11-28 11:21:03', '2025-11-28 11:21:03'),
(12, 29, 'Family', NULL, 1, 'active', '2025-11-28 12:02:01', '2025-11-28 15:52:57'),
(13, 29, 'Friends', NULL, 0, 'active', '2025-11-28 12:02:01', '2025-11-28 12:02:01'),
(14, 29, 'Business', NULL, 0, 'archived', '2025-11-28 12:02:01', '2025-11-28 14:45:02'),
(15, 29, 'Work', NULL, 0, 'active', '2025-11-28 12:02:01', '2025-11-28 12:02:01'),
(16, 29, 'Me', NULL, 0, 'active', '2025-11-28 14:31:39', '2025-11-28 14:31:39'),
(18, 29, '123456', NULL, 0, 'active', '2025-12-03 10:30:40', '2025-12-03 13:35:00'),
(19, 29, 'A', NULL, 0, 'active', '2025-12-03 11:15:27', '2025-12-03 11:15:27'),
(20, 29, 'AB', NULL, 0, 'active', '2025-12-03 11:15:32', '2025-12-03 11:15:32'),
(21, 29, 'ABC', NULL, 0, 'active', '2025-12-03 11:15:36', '2025-12-03 11:15:36'),
(22, 29, 'ABCD', NULL, 0, 'active', '2025-12-03 11:15:44', '2025-12-03 11:15:44'),
(23, 29, 'Old Name', NULL, 0, 'active', '2025-12-05 07:54:18', '2025-12-05 07:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `reminder_history`
--

CREATE TABLE `reminder_history` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `category` enum('Personal','Work','Family','Urgent') NOT NULL,
  `created_date` date NOT NULL,
  `created_time` time NOT NULL,
  `reminder_date` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reminder_history`
--

INSERT INTO `reminder_history` (`id`, `contact_id`, `note`, `category`, `created_date`, `created_time`, `reminder_date`, `status`) VALUES
(1, 121, 'call him', 'Personal', '2025-11-24', '22:02:21', '2025-12-05', 1),
(2, 115, 'birthday', 'Personal', '2025-11-24', '22:26:01', '2025-11-28', 1),
(3, 115, 'birthday', 'Personal', '2025-11-25', '09:30:50', '2025-11-28', 1),
(4, 114, 'sdaaaaaaad', 'Personal', '2025-11-25', '09:38:18', '2025-11-26', 1),
(5, 114, 'sdaaaaaaad', 'Personal', '2025-11-25', '09:55:58', '2025-11-26', 1),
(6, 121, 'call him', 'Personal', '2025-11-25', '09:56:49', '2025-12-05', 1),
(7, 114, 'sdaaaaaaad', 'Personal', '2025-11-25', '09:57:14', '2025-11-26', 1),
(8, 121, 'call him', 'Personal', '2025-11-25', '10:21:29', '2025-12-05', 1),
(9, 121, 'call him', 'Personal', '2025-11-25', '10:24:14', '2025-12-05', 1),
(10, 114, 'sdaaaaaaad', 'Personal', '2025-11-25', '10:24:58', '2025-11-26', 1),
(11, 121, 'call him', 'Personal', '2025-11-25', '10:25:38', '2025-12-05', 1),
(12, 121, 'call him', 'Personal', '2025-11-25', '10:34:13', '2025-12-05', 1),
(13, 121, 'call him', 'Personal', '2025-11-26', '18:02:50', '2025-12-05', 1),
(14, 121, 'call him', 'Personal', '2025-11-27', '18:27:37', '2025-12-05', 1),
(15, 121, 'call him', 'Personal', '2025-11-27', '19:26:48', '2025-12-05', 1),
(16, 121, 'call him', 'Personal', '2025-11-27', '19:28:50', '2025-12-05', 1),
(17, 121, 'call him', 'Personal', '2025-11-27', '19:29:21', '2025-12-05', 1),
(18, 115, '', 'Personal', '2025-11-27', '20:22:36', '2025-11-28', 1),
(19, 115, '', 'Personal', '2025-11-27', '20:29:27', '2025-11-28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `is_active` tinyint(1) DEFAULT 1,
  `security_question` text DEFAULT NULL,
  `security_answer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `is_active`, `security_question`, `security_answer`, `created_at`, `updated_at`) VALUES
(1, 'Sandesh Bastola', 'sandeshbastola851@gmail.com', '$2y$10$IFVxImuOhf.qmCfQCICuau/S8yVra/.6Cm29VrySeoCPCgJYtMjze', 'user', 1, NULL, NULL, '2025-11-05 14:49:14', '2025-11-24 13:58:00'),
(2, 'rabin', 'rabin@123gmail.com', '$2y$10$E5nA9IIyh8BL.8aKBOjt0uF7fKeY/jvtZSbsJbsw0msoeWlUT/bOW', 'user', 1, NULL, NULL, '2025-11-05 14:56:49', '2025-11-24 13:58:00'),
(3, 'Sabrina', 'Sabrina@gmail.com', '$2y$10$CKYXUpUSmGaAl/WuLE46.O7H4SDd4cVwCELCOMB0xr2kMzHXUPZ0G', 'user', 1, NULL, NULL, '2025-11-05 15:07:33', '2025-11-24 13:58:00'),
(4, 'Jack', 'jack@gmail.com', '$2y$10$.lMmwE0irNo1sY2J11A8IeBjqq7tL0USlCfmN4gn0/i9gO1HNb7H.', 'user', 1, NULL, NULL, '2025-11-06 21:38:41', '2025-11-24 13:58:00'),
(5, 'Rabin Bhattarai', 'rabin703@gmail.com', '$2y$10$xakBs19YDPcpNNwKvqONfukQMBi1w5zG8cA0DrA4IqNhoOHEALpfq', 'user', 1, NULL, NULL, '2025-11-12 15:07:34', '2025-11-24 13:58:00'),
(7, 'shabia chowdhury', 'sabia@gmail.com', '$2y$10$hFWSq85khxJEDGHf7pvkW.WoBHSb3n84vZfTcg15c/36q/rHa/cz6', 'user', 1, NULL, NULL, '2025-11-22 16:40:08', '2025-11-24 13:58:00'),
(8, 'Administrator', 'admin@contactbook.com', '$2y$10$MIqwRTmidodeu.WSQV64zORTlavn1g2NM2eusLq05z4UK5/xd/BFu', 'admin', 1, NULL, NULL, '2025-11-24 13:58:00', '2025-11-27 21:38:25'),
(11, 'David Tamang', 'david12@gmail.com', '$2y$10$PAhkyAuNi1qhfUER8DZm1uaKS4oMZUOBI4prm5XhTYG8kgzaZ56aq', 'admin', 1, 'What was the name of your first pet?', '$2y$10$XJX70CzbwO8zlje1Z/.woubuyk.AVzO5wZs8kOKhsVy4F8ZDMEsVu', '2025-11-25 19:38:22', '2025-11-25 22:56:01'),
(12, 'Hangu lama', 'hangulama6969@gmail.com', '$2y$10$0TPrMATNpC8WMUZpUdnr8.D6mWUYKrm1NyzuIxdaYpgK25wpdCI/a', 'user', 1, 'What was the name of your first pet?', '$2y$10$Bzw.KZFDEIMz2ubVgIymAuAvS0ZM2IB5U.Q5EN/SXkr1FcG.bWIj6', '2025-11-25 19:44:33', '2025-11-25 19:44:33'),
(13, 'Thapgu lama', 'thapgulama1@gmail.com', '$2y$10$nyVA4nPSO/eS1T8pcb5yce8W5k0nakuotWn0AqwZamsgBIQ9oFQJm', 'user', 1, 'What was the name of your first pet?', '$2y$10$ZxsZeDadK4frShkuEdbDMegXHTUPAAd8l9Mrq77Gtqc8U/I8M2Sum', '2025-11-26 09:17:10', '2025-11-26 09:17:10'),
(18, 'John Smith', 'john.smith@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 1, 'What city were you born in?', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2025-11-26 09:47:14', '2025-11-26 09:47:14'),
(19, 'Sarah Johnson', 'sarah.j@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 1, 'What was the name of your first school?', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2025-11-26 09:47:14', '2025-11-26 09:47:14'),
(20, 'Mike Chen', 'mike.chen@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 1, 'What is your mother\'s maiden name?', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2025-11-26 09:47:14', '2025-11-26 09:47:14'),
(21, 'Emily Davis', 'emily.davis@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 1, 'What was your childhood nickname?', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2025-11-26 09:47:14', '2025-11-26 09:47:14'),
(22, 'David Wilson', 'david.wilson@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 1, 'What is your favorite sports team?', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2025-11-26 09:47:14', '2025-11-26 09:47:14'),
(26, 'Dawa Tamang', 'dawamktn4@gmail.com', '$2y$10$KDpq8Re4E2U12YXp8i7/T.kSHbnY2qc3voEEV.4aQaU4yuJ2g0i/C', 'user', 1, 'What was the name of your first pet?', '$2y$10$3PWoHEP0cR/3WbKLR4ZV7e5oF3Wnvfx1GQWLs8a9CDLYavUl7a36q', '2025-11-26 13:33:56', '2025-11-26 13:33:56'),
(28, 'Rohan Silwal', 'Rohan@gmail.com', '$2y$10$BjRn/DF85GD./NGNLeTM4.E4xb1.YMINylXC0OteHsZIktAi0UYUi', 'user', 1, 'What city were you born in?', '$2y$10$2LqczzdVsyxQLraiz7xiHern3R5iZxc1xExQ/278coyh2sf/kmuBC', '2025-11-28 01:02:46', '2025-11-28 01:02:46'),
(29, 'Pawan Baral Chhetri', 'pawanbaral05@gmail.com', '$2y$10$GXGsWyYLJuoQH2z9udVuw.NUuknexx1/.J4HMY0hOKIjIEIezLQR.', 'user', 1, NULL, NULL, '2025-11-28 11:02:01', '2025-11-28 11:02:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Indexes for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_contacts_group` (`group_id`);

--
-- Indexes for table `favourite_settings`
--
ALTER TABLE `favourite_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`);

--
-- Indexes for table `reminder_history`
--
ALTER TABLE `reminder_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `favourite_settings`
--
ALTER TABLE `favourite_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `reminder_history`
--
ALTER TABLE `reminder_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD CONSTRAINT `admin_logs_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
