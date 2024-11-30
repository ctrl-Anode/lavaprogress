-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 22, 2024 at 05:13 AM
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
-- Database: `lavaui`
--

-- --------------------------------------------------------

--
-- Table structure for table `classbookings`
--

CREATE TABLE `classbookings` (
  `booking_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `booking_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('booked','cancelled') DEFAULT 'booked',
  `reminder_sent` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `instructor` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `capacity` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emailverifications`
--

CREATE TABLE `emailverifications` (
  `verification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `verification_code` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_used` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fitnessgymusers`
--

CREATE TABLE `fitnessgymusers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `gender` varchar(225) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fitnessgymusers`
--

INSERT INTO `fitnessgymusers` (`id`, `first_name`, `middle_name`, `last_name`, `username`, `email`, `contact`, `gender`, `address`, `password`) VALUES
(1, 'Arnold', 'Adeva', 'Adeva', 'Anode', 'ayminzane05@gmail.com', '09876543211', 'male', 'pachoca ilang-ilang', '$2y$10$0okaS3ZmFP4j2JCgk9F09exE4wnrS.viQP8NcrawEZriM/kloZxJ2'),
(4, 'danica', 'p', 'colobong', 'danica', 'danica@gmail.com', '12345678900', 'female', 'masipit', '$2y$10$QJay9BozI1YlVsWdiJ6WMOz6qYas//8pPabM/pFtZqXDO7yzizEmS');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `emergency_contact` varchar(50) DEFAULT NULL,
  `membership_type_id` int(11) DEFAULT NULL,
  `fitness_goals` text DEFAULT NULL,
  `membership_status` enum('active','inactive','canceled') DEFAULT 'inactive',
  `profile_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `membership_id` int(11) NOT NULL,
  `membership_type` varchar(20) NOT NULL,
  `membership_price` int(10) NOT NULL,
  `membership_info` varchar(255) NOT NULL,
  `membership_benefits` varchar(255) NOT NULL,
  `membership_duration` varchar(255) NOT NULL,
  `membership_term_con` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`membership_id`, `membership_type`, `membership_price`, `membership_info`, `membership_benefits`, `membership_duration`, `membership_term_con`, `created_at`, `updated_at`) VALUES
(1, 'monthly', 500, 'qwrfwerfwedfwe', 'sefwerwqerdw', 'dqwrawerfwerfw', 'werer3er3WE', '2024-11-19 15:43:00', NULL),
(4, 'montly', 500, 'asdfghj', 'sdfghjk', 'wertyuil', 'wertyuiop', '2024-11-20 02:01:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `membershiptypes`
--

CREATE TABLE `membershiptypes` (
  `membership_type_id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `duration` int(11) NOT NULL,
  `benefits` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('payment','class_reminder') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE `password_reset` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `reset_token` varchar(10) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_reset`
--

INSERT INTO `password_reset` (`id`, `email`, `reset_token`, `created_on`) VALUES
(1, 'ayminzane05@gmail.com', 'MaC7iOH63D', '2024-11-17 00:18:55');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('gcash','personal') NOT NULL,
  `receipt_upload` varchar(255) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `approved_by_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `ip` varchar(60) NOT NULL,
  `session_data` varchar(70) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `browser`, `ip`, `session_data`, `created_at`) VALUES
(40, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', '::1', 'dfd11862b218d89fb200c51462ee47f91a9b1db4539ce32eebad615e62a098e8', '2024-11-22 12:10:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_token` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `google_oauth_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_token`, `email_verified_at`, `password`, `remember_token`, `google_oauth_id`, `created_at`, `updated_at`) VALUES
(1, 'huozmii', 'danica@gmail.com', '05a801f0704ad63bf46d2cd790f934dd49a4618aa17d39bf8bb3b128fcb48041bd750506e80f3651963a07a1aa44d38a560c', NULL, '$2y$04$MB1Veuo19qDokYpSS9Mi..t5gnIex0ccvzvEgna083azVuZng53iq', NULL, NULL, '2024-11-08 03:54:09', NULL),
(2, 'anode', 'anode@gmail.com', '565a5222ebad055965166b109c88fa1f44a27578d5aecc0288507ffe9824c4b7498cea8ce52829331d533657f28b8e10bf4b', NULL, '$2y$04$7EsgU7aYd3ZWRnYny7Chs.G7Dyo7XrYJJ3gm/qje1iaxBgH3F2b6y', NULL, NULL, '2024-11-11 04:38:43', NULL),
(3, 'Arnold', 'ayminzane05@gmail.com', '5e80cd635653357e5578667c22ffa30cc0443799c5e5d5214a2e65beab3adad2c468faa2e1551d162190c38c16a43712aff4', NULL, '$2y$04$DCBbO3J3zH89hQePNOnlnuFv5XaICbXW37GDo7oEzCEuIO7m/og3e', NULL, NULL, '2024-11-12 20:09:12', '2024-11-16 16:23:42'),
(4, 'danica1', 'danica1@gmail.com', '76d5482b3ab1a36bf39213af866954631728454169af61c5d0f0fdf43f66172786c44c99b0fa6e625d4aaebd87a0ff920ad1', NULL, '$2y$04$qd8E3cG0T4KlqlF6qFywEu7MrCG.EtCietH9egNuLNwxVPtM7mpUy', NULL, NULL, '2024-11-18 01:29:29', NULL),
(5, 'Anode10', 'anode12@gmail.com', 'b30d1323087a0624bb30eb61d47854f14a55f8cd0b117c94d2f3c3dfac6dc365c4f3f2cf27529250f7f1e1fb0b04a17b4443', NULL, '$2y$04$IB0zvZkDa8SBSLtMPxWtj.FpGx62Pp/f8PkcqLn8L0aRnhlCGORgK', NULL, NULL, '2024-11-19 12:58:16', NULL);



--
-- Indexes for table `classbookings`
--
ALTER TABLE `classbookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `emailverifications`
--
ALTER TABLE `emailverifications`
  ADD PRIMARY KEY (`verification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `fitnessgymusers`
--
ALTER TABLE `fitnessgymusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `membership_type_id` (`membership_type_id`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`membership_id`);

--
-- Indexes for table `membershiptypes`
--
ALTER TABLE `membershiptypes`
  ADD PRIMARY KEY (`membership_type_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `usersessions`
--
ALTER TABLE `usersessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `userstb`
--
ALTER TABLE `userstb`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`uname`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classbookings`
--
ALTER TABLE `classbookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emailverifications`
--
ALTER TABLE `emailverifications`
  MODIFY `verification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fitnessgymusers`
--
ALTER TABLE `fitnessgymusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `membership_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `membershiptypes`
--
ALTER TABLE `membershiptypes`
  MODIFY `membership_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usersessions`
--
ALTER TABLE `usersessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `userstb`
--
ALTER TABLE `userstb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classbookings`
--
ALTER TABLE `classbookings`
  ADD CONSTRAINT `classbookings_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `classbookings_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE;

--
-- Constraints for table `emailverifications`
--
ALTER TABLE `emailverifications`
  ADD CONSTRAINT `emailverifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `members_ibfk_2` FOREIGN KEY (`membership_type_id`) REFERENCES `membershiptypes` (`membership_type_id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
