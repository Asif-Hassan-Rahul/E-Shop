-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2020 at 01:29 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elaravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_04_10_192554_create_tbl_admin_table', 1),
(2, '2020_04_10_211444_create_tbl_category_table', 2),
(3, '2020_05_01_161621_create_manufacture_table', 3),
(4, '2020_05_01_181537_create_tbl_products_table', 4),
(5, '2020_05_01_233317_create_tbl_slider_table', 5),
(6, '2020_05_03_234649_create_tbl_customer_table', 6),
(7, '2020_05_07_183207_create_tbl_shipping_table', 7),
(8, '2020_05_09_071837_create_tbl_payment_table', 8),
(9, '2020_05_09_071918_create_tbl_order_table', 8),
(10, '2020_05_09_071948_create_tbl_order_details_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `promocodes`
--

CREATE TABLE `promocodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reward` double(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_disposable` tinyint(1) NOT NULL DEFAULT 0,
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promocodes`
--

INSERT INTO `promocodes` (`id`, `code`, `reward`, `quantity`, `data`, `is_disposable`, `expires_at`) VALUES
(51, '38E7-8LH4', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:14:06'),
(53, '35DQ-BE9G', 20.00, 46, '[\"null\"]', 0, '2020-05-17 08:14:06'),
(54, 'JZM4-55XK', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:14:06'),
(55, '4M7V-K95G', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:14:06'),
(56, 'YZN5-NLHS', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:14:06'),
(57, 'DR3A-FB65', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:14:06'),
(58, '2TQJ-4PZK', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:14:06'),
(59, 'GLVN-UQ34', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:14:06'),
(60, 'KF28-3FW8', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:14:06'),
(61, '4UTS-QMEW', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:17:25'),
(62, 'PXLZ-6CD9', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:17:25'),
(63, 'K4F2-8Q2Y', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:17:25'),
(64, '2Q2F-XJJK', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:17:25'),
(65, 'J6JS-GNWM', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:17:25'),
(66, 'PWNB-YZA8', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:17:25'),
(67, 'XYV3-BV7A', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:17:25'),
(68, 'F3PG-UQ3Q', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:17:25'),
(69, 'XRZF-EWJX', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:17:25'),
(70, 'KPSZ-MN2Y', 20.00, 50, '[\"null\"]', 0, '2020-05-17 08:17:25');

-- --------------------------------------------------------

--
-- Table structure for table `promocode_user`
--

CREATE TABLE `promocode_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `promocode_id` int(10) UNSIGNED NOT NULL,
  `used_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`, `created_at`, `updated_at`) VALUES
(1, 'asifhassan95@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Asif Hassan', '01827116341', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`, `category_description`, `publication_status`, `created_at`, `updated_at`) VALUES
(8, 'Man', 'This is man', 1, NULL, NULL),
(9, 'Women', 'This is women', 1, NULL, NULL),
(10, 'Child', 'this is child', 1, NULL, NULL),
(11, 'Electronics', 'this is electronics', 1, NULL, NULL),
(12, 'Others', 'this is others.', 1, NULL, NULL),
(13, 'Accessories', 'this is accessories', 1, NULL, NULL),
(14, 'Furniture', 'this is furniture', 1, NULL, NULL),
(15, 'Shoes', 'This is sports', 1, NULL, NULL),
(16, 'Camera', 'This is camera', 1, NULL, NULL),
(20, 'Bags', 'This is bags', 1, NULL, NULL),
(21, 'Beauty & Body care', 'This is Beauty & Body care', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`customer_id`, `customer_name`, `customer_email`, `password`, `mobile_number`, `created_at`, `updated_at`) VALUES
(1, 'Asif Hassan', 'asifhassan3665@yahoo.com', 'e10adc3949ba59abbe56e057f20f883e', '01827116341', NULL, NULL),
(3, 'Asif Hassan Rahul', 'asifhassan95@yahoo.com', 'e10adc3949ba59abbe56e057f20f883e', '01827116341', NULL, NULL),
(4, 'Asif', 'something123@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '01827116341', NULL, NULL),
(5, 'Shadhin', 'shadhin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '01521208281', NULL, NULL),
(6, 'Shahreen', 'shahreen@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2316541345623', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manufacture`
--

CREATE TABLE `tbl_manufacture` (
  `manufacture_id` int(10) UNSIGNED NOT NULL,
  `manufacture_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufacture_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufacture_logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_manufacture`
--

INSERT INTO `tbl_manufacture` (`manufacture_id`, `manufacture_name`, `manufacture_description`, `manufacture_logo`, `publication_status`, `created_at`, `updated_at`) VALUES
(1, 'Samsung', 'This is samsung', 'image/samsung.png', 1, NULL, NULL),
(2, 'Zara', 'This is Zara for women', 'image/zara.jpg', 1, NULL, NULL),
(3, 'Otobi', 'Otobi furniture', 'image/otobi.png', 1, NULL, NULL),
(4, 'Apple', 'All apple products', 'image/apple.png', 1, NULL, NULL),
(7, 'Nike', 'Nike Shoes', 'image/nike.jpg', 1, NULL, NULL),
(8, 'Canon', 'Canon camera', 'image/canon.png', 1, NULL, NULL),
(9, 'Remax', 'remax accessories', 'image/remax.png', 1, NULL, NULL),
(10, 'Adidas', 'This is Adidas', 'image/adidas.png', 1, NULL, NULL),
(11, 'ChuChu', 'this is ChuChu', 'image/chuchu.jpg', 1, NULL, NULL),
(12, 'H&M', 'this is H&M', 'image/yiIhJ5wa2i5erropVa7g.png', 1, NULL, NULL),
(13, 'Gillette', 'Gillette', 'image/bvZzZrmMwhIlYldjk3lH.png', 1, NULL, NULL),
(14, 'Unilever', 'Unilever', 'image/IH3ru7JqxnqCo3lIQj6z.jpg', 1, NULL, NULL),
(15, 'Microsoft', 'Microsoft', 'image/XMKy2IfsWzy1WCp0XpGp.jpg', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `customer_id`, `shipping_id`, `payment_id`, `order_total`, `order_status`, `created_at`, `updated_at`) VALUES
(4, 3, 7, 6, '170,000.00', 'Pending', '2020-05-09 09:30:53', NULL),
(5, 3, 8, 7, '14,685.00', 'Pending', '2020-05-09 16:41:01', NULL),
(6, 3, 8, 8, '14,685.00', 'Pending', '2020-05-09 16:43:22', NULL),
(7, 3, 8, 9, '14,685.00', 'Pending', '2020-05-09 16:45:16', NULL),
(8, 6, 9, 10, '5,712.00', 'Pending', '2020-05-09 22:26:45', NULL),
(9, 5, 10, 11, '75,000.00', 'Pending', '2020-05-10 14:59:32', NULL),
(10, 5, 10, 12, '41600', 'Pending', '2020-05-10 20:25:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_sales_quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`order_details_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_sales_quantity`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 'Iphone 7', '60000', '2', NULL, NULL),
(2, 4, 18, 'Canon 700D', '50000', '1', NULL, NULL),
(3, 5, 6, 'Shoe 2', '2000', '1', NULL, NULL),
(4, 5, 9, 'Shirt 1', '1000', '1', NULL, NULL),
(5, 5, 20, 'Gillette Foam Mostirizing 200 ML', '335', '1', NULL, NULL),
(6, 5, 25, 'Xbox Wireless Controller - Grey and Green', '11350', '1', NULL, NULL),
(7, 6, 6, 'Shoe 2', '2000', '1', NULL, NULL),
(8, 6, 9, 'Shirt 1', '1000', '2', NULL, NULL),
(9, 6, 20, 'Gillette Foam Mostirizing 200 ML', '335', '2', NULL, NULL),
(10, 6, 25, 'Xbox Wireless Controller - Grey and Green', '11350', '1', NULL, NULL),
(11, 7, 6, 'Shoe 2', '2000', '1', NULL, NULL),
(12, 7, 9, 'Shirt 1', '1000', '1', NULL, NULL),
(13, 7, 20, 'Gillette Foam Mostirizing 200 ML', '335', '1', NULL, NULL),
(14, 7, 25, 'Xbox Wireless Controller - Grey and Green', '11350', '1', NULL, NULL),
(15, 8, 19, 'Gillette Vector Cartridges2', '56', '2', NULL, NULL),
(16, 8, 20, 'Gillette Foam Mostirizing 200 ML', '335', '1', NULL, NULL),
(17, 8, 21, 'Gillette Foam Regular 418 gm', '385', '5', NULL, NULL),
(18, 8, 22, 'Lifebuoy Soap Bar Total - 100gm', '34', '10', NULL, NULL),
(19, 8, 24, 'Unilever AXE Signature Mysterious Body Perfume 122 ml', '300', '7', NULL, NULL),
(20, 8, 23, 'Sunsilk Black Shine Shampoo', '180', '5', NULL, NULL),
(21, 9, 2, 'Iphone 7', '60000', '1', NULL, NULL),
(22, 9, 7, 'Shoe 3', '2000', '7', NULL, NULL),
(23, 9, 9, 'Shirt 1', '1000', '1', NULL, NULL),
(24, 10, 6, 'Shoe 2', '2000', '1', NULL, NULL),
(25, 10, 18, 'Canon 700D', '50000', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_payment`
--

INSERT INTO `tbl_payment` (`payment_id`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 'handcash', 'Pending', '2020-05-09 09:23:04', NULL),
(2, 'handcash', 'Pending', '2020-05-09 09:24:52', NULL),
(3, 'handcash', 'Pending', '2020-05-09 09:27:02', NULL),
(4, 'handcash', 'Pending', '2020-05-09 09:27:41', NULL),
(5, 'debitcard', 'Pending', '2020-05-09 09:28:33', NULL),
(6, 'bkash', 'Pending', '2020-05-09 09:30:53', NULL),
(7, 'handcash', 'Pending', '2020-05-09 16:41:01', NULL),
(8, 'handcash', 'Pending', '2020-05-09 16:43:22', NULL),
(9, 'handcash', 'Pending', '2020-05-09 16:45:16', NULL),
(10, 'handcash', 'Pending', '2020-05-09 22:26:45', NULL),
(11, 'handcash', 'Pending', '2020-05-10 14:59:32', NULL),
(12, 'handcash', 'Pending', '2020-05-10 20:25:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `manufacture_id` int(11) NOT NULL,
  `product_short_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_long_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double(8,2) NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`product_id`, `product_name`, `category_id`, `manufacture_id`, `product_short_description`, `product_long_description`, `product_price`, `product_image`, `product_size`, `product_color`, `publication_status`, `created_at`, `updated_at`) VALUES
(1, 'Iphone 11 pro', 11, 4, 'asdasdasd', 'asdasdasdasdasdasdasd', 600000.00, 'image/W5IuE3VjBb7xj2FPUmJs.jpg', 'XL', 'Black', 1, NULL, NULL),
(2, 'Iphone 7', 11, 4, 'This is iphone 7', 'This is iphone 7', 60000.00, 'image/COrCrhotvySJxoj9SZ8l.jpg', 'L', 'Black, Red', 1, NULL, NULL),
(3, 'Headphone 1', 13, 9, 'asdasdasdasd', 'asdasdasdasdasdasdasd', 500.00, 'image/fNiRCghUCMp5mZuJaqSK.jpeg', 'Null', 'Black', 0, NULL, NULL),
(4, 'Headphone 2', 13, 9, 'asdasdasdasdasd', 'asdasdasdasdasdasdasd', 500.00, 'image/6RjISdO0q8OuPbI3atRf.jpg', 'Null', 'Black, Red', 1, NULL, NULL),
(5, 'Shoe 1', 15, 7, 'asdasdasdasdasd', 'asdasdasdasdasd', 2000.00, 'image/kW4SUN0UiAYwf9sbm7Ry.jpg', 'XL', 'Black, Red', 1, NULL, NULL),
(6, 'Shoe 2', 15, 7, 'asdasdasdasdasd', 'asdasdasdasdasd', 2000.00, 'image/fUmqcEubpCTMCNVA6S5G.webp', 'XL', 'Black, Red', 1, NULL, NULL),
(7, 'Shoe 3', 15, 10, 'asdasdasdasdasd', 'asdasdasdasdasd', 2000.00, 'image/l5U4VSnwwcn04PxdQsoJ.jpg', 'XL', 'Black', 1, NULL, NULL),
(8, 'Shoe 4', 15, 10, 'asdasdasdasdasd', 'asdasdasdasdasd', 2000.00, 'image/8wbm8gtwobNT4brE7W7P.webp', 'L', 'Black, Red', 1, NULL, NULL),
(9, 'Shirt 1', 8, 2, 'asdasdasdasdasd', 'asdasdasdasdasd', 1000.00, 'image/4ddqKr7znwrEOiz4PYDy.jpg', 'L', 'Black', 1, NULL, NULL),
(10, 'Shirt 2', 8, 2, 'asdasdasdasdasd', 'asdasdasdasdasd', 1000.00, 'image/AbIjBlaUJPyMDdXPHcos.jpg', 'L', 'Black', 1, NULL, NULL),
(11, 'Dress 1', 9, 2, 'asdasdasdasdasd', 'asdasdasdasdasd', 5000.00, 'image/rmmepWIGzIsJfpHBSsnG.jpg', 'S', 'Black, Red', 1, NULL, NULL),
(12, 'Dress 2', 9, 2, 'asdasdasdasdasd', 'asdasdasdasdasd', 5000.00, 'image/zq5Y29L49pEUdgpGSIrj.jpg', 'M,L', 'Black, Red', 1, NULL, NULL),
(13, 'Dipani', 10, 11, 'asdasdasdasdasdas', 'asdasdasdasdasdas', 900.00, 'image/Thva03ByTNZtgl0xE9cl.jpg', 'S', 'white', 1, NULL, NULL),
(14, 'Huggies', 10, 11, 'asdasdasdasdasdas', 'asdasdasdasdasdas', 700.00, 'image/X2tHVhRVFN0xtgHkfQRs.jpg', 'S', 'white', 1, NULL, NULL),
(15, 'Pampers', 10, 11, 'asdasdasdasdasdas', 'asdasdasdasdasdas', 500.00, 'image/hGGykupmJv7gAawWHP7b.jpg', 'S', 'white', 1, NULL, NULL),
(16, 'Canon 90D', 16, 8, 'asdasdasdasdasdas', 'asdasdasdasdasdas', 80000.00, 'image/aCyWdMZ4OoibfNqVJSwd.png', 'Null', 'Black', 1, NULL, NULL),
(18, 'Canon 700D', 16, 8, 'asdasdasdasdasdas', 'asdasdasdasdasdas', 50000.00, 'image/8cRoJ9IQNmavxxLu4o1v.jpg', 'Null', 'Black', 1, NULL, NULL),
(19, 'Gillette Vector Cartridges2', 21, 13, 'SKU: 0x4921e\r\nBrand : Gillette  |  More Blades & Cartridges from Gillette', 'SKU: 0x4921e\r\nBrand : Gillette  |  More Blades & Cartridges from Gillette', 56.00, 'image/qL3SUTOfIVUvYXQxRIas.jpg', 'Null', 'Null', 1, NULL, NULL),
(20, 'Gillette Foam Mostirizing 200 ML', 21, 13, 'SKU: 0x49217\r\nBrand : Gillette  |  More Shaving & Grooming from Gillette', 'SKU: 0x49217\r\nBrand : Gillette  |  More Shaving & Grooming from Gillette', 335.00, 'image/Zl93U13RUVxfnSyMT33G.jpg', 'Null', 'Null', 1, NULL, NULL),
(21, 'Gillette Foam Regular 418 gm', 21, 13, 'SKU: 0x4920c\r\nBrand : Gillette  |  More Shaving & Grooming from Gillette', 'SKU: 0x4920c\r\nBrand : Gillette  |  More Shaving & Grooming from Gillette', 385.00, 'image/Jh1pqhFQQWmb2uBWlEY3.jpg', 'Null', 'Null', 1, NULL, NULL),
(22, 'Lifebuoy Soap Bar Total - 100gm', 21, 14, 'Eliminate germs and bacteria from your skin with LIFEBUOY Total Soap Bar. This disinfectant soap bar is formulated with an Active Naturol Shield that fights disease-causing germs and keeps you healthy. It ensures a complete germ protection for your family. Apart from better germ protection, this invigorating soap bar also provides skin care benefits. Enjoy a refreshing and cooling shower, with this soap, every day.', 'Eliminate germs and bacteria from your skin with LIFEBUOY Total Soap Bar. This disinfectant soap bar is formulated with an Active Naturol Shield that fights disease-causing germs and keeps you healthy. It ensures a complete germ protection for your family. Apart from better germ protection, this invigorating soap bar also provides skin care benefits. Enjoy a refreshing and cooling shower, with this soap, every day.', 34.00, 'image/LT5ERL7C4ePZJ66mDw74.jpg', '100gm', 'Red', 1, NULL, NULL),
(23, 'Sunsilk Black Shine Shampoo', 21, 14, 'Sunsilk Black Shine Shampoo', 'Sunsilk Black Shine Shampoo', 180.00, 'image/iZPD4Z812YiucAQ0MpAk.jpg', '180ml', 'Null', 1, NULL, NULL),
(24, 'Unilever AXE Signature Mysterious Body Perfume 122 ml', 21, 14, 'Unilever AXE Signature Mysterious Body Perfume 122 ml', 'Unilever AXE Signature Mysterious Body Perfume 122 ml', 300.00, 'image/ze9tLpVyNOYB3b5mrkif.jpg', '122 ml', 'Null', 1, NULL, NULL),
(25, 'Xbox Wireless Controller - Grey and Green', 11, 15, 'Experience the enhanced comfort and feel of the Xbox wireless controller\r\nFeatures a light grey design with green accents\r\nPlay your favorite games on Windows 10 PCs and tablets; Plus, upto twice the wireless range (tested using the Xbox One S Console)\r\nStay on target with textured grip; Compatible With:Xbox One X, Xbox One S, Xbox One, Windows 10\r\nIncludes Bluetooth technology for gaming on Windows 10 PCs and tablets\r\n\r\nElevate your game.\r\nXbox Wireless Controller featuring light grey design with green accents.\r\n\r\nStay on target with textured grip.\r\nExperience the enhanced comfort and feel, featuring a light grey design with green accents, and textured grip.\r\n\r\nBluetooth technology.\r\nGet up to twice the wireless range and the freedom to use your Xbox controller with games on Windows 10 PCs and tablets.\r\n\r\nCustom mapping.\r\nEnjoy custom button mapping. Plus, plug in any compatible headset with the 3.5mm stereo headset jack.\r\n\r\nExperience the enhanced comfort and feel of the Xbox wireless controller, featuring a light grey design with green accents, and textured grip. Enjoy custom button mapping and up to twice the wireless range. Plug in any compatible headset with the 3.5mm stereo headset jack. And with Bluetooth technology, play your favorite games on Windows 10 PCs and tablets.', 'Experience the enhanced comfort and feel of the Xbox wireless controller\r\nFeatures a light grey design with green accents\r\nPlay your favorite games on Windows 10 PCs and tablets; Plus, upto twice the wireless range (tested using the Xbox One S Console)\r\nStay on target with textured grip; Compatible With:Xbox One X, Xbox One S, Xbox One, Windows 10\r\nIncludes Bluetooth technology for gaming on Windows 10 PCs and tablets\r\n\r\nElevate your game.\r\nXbox Wireless Controller featuring light grey design with green accents.\r\n\r\nStay on target with textured grip.\r\nExperience the enhanced comfort and feel, featuring a light grey design with green accents, and textured grip.\r\n\r\nBluetooth technology.\r\nGet up to twice the wireless range and the freedom to use your Xbox controller with games on Windows 10 PCs and tablets.\r\n\r\nCustom mapping.\r\nEnjoy custom button mapping. Plus, plug in any compatible headset with the 3.5mm stereo headset jack.\r\n\r\nExperience the enhanced comfort and feel of the Xbox wireless controller, featuring a light grey design with green accents, and textured grip. Enjoy custom button mapping and up to twice the wireless range. Plug in any compatible headset with the 3.5mm stereo headset jack. And with Bluetooth technology, play your favorite games on Windows 10 PCs and tablets.', 11350.00, 'image/Wfoceyv1QdgWVnorKU0s.jpg', 'Null', 'Grey and Green', 1, NULL, NULL),
(26, 'Xbox Wireless Controller - Black', 11, 15, 'The best controller just got even better.\r\nExperience the enhanced comfort and feel of the new Xbox Wireless Controller, featuring a sleek, streamlined design and textured grip.\r\n\r\nEnjoy custom button mapping and up to twice the wireless range*. Plus, plug in any compatible headset with the 3.5mm stereo headset jack.\r\nWith Bluetooth technology, play your favorite games on Windows 10 PCs and tablets.\r\n* Range compared to previous controllers, using the Xbox One S console. Button mapping available via Xbox Accessories app for Xbox One and Windows 10. For best performance, updates may be required.\r\n\r\n**Bluetooth capabilities require Windows 10 devices running the Windows Anniversary Update. Go to xbox.com/xboxone/controller-OS for more information. The Bluetooth word mark and logos are registered trademarks owned by Bluetooth SIG, Inc.\r\n\r\nExperience the enhanced comfort and feel of the new Xbox Wireless Controller, featuring a sleek, streamlined design and textured grip. Enjoy custom button mapping and up to twice the wireless range. Plug in any compatible headset with the 3.5mm stereo headset jack. And with Bluetooth technology, play your favorite games on Windows 10 PCs and tablets. Button mapping available via Xbox Accessories app. Range compared to previous controllers with the Xbox One S.', 'The best controller just got even better.\r\nExperience the enhanced comfort and feel of the new Xbox Wireless Controller, featuring a sleek, streamlined design and textured grip.\r\n\r\nEnjoy custom button mapping and up to twice the wireless range*. Plus, plug in any compatible headset with the 3.5mm stereo headset jack.\r\nWith Bluetooth technology, play your favorite games on Windows 10 PCs and tablets.\r\n* Range compared to previous controllers, using the Xbox One S console. Button mapping available via Xbox Accessories app for Xbox One and Windows 10. For best performance, updates may be required.\r\n\r\n**Bluetooth capabilities require Windows 10 devices running the Windows Anniversary Update. Go to xbox.com/xboxone/controller-OS for more information. The Bluetooth word mark and logos are registered trademarks owned by Bluetooth SIG, Inc.\r\n\r\nExperience the enhanced comfort and feel of the new Xbox Wireless Controller, featuring a sleek, streamlined design and textured grip. Enjoy custom button mapping and up to twice the wireless range. Plug in any compatible headset with the 3.5mm stereo headset jack. And with Bluetooth technology, play your favorite games on Windows 10 PCs and tablets. Button mapping available via Xbox Accessories app. Range compared to previous controllers with the Xbox One S.', 8230.00, 'image/DKmiQLlaZYJpqU8csr0a.jpg', 'Null', 'Black', 1, NULL, NULL),
(27, 'Xbox Elite Wireless Controller for Xbox One - Black', 11, 15, 'Key Specs\r\nWireless\r\nYes\r\nBattery SizeInfo\r\nAA\r\nCompatible Platform(s)\r\nXbox One\r\nFeature\r\nHeadset Jack\r\nYes\r\nRumble Vibration\r\nYes\r\nAnalog Joysticks\r\nYes\r\nLighting Type\r\nNone\r\nIllumination\r\nNo\r\nShare Button\r\nNo\r\nConnectivity\r\nWireless\r\nYes\r\nMaximum Wireless Range\r\n30 feet\r\nUSB Receiver\r\nYes\r\nMotion-Sensing Technology\r\nNo\r\nPower\r\nBattery Type\r\nAlkaline\r\nBattery SizeInfo\r\nAA\r\nNumber of Batteries Required\r\n2\r\nBatteries Included\r\nYes\r\nDimension\r\nProduct Height\r\n7.2 inches\r\nProduct Width\r\n5.5 inches\r\nProduct Length\r\n3 inches\r\nProduct Weight\r\n8 pounds\r\nCord Length\r\n108 inches\r\nCompatibility\r\nCompatible Platform(s)\r\nXbox One\r\nGeneral\r\nAdditional Accessories Included\r\n2 standard, 2 tall and 2 domed thumbsticks 4 paddles, 2 D-pads\r\nColor\r\nBlack\r\nColor Category\r\nBlack\r\nModel Number\r\nGSRF-HM3-00001\r\nWarranty\r\nManufacturer\'s Warranty - Parts\r\n90 days\r\nManufacturer\'s Warranty - Labor\r\n90 days\r\nOther\r\nProduct Name\r\nGeek Squad Certified Refurbished Xbox Elite Wireless Controller for Xbox One\r\nBrand\r\nMicrosoft\r\nChoking Hazard Warning\r\nNo\r\nUPC\r\n400056559321', 'Key Specs\r\nWireless\r\nYes\r\nBattery SizeInfo\r\nAA\r\nCompatible Platform(s)\r\nXbox One\r\nFeature\r\nHeadset Jack\r\nYes\r\nRumble Vibration\r\nYes\r\nAnalog Joysticks\r\nYes\r\nLighting Type\r\nNone\r\nIllumination\r\nNo\r\nShare Button\r\nNo\r\nConnectivity\r\nWireless\r\nYes\r\nMaximum Wireless Range\r\n30 feet\r\nUSB Receiver\r\nYes\r\nMotion-Sensing Technology\r\nNo\r\nPower\r\nBattery Type\r\nAlkaline\r\nBattery SizeInfo\r\nAA\r\nNumber of Batteries Required\r\n2\r\nBatteries Included\r\nYes\r\nDimension\r\nProduct Height\r\n7.2 inches\r\nProduct Width\r\n5.5 inches\r\nProduct Length\r\n3 inches\r\nProduct Weight\r\n8 pounds\r\nCord Length\r\n108 inches\r\nCompatibility\r\nCompatible Platform(s)\r\nXbox One\r\nGeneral\r\nAdditional Accessories Included\r\n2 standard, 2 tall and 2 domed thumbsticks 4 paddles, 2 D-pads\r\nColor\r\nBlack\r\nColor Category\r\nBlack\r\nModel Number\r\nGSRF-HM3-00001\r\nWarranty\r\nManufacturer\'s Warranty - Parts\r\n90 days\r\nManufacturer\'s Warranty - Labor\r\n90 days\r\nOther\r\nProduct Name\r\nGeek Squad Certified Refurbished Xbox Elite Wireless Controller for Xbox One\r\nBrand\r\nMicrosoft\r\nChoking Hazard Warning\r\nNo\r\nUPC\r\n400056559321', 16999.00, 'image/wZGSCNp9VwFHjmLErS71.jpg', 'Null', 'Black', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `shipping_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`shipping_id`, `shipping_email`, `shipping_first_name`, `shipping_last_name`, `shipping_address`, `shipping_mobile_number`, `shipping_city`, `created_at`, `updated_at`) VALUES
(3, 'asdasdasdasd@gmail.com', 'asdasdasdasd', 'asdasdasd', 'asdasdasd', '01821545451', 'Dhaka', NULL, NULL),
(4, 'asdasdasdasd@gmail.com', 'asdasdasd', 'asdasdasd', 'asdasdasd', '01821545451', 'Dhaka', NULL, NULL),
(5, 'asdasdasdasd@gmail.com', 'asdasdasd', 'asdasdasd', 'asdasdasd', 'asdasdasd', 'asdasdasd', NULL, NULL),
(6, 'rahul@gmail.com', 'Asif', 'Hassan', '78/1, Dhanmondi', '01821545451', 'Dhaka', NULL, NULL),
(7, 'asdasdasdasd@gmail.com', 'asdasdasdasd', 'asdasd', 'asdasdasd', 'asdasdasd', 'asdasda', NULL, NULL),
(8, 'rahul@gmail.com', 'Asif', 'Hassan', '78/1, Dhanmondi', '01821545451', 'Dhaka', NULL, NULL),
(9, 'shahreen@gmail.com', 'Shahreen', 'Rahman', 'Gulshan-2', '0123456789', 'Dhaka', NULL, NULL),
(10, 'shahreen@gmail.com', 'Shahreen', 'Rahman', '78/1, Dhanmondi', '01821545451', 'Dhaka', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `slider_id` int(10) UNSIGNED NOT NULL,
  `slider_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_slider`
--

INSERT INTO `tbl_slider` (`slider_id`, `slider_image`, `publication_status`, `created_at`, `updated_at`) VALUES
(1, 'slider/J3Tr0w7gng6VarxVZ9tL.jpg', 1, NULL, NULL),
(2, 'slider/6vt8MHPMrHeGu5L17g39.jpg', 1, NULL, NULL),
(3, 'slider/r3HmC9P1Oqka6IytqLaK.jpg', 1, NULL, NULL),
(4, 'slider/h0FiHU2zNd2YgGrcJFlq.jpg', 0, NULL, NULL),
(5, 'slider/D2Ebs9z3lCR1JGNfeMV1.png', 0, NULL, NULL),
(6, 'slider/5bSR3MqBHX7yWYJdimS1.jpg', 0, NULL, NULL),
(7, 'slider/jVA9lZ4WjzrIFPFLXrvr.jpg', 1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocodes`
--
ALTER TABLE `promocodes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `promocodes_code_unique` (`code`);

--
-- Indexes for table `promocode_user`
--
ALTER TABLE `promocode_user`
  ADD PRIMARY KEY (`user_id`,`promocode_id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `tbl_manufacture`
--
ALTER TABLE `tbl_manufacture`
  ADD PRIMARY KEY (`manufacture_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Indexes for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `promocodes`
--
ALTER TABLE `promocodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_manufacture`
--
ALTER TABLE `tbl_manufacture`
  MODIFY `manufacture_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `slider_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
