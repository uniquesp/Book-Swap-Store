-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2024 at 07:10 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_swap_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `publication_year` year(4) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `book_price` double DEFAULT NULL,
  `cover_pic` varchar(255) DEFAULT NULL,
  `book_status` varchar(20) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `registration_date` timestamp NULL DEFAULT current_timestamp(),
  `updation_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `title`, `author`, `publisher`, `publication_year`, `description`, `book_price`, `cover_pic`, `book_status`, `language`, `category_id`, `subcategory_id`, `is_deleted`, `registration_date`, `updation_date`) VALUES
(2, 'rtgrg', 'sujit', 'RajHansa', 2013, 'dfvdxv xcv', 545, 'b878a1b9-cc24-4c39-8b47-a4e2b8bbf1cd.jpg', 'In stock', 'Marathi,other,Tamil', 1, 1, 0, '2024-03-06 12:22:38', '2024-03-28 11:17:44'),
(3, 'rtg5rdg', 'rdtgr', 'dhskjfhks', 2013, 'erscdfersf', 345, 'bfec2e6e-abd4-462d-8384-e2a50f6e0cd3.jpg', 'In stock', 'Marathi,Hindi', 1, 2, 1, '2024-03-06 12:28:49', '2024-03-26 11:04:49'),
(4, 'rferdvf', 'refedf', 'dhskjfhks', 2017, 'sdcscas', 343, '88d878ef-b4b2-4a8e-97c2-58afcb107bb2.jpg', 'out of stock', 'Marathi,Hindi', 2, 1, 0, '2024-03-07 06:08:41', '2024-03-15 09:47:48'),
(5, 'ttryry', 'Dr. APJ Abdul Kalam', 'dhskjfhks', 2013, 'rferfsefrwe', 787, 'ed67e8ad-21f1-48c3-9cd5-7f3a42a2e3e0.jpg', 'out of stock', 'Marathi,Hindi', 2, 2, 0, '2024-03-08 10:15:51', '2024-03-15 09:47:48'),
(6, 'edrwafrwe', 'Dr. APJ Abdul Kalam', 'ghbfgv', 2013, 'fresdfcseser', 67, '69c6cdd8-0d9f-46f6-ace4-694498630871.jpg', 'In stock', 'Hindi', 1, 1, 0, '2024-03-08 10:21:54', '2024-03-15 09:47:07'),
(7, 'edrwafrwe', 'Dr. APJ Abdul Kalam', 'ghbfgv', 2013, 'fresdfcseser', 67, '61c0c587-8bcd-4691-99ca-e6278190ca30.jpg', 'In stock', 'Hindi', 1, 1, 1, '2024-03-08 10:24:23', '2024-03-26 11:04:10'),
(8, 'gbnhfgc', 'dfvdfvd', 'fgbfgbfg', 2013, 'dfvxdv', 56, '7206cbf6-0a9d-43fd-94bb-7b332d1e45be.jpeg', 'out of stock', 'Marathi', 1, 1, 0, '2024-03-08 10:35:58', '2024-03-15 09:47:48'),
(9, 'gdrtgdr', 'erdgsdef', 'dhskjfhks', 2017, 'rftefdeefedf', 66, '2fbb7caa-5773-420a-87ec-e9b54a4016d3.jpg', 'out of stock', 'Marathi', 2, 1, 1, '2024-03-08 10:44:07', '2024-03-26 11:05:15'),
(10, 'dfjsdfj', 'dfsdfsd', 'fgbfgbfg', 2017, 'fdgbdfbf', 65, '17c896f7-9294-4bbc-b929-00953442cda0.jpg', 'In stock', 'Marathi', 1, 1, 0, '2024-03-08 10:46:30', '2024-03-15 09:47:07'),
(11, 'dfggd', 'dfdd', 'dhskjfhks', 2013, 'dfvxdfvxcv', 66, 'aae0c2fd-5275-4430-ac15-9add5f0e1763.png', 'In stock', 'Marathi', 1, 1, 0, '2024-03-08 10:50:31', '2024-03-26 08:30:26'),
(12, 'sdfsdfd', 'dfsdfsd', 'fsdfsd', 2013, 'adsdxsxza', 560, '8634b50a-277d-412e-9a28-42e78b796a09.jpg', 'In stock', 'Marathi,English', 2, 2, 0, '2024-03-13 03:56:51', '2024-03-15 09:47:07'),
(13, 'dfsdfsd', 'dfsdfsdzf', 'dhskjfhks', 2013, 'fsdfcsdxc zxc', 567, '6cb2df99-70dc-4991-9090-7ffc4fd287e8.jpg', 'In stock', 'English', 3, 3, 0, '2024-03-15 09:33:13', '2024-03-15 09:47:07'),
(14, 'dfdd', 'fdgdfgdf', 'RajHansa', 2013, 'dcsdcsdc', 200, '73be9b61-34b4-4196-9f91-f9980ad3ac0d.jpg', 'out of stock', 'Hindi', 2, 2, 0, '2024-03-15 09:50:22', '2024-03-26 08:30:26');

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_category`
--

INSERT INTO `book_category` (`id`, `category_name`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Fiction', 0, '2024-03-06 06:09:29', '2024-03-07 05:33:34'),
(2, 'Non-Fiction', 0, '2024-03-06 06:09:34', '2024-03-29 04:05:02'),
(3, 'Childrens', 0, '2024-03-13 12:09:46', '2024-03-13 12:09:46'),
(4, 'Languages', 0, '2024-03-29 09:02:53', '2024-03-29 09:02:53'),
(5, 'Commics -Novels', 0, '2024-03-29 09:03:31', '2024-03-29 09:03:31'),
(6, 'Young-Adults', 0, '2024-03-29 09:03:56', '2024-03-29 09:03:56'),
(7, 'Academics', 0, '2024-03-29 09:32:50', '2024-03-29 09:32:50');

-- --------------------------------------------------------

--
-- Table structure for table `book_sell`
--

CREATE TABLE `book_sell` (
  `id` int(11) NOT NULL,
  `book_name` varchar(45) DEFAULT NULL,
  `book_author` varchar(45) DEFAULT NULL,
  `publication_year` year(4) DEFAULT NULL,
  `book_language` varchar(45) DEFAULT NULL,
  `selling_price` double DEFAULT 0,
  `original_price` double DEFAULT 0,
  `book_image` varchar(255) DEFAULT NULL,
  `requestfor` varchar(25) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(25) DEFAULT 'Pending',
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_sell`
--

INSERT INTO `book_sell` (`id`, `book_name`, `book_author`, `publication_year`, `book_language`, `selling_price`, `original_price`, `book_image`, `requestfor`, `user_id`, `status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'vxcvxcv', 'xcvxcv', 2013, 'fddg', 300, 600, 'c528abf1-8470-44c7-bac8-3acb6443ac50.jpg', 'Token', 5, 'Rejected', 0, '2024-03-25 15:20:43', '2024-03-27 17:41:04'),
(2, 'vxcvxcv', 'xcvxcv', 2013, 'fddg', 300, 600, 'c02f4ebd-2c5e-4793-aefa-1a2ab78ca95e.jpg', 'Money', 5, 'Accepted', 0, '2024-03-25 15:21:04', '2024-04-01 19:04:05'),
(3, '7 Habits', 'Robert Victim', 2017, 'fddg', 200, 350, 'aa84ff2b-6ade-4c46-9d0d-5b52828e90e1.jpg', 'Token', 3, 'Accepted', 0, '2024-03-25 18:57:16', '2024-03-26 19:00:09'),
(4, '7 Habits', 'Robert Victim', 2017, 'fddg', 200, 350, '8309f626-437e-466f-9012-6ea7c6cef5aa.jpg', 'Token', 3, 'Rejected', 0, '2024-03-25 18:57:23', '2024-03-27 15:39:58'),
(5, 'refwerew', 'fgfdg', 2019, 'fddg', 300, 600, 'f58bfe0b-b1f7-49aa-a2f4-ce8c3d7f7903.jpeg', 'Token', 3, 'Accepted', 0, '2024-03-25 19:04:27', '2024-03-27 17:52:12'),
(6, 'go2', 'dxcxdzcx', 2020, 'marathi', 300, 800, '0dd568a0-0dee-40ad-8dba-fdf6a4a14675.jpg', 'Money', 3, 'Accepted', 0, '2024-03-26 09:30:08', '2024-03-27 17:45:37'),
(7, 'fvdvc', 'vcxvc', 2013, 'fddg', 300, 600, 'eb603047-401d-43e0-a7de-b86daa42b58a.jpeg', 'Money', 14, 'Pending', 0, '2024-03-26 10:15:54', '2024-03-27 17:43:58'),
(15, 'fsdfszdf', 'fsdefsf', 2013, 'fddg', 300, 600, 'af659ed3-fa08-434b-b071-916821a668cf.jpg', 'Token', 8, 'Accepted', 0, '2024-03-26 15:55:37', '2024-03-26 19:12:51'),
(16, 'tdgdfgdf', 'dgffdf', 2017, 'gdfgdfg', 500, 900, '70cb796f-785f-428b-92b1-91dc7d0be143.jpg', 'Token', 8, 'Rejected', 0, '2024-03-26 15:57:16', '2024-03-26 19:12:55'),
(17, 'scdsccf', 'zxczxc', 2013, 'marathi', 600, 800, '5797212e-13cb-4031-97ff-69c66b5ff133.jpg', 'Token', 14, 'Pending', 0, '2024-03-27 18:25:42', '2024-03-27 18:25:42'),
(18, 'ghfghfgh', 'fdgdfgdf', 2015, 'marathi', 500, 900, '9e08de39-6431-46a6-b643-71a069dc26cc.jpg', 'Token', 14, 'Rejected', 0, '2024-03-27 18:26:10', '2024-03-27 18:26:45');

-- --------------------------------------------------------

--
-- Table structure for table `book_subcategory`
--

CREATE TABLE `book_subcategory` (
  `id` int(11) NOT NULL,
  `subcategory_name` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_subcategory`
--

INSERT INTO `book_subcategory` (`id`, `subcategory_name`, `category_id`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Personal Transformation', 2, 0, '2024-03-06 06:45:52', '2024-03-06 06:45:52'),
(2, 'Mystry', 3, 0, '2024-03-06 06:59:15', '2024-03-15 08:01:00'),
(3, 'Fantasy', 1, 0, '2024-03-07 04:03:34', '2024-03-15 07:55:32'),
(4, 'Economics', 2, 0, '2024-03-29 04:03:05', '2024-03-29 04:03:05'),
(5, 'Activity Books', 3, 0, '2024-03-29 04:05:43', '2024-03-29 04:05:43'),
(6, 'Horror', 1, 0, '2024-03-29 04:06:38', '2024-03-29 04:06:38');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL COMMENT '	',
  `is_ordered` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `is_tokenused` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `quantity`, `total_price`, `user_id`, `book_id`, `is_ordered`, `is_deleted`, `is_tokenused`, `created_at`, `updated_at`) VALUES
(1, 1, 545, 3, 2, 1, 1, 0, '2024-03-12 06:53:48', '2024-03-19 11:37:10'),
(2, 1, 545, 3, 2, 1, 1, 0, '2024-03-12 06:54:32', '2024-03-19 11:37:10'),
(4, 1, 545, 3, 2, 1, 1, 0, '2024-03-12 06:55:26', '2024-03-19 11:37:10'),
(5, 1, 787, 3, 5, 1, 1, 0, '2024-03-12 06:55:56', '2024-03-21 05:12:13'),
(6, 3, 168, 5, 8, 1, 1, 0, '2024-03-12 11:26:23', '2024-03-22 12:16:04'),
(7, 1, 545, 3, 2, 1, 1, 0, '2024-03-13 04:58:21', '2024-03-19 11:37:10'),
(8, 1, 67, 3, 6, 1, 1, 0, '2024-03-13 04:59:38', '2024-03-21 05:07:16'),
(9, 1, 67, 3, 6, 1, 1, 0, '2024-03-13 05:00:16', '2024-03-21 05:07:16'),
(10, 1, 67, 3, 6, 1, 1, 0, '2024-03-13 06:37:08', '2024-03-21 05:07:16'),
(11, 1, 343, 3, 4, 1, 1, 1, '2024-03-13 06:52:12', '2024-03-21 05:27:03'),
(12, 1, 560, 3, 12, 1, 1, 1, '2024-03-13 06:52:29', '2024-03-20 04:13:35'),
(13, 1, 56, 3, 8, 1, 1, 1, '2024-03-13 06:55:56', '2024-03-20 04:19:54'),
(14, 1, 66, 3, 11, 1, 1, 1, '2024-03-13 06:57:42', '2024-03-21 05:13:50'),
(15, 1, 545, 6, 2, 0, 1, 0, '2024-03-13 12:43:59', '2024-03-19 10:31:36'),
(16, 1, 545, 6, 2, 0, 0, 0, '2024-03-13 12:47:54', '2024-03-19 10:31:36'),
(17, 1, 343, 6, 4, 0, 1, 0, '2024-03-13 12:47:56', '2024-03-19 10:31:36'),
(18, 1, 65, 3, 10, 1, 1, 0, '2024-03-13 13:36:37', '2024-03-21 05:13:33'),
(19, 1, 66, 3, 11, 1, 1, 1, '2024-03-13 13:38:48', '2024-03-21 05:13:50'),
(20, 1, 66, 3, 11, 1, 1, 1, '2024-03-13 13:40:13', '2024-03-21 05:13:50'),
(21, 1, 66, 3, 11, 1, 1, 1, '2024-03-13 13:40:45', '2024-03-21 05:13:50'),
(22, 1, 67, 3, 6, 1, 1, 0, '2024-03-14 06:22:40', '2024-03-21 05:07:16'),
(23, 1, 65, 3, 10, 1, 1, 0, '2024-03-14 06:26:00', '2024-03-21 05:13:33'),
(24, 1, 56, 3, 8, 1, 1, 1, '2024-03-14 06:30:12', '2024-03-20 04:19:54'),
(25, 1, 560, 3, 12, 1, 1, 1, '2024-03-14 06:32:17', '2024-03-20 04:13:35'),
(26, 1, 560, 3, 12, 1, 1, 1, '2024-03-14 06:40:45', '2024-03-20 04:13:35'),
(27, 1, 65, 3, 10, 1, 1, 0, '2024-03-15 11:50:30', '2024-03-21 05:13:33'),
(28, 1, 56, 3, 8, 1, 1, 1, '2024-03-18 04:12:29', '2024-03-20 04:19:54'),
(29, 1, 65, 3, 10, 1, 1, 0, '2024-03-18 04:13:25', '2024-03-21 05:13:33'),
(30, 1, 545, 3, 2, 1, 1, 0, '2024-03-18 06:02:51', '2024-03-19 11:37:10'),
(31, 1, 343, 3, 4, 1, 1, 1, '2024-03-18 06:02:53', '2024-03-21 05:27:03'),
(32, 1, 343, 3, 4, 1, 1, 1, '2024-03-18 06:19:03', '2024-03-21 05:27:03'),
(33, 1, 560, 3, 12, 1, 1, 1, '2024-03-18 06:19:07', '2024-03-20 04:13:35'),
(34, 1, 343, 3, 4, 1, 1, 1, '2024-03-18 06:26:09', '2024-03-21 05:27:03'),
(35, 1, 567, 3, 13, 1, 1, 0, '2024-03-18 06:26:26', '2024-03-21 05:20:07'),
(36, 1, 560, 3, 12, 1, 1, 1, '2024-03-18 06:32:45', '2024-03-20 04:13:35'),
(37, 2, 1134, 3, 13, 1, 1, 0, '2024-03-18 06:32:48', '2024-03-21 05:20:07'),
(38, 1, 56, 3, 8, 1, 1, 1, '2024-03-18 07:30:51', '2024-03-20 04:19:54'),
(39, 1, 787, 3, 5, 1, 1, 0, '2024-03-18 07:37:26', '2024-03-21 05:12:13'),
(40, 1, 787, 14, 5, 1, 1, 1, '2024-03-18 12:23:11', '2024-03-22 07:40:37'),
(41, 1, 56, 14, 8, 1, 1, 1, '2024-03-18 12:23:14', '2024-03-22 07:40:37'),
(42, 1, 343, 14, 4, 1, 1, 1, '2024-03-18 13:30:16', '2024-03-22 07:40:37'),
(43, 1, 560, 5, 12, 1, 1, 0, '2024-03-19 04:50:54', '2024-03-22 12:16:04'),
(44, 1, 560, 5, 12, 1, 1, 0, '2024-03-19 11:20:31', '2024-03-22 12:16:04'),
(45, 1, 65, 5, 10, 1, 1, 0, '2024-03-19 11:57:03', '2024-03-19 13:26:28'),
(46, 1, 343, 5, 4, 1, 1, 0, '2024-03-19 13:28:38', '2024-03-22 12:16:04'),
(47, 1, 56, 3, 8, 1, 1, 1, '2024-03-20 04:19:40', '2024-03-20 04:19:54'),
(48, 1, 200, 8, 14, 1, 1, 1, '2024-03-20 04:24:27', '2024-03-22 09:06:32'),
(49, 1, 65, 8, 10, 1, 1, 1, '2024-03-20 04:29:53', '2024-03-22 09:06:32'),
(50, 1, 343, 8, 4, 1, 1, 1, '2024-03-20 04:34:34', '2024-03-22 09:06:32'),
(51, 1, 560, 8, 12, 1, 1, 1, '2024-03-20 04:37:36', '2024-03-22 09:06:32'),
(52, 1, 56, 8, 8, 1, 1, 1, '2024-03-20 04:42:40', '2024-03-20 04:42:48'),
(53, 1, 567, 8, 13, 1, 1, 1, '2024-03-20 04:45:16', '2024-03-20 04:48:37'),
(54, 1, 343, 3, 4, 1, 1, 1, '2024-03-20 08:14:12', '2024-03-21 05:27:03'),
(55, 1, 67, 3, 6, 1, 1, 0, '2024-03-20 12:39:11', '2024-03-21 05:07:16'),
(56, 1, 787, 3, 5, 1, 1, 0, '2024-03-21 05:07:12', '2024-03-21 05:12:13'),
(57, 1, 343, 3, 4, 1, 1, 1, '2024-03-21 05:12:08', '2024-03-21 05:27:03'),
(58, 1, 200, 3, 14, 1, 1, 1, '2024-03-21 05:12:26', '2024-03-21 05:21:20'),
(59, 1, 560, 3, 12, 1, 1, 1, '2024-03-21 05:12:30', '2024-03-21 05:13:50'),
(60, 1, 343, 3, 4, 1, 1, 1, '2024-03-21 05:13:24', '2024-03-21 05:27:03'),
(61, 1, 65, 3, 10, 1, 1, 0, '2024-03-21 05:13:28', '2024-03-21 05:13:33'),
(62, 1, 66, 3, 11, 1, 1, 1, '2024-03-21 05:13:42', '2024-03-21 05:13:50'),
(63, 1, 560, 3, 12, 1, 1, 1, '2024-03-21 05:13:44', '2024-03-21 05:13:50'),
(64, 1, 545, 3, 2, 1, 1, 0, '2024-03-21 05:17:04', '2024-03-21 05:18:31'),
(65, 1, 343, 3, 4, 1, 1, 1, '2024-03-21 05:17:06', '2024-03-21 05:27:03'),
(66, 1, 560, 3, 12, 1, 1, 0, '2024-03-21 05:19:45', '2024-03-21 05:20:07'),
(67, 1, 567, 3, 13, 1, 1, 0, '2024-03-21 05:19:47', '2024-03-21 05:20:07'),
(68, 1, 200, 3, 14, 1, 1, 1, '2024-03-21 05:20:20', '2024-03-21 05:21:20'),
(69, 1, 343, 3, 4, 1, 1, 1, '2024-03-21 05:25:31', '2024-03-21 05:27:03'),
(70, 1, 343, 3, 4, 1, 1, 1, '2024-03-21 05:58:04', '2024-03-25 12:08:54'),
(71, 1, 56, 3, 8, 1, 1, 1, '2024-03-21 05:58:28', '2024-03-25 12:08:54'),
(72, 2, 686, 5, 4, 1, 1, 0, '2024-03-21 06:29:07', '2024-03-22 12:16:04'),
(73, 1, 66, 5, 11, 1, 1, 1, '2024-03-21 06:29:11', '2024-03-22 05:25:01'),
(74, 1, 567, 5, 13, 1, 1, 1, '2024-03-21 09:23:10', '2024-03-22 05:25:01'),
(75, 1, 343, 8, 4, 1, 1, 1, '2024-03-22 08:41:55', '2024-03-22 09:06:32'),
(76, 1, 56, 8, 8, 1, 1, 1, '2024-03-22 08:42:15', '2024-03-22 09:06:32'),
(77, 1, 65, 8, 10, 1, 1, 1, '2024-03-22 08:42:18', '2024-03-22 09:06:32'),
(78, 1, 56, 8, 8, 1, 1, 1, '2024-03-22 09:36:29', '2024-03-22 09:37:56'),
(79, 1, 65, 8, 10, 1, 1, 1, '2024-03-22 09:36:31', '2024-03-22 09:37:56'),
(80, 1, 787, 8, 5, 1, 1, 1, '2024-03-22 09:57:45', '2024-03-22 12:24:20'),
(81, 2, 112, 8, 8, 1, 1, 1, '2024-03-22 12:19:56', '2024-03-22 12:24:20'),
(82, 1, 67, 5, 6, 1, 1, 0, '2024-03-22 12:50:40', '2024-03-22 12:52:42'),
(83, 1, 65, 5, 10, 1, 1, 0, '2024-03-22 12:56:22', '2024-03-22 13:00:22'),
(84, 1, 56, 5, 8, 1, 1, 0, '2024-03-22 13:00:59', '2024-03-22 13:02:41'),
(85, 1, 67, 5, 6, 1, 1, 1, '2024-03-22 13:03:15', '2024-03-22 13:04:10'),
(86, 1, 66, 5, 11, 1, 1, 1, '2024-03-22 13:03:24', '2024-03-22 13:04:10'),
(87, 1, 66, 5, 11, 1, 1, 1, '2024-03-22 13:08:54', '2024-03-22 13:12:42'),
(88, 1, 65, 5, 10, 1, 1, 1, '2024-03-22 13:08:57', '2024-03-22 13:12:42'),
(89, 1, 56, 5, 8, 0, 1, 0, '2024-03-25 04:43:52', '2024-03-25 05:01:16'),
(90, 1, 787, 5, 5, 0, 1, 0, '2024-03-25 04:45:00', '2024-03-25 05:01:17'),
(91, 1, 343, 5, 4, 1, 1, 0, '2024-03-25 05:02:10', '2024-03-25 05:12:41'),
(92, 1, 56, 5, 8, 0, 0, 0, '2024-03-25 05:18:38', '2024-03-25 05:18:38'),
(93, 1, 56, 3, 8, 1, 1, 0, '2024-03-26 13:36:06', '2024-03-26 14:00:42'),
(94, 1, 567, 3, 13, 1, 1, 0, '2024-03-28 11:26:53', '2024-03-29 04:25:06'),
(95, 1, 343, 3, 4, 1, 1, 1, '2024-04-01 13:31:21', '2024-04-01 13:32:30'),
(96, 1, 787, 3, 5, 0, 0, 0, '2024-04-01 13:34:41', '2024-04-01 13:34:41');

--
-- Triggers `cart`
--
DELIMITER $$
CREATE TRIGGER `token_discount` AFTER UPDATE ON `cart` FOR EACH ROW BEGIN
    DECLARE v_token_amount DOUBLE;
	#DECLARE v_total_price DOUBLE;
   IF(NEW.is_deleted = 1 AND NEW.is_ordered = 1 AND NEW.is_tokenused = 1) THEN
        SELECT token_amount INTO v_token_amount FROM user WHERE id = NEW.user_id;
        IF (v_token_amount > 0) THEN  
        #SELECT total_price INTO v_total_price FROM cart WHERE user_id = NEW.user_id LIMIT 1;
            IF (OLD.total_price > 0) THEN 
                IF (OLD.total_price >= v_token_amount) THEN 
                    UPDATE user SET token_amount = 0 WHERE id = NEW.user_id;
                ELSE
                    UPDATE user SET token_amount = token_amount - OLD.total_price WHERE id = NEW.user_id;  
                END IF;
            END IF;
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `admin_email` varchar(255) DEFAULT NULL,
  `admin_mobileno` varchar(45) DEFAULT NULL,
  `admin_address` varchar(255) DEFAULT NULL,
  `admin_password` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `registration_date` timestamp NULL DEFAULT current_timestamp(),
  `updation_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `first_name`, `last_name`, `admin_email`, `admin_mobileno`, `admin_address`, `admin_password`, `is_deleted`, `registration_date`, `updation_date`) VALUES
(1, 'Sakshi', 'Admin', 'admin@gmail.com', '8976566545', 'pune', '123456', 0, '2024-03-05 07:57:24', '2024-03-05 07:57:24'),
(2, 'Test', 'Test2', 'test@gmail.com', '7878787878', 'dsdfcszdxc', '123456', 0, '2024-03-13 12:00:02', '2024-03-13 12:16:45');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_password` varchar(45) DEFAULT NULL,
  `user_mobileno` varchar(45) DEFAULT NULL,
  `user_birthdate` date DEFAULT NULL,
  `user_gender` varchar(45) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `token_amount` double DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `registration_date` timestamp NULL DEFAULT current_timestamp(),
  `updation_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `user_email`, `user_password`, `user_mobileno`, `user_birthdate`, `user_gender`, `user_address`, `token_amount`, `is_deleted`, `registration_date`, `updation_date`) VALUES
(1, 'sakshi', 'sakshi@gmail.com', '123456', '8975466534', '2024-03-12', 'no', 'sdsfsfdfsd vdfvdf', 0, 1, '2024-03-07 13:30:33', NULL),
(3, 'atish Jadhav', 'atish@gmail.com', '123456', '8975466534', '2024-03-06', 'male', 'esqwdwasde', 0, 0, '2024-03-08 03:46:15', NULL),
(5, 'sonam', 'sonam@gmail.com', '123456', '8975466534', '2024-03-14', 'other', 'sdsfsfdfsd vdfvdf', 69, 0, '2024-03-08 03:47:07', NULL),
(6, 'Shinchan Nohara', 'shinchan@gmail.com', '123456', '7878787878', '2024-03-07', 'male', 'wewdse', 0, 1, '2024-03-13 12:42:04', NULL),
(7, 'sanika', 'sanika@gmail.com', '123456', '8975466534', '2024-03-22', 'female', 'sdsfsfdfsd vdfvdf', 0, 0, '2024-03-15 04:40:58', NULL),
(8, 'tom jerry', 'tom@gmail.com', '123456', '8975466534', '2024-03-25', 'male', 'sdsfsfdfsd vdfvdf', 0, 0, '2024-03-15 04:53:28', NULL),
(9, 'Robert', 'robert@gmail.com', '123456', '7878787878', '2024-03-05', 'male', 'sdesdes', 0, 0, '2024-03-15 05:33:10', NULL),
(14, 'Rohini', 'rohini@gmail.com', '123456', '7878787878', '2024-03-05', 'male', 'sdesdes', 0, 0, '2024-03-15 05:33:53', NULL),
(15, 'rohit', 'rohit@gmail.com', '123456', '8975466534', '2024-03-06', 'male', 'wewdse', 0, 1, '2024-03-15 05:34:56', NULL),
(17, 'jaya', 'jaya@gmail.com', '123456', '7878787878', '2024-03-19', 'female', 'sdesdes', 0, 1, '2024-03-15 05:43:17', NULL),
(18, 'uma', 'uma@gmail.com', '123456', '8975466534', '2024-02-28', 'female', 'wewdse', 0, 1, '2024-03-15 05:45:20', NULL),
(19, 'mona', 'mona@gmail.com', '123456', '8975466534', '2024-03-21', 'female', 'sdsfsfdfsd vdfvdf', 0, 1, '2024-03-15 05:47:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `book_id`) VALUES
(6, NULL, NULL),
(10, 3, 13),
(12, 5, 4),
(13, 5, 11),
(14, 8, 6),
(15, 8, 8),
(18, 3, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_category_id_idx` (`category_id`),
  ADD KEY `fk_subcategory_id_idx` (`subcategory_id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `book_sell`
--
ALTER TABLE `book_sell`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_book_sell_1_idx` (`user_id`);

--
-- Indexes for table `book_subcategory`
--
ALTER TABLE `book_subcategory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `category_id_idx` (`category_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_book_id_idx` (`book_id`),
  ADD KEY `fk_user_id_idx` (`user_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `user_email_UNIQUE` (`user_email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_user_id_2_idx` (`user_id`),
  ADD KEY `fk_book_id_2_idx` (`book_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `book_sell`
--
ALTER TABLE `book_sell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `book_subcategory`
--
ALTER TABLE `book_subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_category_id_1` FOREIGN KEY (`category_id`) REFERENCES `book_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_subcategory_id` FOREIGN KEY (`subcategory_id`) REFERENCES `book_subcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book_sell`
--
ALTER TABLE `book_sell`
  ADD CONSTRAINT `fk_book_sell_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book_subcategory`
--
ALTER TABLE `book_subcategory`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `book_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_book_id_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `fk_book_id_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


/*Trigger*/
CREATE DEFINER=`root`@`localhost` TRIGGER `cart_AFTER_UPDATE` AFTER UPDATE ON `cart` FOR EACH ROW BEGIN
    DECLARE v_token_amount DOUBLE;
	#DECLARE v_total_price DOUBLE;
   IF(NEW.is_deleted = 1 AND NEW.is_ordered = 1 AND NEW.is_tokenused = 1) THEN
        SELECT token_amount INTO v_token_amount FROM user WHERE id = NEW.user_id;
        IF (v_token_amount > 0) THEN  
        #SELECT total_price INTO v_total_price FROM cart WHERE user_id = NEW.user_id LIMIT 1;
            IF (OLD.total_price > 0) THEN 
                IF (OLD.total_price >= v_token_amount) THEN 
                    UPDATE user SET token_amount = 0 WHERE id = NEW.user_id;
                ELSE
                    UPDATE user SET token_amount = token_amount - OLD.total_price WHERE id = NEW.user_id;  
                END IF;
            END IF;
        END IF;
    END IF;
END