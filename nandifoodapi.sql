-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2024 at 04:45 PM
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
-- Database: `nandifoodapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `bin_location`
--

CREATE TABLE `bin_location` (
  `id` int(11) NOT NULL,
  `warehouse_id` varchar(8) NOT NULL,
  `effective_date` date DEFAULT NULL,
  `storage_type_id` varchar(8) NOT NULL,
  `asset_type_id` varchar(8) NOT NULL,
  `zone_number` varchar(5) NOT NULL,
  `zone_name` varchar(100) DEFAULT NULL,
  `section_number` int(11) NOT NULL,
  `section_name` varchar(100) DEFAULT NULL,
  `aisle_number` int(11) NOT NULL,
  `aisle_name` varchar(100) DEFAULT NULL,
  `rack_number` int(11) NOT NULL,
  `rack_name` varchar(100) DEFAULT NULL,
  `shelf_number` int(11) NOT NULL,
  `shelf_name` varchar(100) DEFAULT NULL,
  `bin_number` int(11) NOT NULL,
  `bin_name` varchar(100) DEFAULT NULL,
  `metric_unit` varchar(50) NOT NULL,
  `bin_length` decimal(10,2) DEFAULT NULL,
  `bin_width` decimal(10,2) DEFAULT NULL,
  `bin_height` decimal(10,2) DEFAULT NULL,
  `storage_capacity_slp` decimal(10,2) DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_date` date DEFAULT NULL,
  `status` varchar(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(5) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` varchar(5) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `bin_barcode_img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bin_location`
--

INSERT INTO `bin_location` (`id`, `warehouse_id`, `effective_date`, `storage_type_id`, `asset_type_id`, `zone_number`, `zone_name`, `section_number`, `section_name`, `aisle_number`, `aisle_name`, `rack_number`, `rack_name`, `shelf_number`, `shelf_name`, `bin_number`, `bin_name`, `metric_unit`, `bin_length`, `bin_width`, `bin_height`, `storage_capacity_slp`, `start_date`, `end_date`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`, `description`, `file`, `bin_barcode_img`) VALUES
(1, 'WH01', '2024-11-13', 'ST001', 'AT001', 'Z01', 'Zone 1', 1, 'Section 1', 1, 'Aisle 1', 1, 'Rack 1', 1, 'Shelf 1', 1, 'Bin 1', '0', 50.00, 30.00, 20.00, 300.00, '2024-11-13 12:00:28', '2025-11-13', 'active', '2024-11-13 12:00:28', 'user1', '2024-11-15 11:53:46', 'user1', 'Sample bin location', 'path/to/file.pdf', 'path/to/barcode_image.jpg'),
(2, 'WH02', '2024-11-13', 'ST001', 'AT001', 'Z01', 'Zone 1', 1, 'Section 1', 1, 'Aisle 1', 1, 'Rack 1', 1, 'Shelf 1', 1, 'Bin 1', '1', 60.00, 50.00, 60.00, 300.00, '2024-11-13 12:00:28', '2025-11-13', 'active', '2024-11-13 12:00:28', 'user1', '2024-11-15 11:07:04', 'user1', 'Sample bin location', 'path/to/file.pdf', 'path/to/barcode_image.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `bin_location_zones`
--

CREATE TABLE `bin_location_zones` (
  `id` int(11) NOT NULL,
  `zone_code` varchar(4) DEFAULT NULL,
  `zone_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bin_status`
--

CREATE TABLE `bin_status` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `explanation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bin_status`
--

INSERT INTO `bin_status` (`id`, `status`, `explanation`) VALUES
(1, 'Panding', 'Means bin location has been added but is not active'),
(2, 'Open', 'Means bin location is available to received inventory items\r\n'),
(3, 'Full', 'Means bin location is now full and cannot receive anymore inventory items'),
(4, 'Hold', 'Means bin location is on temporary hold and cannot receive any inventory items'),
(5, 'Closed', 'Means bin location is permanently closed and cannot hold or receive any inventory items');

-- --------------------------------------------------------

--
-- Table structure for table `bin_storage_type`
--

CREATE TABLE `bin_storage_type` (
  `id` int(11) NOT NULL,
  `storage_type` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bin_storage_type`
--

INSERT INTO `bin_storage_type` (`id`, `storage_type`) VALUES
(1, 'Regular Storage'),
(2, 'Pick-Face Storage'),
(3, 'Bulk Storage'),
(4, 'Inbound Storage'),
(5, 'Assembly Storage'),
(6, 'Outbound Storage');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` varchar(255) NOT NULL,
  `continent` varchar(255) DEFAULT NULL,
  `continental_region` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `country_calling_code` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` varchar(25) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `country_id` varchar(25) DEFAULT NULL,
  `position_id` varchar(25) DEFAULT NULL,
  `default_warehouse` varchar(25) DEFAULT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `off_phone` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `first_name`, `country_id`, `position_id`, `default_warehouse`, `middle_name`, `last_name`, `email`, `off_phone`, `phone`) VALUES
('E0001', 'kazi sifat al maksud', '2', '2', 'WH01', NULL, NULL, NULL, NULL, NULL);

--
-- Triggers `employee`
--
DELIMITER $$
CREATE TRIGGER `tri_employee_id` BEFORE INSERT ON `employee` FOR EACH ROW BEGIN
    DECLARE v_temp_id INT;

    -- Get the maximum numeric part from existing employee IDs and increment it
    SELECT IFNULL(MAX(CAST(SUBSTRING(id, 2) AS SIGNED)), 0) INTO v_temp_id 
    FROM employee;

    -- Increment the numeric part for the new ID
    SET v_temp_id = v_temp_id + 1;

    -- Concatenate 'E' with the numeric part, padded to 4 digits with leading zeros
    SET NEW.id = CONCAT('E', LPAD(v_temp_id, 4, '0')); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payment_terms`
--

CREATE TABLE `invoice_payment_terms` (
  `id` varchar(7) NOT NULL,
  `payment_terms_name` varchar(15) DEFAULT NULL,
  `number_of_days_from` int(11) DEFAULT NULL,
  `days` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice_payment_terms`
--

INSERT INTO `invoice_payment_terms` (`id`, `payment_terms_name`, `number_of_days_from`, `days`) VALUES
('PTEM01', 'Due Upon Receip', 0, 'DAYS'),
('PTEM02', '5 DAYS', 5, 'DAYS'),
('PTEM03', '7 DAYS', 7, 'DAYS'),
('PTEM04', '10 DAYS', 10, 'DAYS'),
('PTEM05', '14 DAYS', 14, 'DAYS'),
('PTEM06', '21 DAYS', 21, 'DAYS'),
('PTEM07', '30 DAYS', 30, 'DAYS');

--
-- Triggers `invoice_payment_terms`
--
DELIMITER $$
CREATE TRIGGER `tri_invoice_payment_terms` BEFORE INSERT ON `invoice_payment_terms` FOR EACH ROW BEGIN 
    DECLARE v_temp_id INT; 
    
    SELECT IFNULL(MAX(CAST(SUBSTRING(id, 5) AS SIGNED)), 0) INTO v_temp_id 
    FROM invoice_payment_terms;

    -- Increment the value to create a new id
    SET v_temp_id = v_temp_id + 1;

    -- Set new id with the prefix "PTEM"
    SET NEW.id = CONCAT('PTEM', LPAD(v_temp_id, 2, '0')); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_13_141755_add_two_factor_columns_to_users_table', 1),
(5, '2024_11_13_141917_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `payment_id` varchar(7) NOT NULL,
  `payment_type_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`payment_id`, `payment_type_name`) VALUES
('PTY001', 'Cash'),
('PTY002', 'Direct Bank Deposit'),
('PTY003', 'Cheque'),
('PTY004', 'Stripe - Credit Card'),
('PTY005', 'Stripe - ACH'),
('PTY006', 'Stripe - Moto');

--
-- Triggers `payment_type`
--
DELIMITER $$
CREATE TRIGGER `tri_payment_type` BEFORE INSERT ON `payment_type` FOR EACH ROW BEGIN 
    DECLARE v_temp_id INT; 
    
    -- Get the maximum payment_id, removing the prefix and converting to INT
    SELECT IFNULL(MAX(CAST(SUBSTRING(payment_id, 4) AS SIGNED)), 0) INTO v_temp_id 
    FROM payment_type;

    -- Increment the value to create a new payment_id
    SET v_temp_id = v_temp_id + 1;

    -- Set new payment_id with the prefix "PTY"
    SET NEW.payment_id = CONCAT('PTY', LPAD(v_temp_id, 3, '0')); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_tax`
--

CREATE TABLE `sales_tax` (
  `id` varchar(20) NOT NULL,
  `sales_tax_name` varchar(100) NOT NULL,
  `sales_tax_rate` decimal(5,2) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `sales_tax`
--
DELIMITER $$
CREATE TRIGGER `tri_sales_tax` BEFORE INSERT ON `sales_tax` FOR EACH ROW BEGIN 
    DECLARE v_temp_id INT; 

    SELECT IFNULL(MAX(CAST(SUBSTRING(id, 4) AS SIGNED)), 0) INTO v_temp_id 
    FROM sales_tax;

    -- Increment the value to create a new id
    SET v_temp_id = v_temp_id + 1;

    -- Set new id with the prefix "PTEM"
    SET NEW.id = CONCAT('STX', LPAD(v_temp_id, 2, '0')); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0agsKPPzfwvqCaY5Yn3mWXGbxwG6F7XvkQKtUnNV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjN0UDZvWFc4Y0JZd0dRREU1cmVkd1ZFUmtYeTdra1FyTFExZjN2QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731614795),
('oEjPncVY0ICXhO1zYRpLDz6tfpHDTDvp9tmvooyT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUpaMXp1ZjBmbkVSYnRqdDdWVXk2UkVKazVraVphUWhsVzVJbXRqQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731661088),
('RcuZzNdJIfZ7KLZlPRjG22XHfYqxU3BG3DSDgxvG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlNxY2RGSDZMcWVBeDNGZEpWRGx5Vndsd0V2S25ocERGdHFMaklRbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731607215);

-- --------------------------------------------------------

--
-- Table structure for table `uom`
--

CREATE TABLE `uom` (
  `uom_id` varchar(5) NOT NULL,
  `uom_type_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `bulk_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uom`
--

INSERT INTO `uom` (`uom_id`, `uom_type_id`, `description`, `weight`, `bulk_code`) VALUES
('U1001', 1, 'jisjfigjio', 25.00, '20'),
('U5002', 5, 'asdfasdf', 225.00, 'asdfasf');

--
-- Triggers `uom`
--
DELIMITER $$
CREATE TRIGGER `tri_uom` BEFORE INSERT ON `uom` FOR EACH ROW BEGIN
    DECLARE v_temp_id INT;

    SELECT IFNULL(MAX(CAST(SUBSTRING(uom_id , 3) AS SIGNED)), 0) INTO v_temp_id 
    FROM uom;

    SET v_temp_id = v_temp_id + 1;

  
    SET NEW.uom_id = CONCAT('U', NEW.uom_type_id, LPAD(v_temp_id, 3, '0')); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `uom_type`
--

CREATE TABLE `uom_type` (
  `id` int(11) NOT NULL,
  `uom_name` varchar(100) NOT NULL,
  `level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uom_type`
--

INSERT INTO `uom_type` (`id`, `uom_name`, `level`) VALUES
(1, 'EACH', 1),
(2, 'BOX', 2),
(3, 'CARTON', 3),
(4, 'CASE', 4),
(5, 'CRATE', 5),
(6, 'T-TOTE', 6),
(7, 'PALLET', 7),
(8, 'TEU', 8);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` varchar(11) NOT NULL,
  `warehouse_name` varchar(255) NOT NULL,
  `global_default_warehouse` tinyint(1) DEFAULT 0,
  `country_default_warehouse` tinyint(1) DEFAULT 0,
  `country` varchar(25) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `warehouse_contact` varchar(10) DEFAULT NULL,
  `warehouse_capacity_in_lb` decimal(10,2) DEFAULT NULL,
  `warehouse_capacity_in_kg` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `employee_phone` varchar(255) DEFAULT NULL,
  `warehouse_manager` varchar(255) DEFAULT NULL,
  `warehouse_supervisor` varchar(255) DEFAULT NULL,
  `eff_date` date DEFAULT NULL,
  `loc_work_week` varchar(255) DEFAULT NULL,
  `work_week_days` varchar(255) DEFAULT NULL,
  `bus_hours_open` time DEFAULT NULL,
  `bus_hours_close` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `warehouse_name`, `global_default_warehouse`, `country_default_warehouse`, `country`, `state`, `city`, `zip_code`, `address1`, `address2`, `email`, `phone`, `warehouse_contact`, `warehouse_capacity_in_lb`, `warehouse_capacity_in_kg`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `employee_phone`, `warehouse_manager`, `warehouse_supervisor`, `eff_date`, `loc_work_week`, `work_week_days`, `bus_hours_open`, `bus_hours_close`) VALUES
('WH01', 'Edmonton Warehouse', 1, 1, 'CANADA', 'Alberta', 'Edmonton', 'T6E 4N7', '7931 Coronet Road', NULL, 'info@nandifoods.com', '780-382-0957', 'Dingi Mahl', 68100.00, 30000.00, NULL, NULL, NULL, '2024-11-13 16:55:02', '2024-11-13 16:55:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('WH02', 'Calgary Warehouse', 0, 0, 'CANADA', 'Alberta', 'Calgary', 'T2H 2C3', '803 64 Avenue SE', 'Unit No. 1001', 'info@nandifoods.com', '780-382-0957', 'Benjamin S', 13620.00, 6000.00, NULL, NULL, NULL, '2024-11-13 16:55:02', '2024-11-13 16:55:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('WH03', 'Toronto Warehouse', 0, 0, 'CANADA', 'Ontario', 'Mississauga', 'L5N 6P8', '7299 East Danbro Cresent', NULL, 'info@nandifoods.com', '780-382-0957', 'Kudzai Ndo', 34050.00, 15000.00, NULL, NULL, NULL, '2024-11-13 16:55:02', '2024-11-13 16:55:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('WH04', 'Dallas Warehouse', 0, 1, 'USA', 'Texas', 'Dallas', '75207', '2016 Farrington Street', NULL, 'info@nandifoods.com', '780-382-0957', 'Alexander ', 68100.00, 30000.00, NULL, NULL, NULL, '2024-11-13 16:55:02', '2024-11-13 16:55:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('WH05', 'Rustenburg Warehouse', 0, 1, 'SOUTH AFRICA', 'Northwest', 'Rustenburg', '0305', '40 President Mbeki Drive', NULL, 'info@nandifoods.com', '+27 83 349 5760', 'Derrick Ma', 68100.00, 30000.00, NULL, NULL, NULL, '2024-11-13 16:55:02', '2024-11-13 16:55:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('WH06', 'Transit Warehouse', 0, 0, 'CANADA', 'Alberta', 'Edmonton', 'T6E 4N7', '12311 184 Street', 'CN Rail Terminal', 'info@nandifoods.com', '780-382-0957', 'Thabani Ml', 68100.00, 30000.00, NULL, NULL, NULL, '2024-11-13 16:55:02', '2024-11-13 16:55:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Triggers `warehouse`
--
DELIMITER $$
CREATE TRIGGER `tri_warehouse` BEFORE INSERT ON `warehouse` FOR EACH ROW BEGIN 
    DECLARE v_temp_id INT; 
    
    -- Get the maximum payment_id, removing the prefix and converting to INT
    SELECT IFNULL(MAX(CAST(SUBSTRING(id, 3) AS SIGNED)), 0) INTO v_temp_id 
    FROM warehouse_list;

    -- Increment the value to create a new warehouse_list
    SET v_temp_id = v_temp_id + 1;

    -- Set new warehouse_list with the prefix "WH"
    SET NEW.id = CONCAT('WH', LPAD(v_temp_id, 2, '0')); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_image`
--

CREATE TABLE `warehouse_image` (
  `id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_note`
--

CREATE TABLE `warehouse_note` (
  `id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `date_uploaded` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bin_location`
--
ALTER TABLE `bin_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bin_location_zones`
--
ALTER TABLE `bin_location_zones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bin_status`
--
ALTER TABLE `bin_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bin_storage_type`
--
ALTER TABLE `bin_storage_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoice_payment_terms`
--
ALTER TABLE `invoice_payment_terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sales_tax`
--
ALTER TABLE `sales_tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `uom`
--
ALTER TABLE `uom`
  ADD PRIMARY KEY (`uom_id`),
  ADD KEY `uom_type_id` (`uom_type_id`);

--
-- Indexes for table `uom_type`
--
ALTER TABLE `uom_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse_image`
--
ALTER TABLE `warehouse_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse_note`
--
ALTER TABLE `warehouse_note`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bin_location`
--
ALTER TABLE `bin_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bin_location_zones`
--
ALTER TABLE `bin_location_zones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bin_status`
--
ALTER TABLE `bin_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bin_storage_type`
--
ALTER TABLE `bin_storage_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uom_type`
--
ALTER TABLE `uom_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouse_image`
--
ALTER TABLE `warehouse_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouse_note`
--
ALTER TABLE `warehouse_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `uom`
--
ALTER TABLE `uom`
  ADD CONSTRAINT `uom_ibfk_1` FOREIGN KEY (`uom_type_id`) REFERENCES `uom_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
