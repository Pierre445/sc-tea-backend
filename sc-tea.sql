-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 28 août 2023 à 11:53
-- Version du serveur : 5.7.36
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sc-tea`
--

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_06_13_113655_create_products_table', 1),
(6, '2023_06_15_060228_create_personnal_information_table', 1),
(7, '2023_06_15_064614_create_store_invoices_table', 1),
(8, '2023_06_15_092300_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Structure de la table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'access products', 'web', NULL, NULL),
(2, 'create products', 'web', NULL, NULL),
(3, 'update products', 'web', NULL, NULL),
(4, 'delete products', 'web', NULL, NULL),
(5, 'access users', 'web', NULL, NULL),
(6, 'create users', 'web', NULL, NULL),
(7, 'update users', 'web', NULL, NULL),
(8, 'delete users', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 2, 'MyApp', '7e34514eacd5b533af9a4757d160e457543350b24faa9bf52b5a65d3b271a173', '[\"*\"]', '2023-06-16 03:19:20', NULL, '2023-06-16 03:12:51', '2023-06-16 03:19:20'),
(3, 'App\\Models\\User', 1, 'MyApp', '1352080ad044e1f6616c8ea5a527313ac620ce8caaac8787389999181c4e045e', '[\"*\"]', '2023-06-16 03:22:56', NULL, '2023-06-16 03:19:43', '2023-06-16 03:22:56'),
(4, 'App\\Models\\User', 1, 'MyApp', 'ed1fbb4916482463442a00a61672264324d947a0eaf60bc18e46d3a4810a4b78', '[\"*\"]', NULL, NULL, '2023-06-16 03:26:01', '2023-06-16 03:26:01'),
(5, 'App\\Models\\User', 4, 'MyApp', 'fc7d27d40806ac5952eadfbe127343422da5346faadd3144176a71695f542069', '[\"*\"]', NULL, NULL, '2023-06-19 05:49:07', '2023-06-19 05:49:07'),
(6, 'App\\Models\\User', 1, 'MyApp', 'bc5beebdde8ff50b779a4c03962f2eba7e1dfd15950fa9d095dca034426ec1f2', '[\"*\"]', '2023-08-28 07:44:05', NULL, '2023-06-19 06:09:30', '2023-08-28 07:44:05'),
(7, 'App\\Models\\User', 1, 'MyApp', 'fa2f7c3cfcbbb7919c3319a7d8b1a0a8e2521cc5f09eb68f41e77df7a9fd794a', '[\"*\"]', NULL, NULL, '2023-06-21 01:55:28', '2023-06-21 01:55:28'),
(8, 'App\\Models\\User', 1, 'MyApp', '9608f111ef04b4ff1660cb10644a502ea04272f73070e6070e251ea9c8917cb2', '[\"*\"]', NULL, NULL, '2023-06-21 01:56:24', '2023-06-21 01:56:24'),
(9, 'App\\Models\\User', 1, 'MyApp', '38c80592f45fdc5f6a531974d7f8cd43b5c8e6fccd7631f73623ff84697bc990', '[\"*\"]', NULL, NULL, '2023-06-21 01:56:44', '2023-06-21 01:56:44'),
(10, 'App\\Models\\User', 1, 'MyApp', '7b4cf850ba5647809da579a0917aa2d7b86b22e177772d7487336351020576e9', '[\"*\"]', NULL, NULL, '2023-06-21 02:14:58', '2023-06-21 02:14:58'),
(11, 'App\\Models\\User', 1, 'MyApp', '746dac620f26362aacc6f870432c9f56ac766942afa198daafa548d45cee51c8', '[\"*\"]', NULL, NULL, '2023-06-21 02:18:32', '2023-06-21 02:18:32'),
(12, 'App\\Models\\User', 1, 'MyApp', '3e8ab40932d2e5723fa938d09041c967ded6a7cdba5108e48380d53dd9cf937b', '[\"*\"]', NULL, NULL, '2023-06-21 02:18:41', '2023-06-21 02:18:41'),
(13, 'App\\Models\\User', 1, 'MyApp', 'f07a94d516c45a5ff66e356187beeeba57c3a496cf3685dafd1007a412371921', '[\"*\"]', NULL, NULL, '2023-06-21 02:18:56', '2023-06-21 02:18:56'),
(14, 'App\\Models\\User', 1, 'MyApp', 'ac0abe1d700c03775eb9fef557d0fb591d83276141a6b147d656e2963df45d1f', '[\"*\"]', NULL, NULL, '2023-06-21 02:19:04', '2023-06-21 02:19:04'),
(15, 'App\\Models\\User', 1, 'MyApp', '2671e35db6418a69c45ea2bbe3df190a5705c4bb272ad04423418914d6c6e4da', '[\"*\"]', NULL, NULL, '2023-06-21 02:20:17', '2023-06-21 02:20:17'),
(16, 'App\\Models\\User', 1, 'MyApp', 'ae0190cd12347c04f02d493b3343f5875fb6b6a92f001f75bfac157255a4306a', '[\"*\"]', NULL, NULL, '2023-06-21 02:21:35', '2023-06-21 02:21:35'),
(17, 'App\\Models\\User', 1, 'MyApp', '0d36b8031a2104a83cea17a3fd12b28d0fa1ef4c86c7bfb457f1ada682dfff7a', '[\"*\"]', NULL, NULL, '2023-06-21 02:28:03', '2023-06-21 02:28:03'),
(18, 'App\\Models\\User', 1, 'MyApp', '5694d710cd30df126f85eb28991932251487d1a8fbb775d07f56c4d0aca1ec8d', '[\"*\"]', NULL, NULL, '2023-06-21 02:28:11', '2023-06-21 02:28:11'),
(19, 'App\\Models\\User', 1, 'MyApp', '9c1e50687f5503e8df7a36c3031dd55ed0da294083481a7e428f698e5156c0a0', '[\"*\"]', NULL, NULL, '2023-06-21 02:33:46', '2023-06-21 02:33:46'),
(20, 'App\\Models\\User', 1, 'MyApp', '59932e16b9b4797b228f6ebd2c9915082dc644f6d3291d73531a68e5ddd83575', '[\"*\"]', NULL, NULL, '2023-06-21 02:39:02', '2023-06-21 02:39:02'),
(21, 'App\\Models\\User', 1, 'MyApp', 'd7f2b3edc884dc81db7be73a14a9bedcf704a006e59f8fdefbcd18f1c7810107', '[\"*\"]', NULL, NULL, '2023-06-21 02:53:47', '2023-06-21 02:53:47'),
(22, 'App\\Models\\User', 1, 'MyApp', '5847020a81e0554ef394c7bec5142139219f1caf7bdfb3bb6bb2339d6ad6c43c', '[\"*\"]', NULL, NULL, '2023-06-21 03:31:20', '2023-06-21 03:31:20'),
(23, 'App\\Models\\User', 1, 'MyApp', 'af21802fcb0dbe8a27eb442aa574a1673b0d6ee364f229f2b519c71a1fe1f1a8', '[\"*\"]', '2023-08-28 07:48:56', NULL, '2023-06-21 06:23:58', '2023-08-28 07:48:56'),
(24, 'App\\Models\\User', 1, 'MyApp', '51d4f929802ef154a203f383a194463c0a3ed7695c78318b6dd659edd51d3bc1', '[\"*\"]', '2023-06-23 04:19:52', NULL, '2023-06-21 07:46:25', '2023-06-23 04:19:52'),
(25, 'App\\Models\\User', 1, 'MyApp', 'b79b39e7b1d1a34a1ee831776409bd1c29351d81c77d3615a536b62709d78e63', '[\"*\"]', '2023-08-28 07:48:55', NULL, '2023-08-28 06:34:42', '2023-08-28 07:48:55'),
(26, 'App\\Models\\User', 1, 'MyApp', '26ba0d939da9dff8b270698bff274414226fb8871667443f35a06a3fdb93aeeb', '[\"*\"]', NULL, NULL, '2023-08-28 07:48:58', '2023-08-28 07:48:58');

-- --------------------------------------------------------

--
-- Structure de la table `personnal_information`
--

DROP TABLE IF EXISTS `personnal_information`;
CREATE TABLE IF NOT EXISTS `personnal_information` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postalCode` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personnal_information_userid_foreign` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urlProduct` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_ref_unique` (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `ProductName`, `price`, `category`, `urlProduct`, `description`, `ref`, `supplier`, `created_at`, `updated_at`) VALUES
(1, 'NetJante', 456.00, 'Haute de gamme', NULL, NULL, '20180', NULL, '2023-06-19 06:29:35', '2023-06-19 06:29:35'),
(2, 'NetRoue', 4568.00, 'Haute de gamme', NULL, NULL, '20187', NULL, '2023-06-19 07:17:00', '2023-06-19 07:17:00'),
(3, 'NetBrise', 45.00, 'Haute de gamme', NULL, NULL, '20186', NULL, '2023-06-19 07:17:19', '2023-06-19 07:17:19'),
(4, 'NetCar', 4.00, 'Haute de gamme', NULL, NULL, '20185', NULL, '2023-06-19 07:27:23', '2023-06-19 07:27:23');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2023-06-16 03:11:16', '2023-06-16 03:11:16'),
(2, 'customer', 'web', '2023-06-16 03:11:16', '2023-06-16 03:11:16');

-- --------------------------------------------------------

--
-- Structure de la table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(2, 2),
(7, 2);

-- --------------------------------------------------------

--
-- Structure de la table `store_invoices`
--

DROP TABLE IF EXISTS `store_invoices`;
CREATE TABLE IF NOT EXISTS `store_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_facture` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_invoices_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$kE1uohw9wkdJpehJ/rfk2urJsm8n2Do8.W.68ds.o41Y7xo35iNKO', NULL, NULL, NULL),
(2, 'i4k8rlIrKQ', '9irpPSG4mn@gmail.com', NULL, '$2y$10$QSFtEtcorAkKL3s2lvaAu.dlQ6vdDJXW7Rti6VoS/AkG4bR.n2p2a', NULL, NULL, NULL),
(3, 'wVAHER4gHn', '1YBj2uhVwq@gmail.com', NULL, 'kkkk', NULL, NULL, NULL),
(4, 'Bob', 'bob@gmail.com', NULL, '$2y$10$gqDMCkPF.sEiIJKdz/MRCOrCpSocuTOLAUY8c7So2FBLyr4cP2k0i', NULL, '2023-06-19 05:48:19', '2023-06-19 05:48:19');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `personnal_information`
--
ALTER TABLE `personnal_information`
  ADD CONSTRAINT `personnal_information_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `store_invoices`
--
ALTER TABLE `store_invoices`
  ADD CONSTRAINT `store_invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
