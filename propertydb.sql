-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2025 at 10:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `propertydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `property_id`, `user_id`, `booking_date`, `status`) VALUES
(1, 1, 1, '2025-02-25 15:27:30', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `message`, `submitted_at`) VALUES
(1, 'Jitendra Dhamdhere', 'jitendradhamdhere333@gmail.com', '09657795194', '32453', '2025-02-23 13:07:24'),
(2, 'Jitendra Developer', 'jitendradeveloper333@gmail.com', '09657795194', 'fsdkmf', '2025-02-23 14:16:18'),
(3, 'Jitendra Developer', 'jitendradeveloper333@gmail.com', '09657795194', '324', '2025-02-23 14:44:27'),
(4, 'sdlkf', 'admn@gmail.com', 'flkvdm', 'frevlm', '2025-02-23 15:40:08'),
(5, 'test', 'test@gmail.com', '3332221111', 'sdfsvxdgv', '2025-02-23 15:40:25'),
(6, 'tst', 'es@gmail.com', '3214123', 'dwksmd,', '2025-02-23 19:44:06'),
(7, 'Jitendra Developer', 'jitendradeveloper333@gmail.com', '09657795194', 'mssfm', '2025-02-25 13:02:58');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `image_url` longtext NOT NULL,
  `alt_text` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `image_url`, `alt_text`) VALUES
(1, 'image/ferriswheel.jpg', 'Fun Ride 1'),
(2, 'image/splashwater.jpg', 'Water Slide'),
(3, 'image/rollercoaster1.jpg', 'Roller Coaster');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('Apartment','House','Office','Land') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `location` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `bedrooms` int(11) NOT NULL,
  `bathrooms` int(11) NOT NULL,
  `status` enum('Available','Sold','Rented') DEFAULT 'Available',
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `title`, `description`, `type`, `price`, `location`, `size`, `bedrooms`, `bathrooms`, `status`, `image`, `created_at`) VALUES
(1, 'Luxury Apartment in Downtown 1', '1A luxurious 3-bedroom apartment in the heart of the city.', 'House', 20000.00, 'Downtown, City A2112', 1800, 3, 2, 'Rented', 'image\\property1.jpg', '2025-02-25 14:29:20'),
(2, 'Spacious Family House', 'A spacious 4-bedroom house with a large backyard.', 'House', 25000000.00, 'Suburb, City B', 3000, 4, 3, 'Available', 'image\\property2.jpg', '2025-02-25 14:29:20'),
(3, 'Modern Office Space', 'A modern office space suitable for startups.', 'Office', 5000000.00, 'Business District, City C', 1200, 0, 2, 'Available', 'image\\property3.jpg', '2025-02-25 14:29:20'),
(4, 'Prime Land for Development', 'A prime piece of land suitable for residential or commercial development.', 'Land', 15000000.00, 'Outskirts, City D', 5000, 0, 0, 'Available', 'image\\property4.jpg', '2025-02-25 14:29:20'),
(11, 'testnew', 'testnew', 'House', 9000.00, 'pune', 9000, 1, 1, 'Available', 'image/property1.jpg', '2025-02-25 18:45:31'),
(12, 'new', 'fwkjs,dm', 'House', 32879.00, 'fwjsdvk,bmnm', 837, 3, 2, 'Sold', 'image/property2.jpg', '2025-02-25 18:59:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `phone`, `username`, `password`, `created_at`) VALUES
(1, 'Jitendra Dhamdhere', 'jitendradhamdhere333@gmail.com', '9657795194', 'Jitu', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2025-02-23 13:32:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_id` (`property_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
