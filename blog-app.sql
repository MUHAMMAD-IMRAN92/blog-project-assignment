-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 28, 2024 at 04:09 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_post_id_foreign` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `user_id`, `post_id`, `parent_id`, `created_at`, `updated_at`) VALUES
(11, 'Test comment', 1, 2, NULL, '2024-09-28 11:08:29', '2024-09-28 11:08:29'),
(10, 'test2', NULL, 1, 9, '2024-09-28 10:34:30', '2024-09-28 10:34:30'),
(9, 'test1', NULL, 1, 8, '2024-09-28 10:33:33', '2024-09-28 10:33:33'),
(8, 'test', NULL, 1, NULL, '2024-09-28 10:33:28', '2024-09-28 10:33:28'),
(12, 'test reply', 1, 2, 11, '2024-09-28 11:08:40', '2024-09-28 11:08:40'),
(13, 'test nested comment', 1, 2, 12, '2024-09-28 11:08:50', '2024-09-28 11:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_09_27_112222_create_posts_table', 1),
(5, '2024_09_27_112509_create_comments_table', 2),
(6, '2024_09_28_153838_create_personal_access_tokens_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `created_at`, `updated_at`, `user_id`) VALUES
(2, 'What is Lorem Ipsum?', 'orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2024-09-28 11:08:20', '2024-09-28 11:08:20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('y2EnqQBvT9YCqhKdRFvpdARgaxlUkqvtLwfZhvu5', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXR2UUEyTWsxQVFFbFU1MzRnQ1V6R3lzcnVWRGhZYUhRbk1yaXpEdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727539673),
('q0wNLC1uKk1RKJ2jJ3cuLr1ayEEFlvEGpOoyRhJN', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielY1U21wZEhlSVhudFBvQjRmcGpKYmk5dGs0a3lPczhQdnJLV2NHdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727538290),
('FSc26HgZhWh5qppNGbIcEmO0t4Gl8lyeLfL51D1F', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnpqUnoxbjdQNDJaTWNQVmVYN2dnbm1HRXdmT3NHd2JwQU5Makh6cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727538236),
('7CCPnZIPPxOf15UhUyIh4GwNns0Ris2ZS81N95cG', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDlJcHVnYlY1UHlUWlpRc3BVUElpbnZDMnJOeUhiZDU3ZVpsVHF3NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727538211),
('4I7NtIjg8c0TJxvJGZ1fPzdOhUmVn9ltjtfII90M', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFhaNUpzSlNsUVBlSUNuSnBKem5hSFhwQlcwbTJqVDhaM0xJZ0lxdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727538185),
('qCJ7yyM8LbY2KlZKLDcKdPOogYmZyuaYvclbqAAG', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3hLR1NFaHZhZEhDck1FeEN4UzBzUzBVcElUUUp1dnpWMGc1WUhIdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727538169),
('n8aTdmMAo0ZjGSL9hCLLEboINnYLsdqE5TugmrDQ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFZZQjdyUEk0Qm1ZNTZRbHdMZkg1WTROeVFqM25oY09YaTh4dVBjdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727538147),
('wlAKMxMhMVMUp81g8YVClNFXmqJvZVbe237N9yLu', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVG1YQjhjMlJmTklObVJseDFsdmlHVDRQM0VwUUlPWUdUVjVCS0JFdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727538136),
('vZDbdiIqbW1tHypwjUtNIGNR63JlxIXUfp78NWCC', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZE1IdHlVR25yRG9xUHNYWDh1djFLVE1TUWlVVG1yY3RBWjJlQzBFYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727538140),
('gbWDghC3OBWd6TH5xnZwecVIJjZbwBXGwrsGugo9', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWNBakZhYnRlRzE1MXpTY0NnNGV5NTBqYnZLYzRkWWlkOHBVZUpxRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727538142),
('Ctw3uoDJT2526jlyjyqYYNJmaz5YmR3vzwVHv1lc', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVFPTmEza0IyMDI5VlJldlhvbGRtWDBzVHBybXZMQzZ1ZFQ3ZERHQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727537570),
('pRVwmmM7Ew25B1atGY5TtINC1S1TYkxBoMGbwfG2', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWd5RkVCRUdvY241aGRwbzRVYUx0Q1E2WFFpWlVyR05HZUNCenFBNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727537205),
('XHCmmbcuMNRDmwJAyhTQluSGtUxFuvsqh3rqplBx', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWpFbng4ZXlUNjBXakpjR1dWUzlBQWxrRGZZVldsZjdkSFo5REMzayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727537201),
('a0PA9fWdRYYcUNkrOY29ADneWqrFkysE3juFvcua', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVZqRmdNQ2RVSHVoOUlBZzl1V2gwZ2h6TkFJdHU5MTFmVmptZ01WTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727537196),
('TS6OQPLFiTmw1luTrWyxuG1pXRQBaBkUHXyZ3MR4', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmRDWkpUeFBYVjNXWWt4cG4weXhuUE1NamtmWnR4NXdxNHVZNmxMaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727537188),
('ABGGbraZyqxQpIMNsQ7s2MI9Mi838aDAopAkq1E4', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVktJOEl4MjNYMHE0YmdSY0R4Q2VTMmEzREc5RzQ3S1ZvNUlkeEVZVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727537173),
('TsOnpFSQTOcICdNKJ90TrxbtvE8m86kYtva20qTS', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGJzZHNWSnhWY3B2cUlramY1WXFDaTNKSXBDUm5zeW90MGR2UjAyViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727537168),
('HlIU4eRc4If14pZPDRthCOnCStie5zYvBI36FGAU', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2Z3OFU3TnZvZ3pHQUdndFRMdWlMRHB4d2NneXlPMDhDY0o1OExSYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727537146),
('VOfQiy0OEpBlueoMJ93okNkOfBm6Rm41XouQZNOr', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkgyVVZXMHZDTlJDUkVFMGdDUDNKdnp0RktxOUc2d1M1OTBOM1dlSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727537131),
('LEV2Kfm8EeF7nwICjgvrvrMWd48tnB2Kyvkog0kG', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2EzZmZPSkR0cEhjd2lvUHdCY29CdnFxTEg3MDdTb3cwOUdtWnBncyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727537104),
('8J7tLinke1V1xf3uy8331E4rjLHDGY6MZpZMbsHJ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidE5kU2xESko4V1FwN3dsUlg0RVh0WHVjMzYxUFVGbmtXYlVjVWcyTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727537086),
('DBubaHJHrThivIsLBSo5SQtLz84miqyxbH6j8P4V', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFJKRnB0UE1CVGxkSVJRNllNQ0dGOUQzY3BHNWcxMGE0REs1UEVCZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727537089),
('yiQlFGiAlmZJjYWDIVF6Oe1rbYYwMxs2X8DRFlSs', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHFGRlUwYTZvY0xFa3F4R2Y1RVNIdEowbVBEOW5MZDVXcnR0bVZmTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727537016),
('bqeeKsOCLkLXv7hz2fTTvVAZYOw3VpXTWamycVJj', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVdJeFlDdk9helo0T0tzMnlkSldqeTFiOXVoOFZmVERYVkZGOUZ3QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727536978),
('ixaNHSiKmKEG66qro1ICUv9nZsZgd31me3fc2Xpy', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlZjQ3h5akRsRXNWMndpakIyeHpBNHpXaGxjZkdUSU5UTDZ0OXFINyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727536864),
('aZiJeBHSAfITHVRTEAjV54SlinMdVWAXpEI57sob', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienF0dm5lYWk3Y0k5SG4zaXdzTlFtRFNmU2thNzBFVVhhODNJSXI1MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727536861),
('Ro5JF3ZsQVmODHSs1DHQDVEeMGEHEEjvtvwgFCuu', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzNTa2NTMW9ZNU1QeFA1d2dYelpWdnZCeVVCVnA4bUI5ek5lV0lLZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727536857),
('F2a8YOTeoVtTB3Ip76eESaXTG9xcZA9Itm6fPwTH', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1VkUkhiNlJ4Q0ZZU1pCQlU5ajQ2aWUxSEFBREZTWnNmMDRmMmg0ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727536850),
('jJUauylF3sRedxVrgD4iG09cOQJpqTZ7NCmZ6JXs', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFc4VHhRc2paRVJRU09YREd0eko1M0F5c3kzR1VFUXdtazNqcXFEUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727536766),
('hgKdbixJh5GbqQb1ovl4ENK43rep4kqvGcDkztPc', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTFTRVNET2RWNHRvVUV5SDRhMk1UZlY5b3hJUmVYaVBLeWljVmwxdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727536542),
('gNVE16ItvkehMMB2wcv160XBRr7cpPEmEKDTConK', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGNlR25IVFoyVW8zNEdvU2NHSlIxWjRiVXl6alBjNGZncE8zeFMwNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727536534),
('czjHShp1Vi4hNoUB3t1qj5kJ34EqYG3Ra8oZlr2o', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidGZGcGd4MndtOXZQMkZmUnF0MGo5dEY2M2NBN0Zrd0J0eFBrZUI4ZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727536491),
('Rt0ZdW7Gz5AqrwN2iSFjOSr7l5PrEnJVHPjv4WB5', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicGZmdDh2N3RqYkxaVm5iN1A5YjJxa0tVWEVEZk1wN1RWVk81Z0ZsMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wb3N0cy8yIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3Mjc1MzgwMTA7fX0=', 1727539732),
('rPJz4QbwzR6KDo8nVlNyaz9kk4CsSQapOJ7t1HxW', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3k3WFBmVG00dTBLYWRrWWZUZ3Q5ZnZyRUtKNUVLeDFmWE9ia2x1dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727536682);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'admin@gmail.com', NULL, '$2y$12$07HYdgTAdd36EmUyK7cfUeFs47QGfGuZ6FFMNLkfU.DyRMskuuG5q', NULL, '2024-09-27 07:33:42', '2024-09-27 07:33:42');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
