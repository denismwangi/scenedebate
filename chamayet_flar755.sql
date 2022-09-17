-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 18, 2022 at 02:22 AM
-- Server version: 5.7.36
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chamayet_flar755`
--

-- --------------------------------------------------------

--
-- Table structure for table `flio_access_tokens`
--

CREATE TABLE `flio_access_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `last_activity_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flio_api_keys`
--

CREATE TABLE `flio_api_keys` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `allowed_ips` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `last_activity_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flio_discussions`
--

CREATE TABLE `flio_discussions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_count` int(11) NOT NULL DEFAULT '1',
  `participant_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `post_number_index` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `first_post_id` int(10) UNSIGNED DEFAULT NULL,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_user_id` int(10) UNSIGNED DEFAULT NULL,
  `last_post_id` int(10) UNSIGNED DEFAULT NULL,
  `last_post_number` int(10) UNSIGNED DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) UNSIGNED DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '1',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `is_sticky` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flio_discussions`
--

INSERT INTO `flio_discussions` (`id`, `title`, `comment_count`, `participant_count`, `post_number_index`, `created_at`, `user_id`, `first_post_id`, `last_posted_at`, `last_posted_user_id`, `last_post_id`, `last_post_number`, `hidden_at`, `hidden_user_id`, `slug`, `is_private`, `is_approved`, `is_locked`, `is_sticky`) VALUES
(2, 'The Vampire Diaries', 1, 1, 0, '2022-09-16 01:21:36', 3, 5, '2022-09-16 01:21:36', 3, 5, 1, NULL, NULL, 'the-vampire-diaries', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `flio_discussion_tag`
--

CREATE TABLE `flio_discussion_tag` (
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flio_discussion_tag`
--

INSERT INTO `flio_discussion_tag` (`discussion_id`, `tag_id`, `created_at`) VALUES
(2, 13, '2022-09-16 01:21:36');

-- --------------------------------------------------------

--
-- Table structure for table `flio_discussion_user`
--

CREATE TABLE `flio_discussion_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `last_read_at` datetime DEFAULT NULL,
  `last_read_post_number` int(10) UNSIGNED DEFAULT NULL,
  `subscription` enum('follow','ignore') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flio_discussion_user`
--

INSERT INTO `flio_discussion_user` (`user_id`, `discussion_id`, `last_read_at`, `last_read_post_number`, `subscription`) VALUES
(1, 2, '2022-09-16 01:25:39', 1, NULL),
(3, 2, '2022-09-16 01:21:36', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flio_email_tokens`
--

CREATE TABLE `flio_email_tokens` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flio_flags`
--

CREATE TABLE `flio_flags` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason_detail` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flio_groups`
--

CREATE TABLE `flio_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_singular` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_plural` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flio_groups`
--

INSERT INTO `flio_groups` (`id`, `name_singular`, `name_plural`, `color`, `icon`, `is_hidden`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admins', '#B72A2A', 'fas fa-wrench', 0, NULL, NULL),
(2, 'Guest', 'Guests', NULL, NULL, 0, NULL, NULL),
(3, 'Member', 'Members', NULL, NULL, 0, NULL, NULL),
(4, 'Mod', 'Mods', '#80349E', 'fas fa-bolt', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flio_group_permission`
--

CREATE TABLE `flio_group_permission` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `permission` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flio_group_permission`
--

INSERT INTO `flio_group_permission` (`group_id`, `permission`, `created_at`) VALUES
(2, 'viewForum', NULL),
(3, 'discussion.flagPosts', '2022-09-13 22:34:10'),
(3, 'discussion.likePosts', '2022-09-16 01:00:30'),
(3, 'discussion.reply', NULL),
(3, 'discussion.replyWithoutApproval', '2022-09-13 22:34:10'),
(3, 'discussion.startWithoutApproval', '2022-09-13 22:34:10'),
(3, 'searchUsers', NULL),
(3, 'startDiscussion', NULL),
(4, 'discussion.approvePosts', '2022-09-14 15:27:38'),
(4, 'discussion.editPosts', NULL),
(4, 'discussion.hide', NULL),
(4, 'discussion.hidePosts', NULL),
(4, 'discussion.lock', '2022-09-13 22:34:10'),
(4, 'discussion.rename', NULL),
(4, 'discussion.sticky', '2022-09-13 22:34:10'),
(4, 'discussion.tag', '2022-09-13 22:34:10'),
(4, 'discussion.viewFlags', '2022-09-13 22:34:10'),
(4, 'discussion.viewIpsPosts', NULL),
(4, 'user.suspend', '2022-09-13 22:34:10'),
(4, 'user.viewLastSeenAt', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flio_group_user`
--

CREATE TABLE `flio_group_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flio_group_user`
--

INSERT INTO `flio_group_user` (`user_id`, `group_id`, `created_at`) VALUES
(1, 1, '2022-09-13 22:34:10');

-- --------------------------------------------------------

--
-- Table structure for table `flio_login_providers`
--

CREATE TABLE `flio_login_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flio_migrations`
--

CREATE TABLE `flio_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flio_migrations`
--

INSERT INTO `flio_migrations` (`id`, `migration`, `extension`) VALUES
(1, '2015_02_24_000000_create_access_tokens_table', NULL),
(2, '2015_02_24_000000_create_api_keys_table', NULL),
(3, '2015_02_24_000000_create_config_table', NULL),
(4, '2015_02_24_000000_create_discussions_table', NULL),
(5, '2015_02_24_000000_create_email_tokens_table', NULL),
(6, '2015_02_24_000000_create_groups_table', NULL),
(7, '2015_02_24_000000_create_notifications_table', NULL),
(8, '2015_02_24_000000_create_password_tokens_table', NULL),
(9, '2015_02_24_000000_create_permissions_table', NULL),
(10, '2015_02_24_000000_create_posts_table', NULL),
(11, '2015_02_24_000000_create_users_discussions_table', NULL),
(12, '2015_02_24_000000_create_users_groups_table', NULL),
(13, '2015_02_24_000000_create_users_table', NULL),
(14, '2015_09_15_000000_create_auth_tokens_table', NULL),
(15, '2015_09_20_224327_add_hide_to_discussions', NULL),
(16, '2015_09_22_030432_rename_notification_read_time', NULL),
(17, '2015_10_07_130531_rename_config_to_settings', NULL),
(18, '2015_10_24_194000_add_ip_address_to_posts', NULL),
(19, '2015_12_05_042721_change_access_tokens_columns', NULL),
(20, '2015_12_17_194247_change_settings_value_column_to_text', NULL),
(21, '2016_02_04_095452_add_slug_to_discussions', NULL),
(22, '2017_04_07_114138_add_is_private_to_discussions', NULL),
(23, '2017_04_07_114138_add_is_private_to_posts', NULL),
(24, '2018_01_11_093900_change_access_tokens_columns', NULL),
(25, '2018_01_11_094000_change_access_tokens_add_foreign_keys', NULL),
(26, '2018_01_11_095000_change_api_keys_columns', NULL),
(27, '2018_01_11_101800_rename_auth_tokens_to_registration_tokens', NULL),
(28, '2018_01_11_102000_change_registration_tokens_rename_id_to_token', NULL),
(29, '2018_01_11_102100_change_registration_tokens_created_at_to_datetime', NULL),
(30, '2018_01_11_120604_change_posts_table_to_innodb', NULL),
(31, '2018_01_11_155200_change_discussions_rename_columns', NULL),
(32, '2018_01_11_155300_change_discussions_add_foreign_keys', NULL),
(33, '2018_01_15_071700_rename_users_discussions_to_discussion_user', NULL),
(34, '2018_01_15_071800_change_discussion_user_rename_columns', NULL),
(35, '2018_01_15_071900_change_discussion_user_add_foreign_keys', NULL),
(36, '2018_01_15_072600_change_email_tokens_rename_id_to_token', NULL),
(37, '2018_01_15_072700_change_email_tokens_add_foreign_keys', NULL),
(38, '2018_01_15_072800_change_email_tokens_created_at_to_datetime', NULL),
(39, '2018_01_18_130400_rename_permissions_to_group_permission', NULL),
(40, '2018_01_18_130500_change_group_permission_add_foreign_keys', NULL),
(41, '2018_01_18_130600_rename_users_groups_to_group_user', NULL),
(42, '2018_01_18_130700_change_group_user_add_foreign_keys', NULL),
(43, '2018_01_18_133000_change_notifications_columns', NULL),
(44, '2018_01_18_133100_change_notifications_add_foreign_keys', NULL),
(45, '2018_01_18_134400_change_password_tokens_rename_id_to_token', NULL),
(46, '2018_01_18_134500_change_password_tokens_add_foreign_keys', NULL),
(47, '2018_01_18_134600_change_password_tokens_created_at_to_datetime', NULL),
(48, '2018_01_18_135000_change_posts_rename_columns', NULL),
(49, '2018_01_18_135100_change_posts_add_foreign_keys', NULL),
(50, '2018_01_30_112238_add_fulltext_index_to_discussions_title', NULL),
(51, '2018_01_30_220100_create_post_user_table', NULL),
(52, '2018_01_30_222900_change_users_rename_columns', NULL),
(55, '2018_09_15_041340_add_users_indicies', NULL),
(56, '2018_09_15_041828_add_discussions_indicies', NULL),
(57, '2018_09_15_043337_add_notifications_indices', NULL),
(58, '2018_09_15_043621_add_posts_indices', NULL),
(59, '2018_09_22_004100_change_registration_tokens_columns', NULL),
(60, '2018_09_22_004200_create_login_providers_table', NULL),
(61, '2018_10_08_144700_add_shim_prefix_to_group_icons', NULL),
(62, '2019_10_12_195349_change_posts_add_discussion_foreign_key', NULL),
(63, '2020_03_19_134512_change_discussions_default_comment_count', NULL),
(64, '2020_04_21_130500_change_permission_groups_add_is_hidden', NULL),
(65, '2021_03_02_040000_change_access_tokens_add_type', NULL),
(66, '2021_03_02_040500_change_access_tokens_add_id', NULL),
(67, '2021_03_02_041000_change_access_tokens_add_title_ip_agent', NULL),
(68, '2021_04_18_040500_change_migrations_add_id_primary_key', NULL),
(69, '2021_04_18_145100_change_posts_content_column_to_mediumtext', NULL),
(70, '2018_07_21_000000_seed_default_groups', NULL),
(71, '2018_07_21_000100_seed_default_group_permissions', NULL),
(72, '2021_05_10_000000_rename_permissions', NULL),
(73, '2022_05_20_000000_add_timestamps_to_groups_table', NULL),
(74, '2022_05_20_000001_add_created_at_to_group_user_table', NULL),
(75, '2022_05_20_000002_add_created_at_to_group_permission_table', NULL),
(76, '2015_09_21_011527_add_is_approved_to_discussions', 'flarum-approval'),
(77, '2015_09_21_011706_add_is_approved_to_posts', 'flarum-approval'),
(78, '2017_07_22_000000_add_default_permissions', 'flarum-approval'),
(79, '2018_09_29_060444_replace_emoji_shorcuts_with_unicode', 'flarum-emoji'),
(80, '2015_09_02_000000_add_flags_read_time_to_users_table', 'flarum-flags'),
(81, '2015_09_02_000000_create_flags_table', 'flarum-flags'),
(82, '2017_07_22_000000_add_default_permissions', 'flarum-flags'),
(83, '2018_06_27_101500_change_flags_rename_time_to_created_at', 'flarum-flags'),
(84, '2018_06_27_101600_change_flags_add_foreign_keys', 'flarum-flags'),
(85, '2018_06_27_105100_change_users_rename_flags_read_time_to_read_flags_at', 'flarum-flags'),
(86, '2018_09_15_043621_add_flags_indices', 'flarum-flags'),
(87, '2019_10_22_000000_change_reason_text_col_type', 'flarum-flags'),
(88, '2015_05_11_000000_create_posts_likes_table', 'flarum-likes'),
(89, '2015_09_04_000000_add_default_like_permissions', 'flarum-likes'),
(90, '2018_06_27_100600_rename_posts_likes_to_post_likes', 'flarum-likes'),
(91, '2018_06_27_100700_change_post_likes_add_foreign_keys', 'flarum-likes'),
(92, '2021_05_10_094200_add_created_at_to_post_likes_table', 'flarum-likes'),
(93, '2015_02_24_000000_add_locked_to_discussions', 'flarum-lock'),
(94, '2017_07_22_000000_add_default_permissions', 'flarum-lock'),
(95, '2018_09_15_043621_add_discussions_indices', 'flarum-lock'),
(96, '2021_03_25_000000_default_settings', 'flarum-markdown'),
(97, '2015_05_11_000000_create_mentions_posts_table', 'flarum-mentions'),
(98, '2015_05_11_000000_create_mentions_users_table', 'flarum-mentions'),
(99, '2018_06_27_102000_rename_mentions_posts_to_post_mentions_post', 'flarum-mentions'),
(100, '2018_06_27_102100_rename_mentions_users_to_post_mentions_user', 'flarum-mentions'),
(101, '2018_06_27_102200_change_post_mentions_post_rename_mentions_id_to_mentions_post_id', 'flarum-mentions'),
(102, '2018_06_27_102300_change_post_mentions_post_add_foreign_keys', 'flarum-mentions'),
(103, '2018_06_27_102400_change_post_mentions_user_rename_mentions_id_to_mentions_user_id', 'flarum-mentions'),
(104, '2018_06_27_102500_change_post_mentions_user_add_foreign_keys', 'flarum-mentions'),
(105, '2021_04_19_000000_set_default_settings', 'flarum-mentions'),
(106, '2022_05_20_000005_add_created_at_to_post_mentions_post_table', 'flarum-mentions'),
(107, '2022_05_20_000006_add_created_at_to_post_mentions_user_table', 'flarum-mentions'),
(108, '2015_02_24_000000_add_sticky_to_discussions', 'flarum-sticky'),
(109, '2017_07_22_000000_add_default_permissions', 'flarum-sticky'),
(110, '2018_09_15_043621_add_discussions_indices', 'flarum-sticky'),
(111, '2021_01_13_000000_add_discussion_last_posted_at_indices', 'flarum-sticky'),
(112, '2015_05_11_000000_add_subscription_to_users_discussions_table', 'flarum-subscriptions'),
(113, '2015_05_11_000000_add_suspended_until_to_users_table', 'flarum-suspend'),
(114, '2015_09_14_000000_rename_suspended_until_column', 'flarum-suspend'),
(115, '2017_07_22_000000_add_default_permissions', 'flarum-suspend'),
(116, '2018_06_27_111400_change_users_rename_suspend_until_to_suspended_until', 'flarum-suspend'),
(117, '2021_10_27_000000_add_suspend_reason_and_message', 'flarum-suspend'),
(118, '2015_02_24_000000_create_discussions_tags_table', 'flarum-tags'),
(119, '2015_02_24_000000_create_tags_table', 'flarum-tags'),
(120, '2015_02_24_000000_create_users_tags_table', 'flarum-tags'),
(121, '2015_02_24_000000_set_default_settings', 'flarum-tags'),
(122, '2015_10_19_061223_make_slug_unique', 'flarum-tags'),
(123, '2017_07_22_000000_add_default_permissions', 'flarum-tags'),
(124, '2018_06_27_085200_change_tags_columns', 'flarum-tags'),
(125, '2018_06_27_085300_change_tags_add_foreign_keys', 'flarum-tags'),
(126, '2018_06_27_090400_rename_users_tags_to_tag_user', 'flarum-tags'),
(127, '2018_06_27_100100_change_tag_user_rename_read_time_to_marked_as_read_at', 'flarum-tags'),
(128, '2018_06_27_100200_change_tag_user_add_foreign_keys', 'flarum-tags'),
(129, '2018_06_27_103000_rename_discussions_tags_to_discussion_tag', 'flarum-tags'),
(130, '2018_06_27_103100_add_discussion_tag_foreign_keys', 'flarum-tags'),
(131, '2019_04_21_000000_add_icon_to_tags_table', 'flarum-tags'),
(132, '2022_05_20_000003_add_timestamps_to_tags_table', 'flarum-tags'),
(133, '2022_05_20_000004_add_created_at_to_discussion_tag_table', 'flarum-tags');

-- --------------------------------------------------------

--
-- Table structure for table `flio_notifications`
--

CREATE TABLE `flio_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `from_user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(10) UNSIGNED DEFAULT NULL,
  `data` blob,
  `created_at` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `read_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flio_password_tokens`
--

CREATE TABLE `flio_password_tokens` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flio_posts`
--

CREATE TABLE `flio_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `number` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci COMMENT ' ',
  `edited_at` datetime DEFAULT NULL,
  `edited_user_id` int(10) UNSIGNED DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flio_posts`
--

INSERT INTO `flio_posts` (`id`, `discussion_id`, `number`, `created_at`, `user_id`, `type`, `content`, `edited_at`, `edited_user_id`, `hidden_at`, `hidden_user_id`, `ip_address`, `is_private`, `is_approved`) VALUES
(5, 2, 1, '2022-09-16 01:21:36', 3, 'comment', '<t><p>I wish Caroline and Klaus had interacted more and started a cute family.</p> </t>', NULL, NULL, NULL, NULL, '105.160.44.222', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `flio_post_likes`
--

CREATE TABLE `flio_post_likes` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flio_post_mentions_post`
--

CREATE TABLE `flio_post_mentions_post` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_post_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flio_post_mentions_user`
--

CREATE TABLE `flio_post_mentions_user` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flio_post_user`
--

CREATE TABLE `flio_post_user` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flio_registration_tokens`
--

CREATE TABLE `flio_registration_tokens` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_attributes` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flio_settings`
--

CREATE TABLE `flio_settings` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flio_settings`
--

INSERT INTO `flio_settings` (`key`, `value`) VALUES
('allow_post_editing', 'reply'),
('allow_renaming', '10'),
('allow_sign_up', '1'),
('custom_footer', '<html>\n<head>\n<style>\nfooter {\n  text-align: center;\n  padding: 10px;\n  background-color: DarkSalmon;\n  color: white;\n}\n</style>\n</head>\n<body>\n\n<footer>\n  <p>SceneDebate 2022<br>\n  <a </a></p>\n</footer>\n\n</body>\n</html>\n'),
('custom_header', '\n<!DOCTYPE html>\n<html>\n  <head>\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n         <meta name=\"description\" content=\" Provide alternate views regarding  Movies, Series, Animation. \">\n  <meta name=\"keywords\" content=\" Movies, Series, Animation, TV shows \">\n  <meta property=\'og:title\' content=\'Alternate scenes or thoughts>\n<meta property=\'og:description\' content=\' Alternate scenes or thoughts />\n<meta property=\'og:url\' content=\'https://scenedebate.com\'/>\n<meta property=\"og:type\" content=\'website\'/>\n    <title> </title>\n  </head>\n\n</html>'),
('custom_less', ''),
('default_locale', 'en'),
('default_route', '/all'),
('display_name_driver', 'username'),
('extensions_enabled', '[\"flarum-flags\",\"flarum-tags\",\"flarum-suspend\",\"flarum-subscriptions\",\"flarum-sticky\",\"flarum-statistics\",\"flarum-mentions\",\"flarum-markdown\",\"flarum-lock\",\"flarum-likes\",\"flarum-lang-english\",\"flarum-emoji\",\"flarum-bbcode\",\"flarum-approval\"]'),
('favicon_path', 'favicon-ezarpjmv.png'),
('flarum-markdown.mdarea', '1'),
('flarum-mentions.allow_username_format', '1'),
('flarum-tags.max_primary_tags', '1'),
('flarum-tags.max_secondary_tags', '3'),
('flarum-tags.min_primary_tags', '1'),
('flarum-tags.min_secondary_tags', '0'),
('forum_description', 'SceneDebate'),
('forum_title', 'SceneDebate'),
('logo_path', 'logo-yunksnbf.png'),
('mail_driver', 'smtp'),
('mail_encryption', 'ssl'),
('mail_from', 'support@scenedebate.com'),
('mail_host', 'gra106.truehost.cloud'),
('mail_password', '0urp,Jt=J)E6'),
('mail_port', '465'),
('mail_username', 'support@scenedebate.com'),
('slug_driver_Flarum\\User\\User', 'default'),
('theme_colored_header', '0'),
('theme_dark_mode', '0'),
('theme_primary_color', '#0dc55c'),
('theme_secondary_color', '#FF00FF'),
('version', '1.4.0'),
('welcome_message', ' Write some posts and invite your friends. Have fun! > Be Polite and Civil'),
('welcome_title', 'Welcome to SceneDebate');

-- --------------------------------------------------------

--
-- Table structure for table `flio_tags`
--

CREATE TABLE `flio_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_mode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `default_sort` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `discussion_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_discussion_id` int(10) UNSIGNED DEFAULT NULL,
  `last_posted_user_id` int(10) UNSIGNED DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flio_tags`
--

INSERT INTO `flio_tags` (`id`, `name`, `slug`, `description`, `color`, `background_path`, `background_mode`, `position`, `parent_id`, `default_sort`, `is_restricted`, `is_hidden`, `discussion_count`, `last_posted_at`, `last_posted_discussion_id`, `last_posted_user_id`, `icon`, `created_at`, `updated_at`) VALUES
(2, 'Welcome', 'welcome', 'Introduce yourself. You can also tell us the films you like. ', '#48bf83', NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-13 19:48:28', '2022-09-16 01:12:28'),
(3, 'Action & Adventure', 'action-adventure', 'Share and Discuss alternate scenes or thoughts related to this genre. Please indicate the film\'s name in your title. ', '#ef564f', NULL, NULL, 2, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-13 19:48:49', '2022-09-16 01:33:25'),
(4, 'Romance ', 'romance', 'Share and Discuss alternate scenes or thoughts related to this genre. Please indicate the film\'s name in your title. ', '#4b93d1', NULL, NULL, 3, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-14 03:17:22', '2022-09-16 01:33:37'),
(6, 'Sci-fi & Fantasy', 'sci-fi-fantasy', 'Share and Discuss alternate scenes or thoughts  related to this genre. Please indicate the film\'s name in your title. ', '#088F8F', NULL, NULL, 4, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-14 03:18:12', '2022-09-16 01:33:51'),
(7, 'Animations', 'animations', 'Share and Discuss alternate scenes or thoughts related to this genre. Please indicate the film\'s name in your title. ', '#b59e8c', NULL, NULL, 5, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-14 03:18:23', '2022-09-16 01:37:52'),
(8, 'Horror', 'horror', 'Share and Discuss alternate scenes or thoughts related to this genre. Please indicate the film\'s name in your title. ', '#626c78', NULL, NULL, 6, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-14 03:19:28', '2022-09-16 01:34:05'),
(9, 'Dramas', 'dramas', 'Share and Discuss alternate scenes or thoughts related to this genre. Please indicate the film\'s name in your title. ', '#d68b4f', NULL, NULL, 7, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-14 03:19:41', '2022-09-16 01:34:13'),
(11, 'Comedies ', 'comedies', 'Share and Discuss alternate scenes or thoughts related to this genre. Please indicate the film\'s name in your title. ', '#a22581', NULL, NULL, 8, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-14 15:34:02', '2022-09-16 01:34:29'),
(12, 'Thrillers', 'thrillers', 'Share and Discuss alternate scenes or thoughts related to this genre. Please indicate the film\'s name in your title. ', '#414141', NULL, NULL, 9, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-14 15:34:14', '2022-09-16 01:34:43'),
(13, 'Supernatural', 'supernatural', 'Share and Discuss alternate scenes or thoughts related to this genre. Please indicate the film\'s name in your title. ', '#48bf83', NULL, NULL, 10, NULL, NULL, 0, 0, 1, '2022-09-16 01:21:36', 2, 3, '', '2022-09-14 15:34:24', '2022-09-16 01:34:59'),
(14, 'Documentaries', 'documentaries', 'Share and Discuss alternate scenes or thoughts related to this genre. Please indicate the film\'s name in your title. ', '#ef564f', NULL, NULL, 11, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-14 15:34:41', '2022-09-16 01:35:11'),
(15, 'Classicals', 'classicals', 'Share and Discuss alternate scenes or thoughts related to this genre. Please indicate the film\'s name in your title. ', '#4b93d1', NULL, NULL, 12, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-14 15:35:02', '2022-09-16 01:35:20'),
(16, 'TV Shows', 'tv-shows', 'Share and Discuss alternate scenes or thoughts related to this genre. Please indicate the film\'s name in your title. ', '#a22581', NULL, NULL, 13, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-14 15:35:50', '2022-09-16 01:35:28'),
(17, 'Sports', 'sports', 'Share and Discuss alternate scenes or thoughts related to this genre. Please indicate the film\'s name in your title. ', '#088F8F', NULL, NULL, 14, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-14 15:36:01', '2022-09-16 01:35:39'),
(18, 'Children & Family', 'children-family', 'Share and Discuss alternate scenes or thoughts related to this genre. Please indicate the film\'s name in your title. ', '#d68b4f', NULL, NULL, 15, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-14 15:36:18', '2022-09-16 01:35:47'),
(19, 'Musicals', 'musicals', 'Share and Discuss alternate scenes or thoughts related to this genre. Please indicate the film\'s name in your title. ', '#626c78', NULL, NULL, 16, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-14 15:36:24', '2022-09-16 01:36:37'),
(20, 'Others', 'others', 'Share and Discuss alternate scenes or thoughts related to other genres. Please indicate the film\'s name in your title. ', '#48bf83', NULL, NULL, 17, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2022-09-16 01:15:13', '2022-09-16 01:36:43');

-- --------------------------------------------------------

--
-- Table structure for table `flio_tag_user`
--

CREATE TABLE `flio_tag_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `marked_as_read_at` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flio_users`
--

CREATE TABLE `flio_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferences` blob,
  `joined_at` datetime DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `marked_all_as_read_at` datetime DEFAULT NULL,
  `read_notifications_at` datetime DEFAULT NULL,
  `discussion_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `read_flags_at` datetime DEFAULT NULL,
  `suspended_until` datetime DEFAULT NULL,
  `suspend_reason` text COLLATE utf8mb4_unicode_ci,
  `suspend_message` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flio_users`
--

INSERT INTO `flio_users` (`id`, `username`, `email`, `is_email_confirmed`, `password`, `avatar_url`, `preferences`, `joined_at`, `last_seen_at`, `marked_all_as_read_at`, `read_notifications_at`, `discussion_count`, `comment_count`, `read_flags_at`, `suspended_until`, `suspend_reason`, `suspend_message`) VALUES
(1, 'admin', 'admin@scenedebate.com', 1, '$2y$10$uR10rNg9Jitxz8t5L2QgB.it/gT8aOJT65MgZQKp7gonVC3ZdupI.', NULL, NULL, '2022-09-13 22:34:10', '2022-09-17 02:20:12', '2022-09-13 21:52:59', '2022-09-14 16:25:12', 1, 0, NULL, NULL, NULL, NULL),
(2, 'Ian', 'ianpilotstar@gmail.com', 0, '$2y$10$jFDAmR3As3tlwkzjhmjgq.Hblrqm0MJqTYgopWXiQa1MnyiWKag52', NULL, NULL, '2022-09-14 16:20:13', '2022-09-14 16:20:16', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(3, 'TripleJ', 'johnsonwanderi85@gmail.com', 1, '$2y$10$AJgBhu1jorA9t1DRyU9xxedYoAFq2olfcYe0lOVX7iHVNmK1AEExO', 'We5b7Lgwyxar1K2h.png', NULL, '2022-09-14 16:22:28', '2022-09-17 22:31:12', NULL, '2022-09-15 22:22:30', 1, 1, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flio_access_tokens`
--
ALTER TABLE `flio_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flio_access_tokens_token_unique` (`token`),
  ADD KEY `flio_access_tokens_user_id_foreign` (`user_id`),
  ADD KEY `flio_access_tokens_type_index` (`type`);

--
-- Indexes for table `flio_api_keys`
--
ALTER TABLE `flio_api_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flio_api_keys_key_unique` (`key`),
  ADD KEY `flio_api_keys_user_id_foreign` (`user_id`);

--
-- Indexes for table `flio_discussions`
--
ALTER TABLE `flio_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flio_discussions_hidden_user_id_foreign` (`hidden_user_id`),
  ADD KEY `flio_discussions_first_post_id_foreign` (`first_post_id`),
  ADD KEY `flio_discussions_last_post_id_foreign` (`last_post_id`),
  ADD KEY `flio_discussions_last_posted_at_index` (`last_posted_at`),
  ADD KEY `flio_discussions_last_posted_user_id_index` (`last_posted_user_id`),
  ADD KEY `flio_discussions_created_at_index` (`created_at`),
  ADD KEY `flio_discussions_user_id_index` (`user_id`),
  ADD KEY `flio_discussions_comment_count_index` (`comment_count`),
  ADD KEY `flio_discussions_participant_count_index` (`participant_count`),
  ADD KEY `flio_discussions_hidden_at_index` (`hidden_at`),
  ADD KEY `flio_discussions_is_locked_index` (`is_locked`),
  ADD KEY `flio_discussions_is_sticky_created_at_index` (`is_sticky`,`created_at`),
  ADD KEY `flio_discussions_is_sticky_last_posted_at_index` (`is_sticky`,`last_posted_at`);
ALTER TABLE `flio_discussions` ADD FULLTEXT KEY `title` (`title`);

--
-- Indexes for table `flio_discussion_tag`
--
ALTER TABLE `flio_discussion_tag`
  ADD PRIMARY KEY (`discussion_id`,`tag_id`),
  ADD KEY `flio_discussion_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `flio_discussion_user`
--
ALTER TABLE `flio_discussion_user`
  ADD PRIMARY KEY (`user_id`,`discussion_id`),
  ADD KEY `flio_discussion_user_discussion_id_foreign` (`discussion_id`);

--
-- Indexes for table `flio_email_tokens`
--
ALTER TABLE `flio_email_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `flio_email_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `flio_flags`
--
ALTER TABLE `flio_flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flio_flags_post_id_foreign` (`post_id`),
  ADD KEY `flio_flags_user_id_foreign` (`user_id`),
  ADD KEY `flio_flags_created_at_index` (`created_at`);

--
-- Indexes for table `flio_groups`
--
ALTER TABLE `flio_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flio_group_permission`
--
ALTER TABLE `flio_group_permission`
  ADD PRIMARY KEY (`group_id`,`permission`);

--
-- Indexes for table `flio_group_user`
--
ALTER TABLE `flio_group_user`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `flio_group_user_group_id_foreign` (`group_id`);

--
-- Indexes for table `flio_login_providers`
--
ALTER TABLE `flio_login_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flio_login_providers_provider_identifier_unique` (`provider`,`identifier`),
  ADD KEY `flio_login_providers_user_id_foreign` (`user_id`);

--
-- Indexes for table `flio_migrations`
--
ALTER TABLE `flio_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flio_notifications`
--
ALTER TABLE `flio_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flio_notifications_from_user_id_foreign` (`from_user_id`),
  ADD KEY `flio_notifications_user_id_index` (`user_id`);

--
-- Indexes for table `flio_password_tokens`
--
ALTER TABLE `flio_password_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `flio_password_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `flio_posts`
--
ALTER TABLE `flio_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flio_posts_discussion_id_number_unique` (`discussion_id`,`number`),
  ADD KEY `flio_posts_edited_user_id_foreign` (`edited_user_id`),
  ADD KEY `flio_posts_hidden_user_id_foreign` (`hidden_user_id`),
  ADD KEY `flio_posts_discussion_id_number_index` (`discussion_id`,`number`),
  ADD KEY `flio_posts_discussion_id_created_at_index` (`discussion_id`,`created_at`),
  ADD KEY `flio_posts_user_id_created_at_index` (`user_id`,`created_at`);
ALTER TABLE `flio_posts` ADD FULLTEXT KEY `content` (`content`);

--
-- Indexes for table `flio_post_likes`
--
ALTER TABLE `flio_post_likes`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `flio_post_likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `flio_post_mentions_post`
--
ALTER TABLE `flio_post_mentions_post`
  ADD PRIMARY KEY (`post_id`,`mentions_post_id`),
  ADD KEY `flio_post_mentions_post_mentions_post_id_foreign` (`mentions_post_id`);

--
-- Indexes for table `flio_post_mentions_user`
--
ALTER TABLE `flio_post_mentions_user`
  ADD PRIMARY KEY (`post_id`,`mentions_user_id`),
  ADD KEY `flio_post_mentions_user_mentions_user_id_foreign` (`mentions_user_id`);

--
-- Indexes for table `flio_post_user`
--
ALTER TABLE `flio_post_user`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `flio_post_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `flio_registration_tokens`
--
ALTER TABLE `flio_registration_tokens`
  ADD PRIMARY KEY (`token`);

--
-- Indexes for table `flio_settings`
--
ALTER TABLE `flio_settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `flio_tags`
--
ALTER TABLE `flio_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flio_tags_slug_unique` (`slug`),
  ADD KEY `flio_tags_parent_id_foreign` (`parent_id`),
  ADD KEY `flio_tags_last_posted_user_id_foreign` (`last_posted_user_id`),
  ADD KEY `flio_tags_last_posted_discussion_id_foreign` (`last_posted_discussion_id`);

--
-- Indexes for table `flio_tag_user`
--
ALTER TABLE `flio_tag_user`
  ADD PRIMARY KEY (`user_id`,`tag_id`),
  ADD KEY `flio_tag_user_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `flio_users`
--
ALTER TABLE `flio_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flio_users_username_unique` (`username`),
  ADD UNIQUE KEY `flio_users_email_unique` (`email`),
  ADD KEY `flio_users_joined_at_index` (`joined_at`),
  ADD KEY `flio_users_last_seen_at_index` (`last_seen_at`),
  ADD KEY `flio_users_discussion_count_index` (`discussion_count`),
  ADD KEY `flio_users_comment_count_index` (`comment_count`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flio_access_tokens`
--
ALTER TABLE `flio_access_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `flio_api_keys`
--
ALTER TABLE `flio_api_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flio_discussions`
--
ALTER TABLE `flio_discussions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flio_flags`
--
ALTER TABLE `flio_flags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flio_groups`
--
ALTER TABLE `flio_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `flio_login_providers`
--
ALTER TABLE `flio_login_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flio_migrations`
--
ALTER TABLE `flio_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `flio_notifications`
--
ALTER TABLE `flio_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flio_posts`
--
ALTER TABLE `flio_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `flio_tags`
--
ALTER TABLE `flio_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `flio_users`
--
ALTER TABLE `flio_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flio_access_tokens`
--
ALTER TABLE `flio_access_tokens`
  ADD CONSTRAINT `flio_access_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flio_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flio_api_keys`
--
ALTER TABLE `flio_api_keys`
  ADD CONSTRAINT `flio_api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flio_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flio_discussions`
--
ALTER TABLE `flio_discussions`
  ADD CONSTRAINT `flio_discussions_first_post_id_foreign` FOREIGN KEY (`first_post_id`) REFERENCES `flio_posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flio_discussions_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `flio_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flio_discussions_last_post_id_foreign` FOREIGN KEY (`last_post_id`) REFERENCES `flio_posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flio_discussions_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `flio_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flio_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flio_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `flio_discussion_tag`
--
ALTER TABLE `flio_discussion_tag`
  ADD CONSTRAINT `flio_discussion_tag_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `flio_discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flio_discussion_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `flio_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flio_discussion_user`
--
ALTER TABLE `flio_discussion_user`
  ADD CONSTRAINT `flio_discussion_user_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `flio_discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flio_discussion_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flio_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flio_email_tokens`
--
ALTER TABLE `flio_email_tokens`
  ADD CONSTRAINT `flio_email_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flio_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flio_flags`
--
ALTER TABLE `flio_flags`
  ADD CONSTRAINT `flio_flags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `flio_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flio_flags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flio_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flio_group_permission`
--
ALTER TABLE `flio_group_permission`
  ADD CONSTRAINT `flio_group_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `flio_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flio_group_user`
--
ALTER TABLE `flio_group_user`
  ADD CONSTRAINT `flio_group_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `flio_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flio_group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flio_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flio_login_providers`
--
ALTER TABLE `flio_login_providers`
  ADD CONSTRAINT `flio_login_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flio_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flio_notifications`
--
ALTER TABLE `flio_notifications`
  ADD CONSTRAINT `flio_notifications_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `flio_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flio_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flio_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flio_password_tokens`
--
ALTER TABLE `flio_password_tokens`
  ADD CONSTRAINT `flio_password_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flio_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flio_posts`
--
ALTER TABLE `flio_posts`
  ADD CONSTRAINT `flio_posts_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `flio_discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flio_posts_edited_user_id_foreign` FOREIGN KEY (`edited_user_id`) REFERENCES `flio_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flio_posts_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `flio_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flio_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flio_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `flio_post_likes`
--
ALTER TABLE `flio_post_likes`
  ADD CONSTRAINT `flio_post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `flio_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flio_post_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flio_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flio_post_mentions_post`
--
ALTER TABLE `flio_post_mentions_post`
  ADD CONSTRAINT `flio_post_mentions_post_mentions_post_id_foreign` FOREIGN KEY (`mentions_post_id`) REFERENCES `flio_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flio_post_mentions_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `flio_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flio_post_mentions_user`
--
ALTER TABLE `flio_post_mentions_user`
  ADD CONSTRAINT `flio_post_mentions_user_mentions_user_id_foreign` FOREIGN KEY (`mentions_user_id`) REFERENCES `flio_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flio_post_mentions_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `flio_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flio_post_user`
--
ALTER TABLE `flio_post_user`
  ADD CONSTRAINT `flio_post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `flio_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flio_post_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flio_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flio_tags`
--
ALTER TABLE `flio_tags`
  ADD CONSTRAINT `flio_tags_last_posted_discussion_id_foreign` FOREIGN KEY (`last_posted_discussion_id`) REFERENCES `flio_discussions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flio_tags_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `flio_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flio_tags_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `flio_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `flio_tag_user`
--
ALTER TABLE `flio_tag_user`
  ADD CONSTRAINT `flio_tag_user_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `flio_tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flio_tag_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flio_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
