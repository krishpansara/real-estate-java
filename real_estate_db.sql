-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2026 at 05:57 AM
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
-- Database: `real_estate_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `first_name`, `last_name`, `email`, `phone`, `subject`, `message`, `submitted_at`) VALUES
(1, 'Krish', 'Pansara', 'kpansara790@rku.ac.in', '7984358848', 'general', 'hi my name is this and i have this query', '2026-03-31 21:54:01'),
(2, 'Zeel', 'Manvar', 'kpansara790@rku.ac.in', '7894656213', 'property', 'xngfdnhgtftfdyfj', '2026-04-15 10:09:45');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `favorite_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`favorite_id`, `user_id`, `property_id`, `created_at`) VALUES
(1, 11, 1, '2026-04-13 12:02:29'),
(2, 11, 3, '2026-04-15 04:43:01'),
(3, 11, 6, '2026-04-15 04:43:37');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `property_id`, `sender_id`, `receiver_id`, `message`, `created_at`) VALUES
(1, 2, 9, 9, 'Navrangpura offers a mix of modern apartments, independent houses, and commercial spaces, making it suitable for both residential living and business purposes. The area is well-developed with wide roads, green surroundings, and essential facilities nearby.\r\n\r\nProperties here are in high demand due to their proximity to educational institutions, offices, shopping centers, and hospitals. The locality is well-connected to major parts of Ahmedabad through public transport and main roads.', '2026-03-31 16:36:36'),
(2, 6, 11, 12, 'hello i am ghggfgf', '2026-04-15 04:47:01');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `property_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `purpose` enum('sale','rent') DEFAULT NULL,
  `property_type` varchar(50) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `bedrooms` int(11) DEFAULT NULL,
  `bathrooms` int(11) DEFAULT NULL,
  `area_size` int(11) DEFAULT NULL,
  `property_age` int(11) DEFAULT NULL,
  `furnishing` enum('furnished','semi-furnished','unfurnished') DEFAULT NULL,
  `facing` varchar(50) DEFAULT NULL,
  `availability` varchar(50) DEFAULT NULL,
  `price_negotiable` tinyint(1) DEFAULT 0,
  `city` varchar(100) DEFAULT NULL,
  `locality` varchar(100) DEFAULT NULL,
  `google_map_url` text DEFAULT NULL,
  `status` enum('active','sold','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`property_id`, `user_id`, `title`, `description`, `purpose`, `property_type`, `price`, `bedrooms`, `bathrooms`, `area_size`, `property_age`, `furnishing`, `facing`, `availability`, `price_negotiable`, `city`, `locality`, `google_map_url`, `status`, `created_at`) VALUES
(1, 1, 'ASD ', '  DBNS     jkjKBK   jkdsabdf sa hhds ao  hi hdiuah hfasdhd hed ', 'sale', 'House', 123456.00, 3, 3, 4, 32, 'furnished', 'North', 'Within 30 Days', 0, 'dcsa', 'fdsfdsa', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d29546.56638406819!2d70.8981847!3d22.227904!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959b4a660019ee9%3A0x3d6254f36ed0e794!2sRK%20University%20Main%20Campus!5e0!3m2!1sen!2sin!4v1774355565062!5m2!1sen!2sin', 'inactive', '2026-02-24 13:00:40'),
(2, 9, '2 BHK flat in Navrangpura', 'Navrangpura offers a mix of modern apartments, independent houses, and commercial spaces, making it suitable for both residential living and business purposes. The area is well-developed with wide roads, green surroundings, and essential facilities nearby.\r\n\r\nProperties here are in high demand due to their proximity to educational institutions, offices, shopping centers, and hospitals. The locality is well-connected to major parts of Ahmedabad through public transport and main roads.', 'sale', 'Flat', 96314785.00, 2, 3, 1100, 2, 'unfurnished', 'East', 'Immediate', 1, 'Ahemdabad', 'Navrangpra', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d29546.56638406819!2d70.8981847!3d22.227904!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959b4a660019ee9%3A0x3d6254f36ed0e794!2sRK%20University%20Main%20Campus!5e0!3m2!1sen!2sin!4v1774355565062!5m2!1sen!2sin', 'inactive', '2026-03-31 16:36:23'),
(3, 9, '2 BHK Fully Furnished Flat in Andheri West', 'Spacious 2 BHK fully furnished flat located in the prime area of Andheri West. \r\nClose to metro station, shopping malls, schools, and hospitals. \r\nIncludes modular kitchen, wardrobes, ACs, and covered parking. \r\nIdeal for families and working professionals.', 'rent', 'Flat', 45000.00, 2, 2, 950, 4, 'furnished', 'East', 'Immediate', 1, 'Mumbai', 'Andheri West', 'https://www.google.com/maps?q=Andheri+West+Mumbai&output=embed', 'inactive', '2026-04-07 03:00:08'),
(4, 11, '3BHK Luxurias Flat into Prime Location ', 'this is bestest ever', 'sale', 'Flat', 3500000.00, 3, 4, 1100, 2, 'furnished', 'South', 'Immediate', 0, 'Rajkot', 'Vavdi', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d29546.56638406819!2d70.8981847!3d22.227904!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959b4a660019ee9%3A0x3d6254f36ed0e794!2sRK%20University%20Main%20Campus!5e0!3m2!1sen!2sin!4v1774355565062!5m2!1sen!2sin', 'sold', '2026-04-12 12:53:06'),
(6, 12, 'Panthouse', 'Luxurias Penthouse on prime location', 'sale', 'House', 99100000.00, 9, 13, 5200, 2, 'furnished', 'North', 'Immediate', 0, 'Ahemdabad', 'SindhuBhanav', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d29546.56638406819!2d70.8981847!3d22.227904!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959b4a660019ee9%3A0x3d6254f36ed0e794!2sRK%20University%20Main%20Campus!5e0!3m2!1sen!2sin!4v1774355565062!5m2!1sen!2sin', 'active', '2026-04-13 08:24:23'),
(7, 11, 'vavdi', ' ewhfjdskj k  hsd fkjds  hdsfkjdsk d fdsfkf kjdskfkdsks k', 'sale', 'House', 4450010.00, 2, 2, 1100, 5, 'furnished', 'North', 'Immediate', 1, 'Rajkot', 'Rajkot', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d29546.56638406819!2d70.8981847!3d22.227904!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959b4a660019ee9%3A0x3d6254f36ed0e794!2sRK%20University%20Main%20Campus!5e0!3m2!1sen!2sin!4v1774355565062!5m2!1sen!2sin', 'active', '2026-05-07 03:25:57');

-- --------------------------------------------------------

--
-- Table structure for table `property_features`
--

CREATE TABLE `property_features` (
  `feature_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `feature_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_images`
--

CREATE TABLE `property_images` (
  `image_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_images`
--

INSERT INTO `property_images` (`image_id`, `property_id`, `image_url`, `created_at`) VALUES
(1, 1, '1774357240670_Menu.png', '2026-03-24 13:00:40'),
(2, 2, '1774974983064_ChatGPT Image Mar 14, 2026, 11_11_23 AM.png', '2026-03-31 16:36:23'),
(3, 2, '1774974983065_ChatGPT Image Mar 14, 2026, 11_03_01 AM.png', '2026-03-31 16:36:23'),
(4, 3, '1775530808788_andheri_3.jpg', '2026-04-07 03:00:08'),
(5, 3, '1775530808794_andheri_2.jpg', '2026-04-07 03:00:08'),
(6, 3, '1775530808796_andheri!1.jpg', '2026-04-07 03:00:08'),
(8, 4, '1776000533623_wankhede-stadium-seating-map.jpg', '2026-04-12 13:28:53'),
(11, 6, '1776068663207_31d85a10462bf7298b0ebc1f407b0a3b.jpg', '2026-04-13 08:24:23'),
(12, 6, '1776068663211_luxury-penthouse-rooftop-terrace-skyline-views-perfection-atop-urban-jungle-312853762.webp', '2026-04-13 08:24:23'),
(13, 7, '1778124357107_1355530.png', '2026-05-07 03:25:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reset_token` varchar(255) DEFAULT NULL,
  `token_expiry` datetime DEFAULT NULL,
  `aadhar_number` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `date_of_birth`, `gender`, `street_address`, `city`, `state`, `zip_code`, `country`, `profile_picture`, `created_at`, `reset_token`, `token_expiry`, `aadhar_number`) VALUES
(1, 'admin', 'Krish', 'Pansara', 'adodiya337@rku.ac.in', NULL, '$2a$10$giJTZbEpdlBh1BeR.k/CDOxdqJ1VEQe7CvO568YBY0tV.8vWxWIj6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-14 17:41:48', NULL, NULL, NULL),
(2, 'user', 'Aditya ', 'Dodiya', 'aditya@gmail.com', NULL, '$2a$10$M1E1OMKIomaSJKs3efjpoutW8UG5IFQQlJXMWHHtKarNv0gLvky7W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-14 17:48:39', NULL, NULL, NULL),
(3, 'admin', 'Rushi', 'Sorathiya', 'rushi@gmail.com', NULL, '$2a$10$lP7dkb03S3OIfHiA2Do5p.k5VAe7vaCIF2I59ZaKqfaECek9HYQPy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-14 18:03:13', NULL, NULL, NULL),
(4, 'user', 'Deep', 'Kacha', 'deep@gmail.com', NULL, '$2a$10$gwauLl4xV7LFCR2KiMnIweTB3ATjch0Uv5xUg5Ra4igCzawPWGML6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-14 18:05:58', NULL, NULL, NULL),
(5, 'user', 'Bansi', 'Santoki', 'bansi@gmail.com', NULL, '$2a$10$mF5rKGCoMhGcEUlE5o89Ve1T.CROqDeBxab1ztE/S2pO0lbzQC/8G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-14 18:08:36', NULL, NULL, NULL),
(6, 'user', 'Aastha', 'Kachhi', 'aasu@gmail.com', NULL, '$2a$10$ofcUxjfFet/ZOnAXPVQCOOqtD7vYhYpn/BtywZJ8umjaFWuprwyUu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-14 18:15:34', NULL, NULL, NULL),
(7, 'user', 'Dako', 'Manani', 'dako@gmail.com', NULL, '$2a$10$.EoRKGPqAZfZqpfVApoFSunlDmQbMmqAPW/NSVyJrpEffl2.P.mTy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-18 14:44:06', NULL, NULL, NULL),
(8, 'user', 'Rushi', 'Dodiya', 'rpatel@gmail.com', NULL, '$2a$10$h17bCYMxo4R1sMme/yFbp.ptaBhweGXeXJZu1LhORCcn8lDO27GdK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-31 15:56:11', NULL, NULL, NULL),
(9, 'admin', 'Krish', 'Pansara', 'kpansara790@rku.ac.in', NULL, '$2a$10$crp2rX5SxGuErZ/NY2RmrOexNLMI6JUzqUQBvpKmXCpIQYiAeuMj.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-31 16:21:14', NULL, NULL, NULL),
(10, 'user', 'Rushi', 'Sorathiya', 'rs@gmail.com', NULL, '$2a$10$3JD1/sXsX/5eRb9jy8xZYe0q.rqabJOwm.omWOG3Kq0FjEFdObK/K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-11 05:18:40', NULL, NULL, NULL),
(11, 'user', 'Zeel', 'Manvar', 'zpatel@gmail.com', '7894656213', '$2a$10$ckIxF6th04jjsBhmwNfLhuGvbslzrveZjnWJq0Ynf45hdlEL1hDjq', '2026-04-08', 'male', 'Rajkot', 'Rajkot', 'Gujarat', '360004', 'India', NULL, '2026-04-12 12:49:42', NULL, NULL, '595689331254'),
(12, 'user', 'Rushi', 'Sorathitya', 'rsorathiya880@rku.ac.in', NULL, '$2a$10$RkWnAL4FakCQ22XvuD/q9O7ix3QWxjdPL41bIDq/DyYFTKv/WjyIm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-12 13:57:05', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favorite_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`property_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `property_id` (`property_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`property_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_property_city` (`city`),
  ADD KEY `idx_property_price` (`price`),
  ADD KEY `idx_property_type` (`property_type`),
  ADD KEY `idx_property_purpose` (`purpose`);

--
-- Indexes for table `property_features`
--
ALTER TABLE `property_features`
  ADD PRIMARY KEY (`feature_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `property_images`
--
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `property_id` (`property_id`);

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
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `property_features`
--
ALTER TABLE `property_features`
  MODIFY `feature_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `property_features`
--
ALTER TABLE `property_features`
  ADD CONSTRAINT `property_features_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`) ON DELETE CASCADE;

--
-- Constraints for table `property_images`
--
ALTER TABLE `property_images`
  ADD CONSTRAINT `property_images_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`) ON DELETE CASCADE;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `deactivate_old_properties` ON SCHEDULE EVERY 1 DAY STARTS '2026-04-13 17:44:46' ENDS '2027-04-01 17:44:46' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE properties
SET status = 'inactive'
WHERE status = 'active'
AND created_at <= NOW() - INTERVAL 30 DAY$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
