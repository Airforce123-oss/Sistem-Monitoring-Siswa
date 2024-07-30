-- -------------------------------------------------------------
-- TablePlus 6.1.2(568)
--
-- https://tableplus.com/
--
-- Database: sistemMonitoring
-- Generation Time: 2024-07-30 07:21:50.3100
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `classes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `classes_for_student` (
  `id_kelas` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_kelas` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_kelas` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `genders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `master_mapel` (
  `id_mapel` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_mapel` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mapel` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_mapel`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `no_induks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `no_induk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `religions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `role_type_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sections_class_id_foreign` (`class_id`),
  CONSTRAINT `sections_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `no_induk_id` bigint unsigned NOT NULL,
  `class_id` bigint unsigned NOT NULL,
  `gender_id` bigint unsigned NOT NULL,
  `section_id` bigint unsigned NOT NULL,
  `religion_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `students_no_induk_id_foreign` (`no_induk_id`),
  KEY `students_class_id_foreign` (`class_id`),
  KEY `students_gender_id_foreign` (`gender_id`),
  KEY `students_section_id_foreign` (`section_id`),
  KEY `students_religion_id_foreign` (`religion_id`),
  CONSTRAINT `students_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `students_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`),
  CONSTRAINT `students_no_induk_id_foreign` FOREIGN KEY (`no_induk_id`) REFERENCES `no_induks` (`id`),
  CONSTRAINT `students_religion_id_foreign` FOREIGN KEY (`religion_id`) REFERENCES `religions` (`id`),
  CONSTRAINT `students_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `classes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'X-1', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(2, 'X-2', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(3, 'X-3', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(4, 'X-4', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(5, 'X-5', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(6, 'X-6', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(7, 'XI-1', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(8, 'XI-2', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(9, 'XI-3', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(10, 'XI-4', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(11, 'XI-5', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(12, 'XI-6', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(13, 'XII-1', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(14, 'XII-2', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(15, 'XII-3', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(16, 'XII-4', '2024-07-29 23:50:28', '2024-07-29 23:50:28');

INSERT INTO `classes_for_student` (`id_kelas`, `nama_kelas`, `kode_kelas`, `created_at`, `updated_at`) VALUES
(1, 'Kelas 1', 'MK-1561560093', NULL, NULL),
(2, 'Kelas 2', 'MK-1561560129', NULL, NULL),
(3, 'Kelas 3', 'MK-1561871991', NULL, NULL),
(4, 'Kelas 4', 'MK-1561872004', NULL, NULL),
(5, 'Kelas 5', 'MK-1561872013', NULL, NULL),
(6, 'Kelas 6', 'MK-1561872026', NULL, NULL),
(7, 'Kelas 7', 'MK-1561872043', NULL, NULL),
(8, 'Kelas 8', 'MK-1615002340', NULL, NULL);

INSERT INTO `genders` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Laki-laki', NULL, NULL),
(2, 'Perempuan', NULL, NULL),
(3, '.', NULL, NULL),
(4, '.', NULL, NULL);

INSERT INTO `master_mapel` (`id_mapel`, `kode_mapel`, `mapel`, `created_at`, `updated_at`) VALUES
(1, 'MP-1561560093', 'Bahasa Indonesia', NULL, NULL),
(2, 'MP-1561560129', 'Matematika', NULL, NULL),
(3, 'MP-1561871991', 'Biologi', NULL, NULL),
(4, 'MP-1561872004', 'Sejarah', NULL, NULL),
(5, 'MP-1561872013', 'Teknologi Informasi', NULL, NULL),
(6, 'MP-1561872026', 'Seni Budaya', NULL, NULL),
(7, 'MP-1561872043', 'Bahasa Inggris', NULL, NULL),
(8, 'MP-1615002340', 'Ilmu Pengetahuan Alam', NULL, NULL);

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2024_05_17_020236_create_admins_table', 1),
(5, '2024_07_21_034331_update_users_table', 1),
(6, '2024_07_21_040015_update_users_table', 1),
(7, '2024_07_21_040215_update_users_table', 1),
(8, '2024_07_21_041323_update_users_table', 1),
(9, '2024_07_21_084705_create_role_type_users_table', 1),
(10, '2024_07_21_184036_create_users_table', 1),
(11, '2024_07_23_021446_create_master_mapel', 1),
(12, '2024_07_23_170438_create_classes_for_student_table', 1),
(13, '2024_07_28_025304_create_classes_table', 1),
(14, '2024_07_28_025425_create_sections_table', 1),
(15, '2024_07_28_034606_create_genders_table', 1),
(16, '2024_07_28_041313_create_religions_table', 1),
(17, '2024_07_28_072312_create_no_induks_table', 1),
(18, '2024_07_28_081939_create_students_table', 1);

INSERT INTO `no_induks` (`id`, `no_induk`, `created_at`, `updated_at`) VALUES
(1, '1288144', NULL, NULL),
(2, '1233647', NULL, NULL),
(3, '1271568', NULL, NULL),
(4, '1281877', NULL, NULL),
(5, '1290204', NULL, NULL),
(6, '1207423', NULL, NULL),
(7, '1223378', NULL, NULL),
(8, '1285641', NULL, NULL),
(9, '1299653', NULL, NULL),
(10, '1287263', NULL, NULL);

INSERT INTO `religions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Islam', NULL, NULL),
(2, 'Kristen', NULL, NULL),
(3, 'Hindu', NULL, NULL),
(4, 'Buddha', NULL, NULL),
(5, 'Konghucu', NULL, NULL);

INSERT INTO `role_type_users` (`id`, `role_type`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'Teachers', NULL, NULL),
(3, 'Student', NULL, NULL),
(4, 'Parent', NULL, NULL);

INSERT INTO `sections` (`id`, `class_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(2, 1, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(3, 1, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(4, 2, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(5, 2, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(6, 2, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(7, 3, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(8, 3, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(9, 3, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(10, 4, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(11, 4, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(12, 4, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(13, 5, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(14, 5, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(15, 5, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(16, 6, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(17, 6, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(18, 6, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(19, 7, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(20, 7, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(21, 7, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(22, 8, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(23, 8, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(24, 8, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(25, 9, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(26, 9, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(27, 9, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(28, 10, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(29, 10, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(30, 10, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(31, 11, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(32, 11, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(33, 11, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(34, 12, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(35, 12, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(36, 12, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(37, 13, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(38, 13, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(39, 13, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(40, 14, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(41, 14, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(42, 14, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(43, 15, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(44, 15, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(45, 15, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(46, 16, 'Section A', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(47, 16, 'Section B', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(48, 16, 'Section C', '2024-07-29 23:50:28', '2024-07-29 23:50:28');

INSERT INTO `students` (`id`, `no_induk_id`, `class_id`, `gender_id`, `section_id`, `religion_id`, `name`, `email`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 'Sunny Parisian', 'moshe10@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(2, 6, 1, 1, 1, 5, 'Dr. Marian Borer Sr.', 'laurel.schaefer@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(3, 1, 1, 1, 1, 5, 'Ms. Sally Skiles III', 'okuneva.christ@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(4, 4, 1, 1, 1, 2, 'Verner Kulas', 'huels.kaylin@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(5, 3, 1, 1, 1, 3, 'Ms. Maybelle Morar', 'zschmidt@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(6, 8, 1, 2, 2, 5, 'Lew Schmidt', 'carlee54@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(7, 9, 1, 1, 2, 4, 'Hope Davis', 'dstanton@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(8, 7, 1, 2, 2, 3, 'Precious Bartell II', 'araceli95@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(9, 3, 1, 1, 2, 5, 'Bernice Weber', 'emmitt42@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(10, 9, 1, 1, 2, 5, 'Finn Wolf', 'rozella68@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(11, 8, 1, 2, 3, 1, 'Eunice Kreiger', 'caden.keeling@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(12, 9, 1, 1, 3, 5, 'Bart Wehner III', 'georgette.west@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(13, 1, 1, 1, 3, 3, 'Deanna Baumbach', 'jade.spinka@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(14, 10, 1, 1, 3, 3, 'Diana Fritsch', 'xrosenbaum@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(15, 5, 1, 2, 3, 1, 'Dr. Anastacio Medhurst V', 'hand.abbie@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(16, 6, 2, 1, 4, 3, 'Prof. Nathanial Padberg', 'ebony.batz@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(17, 1, 2, 1, 4, 3, 'Prof. Marilyne O\'Hara I', 'oberbrunner.verda@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(18, 3, 2, 1, 4, 4, 'Jazmyne Powlowski', 'olittle@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(19, 9, 2, 1, 4, 5, 'Jon Dicki', 'brycen.fahey@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(20, 9, 2, 2, 4, 3, 'Dessie Champlin', 'zmurray@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(21, 9, 2, 1, 5, 5, 'Marcia Johns Jr.', 'nelle39@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(22, 4, 2, 2, 5, 1, 'Damian Champlin', 'hoeger.estel@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(23, 10, 2, 2, 5, 5, 'Gardner Lowe', 'thompson.rhianna@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(24, 5, 2, 1, 5, 2, 'Prof. Claire Bashirian Sr.', 'edavis@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(25, 8, 2, 2, 5, 5, 'Carmella Leannon', 'ferry.newell@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(26, 8, 2, 1, 6, 4, 'Eva Anderson', 'cameron.huels@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(27, 4, 2, 1, 6, 1, 'Rita Jones', 'camren22@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(28, 9, 2, 2, 6, 3, 'Dayna Champlin', 'amanda.nienow@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(29, 2, 2, 2, 6, 4, 'Abigale Monahan', 'eleanore.feest@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(30, 5, 2, 1, 6, 3, 'Prof. Jordyn Schultz', 'morissette.helga@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(31, 5, 3, 2, 7, 4, 'Ms. Yazmin Hodkiewicz DVM', 'hane.erna@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(32, 4, 3, 1, 7, 3, 'Georgiana Jacobson', 'fdubuque@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(33, 8, 3, 1, 7, 1, 'Vincenza Gibson III', 'tom13@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(34, 3, 3, 1, 7, 3, 'Camryn Yundt', 'roger.prohaska@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(35, 7, 3, 2, 7, 1, 'Orion Streich', 'ntorp@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(36, 5, 3, 1, 8, 3, 'Colt Gibson', 'wschamberger@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(37, 3, 3, 1, 8, 3, 'Damion Sanford', 'tmuller@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(38, 1, 3, 2, 8, 5, 'Orlo McClure', 'hconn@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(39, 9, 3, 2, 8, 4, 'Dahlia Baumbach', 'haley.kathlyn@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(40, 6, 3, 1, 8, 3, 'Ms. Stacy Gaylord', 'dorothea.kuhic@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(41, 4, 3, 2, 9, 4, 'Dr. Jeanette Terry PhD', 'frolfson@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(42, 5, 3, 2, 9, 2, 'Prof. Cletus Littel V', 'cordell.king@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(43, 3, 3, 1, 9, 5, 'Rod Russel', 'gleichner.aliza@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(44, 5, 3, 2, 9, 4, 'Francesca Pouros', 'luella76@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(45, 7, 3, 2, 9, 2, 'Myrtis Gottlieb', 'fahey.vladimir@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(46, 1, 4, 1, 10, 5, 'Gia Weissnat', 'ora.konopelski@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(47, 4, 4, 2, 10, 1, 'Randall Heller I', 'lafayette.ritchie@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(48, 2, 4, 2, 10, 2, 'Effie Shields', 'wisoky.kelvin@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(49, 3, 4, 2, 10, 5, 'Lura Weissnat', 'lyda.spinka@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(50, 4, 4, 2, 10, 2, 'Bernardo Corkery', 'shanelle66@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(51, 8, 4, 1, 11, 5, 'Dr. Fidel McGlynn PhD', 'fabiola45@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(52, 3, 4, 1, 11, 4, 'Jimmie Schmidt', 'christiansen.fredy@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(53, 8, 4, 1, 11, 4, 'Nichole Lubowitz', 'alanis69@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(54, 5, 4, 1, 11, 1, 'Ruben Ziemann', 'uweissnat@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(55, 4, 4, 2, 11, 3, 'Vicenta Hill', 'casimer01@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(56, 10, 4, 1, 12, 1, 'Ron Bayer', 'mandy02@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(57, 2, 4, 1, 12, 2, 'Ottis Reilly', 'amya84@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(58, 4, 4, 1, 12, 4, 'Miss Magdalen Gleichner V', 'rico99@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(59, 9, 4, 1, 12, 1, 'Annabel Farrell', 'ysmitham@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(60, 8, 4, 1, 12, 4, 'Katrina Collier', 'franco64@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(61, 7, 5, 2, 13, 5, 'Herminio Ankunding Jr.', 'ezra67@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(62, 4, 5, 2, 13, 3, 'Maia Nienow', 'ziemann.lillian@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(63, 8, 5, 2, 13, 3, 'Dr. Abelardo Windler', 'ritchie.anais@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(64, 8, 5, 2, 13, 5, 'Wilburn Mayer', 'constance50@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(65, 2, 5, 1, 13, 1, 'Carlie Yundt II', 'lebsack.garnet@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(66, 9, 5, 2, 14, 5, 'Mr. Raheem Dickens', 'roberta29@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(67, 10, 5, 1, 14, 3, 'Hilda Stamm', 'laurine.nienow@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(68, 6, 5, 1, 14, 2, 'Monte Leuschke', 'zackery.jenkins@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(69, 1, 5, 1, 14, 1, 'Mr. Levi Howell', 'lowell.kiehn@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(70, 1, 5, 1, 14, 4, 'Alva Schamberger PhD', 'msenger@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(71, 8, 5, 1, 15, 1, 'Janiya Volkman', 'elza.grady@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(72, 1, 5, 2, 15, 2, 'Kamryn Weimann', 'price.marcelle@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(73, 4, 5, 2, 15, 3, 'Giovanny Hirthe', 'kris.adelia@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(74, 3, 5, 1, 15, 5, 'Layne O\'Kon DDS', 'cwitting@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(75, 7, 5, 1, 15, 4, 'Curtis Shanahan DVM', 'torp.burdette@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(76, 1, 6, 2, 16, 2, 'Prof. Earnestine Friesen', 'ashley.schulist@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(77, 2, 6, 1, 16, 3, 'Miss Cassidy Mante', 'padberg.sallie@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(78, 9, 6, 1, 16, 5, 'Khalil Stanton', 'gabe.tromp@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(79, 6, 6, 1, 16, 4, 'Brielle Considine', 'patricia.hessel@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(80, 3, 6, 1, 16, 1, 'Dr. Jeremy Veum', 'orie.quitzon@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(81, 2, 6, 2, 17, 2, 'Dr. Lavon Rau', 'ybarrows@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(82, 6, 6, 2, 17, 2, 'Lavonne Bednar', 'geovanni.okuneva@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(83, 1, 6, 2, 17, 2, 'Mrs. Gregoria Christiansen PhD', 'king.haven@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(84, 9, 6, 2, 17, 3, 'Elenor Schultz', 'wilbert.hill@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(85, 1, 6, 1, 17, 4, 'Sister Douglas', 'kveum@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(86, 10, 6, 2, 18, 5, 'Doyle Maggio', 'nora.harber@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(87, 1, 6, 1, 18, 4, 'Maritza Kerluke', 'jazlyn15@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(88, 4, 6, 1, 18, 5, 'Braulio Reilly', 'koss.dorothy@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(89, 8, 6, 2, 18, 3, 'Prof. Alexis Gusikowski', 'justina31@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(90, 5, 6, 2, 18, 3, 'Libby Fadel', 'schumm.saige@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(91, 3, 7, 2, 19, 3, 'Madaline Wilkinson MD', 'carter.elmore@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(92, 9, 7, 1, 19, 1, 'Shayne Aufderhar', 'gcasper@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(93, 8, 7, 2, 19, 2, 'Arvid Shanahan', 'thomas.koss@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(94, 2, 7, 2, 19, 5, 'Catharine Weimann Sr.', 'ddaugherty@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(95, 7, 7, 1, 19, 5, 'Genevieve Leffler', 'bayer.felicita@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(96, 1, 7, 2, 20, 4, 'Giles Ratke', 'nturner@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(97, 5, 7, 1, 20, 4, 'Miss Karolann Dietrich DDS', 'reid.schulist@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(98, 3, 7, 1, 20, 5, 'Ewell Green II', 'naomie.bayer@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(99, 3, 7, 2, 20, 1, 'Adelia Bartoletti', 'issac45@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(100, 4, 7, 1, 20, 2, 'Virginie Raynor', 'balistreri.misty@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(101, 1, 7, 1, 21, 3, 'Mr. Mavis Padberg', 'zulauf.amiya@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(102, 8, 7, 1, 21, 5, 'Vicente Hessel', 'marietta83@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(103, 2, 7, 1, 21, 4, 'Emilia Legros', 'jacinthe60@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(104, 7, 7, 2, 21, 5, 'Alvera Volkman V', 'nmclaughlin@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(105, 9, 7, 1, 21, 3, 'Rafaela Bogan', 'konopelski.lurline@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(106, 8, 8, 2, 22, 2, 'Aiyana Mann', 'rrogahn@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(107, 7, 8, 1, 22, 1, 'Dana Frami', 'akovacek@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(108, 5, 8, 2, 22, 3, 'Mr. Gene Kshlerin V', 'sbradtke@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(109, 1, 8, 1, 22, 2, 'Mrs. Kelsie Ruecker', 'winnifred35@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(110, 1, 8, 1, 22, 4, 'Sydnee Rice', 'kirk57@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(111, 9, 8, 1, 23, 2, 'Vidal Bednar', 'rylan.kunde@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(112, 8, 8, 2, 23, 3, 'Vicky Graham I', 'kamron.veum@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(113, 1, 8, 1, 23, 4, 'Noelia Zulauf', 'kenyatta.powlowski@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(114, 5, 8, 1, 23, 2, 'Prof. Torey D\'Amore MD', 'ulakin@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(115, 8, 8, 2, 23, 1, 'Shirley Kshlerin', 'schowalter.belle@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(116, 5, 8, 1, 24, 5, 'Annamae Hills', 'kathryn.mohr@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(117, 1, 8, 2, 24, 1, 'Edwin Gutkowski', 'trycia.ullrich@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(118, 10, 8, 1, 24, 1, 'Ms. Katlynn Leannon III', 'nbeatty@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(119, 1, 8, 1, 24, 2, 'Liam Satterfield', 'aimee28@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(120, 5, 8, 1, 24, 2, 'Dolly Abbott DVM', 'koepp.jesse@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(121, 2, 9, 1, 25, 5, 'Alvena Collins V', 'bo.dibbert@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(122, 1, 9, 1, 25, 2, 'Prof. Angelita Nicolas', 'connor.corkery@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(123, 4, 9, 2, 25, 3, 'Magnus Fritsch DDS', 'howard45@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(124, 1, 9, 2, 25, 2, 'Pasquale Okuneva II', 'ashton70@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(125, 6, 9, 2, 25, 1, 'Ms. Virginia Hagenes PhD', 'ana.leuschke@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(126, 7, 9, 1, 26, 3, 'Ivah Walker', 'feeney.magdalena@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(127, 7, 9, 1, 26, 4, 'Layne Sporer', 'tina.quigley@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(128, 10, 9, 1, 26, 3, 'Norbert Larkin', 'krodriguez@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(129, 1, 9, 2, 26, 5, 'Gabrielle Watsica', 'kerluke.kaia@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(130, 4, 9, 2, 26, 1, 'Gabriella Fisher', 'guiseppe.stanton@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(131, 2, 9, 1, 27, 3, 'Noe Donnelly', 'frederique03@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(132, 10, 9, 2, 27, 3, 'Wyatt Green', 'gibson.bud@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(133, 7, 9, 2, 27, 3, 'Jedidiah Boyer', 'lucio23@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(134, 1, 9, 1, 27, 5, 'Tanner Goldner', 'willard41@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(135, 4, 9, 2, 27, 1, 'Stephen Douglas', 'lbernhard@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(136, 7, 10, 1, 28, 3, 'Lauriane Bechtelar', 'blanche.nolan@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(137, 7, 10, 2, 28, 5, 'Connie Muller IV', 'dmann@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(138, 2, 10, 1, 28, 1, 'Jonatan Hill', 'carole60@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(139, 4, 10, 1, 28, 5, 'Ms. Cynthia Hagenes DDS', 'cody55@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(140, 9, 10, 2, 28, 4, 'Eriberto Kovacek', 'keyon78@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(141, 10, 10, 2, 29, 1, 'Katelynn Feil', 'kraig.batz@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(142, 2, 10, 2, 29, 3, 'Darrick Watsica', 'hills.nakia@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(143, 2, 10, 1, 29, 2, 'Trinity Considine', 'west.caleb@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(144, 10, 10, 2, 29, 5, 'Elliott Zemlak', 'rosalyn.quitzon@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(145, 9, 10, 2, 29, 2, 'Ida Mitchell III', 'ethel.monahan@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(146, 9, 10, 2, 30, 2, 'Tito Wyman', 'junior43@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(147, 10, 10, 2, 30, 4, 'Mrs. Eleanora Jacobson IV', 'jules17@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(148, 3, 10, 1, 30, 4, 'Else Eichmann', 'rdenesik@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(149, 6, 10, 1, 30, 4, 'Cornell Stanton IV', 'ckoepp@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(150, 4, 10, 2, 30, 1, 'Herminia Wintheiser', 'earl60@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(151, 1, 11, 1, 31, 1, 'Sarai Reinger', 'qwaters@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(152, 2, 11, 1, 31, 3, 'Melyssa Dietrich', 'hand.vicente@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(153, 1, 11, 1, 31, 1, 'Archibald Beatty', 'carroll.reynold@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(154, 8, 11, 2, 31, 1, 'Nedra Hyatt', 'xander15@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(155, 8, 11, 2, 31, 2, 'Serenity Terry', 'kyler20@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(156, 1, 11, 1, 32, 4, 'Abraham Langosh', 'lester14@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(157, 3, 11, 1, 32, 5, 'Lavina Block MD', 'howard68@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(158, 9, 11, 1, 32, 4, 'Dayana Ferry', 'edythe39@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(159, 10, 11, 2, 32, 5, 'Prof. Bette Parisian', 'roosevelt.berge@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(160, 5, 11, 1, 32, 1, 'Freda Waters', 'kari92@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(161, 1, 11, 2, 33, 1, 'Shyanne Senger', 'kuhn.kian@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(162, 2, 11, 2, 33, 2, 'Dr. Lucio Harvey', 'xhalvorson@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(163, 2, 11, 1, 33, 3, 'Edgar O\'Reilly', 'aurelio38@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(164, 5, 11, 1, 33, 1, 'Katrine Green', 'aisha.murazik@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(165, 8, 11, 1, 33, 4, 'Gino Wisoky', 'bins.odessa@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(166, 6, 12, 1, 34, 4, 'Alejandra Thompson III', 'ecarroll@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(167, 6, 12, 2, 34, 5, 'Coleman Douglas', 'lorenz13@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(168, 7, 12, 1, 34, 4, 'Willa Koepp', 'jason96@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(169, 7, 12, 1, 34, 4, 'Kurt Ledner', 'ryder35@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(170, 6, 12, 1, 34, 3, 'Mr. Ron Walker PhD', 'christy.fisher@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(171, 3, 12, 2, 35, 1, 'Claire Boehm', 'flynch@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(172, 10, 12, 2, 35, 5, 'Prof. Monique Becker', 'rvandervort@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(173, 1, 12, 2, 35, 2, 'Ms. Yvonne Williamson Jr.', 'malachi81@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(174, 4, 12, 2, 35, 3, 'Furman Pacocha', 'jacey.satterfield@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(175, 9, 12, 2, 35, 2, 'Brigitte Pfannerstill', 'delaney.mann@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(176, 6, 12, 2, 36, 4, 'Dr. Ibrahim Osinski', 'abraham57@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(177, 4, 12, 1, 36, 2, 'Roscoe Halvorson', 'jkshlerin@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(178, 6, 12, 1, 36, 4, 'Angela Larkin', 'ljacobson@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(179, 5, 12, 2, 36, 5, 'Augustus Wiza', 'cartwright.misty@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(180, 3, 12, 1, 36, 3, 'Ottilie Daugherty', 'mckenna01@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(181, 8, 13, 2, 37, 1, 'Tony Kozey Jr.', 'noemy86@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(182, 8, 13, 1, 37, 3, 'Carley Tremblay II', 'aurelia04@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(183, 6, 13, 1, 37, 4, 'Chance Barrows I', 'stevie81@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(184, 10, 13, 1, 37, 3, 'Gene Lockman DVM', 'swhite@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(185, 9, 13, 1, 37, 4, 'Prof. Carolina Jones', 'jayda.eichmann@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(186, 4, 13, 2, 38, 1, 'Anastacio Kertzmann', 'claudia.mosciski@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(187, 8, 13, 1, 38, 1, 'Miss Claudine Koch', 'finn.kuphal@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(188, 3, 13, 2, 38, 1, 'Leola Stehr', 'rwisozk@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(189, 3, 13, 2, 38, 2, 'Rhiannon Donnelly', 'vonrueden.jason@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(190, 4, 13, 2, 38, 4, 'Dr. Janick Murazik', 'haley.agnes@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(191, 7, 13, 1, 39, 1, 'Lamar Lowe', 'ukeeling@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(192, 3, 13, 1, 39, 5, 'Rickie Kunze', 'labadie.bryon@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(193, 3, 13, 1, 39, 4, 'Ellsworth Stark', 'eleazar.schinner@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(194, 7, 13, 1, 39, 2, 'Mustafa Koss', 'joyce.gibson@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(195, 1, 13, 2, 39, 3, 'Gudrun Bashirian', 'lmedhurst@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(196, 9, 14, 1, 40, 4, 'Noelia Jacobs', 'alexie02@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(197, 9, 14, 2, 40, 5, 'Rickie Hamill', 'marks.heloise@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(198, 1, 14, 1, 40, 1, 'Eldon Kuhlman', 'schroeder.jerad@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(199, 1, 14, 2, 40, 4, 'Ms. Rosalyn Fay', 'garth97@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(200, 3, 14, 2, 40, 2, 'Dr. Gillian Abshire', 'lilian01@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(201, 2, 14, 1, 41, 3, 'Evie Koch', 'beryl.breitenberg@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(202, 4, 14, 2, 41, 4, 'Claudine Dibbert', 'rebeka21@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(203, 10, 14, 2, 41, 4, 'Prof. Alvena Keebler DDS', 'kris88@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(204, 10, 14, 1, 41, 1, 'Deondre Connelly', 'paucek.mckenzie@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(205, 10, 14, 2, 41, 5, 'Trevor Predovic', 'precious69@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(206, 9, 14, 2, 42, 2, 'Branson Murray', 'josiah03@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(207, 4, 14, 1, 42, 5, 'Lelah Larson', 'lschulist@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(208, 7, 14, 2, 42, 4, 'Mrs. Taryn Fay V', 'stark.myrtle@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(209, 9, 14, 2, 42, 1, 'Dr. Ernesto Hermiston DVM', 'buck78@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(210, 3, 14, 1, 42, 2, 'Mazie Marks', 'weston.bechtelar@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(211, 7, 15, 2, 43, 4, 'Prof. Fredrick Mohr Jr.', 'sven23@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(212, 8, 15, 1, 43, 3, 'Ted Robel', 'johathan28@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(213, 3, 15, 1, 43, 2, 'Mr. Americo Roob', 'nparisian@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(214, 10, 15, 1, 43, 1, 'Mr. Clay Breitenberg', 'kzemlak@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(215, 9, 15, 2, 43, 3, 'George Frami', 'leda10@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(216, 9, 15, 1, 44, 3, 'Mrs. Sincere Luettgen DDS', 'demarcus06@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(217, 1, 15, 1, 44, 1, 'Kristoffer Bahringer', 'ansel96@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(218, 10, 15, 1, 44, 4, 'Brenden Smith III', 'jkohler@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(219, 8, 15, 2, 44, 2, 'Mrs. Savanah Fritsch', 'bquitzon@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(220, 10, 15, 2, 44, 4, 'Mr. Bernie Monahan', 'watsica.carlo@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(221, 10, 15, 2, 45, 4, 'Prof. Laurence Kirlin', 'danika18@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(222, 10, 15, 2, 45, 3, 'Leslie Kihn', 'litzy51@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(223, 3, 15, 2, 45, 2, 'Mr. Benny Bogisich', 'darrell.grimes@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(224, 9, 15, 2, 45, 5, 'Ms. Isabel Connelly', 'pbartell@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(225, 4, 15, 1, 45, 1, 'Herman McLaughlin', 'gstreich@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(226, 2, 16, 1, 46, 3, 'Mckenzie Stark', 'kreiger.devan@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(227, 9, 16, 2, 46, 1, 'Dr. Emil Rempel MD', 'pfeffer.vena@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(228, 5, 16, 2, 46, 1, 'Miss Joannie Feest DDS', 'choppe@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(229, 1, 16, 2, 46, 1, 'Travon Casper', 'krystina.gaylord@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(230, 9, 16, 2, 46, 1, 'Prof. Meredith Swaniawski III', 'colt.little@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(231, 9, 16, 2, 47, 2, 'Alysson Stiedemann', 'yvette89@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(232, 1, 16, 2, 47, 1, 'Malcolm Corkery', 'golden.runolfsdottir@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(233, 7, 16, 1, 47, 2, 'Chandler Welch Jr.', 'casper.whitney@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(234, 9, 16, 2, 47, 2, 'Dr. Alena Mueller', 'jonatan49@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(235, 9, 16, 1, 47, 3, 'Pink Goldner', 'aliza28@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(236, 1, 16, 2, 48, 4, 'Duane Emmerich', 'schulist.zita@example.com', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(237, 9, 16, 2, 48, 1, 'Adrain Hegmann', 'rolson@example.net', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(238, 10, 16, 1, 48, 3, 'Prof. Kirsten Zemlak', 'rokuneva@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(239, 6, 16, 1, 48, 4, 'Arvilla Bednar', 'adrian94@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28'),
(240, 2, 16, 1, 48, 5, 'Benton Ryan Jr.', 'jennyfer05@example.org', '2024-07-29 23:50:28', '2024-07-29 23:50:28');

INSERT INTO `users` (`id`, `user_id`, `name`, `email`, `date_of_birth`, `join_date`, `phone_number`, `status`, `role_name`, `avatar`, `position`, `department`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Admin', 'admin@admin.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$f1yt7.jMMXHzvZfa7dPBp.I9zPozRSu1t63Ct0.k5TQ8GHw7zaX5y', NULL, NULL, NULL),
(2, '000001', 'aries', 'aries@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$TyH6X0me4KpzPu3BIQELJ.TJbRInbms3cQRZXbXbuhCHRrODZyr6u', NULL, '2024-07-29 23:57:47', '2024-07-29 23:57:47');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;