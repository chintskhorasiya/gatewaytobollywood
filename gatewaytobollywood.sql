-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 18, 2017 at 10:38 AM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 5.6.31-6+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gatewaytobollywood`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2017-09-07 04:49:40', '2017-09-07 04:49:40', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_gateway_bollywood_fields`
--

CREATE TABLE `wp_gateway_bollywood_fields` (
  `id` int(11) NOT NULL,
  `fid` varchar(200) NOT NULL,
  `label` varchar(200) NOT NULL,
  `type` int(10) NOT NULL,
  `options` text,
  `required` int(3) NOT NULL DEFAULT '0',
  `tab` int(10) NOT NULL,
  `validation` int(3) NOT NULL DEFAULT '0',
  `active` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wp_gateway_bollywood_fields`
--

INSERT INTO `wp_gateway_bollywood_fields` (`id`, `fid`, `label`, `type`, `options`, `required`, `tab`, `validation`, `active`) VALUES
(1, 'age', 'Age', 1, 'null', 1, 1, 4, 1),
(2, 'complexion', 'Complexion', 1, 'null', 0, 1, 0, 1),
(3, 'eye_color', 'Eye Color', 1, 'null', 0, 1, 0, 1),
(4, 'hair_color', 'Hair Color', 1, 'null', 0, 1, 0, 1),
(5, 'bust_chest', 'Bust Chest', 1, 'null', 0, 1, 0, 1),
(6, 'height', 'Height', 1, 'null', 0, 1, 0, 1),
(7, 'hips', 'Hips', 1, 'null', 0, 1, 0, 1),
(8, 'waist', 'Waist', 1, 'null', 0, 1, 0, 1),
(9, 'weight', 'Weight', 1, 'null', 0, 1, 0, 1),
(10, 'ethnicity', 'Ethnicity', 1, 'null', 0, 1, 0, 1),
(11, 'languages', 'Languages', 4, '["English","Hindi","Gujarati","Tamil","Punjabi","Urdu","Marathi","Kannad","Malayalam"]', 1, 1, 0, 1),
(12, 'gender', 'Gender', 3, '["Male","Female"]', 1, 1, 0, 1),
(13, 'location', 'Location', 1, 'null', 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_gateway_bollywood_jobs`
--

CREATE TABLE `wp_gateway_bollywood_jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `job_image` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `gender` int(2) NOT NULL DEFAULT '0',
  `age_from` int(3) DEFAULT NULL,
  `age_to` int(3) DEFAULT NULL,
  `job_category` int(11) DEFAULT NULL,
  `job_type` int(11) DEFAULT NULL,
  `job_start_date` date DEFAULT NULL,
  `job_end_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `active` int(2) NOT NULL DEFAULT '0',
  `featured` int(2) NOT NULL DEFAULT '0',
  `date_added` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wp_gateway_bollywood_jobs`
--

INSERT INTO `wp_gateway_bollywood_jobs` (`id`, `title`, `description`, `job_image`, `user_id`, `gender`, `age_from`, `age_to`, `job_category`, `job_type`, `job_start_date`, `job_end_date`, `expiry_date`, `active`, `featured`, `date_added`) VALUES
(1, 'Looking for female actress', 'Looking for female actress...........................', '1505905525.png', 11, 2, 18, 25, 0, 0, '2017-10-01', '2017-11-30', '2017-09-30', 1, 0, '2017-09-19'),
(2, 'Looking for actor', 'Looking for actor..\r\nLooking for actor..\r\nLooking for actor..', NULL, 11, 1, 18, 25, 0, 0, NULL, NULL, NULL, 1, 0, '2017-09-20'),
(3, 'Looking for female actress', 'Looking for female actress..\r\nLooking for female actress..\r\nLooking for female actress..\r\nLooking for female actress..\r\nLooking for female actress. !', NULL, 11, 0, 16, 30, 87, 108, '2017-11-01', '2018-05-31', '2017-10-31', 1, 0, '2017-09-20'),
(4, 'Looking for director', 'Looking for director...Looking for director...Looking for director...Looking for director...Looking for director...Looking for director...Looking for director...Looking for director...Looking for director...Looking for director...', NULL, 11, 0, 0, 0, 90, 102, NULL, NULL, NULL, 0, 0, '2017-09-20'),
(7, 'Looking for female model.', 'female model for photoshoot !!', NULL, 11, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2017-09-18'),
(10, 'dfdsf', 'xzfsdfsf', NULL, 11, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2017-09-18'),
(11, 'sdfdsfsdfvxcv', 'sdfdsfsdf', NULL, 11, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2017-09-18'),
(12, 'Looking for dancer', 'dancer needed.', NULL, 12, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-23', 1, 0, '2017-09-18'),
(13, 'Looking for male model', 'male model', NULL, 12, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-27', 1, 0, '2017-09-18'),
(14, 'Looking for female dancer', 'Female dancer for 5 star restaurant for big event only', NULL, 12, 0, NULL, NULL, NULL, NULL, '2017-10-01', '2017-10-31', '2017-09-30', 1, 0, '2017-09-18'),
(16, 'Looking for female actor', 'female actress we wanted !!', NULL, 12, 2, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '2017-09-23', 1, 0, '2017-09-18'),
(17, 'Young dancer required', 'Young dancer required', NULL, 12, 0, 14, 20, NULL, NULL, NULL, NULL, NULL, 1, 0, '2017-09-19'),
(19, 'model job', 'model job', NULL, 12, 0, 0, 0, 87, 0, NULL, NULL, '2017-09-30', 1, 0, '2017-09-19'),
(20, 'job for particular male assitant director', 'job for particular male assitant director...job for particular male assitant director...job for particular male assitant director...job for particular male assitant director...job for particular male assitant director...', NULL, 12, 1, 25, 35, 127, 110, '2017-11-01', '2018-11-30', '2017-10-31', 1, 1, '2017-09-19'),
(21, 'Female model required for ramp walk', 'Female model required for ramp walk', '1505973504.png', 12, 2, 18, 25, 139, 106, NULL, NULL, '2017-11-30', 1, 0, '2017-09-19'),
(22, 'Child artist needed for TV serial', 'Child artist needed for TV serial', NULL, 12, 1, 5, 10, 41, 61, NULL, NULL, '2017-10-31', 1, 1, '2017-09-19'),
(23, 'Looking for assistant director', 'Looking for proffessional assistant director', NULL, 12, 0, 0, 0, 127, 110, NULL, NULL, NULL, 1, 1, '2017-09-20'),
(24, 'Looking for Music composer, Wanted for music album', 'Music composer wanted for music album..\r\nMusic composer wanted for music album..\r\nMusic composer wanted for music album..\r\nMusic composer wanted for music album..\r\nMusic composer wanted for music album !', '1505973153.png', 12, 1, 0, 0, 130, 100, NULL, NULL, '2017-10-31', 1, 1, '2017-09-20');

-- --------------------------------------------------------

--
-- Table structure for table `wp_gateway_bollywood_jobs_applicants`
--

CREATE TABLE `wp_gateway_bollywood_jobs_applicants` (
  `job_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wp_gateway_bollywood_jobs_applicants`
--

INSERT INTO `wp_gateway_bollywood_jobs_applicants` (`job_id`, `artist_id`) VALUES
(24, 3),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `wp_gateway_bollywood_profile_status`
--

CREATE TABLE `wp_gateway_bollywood_profile_status` (
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wp_gateway_bollywood_profile_status`
--

INSERT INTO `wp_gateway_bollywood_profile_status` (`user_id`, `status`) VALUES
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(23, 0),
(26, 0),
(1, 0),
(31, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://projects.seawindsolution.com/five/gatewaytobollywood/', 'yes'),
(2, 'home', 'http://projects.seawindsolution.com/five/gatewaytobollywood/', 'yes'),
(3, 'blogname', 'Gateway to Bollywood', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'chintan@seawindsolution.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:202:{s:11:"category/?$";s:28:"index.php?post_type=category";s:41:"category/feed/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?post_type=category&feed=$matches[1]";s:36:"category/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?post_type=category&feed=$matches[1]";s:28:"category/page/([0-9]{1,})/?$";s:46:"index.php?post_type=category&paged=$matches[1]";s:11:"interest/?$";s:28:"index.php?post_type=interest";s:41:"interest/feed/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?post_type=interest&feed=$matches[1]";s:36:"interest/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?post_type=interest&feed=$matches[1]";s:28:"interest/page/([0-9]{1,})/?$";s:46:"index.php?post_type=interest&paged=$matches[1]";s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:6:"upg/?$";s:23:"index.php?post_type=upg";s:36:"upg/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?post_type=upg&feed=$matches[1]";s:31:"upg/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?post_type=upg&feed=$matches[1]";s:23:"upg/page/([0-9]{1,})/?$";s:41:"index.php?post_type=upg&paged=$matches[1]";s:15:"^about/([^/]*)$";s:36:"index.php?user=$matches[1]&page_id=6";s:15:"testimonials/?$";s:31:"index.php?post_type=testimonial";s:45:"testimonials/feed/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?post_type=testimonial&feed=$matches[1]";s:40:"testimonials/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?post_type=testimonial&feed=$matches[1]";s:32:"testimonials/page/([0-9]{1,})/?$";s:49:"index.php?post_type=testimonial&paged=$matches[1]";s:36:"category/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:46:"category/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:66:"category/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"category/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"category/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:42:"category/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:25:"category/([^/]+)/embed/?$";s:41:"index.php?category=$matches[1]&embed=true";s:29:"category/([^/]+)/trackback/?$";s:35:"index.php?category=$matches[1]&tb=1";s:49:"category/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?category=$matches[1]&feed=$matches[2]";s:44:"category/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?category=$matches[1]&feed=$matches[2]";s:37:"category/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?category=$matches[1]&paged=$matches[2]";s:44:"category/([^/]+)/comment-page-([0-9]{1,})/?$";s:48:"index.php?category=$matches[1]&cpage=$matches[2]";s:33:"category/([^/]+)(?:/([0-9]+))?/?$";s:47:"index.php?category=$matches[1]&page=$matches[2]";s:25:"category/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:35:"category/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:55:"category/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"category/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"category/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:31:"category/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:36:"interest/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:46:"interest/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:66:"interest/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"interest/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"interest/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:42:"interest/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:25:"interest/([^/]+)/embed/?$";s:41:"index.php?interest=$matches[1]&embed=true";s:29:"interest/([^/]+)/trackback/?$";s:35:"index.php?interest=$matches[1]&tb=1";s:49:"interest/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?interest=$matches[1]&feed=$matches[2]";s:44:"interest/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?interest=$matches[1]&feed=$matches[2]";s:37:"interest/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?interest=$matches[1]&paged=$matches[2]";s:44:"interest/([^/]+)/comment-page-([0-9]{1,})/?$";s:48:"index.php?interest=$matches[1]&cpage=$matches[2]";s:33:"interest/([^/]+)(?:/([0-9]+))?/?$";s:47:"index.php?interest=$matches[1]&page=$matches[2]";s:25:"interest/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:35:"interest/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:55:"interest/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"interest/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"interest/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:31:"interest/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:50:"slideshow/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?slideshow=$matches[1]&feed=$matches[2]";s:45:"slideshow/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?slideshow=$matches[1]&feed=$matches[2]";s:26:"slideshow/([^/]+)/embed/?$";s:42:"index.php?slideshow=$matches[1]&embed=true";s:38:"slideshow/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?slideshow=$matches[1]&paged=$matches[2]";s:20:"slideshow/([^/]+)/?$";s:31:"index.php?slideshow=$matches[1]";s:33:"upg/.+?/.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"upg/.+?/.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:63:"upg/.+?/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"upg/.+?/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"upg/.+?/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:39:"upg/.+?/.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:24:"upg/(.+?)/(.+?)/embed/?$";s:57:"index.php?upg_cate=$matches[1]&upg=$matches[2]&embed=true";s:28:"upg/(.+?)/(.+?)/trackback/?$";s:51:"index.php?upg_cate=$matches[1]&upg=$matches[2]&tb=1";s:48:"upg/(.+?)/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:63:"index.php?upg_cate=$matches[1]&upg=$matches[2]&feed=$matches[3]";s:43:"upg/(.+?)/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:63:"index.php?upg_cate=$matches[1]&upg=$matches[2]&feed=$matches[3]";s:36:"upg/(.+?)/(.+?)/page/?([0-9]{1,})/?$";s:64:"index.php?upg_cate=$matches[1]&upg=$matches[2]&paged=$matches[3]";s:32:"upg/(.+?)/(.+?)(?:/([0-9]+))?/?$";s:63:"index.php?upg_cate=$matches[1]&upg=$matches[2]&page=$matches[3]";s:42:"upg/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?upg_cate=$matches[1]&feed=$matches[2]";s:37:"upg/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?upg_cate=$matches[1]&feed=$matches[2]";s:18:"upg/(.+?)/embed/?$";s:41:"index.php?upg_cate=$matches[1]&embed=true";s:30:"upg/(.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?upg_cate=$matches[1]&paged=$matches[2]";s:12:"upg/(.+?)/?$";s:30:"index.php?upg_cate=$matches[1]";s:48:"upg_tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?upg_tag=$matches[1]&feed=$matches[2]";s:43:"upg_tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?upg_tag=$matches[1]&feed=$matches[2]";s:24:"upg_tag/([^/]+)/embed/?$";s:40:"index.php?upg_tag=$matches[1]&embed=true";s:36:"upg_tag/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?upg_tag=$matches[1]&paged=$matches[2]";s:18:"upg_tag/([^/]+)/?$";s:29:"index.php?upg_tag=$matches[1]";s:40:"testimonials/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:50:"testimonials/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"testimonials/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"testimonials/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"testimonials/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:46:"testimonials/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:29:"testimonials/([^/]+)/embed/?$";s:44:"index.php?testimonial=$matches[1]&embed=true";s:33:"testimonials/([^/]+)/trackback/?$";s:38:"index.php?testimonial=$matches[1]&tb=1";s:53:"testimonials/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?testimonial=$matches[1]&feed=$matches[2]";s:48:"testimonials/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?testimonial=$matches[1]&feed=$matches[2]";s:41:"testimonials/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?testimonial=$matches[1]&paged=$matches[2]";s:48:"testimonials/([^/]+)/comment-page-([0-9]{1,})/?$";s:51:"index.php?testimonial=$matches[1]&cpage=$matches[2]";s:37:"testimonials/([^/]+)(?:/([0-9]+))?/?$";s:50:"index.php?testimonial=$matches[1]&page=$matches[2]";s:29:"testimonials/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:39:"testimonials/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:59:"testimonials/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"testimonials/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"testimonials/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:35:"testimonials/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:47:"testimonial_rotator/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"testimonial_rotator/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"testimonial_rotator/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"testimonial_rotator/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"testimonial_rotator/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"testimonial_rotator/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:36:"testimonial_rotator/([^/]+)/embed/?$";s:52:"index.php?testimonial_rotator=$matches[1]&embed=true";s:40:"testimonial_rotator/([^/]+)/trackback/?$";s:46:"index.php?testimonial_rotator=$matches[1]&tb=1";s:48:"testimonial_rotator/([^/]+)/page/?([0-9]{1,})/?$";s:59:"index.php?testimonial_rotator=$matches[1]&paged=$matches[2]";s:55:"testimonial_rotator/([^/]+)/comment-page-([0-9]{1,})/?$";s:59:"index.php?testimonial_rotator=$matches[1]&cpage=$matches[2]";s:44:"testimonial_rotator/([^/]+)(?:/([0-9]+))?/?$";s:58:"index.php?testimonial_rotator=$matches[1]&page=$matches[2]";s:36:"testimonial_rotator/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:46:"testimonial_rotator/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:66:"testimonial_rotator/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"testimonial_rotator/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"testimonial_rotator/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:42:"testimonial_rotator/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:61:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:8:{i:0;s:79:"contact-form-7-dynamic-text-extension/contact-form-7-dynamic-text-extension.php";i:1;s:36:"contact-form-7/wp-contact-form-7.php";i:2;s:26:"gateway-bollywood/init.php";i:3;s:38:"meteor-slides/meteor-slides-plugin.php";i:4;s:37:"new-user-approve/new-user-approve.php";i:5;s:43:"testimonial-rotator/testimonial-rotator.php";i:6;s:43:"visual-form-builder/visual-form-builder.php";i:7;s:17:"wp-upg/wp-upg.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:5:{i:0;s:102:"/home/projectsseawinds/public_html/five/gatewaytobollywood/wp-content/themes/twentythirteen/style1.css";i:2;s:112:"/home/projectsseawinds/public_html/five/gatewaytobollywood/wp-content/themes/twentythirteen/artist-jobs-list.php";i:3;s:101:"/home/projectsseawinds/public_html/five/gatewaytobollywood/wp-content/themes/twentythirteen/style.css";i:4;s:141:"/home/projectsseawinds/public_html/five/gatewaytobollywood/wp-content/plugins/contact-form-7-dynamic-mail-to/cf7-dynamic-mail-to-examples.php";i:5;s:132:"/home/projectsseawinds/public_html/five/gatewaytobollywood/wp-content/plugins/contact-form-7-dynamic-mail-to/cf7-dynamic-mail-to.php";}', 'no'),
(40, 'template', 'twentythirteen', 'yes'),
(41, 'stylesheet', 'twentythirteen', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:5:{i:1;a:0:{}i:2;a:4:{s:5:"title";s:0:"";s:4:"text";s:254:"<ul>\r\n						<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>\r\n\r\n<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>\r\n						<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>\r\n</ul> ";s:6:"filter";b:1;s:6:"visual";b:1;}i:3;a:4:{s:5:"title";s:0:"";s:4:"text";s:108:"<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/logo.png"/>";s:6:"filter";b:1;s:6:"visual";b:1;}i:4;a:4:{s:5:"title";s:0:"";s:4:"text";s:64:"Copyright &copy; 2017 Gateway to Bollywood. All Rights Reserved.";s:6:"filter";b:1;s:6:"visual";b:1;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:17:"wp-upg/wp-upg.php";s:8:"upg_drop";}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '38590', 'yes'),
(92, 'wp_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:6:"artist";a:2:{s:4:"name";s:6:"Artist";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:9:"recruiter";a:2:{s:4:"name";s:9:"Recruiter";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'fresh_site', '0', 'yes'),
(94, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:8:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:14:"banner-content";a:0:{}s:11:"footer-logo";a:1:{i:0;s:6:"text-3";}s:6:"social";a:1:{i:0;s:6:"text-2";}s:4:"copy";a:1:{i:0;s:6:"text-4";}s:13:"array_version";i:3;}', 'yes'),
(100, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'cron', 'a:4:{i:1508317405;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1508345381;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1508388608;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(109, 'theme_mods_twentyseventeen', 'a:2:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1504760820;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(126, 'can_compress_scripts', '1', 'no'),
(138, 'current_theme', 'Twenty Thirteen', 'yes'),
(139, 'theme_mods_gatewayofbollywood', 'a:4:{i:0;b:0;s:18:"custom_css_post_id";i:-1;s:18:"nav_menu_locations";a:2:{s:9:"main-menu";i:2;s:11:"footer-menu";i:3;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1504848670;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:18:"orphaned_widgets_1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(140, 'theme_switched', '', 'yes'),
(145, 'nav_menu_options', 'a:1:{s:8:"auto_add";a:0:{}}', 'yes'),
(153, 'recently_activated', 'a:0:{}', 'yes'),
(154, 'vfb_db_version', '2.9', 'yes'),
(155, 'widget_vfb_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(156, 'vfb_dashboard_widget_options', 'a:1:{s:28:"vfb_dashboard_recent_entries";a:1:{s:5:"items";i:5;}}', 'yes'),
(157, '_transient_timeout_plugin_slugs', '1506153836', 'no'),
(158, '_transient_plugin_slugs', 'a:13:{i:0;s:19:"akismet/akismet.php";i:1;s:36:"contact-form-7/wp-contact-form-7.php";i:2;s:79:"contact-form-7-dynamic-text-extension/contact-form-7-dynamic-text-extension.php";i:3;s:54:"contact-form-7-dynamic-mail-to/cf7-dynamic-mail-to.php";i:4;s:39:"gateway-bollywood/init.bkp.19092017.php";i:5;s:26:"gateway-bollywood/init.php";i:6;s:9:"hello.php";i:7;s:62:"contact-form-7-simple-hidden-field/cf7-simple-hidden-field.php";i:8;s:38:"meteor-slides/meteor-slides-plugin.php";i:9;s:37:"new-user-approve/new-user-approve.php";i:10;s:43:"testimonial-rotator/testimonial-rotator.php";i:11;s:17:"wp-upg/wp-upg.php";i:12;s:43:"visual-form-builder/visual-form-builder.php";}', 'no'),
(161, 'gateway_bollywood_options', 'a:5:{s:41:"gateway_bollywood_field_registration_page";s:2:"32";s:34:"gateway_bollywood_field_login_page";s:2:"34";s:36:"gateway_bollywood_field_profile_page";s:2:"36";s:44:"gateway_bollywood_field_profileinterest_page";s:2:"93";s:46:"gateway_bollywood_field_profileexperience_page";s:2:"95";}', 'yes'),
(166, 'WPLANG', '', 'yes'),
(173, '_site_transient_timeout_browser_be63ffd2582941bcc84345444f83e6de', '1505390112', 'no'),
(174, '_site_transient_browser_be63ffd2582941bcc84345444f83e6de', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"55.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(180, 'widget_testimonialrotatorwidget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(200, '_site_transient_timeout_wporg_theme_feature_list', '1504855740', 'no'),
(201, '_site_transient_wporg_theme_feature_list', 'a:3:{s:6:"Layout";a:7:{i:0;s:11:"grid-layout";i:1;s:10:"one-column";i:2;s:11:"two-columns";i:3;s:13:"three-columns";i:4;s:12:"four-columns";i:5;s:12:"left-sidebar";i:6;s:13:"right-sidebar";}s:8:"Features";a:20:{i:0;s:19:"accessibility-ready";i:1;s:10:"buddypress";i:2;s:17:"custom-background";i:3;s:13:"custom-colors";i:4;s:13:"custom-header";i:5;s:11:"custom-menu";i:6;s:12:"editor-style";i:7;s:21:"featured-image-header";i:8;s:15:"featured-images";i:9;s:15:"flexible-header";i:10;s:14:"footer-widgets";i:11;s:20:"front-page-post-form";i:12;s:19:"full-width-template";i:13;s:12:"microformats";i:14;s:12:"post-formats";i:15;s:20:"rtl-language-support";i:16;s:11:"sticky-post";i:17;s:13:"theme-options";i:18;s:17:"threaded-comments";i:19;s:17:"translation-ready";}s:7:"Subject";a:9:{i:0;s:4:"blog";i:1;s:10:"e-commerce";i:2;s:9:"education";i:3;s:13:"entertainment";i:4;s:14:"food-and-drink";i:5;s:7:"holiday";i:6;s:4:"news";i:7;s:11:"photography";i:8;s:9:"portfolio";}}', 'no'),
(203, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1508302911;s:7:"checked";a:5:{s:18:"gatewayofbollywood";s:3:"1.0";s:13:"twentyfifteen";s:3:"1.8";s:15:"twentyseventeen";s:3:"1.3";s:13:"twentysixteen";s:3:"1.3";s:14:"twentythirteen";s:3:"2.2";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'no'),
(213, 'meteorslides_options', 'a:7:{s:18:"slideshow_quantity";s:1:"5";s:12:"slide_height";s:3:"600";s:11:"slide_width";s:4:"1365";s:16:"transition_style";s:4:"fade";s:16:"transition_speed";s:1:"2";s:14:"slide_duration";s:1:"5";s:20:"slideshow_navigation";s:7:"navnone";}', 'yes'),
(214, 'widget_meteor-slides-widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(217, 'theme_mods_twentythirteen', 'a:4:{i:0;b:0;s:18:"nav_menu_locations";a:3:{s:9:"main-menu";i:2;s:11:"footer-menu";i:3;s:7:"primary";i:2;}s:18:"custom_css_post_id";i:-1;s:12:"header_image";s:13:"remove-header";}', 'yes'),
(222, 'category_children', 'a:0:{}', 'yes'),
(250, 'wpcf7', 'a:2:{s:7:"version";s:3:"4.9";s:13:"bulk_validate";a:4:{s:9:"timestamp";i:1504854486;s:7:"version";s:3:"4.9";s:11:"count_valid";i:1;s:13:"count_invalid";i:0;}}', 'yes'),
(294, '_site_transient_timeout_browser_f9694186c5800b9905943d3f44ede836', '1505579001', 'no'),
(295, '_site_transient_browser_f9694186c5800b9905943d3f44ede836', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"60.0.3112.113";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(296, '_site_transient_timeout_community-events-05847c67b222c95dd4255f34fb65fafb', '1505101160', 'no'),
(297, '_site_transient_community-events-05847c67b222c95dd4255f34fb65fafb', 'a:2:{s:8:"location";a:1:{s:2:"ip";s:12:"202.179.71.0";}s:6:"events";a:5:{i:0;a:7:{s:4:"type";s:6:"meetup";s:5:"title";s:32:"Meetup with a few Automatticians";s:3:"url";s:64:"https://www.meetup.com/Mumbai-WordPress-Meetup/events/243078710/";s:6:"meetup";s:23:"Mumbai WordPress Meetup";s:10:"meetup_url";s:47:"https://www.meetup.com/Mumbai-WordPress-Meetup/";s:4:"date";s:19:"2017-09-21 16:30:00";s:8:"location";a:4:{s:8:"location";s:13:"Mumbai, India";s:7:"country";s:2:"in";s:8:"latitude";d:19.15235500000000001818989403545856475830078125;s:9:"longitude";d:72.8557660000000026911948225460946559906005859375;}}i:1;a:7:{s:4:"type";s:6:"meetup";s:5:"title";s:27:"The Casual WordPress Meetup";s:3:"url";s:64:"https://www.meetup.com/Mumbai-WordPress-Meetup/events/241167323/";s:6:"meetup";s:23:"Mumbai WordPress Meetup";s:10:"meetup_url";s:47:"https://www.meetup.com/Mumbai-WordPress-Meetup/";s:4:"date";s:19:"2017-09-24 11:00:00";s:8:"location";a:4:{s:8:"location";s:13:"Mumbai, India";s:7:"country";s:2:"in";s:8:"latitude";d:19.069400999999999157807906158268451690673828125;s:9:"longitude";d:72.869675000000000864019966684281826019287109375;}}i:2;a:7:{s:4:"type";s:6:"meetup";s:5:"title";s:27:"The Casual WordPress Meetup";s:3:"url";s:64:"https://www.meetup.com/Mumbai-WordPress-Meetup/events/241167323/";s:6:"meetup";s:23:"Mumbai WordPress Meetup";s:10:"meetup_url";s:47:"https://www.meetup.com/Mumbai-WordPress-Meetup/";s:4:"date";s:19:"2017-09-24 11:00:00";s:8:"location";a:4:{s:8:"location";s:13:"Mumbai, India";s:7:"country";s:2:"in";s:8:"latitude";d:18.959999084473000863226843648590147495269775390625;s:9:"longitude";d:72.8199996948240055871792719699442386627197265625;}}i:3;a:7:{s:4:"type";s:6:"meetup";s:5:"title";s:41:"Global WordPress Translation Day - #GWTD3";s:3:"url";s:64:"https://www.meetup.com/Mumbai-WordPress-Meetup/events/242060171/";s:6:"meetup";s:23:"Mumbai WordPress Meetup";s:10:"meetup_url";s:47:"https://www.meetup.com/Mumbai-WordPress-Meetup/";s:4:"date";s:19:"2017-09-30 10:00:00";s:8:"location";a:4:{s:8:"location";s:13:"Mumbai, India";s:7:"country";s:2:"in";s:8:"latitude";d:19.155148000000000507725417264737188816070556640625;s:9:"longitude";d:72.8678589999999957171894493512809276580810546875;}}i:4;a:7:{s:4:"type";s:6:"meetup";s:5:"title";s:27:"The Casual WordPress Meetup";s:3:"url";s:64:"https://www.meetup.com/Mumbai-WordPress-Meetup/events/241143637/";s:6:"meetup";s:23:"Mumbai WordPress Meetup";s:10:"meetup_url";s:47:"https://www.meetup.com/Mumbai-WordPress-Meetup/";s:4:"date";s:19:"2017-10-29 11:00:00";s:8:"location";a:4:{s:8:"location";s:13:"Mumbai, India";s:7:"country";s:2:"in";s:8:"latitude";d:18.959999084473000863226843648590147495269775390625;s:9:"longitude";d:72.8199996948240055871792719699442386627197265625;}}}}', 'no'),
(347, 'upg_settings', 'a:57:{s:10:"guest_user";s:1:"1";s:9:"main_page";s:1:"6";s:24:"upg_textarea_shortcode_1";s:0:"";s:24:"upg_textarea_shortcode_2";s:0:"";s:7:"publish";s:1:"1";s:23:"upg_custom_field_type_1";s:3:"222";s:18:"upg_custom_field_1";s:7:"Field 1";s:23:"upg_custom_field_type_2";s:3:"222";s:18:"upg_custom_field_2";s:7:"Field 2";s:23:"upg_custom_field_type_3";s:3:"222";s:18:"upg_custom_field_3";s:7:"Field 3";s:23:"upg_custom_field_type_4";s:3:"222";s:18:"upg_custom_field_4";s:7:"Field 4";s:23:"upg_custom_field_type_5";s:3:"222";s:18:"upg_custom_field_5";s:7:"Field 5";s:13:"global_perrow";s:1:"3";s:14:"global_perpage";s:2:"15";s:12:"global_order";s:4:"date";s:13:"global_layout";s:4:"flat";s:12:"global_album";s:0:"";s:11:"global_page";s:3:"off";s:12:"global_popup";s:3:"off";s:12:"approve_show";s:1:"0";s:10:"post_types";a:1:{s:3:"upg";s:2:"on";}s:22:"sub_show_formshow_desp";s:1:"0";s:26:"primary_show_formshow_desp";s:1:"0";s:7:"archive";s:1:"0";s:23:"upg_custom_field_1_show";s:3:"off";s:29:"upg_custom_field_1_show_front";s:3:"off";s:23:"upg_custom_field_2_show";s:3:"off";s:29:"upg_custom_field_2_show_front";s:3:"off";s:23:"upg_custom_field_3_show";s:3:"off";s:29:"upg_custom_field_3_show_front";s:3:"off";s:23:"upg_custom_field_4_show";s:3:"off";s:29:"upg_custom_field_4_show_front";s:3:"off";s:23:"upg_custom_field_5_show";s:3:"off";s:29:"upg_custom_field_5_show_front";s:3:"off";s:18:"upg_custom_field_6";s:7:"Field 6";s:23:"upg_custom_field_6_show";s:3:"off";s:29:"upg_custom_field_6_show_front";s:3:"off";s:23:"upg_custom_field_type_6";s:4:"text";s:18:"upg_custom_field_7";s:7:"Field 7";s:23:"upg_custom_field_7_show";s:3:"off";s:29:"upg_custom_field_7_show_front";s:3:"off";s:23:"upg_custom_field_type_7";s:4:"text";s:18:"upg_custom_field_8";s:7:"Field 8";s:23:"upg_custom_field_8_show";s:3:"off";s:29:"upg_custom_field_8_show_front";s:3:"off";s:23:"upg_custom_field_type_8";s:4:"text";s:18:"upg_custom_field_9";s:7:"Field 9";s:23:"upg_custom_field_9_show";s:3:"off";s:29:"upg_custom_field_9_show_front";s:3:"off";s:23:"upg_custom_field_type_9";s:4:"text";s:19:"upg_custom_field_10";s:8:"Field 10";s:24:"upg_custom_field_10_show";s:3:"off";s:30:"upg_custom_field_10_show_front";s:3:"off";s:24:"upg_custom_field_type_10";s:4:"text";}', 'yes'),
(348, 'upg_plugin_version', '1.21', 'yes'),
(360, 'upg_cate_children', 'a:0:{}', 'yes'),
(449, '_site_transient_timeout_community-events-f0ea5837ef27519cabe620d92cb0cfdd', '1505425403', 'no'),
(450, '_site_transient_community-events-f0ea5837ef27519cabe620d92cb0cfdd', 'a:2:{s:8:"location";a:1:{s:2:"ip";s:13:"103.238.104.0";}s:6:"events";a:4:{i:0;a:7:{s:4:"type";s:6:"meetup";s:5:"title";s:45:"Join WordPress Workshop by Team of Automattic";s:3:"url";s:60:"https://www.meetup.com/ahmedabad-wp-meetup/events/243085385/";s:6:"meetup";s:26:"Ahmedabad WordPress Meetup";s:10:"meetup_url";s:43:"https://www.meetup.com/ahmedabad-wp-meetup/";s:4:"date";s:19:"2017-09-26 16:00:00";s:8:"location";a:4:{s:8:"location";s:16:"Ahmedabad, India";s:7:"country";s:2:"in";s:8:"latitude";d:23.030000686646001639701353269629180431365966796875;s:9:"longitude";d:72.580001831055000138803734444081783294677734375;}}i:1;a:7:{s:4:"type";s:6:"meetup";s:5:"title";s:41:"Global WordPress Translation Day - #GWTD3";s:3:"url";s:60:"https://www.meetup.com/ahmedabad-wp-meetup/events/243085274/";s:6:"meetup";s:26:"Ahmedabad WordPress Meetup";s:10:"meetup_url";s:43:"https://www.meetup.com/ahmedabad-wp-meetup/";s:4:"date";s:19:"2017-09-30 10:30:00";s:8:"location";a:4:{s:8:"location";s:20:"Ahmedabad, GJ, India";s:7:"country";s:2:"IN";s:8:"latitude";d:23.030000686646001639701353269629180431365966796875;s:9:"longitude";d:72.580001831055000138803734444081783294677734375;}}i:2;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:18:"WordCamp Ahmedabad";s:3:"url";s:35:"https://2017.ahmedabad.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2017-10-06 00:00:00";s:8:"location";a:4:{s:8:"location";s:25:"Ahmedabad, Gujarat, India";s:7:"country";s:2:"IN";s:8:"latitude";d:22.990007399999999648798620910383760929107666015625;s:9:"longitude";d:72.48789809999999533829395659267902374267578125;}}i:3;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:15:"WordCamp Nashik";s:3:"url";s:32:"https://2017.nashik.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2017-11-05 00:00:00";s:8:"location";a:4:{s:8:"location";s:26:"Nashik, Maharashtra, India";s:7:"country";s:2:"IN";s:8:"latitude";d:19.960004999999998887005858705379068851470947265625;s:9:"longitude";d:73.735803000000004203684511594474315643310546875;}}}}', 'no'),
(508, '_site_transient_timeout_browser_3b9e21bb3459878c4401030f3a814ba9', '1506430489', 'no'),
(509, '_site_transient_browser_3b9e21bb3459878c4401030f3a814ba9', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"60.0.3112.113";s:10:"update_url";s:29:"https://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(520, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.8.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.8.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.8.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.8.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.8.2";s:7:"version";s:5:"4.8.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.7";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1508302900;s:15:"version_checked";s:5:"4.8.2";s:12:"translations";a:0:{}}', 'no'),
(522, 'auto_core_update_notified', 'a:4:{s:4:"type";s:7:"success";s:5:"email";s:27:"chintan@seawindsolution.com";s:7:"version";s:5:"4.8.2";s:9:"timestamp";i:1505883369;}', 'no'),
(574, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1506078197', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(576, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'O:8:"stdClass":100:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";i:4378;}s:4:"post";a:3:{s:4:"name";s:4:"post";s:4:"slug";s:4:"post";s:5:"count";i:2503;}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";i:2375;}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";i:2311;}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";i:1833;}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";i:1604;}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";i:1593;}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";i:1440;}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";i:1357;}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";i:1353;}s:8:"facebook";a:3:{s:4:"name";s:8:"facebook";s:4:"slug";s:8:"facebook";s:5:"count";i:1345;}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";i:1280;}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";i:1273;}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";i:1136;}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";i:1057;}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";i:1050;}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";i:998;}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";i:945;}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";i:817;}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";i:815;}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";i:811;}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";i:774;}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";i:772;}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";i:670;}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";i:669;}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";i:664;}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";i:655;}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";i:647;}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";i:645;}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";i:637;}s:6:"slider";a:3:{s:4:"name";s:6:"slider";s:4:"slug";s:6:"slider";s:5:"count";i:625;}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";i:611;}s:9:"analytics";a:3:{s:4:"name";s:9:"analytics";s:4:"slug";s:9:"analytics";s:5:"count";i:596;}s:4:"ajax";a:3:{s:4:"name";s:4:"ajax";s:4:"slug";s:4:"ajax";s:5:"count";i:594;}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";i:589;}s:6:"search";a:3:{s:4:"name";s:6:"search";s:4:"slug";s:6:"search";s:5:"count";i:584;}s:10:"e-commerce";a:3:{s:4:"name";s:10:"e-commerce";s:4:"slug";s:10:"e-commerce";s:5:"count";i:577;}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";i:576;}s:4:"menu";a:3:{s:4:"name";s:4:"menu";s:4:"slug";s:4:"menu";s:5:"count";i:561;}s:4:"form";a:3:{s:4:"name";s:4:"form";s:4:"slug";s:4:"form";s:5:"count";i:557;}s:5:"embed";a:3:{s:4:"name";s:5:"embed";s:4:"slug";s:5:"embed";s:5:"count";i:543;}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";i:535;}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";i:525;}s:3:"css";a:3:{s:4:"name";s:3:"css";s:4:"slug";s:3:"css";s:5:"count";i:519;}s:5:"share";a:3:{s:4:"name";s:5:"share";s:4:"slug";s:5:"share";s:5:"count";i:505;}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";i:502;}s:7:"comment";a:3:{s:4:"name";s:7:"comment";s:4:"slug";s:7:"comment";s:5:"count";i:496;}s:5:"theme";a:3:{s:4:"name";s:5:"theme";s:4:"slug";s:5:"theme";s:5:"count";i:488;}s:9:"dashboard";a:3:{s:4:"name";s:9:"dashboard";s:4:"slug";s:9:"dashboard";s:5:"count";i:477;}s:6:"custom";a:3:{s:4:"name";s:6:"custom";s:4:"slug";s:6:"custom";s:5:"count";i:475;}s:10:"categories";a:3:{s:4:"name";s:10:"categories";s:4:"slug";s:10:"categories";s:5:"count";i:474;}s:10:"responsive";a:3:{s:4:"name";s:10:"responsive";s:4:"slug";s:10:"responsive";s:5:"count";i:470;}s:3:"ads";a:3:{s:4:"name";s:3:"ads";s:4:"slug";s:3:"ads";s:5:"count";i:449;}s:6:"editor";a:3:{s:4:"name";s:6:"editor";s:4:"slug";s:6:"editor";s:5:"count";i:447;}s:9:"affiliate";a:3:{s:4:"name";s:9:"affiliate";s:4:"slug";s:9:"affiliate";s:5:"count";i:442;}s:6:"button";a:3:{s:4:"name";s:6:"button";s:4:"slug";s:6:"button";s:5:"count";i:440;}s:4:"tags";a:3:{s:4:"name";s:4:"tags";s:4:"slug";s:4:"tags";s:5:"count";i:440;}s:12:"contact-form";a:3:{s:4:"name";s:12:"contact form";s:4:"slug";s:12:"contact-form";s:5:"count";i:436;}s:4:"user";a:3:{s:4:"name";s:4:"user";s:4:"slug";s:4:"user";s:5:"count";i:421;}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";i:417;}s:6:"mobile";a:3:{s:4:"name";s:6:"mobile";s:4:"slug";s:6:"mobile";s:5:"count";i:410;}s:5:"users";a:3:{s:4:"name";s:5:"users";s:4:"slug";s:5:"users";s:5:"count";i:407;}s:9:"slideshow";a:3:{s:4:"name";s:9:"slideshow";s:4:"slug";s:9:"slideshow";s:5:"count";i:405;}s:7:"contact";a:3:{s:4:"name";s:7:"contact";s:4:"slug";s:7:"contact";s:5:"count";i:405;}s:5:"stats";a:3:{s:4:"name";s:5:"stats";s:4:"slug";s:5:"stats";s:5:"count";i:401;}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";i:396;}s:3:"api";a:3:{s:4:"name";s:3:"api";s:4:"slug";s:3:"api";s:5:"count";i:386;}s:10:"statistics";a:3:{s:4:"name";s:10:"statistics";s:4:"slug";s:10:"statistics";s:5:"count";i:383;}s:6:"events";a:3:{s:4:"name";s:6:"events";s:4:"slug";s:6:"events";s:5:"count";i:381;}s:10:"navigation";a:3:{s:4:"name";s:10:"navigation";s:4:"slug";s:10:"navigation";s:5:"count";i:370;}s:4:"news";a:3:{s:4:"name";s:4:"news";s:4:"slug";s:4:"news";s:5:"count";i:353;}s:8:"calendar";a:3:{s:4:"name";s:8:"calendar";s:4:"slug";s:8:"calendar";s:5:"count";i:344;}s:7:"payment";a:3:{s:4:"name";s:7:"payment";s:4:"slug";s:7:"payment";s:5:"count";i:340;}s:9:"multisite";a:3:{s:4:"name";s:9:"multisite";s:4:"slug";s:9:"multisite";s:5:"count";i:332;}s:7:"plugins";a:3:{s:4:"name";s:7:"plugins";s:4:"slug";s:7:"plugins";s:5:"count";i:332;}s:10:"newsletter";a:3:{s:4:"name";s:10:"newsletter";s:4:"slug";s:10:"newsletter";s:5:"count";i:331;}s:12:"social-media";a:3:{s:4:"name";s:12:"social media";s:4:"slug";s:12:"social-media";s:5:"count";i:330;}s:10:"shortcodes";a:3:{s:4:"name";s:10:"shortcodes";s:4:"slug";s:10:"shortcodes";s:5:"count";i:330;}s:5:"popup";a:3:{s:4:"name";s:5:"popup";s:4:"slug";s:5:"popup";s:5:"count";i:327;}s:4:"code";a:3:{s:4:"name";s:4:"code";s:4:"slug";s:4:"code";s:5:"count";i:326;}s:4:"meta";a:3:{s:4:"name";s:4:"meta";s:4:"slug";s:4:"meta";s:5:"count";i:323;}s:4:"list";a:3:{s:4:"name";s:4:"list";s:4:"slug";s:4:"list";s:5:"count";i:321;}s:3:"url";a:3:{s:4:"name";s:3:"url";s:4:"slug";s:3:"url";s:5:"count";i:321;}s:9:"marketing";a:3:{s:4:"name";s:9:"marketing";s:4:"slug";s:9:"marketing";s:5:"count";i:313;}s:4:"chat";a:3:{s:4:"name";s:4:"chat";s:4:"slug";s:4:"chat";s:5:"count";i:302;}s:8:"redirect";a:3:{s:4:"name";s:8:"redirect";s:4:"slug";s:8:"redirect";s:5:"count";i:300;}s:6:"simple";a:3:{s:4:"name";s:6:"simple";s:4:"slug";s:6:"simple";s:5:"count";i:300;}s:16:"custom-post-type";a:3:{s:4:"name";s:16:"custom post type";s:4:"slug";s:16:"custom-post-type";s:5:"count";i:293;}s:15:"payment-gateway";a:3:{s:4:"name";s:15:"payment gateway";s:4:"slug";s:15:"payment-gateway";s:5:"count";i:293;}s:3:"tag";a:3:{s:4:"name";s:3:"tag";s:4:"slug";s:3:"tag";s:5:"count";i:292;}s:5:"forms";a:3:{s:4:"name";s:5:"forms";s:4:"slug";s:5:"forms";s:5:"count";i:287;}s:11:"advertising";a:3:{s:4:"name";s:11:"advertising";s:4:"slug";s:11:"advertising";s:5:"count";i:286;}s:7:"adsense";a:3:{s:4:"name";s:7:"adsense";s:4:"slug";s:7:"adsense";s:5:"count";i:284;}s:6:"author";a:3:{s:4:"name";s:6:"author";s:4:"slug";s:6:"author";s:5:"count";i:283;}s:4:"html";a:3:{s:4:"name";s:4:"html";s:4:"slug";s:4:"html";s:5:"count";i:279;}s:8:"lightbox";a:3:{s:4:"name";s:8:"lightbox";s:4:"slug";s:8:"lightbox";s:5:"count";i:277;}s:8:"tracking";a:3:{s:4:"name";s:8:"tracking";s:4:"slug";s:8:"tracking";s:5:"count";i:274;}s:12:"notification";a:3:{s:4:"name";s:12:"notification";s:4:"slug";s:12:"notification";s:5:"count";i:274;}s:7:"tinymce";a:3:{s:4:"name";s:7:"tinyMCE";s:4:"slug";s:7:"tinymce";s:5:"count";i:272;}s:7:"captcha";a:3:{s:4:"name";s:7:"captcha";s:4:"slug";s:7:"captcha";s:5:"count";i:271;}}', 'no'),
(579, '_transient_new_user_approve_user_statuses_count', 'a:3:{s:7:"pending";i:0;s:8:"approved";i:21;s:6:"denied";i:0;}', 'yes'),
(617, '_site_transient_timeout_browser_3d5f26438973a3d90b630a57c59a2f98', '1507033760', 'no'),
(618, '_site_transient_browser_3d5f26438973a3d90b630a57c59a2f98', 'a:9:{s:4:"name";s:6:"Chrome";s:7:"version";s:13:"60.0.3112.113";s:8:"platform";s:7:"Windows";s:10:"update_url";s:29:"https://www.google.com/chrome";s:7:"img_src";s:43:"http://s.w.org/images/browsers/chrome.png?1";s:11:"img_src_ssl";s:44:"https://s.w.org/images/browsers/chrome.png?1";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(632, '_site_transient_timeout_browser_61ca270fa8e907898f85b827d0370f2d', '1507090462', 'no'),
(633, '_site_transient_browser_61ca270fa8e907898f85b827d0370f2d', 'a:9:{s:4:"name";s:7:"Firefox";s:7:"version";s:4:"55.0";s:8:"platform";s:7:"Windows";s:10:"update_url";s:24:"https://www.firefox.com/";s:7:"img_src";s:44:"http://s.w.org/images/browsers/firefox.png?1";s:11:"img_src_ssl";s:45:"https://s.w.org/images/browsers/firefox.png?1";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(634, '_site_transient_timeout_community-events-1e60ae30ede73f7589087c566896ac9a', '1506528865', 'no'),
(635, '_site_transient_community-events-1e60ae30ede73f7589087c566896ac9a', 'a:2:{s:8:"location";a:1:{s:2:"ip";s:12:"43.242.116.0";}s:6:"events";a:5:{i:0;a:7:{s:4:"type";s:6:"meetup";s:5:"title";s:45:"Join WordPress Workshop by Team of Automattic";s:3:"url";s:60:"https://www.meetup.com/ahmedabad-wp-meetup/events/243085385/";s:6:"meetup";s:26:"Ahmedabad WordPress Meetup";s:10:"meetup_url";s:43:"https://www.meetup.com/ahmedabad-wp-meetup/";s:4:"date";s:19:"2017-09-26 16:00:00";s:8:"location";a:4:{s:8:"location";s:16:"Ahmedabad, India";s:7:"country";s:2:"in";s:8:"latitude";d:23.030000686646001639701353269629180431365966796875;s:9:"longitude";d:72.580001831055000138803734444081783294677734375;}}i:1;a:7:{s:4:"type";s:6:"meetup";s:5:"title";s:41:"Global WordPress Translation Day - #GWTD3";s:3:"url";s:60:"https://www.meetup.com/ahmedabad-wp-meetup/events/243085274/";s:6:"meetup";s:26:"Ahmedabad WordPress Meetup";s:10:"meetup_url";s:43:"https://www.meetup.com/ahmedabad-wp-meetup/";s:4:"date";s:19:"2017-09-30 10:30:00";s:8:"location";a:4:{s:8:"location";s:20:"Ahmedabad, GJ, India";s:7:"country";s:2:"IN";s:8:"latitude";d:23.030000686646001639701353269629180431365966796875;s:9:"longitude";d:72.580001831055000138803734444081783294677734375;}}i:2;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:18:"WordCamp Ahmedabad";s:3:"url";s:35:"https://2017.ahmedabad.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2017-10-06 00:00:00";s:8:"location";a:4:{s:8:"location";s:25:"Ahmedabad, Gujarat, India";s:7:"country";s:2:"IN";s:8:"latitude";d:22.990007399999999648798620910383760929107666015625;s:9:"longitude";d:72.48789809999999533829395659267902374267578125;}}i:3;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:15:"WordCamp Nashik";s:3:"url";s:32:"https://2017.nashik.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2017-11-05 00:00:00";s:8:"location";a:4:{s:8:"location";s:26:"Nashik, Maharashtra, India";s:7:"country";s:2:"IN";s:8:"latitude";d:19.960004999999998887005858705379068851470947265625;s:9:"longitude";d:73.735803000000004203684511594474315643310546875;}}i:4;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:16:"WordCamp Udaipur";s:3:"url";s:33:"https://2018.udaipur.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2018-01-27 00:00:00";s:8:"location";a:4:{s:8:"location";s:25:"Udaipur, Rajasthan, India";s:7:"country";s:2:"IN";s:8:"latitude";d:24.5759800000000012687451089732348918914794921875;s:9:"longitude";d:73.7452739999999948850017972290515899658203125;}}}}', 'no'),
(672, '_site_transient_timeout_browser_a8fa04da005937516d8bdfff00fdbe54', '1507195304', 'no'),
(673, '_site_transient_browser_a8fa04da005937516d8bdfff00fdbe54', 'a:10:{s:4:"name";s:6:"Chrome";s:7:"version";s:13:"61.0.3163.100";s:8:"platform";s:7:"Windows";s:10:"update_url";s:29:"https://www.google.com/chrome";s:7:"img_src";s:43:"http://s.w.org/images/browsers/chrome.png?1";s:11:"img_src_ssl";s:44:"https://s.w.org/images/browsers/chrome.png?1";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}', 'no'),
(708, '_site_transient_timeout_community-events-6b61b54b836b07d2f4cbc604a0a3dbf6', '1506712110', 'no'),
(709, '_site_transient_community-events-6b61b54b836b07d2f4cbc604a0a3dbf6', 'a:2:{s:8:"location";a:1:{s:2:"ip";s:13:"103.250.145.0";}s:6:"events";a:4:{i:0;a:7:{s:4:"type";s:6:"meetup";s:5:"title";s:41:"Global WordPress Translation Day - #GWTD3";s:3:"url";s:60:"https://www.meetup.com/ahmedabad-wp-meetup/events/243085274/";s:6:"meetup";s:26:"Ahmedabad WordPress Meetup";s:10:"meetup_url";s:43:"https://www.meetup.com/ahmedabad-wp-meetup/";s:4:"date";s:19:"2017-09-30 10:30:00";s:8:"location";a:4:{s:8:"location";s:20:"Ahmedabad, GJ, India";s:7:"country";s:2:"IN";s:8:"latitude";d:23.030000686646001639701353269629180431365966796875;s:9:"longitude";d:72.580001831055000138803734444081783294677734375;}}i:1;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:18:"WordCamp Ahmedabad";s:3:"url";s:35:"https://2017.ahmedabad.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2017-10-06 00:00:00";s:8:"location";a:4:{s:8:"location";s:25:"Ahmedabad, Gujarat, India";s:7:"country";s:2:"IN";s:8:"latitude";d:22.990007399999999648798620910383760929107666015625;s:9:"longitude";d:72.48789809999999533829395659267902374267578125;}}i:2;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:15:"WordCamp Nashik";s:3:"url";s:32:"https://2017.nashik.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2017-11-05 00:00:00";s:8:"location";a:4:{s:8:"location";s:26:"Nashik, Maharashtra, India";s:7:"country";s:2:"IN";s:8:"latitude";d:19.960004999999998887005858705379068851470947265625;s:9:"longitude";d:73.735803000000004203684511594474315643310546875;}}i:3;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:16:"WordCamp Udaipur";s:3:"url";s:33:"https://2018.udaipur.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2018-01-27 00:00:00";s:8:"location";a:4:{s:8:"location";s:25:"Udaipur, Rajasthan, India";s:7:"country";s:2:"IN";s:8:"latitude";d:24.5759800000000012687451089732348918914794921875;s:9:"longitude";d:73.7452739999999948850017972290515899658203125;}}}}', 'no'),
(732, '_site_transient_timeout_community-events-dd13d1a30c8c234a581200c00dedc72b', '1506788695', 'no'),
(733, '_site_transient_community-events-dd13d1a30c8c234a581200c00dedc72b', 'a:2:{s:8:"location";a:1:{s:2:"ip";s:12:"43.241.144.0";}s:6:"events";a:4:{i:0;a:7:{s:4:"type";s:6:"meetup";s:5:"title";s:41:"Global WordPress Translation Day - #GWTD3";s:3:"url";s:60:"https://www.meetup.com/ahmedabad-wp-meetup/events/243085274/";s:6:"meetup";s:26:"Ahmedabad WordPress Meetup";s:10:"meetup_url";s:43:"https://www.meetup.com/ahmedabad-wp-meetup/";s:4:"date";s:19:"2017-09-30 10:30:00";s:8:"location";a:4:{s:8:"location";s:16:"Ahmedabad, India";s:7:"country";s:2:"in";s:8:"latitude";d:23.030000686646001639701353269629180431365966796875;s:9:"longitude";d:72.580001831055000138803734444081783294677734375;}}i:1;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:18:"WordCamp Ahmedabad";s:3:"url";s:35:"https://2017.ahmedabad.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2017-10-06 00:00:00";s:8:"location";a:4:{s:8:"location";s:25:"Ahmedabad, Gujarat, India";s:7:"country";s:2:"IN";s:8:"latitude";d:22.990007399999999648798620910383760929107666015625;s:9:"longitude";d:72.48789809999999533829395659267902374267578125;}}i:2;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:15:"WordCamp Nashik";s:3:"url";s:32:"https://2017.nashik.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2017-11-05 00:00:00";s:8:"location";a:4:{s:8:"location";s:26:"Nashik, Maharashtra, India";s:7:"country";s:2:"IN";s:8:"latitude";d:19.960004999999998887005858705379068851470947265625;s:9:"longitude";d:73.735803000000004203684511594474315643310546875;}}i:3;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:16:"WordCamp Udaipur";s:3:"url";s:33:"https://2018.udaipur.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2018-01-27 00:00:00";s:8:"location";a:4:{s:8:"location";s:25:"Udaipur, Rajasthan, India";s:7:"country";s:2:"IN";s:8:"latitude";d:24.5759800000000012687451089732348918914794921875;s:9:"longitude";d:73.7452739999999948850017972290515899658203125;}}}}', 'no'),
(757, '_site_transient_timeout_community-events-bf0d9f90c85784dec07f52619c6962ba', '1506966213', 'no'),
(758, '_site_transient_community-events-bf0d9f90c85784dec07f52619c6962ba', 'a:2:{s:8:"location";a:1:{s:2:"ip";s:13:"103.238.106.0";}s:6:"events";a:3:{i:0;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:18:"WordCamp Ahmedabad";s:3:"url";s:35:"https://2017.ahmedabad.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2017-10-06 00:00:00";s:8:"location";a:4:{s:8:"location";s:25:"Ahmedabad, Gujarat, India";s:7:"country";s:2:"IN";s:8:"latitude";d:22.990007399999999648798620910383760929107666015625;s:9:"longitude";d:72.48789809999999533829395659267902374267578125;}}i:1;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:15:"WordCamp Nashik";s:3:"url";s:32:"https://2017.nashik.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2017-11-05 00:00:00";s:8:"location";a:4:{s:8:"location";s:26:"Nashik, Maharashtra, India";s:7:"country";s:2:"IN";s:8:"latitude";d:19.960004999999998887005858705379068851470947265625;s:9:"longitude";d:73.735803000000004203684511594474315643310546875;}}i:2;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:16:"WordCamp Udaipur";s:3:"url";s:33:"https://2018.udaipur.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2018-01-27 00:00:00";s:8:"location";a:4:{s:8:"location";s:25:"Udaipur, Rajasthan, India";s:7:"country";s:2:"IN";s:8:"latitude";d:24.5759800000000012687451089732348918914794921875;s:9:"longitude";d:73.7452739999999948850017972290515899658203125;}}}}', 'no'),
(779, '_site_transient_timeout_browser_b0e14a603fb7485782db9b8afe25c280', '1508324980', 'no'),
(780, '_site_transient_browser_b0e14a603fb7485782db9b8afe25c280', 'a:10:{s:4:"name";s:7:"Firefox";s:7:"version";s:4:"56.0";s:8:"platform";s:5:"Linux";s:10:"update_url";s:24:"https://www.firefox.com/";s:7:"img_src";s:44:"http://s.w.org/images/browsers/firefox.png?1";s:11:"img_src_ssl";s:45:"https://s.w.org/images/browsers/firefox.png?1";s:15:"current_version";s:2:"56";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}', 'no'),
(781, '_site_transient_timeout_community-events-1aecf33ab8525ff212ebdffbb438372e', '1507763389', 'no'),
(782, '_site_transient_community-events-1aecf33ab8525ff212ebdffbb438372e', 'a:2:{s:8:"location";a:1:{s:2:"ip";s:9:"127.0.0.0";}s:6:"events";a:2:{i:0;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:15:"WordCamp Nashik";s:3:"url";s:32:"https://2017.nashik.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2017-11-05 00:00:00";s:8:"location";a:4:{s:8:"location";s:26:"Nashik, Maharashtra, India";s:7:"country";s:2:"IN";s:8:"latitude";d:19.960004999999999;s:9:"longitude";d:73.735803000000004;}}i:1;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:16:"WordCamp Udaipur";s:3:"url";s:33:"https://2018.udaipur.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2018-01-27 00:00:00";s:8:"location";a:4:{s:8:"location";s:25:"Udaipur, Rajasthan, India";s:7:"country";s:2:"IN";s:8:"latitude";d:24.575980000000001;s:9:"longitude";d:73.745273999999995;}}}}', 'no'),
(793, '_site_transient_timeout_available_translations', '1507731021', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(794, '_site_transient_available_translations', 'a:110:{s:2:"af";a:8:{s:8:"language";s:2:"af";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-02 13:13:49";s:12:"english_name";s:9:"Afrikaans";s:11:"native_name";s:9:"Afrikaans";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/af.zip";s:3:"iso";a:2:{i:1;s:2:"af";i:2;s:3:"afr";}s:7:"strings";a:1:{s:8:"continue";s:10:"Gaan voort";}}s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-29 08:49:40";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:3:"ary";a:8:{s:8:"language";s:3:"ary";s:7:"version";s:5:"4.7.6";s:7:"updated";s:19:"2017-01-26 15:42:35";s:12:"english_name";s:15:"Moroccan Arabic";s:11:"native_name";s:31:"العربية المغربية";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.6/ary.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:3;s:3:"ary";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"as";a:8:{s:8:"language";s:2:"as";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-22 18:59:07";s:12:"english_name";s:8:"Assamese";s:11:"native_name";s:21:"অসমীয়া";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/as.zip";s:3:"iso";a:3:{i:1;s:2:"as";i:2;s:3:"asm";i:3;s:3:"asm";}s:7:"strings";a:1:{s:8:"continue";s:0:"";}}s:3:"azb";a:8:{s:8:"language";s:3:"azb";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-09-12 20:34:31";s:12:"english_name";s:17:"South Azerbaijani";s:11:"native_name";s:29:"گؤنئی آذربایجان";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/azb.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:3;s:3:"azb";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-06 00:09:27";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:3:"bel";a:8:{s:8:"language";s:3:"bel";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-26 18:50:50";s:12:"english_name";s:10:"Belarusian";s:11:"native_name";s:29:"Беларуская мова";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.8.2/bel.zip";s:3:"iso";a:2:{i:1;s:2:"be";i:2;s:3:"bel";}s:7:"strings";a:1:{s:8:"continue";s:20:"Працягнуць";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-08-09 09:24:45";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bn_BD";a:8:{s:8:"language";s:5:"bn_BD";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-01 12:57:10";s:12:"english_name";s:7:"Bengali";s:11:"native_name";s:15:"বাংলা";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/bn_BD.zip";s:3:"iso";a:1:{i:1;s:2:"bn";}s:7:"strings";a:1:{s:8:"continue";s:23:"এগিয়ে চল.";}}s:2:"bo";a:8:{s:8:"language";s:2:"bo";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-09-05 09:44:12";s:12:"english_name";s:7:"Tibetan";s:11:"native_name";s:21:"བོད་ཡིག";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/bo.zip";s:3:"iso";a:2:{i:1;s:2:"bo";i:2;s:3:"tib";}s:7:"strings";a:1:{s:8:"continue";s:24:"མུ་མཐུད།";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-09-04 20:20:28";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-08-08 21:01:45";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:3:"ceb";a:8:{s:8:"language";s:3:"ceb";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-03-02 17:25:51";s:12:"english_name";s:7:"Cebuano";s:11:"native_name";s:7:"Cebuano";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip";s:3:"iso";a:2:{i:2;s:3:"ceb";i:3;s:3:"ceb";}s:7:"strings";a:1:{s:8:"continue";s:7:"Padayun";}}s:5:"cs_CZ";a:8:{s:8:"language";s:5:"cs_CZ";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-12 08:46:26";s:12:"english_name";s:5:"Czech";s:11:"native_name";s:12:"Čeština‎";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/cs_CZ.zip";s:3:"iso";a:2:{i:1;s:2:"cs";i:2;s:3:"ces";}s:7:"strings";a:1:{s:8:"continue";s:11:"Pokračovat";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-19 16:27:32";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-03 23:25:51";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:14:"de_CH_informal";a:8:{s:8:"language";s:14:"de_CH_informal";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-09 11:53:31";s:12:"english_name";s:30:"German (Switzerland, Informal)";s:11:"native_name";s:21:"Deutsch (Schweiz, Du)";s:7:"package";s:73:"https://downloads.wordpress.org/translation/core/4.8.2/de_CH_informal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:6:"Weiter";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-01 18:14:59";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:12:"de_DE_formal";a:8:{s:8:"language";s:12:"de_DE_formal";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-01 18:14:36";s:12:"english_name";s:15:"German (Formal)";s:11:"native_name";s:13:"Deutsch (Sie)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/4.8.2/de_DE_formal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-09 11:51:58";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:3:"dzo";a:8:{s:8:"language";s:3:"dzo";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-06-29 08:59:03";s:12:"english_name";s:8:"Dzongkha";s:11:"native_name";s:18:"རྫོང་ཁ";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip";s:3:"iso";a:2:{i:1;s:2:"dz";i:2;s:3:"dzo";}s:7:"strings";a:1:{s:8:"continue";s:0:"";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-10 19:51:38";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_NZ";a:8:{s:8:"language";s:5:"en_NZ";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-08-02 03:57:05";s:12:"english_name";s:21:"English (New Zealand)";s:11:"native_name";s:21:"English (New Zealand)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/en_NZ.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-08 11:31:20";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_ZA";a:8:{s:8:"language";s:5:"en_ZA";s:7:"version";s:5:"4.7.6";s:7:"updated";s:19:"2017-01-26 15:53:43";s:12:"english_name";s:22:"English (South Africa)";s:11:"native_name";s:22:"English (South Africa)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.6/en_ZA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-25 19:47:01";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-25 10:03:08";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-26 10:38:53";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_VE";a:8:{s:8:"language";s:5:"es_VE";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-30 16:09:17";s:12:"english_name";s:19:"Spanish (Venezuela)";s:11:"native_name";s:21:"Español de Venezuela";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/es_VE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_AR";a:8:{s:8:"language";s:5:"es_AR";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-08-01 04:48:11";s:12:"english_name";s:19:"Spanish (Argentina)";s:11:"native_name";s:21:"Español de Argentina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/es_AR.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_GT";a:8:{s:8:"language";s:5:"es_GT";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-05 17:50:24";s:12:"english_name";s:19:"Spanish (Guatemala)";s:11:"native_name";s:21:"Español de Guatemala";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/es_GT.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-04 05:23:56";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/es_ES.zip";s:3:"iso";a:1:{i:1;s:2:"es";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CR";a:8:{s:8:"language";s:5:"es_CR";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-01 17:54:52";s:12:"english_name";s:20:"Spanish (Costa Rica)";s:11:"native_name";s:8:"Español";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/es_CR.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-31 15:12:02";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/es_MX.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-09-09 09:36:22";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/es_PE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-28 20:09:49";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/es_CL.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CO";a:8:{s:8:"language";s:5:"es_CO";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-08-13 17:00:30";s:12:"english_name";s:18:"Spanish (Colombia)";s:11:"native_name";s:20:"Español de Colombia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/es_CO.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"et";a:8:{s:8:"language";s:2:"et";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-27 16:37:11";s:12:"english_name";s:8:"Estonian";s:11:"native_name";s:5:"Eesti";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/et.zip";s:3:"iso";a:2:{i:1;s:2:"et";i:2;s:3:"est";}s:7:"strings";a:1:{s:8:"continue";s:6:"Jätka";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-19 12:08:05";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:3:"4.8";s:7:"updated";s:19:"2017-06-09 15:50:45";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.8/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-28 11:00:29";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_CA";a:8:{s:8:"language";s:5:"fr_CA";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-28 12:37:07";s:12:"english_name";s:15:"French (Canada)";s:11:"native_name";s:19:"Français du Canada";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/fr_CA.zip";s:3:"iso";a:2:{i:1;s:2:"fr";i:2;s:3:"fra";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-10 19:40:03";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:5:"fr_BE";a:8:{s:8:"language";s:5:"fr_BE";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-28 09:14:18";s:12:"english_name";s:16:"French (Belgium)";s:11:"native_name";s:21:"Français de Belgique";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/fr_BE.zip";s:3:"iso";a:2:{i:1;s:2:"fr";i:2;s:3:"fra";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-08-23 17:41:37";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-26 12:45:35";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"gu";a:8:{s:8:"language";s:2:"gu";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-08-31 06:54:10";s:12:"english_name";s:8:"Gujarati";s:11:"native_name";s:21:"ગુજરાતી";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/gu.zip";s:3:"iso";a:2:{i:1;s:2:"gu";i:2;s:3:"guj";}s:7:"strings";a:1:{s:8:"continue";s:31:"ચાલુ રાખવું";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-05 00:59:09";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.4.2/haz.zip";s:3:"iso";a:1:{i:3;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-12 21:37:24";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:5:"hi_IN";a:8:{s:8:"language";s:5:"hi_IN";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-28 10:29:26";s:12:"english_name";s:5:"Hindi";s:11:"native_name";s:18:"हिन्दी";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/hi_IN.zip";s:3:"iso";a:2:{i:1;s:2:"hi";i:2;s:3:"hin";}s:7:"strings";a:1:{s:8:"continue";s:12:"जारी";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-22 14:47:25";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-26 15:48:39";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:2:"hy";a:8:{s:8:"language";s:2:"hy";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-12-03 16:21:10";s:12:"english_name";s:8:"Armenian";s:11:"native_name";s:14:"Հայերեն";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip";s:3:"iso";a:2:{i:1;s:2:"hy";i:2;s:3:"hye";}s:7:"strings";a:1:{s:8:"continue";s:20:"Շարունակել";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-28 12:45:08";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"is_IS";a:8:{s:8:"language";s:5:"is_IS";s:7:"version";s:5:"4.7.6";s:7:"updated";s:19:"2017-04-13 13:55:54";s:12:"english_name";s:9:"Icelandic";s:11:"native_name";s:9:"Íslenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.6/is_IS.zip";s:3:"iso";a:2:{i:1;s:2:"is";i:2;s:3:"isl";}s:7:"strings";a:1:{s:8:"continue";s:6:"Áfram";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-30 11:12:28";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-09 07:51:37";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"ka_GE";a:8:{s:8:"language";s:5:"ka_GE";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-09 06:06:41";s:12:"english_name";s:8:"Georgian";s:11:"native_name";s:21:"ქართული";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/ka_GE.zip";s:3:"iso";a:2:{i:1;s:2:"ka";i:2;s:3:"kat";}s:7:"strings";a:1:{s:8:"continue";s:30:"გაგრძელება";}}s:3:"kab";a:8:{s:8:"language";s:3:"kab";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-08-22 15:33:00";s:12:"english_name";s:6:"Kabyle";s:11:"native_name";s:9:"Taqbaylit";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.8.2/kab.zip";s:3:"iso";a:2:{i:2;s:3:"kab";i:3;s:3:"kab";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"km";a:8:{s:8:"language";s:2:"km";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-12-07 02:07:59";s:12:"english_name";s:5:"Khmer";s:11:"native_name";s:27:"ភាសាខ្មែរ";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/km.zip";s:3:"iso";a:2:{i:1;s:2:"km";i:2;s:3:"khm";}s:7:"strings";a:1:{s:8:"continue";s:12:"បន្ត";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-28 10:48:16";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:3:"ckb";a:8:{s:8:"language";s:3:"ckb";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-26 15:48:25";s:12:"english_name";s:16:"Kurdish (Sorani)";s:11:"native_name";s:13:"كوردی‎";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/ckb.zip";s:3:"iso";a:2:{i:1;s:2:"ku";i:3;s:3:"ckb";}s:7:"strings";a:1:{s:8:"continue";s:30:"به‌رده‌وام به‌";}}s:2:"lo";a:8:{s:8:"language";s:2:"lo";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-12 09:59:23";s:12:"english_name";s:3:"Lao";s:11:"native_name";s:21:"ພາສາລາວ";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip";s:3:"iso";a:2:{i:1;s:2:"lo";i:2;s:3:"lao";}s:7:"strings";a:1:{s:8:"continue";s:9:"ຕໍ່";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-28 11:02:15";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:2:"lv";a:8:{s:8:"language";s:2:"lv";s:7:"version";s:5:"4.7.6";s:7:"updated";s:19:"2017-03-17 20:40:40";s:12:"english_name";s:7:"Latvian";s:11:"native_name";s:16:"Latviešu valoda";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.6/lv.zip";s:3:"iso";a:2:{i:1;s:2:"lv";i:2;s:3:"lav";}s:7:"strings";a:1:{s:8:"continue";s:9:"Turpināt";}}s:5:"mk_MK";a:8:{s:8:"language";s:5:"mk_MK";s:7:"version";s:5:"4.7.6";s:7:"updated";s:19:"2017-01-26 15:54:41";s:12:"english_name";s:10:"Macedonian";s:11:"native_name";s:31:"Македонски јазик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.6/mk_MK.zip";s:3:"iso";a:2:{i:1;s:2:"mk";i:2;s:3:"mkd";}s:7:"strings";a:1:{s:8:"continue";s:16:"Продолжи";}}s:5:"ml_IN";a:8:{s:8:"language";s:5:"ml_IN";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-27 03:43:32";s:12:"english_name";s:9:"Malayalam";s:11:"native_name";s:18:"മലയാളം";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/ml_IN.zip";s:3:"iso";a:2:{i:1;s:2:"ml";i:2;s:3:"mal";}s:7:"strings";a:1:{s:8:"continue";s:18:"തുടരുക";}}s:2:"mn";a:8:{s:8:"language";s:2:"mn";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-12 07:29:35";s:12:"english_name";s:9:"Mongolian";s:11:"native_name";s:12:"Монгол";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/mn.zip";s:3:"iso";a:2:{i:1;s:2:"mn";i:2;s:3:"mon";}s:7:"strings";a:1:{s:8:"continue";s:24:"Үргэлжлүүлэх";}}s:2:"mr";a:8:{s:8:"language";s:2:"mr";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-30 06:25:41";s:12:"english_name";s:7:"Marathi";s:11:"native_name";s:15:"मराठी";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/mr.zip";s:3:"iso";a:2:{i:1;s:2:"mr";i:2;s:3:"mar";}s:7:"strings";a:1:{s:8:"continue";s:25:"सुरु ठेवा";}}s:5:"ms_MY";a:8:{s:8:"language";s:5:"ms_MY";s:7:"version";s:5:"4.7.6";s:7:"updated";s:19:"2017-03-05 09:45:10";s:12:"english_name";s:5:"Malay";s:11:"native_name";s:13:"Bahasa Melayu";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.6/ms_MY.zip";s:3:"iso";a:2:{i:1;s:2:"ms";i:2;s:3:"msa";}s:7:"strings";a:1:{s:8:"continue";s:8:"Teruskan";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:6:"4.1.19";s:7:"updated";s:19:"2015-03-26 15:57:42";s:12:"english_name";s:17:"Myanmar (Burmese)";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.1.19/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-08-02 21:02:39";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"ne_NP";a:8:{s:8:"language";s:5:"ne_NP";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-31 08:47:10";s:12:"english_name";s:6:"Nepali";s:11:"native_name";s:18:"नेपाली";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/ne_NP.zip";s:3:"iso";a:2:{i:1;s:2:"ne";i:2;s:3:"nep";}s:7:"strings";a:1:{s:8:"continue";s:31:"जारीराख्नु ";}}s:12:"nl_NL_formal";a:8:{s:8:"language";s:12:"nl_NL_formal";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-08-30 07:58:32";s:12:"english_name";s:14:"Dutch (Formal)";s:11:"native_name";s:20:"Nederlands (Formeel)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/4.8.2/nl_NL_formal.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nl_BE";a:8:{s:8:"language";s:5:"nl_BE";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-02 15:25:12";s:12:"english_name";s:15:"Dutch (Belgium)";s:11:"native_name";s:20:"Nederlands (België)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/nl_BE.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-02 09:10:59";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nn_NO";a:8:{s:8:"language";s:5:"nn_NO";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-25 10:02:16";s:12:"english_name";s:19:"Norwegian (Nynorsk)";s:11:"native_name";s:13:"Norsk nynorsk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/nn_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nn";i:2;s:3:"nno";}s:7:"strings";a:1:{s:8:"continue";s:9:"Hald fram";}}s:3:"oci";a:8:{s:8:"language";s:3:"oci";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-08-25 10:03:08";s:12:"english_name";s:7:"Occitan";s:11:"native_name";s:7:"Occitan";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.8.2/oci.zip";s:3:"iso";a:2:{i:1;s:2:"oc";i:2;s:3:"oci";}s:7:"strings";a:1:{s:8:"continue";s:9:"Contunhar";}}s:5:"pa_IN";a:8:{s:8:"language";s:5:"pa_IN";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-16 05:19:43";s:12:"english_name";s:7:"Punjabi";s:11:"native_name";s:18:"ਪੰਜਾਬੀ";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip";s:3:"iso";a:2:{i:1;s:2:"pa";i:2;s:3:"pan";}s:7:"strings";a:1:{s:8:"continue";s:25:"ਜਾਰੀ ਰੱਖੋ";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-20 08:02:58";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:2:"ps";a:8:{s:8:"language";s:2:"ps";s:7:"version";s:6:"4.1.19";s:7:"updated";s:19:"2015-03-29 22:19:48";s:12:"english_name";s:6:"Pashto";s:11:"native_name";s:8:"پښتو";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1.19/ps.zip";s:3:"iso";a:2:{i:1;s:2:"ps";i:2;s:3:"pus";}s:7:"strings";a:1:{s:8:"continue";s:8:"دوام";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-30 17:15:54";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-09 15:37:59";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:10:"pt_PT_ao90";a:8:{s:8:"language";s:10:"pt_PT_ao90";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-29 08:57:23";s:12:"english_name";s:27:"Portuguese (Portugal, AO90)";s:11:"native_name";s:17:"Português (AO90)";s:7:"package";s:69:"https://downloads.wordpress.org/translation/core/4.8.2/pt_PT_ao90.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:3:"rhg";a:8:{s:8:"language";s:3:"rhg";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-03-16 13:03:18";s:12:"english_name";s:8:"Rohingya";s:11:"native_name";s:8:"Ruáinga";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip";s:3:"iso";a:1:{i:3;s:3:"rhg";}s:7:"strings";a:1:{s:8:"continue";s:0:"";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-09 20:13:14";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-23 11:17:01";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:3:"sah";a:8:{s:8:"language";s:3:"sah";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-21 02:06:41";s:12:"english_name";s:5:"Sakha";s:11:"native_name";s:14:"Сахалыы";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip";s:3:"iso";a:2:{i:2;s:3:"sah";i:3;s:3:"sah";}s:7:"strings";a:1:{s:8:"continue";s:12:"Салҕаа";}}s:5:"si_LK";a:8:{s:8:"language";s:5:"si_LK";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-12 06:00:52";s:12:"english_name";s:7:"Sinhala";s:11:"native_name";s:15:"සිංහල";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip";s:3:"iso";a:2:{i:1;s:2:"si";i:2;s:3:"sin";}s:7:"strings";a:1:{s:8:"continue";s:44:"දිගටම කරගෙන යන්න";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-30 08:21:26";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-12 12:51:50";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:10:"Nadaljujte";}}s:2:"sq";a:8:{s:8:"language";s:2:"sq";s:7:"version";s:5:"4.7.6";s:7:"updated";s:19:"2017-04-24 08:35:30";s:12:"english_name";s:8:"Albanian";s:11:"native_name";s:5:"Shqip";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.6/sq.zip";s:3:"iso";a:2:{i:1;s:2:"sq";i:2;s:3:"sqi";}s:7:"strings";a:1:{s:8:"continue";s:6:"Vazhdo";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-28 12:07:44";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-08 16:15:48";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:3:"szl";a:8:{s:8:"language";s:3:"szl";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-09-24 19:58:14";s:12:"english_name";s:8:"Silesian";s:11:"native_name";s:17:"Ślōnskŏ gŏdka";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip";s:3:"iso";a:1:{i:3;s:3:"szl";}s:7:"strings";a:1:{s:8:"continue";s:13:"Kōntynuować";}}s:5:"ta_IN";a:8:{s:8:"language";s:5:"ta_IN";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-27 03:22:47";s:12:"english_name";s:5:"Tamil";s:11:"native_name";s:15:"தமிழ்";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip";s:3:"iso";a:2:{i:1;s:2:"ta";i:2;s:3:"tam";}s:7:"strings";a:1:{s:8:"continue";s:24:"தொடரவும்";}}s:2:"te";a:8:{s:8:"language";s:2:"te";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-26 15:47:39";s:12:"english_name";s:6:"Telugu";s:11:"native_name";s:18:"తెలుగు";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/te.zip";s:3:"iso";a:2:{i:1;s:2:"te";i:2;s:3:"tel";}s:7:"strings";a:1:{s:8:"continue";s:30:"కొనసాగించు";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-07 02:08:56";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:2:"tl";a:8:{s:8:"language";s:2:"tl";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-12-30 02:38:08";s:12:"english_name";s:7:"Tagalog";s:11:"native_name";s:7:"Tagalog";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/tl.zip";s:3:"iso";a:2:{i:1;s:2:"tl";i:2;s:3:"tgl";}s:7:"strings";a:1:{s:8:"continue";s:10:"Magpatuloy";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-07-31 11:38:12";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"tt_RU";a:8:{s:8:"language";s:5:"tt_RU";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-20 20:20:50";s:12:"english_name";s:5:"Tatar";s:11:"native_name";s:19:"Татар теле";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip";s:3:"iso";a:2:{i:1;s:2:"tt";i:2;s:3:"tat";}s:7:"strings";a:1:{s:8:"continue";s:17:"дәвам итү";}}s:3:"tah";a:8:{s:8:"language";s:3:"tah";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-03-06 18:39:39";s:12:"english_name";s:8:"Tahitian";s:11:"native_name";s:10:"Reo Tahiti";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip";s:3:"iso";a:3:{i:1;s:2:"ty";i:2;s:3:"tah";i:3;s:3:"tah";}s:7:"strings";a:1:{s:8:"continue";s:0:"";}}s:5:"ug_CN";a:8:{s:8:"language";s:5:"ug_CN";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-12-05 09:23:39";s:12:"english_name";s:6:"Uighur";s:11:"native_name";s:9:"Uyƣurqə";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/ug_CN.zip";s:3:"iso";a:2:{i:1;s:2:"ug";i:2;s:3:"uig";}s:7:"strings";a:1:{s:8:"continue";s:26:"داۋاملاشتۇرۇش";}}s:2:"uk";a:8:{s:8:"language";s:2:"uk";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-19 19:56:39";s:12:"english_name";s:9:"Ukrainian";s:11:"native_name";s:20:"Українська";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/uk.zip";s:3:"iso";a:2:{i:1;s:2:"uk";i:2;s:3:"ukr";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продовжити";}}s:2:"ur";a:8:{s:8:"language";s:2:"ur";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-03 08:22:57";s:12:"english_name";s:4:"Urdu";s:11:"native_name";s:8:"اردو";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/ur.zip";s:3:"iso";a:2:{i:1;s:2:"ur";i:2;s:3:"urd";}s:7:"strings";a:1:{s:8:"continue";s:19:"جاری رکھیں";}}s:5:"uz_UZ";a:8:{s:8:"language";s:5:"uz_UZ";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-28 11:44:02";s:12:"english_name";s:5:"Uzbek";s:11:"native_name";s:11:"O‘zbekcha";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/uz_UZ.zip";s:3:"iso";a:2:{i:1;s:2:"uz";i:2;s:3:"uzb";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:2:"vi";a:8:{s:8:"language";s:2:"vi";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-10-03 09:08:47";s:12:"english_name";s:10:"Vietnamese";s:11:"native_name";s:14:"Tiếng Việt";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.2/vi.zip";s:3:"iso";a:2:{i:1;s:2:"vi";i:2;s:3:"vie";}s:7:"strings";a:1:{s:8:"continue";s:12:"Tiếp tục";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-12 11:35:05";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-08-04 07:53:05";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}s:5:"zh_HK";a:8:{s:8:"language";s:5:"zh_HK";s:7:"version";s:5:"4.8.2";s:7:"updated";s:19:"2017-09-27 14:50:31";s:12:"english_name";s:19:"Chinese (Hong Kong)";s:11:"native_name";s:16:"香港中文版	";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.2/zh_HK.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}}', 'no'),
(801, '_site_transient_timeout_browser_06fdd3e0f178ba6aec43dc3e36dea840', '1508410274', 'no'),
(802, '_site_transient_browser_06fdd3e0f178ba6aec43dc3e36dea840', 'a:10:{s:4:"name";s:6:"Chrome";s:7:"version";s:13:"61.0.3163.100";s:8:"platform";s:5:"Linux";s:10:"update_url";s:29:"https://www.google.com/chrome";s:7:"img_src";s:43:"http://s.w.org/images/browsers/chrome.png?1";s:11:"img_src_ssl";s:44:"https://s.w.org/images/browsers/chrome.png?1";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}', 'no'),
(803, '_transient_timeout_dash_v2_88ae138922fe95674369b1cb3d215a2b', '1507848712', 'no'),
(804, '_transient_dash_v2_88ae138922fe95674369b1cb3d215a2b', '<div class="rss-widget"><p><strong>RSS Error:</strong> WP HTTP Error: stream_socket_client(): unable to connect to ssl://wordpress.org:443 (Connection timed out)</p></div><div class="rss-widget"><p><strong>RSS Error:</strong> WP HTTP Error: stream_socket_client(): unable to connect to ssl://planet.wordpress.org:443 (Connection timed out)</p></div>', 'no'),
(805, '_transient_is_multi_author', '0', 'yes'),
(808, '_site_transient_timeout_theme_roots', '1508304705', 'no'),
(809, '_site_transient_theme_roots', 'a:5:{s:18:"gatewayofbollywood";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:15:"twentyseventeen";s:7:"/themes";s:13:"twentysixteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(810, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1508302909;s:8:"response";a:3:{s:19:"akismet/akismet.php";O:8:"stdClass":11:{s:2:"id";s:21:"w.org/plugins/akismet";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:3:"4.0";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:54:"https://downloads.wordpress.org/plugin/akismet.4.0.zip";s:5:"icons";a:3:{s:2:"1x";s:59:"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272";s:2:"2x";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";s:7:"default";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";}s:7:"banners";a:2:{s:2:"1x";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";s:7:"default";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";}s:11:"banners_rtl";a:0:{}s:6:"tested";s:5:"4.8.1";s:13:"compatibility";O:8:"stdClass":0:{}}s:17:"wp-upg/wp-upg.php";O:8:"stdClass":11:{s:2:"id";s:20:"w.org/plugins/wp-upg";s:4:"slug";s:6:"wp-upg";s:6:"plugin";s:17:"wp-upg/wp-upg.php";s:11:"new_version";s:4:"1.24";s:3:"url";s:37:"https://wordpress.org/plugins/wp-upg/";s:7:"package";s:49:"https://downloads.wordpress.org/plugin/wp-upg.zip";s:5:"icons";a:4:{s:2:"1x";s:59:"https://ps.w.org/wp-upg/assets/icon-128x128.jpg?rev=1424561";s:2:"2x";s:59:"https://ps.w.org/wp-upg/assets/icon-256x256.jpg?rev=1424561";s:0:"";s:57:"https://ps.w.org/wp-upg/assets/icon-80x80.jpg?rev=1429749";s:7:"default";s:59:"https://ps.w.org/wp-upg/assets/icon-256x256.jpg?rev=1424561";}s:7:"banners";a:2:{s:2:"1x";s:61:"https://ps.w.org/wp-upg/assets/banner-772x250.jpg?rev=1708244";s:7:"default";s:61:"https://ps.w.org/wp-upg/assets/banner-772x250.jpg?rev=1708244";}s:11:"banners_rtl";a:0:{}s:6:"tested";b:0;s:13:"compatibility";O:8:"stdClass":0:{}}s:43:"visual-form-builder/visual-form-builder.php";O:8:"stdClass":11:{s:2:"id";s:33:"w.org/plugins/visual-form-builder";s:4:"slug";s:19:"visual-form-builder";s:6:"plugin";s:43:"visual-form-builder/visual-form-builder.php";s:11:"new_version";s:5:"2.9.4";s:3:"url";s:50:"https://wordpress.org/plugins/visual-form-builder/";s:7:"package";s:68:"https://downloads.wordpress.org/plugin/visual-form-builder.2.9.4.zip";s:5:"icons";a:3:{s:2:"1x";s:72:"https://ps.w.org/visual-form-builder/assets/icon-128x128.png?rev=1205840";s:2:"2x";s:72:"https://ps.w.org/visual-form-builder/assets/icon-256x256.png?rev=1205840";s:7:"default";s:72:"https://ps.w.org/visual-form-builder/assets/icon-256x256.png?rev=1205840";}s:7:"banners";a:3:{s:2:"2x";s:75:"https://ps.w.org/visual-form-builder/assets/banner-1544x500.png?rev=1205840";s:2:"1x";s:74:"https://ps.w.org/visual-form-builder/assets/banner-772x250.png?rev=1205840";s:7:"default";s:75:"https://ps.w.org/visual-form-builder/assets/banner-1544x500.png?rev=1205840";}s:11:"banners_rtl";a:0:{}s:6:"tested";s:5:"4.8.2";s:13:"compatibility";O:8:"stdClass":0:{}}}s:12:"translations";a:0:{}s:9:"no_update";a:8:{s:36:"contact-form-7/wp-contact-form-7.php";O:8:"stdClass":9:{s:2:"id";s:28:"w.org/plugins/contact-form-7";s:4:"slug";s:14:"contact-form-7";s:6:"plugin";s:36:"contact-form-7/wp-contact-form-7.php";s:11:"new_version";s:3:"4.9";s:3:"url";s:45:"https://wordpress.org/plugins/contact-form-7/";s:7:"package";s:61:"https://downloads.wordpress.org/plugin/contact-form-7.4.9.zip";s:5:"icons";a:3:{s:2:"1x";s:66:"https://ps.w.org/contact-form-7/assets/icon-128x128.png?rev=984007";s:2:"2x";s:66:"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=984007";s:7:"default";s:66:"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=984007";}s:7:"banners";a:3:{s:2:"2x";s:69:"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901";s:2:"1x";s:68:"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427";s:7:"default";s:69:"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901";}s:11:"banners_rtl";a:0:{}}s:79:"contact-form-7-dynamic-text-extension/contact-form-7-dynamic-text-extension.php";O:8:"stdClass":9:{s:2:"id";s:51:"w.org/plugins/contact-form-7-dynamic-text-extension";s:4:"slug";s:37:"contact-form-7-dynamic-text-extension";s:6:"plugin";s:79:"contact-form-7-dynamic-text-extension/contact-form-7-dynamic-text-extension.php";s:11:"new_version";s:7:"2.0.2.1";s:3:"url";s:68:"https://wordpress.org/plugins/contact-form-7-dynamic-text-extension/";s:7:"package";s:88:"https://downloads.wordpress.org/plugin/contact-form-7-dynamic-text-extension.2.0.2.1.zip";s:5:"icons";a:0:{}s:7:"banners";a:0:{}s:11:"banners_rtl";a:0:{}}s:54:"contact-form-7-dynamic-mail-to/cf7-dynamic-mail-to.php";O:8:"stdClass":9:{s:2:"id";s:44:"w.org/plugins/contact-form-7-dynamic-mail-to";s:4:"slug";s:30:"contact-form-7-dynamic-mail-to";s:6:"plugin";s:54:"contact-form-7-dynamic-mail-to/cf7-dynamic-mail-to.php";s:11:"new_version";s:5:"1.0.0";s:3:"url";s:61:"https://wordpress.org/plugins/contact-form-7-dynamic-mail-to/";s:7:"package";s:79:"https://downloads.wordpress.org/plugin/contact-form-7-dynamic-mail-to.1.0.0.zip";s:5:"icons";a:0:{}s:7:"banners";a:0:{}s:11:"banners_rtl";a:0:{}}s:9:"hello.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/hello-dolly";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";s:5:"icons";a:3:{s:2:"1x";s:63:"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907";s:2:"2x";s:63:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907";s:7:"default";s:63:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907";}s:7:"banners";a:2:{s:2:"1x";s:65:"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342";s:7:"default";s:65:"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342";}s:11:"banners_rtl";a:0:{}}s:62:"contact-form-7-simple-hidden-field/cf7-simple-hidden-field.php";O:8:"stdClass":9:{s:2:"id";s:48:"w.org/plugins/contact-form-7-simple-hidden-field";s:4:"slug";s:34:"contact-form-7-simple-hidden-field";s:6:"plugin";s:62:"contact-form-7-simple-hidden-field/cf7-simple-hidden-field.php";s:11:"new_version";s:5:"2.0.2";s:3:"url";s:65:"https://wordpress.org/plugins/contact-form-7-simple-hidden-field/";s:7:"package";s:77:"https://downloads.wordpress.org/plugin/contact-form-7-simple-hidden-field.zip";s:5:"icons";a:0:{}s:7:"banners";a:0:{}s:11:"banners_rtl";a:0:{}}s:38:"meteor-slides/meteor-slides-plugin.php";O:8:"stdClass":9:{s:2:"id";s:27:"w.org/plugins/meteor-slides";s:4:"slug";s:13:"meteor-slides";s:6:"plugin";s:38:"meteor-slides/meteor-slides-plugin.php";s:11:"new_version";s:5:"1.5.6";s:3:"url";s:44:"https://wordpress.org/plugins/meteor-slides/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/meteor-slides.1.5.6.zip";s:5:"icons";a:2:{s:2:"1x";s:65:"https://ps.w.org/meteor-slides/assets/icon-128x128.jpg?rev=986808";s:7:"default";s:65:"https://ps.w.org/meteor-slides/assets/icon-128x128.jpg?rev=986808";}s:7:"banners";a:2:{s:2:"1x";s:67:"https://ps.w.org/meteor-slides/assets/banner-772x250.jpg?rev=986810";s:7:"default";s:67:"https://ps.w.org/meteor-slides/assets/banner-772x250.jpg?rev=986810";}s:11:"banners_rtl";a:0:{}}s:37:"new-user-approve/new-user-approve.php";O:8:"stdClass":9:{s:2:"id";s:30:"w.org/plugins/new-user-approve";s:4:"slug";s:16:"new-user-approve";s:6:"plugin";s:37:"new-user-approve/new-user-approve.php";s:11:"new_version";s:5:"1.7.5";s:3:"url";s:47:"https://wordpress.org/plugins/new-user-approve/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/new-user-approve.1.7.5.zip";s:5:"icons";a:0:{}s:7:"banners";a:2:{s:2:"1x";s:70:"https://ps.w.org/new-user-approve/assets/banner-772x250.png?rev=759723";s:7:"default";s:70:"https://ps.w.org/new-user-approve/assets/banner-772x250.png?rev=759723";}s:11:"banners_rtl";a:0:{}}s:43:"testimonial-rotator/testimonial-rotator.php";O:8:"stdClass":9:{s:2:"id";s:33:"w.org/plugins/testimonial-rotator";s:4:"slug";s:19:"testimonial-rotator";s:6:"plugin";s:43:"testimonial-rotator/testimonial-rotator.php";s:11:"new_version";s:7:"2.2.4.1";s:3:"url";s:50:"https://wordpress.org/plugins/testimonial-rotator/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/testimonial-rotator.zip";s:5:"icons";a:3:{s:2:"1x";s:71:"https://ps.w.org/testimonial-rotator/assets/icon-128x128.png?rev=970020";s:2:"2x";s:71:"https://ps.w.org/testimonial-rotator/assets/icon-256x256.png?rev=970020";s:7:"default";s:71:"https://ps.w.org/testimonial-rotator/assets/icon-256x256.png?rev=970020";}s:7:"banners";a:2:{s:2:"1x";s:74:"https://ps.w.org/testimonial-rotator/assets/banner-772x250.jpg?rev=1327060";s:7:"default";s:74:"https://ps.w.org/testimonial-rotator/assets/banner-772x250.jpg?rev=1327060";}s:11:"banners_rtl";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 5, '_menu_item_type', 'custom'),
(3, 5, '_menu_item_menu_item_parent', '0'),
(4, 5, '_menu_item_object_id', '5'),
(5, 5, '_menu_item_object', 'custom'),
(6, 5, '_menu_item_target', ''),
(7, 5, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(8, 5, '_menu_item_xfn', ''),
(9, 5, '_menu_item_url', 'http://projects.seawindsolution.com/five/gatewaytobollywood/'),
(12, 6, '_edit_last', '1'),
(13, 6, '_edit_lock', '1506930888:1'),
(14, 8, '_menu_item_type', 'post_type'),
(15, 8, '_menu_item_menu_item_parent', '0'),
(16, 8, '_menu_item_object_id', '6'),
(17, 8, '_menu_item_object', 'page'),
(18, 8, '_menu_item_target', ''),
(19, 8, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(20, 8, '_menu_item_xfn', ''),
(21, 8, '_menu_item_url', ''),
(41, 11, '_edit_last', '1'),
(42, 11, '_edit_lock', '1504855490:1'),
(43, 13, '_menu_item_type', 'post_type'),
(44, 13, '_menu_item_menu_item_parent', '0'),
(45, 13, '_menu_item_object_id', '11'),
(46, 13, '_menu_item_object', 'page'),
(47, 13, '_menu_item_target', ''),
(48, 13, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(49, 13, '_menu_item_xfn', ''),
(50, 13, '_menu_item_url', ''),
(52, 14, '_menu_item_type', 'post_type'),
(53, 14, '_menu_item_menu_item_parent', '0'),
(54, 14, '_menu_item_object_id', '6'),
(55, 14, '_menu_item_object', 'page'),
(56, 14, '_menu_item_target', ''),
(57, 14, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(58, 14, '_menu_item_xfn', ''),
(59, 14, '_menu_item_url', ''),
(60, 14, '_menu_item_orphaned', '1504776760'),
(61, 15, '_menu_item_type', 'post_type'),
(62, 15, '_menu_item_menu_item_parent', '0'),
(63, 15, '_menu_item_object_id', '11'),
(64, 15, '_menu_item_object', 'page'),
(65, 15, '_menu_item_target', ''),
(66, 15, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(67, 15, '_menu_item_xfn', ''),
(68, 15, '_menu_item_url', ''),
(69, 15, '_menu_item_orphaned', '1504776765'),
(70, 16, '_edit_last', '1'),
(71, 16, '_edit_lock', '1504855496:1'),
(72, 18, '_edit_last', '1'),
(73, 18, '_edit_lock', '1504855546:1'),
(74, 20, '_edit_last', '1'),
(75, 20, '_edit_lock', '1504855507:1'),
(76, 22, '_edit_last', '1'),
(77, 22, '_edit_lock', '1506679272:1'),
(78, 24, '_menu_item_type', 'post_type'),
(79, 24, '_menu_item_menu_item_parent', '0'),
(80, 24, '_menu_item_object_id', '6'),
(81, 24, '_menu_item_object', 'page'),
(82, 24, '_menu_item_target', ''),
(83, 24, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(84, 24, '_menu_item_xfn', ''),
(85, 24, '_menu_item_url', ''),
(87, 25, '_menu_item_type', 'post_type'),
(88, 25, '_menu_item_menu_item_parent', '0'),
(89, 25, '_menu_item_object_id', '16'),
(90, 25, '_menu_item_object', 'page'),
(91, 25, '_menu_item_target', ''),
(92, 25, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(93, 25, '_menu_item_xfn', ''),
(94, 25, '_menu_item_url', ''),
(96, 26, '_menu_item_type', 'post_type'),
(97, 26, '_menu_item_menu_item_parent', '0'),
(98, 26, '_menu_item_object_id', '22'),
(99, 26, '_menu_item_object', 'page'),
(100, 26, '_menu_item_target', ''),
(101, 26, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(102, 26, '_menu_item_xfn', ''),
(103, 26, '_menu_item_url', ''),
(105, 27, '_menu_item_type', 'post_type'),
(106, 27, '_menu_item_menu_item_parent', '0'),
(107, 27, '_menu_item_object_id', '20'),
(108, 27, '_menu_item_object', 'page'),
(109, 27, '_menu_item_target', ''),
(110, 27, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(111, 27, '_menu_item_xfn', ''),
(112, 27, '_menu_item_url', ''),
(114, 28, '_menu_item_type', 'post_type'),
(115, 28, '_menu_item_menu_item_parent', '0'),
(116, 28, '_menu_item_object_id', '18'),
(117, 28, '_menu_item_object', 'page'),
(118, 28, '_menu_item_target', ''),
(119, 28, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(120, 28, '_menu_item_xfn', ''),
(121, 28, '_menu_item_url', ''),
(123, 29, '_menu_item_type', 'post_type'),
(124, 29, '_menu_item_menu_item_parent', '0'),
(125, 29, '_menu_item_object_id', '11'),
(126, 29, '_menu_item_object', 'page'),
(127, 29, '_menu_item_target', ''),
(128, 29, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(129, 29, '_menu_item_xfn', ''),
(130, 29, '_menu_item_url', ''),
(134, 32, '_edit_last', '1'),
(135, 32, '_edit_lock', '1504779074:1'),
(136, 34, '_edit_last', '1'),
(137, 34, '_edit_lock', '1504779096:1'),
(138, 36, '_edit_last', '1'),
(139, 36, '_edit_lock', '1504779269:1'),
(140, 38, '_edit_last', '1'),
(141, 38, '_edit_lock', '1504788666:1'),
(142, 42, '_edit_last', '1'),
(143, 42, '_edit_lock', '1504790174:1'),
(144, 43, '_wp_attached_file', '2017/09/photo.jpg'),
(145, 43, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:17:"2017/09/photo.jpg";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"photo-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(146, 42, '_thumbnail_id', '43'),
(147, 42, '_rotator_id', ''),
(148, 42, '_rating', ''),
(149, 42, '_cite', ''),
(150, 44, '_edit_last', '1'),
(151, 44, '_edit_lock', '1504790719:1'),
(152, 44, '_thumbnail_id', '43'),
(153, 44, '_rotator_id', ''),
(154, 44, '_rating', ''),
(155, 44, '_cite', ''),
(156, 45, '_edit_last', '1'),
(157, 45, '_edit_lock', '1504790936:1'),
(158, 45, '_fx', 'fade'),
(159, 45, '_timeout', '5'),
(160, 45, '_speed', '1'),
(161, 45, '_limit', '0'),
(162, 45, '_itemreviewed', ''),
(163, 45, '_template', 'default'),
(164, 45, '_img_size', 'thumbnail'),
(165, 45, '_title_heading', 'h2'),
(166, 45, '_shuffle', '1'),
(167, 45, '_verticalalign', '0'),
(168, 45, '_prevnext', '0'),
(169, 45, '_hidefeaturedimage', '0'),
(170, 45, '_hide_microdata', '0'),
(171, 45, '_hide_title', '0'),
(172, 45, '_hide_stars', '0'),
(173, 45, '_hide_body', '0'),
(174, 45, '_hide_author', '0'),
(175, 46, '_edit_last', '1'),
(176, 46, '_edit_lock', '1505303692:1'),
(177, 47, '_wp_attached_file', '2017/09/bannermain.jpg'),
(178, 47, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1336;s:6:"height";i:600;s:4:"file";s:22:"2017/09/bannermain.jpg";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"bannermain-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"bannermain-300x135.jpg";s:5:"width";i:300;s:6:"height";i:135;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:22:"bannermain-768x345.jpg";s:5:"width";i:768;s:6:"height";i:345;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:23:"bannermain-1024x460.jpg";s:5:"width";i:1024;s:6:"height";i:460;s:9:"mime-type";s:10:"image/jpeg";}s:14:"featured-slide";a:4:{s:4:"file";s:23:"bannermain-1336x600.jpg";s:5:"width";i:1336;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:22:"bannermain-250x112.jpg";s:5:"width";i:250;s:6:"height";i:112;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(179, 47, '_wp_attachment_image_alt', 'Gateway Bollywood'),
(180, 46, '_thumbnail_id', '47'),
(183, 49, '_edit_last', '1'),
(184, 49, '_edit_lock', '1504854950:1'),
(185, 49, '_thumbnail_id', '43'),
(188, 51, '_edit_last', '1'),
(189, 51, '_edit_lock', '1504876822:1'),
(192, 53, '_edit_last', '1'),
(193, 53, '_edit_lock', '1504851064:1'),
(194, 54, '_wp_attached_file', '2017/09/logo.png'),
(195, 54, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:350;s:6:"height";i:137;s:4:"file";s:16:"2017/09/logo.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:16:"logo-150x137.png";s:5:"width";i:150;s:6:"height";i:137;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:16:"logo-300x117.png";s:5:"width";i:300;s:6:"height";i:117;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:15:"logo-250x98.png";s:5:"width";i:250;s:6:"height";i:98;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(196, 55, '_wp_attached_file', '2017/09/s1.jpg'),
(197, 55, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:274;s:6:"height";i:237;s:4:"file";s:14:"2017/09/s1.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:14:"s1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:14:"s1-250x216.jpg";s:5:"width";i:250;s:6:"height";i:216;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(198, 56, '_wp_attached_file', '2017/09/s2.jpg'),
(199, 56, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:264;s:6:"height";i:237;s:4:"file";s:14:"2017/09/s2.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:14:"s2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:14:"s2-250x224.jpg";s:5:"width";i:250;s:6:"height";i:224;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(200, 57, '_wp_attached_file', '2017/09/s3.jpg'),
(201, 57, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:301;s:6:"height";i:237;s:4:"file";s:14:"2017/09/s3.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:14:"s3-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:14:"s3-300x236.jpg";s:5:"width";i:300;s:6:"height";i:236;s:9:"mime-type";s:10:"image/jpeg";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:14:"s3-250x197.jpg";s:5:"width";i:250;s:6:"height";i:197;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(202, 58, '_wp_attached_file', '2017/09/s4.jpg'),
(203, 58, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:350;s:6:"height";i:350;s:4:"file";s:14:"2017/09/s4.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:14:"s4-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:14:"s4-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:14:"s4-250x250.jpg";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:14:"s4-350x270.jpg";s:5:"width";i:350;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(204, 53, '_thumbnail_id', '55'),
(207, 53, 'Location', 'Mumbai'),
(210, 53, '_wp_old_slug', 'lorem-ipsum-dolor'),
(211, 61, '_edit_last', '1'),
(212, 61, '_edit_lock', '1504851120:1'),
(213, 61, 'Location', 'Mumbai'),
(214, 61, '_thumbnail_id', '56'),
(217, 63, 'Location', 'Bandra'),
(218, 63, '_edit_last', '1'),
(219, 63, '_thumbnail_id', '57'),
(222, 63, '_edit_lock', '1504851995:1'),
(225, 65, '_edit_last', '1'),
(226, 65, '_edit_lock', '1504877817:1'),
(227, 65, '_thumbnail_id', '58'),
(234, 67, '_edit_last', '1'),
(235, 67, '_edit_lock', '1504852639:1'),
(236, 67, '_wp_page_template', 'success-story.php'),
(237, 51, '_thumbnail_id', '58'),
(244, 71, '_form', '<label> Your Name (required)\n    [text* your-name] </label>\n\n<label> Your Email (required)\n    [email* your-email] </label>\n\n<label> Subject\n    [text your-subject] </label>\n\n<label> Your Message\n    [textarea your-message] </label>\n\n[submit "Send"]'),
(245, 71, '_mail', 'a:8:{s:7:"subject";s:37:"Gateway to Bollywood "[your-subject]"";s:6:"sender";s:52:"[your-name] <wordpress@projects.seawindsolution.com>";s:4:"body";s:218:"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Gateway to Bollywood (http://projects.seawindsolution.com/five/gatewaytobollywood)";s:9:"recipient";s:27:"chintan@seawindsolution.com";s:18:"additional_headers";s:22:"Reply-To: [your-email]";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(246, 71, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:37:"Gateway to Bollywood "[your-subject]"";s:6:"sender";s:61:"Gateway to Bollywood <wordpress@projects.seawindsolution.com>";s:4:"body";s:160:"Message Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Gateway to Bollywood (http://projects.seawindsolution.com/five/gatewaytobollywood)";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:37:"Reply-To: chintan@seawindsolution.com";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(247, 71, '_messages', 'a:8:{s:12:"mail_sent_ok";s:45:"Thank you for your message. It has been sent.";s:12:"mail_sent_ng";s:71:"There was an error trying to send your message. Please try again later.";s:16:"validation_error";s:61:"One or more fields have an error. Please check and try again.";s:4:"spam";s:71:"There was an error trying to send your message. Please try again later.";s:12:"accept_terms";s:69:"You must accept the terms and conditions before sending your message.";s:16:"invalid_required";s:22:"The field is required.";s:16:"invalid_too_long";s:22:"The field is too long.";s:17:"invalid_too_short";s:23:"The field is too short.";}'),
(248, 71, '_additional_settings', NULL),
(249, 71, '_locale', 'en_US'),
(250, 16, '_wp_page_template', 'default'),
(251, 11, '_wp_page_template', 'default'),
(252, 20, '_wp_page_template', 'default'),
(253, 18, '_wp_page_template', 'default'),
(254, 6, '_wp_page_template', 'default'),
(255, 65, 'Location', 'Juhu'),
(258, 22, '_wp_page_template', 'default'),
(259, 87, '_edit_last', '1'),
(260, 87, '_edit_lock', '1507808931:1'),
(261, 88, '_wp_attached_file', '2017/09/Actor.png'),
(262, 88, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:512;s:6:"height";i:512;s:4:"file";s:17:"2017/09/Actor.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"Actor-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:17:"Actor-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:17:"Actor-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:17:"Actor-512x270.png";s:5:"width";i:512;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(263, 87, '_thumbnail_id', '88'),
(264, 90, '_edit_last', '1'),
(265, 90, '_edit_lock', '1507805504:1'),
(266, 91, '_wp_attached_file', '2017/09/images.png'),
(267, 91, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:225;s:6:"height";i:225;s:4:"file";s:18:"2017/09/images.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"images-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(268, 90, '_thumbnail_id', '91'),
(269, 93, '_edit_last', '1'),
(270, 93, '_edit_lock', '1504950473:1'),
(271, 93, '_wp_page_template', 'default'),
(272, 95, '_edit_last', '1'),
(273, 95, '_edit_lock', '1504950508:1'),
(274, 95, '_wp_page_template', 'default'),
(275, 98, '_edit_last', '1'),
(276, 98, '_edit_lock', '1504950953:1'),
(277, 100, '_edit_last', '1'),
(278, 100, '_edit_lock', '1504950967:1'),
(279, 102, '_edit_last', '1'),
(280, 102, '_edit_lock', '1504951004:1'),
(281, 104, '_edit_last', '1'),
(282, 104, '_edit_lock', '1504951030:1'),
(283, 106, '_edit_last', '1'),
(284, 106, '_edit_lock', '1504951189:1'),
(285, 108, '_edit_last', '1'),
(286, 108, '_edit_lock', '1504951069:1'),
(287, 110, '_edit_last', '1'),
(288, 110, '_edit_lock', '1504951084:1'),
(290, 113, '_edit_lock', '1505135619:1'),
(291, 113, '_edit_last', '1'),
(292, 113, '_wp_page_template', 'talent.php'),
(293, 115, '_menu_item_type', 'post_type'),
(294, 115, '_menu_item_menu_item_parent', '0'),
(295, 115, '_menu_item_object_id', '113'),
(296, 115, '_menu_item_object', 'page'),
(297, 115, '_menu_item_target', ''),
(298, 115, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(299, 115, '_menu_item_xfn', ''),
(300, 115, '_menu_item_url', ''),
(302, 120, '_wp_attached_file', '2017/09/Chrysanthemum.jpg'),
(303, 120, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:768;s:4:"file";s:25:"2017/09/Chrysanthemum.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"Chrysanthemum-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:25:"Chrysanthemum-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:25:"Chrysanthemum-768x576.jpg";s:5:"width";i:768;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:26:"Chrysanthemum-1024x768.jpg";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:14:"featured-slide";a:4:{s:4:"file";s:26:"Chrysanthemum-1024x600.jpg";s:5:"width";i:1024;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:25:"Chrysanthemum-250x188.jpg";s:5:"width";i:250;s:6:"height";i:188;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:25:"Chrysanthemum-604x270.jpg";s:5:"width";i:604;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:6:"Corbis";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1205503166";s:9:"copyright";s:32:"© Corbis.  All Rights Reserved.";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(304, 119, 'pic_name', '120'),
(305, 121, 'youtube_url', 'https://www.youtube.com/watch?v=gB0wERlCP8E'),
(306, 122, '_form', '<input type="hidden" name="owner-mail" id="owner-mail" value="chintan@seawindsolution.com" />\n<label> Your Name (required)\n    [text* your-name] </label>\n\n<label> Your Email (required)\n    [email* your-email] </label>\n\n<label> Subject\n    [text your-subject] </label>\n\n<label> Your Message\n    [textarea your-message] </label>\n\n[dynamichidden email-author "chintan@seawindsolution.com"]\n\n[submit "Send"]'),
(307, 122, '_mail', 'a:9:{s:6:"active";b:1;s:7:"subject";s:37:"Gateway to Bollywood "[your-subject]"";s:6:"sender";s:52:"[your-name] <wordpress@projects.seawindsolution.com>";s:9:"recipient";s:14:"[email-author]";s:4:"body";s:218:"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Gateway to Bollywood (http://projects.seawindsolution.com/five/gatewaytobollywood)";s:18:"additional_headers";s:22:"Reply-To: [your-email]";s:11:"attachments";s:0:"";s:8:"use_html";b:0;s:13:"exclude_blank";b:0;}'),
(308, 122, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:37:"Gateway to Bollywood "[your-subject]"";s:6:"sender";s:61:"Gateway to Bollywood <wordpress@projects.seawindsolution.com>";s:9:"recipient";s:12:"[your-email]";s:4:"body";s:160:"Message Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Gateway to Bollywood (http://projects.seawindsolution.com/five/gatewaytobollywood)";s:18:"additional_headers";s:37:"Reply-To: chintan@seawindsolution.com";s:11:"attachments";s:0:"";s:8:"use_html";b:0;s:13:"exclude_blank";b:0;}'),
(309, 122, '_messages', 'a:23:{s:12:"mail_sent_ok";s:45:"Thank you for your message. It has been sent.";s:12:"mail_sent_ng";s:71:"There was an error trying to send your message. Please try again later.";s:16:"validation_error";s:61:"One or more fields have an error. Please check and try again.";s:4:"spam";s:71:"There was an error trying to send your message. Please try again later.";s:12:"accept_terms";s:69:"You must accept the terms and conditions before sending your message.";s:16:"invalid_required";s:22:"The field is required.";s:16:"invalid_too_long";s:22:"The field is too long.";s:17:"invalid_too_short";s:23:"The field is too short.";s:12:"invalid_date";s:29:"The date format is incorrect.";s:14:"date_too_early";s:44:"The date is before the earliest one allowed.";s:13:"date_too_late";s:41:"The date is after the latest one allowed.";s:13:"upload_failed";s:46:"There was an unknown error uploading the file.";s:24:"upload_file_type_invalid";s:49:"You are not allowed to upload files of this type.";s:21:"upload_file_too_large";s:20:"The file is too big.";s:23:"upload_failed_php_error";s:38:"There was an error uploading the file.";s:14:"invalid_number";s:29:"The number format is invalid.";s:16:"number_too_small";s:47:"The number is smaller than the minimum allowed.";s:16:"number_too_large";s:46:"The number is larger than the maximum allowed.";s:23:"quiz_answer_not_correct";s:36:"The answer to the quiz is incorrect.";s:17:"captcha_not_match";s:31:"Your entered code is incorrect.";s:13:"invalid_email";s:38:"The e-mail address entered is invalid.";s:11:"invalid_url";s:19:"The URL is invalid.";s:11:"invalid_tel";s:32:"The telephone number is invalid.";}'),
(310, 122, '_additional_settings', ''),
(311, 122, '_locale', 'en_US'),
(317, 122, '_config_errors', 'a:1:{s:14:"mail.recipient";a:1:{i:0;a:2:{s:4:"code";i:102;s:4:"args";a:3:{s:7:"message";s:0:"";s:6:"params";a:0:{}s:4:"link";s:68:"https://contactform7.com/configuration-errors/invalid-mailbox-syntax";}}}}'),
(318, 123, '_edit_lock', '1505303539:1'),
(319, 123, '_edit_last', '1'),
(320, 124, '_wp_attached_file', '2017/09/slider.jpg'),
(321, 124, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1336;s:6:"height";i:600;s:4:"file";s:18:"2017/09/slider.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"slider-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:18:"slider-300x135.jpg";s:5:"width";i:300;s:6:"height";i:135;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:18:"slider-768x345.jpg";s:5:"width";i:768;s:6:"height";i:345;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:19:"slider-1024x460.jpg";s:5:"width";i:1024;s:6:"height";i:460;s:9:"mime-type";s:10:"image/jpeg";}s:14:"featured-slide";a:4:{s:4:"file";s:19:"slider-1336x600.jpg";s:5:"width";i:1336;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:18:"slider-250x112.jpg";s:5:"width";i:250;s:6:"height";i:112;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:18:"slider-604x270.jpg";s:5:"width";i:604;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(322, 123, '_thumbnail_id', '125'),
(323, 125, '_wp_attached_file', '2017/09/slider-1.jpg'),
(324, 125, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1336;s:6:"height";i:600;s:4:"file";s:20:"2017/09/slider-1.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"slider-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"slider-1-300x135.jpg";s:5:"width";i:300;s:6:"height";i:135;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"slider-1-768x345.jpg";s:5:"width";i:768;s:6:"height";i:345;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:21:"slider-1-1024x460.jpg";s:5:"width";i:1024;s:6:"height";i:460;s:9:"mime-type";s:10:"image/jpeg";}s:14:"featured-slide";a:4:{s:4:"file";s:21:"slider-1-1336x600.jpg";s:5:"width";i:1336;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:20:"slider-1-250x112.jpg";s:5:"width";i:250;s:6:"height";i:112;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:20:"slider-1-604x270.jpg";s:5:"width";i:604;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(326, 127, '_edit_lock', '1505306689:1'),
(327, 127, '_edit_last', '1'),
(328, 128, '_wp_attached_file', '2017/09/11.png'),
(329, 128, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:14:"2017/09/11.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:14:"11-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:14:"11-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:14:"11-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(330, 127, '_thumbnail_id', '128'),
(331, 130, '_edit_lock', '1505306720:1'),
(332, 130, '_edit_last', '1'),
(333, 131, '_wp_attached_file', '2017/09/2.png'),
(334, 131, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:13:"2017/09/2.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:13:"2-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:13:"2-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:13:"2-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(335, 130, '_thumbnail_id', '131'),
(336, 133, '_edit_lock', '1505306771:1'),
(337, 133, '_edit_last', '1'),
(338, 134, '_wp_attached_file', '2017/09/8.png'),
(339, 134, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:13:"2017/09/8.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:13:"8-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:13:"8-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:13:"8-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(340, 133, '_thumbnail_id', '134'),
(341, 136, '_edit_lock', '1507805620:1'),
(342, 136, '_edit_last', '1'),
(343, 137, '_wp_attached_file', '2017/09/6.png'),
(344, 137, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:13:"2017/09/6.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:13:"6-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:13:"6-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:13:"6-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(345, 136, '_thumbnail_id', '137'),
(346, 139, '_edit_lock', '1507805537:1'),
(347, 139, '_edit_last', '1'),
(348, 140, '_wp_attached_file', '2017/09/3.png'),
(349, 140, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:13:"2017/09/3.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:13:"3-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:13:"3-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:13:"3-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(350, 139, '_thumbnail_id', '140'),
(351, 143, '_edit_lock', '1505813156:1'),
(352, 143, '_edit_last', '1'),
(353, 143, '_wp_page_template', 'recruiter-dashboard.php'),
(354, 145, '_edit_lock', '1505813048:1'),
(355, 145, '_edit_last', '1'),
(356, 145, '_wp_page_template', 'recruiter-jobs-list.php'),
(357, 147, '_edit_lock', '1505819033:1'),
(358, 147, '_edit_last', '1'),
(359, 147, '_wp_page_template', 'recruiter-job-form.php'),
(360, 149, '_edit_lock', '1505904889:1'),
(361, 149, '_edit_last', '1'),
(362, 149, '_wp_page_template', 'trending-jobs.php'),
(363, 151, '_menu_item_type', 'post_type'),
(364, 151, '_menu_item_menu_item_parent', '0'),
(365, 151, '_menu_item_object_id', '149'),
(366, 151, '_menu_item_object', 'page'),
(367, 151, '_menu_item_target', ''),
(368, 151, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(369, 151, '_menu_item_xfn', ''),
(370, 151, '_menu_item_url', ''),
(372, 152, '_edit_lock', '1505978245:1'),
(373, 152, '_edit_last', '1'),
(374, 152, '_wp_page_template', 'artist-dashboard.php'),
(375, 154, '_edit_lock', '1505985684:1'),
(376, 154, '_edit_last', '1'),
(377, 154, '_wp_page_template', 'artist-jobs-list.php'),
(378, 158, '_edit_lock', '1505986009:1'),
(379, 158, '_edit_last', '1'),
(380, 158, '_wp_page_template', 'recruiter-applicants.php'),
(383, 162, '_edit_lock', '1506074398:1'),
(384, 162, '_edit_last', '1'),
(385, 162, '_wp_page_template', 'default'),
(386, 165, '_edit_lock', '1506076317:1'),
(387, 165, '_edit_last', '1'),
(388, 165, '_wp_page_template', 'default'),
(389, 168, '_edit_lock', '1506077538:1'),
(390, 168, '_edit_last', '1'),
(391, 169, '_edit_lock', '1506081308:1'),
(392, 169, '_edit_last', '1'),
(393, 169, '_wp_page_template', 'change-password.php'),
(394, 171, '_edit_lock', '1507805575:1'),
(395, 171, '_edit_last', '1'),
(396, 172, '_wp_attached_file', '2017/09/Male-VO-Icon-300x300.jpg'),
(397, 172, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:32:"2017/09/Male-VO-Icon-300x300.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:32:"Male-VO-Icon-300x300-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:32:"Male-VO-Icon-300x300-250x250.jpg";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:32:"Male-VO-Icon-300x300-300x270.jpg";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(398, 171, '_thumbnail_id', '172'),
(400, 175, '_edit_lock', '1506431174:1'),
(401, 175, '_edit_last', '1'),
(402, 176, '_wp_attached_file', '2017/09/dj.png'),
(403, 176, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:14:"2017/09/dj.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:14:"dj-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:14:"dj-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:14:"dj-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(404, 175, '_thumbnail_id', '176'),
(405, 178, '_edit_lock', '1506431196:1'),
(406, 178, '_edit_last', '1'),
(407, 179, '_wp_attached_file', '2017/09/lyrics.png'),
(408, 179, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:18:"2017/09/lyrics.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"lyrics-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:18:"lyrics-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:18:"lyrics-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(409, 178, '_thumbnail_id', '179'),
(410, 181, '_edit_lock', '1506431246:1'),
(411, 181, '_edit_last', '1'),
(412, 182, '_wp_attached_file', '2017/09/Editor.png'),
(413, 182, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:18:"2017/09/Editor.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"Editor-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:18:"Editor-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:18:"Editor-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(414, 181, '_thumbnail_id', '182'),
(415, 184, '_edit_lock', '1506431307:1'),
(416, 184, '_edit_last', '1'),
(417, 185, '_wp_attached_file', '2017/09/voiceoverartist.png'),
(418, 185, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:27:"2017/09/voiceoverartist.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:27:"voiceoverartist-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:27:"voiceoverartist-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:27:"voiceoverartist-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(419, 184, '_thumbnail_id', '185'),
(420, 187, '_edit_last', '1'),
(421, 187, '_edit_lock', '1506431468:1'),
(422, 187, '_wp_trash_meta_status', 'publish'),
(423, 187, '_wp_trash_meta_time', '1506431612'),
(424, 187, '_wp_desired_post_slug', 'sound-engineer'),
(425, 189, '_edit_lock', '1506485635:1'),
(426, 189, '_edit_last', '1'),
(427, 190, '_wp_attached_file', '2017/09/soundengineer.png'),
(428, 190, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:25:"2017/09/soundengineer.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"soundengineer-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:25:"soundengineer-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:25:"soundengineer-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(429, 189, '_thumbnail_id', '190'),
(430, 192, '_edit_lock', '1506485678:1'),
(431, 192, '_edit_last', '1'),
(432, 193, '_wp_attached_file', '2017/09/soundrecord.png'),
(433, 193, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:23:"2017/09/soundrecord.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"soundrecord-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:23:"soundrecord-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:23:"soundrecord-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(434, 192, '_thumbnail_id', '193'),
(435, 195, '_edit_lock', '1506485707:1'),
(436, 195, '_edit_last', '1'),
(437, 196, '_wp_attached_file', '2017/09/comedian.png'),
(438, 196, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:20:"2017/09/comedian.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"comedian-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:20:"comedian-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:20:"comedian-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(439, 195, '_thumbnail_id', '196'),
(440, 198, '_edit_lock', '1506485747:1'),
(441, 198, '_edit_last', '1'),
(442, 199, '_wp_attached_file', '2017/09/stunt.png'),
(443, 199, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:17:"2017/09/stunt.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"stunt-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:17:"stunt-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:17:"stunt-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(444, 198, '_thumbnail_id', '199'),
(445, 201, '_edit_lock', '1506485869:1'),
(446, 201, '_edit_last', '1'),
(447, 202, '_wp_attached_file', '2017/09/Choreographer.png'),
(448, 202, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:25:"2017/09/Choreographer.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"Choreographer-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:25:"Choreographer-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:25:"Choreographer-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(449, 201, '_thumbnail_id', '202'),
(450, 204, '_edit_lock', '1506485975:1'),
(451, 204, '_edit_last', '1'),
(452, 205, '_wp_attached_file', '2017/09/hairstyle.png'),
(453, 205, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:21:"2017/09/hairstyle.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"hairstyle-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:21:"hairstyle-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:21:"hairstyle-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(454, 204, '_thumbnail_id', '205'),
(455, 207, '_edit_lock', '1506486070:1'),
(456, 207, '_edit_last', '1'),
(457, 208, '_wp_attached_file', '2017/09/fastion-designer.png'),
(458, 208, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:28:"2017/09/fastion-designer.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:28:"fastion-designer-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:28:"fastion-designer-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:28:"fastion-designer-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(459, 207, '_thumbnail_id', '208'),
(460, 210, '_edit_lock', '1506486108:1'),
(461, 210, '_edit_last', '1'),
(462, 211, '_wp_attached_file', '2017/09/Cinematographer.png'),
(463, 211, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:27:"2017/09/Cinematographer.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:27:"Cinematographer-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:27:"Cinematographer-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:27:"Cinematographer-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(464, 210, '_thumbnail_id', '211'),
(465, 213, '_edit_lock', '1506486134:1'),
(466, 213, '_edit_last', '1'),
(467, 214, '_wp_attached_file', '2017/09/casting.png'),
(468, 214, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:19:"2017/09/casting.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"casting-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:19:"casting-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:19:"casting-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(469, 213, '_thumbnail_id', '214'),
(470, 216, '_edit_lock', '1506486170:1'),
(471, 216, '_edit_last', '1'),
(472, 217, '_wp_attached_file', '2017/09/CUSTOMDESIGNER.png'),
(473, 217, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:26:"2017/09/CUSTOMDESIGNER.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:26:"CUSTOMDESIGNER-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:26:"CUSTOMDESIGNER-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:26:"CUSTOMDESIGNER-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(474, 216, '_thumbnail_id', '217'),
(475, 219, '_edit_lock', '1506486218:1'),
(476, 219, '_edit_last', '1'),
(477, 220, '_wp_attached_file', '2017/09/Production-Manager.png'),
(478, 220, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:30:"2017/09/Production-Manager.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:30:"Production-Manager-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:30:"Production-Manager-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:30:"Production-Manager-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(479, 219, '_thumbnail_id', '220'),
(480, 222, '_edit_lock', '1507805398:1'),
(481, 222, '_edit_last', '1'),
(482, 223, '_wp_attached_file', '2017/09/PHOTOGRAPHER.png');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(483, 223, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:24:"2017/09/PHOTOGRAPHER.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:24:"PHOTOGRAPHER-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:20:"featured-slide-thumb";a:4:{s:4:"file";s:24:"PHOTOGRAPHER-250x250.png";s:5:"width";i:250;s:6:"height";i:250;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:24:"PHOTOGRAPHER-300x270.png";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(484, 222, '_thumbnail_id', '223'),
(485, 225, '_edit_last', '1'),
(486, 225, '_wp_page_template', 'default'),
(487, 225, '_edit_lock', '1506601885:1'),
(488, 238, '_wp_attached_file', '2017/09/download-1.jpg'),
(489, 238, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:144;s:6:"height";i:144;s:4:"file";s:22:"2017/09/download-1.jpg";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(490, 237, 'pic_name', '238'),
(491, 244, '_wp_attached_file', '2017/09/connect-book.png'),
(492, 244, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:116;s:6:"height";i:115;s:4:"file";s:24:"2017/09/connect-book.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(493, 245, '_wp_attached_file', '2017/09/job-op.png'),
(494, 245, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:116;s:6:"height";i:115;s:4:"file";s:18:"2017/09/job-op.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(495, 246, '_wp_attached_file', '2017/09/sign-up.png'),
(496, 246, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:116;s:6:"height";i:115;s:4:"file";s:19:"2017/09/sign-up.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(497, 247, '_wp_attached_file', '2017/09/verification.png'),
(498, 247, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:116;s:6:"height";i:115;s:4:"file";s:24:"2017/09/verification.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(499, 253, '_wp_attached_file', '2017/09/contact-us.png'),
(500, 253, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:116;s:6:"height";i:116;s:4:"file";s:22:"2017/09/contact-us.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2017-09-07 04:49:40', '2017-09-07 04:49:40', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2017-09-07 04:49:40', '2017-09-07 04:49:40', '', 0, 'http://localhost/gatewayofbollywoodwp/?p=1', 6, 'post', '', 1),
(2, 1, '2017-09-07 04:49:40', '2017-09-07 04:49:40', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost/gatewayofbollywoodwp/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2017-09-07 04:49:40', '2017-09-07 04:49:40', '', 0, 'http://localhost/gatewayofbollywoodwp/?page_id=2', 6, 'page', '', 0),
(5, 1, '2017-09-07 07:55:56', '2017-09-07 07:55:56', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2017-09-20 10:57:31', '2017-09-20 10:57:31', '', 0, 'http://localhost/gatewayofbollywoodwp/2017/09/07/home/', 1, 'nav_menu_item', '', 0),
(6, 1, '2017-09-07 09:04:21', '2017-09-07 09:04:21', '<strong>Gateway to Bollywood </strong>\r\n\r\nGateway to Bollywood, being a talent hunt portal is a boon for aspiring individuals, whether they are models, photographers, directors, actors or anyone related to the film production industry. There is no dearth of talent in our country and as talent always pays off, it’s an open hunting for the ones who are in a need to make a brighter career in Bollywood.\r\n\r\nAnyone can get registered himself or herself online here to become a part of the Gateway to Bollywood family to get an entry to Bollywood. It’s your own platform and your chance and the selection is beyond nepotism.Don’t think out of the box.  Think like there is no Box. We also do have a “no box” approach towards recruitment solutions for film producers, casting directors, and production houses, where we provide endwise hiring solutions.\r\n\r\nGateway to Bollywood assures you for providing a platform and promoting yourselves among the film makers, casting and modeling agencies, and production houses besides informing you about the latest castings and auditions. On the other hand, we are not prejudiced by your physical appearance and the background you come from. All that is needed is the zeal to move ahead in life and willingness to face the challenges with great eagerness. Gateway to Bollywood is a radical concept in the promotion of fine arts and theatre in particular. We envision providing a see-through via media between budding stars desiring for the correct launch pad into glitter town and establish leaders of the world of Bollywood.\r\n\r\n<div class="about about1">\r\n    <h2>How it works for a Recruiter ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3"> \r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Industry professionals sign up and create their a user profile with the Company Logo, Profile &amp; past work.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>Verified user by admin team after the recruiter will be allowed to access the website.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Talent nearby</strong>\r\n            <p>Once Verified – Recruiters will be able to post jobs and search for talent profiles, based on their exact requirements.</p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/contact-us.png" />\r\n               <strong>Contact us </strong> \r\n            <p>Recruiters can directly communicate with their shortlisted talent through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n<div class="about about2">\r\n    <h2>How it works for a Talent ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Talent sign up and create their a user profile with their Profile picture, Skills &amp; past work.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n            <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>Verified user by admin team after the talent will be allowed to access the website.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Job</strong>\r\n            <p>Once Verified, talent will have access to jobs that they would normally not even be aware of. Talent can apply for jobs and give auditions from the comfort of their home. </p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/contact-us.png" />\r\n               <strong>Contact us</strong> \r\n            <p>If Shortlisted, they can directly contact with the recruiter and finalize the job on mutual consent through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n ', 'About', '', 'publish', 'closed', 'closed', '', 'about', '', '', '2017-10-02 05:46:43', '2017-10-02 05:46:43', '', 0, 'http://localhost/gatewayofbollywoodwp/?page_id=6', 6, 'page', '', 0),
(7, 1, '2017-09-07 09:04:21', '2017-09-07 09:04:21', '<b>About us</b>\r\n\r\n<b>Gateway to Bollywood </b>\r\n\r\n<span style="font-weight: 400;">-Gateway to bollywood is a talent hunt portal for all those aspiring people who wants to make their career in Bollywood.</span>\r\n\r\n<span style="font-weight: 400;">It’s a open hunting for every career related to film industry.</span>\r\n\r\n<span style="font-weight: 400;">Anybody or everybody can register and be a part of " Gateway To Bollywood " Family.</span>', 'About', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2017-09-07 09:04:21', '2017-09-07 09:04:21', '', 6, 'http://localhost/gatewayofbollywoodwp/2017/09/07/6-revision-v1/', 6, 'revision', '', 0),
(8, 1, '2017-09-07 09:05:08', '2017-09-07 09:05:08', '', 'About Us', '', 'publish', 'closed', 'closed', '', 'about-us', '', '', '2017-09-20 10:57:31', '2017-09-20 10:57:31', '', 0, 'http://localhost/gatewayofbollywoodwp/?p=8', 2, 'nav_menu_item', '', 0),
(11, 1, '2017-09-07 09:25:24', '2017-09-07 09:25:24', '1) If i want to participate for one or more career do i need to register again ?\r\n\r\n2) How will i get a chance once i get register for your  web portal ?\r\n\r\n3) Do you have any institute or Academy ?\r\n\r\n4) I am from Bihar, Do you people work for regional also ?\r\n\r\n5) Who all are associated with your orgranisation in bollywood ?\r\n\r\n6) Do i need to pay anything else after this Rs 1200 ?', 'FAQ', '', 'publish', 'closed', 'closed', '', 'faq', '', '', '2017-09-08 07:24:03', '2017-09-08 07:24:03', '', 0, 'http://localhost/gatewayofbollywoodwp/?page_id=11', 6, 'page', '', 0),
(12, 1, '2017-09-07 09:25:24', '2017-09-07 09:25:24', '<span style="font-weight: 400;">FAQ</span>\r\n\r\n<span style="font-weight: 400;">1) If i want to participate for one or more career do i need to register again ?</span>\r\n\r\n<span style="font-weight: 400;">2) How will i get a chance once i get register for your  web portal ?</span>\r\n\r\n<span style="font-weight: 400;">3) Do you have any institute or Academy ?</span>\r\n\r\n<span style="font-weight: 400;">4) I am from Bihar, Do you people work for regional also ?</span>\r\n\r\n<span style="font-weight: 400;">5) Who all are associated with your orgranisation in bollywood ?</span>\r\n\r\n<span style="font-weight: 400;">6) Do i need to pay anything else after this Rs 1200 ?           </span>', 'FAQ', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2017-09-07 09:25:24', '2017-09-07 09:25:24', '', 11, 'http://localhost/gatewayofbollywoodwp/2017/09/07/11-revision-v1/', 6, 'revision', '', 0),
(13, 1, '2017-09-07 09:25:44', '2017-09-07 09:25:44', ' ', '', '', 'publish', 'closed', 'closed', '', '13', '', '', '2017-09-20 10:57:32', '2017-09-20 10:57:32', '', 0, 'http://localhost/gatewayofbollywoodwp/?p=13', 5, 'nav_menu_item', '', 0),
(14, 1, '2017-09-07 09:32:40', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2017-09-07 09:32:40', '0000-00-00 00:00:00', '', 0, 'http://localhost/gatewayofbollywoodwp/?p=14', 1, 'nav_menu_item', '', 0),
(15, 1, '2017-09-07 09:32:45', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2017-09-07 09:32:45', '0000-00-00 00:00:00', '', 0, 'http://localhost/gatewayofbollywoodwp/?p=15', 1, 'nav_menu_item', '', 0),
(16, 1, '2017-09-07 09:33:16', '2017-09-07 09:33:16', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Privacy Policy', '', 'publish', 'closed', 'closed', '', 'privacy-policy', '', '', '2017-09-08 07:18:40', '2017-09-08 07:18:40', '', 0, 'http://localhost/gatewayofbollywoodwp/?page_id=16', 6, 'page', '', 0),
(17, 1, '2017-09-07 09:33:16', '2017-09-07 09:33:16', 'Privacy Policy', 'Privacy Policy', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2017-09-07 09:33:16', '2017-09-07 09:33:16', '', 16, 'http://localhost/gatewayofbollywoodwp/2017/09/07/16-revision-v1/', 6, 'revision', '', 0),
(18, 1, '2017-09-07 09:33:34', '2017-09-07 09:33:34', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'T&C', '', 'publish', 'closed', 'closed', '', 'tc', '', '', '2017-09-08 07:27:41', '2017-09-08 07:27:41', '', 0, 'http://localhost/gatewayofbollywoodwp/?page_id=18', 6, 'page', '', 0),
(19, 1, '2017-09-07 09:33:34', '2017-09-07 09:33:34', 'T&amp;C', 'T&C', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2017-09-07 09:33:34', '2017-09-07 09:33:34', '', 18, 'http://localhost/gatewayofbollywoodwp/2017/09/07/18-revision-v1/', 6, 'revision', '', 0),
(20, 1, '2017-09-07 09:33:54', '2017-09-07 09:33:54', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Help', '', 'publish', 'closed', 'closed', '', 'help', '', '', '2017-09-08 07:27:28', '2017-09-08 07:27:28', '', 0, 'http://localhost/gatewayofbollywoodwp/?page_id=20', 6, 'page', '', 0),
(21, 1, '2017-09-07 09:33:54', '2017-09-07 09:33:54', 'help', 'Help', '', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2017-09-07 09:33:54', '2017-09-07 09:33:54', '', 20, 'http://localhost/gatewayofbollywoodwp/2017/09/07/20-revision-v1/', 6, 'revision', '', 0),
(22, 1, '2017-09-07 09:34:14', '2017-09-07 09:34:14', '<div class="col-md-7">\r\n<strong>Address</strong>\r\n25, Lorem Ipsum Dolor,\r\nLorem ipsum, \r\nLipsum Dolor - 000000.\r\n<br/>\r\n<strong>Email</strong> \r\n<a href="mailto:info@example.com">info@example.com</a>\r\n\r\n<strong>Call Us </strong> \r\n+91 99999 99999\r\n\r\n<br/>\r\n <!--<iframe  width="100%" height="400" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3672.585688481838!2d72.61665431454537!3d23.00225798496341!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e86742b6dc88f%3A0x759d5db9ab4771c4!2sSeawind+Solution+Pvt+Ltd!5e0!3m2!1sen!2sin!4v1481979184975" frameborder="0" style="border:0" allowfullscreen></iframe>-->\r\n<div style="width: 100%"><iframe width="100%" height="600" src="https://www.mapsdirections.info/en/custom-google-maps/map.php?width=100%&height=600&hl=ru&q=andheri%20mumbai+(Gateway%20to%20Bollywood)&ie=UTF8&t=&z=14&iwloc=A&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"><a href="https://www.mapsdirections.info/en/custom-google-maps/">Embed Google Map</a> by <a href="https://www.mapsdirections.info/en/">Measure area on map</a></iframe></div><br />\r\n</div>\r\n<div class="col-md-5">\r\n[vfb id=\'1\']\r\n</div>', 'Contact Us', '', 'publish', 'closed', 'closed', '', 'contact-us', '', '', '2017-09-29 07:12:51', '2017-09-29 07:12:51', '', 0, 'http://localhost/gatewayofbollywoodwp/?page_id=22', 6, 'page', '', 0),
(23, 1, '2017-09-07 09:34:14', '2017-09-07 09:34:14', 'contact us', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2017-09-07 09:34:14', '2017-09-07 09:34:14', '', 22, 'http://localhost/gatewayofbollywoodwp/2017/09/07/22-revision-v1/', 6, 'revision', '', 0),
(24, 1, '2017-09-07 09:35:25', '2017-09-07 09:35:25', ' ', '', '', 'publish', 'closed', 'closed', '', '24', '', '', '2017-09-07 09:35:35', '2017-09-07 09:35:35', '', 0, 'http://localhost/gatewayofbollywoodwp/?p=24', 1, 'nav_menu_item', '', 0),
(25, 1, '2017-09-07 09:35:26', '2017-09-07 09:35:26', ' ', '', '', 'publish', 'closed', 'closed', '', '25', '', '', '2017-09-07 09:35:36', '2017-09-07 09:35:36', '', 0, 'http://localhost/gatewayofbollywoodwp/?p=25', 2, 'nav_menu_item', '', 0),
(26, 1, '2017-09-07 09:35:27', '2017-09-07 09:35:27', ' ', '', '', 'publish', 'closed', 'closed', '', '26', '', '', '2017-09-07 09:35:36', '2017-09-07 09:35:36', '', 0, 'http://localhost/gatewayofbollywoodwp/?p=26', 6, 'nav_menu_item', '', 0),
(27, 1, '2017-09-07 09:35:26', '2017-09-07 09:35:26', ' ', '', '', 'publish', 'closed', 'closed', '', '27', '', '', '2017-09-07 09:35:36', '2017-09-07 09:35:36', '', 0, 'http://localhost/gatewayofbollywoodwp/?p=27', 5, 'nav_menu_item', '', 0),
(28, 1, '2017-09-07 09:35:26', '2017-09-07 09:35:26', ' ', '', '', 'publish', 'closed', 'closed', '', '28', '', '', '2017-09-07 09:35:36', '2017-09-07 09:35:36', '', 0, 'http://localhost/gatewayofbollywoodwp/?p=28', 3, 'nav_menu_item', '', 0),
(29, 1, '2017-09-07 09:35:26', '2017-09-07 09:35:26', ' ', '', '', 'publish', 'closed', 'closed', '', '29', '', '', '2017-09-07 09:35:36', '2017-09-07 09:35:36', '', 0, 'http://localhost/gatewayofbollywoodwp/?p=29', 4, 'nav_menu_item', '', 0),
(30, 1, '2017-09-07 10:01:13', '2017-09-07 10:01:13', '[vfb id=\'1\']', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2017-09-07 10:01:13', '2017-09-07 10:01:13', '', 22, 'http://localhost/gatewayofbollywoodwp/2017/09/07/22-revision-v1/', 6, 'revision', '', 0),
(32, 1, '2017-09-07 10:13:11', '2017-09-07 10:13:11', '[artist_login_register_password]', 'Registration', '', 'publish', 'closed', 'closed', '', 'registration', '', '', '2017-09-07 10:13:11', '2017-09-07 10:13:11', '', 0, 'http://localhost/gatewayofbollywoodwp/?page_id=32', 6, 'page', '', 0),
(33, 1, '2017-09-07 10:13:11', '2017-09-07 10:13:11', '[artist_login_register_password]', 'Registration', '', 'inherit', 'closed', 'closed', '', '32-revision-v1', '', '', '2017-09-07 10:13:11', '2017-09-07 10:13:11', '', 32, 'http://localhost/gatewayofbollywoodwp/2017/09/07/32-revision-v1/', 6, 'revision', '', 0),
(34, 1, '2017-09-07 10:13:54', '2017-09-07 10:13:54', '[artist_login]', 'Login', '', 'publish', 'closed', 'closed', '', 'login', '', '', '2017-09-07 10:13:54', '2017-09-07 10:13:54', '', 0, 'http://localhost/gatewayofbollywoodwp/?page_id=34', 6, 'page', '', 0),
(35, 1, '2017-09-07 10:13:54', '2017-09-07 10:13:54', '[artist_login]', 'Login', '', 'inherit', 'closed', 'closed', '', '34-revision-v1', '', '', '2017-09-07 10:13:54', '2017-09-07 10:13:54', '', 34, 'http://localhost/gatewayofbollywoodwp/2017/09/07/34-revision-v1/', 6, 'revision', '', 0),
(36, 1, '2017-09-07 10:14:28', '2017-09-07 10:14:28', '[artist_profile]', 'Profile', '', 'publish', 'closed', 'closed', '', 'profile', '', '', '2017-09-07 10:14:28', '2017-09-07 10:14:28', '', 0, 'http://localhost/gatewayofbollywoodwp/?page_id=36', 6, 'page', '', 0),
(37, 1, '2017-09-07 10:14:28', '2017-09-07 10:14:28', '[artist_profile]', 'Profile', '', 'inherit', 'closed', 'closed', '', '36-revision-v1', '', '', '2017-09-07 10:14:28', '2017-09-07 10:14:28', '', 36, 'http://localhost/gatewayofbollywoodwp/2017/09/07/36-revision-v1/', 6, 'revision', '', 0),
(38, 1, '2017-09-07 12:40:03', '2017-09-07 12:40:03', '<div class="col-sm-6 col-md-3">\r\n<div class="cities_list hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/cities_1.png" />\r\n<div class="city_listings_info">\r\n\r\nFemale Actor For Web Series\r\n<h4>Actor</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list chicago hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/5.png" />\r\n<div class="city_listings_info">\r\n\r\nDirector For Web Series\r\n<h4>Director</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list angeles hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/11.png" />\r\n<div class="city_listings_info">\r\n\r\nAssistant Director For Web Series\r\n<h4>Assistant Director</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list francisco hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/8.png" />\r\n<div class="city_listings_info">\r\n\r\nArt Director For Web Series\r\n<h4>Art Director</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list seattle hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/1.png" />\r\n<div class="city_listings_info">\r\n\r\nComposer For Film\r\n<h4>Composer</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list washington hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/6.png" />\r\n<div class="city_listings_info">\r\n\r\nMale Dancer For Film\r\n<h4>Dancer</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list orlando hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/3.png" />\r\n<div class="city_listings_info">\r\n\r\nMale &amp; Female Models For Film\r\n<h4>Model</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list miami hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/4.png" />\r\n<div class="city_listings_info">\r\n\r\nVoice Artist female For Film\r\n<h4>Voice over Artist</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>', 'Trending Jobs & Auditions', '', 'publish', 'closed', 'closed', '', 'trending-jobs-auditions', '', '', '2017-09-07 12:46:14', '2017-09-07 12:46:14', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=38', 6, 'page', '', 0),
(39, 1, '2017-09-07 12:40:03', '2017-09-07 12:40:03', '<div class="row">\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/cities_1.png" />\r\n<div class="city_listings_info">\r\n\r\nFemale Actor For Web Series\r\n<h4>Actor</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list chicago hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/5.png"/&gt;\r\n<div class="city_listings_info">\r\n\r\nDirector For Web Series\r\n<h4>Director</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list angeles hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/11.png"/&gt;\r\n<div class="city_listings_info">\r\n\r\nAssistant Director For Web Series\r\n<h4>Assistant Director</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list francisco hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/8.png"/&gt;\r\n<div class="city_listings_info">\r\n\r\nArt Director For Web Series\r\n<h4>Art Director</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list seattle hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/1.png"/&gt;\r\n<div class="city_listings_info">\r\n\r\nComposer For Film\r\n<h4>Composer</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list washington hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/6.png"/&gt;\r\n<div class="city_listings_info">\r\n\r\nMale Dancer For Film\r\n<h4>Dancer</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list orlando hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/3.png"/&gt;\r\n<div class="city_listings_info">\r\n\r\nMale &amp; Female Models For Film\r\n<h4>Model</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list miami hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/4.png"/&gt;\r\n<div class="city_listings_info">\r\n\r\nVoice Artist female For Film\r\n<h4>Voice over Artist</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n</div>', 'Trending Jobs & Auditions', '', 'inherit', 'closed', 'closed', '', '38-revision-v1', '', '', '2017-09-07 12:40:03', '2017-09-07 12:40:03', '', 38, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/07/38-revision-v1/', 6, 'revision', '', 0),
(40, 1, '2017-09-07 12:46:11', '2017-09-07 12:46:11', '<div class="col-sm-6 col-md-3">\n<div class="cities_list hvr-grow">\n\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/cities_1.png" />\n<div class="city_listings_info">\n\nFemale Actor For Web Series\n<h4>Actor</h4>\n</div>\n</div>\n<div class="listing_number"><a>Apply</a></div>\n</div>\n<div class="col-sm-6 col-md-3">\n<div class="cities_list chicago hvr-grow">\n\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/5.png" />\n<div class="city_listings_info">\n\nDirector For Web Series\n<h4>Director</h4>\n</div>\n</div>\n<div class="listing_number"><a>Apply</a></div>\n</div>\n<div class="col-sm-6 col-md-3">\n<div class="cities_list angeles hvr-grow">\n\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/11.png" />\n<div class="city_listings_info">\n\nAssistant Director For Web Series\n<h4>Assistant Director</h4>\n</div>\n</div>\n<div class="listing_number"><a>Apply</a></div>\n</div>\n<div class="col-sm-6 col-md-3">\n<div class="cities_list francisco hvr-grow">\n\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/8.png" />\n<div class="city_listings_info">\n\nArt Director For Web Series\n<h4>Art Director</h4>\n</div>\n</div>\n<div class="listing_number"><a>Apply</a></div>\n</div>\n<div class="col-sm-6 col-md-3">\n<div class="cities_list seattle hvr-grow">\n\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/1.png" />\n<div class="city_listings_info">\n\nComposer For Film\n<h4>Composer</h4>\n</div>\n</div>\n<div class="listing_number"><a>Apply</a></div>\n</div>\n<div class="col-sm-6 col-md-3">\n<div class="cities_list washington hvr-grow">\n\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/6.png" />\n<div class="city_listings_info">\n\nMale Dancer For Film\n<h4>Dancer</h4>\n</div>\n</div>\n<div class="listing_number"><a>Apply</a></div>\n</div>\n<div class="col-sm-6 col-md-3">\n<div class="cities_list orlando hvr-grow">\n\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/3.png" />\n<div class="city_listings_info">\n\nMale &amp; Female Models For Film\n<h4>Model</h4>\n</div>\n</div>\n<div class="listing_number"><a>Apply</a></div>\n</div>\n<div class="col-sm-6 col-md-3">\n<div class="cities_list miami hvr-grow">\n\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/4.png" />\n<div class="city_listings_info">\n\nVoice Artist female For Film\n<h4>Voice over Artist</h4>\n</div>\n</div>\n<div class="listing_number"><a>Apply</a></div>\n</div>\n</', 'Trending Jobs & Auditions', '', 'inherit', 'closed', 'closed', '', '38-autosave-v1', '', '', '2017-09-07 12:46:11', '2017-09-07 12:46:11', '', 38, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/07/38-autosave-v1/', 6, 'revision', '', 0),
(41, 1, '2017-09-07 12:46:14', '2017-09-07 12:46:14', '<div class="col-sm-6 col-md-3">\r\n<div class="cities_list hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/cities_1.png" />\r\n<div class="city_listings_info">\r\n\r\nFemale Actor For Web Series\r\n<h4>Actor</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list chicago hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/5.png" />\r\n<div class="city_listings_info">\r\n\r\nDirector For Web Series\r\n<h4>Director</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list angeles hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/11.png" />\r\n<div class="city_listings_info">\r\n\r\nAssistant Director For Web Series\r\n<h4>Assistant Director</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list francisco hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/8.png" />\r\n<div class="city_listings_info">\r\n\r\nArt Director For Web Series\r\n<h4>Art Director</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list seattle hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/1.png" />\r\n<div class="city_listings_info">\r\n\r\nComposer For Film\r\n<h4>Composer</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list washington hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/6.png" />\r\n<div class="city_listings_info">\r\n\r\nMale Dancer For Film\r\n<h4>Dancer</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list orlando hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/3.png" />\r\n<div class="city_listings_info">\r\n\r\nMale &amp; Female Models For Film\r\n<h4>Model</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>\r\n<div class="col-sm-6 col-md-3">\r\n<div class="cities_list miami hvr-grow">\r\n\r\n<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/themes/gatewayofbollywood/images/icons/4.png" />\r\n<div class="city_listings_info">\r\n\r\nVoice Artist female For Film\r\n<h4>Voice over Artist</h4>\r\n</div>\r\n</div>\r\n<div class="listing_number"><a>Apply</a></div>\r\n</div>', 'Trending Jobs & Auditions', '', 'inherit', 'closed', 'closed', '', '38-revision-v1', '', '', '2017-09-07 12:46:14', '2017-09-07 12:46:14', '', 38, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/07/38-revision-v1/', 6, 'revision', '', 0),
(42, 1, '2017-09-07 13:17:55', '2017-09-07 13:17:55', '<h5>"Life hits you hard.\r\nBut it takes you three seconds to decide\r\nIf you are a superhero or not. I am."</h5>', 'Life hits you hard', '', 'publish', 'closed', 'closed', '', 'life-hits-you-hard', '', '', '2017-09-07 13:17:55', '2017-09-07 13:17:55', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=testimonial&#038;p=42', 6, 'testimonial', '', 0),
(43, 1, '2017-09-07 13:17:39', '2017-09-07 13:17:39', '', 'photo', '', 'inherit', 'open', 'closed', '', 'photo', '', '', '2017-09-07 13:17:39', '2017-09-07 13:17:39', '', 42, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/photo.jpg', 6, 'attachment', 'image/jpeg', 0),
(44, 1, '2017-09-07 13:27:39', '2017-09-07 13:27:39', '<h5>"Life hits you hard.\r\nBut it takes you three seconds to decide\r\nIf you are a superhero or not. I am."</h5>', 'Life hits you hard', '', 'publish', 'closed', 'closed', '', 'life-hits-you-hard-2', '', '', '2017-09-07 13:27:39', '2017-09-07 13:27:39', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=testimonial&#038;p=44', 6, 'testimonial', '', 0),
(45, 1, '2017-09-07 13:28:28', '2017-09-07 13:28:28', '', 'Testimonial', '', 'publish', 'closed', 'closed', '', 'testimonial', '', '', '2017-09-07 13:28:54', '2017-09-07 13:28:54', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=testimonial_rotator&#038;p=45', 6, 'testimonial_rotator', '', 0),
(46, 1, '2017-09-08 05:17:35', '2017-09-08 05:17:35', '', 'Slider', '', 'draft', 'closed', 'closed', '', 'slider', '', '', '2017-09-13 11:54:51', '2017-09-13 11:54:51', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=slide&#038;p=46', 6, 'slide', '', 0),
(47, 1, '2017-09-08 05:17:15', '2017-09-08 05:17:15', '', 'bannermain', '', 'inherit', 'open', 'closed', '', 'bannermain', '', '', '2017-09-08 05:17:33', '2017-09-08 05:17:33', '', 46, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/bannermain.jpg', 6, 'attachment', 'image/jpeg', 0),
(49, 1, '2017-09-08 05:56:39', '2017-09-08 05:56:39', '"Life hits you hard. But it takes you three seconds to decide If you are a superhero or not. I am."', 'Testimonials', '', 'publish', 'open', 'open', '', 'testimonials', '', '', '2017-09-08 06:45:11', '2017-09-08 06:45:11', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?p=49', 6, 'post', '', 0),
(50, 1, '2017-09-08 05:56:39', '2017-09-08 05:56:39', '"Life hits you hard. But it takes you three seconds to decide \r\nIf you are a superhero or not. I am."', 'Testimonials', '', 'inherit', 'closed', 'closed', '', '49-revision-v1', '', '', '2017-09-08 05:56:39', '2017-09-08 05:56:39', '', 49, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/49-revision-v1/', 6, 'revision', '', 0),
(51, 1, '2017-09-08 05:57:16', '2017-09-08 05:57:16', '"Life hits you hard. But it takes you three seconds to decide If you are a superhero or not. I am."', 'Testimonials', '', 'publish', 'open', 'open', '', 'testimonials-2', '', '', '2017-09-08 06:44:46', '2017-09-08 06:44:46', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?p=51', 6, 'post', '', 0),
(52, 1, '2017-09-08 05:57:16', '2017-09-08 05:57:16', '"Life hits you hard. But it takes you three seconds to decide \r\nIf you are a superhero or not. I am."', 'Testimonials', '', 'inherit', 'closed', 'closed', '', '51-revision-v1', '', '', '2017-09-08 05:57:16', '2017-09-08 05:57:16', '', 51, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/51-revision-v1/', 6, 'revision', '', 0),
(53, 1, '2017-09-08 06:10:30', '2017-09-08 06:10:30', '"Life hits you hard. But it takes you three seconds to decide If you are a superhero or not. I am."', 'Akshay kumar', '', 'publish', 'open', 'open', '', 'akshay-kumar', '', '', '2017-09-08 06:13:19', '2017-09-08 06:13:19', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?p=53', 6, 'post', '', 0),
(54, 1, '2017-09-08 06:06:24', '2017-09-08 06:06:24', '', 'logo', '', 'inherit', 'open', 'closed', '', 'logo', '', '', '2017-09-08 06:06:24', '2017-09-08 06:06:24', '', 53, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/logo.png', 6, 'attachment', 'image/png', 0),
(55, 1, '2017-09-08 06:09:36', '2017-09-08 06:09:36', '', 's1', '', 'inherit', 'open', 'closed', '', 's1', '', '', '2017-09-08 06:09:36', '2017-09-08 06:09:36', '', 53, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/s1.jpg', 6, 'attachment', 'image/jpeg', 0),
(56, 1, '2017-09-08 06:09:38', '2017-09-08 06:09:38', '', 's2', '', 'inherit', 'open', 'closed', '', 's2', '', '', '2017-09-08 06:09:38', '2017-09-08 06:09:38', '', 53, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/s2.jpg', 6, 'attachment', 'image/jpeg', 0),
(57, 1, '2017-09-08 06:09:40', '2017-09-08 06:09:40', '', 's3', '', 'inherit', 'open', 'closed', '', 's3', '', '', '2017-09-08 06:09:40', '2017-09-08 06:09:40', '', 53, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/s3.jpg', 6, 'attachment', 'image/jpeg', 0),
(58, 1, '2017-09-08 06:09:41', '2017-09-08 06:09:41', '', 's4', '', 'inherit', 'open', 'closed', '', 's4', '', '', '2017-09-08 06:09:41', '2017-09-08 06:09:41', '', 53, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/s4.jpg', 6, 'attachment', 'image/jpeg', 0),
(59, 1, '2017-09-08 06:10:30', '2017-09-08 06:10:30', '"Life hits you hard. But it takes you three seconds to decide If you are a superhero or not. I am."', 'Lorem Ipsum Dolor', '', 'inherit', 'closed', 'closed', '', '53-revision-v1', '', '', '2017-09-08 06:10:30', '2017-09-08 06:10:30', '', 53, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/53-revision-v1/', 6, 'revision', '', 0),
(60, 1, '2017-09-08 06:13:19', '2017-09-08 06:13:19', '"Life hits you hard. But it takes you three seconds to decide If you are a superhero or not. I am."', 'Akshay kumar', '', 'inherit', 'closed', 'closed', '', '53-revision-v1', '', '', '2017-09-08 06:13:19', '2017-09-08 06:13:19', '', 53, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/53-revision-v1/', 6, 'revision', '', 0),
(61, 1, '2017-09-08 06:14:17', '2017-09-08 06:14:17', '"Life hits you hard. But it takes you three seconds to decide If you are a superhero or not. I am."', 'Tigar Shroff', '', 'publish', 'open', 'open', '', 'tigar-shroff', '', '', '2017-09-08 06:14:17', '2017-09-08 06:14:17', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?p=61', 6, 'post', '', 0),
(62, 1, '2017-09-08 06:14:17', '2017-09-08 06:14:17', '"Life hits you hard. But it takes you three seconds to decide If you are a superhero or not. I am."', 'Tigar Shroff', '', 'inherit', 'closed', 'closed', '', '61-revision-v1', '', '', '2017-09-08 06:14:17', '2017-09-08 06:14:17', '', 61, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/61-revision-v1/', 6, 'revision', '', 0),
(63, 1, '2017-09-08 06:15:18', '2017-09-08 06:15:18', '"Life hits you hard. But it takes you three seconds to decide If you are a superhero or not. I am."', 'Rina Roy', '', 'publish', 'open', 'open', '', 'rina-roy', '', '', '2017-09-08 06:26:34', '2017-09-08 06:26:34', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?p=63', 6, 'post', '', 0),
(64, 1, '2017-09-08 06:15:18', '2017-09-08 06:15:18', '"Life hits you hard. But it takes you three seconds to decide If you are a superhero or not. I am."', 'Rina Roy', '', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2017-09-08 06:15:18', '2017-09-08 06:15:18', '', 63, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/63-revision-v1/', 6, 'revision', '', 0),
(65, 1, '2017-09-08 06:24:25', '2017-09-08 06:24:25', '"Life hits you hard. But it takes you three seconds to decide If you are a superhero or not. I am.”\r\n', 'Mahesh Kumar', '', 'publish', 'open', 'open', '', 'mahesh-kumar', '', '', '2017-09-08 07:34:46', '2017-09-08 07:34:46', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?p=65', 6, 'post', '', 0),
(66, 1, '2017-09-08 06:24:25', '2017-09-08 06:24:25', '"Life hits you hard. But it takes you three seconds to decide If you are a superhero or not. I am.”\r\n', 'Mahesh Kumar', '', 'inherit', 'closed', 'closed', '', '65-revision-v1', '', '', '2017-09-08 06:24:25', '2017-09-08 06:24:25', '', 65, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/65-revision-v1/', 6, 'revision', '', 0),
(67, 1, '2017-09-08 06:32:00', '2017-09-08 06:32:00', '', 'Success Story', '', 'publish', 'closed', 'closed', '', 'success-story', '', '', '2017-09-08 06:32:00', '2017-09-08 06:32:00', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=67', 6, 'page', '', 0),
(68, 1, '2017-09-08 06:32:00', '2017-09-08 06:32:00', '', 'Success Story', '', 'inherit', 'closed', 'closed', '', '67-revision-v1', '', '', '2017-09-08 06:32:00', '2017-09-08 06:32:00', '', 67, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/67-revision-v1/', 6, 'revision', '', 0),
(69, 1, '2017-09-08 06:44:46', '2017-09-08 06:44:46', '"Life hits you hard. But it takes you three seconds to decide If you are a superhero or not. I am."', 'Testimonials', '', 'inherit', 'closed', 'closed', '', '51-revision-v1', '', '', '2017-09-08 06:44:46', '2017-09-08 06:44:46', '', 51, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/51-revision-v1/', 6, 'revision', '', 0),
(70, 1, '2017-09-08 06:45:11', '2017-09-08 06:45:11', '"Life hits you hard. But it takes you three seconds to decide If you are a superhero or not. I am."', 'Testimonials', '', 'inherit', 'closed', 'closed', '', '49-revision-v1', '', '', '2017-09-08 06:45:11', '2017-09-08 06:45:11', '', 49, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/49-revision-v1/', 6, 'revision', '', 0),
(71, 1, '2017-09-08 07:08:05', '2017-09-08 07:08:05', '<label> Your Name (required)\n    [text* your-name] </label>\n\n<label> Your Email (required)\n    [email* your-email] </label>\n\n<label> Subject\n    [text your-subject] </label>\n\n<label> Your Message\n    [textarea your-message] </label>\n\n[submit "Send"]\nGateway to Bollywood "[your-subject]"\n[your-name] <wordpress@projects.seawindsolution.com>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Gateway to Bollywood (http://projects.seawindsolution.com/five/gatewaytobollywood)\nchintan@seawindsolution.com\nReply-To: [your-email]\n\n0\n0\n\nGateway to Bollywood "[your-subject]"\nGateway to Bollywood <wordpress@projects.seawindsolution.com>\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Gateway to Bollywood (http://projects.seawindsolution.com/five/gatewaytobollywood)\n[your-email]\nReply-To: chintan@seawindsolution.com\n\n0\n0\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.', 'Contact form 1', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2017-09-08 07:08:05', '2017-09-08 07:08:05', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=wpcf7_contact_form&p=71', 6, 'wpcf7_contact_form', '', 0),
(72, 1, '2017-09-08 07:18:35', '2017-09-08 07:18:35', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Privacy Policy', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2017-09-08 07:18:35', '2017-09-08 07:18:35', '', 16, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/16-revision-v1/', 6, 'revision', '', 0),
(73, 1, '2017-09-08 07:18:40', '2017-09-08 07:18:40', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Privacy Policy', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2017-09-08 07:18:40', '2017-09-08 07:18:40', '', 16, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/16-revision-v1/', 6, 'revision', '', 0),
(74, 1, '2017-09-08 07:22:50', '2017-09-08 07:22:50', '1) If i want to participate for one or more career do i need to register again ?\n2) How will i get a chance once i get register for your  web portal ?\n3) Do you have any institute or Academy ?\n4) I am from Bihar, Do you people work for regional also ?\n5) Who all are associated with your orgranisation in bollywood ?</span>\n6) Do i need to pay anything else after this Rs 1200 ?           </span>', 'FAQ', '', 'inherit', 'closed', 'closed', '', '11-autosave-v1', '', '', '2017-09-08 07:22:50', '2017-09-08 07:22:50', '', 11, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/11-autosave-v1/', 6, 'revision', '', 0),
(75, 1, '2017-09-08 07:24:03', '2017-09-08 07:24:03', '1) If i want to participate for one or more career do i need to register again ?\r\n\r\n2) How will i get a chance once i get register for your  web portal ?\r\n\r\n3) Do you have any institute or Academy ?\r\n\r\n4) I am from Bihar, Do you people work for regional also ?\r\n\r\n5) Who all are associated with your orgranisation in bollywood ?\r\n\r\n6) Do i need to pay anything else after this Rs 1200 ?', 'FAQ', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2017-09-08 07:24:03', '2017-09-08 07:24:03', '', 11, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/11-revision-v1/', 6, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(76, 1, '2017-09-08 07:27:28', '2017-09-08 07:27:28', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Help', '', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2017-09-08 07:27:28', '2017-09-08 07:27:28', '', 20, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/20-revision-v1/', 6, 'revision', '', 0),
(77, 1, '2017-09-08 07:27:41', '2017-09-08 07:27:41', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'T&C', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2017-09-08 07:27:41', '2017-09-08 07:27:41', '', 18, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/18-revision-v1/', 6, 'revision', '', 0),
(78, 1, '2017-09-08 07:28:36', '2017-09-08 07:28:36', '<b>Gateway to Bollywood </b>\r\nGateway to bollywood is a talent hunt portal for all those aspiring people who wants to make their career in Bollywood.\r\n\r\nIt’s a open hunting for every career related to film industry.\r\n\r\nAnybody or everybody can register and be a part of " Gateway To Bollywood " Family.', 'About', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2017-09-08 07:28:36', '2017-09-08 07:28:36', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/6-revision-v1/', 6, 'revision', '', 0),
(79, 1, '2017-09-08 07:29:05', '2017-09-08 07:29:05', '<strong>Gateway to Bollywood </strong>\r\n\r\nGateway to bollywood is a talent hunt portal for all those aspiring people who wants to make their career in Bollywood.\r\n\r\nIt’s a open hunting for every career related to film industry.\r\n\r\nAnybody or everybody can register and be a part of " Gateway To Bollywood " Family.', 'About', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2017-09-08 07:29:05', '2017-09-08 07:29:05', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/6-revision-v1/', 6, 'revision', '', 0),
(80, 1, '2017-09-29 07:12:43', '2017-09-29 07:12:43', '<div class="col-md-7">\n<strong>Address</strong>\n25, Lorem Ipsum Dolor,\nLorem ipsum, \nLipsum Dolor - 000000.\n<br/>\n<strong>Email</strong> \n<a href="mailto:info@example.com">info@example.com</a>\n\n<strong>Call Us </strong> \n+91 99999 99999\n\n<br/>\n <!--<iframe  width="100%" height="400" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3672.585688481838!2d72.61665431454537!3d23.00225798496341!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e86742b6dc88f%3A0x759d5db9ab4771c4!2sSeawind+Solution+Pvt+Ltd!5e0!3m2!1sen!2sin!4v1481979184975" frameborder="0" style="border:0" allowfullscreen></iframe>-->\n<div style="width: 100%"><iframe width="100%" height="600" src="https://www.mapsdirections.info/en/custom-google-maps/map.php?width=100%&height=600&hl=ru&q=andheri%20mumbai+(Gateway%20to%20Bollywood)&ie=UTF8&t=&z=14&iwloc=A&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"><a href="https://www.mapsdirections.info/en/custom-google-maps/">Embed Google Map</a> by <a href="https://www.mapsdirections.info/en/">Measure area on map</a></iframe></div><br />\n</div>\n<div class="col-md-5">\n[vfb id=\'1\']\n</div>', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '22-autosave-v1', '', '', '2017-09-29 07:12:43', '2017-09-29 07:12:43', '', 22, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/22-autosave-v1/', 6, 'revision', '', 0),
(81, 1, '2017-09-08 07:58:58', '2017-09-08 07:58:58', '<div class="col-md-7">\r\n<strong>Address</strong>\r\n25, Lorem Ipsum Dolor,\r\nLorem ipsum, \r\nLipsum Dolor - 000000.\r\n\r\n<strong>Emial</strong> \r\n<a href="mailto:info@example.com">info#example.com</a>\r\n\r\n<strong>Call Us </strong> \r\n+91 99999 99999\r\n\r\n\r\n</div>\r\n<div class="col-md-5">\r\n[vfb id=\'1\']\r\n</div>', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2017-09-08 07:58:58', '2017-09-08 07:58:58', '', 22, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/22-revision-v1/', 6, 'revision', '', 0),
(82, 1, '2017-09-08 07:59:47', '2017-09-08 07:59:47', '<div class="col-md-7">\r\n<strong>Address</strong>\r\n25, Lorem Ipsum Dolor,\r\nLorem ipsum, \r\nLipsum Dolor - 000000.\r\n\r\n<strong>Emial</strong> \r\n<a href="mailto:info@example.com">info#example.com</a>\r\n\r\n<strong>Call Us </strong> \r\n+91 99999 99999\r\n\r\n<br/>\r\n <iframe  width="100%" height="350" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3672.585688481838!2d72.61665431454537!3d23.00225798496341!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e86742b6dc88f%3A0x759d5db9ab4771c4!2sSeawind+Solution+Pvt+Ltd!5e0!3m2!1sen!2sin!4v1481979184975" frameborder="0" style="border:0" allowfullscreen></iframe>	\r\n</div>\r\n<div class="col-md-5">\r\n[vfb id=\'1\']\r\n</div>', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2017-09-08 07:59:47', '2017-09-08 07:59:47', '', 22, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/22-revision-v1/', 6, 'revision', '', 0),
(83, 1, '2017-09-08 08:00:26', '2017-09-08 08:00:26', '<div class="col-md-7">\r\n<strong>Address</strong>\r\n25, Lorem Ipsum Dolor,\r\nLorem ipsum, \r\nLipsum Dolor - 000000.\r\n\r\n<strong>Email</strong> \r\n<a href="mailto:info@example.com">info#example.com</a>\r\n\r\n<strong>Call Us </strong> \r\n+91 99999 99999\r\n\r\n<br/>\r\n <iframe  width="100%" height="350" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3672.585688481838!2d72.61665431454537!3d23.00225798496341!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e86742b6dc88f%3A0x759d5db9ab4771c4!2sSeawind+Solution+Pvt+Ltd!5e0!3m2!1sen!2sin!4v1481979184975" frameborder="0" style="border:0" allowfullscreen></iframe>	\r\n</div>\r\n<div class="col-md-5">\r\n[vfb id=\'1\']\r\n</div>', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2017-09-08 08:00:26', '2017-09-08 08:00:26', '', 22, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/22-revision-v1/', 6, 'revision', '', 0),
(84, 1, '2017-09-08 08:00:44', '2017-09-08 08:00:44', '<div class="col-md-7">\r\n<strong>Address</strong>\r\n25, Lorem Ipsum Dolor,\r\nLorem ipsum, \r\nLipsum Dolor - 000000.\r\n\r\n<strong>Email</strong> \r\n<a href="mailto:info@example.com">info@example.com</a>\r\n\r\n<strong>Call Us </strong> \r\n+91 99999 99999\r\n\r\n<br/>\r\n <iframe  width="100%" height="350" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3672.585688481838!2d72.61665431454537!3d23.00225798496341!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e86742b6dc88f%3A0x759d5db9ab4771c4!2sSeawind+Solution+Pvt+Ltd!5e0!3m2!1sen!2sin!4v1481979184975" frameborder="0" style="border:0" allowfullscreen></iframe>	\r\n</div>\r\n<div class="col-md-5">\r\n[vfb id=\'1\']\r\n</div>', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2017-09-08 08:00:44', '2017-09-08 08:00:44', '', 22, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/22-revision-v1/', 6, 'revision', '', 0),
(85, 1, '2017-09-08 08:01:08', '2017-09-08 08:01:08', '<div class="col-md-7">\r\n<strong>Address</strong>\r\n25, Lorem Ipsum Dolor,\r\nLorem ipsum, \r\nLipsum Dolor - 000000.\r\n<br/>\r\n<strong>Email</strong> \r\n<a href="mailto:info@example.com">info@example.com</a>\r\n\r\n<strong>Call Us </strong> \r\n+91 99999 99999\r\n\r\n<br/>\r\n <iframe  width="100%" height="350" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3672.585688481838!2d72.61665431454537!3d23.00225798496341!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e86742b6dc88f%3A0x759d5db9ab4771c4!2sSeawind+Solution+Pvt+Ltd!5e0!3m2!1sen!2sin!4v1481979184975" frameborder="0" style="border:0" allowfullscreen></iframe>	\r\n</div>\r\n<div class="col-md-5">\r\n[vfb id=\'1\']\r\n</div>', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2017-09-08 08:01:08', '2017-09-08 08:01:08', '', 22, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/22-revision-v1/', 6, 'revision', '', 0),
(86, 1, '2017-09-08 08:01:35', '2017-09-08 08:01:35', '<div class="col-md-7">\r\n<strong>Address</strong>\r\n25, Lorem Ipsum Dolor,\r\nLorem ipsum, \r\nLipsum Dolor - 000000.\r\n<br/>\r\n<strong>Email</strong> \r\n<a href="mailto:info@example.com">info@example.com</a>\r\n\r\n<strong>Call Us </strong> \r\n+91 99999 99999\r\n\r\n<br/>\r\n <iframe  width="100%" height="400" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3672.585688481838!2d72.61665431454537!3d23.00225798496341!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e86742b6dc88f%3A0x759d5db9ab4771c4!2sSeawind+Solution+Pvt+Ltd!5e0!3m2!1sen!2sin!4v1481979184975" frameborder="0" style="border:0" allowfullscreen></iframe>	\r\n</div>\r\n<div class="col-md-5">\r\n[vfb id=\'1\']\r\n</div>', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2017-09-08 08:01:35', '2017-09-08 08:01:35', '', 22, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/22-revision-v1/', 6, 'revision', '', 0),
(87, 1, '2017-09-08 13:17:26', '2017-09-08 13:17:26', '', 'Actor', '', 'publish', 'closed', 'closed', '', 'actor', '', '', '2017-10-12 10:53:30', '2017-10-12 10:53:30', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=87', 1, 'category', '', 0),
(88, 1, '2017-09-08 13:17:11', '2017-09-08 13:17:11', '', 'Actor', '', 'inherit', 'open', 'closed', '', 'actor', '', '', '2017-09-08 13:17:11', '2017-09-08 13:17:11', '', 87, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/Actor.png', 6, 'attachment', 'image/png', 0),
(89, 1, '2017-09-08 13:17:26', '2017-09-08 13:17:26', '', 'Actor', '', 'inherit', 'closed', 'closed', '', '87-revision-v1', '', '', '2017-09-08 13:17:26', '2017-09-08 13:17:26', '', 87, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/87-revision-v1/', 6, 'revision', '', 0),
(90, 1, '2017-09-08 13:18:03', '2017-09-08 13:18:03', '', 'Director', '', 'publish', 'closed', 'closed', '', 'director', '', '', '2017-10-12 10:54:01', '2017-10-12 10:54:01', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=90', 2, 'category', '', 0),
(91, 1, '2017-09-08 13:17:53', '2017-09-08 13:17:53', '', 'images', '', 'inherit', 'open', 'closed', '', 'images', '', '', '2017-09-08 13:17:53', '2017-09-08 13:17:53', '', 90, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/images.png', 6, 'attachment', 'image/png', 0),
(92, 1, '2017-09-08 13:18:03', '2017-09-08 13:18:03', '', 'Director', '', 'inherit', 'closed', 'closed', '', '90-revision-v1', '', '', '2017-09-08 13:18:03', '2017-09-08 13:18:03', '', 90, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/08/90-revision-v1/', 6, 'revision', '', 0),
(93, 1, '2017-09-09 09:47:52', '2017-09-09 09:47:52', '[artist_profile_interests]', 'Profile Interests', '', 'publish', 'closed', 'closed', '', 'profile-interests', '', '', '2017-09-09 09:47:52', '2017-09-09 09:47:52', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=93', 6, 'page', '', 0),
(94, 1, '2017-09-09 09:47:52', '2017-09-09 09:47:52', '[artist_profile_interests]', 'Profile Interests', '', 'inherit', 'closed', 'closed', '', '93-revision-v1', '', '', '2017-09-09 09:47:52', '2017-09-09 09:47:52', '', 93, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/09/93-revision-v1/', 6, 'revision', '', 0),
(95, 1, '2017-09-09 09:48:27', '2017-09-09 09:48:27', '[artist_profile_experience]', 'Profile Experiences', '', 'publish', 'closed', 'closed', '', 'profile-experiences', '', '', '2017-09-09 09:48:27', '2017-09-09 09:48:27', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=95', 6, 'page', '', 0),
(96, 1, '2017-09-09 09:48:27', '2017-09-09 09:48:27', '[artist_profile_experience]', 'Profile Experiences', '', 'inherit', 'closed', 'closed', '', '95-revision-v1', '', '', '2017-09-09 09:48:27', '2017-09-09 09:48:27', '', 95, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/09/95-revision-v1/', 6, 'revision', '', 0),
(98, 1, '2017-09-09 09:58:10', '2017-09-09 09:58:10', '', 'Ad', '', 'publish', 'open', 'closed', '', 'ad', '', '', '2017-09-09 09:58:10', '2017-09-09 09:58:10', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=interest&#038;p=98', 6, 'interest', '', 0),
(99, 1, '2017-09-09 09:58:10', '2017-09-09 09:58:10', '', 'Ad', '', 'inherit', 'closed', 'closed', '', '98-revision-v1', '', '', '2017-09-09 09:58:10', '2017-09-09 09:58:10', '', 98, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/09/98-revision-v1/', 6, 'revision', '', 0),
(100, 1, '2017-09-09 09:58:26', '2017-09-09 09:58:26', '', 'Films', '', 'publish', 'open', 'closed', '', 'films', '', '', '2017-09-09 09:58:26', '2017-09-09 09:58:26', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=interest&#038;p=100', 6, 'interest', '', 0),
(101, 1, '2017-09-09 09:58:26', '2017-09-09 09:58:26', '', 'Films', '', 'inherit', 'closed', 'closed', '', '100-revision-v1', '', '', '2017-09-09 09:58:26', '2017-09-09 09:58:26', '', 100, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/09/100-revision-v1/', 6, 'revision', '', 0),
(102, 1, '2017-09-09 09:59:00', '2017-09-09 09:59:00', '', 'Digital', '', 'publish', 'open', 'closed', '', 'digital', '', '', '2017-09-09 09:59:00', '2017-09-09 09:59:00', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=interest&#038;p=102', 6, 'interest', '', 0),
(103, 1, '2017-09-09 09:59:00', '2017-09-09 09:59:00', '', 'Digital', '', 'inherit', 'closed', 'closed', '', '102-revision-v1', '', '', '2017-09-09 09:59:00', '2017-09-09 09:59:00', '', 102, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/09/102-revision-v1/', 6, 'revision', '', 0),
(104, 1, '2017-09-09 09:59:21', '2017-09-09 09:59:21', '', 'Print Shoot', '', 'publish', 'open', 'closed', '', 'print-shoot', '', '', '2017-09-09 09:59:21', '2017-09-09 09:59:21', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=interest&#038;p=104', 6, 'interest', '', 0),
(105, 1, '2017-09-09 09:59:21', '2017-09-09 09:59:21', '', 'Print Shoot', '', 'inherit', 'closed', 'closed', '', '104-revision-v1', '', '', '2017-09-09 09:59:21', '2017-09-09 09:59:21', '', 104, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/09/104-revision-v1/', 6, 'revision', '', 0),
(106, 1, '2017-09-09 09:59:48', '2017-09-09 09:59:48', '', 'Fashion', '', 'publish', 'open', 'closed', '', 'fashion', '', '', '2017-09-09 09:59:48', '2017-09-09 09:59:48', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=interest&#038;p=106', 6, 'interest', '', 0),
(107, 1, '2017-09-09 09:59:48', '2017-09-09 09:59:48', '', 'Fashion', '', 'inherit', 'closed', 'closed', '', '106-revision-v1', '', '', '2017-09-09 09:59:48', '2017-09-09 09:59:48', '', 106, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/09/106-revision-v1/', 6, 'revision', '', 0),
(108, 1, '2017-09-09 10:00:07', '2017-09-09 10:00:07', '', 'Web Series', '', 'publish', 'open', 'closed', '', 'web-series', '', '', '2017-09-09 10:00:07', '2017-09-09 10:00:07', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=interest&#038;p=108', 6, 'interest', '', 0),
(109, 1, '2017-09-09 10:00:07', '2017-09-09 10:00:07', '', 'Web Series', '', 'inherit', 'closed', 'closed', '', '108-revision-v1', '', '', '2017-09-09 10:00:07', '2017-09-09 10:00:07', '', 108, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/09/108-revision-v1/', 6, 'revision', '', 0),
(110, 1, '2017-09-09 10:00:23', '2017-09-09 10:00:23', '', 'TV', '', 'publish', 'open', 'closed', '', 'tv', '', '', '2017-09-09 10:00:23', '2017-09-09 10:00:23', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=interest&#038;p=110', 6, 'interest', '', 0),
(111, 1, '2017-09-09 10:00:23', '2017-09-09 10:00:23', '', 'TV', '', 'inherit', 'closed', 'closed', '', '110-revision-v1', '', '', '2017-09-09 10:00:23', '2017-09-09 10:00:23', '', 110, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/09/110-revision-v1/', 6, 'revision', '', 0),
(113, 1, '2017-09-09 12:56:41', '2017-09-09 12:56:41', '', 'Talents', '', 'publish', 'closed', 'closed', '', 'talents', '', '', '2017-09-11 12:52:59', '2017-09-11 12:52:59', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=113', 6, 'page', '', 0),
(114, 1, '2017-09-09 12:56:41', '2017-09-09 12:56:41', '', 'Talents', '', 'inherit', 'closed', 'closed', '', '113-revision-v1', '', '', '2017-09-09 12:56:41', '2017-09-09 12:56:41', '', 113, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/09/113-revision-v1/', 6, 'revision', '', 0),
(115, 1, '2017-09-09 12:57:11', '2017-09-09 12:57:11', ' ', '', '', 'publish', 'closed', 'closed', '', '115', '', '', '2017-09-20 10:57:31', '2017-09-20 10:57:31', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?p=115', 3, 'nav_menu_item', '', 0),
(116, 1, '2017-09-11 11:48:06', '2017-09-11 11:48:06', '[upg-list]', 'User\'s Post Gallery', '', 'publish', 'closed', 'closed', '', 'users-post-gallery', '', '', '2017-09-11 11:48:06', '2017-09-11 11:48:06', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/users-post-gallery/', 6, 'page', '', 0),
(117, 1, '2017-09-11 11:48:06', '2017-09-11 11:48:06', '[upg-post type="image"]', 'Post Image', '', 'publish', 'closed', 'closed', '', 'post-image', '', '', '2017-09-11 11:48:06', '2017-09-11 11:48:06', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/post-image/', 6, 'page', '', 0),
(118, 1, '2017-09-11 11:48:06', '2017-09-11 11:48:06', '[upg-post type="youtube"]', 'Post Youtube Video', '', 'publish', 'closed', 'closed', '', 'post-youtube-video', '', '', '2017-09-11 11:48:06', '2017-09-11 11:48:06', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/post-youtube-video/', 6, 'page', '', 0),
(119, 2, '2017-09-11 12:30:01', '2017-09-11 12:30:01', 'No Information', 'chry', '', 'publish', 'open', 'closed', '', 'chry', '', '', '2017-09-11 12:30:01', '2017-09-11 12:30:01', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/upg/uncategorized/chry/', 6, 'upg', '', 0),
(120, 2, '2017-09-11 12:30:02', '2017-09-11 12:30:02', '', 'Chrysanthemum', '', 'inherit', 'open', 'closed', '', 'chrysanthemum', '', '', '2017-09-11 12:30:02', '2017-09-11 12:30:02', '', 119, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/Chrysanthemum.jpg', 6, 'attachment', 'image/jpeg', 0),
(121, 2, '2017-09-11 12:32:01', '2017-09-11 12:32:01', 'No Information', 'My video', '', 'publish', 'open', 'closed', '', 'my-video', '', '', '2017-09-11 12:32:01', '2017-09-11 12:32:01', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/upg/uncategorized/my-video/', 6, 'upg', '', 0),
(122, 1, '2017-09-11 12:50:04', '2017-09-11 12:50:04', '<input type="hidden" name="owner-mail" id="owner-mail" value="chintan@seawindsolution.com" />\r\n<label> Your Name (required)\r\n    [text* your-name] </label>\r\n\r\n<label> Your Email (required)\r\n    [email* your-email] </label>\r\n\r\n<label> Subject\r\n    [text your-subject] </label>\r\n\r\n<label> Your Message\r\n    [textarea your-message] </label>\r\n\r\n[dynamichidden email-author "chintan@seawindsolution.com"]\r\n\r\n[submit "Send"]\n1\nGateway to Bollywood "[your-subject]"\n[your-name] <wordpress@projects.seawindsolution.com>\n[email-author]\nFrom: [your-name] <[your-email]>\r\nSubject: [your-subject]\r\n\r\nMessage Body:\r\n[your-message]\r\n\r\n-- \r\nThis e-mail was sent from a contact form on Gateway to Bollywood (http://projects.seawindsolution.com/five/gatewaytobollywood)\nReply-To: [your-email]\n\n\n\n\nGateway to Bollywood "[your-subject]"\nGateway to Bollywood <wordpress@projects.seawindsolution.com>\n[your-email]\nMessage Body:\r\n[your-message]\r\n\r\n-- \r\nThis e-mail was sent from a contact form on Gateway to Bollywood (http://projects.seawindsolution.com/five/gatewaytobollywood)\nReply-To: chintan@seawindsolution.com\n\n\n\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.\nThe date format is incorrect.\nThe date is before the earliest one allowed.\nThe date is after the latest one allowed.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe file is too big.\nThere was an error uploading the file.\nThe number format is invalid.\nThe number is smaller than the minimum allowed.\nThe number is larger than the maximum allowed.\nThe answer to the quiz is incorrect.\nYour entered code is incorrect.\nThe e-mail address entered is invalid.\nThe URL is invalid.\nThe telephone number is invalid.', 'Contact form 1_copy', '', 'publish', 'closed', 'closed', '', 'contact-form-1_copy', '', '', '2017-09-13 06:24:37', '2017-09-13 06:24:37', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=wpcf7_contact_form&#038;p=122', 6, 'wpcf7_contact_form', '', 0),
(123, 1, '2017-09-13 11:48:19', '2017-09-13 11:48:19', '', 'Gateway bolywood', '', 'publish', 'closed', 'closed', '', 'gateway-bolywood', '', '', '2017-09-13 11:54:28', '2017-09-13 11:54:28', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=slide&#038;p=123', 6, 'slide', '', 0),
(124, 1, '2017-09-13 11:47:52', '2017-09-13 11:47:52', '', 'Gateway Bolywood', '', 'inherit', 'open', 'closed', '', 'slider-2', '', '', '2017-09-13 11:48:16', '2017-09-13 11:48:16', '', 123, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/slider.jpg', 6, 'attachment', 'image/jpeg', 0),
(125, 1, '2017-09-13 11:54:21', '2017-09-13 11:54:21', '', 'slider', '', 'inherit', 'open', 'closed', '', 'slider-3', '', '', '2017-09-13 11:54:21', '2017-09-13 11:54:21', '', 123, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/slider-1.jpg', 6, 'attachment', 'image/jpeg', 0),
(127, 1, '2017-09-13 12:47:06', '2017-09-13 12:47:06', '', 'Assistant Director', '', 'publish', 'closed', 'closed', '', 'assistant-director', '', '', '2017-09-13 12:47:06', '2017-09-13 12:47:06', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=127', 6, 'category', '', 0),
(128, 1, '2017-09-13 12:47:00', '2017-09-13 12:47:00', '', '11', '', 'inherit', 'open', 'closed', '', '11', '', '', '2017-09-13 12:47:00', '2017-09-13 12:47:00', '', 127, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/11.png', 6, 'attachment', 'image/png', 0),
(129, 1, '2017-09-13 12:47:06', '2017-09-13 12:47:06', '', 'Assistant Director', '', 'inherit', 'closed', 'closed', '', '127-revision-v1', '', '', '2017-09-13 12:47:06', '2017-09-13 12:47:06', '', 127, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/13/127-revision-v1/', 6, 'revision', '', 0),
(130, 1, '2017-09-13 12:47:40', '2017-09-13 12:47:40', '', 'Composer', '', 'publish', 'closed', 'closed', '', 'composer', '', '', '2017-09-13 12:47:40', '2017-09-13 12:47:40', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=130', 6, 'category', '', 0),
(131, 1, '2017-09-13 12:47:35', '2017-09-13 12:47:35', '', '2', '', 'inherit', 'open', 'closed', '', '2', '', '', '2017-09-13 12:47:35', '2017-09-13 12:47:35', '', 130, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/2.png', 6, 'attachment', 'image/png', 0),
(132, 1, '2017-09-13 12:47:40', '2017-09-13 12:47:40', '', 'Composer', '', 'inherit', 'closed', 'closed', '', '130-revision-v1', '', '', '2017-09-13 12:47:40', '2017-09-13 12:47:40', '', 130, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/13/130-revision-v1/', 6, 'revision', '', 0),
(133, 1, '2017-09-13 12:48:27', '2017-09-13 12:48:27', '', 'Art Director', '', 'publish', 'closed', 'closed', '', 'art-director', '', '', '2017-09-13 12:48:27', '2017-09-13 12:48:27', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=133', 6, 'category', '', 0),
(134, 1, '2017-09-13 12:48:23', '2017-09-13 12:48:23', '', '8', '', 'inherit', 'open', 'closed', '', '8', '', '', '2017-09-13 12:48:23', '2017-09-13 12:48:23', '', 133, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/8.png', 6, 'attachment', 'image/png', 0),
(135, 1, '2017-09-13 12:48:27', '2017-09-13 12:48:27', '', 'Art Director', '', 'inherit', 'closed', 'closed', '', '133-revision-v1', '', '', '2017-09-13 12:48:27', '2017-09-13 12:48:27', '', 133, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/13/133-revision-v1/', 6, 'revision', '', 0),
(136, 1, '2017-09-13 12:49:01', '2017-09-13 12:49:01', '', 'Dancer', '', 'publish', 'closed', 'closed', '', 'dancer', '', '', '2017-10-12 10:55:40', '2017-10-12 10:55:40', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=136', 5, 'category', '', 0),
(137, 1, '2017-09-13 12:48:52', '2017-09-13 12:48:52', '', '6', '', 'inherit', 'open', 'closed', '', '6', '', '', '2017-09-13 12:48:52', '2017-09-13 12:48:52', '', 136, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/6.png', 6, 'attachment', 'image/png', 0),
(138, 1, '2017-09-13 12:49:01', '2017-09-13 12:49:01', '', 'Dancer', '', 'inherit', 'closed', 'closed', '', '136-revision-v1', '', '', '2017-09-13 12:49:01', '2017-09-13 12:49:01', '', 136, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/13/136-revision-v1/', 6, 'revision', '', 0),
(139, 1, '2017-09-13 12:50:32', '2017-09-13 12:50:32', '', 'Model', '', 'publish', 'closed', 'closed', '', 'model', '', '', '2017-10-12 10:54:38', '2017-10-12 10:54:38', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=139', 3, 'category', '', 0),
(140, 1, '2017-09-13 12:50:27', '2017-09-13 12:50:27', '', '3', '', 'inherit', 'open', 'closed', '', '3', '', '', '2017-09-13 12:50:27', '2017-09-13 12:50:27', '', 139, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/3.png', 6, 'attachment', 'image/png', 0),
(141, 1, '2017-09-13 12:50:32', '2017-09-13 12:50:32', '', 'Model', '', 'inherit', 'closed', 'closed', '', '139-revision-v1', '', '', '2017-09-13 12:50:32', '2017-09-13 12:50:32', '', 139, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/13/139-revision-v1/', 6, 'revision', '', 0),
(143, 1, '2017-09-19 09:25:35', '2017-09-19 09:25:35', '', 'Recruiter Dashboard', '', 'publish', 'closed', 'closed', '', 'recruiter-dashboard', '', '', '2017-09-19 09:25:35', '2017-09-19 09:25:35', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=143', 6, 'page', '', 0),
(144, 1, '2017-09-19 09:25:35', '2017-09-19 09:25:35', '', 'Recruiter Dashboard', '', 'inherit', 'closed', 'closed', '', '143-revision-v1', '', '', '2017-09-19 09:25:35', '2017-09-19 09:25:35', '', 143, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/19/143-revision-v1/', 6, 'revision', '', 0),
(145, 1, '2017-09-19 09:26:27', '2017-09-19 09:26:27', '', 'Recruiter Jobs', '', 'publish', 'closed', 'closed', '', 'recruiter-jobs', '', '', '2017-09-19 09:26:27', '2017-09-19 09:26:27', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=145', 6, 'page', '', 0),
(146, 1, '2017-09-19 09:26:27', '2017-09-19 09:26:27', '', 'Recruiter Jobs', '', 'inherit', 'closed', 'closed', '', '145-revision-v1', '', '', '2017-09-19 09:26:27', '2017-09-19 09:26:27', '', 145, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/19/145-revision-v1/', 6, 'revision', '', 0),
(147, 1, '2017-09-19 09:27:26', '2017-09-19 09:27:26', '', 'Job Form', '', 'publish', 'closed', 'closed', '', 'job-form', '', '', '2017-09-19 09:27:26', '2017-09-19 09:27:26', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=147', 6, 'page', '', 0),
(148, 1, '2017-09-19 09:27:26', '2017-09-19 09:27:26', '', 'Job Form', '', 'inherit', 'closed', 'closed', '', '147-revision-v1', '', '', '2017-09-19 09:27:26', '2017-09-19 09:27:26', '', 147, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/19/147-revision-v1/', 6, 'revision', '', 0),
(149, 1, '2017-09-20 10:57:01', '2017-09-20 10:57:01', '', 'Trending Jobs', '', 'publish', 'closed', 'closed', '', 'trending-jobs', '', '', '2017-09-20 10:57:01', '2017-09-20 10:57:01', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=149', 6, 'page', '', 0),
(150, 1, '2017-09-20 10:57:01', '2017-09-20 10:57:01', '', 'Trending Jobs', '', 'inherit', 'closed', 'closed', '', '149-revision-v1', '', '', '2017-09-20 10:57:01', '2017-09-20 10:57:01', '', 149, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/20/149-revision-v1/', 6, 'revision', '', 0),
(151, 1, '2017-09-20 10:57:32', '2017-09-20 10:57:32', ' ', '', '', 'publish', 'closed', 'closed', '', '151', '', '', '2017-09-20 10:57:32', '2017-09-20 10:57:32', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?p=151', 4, 'nav_menu_item', '', 0),
(152, 1, '2017-09-21 07:19:34', '2017-09-21 07:19:34', '', 'Artist Dashboard', '', 'publish', 'closed', 'closed', '', 'artist-dashboard', '', '', '2017-09-21 07:19:34', '2017-09-21 07:19:34', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=152', 6, 'page', '', 0),
(153, 1, '2017-09-21 07:19:34', '2017-09-21 07:19:34', '', 'Artist Dashboard', '', 'inherit', 'closed', 'closed', '', '152-revision-v1', '', '', '2017-09-21 07:19:34', '2017-09-21 07:19:34', '', 152, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/21/152-revision-v1/', 6, 'revision', '', 0),
(154, 1, '2017-09-21 07:20:06', '2017-09-21 07:20:06', '', 'Artist Jobs', '', 'publish', 'closed', 'closed', '', 'artist-jobs', '', '', '2017-09-21 07:20:06', '2017-09-21 07:20:06', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=154', 6, 'page', '', 0),
(155, 1, '2017-09-21 07:20:06', '2017-09-21 07:20:06', '', 'Artist Jobs', '', 'inherit', 'closed', 'closed', '', '154-revision-v1', '', '', '2017-09-21 07:20:06', '2017-09-21 07:20:06', '', 154, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/21/154-revision-v1/', 6, 'revision', '', 0),
(158, 1, '2017-09-21 09:24:21', '2017-09-21 09:24:21', '', 'My Applicants', '', 'publish', 'closed', 'closed', '', 'my-applicants', '', '', '2017-09-21 09:24:21', '2017-09-21 09:24:21', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=158', 6, 'page', '', 0),
(159, 1, '2017-09-21 09:24:21', '2017-09-21 09:24:21', '', 'My Applicants', '', 'inherit', 'closed', 'closed', '', '158-revision-v1', '', '', '2017-09-21 09:24:21', '2017-09-21 09:24:21', '', 158, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/21/158-revision-v1/', 6, 'revision', '', 0),
(162, 1, '2017-09-22 08:09:52', '2017-09-22 08:09:52', '[artist_lostpassword]', 'Lost Password ?', '', 'publish', 'closed', 'closed', '', 'lostpassword', '', '', '2017-09-22 08:10:05', '2017-09-22 08:10:05', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=162', 6, 'page', '', 0),
(163, 1, '2017-09-22 08:09:52', '2017-09-22 08:09:52', '[artist_lostpassword]', 'lostpassword', '', 'inherit', 'closed', 'closed', '', '162-revision-v1', '', '', '2017-09-22 08:09:52', '2017-09-22 08:09:52', '', 162, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/22/162-revision-v1/', 6, 'revision', '', 0),
(164, 1, '2017-09-22 08:10:05', '2017-09-22 08:10:05', '[artist_lostpassword]', 'Lost Password ?', '', 'inherit', 'closed', 'closed', '', '162-revision-v1', '', '', '2017-09-22 08:10:05', '2017-09-22 08:10:05', '', 162, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/22/162-revision-v1/', 6, 'revision', '', 0),
(165, 1, '2017-09-22 10:02:44', '2017-09-22 10:02:44', '[artist_resetpassword]', 'Reset Your Password', '', 'publish', 'closed', 'closed', '', 'resetpassword', '', '', '2017-09-22 10:02:52', '2017-09-22 10:02:52', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=165', 6, 'page', '', 0),
(166, 1, '2017-09-22 10:02:44', '2017-09-22 10:02:44', '[artist_resetpassword]', 'resetpassword', '', 'inherit', 'closed', 'closed', '', '165-revision-v1', '', '', '2017-09-22 10:02:44', '2017-09-22 10:02:44', '', 165, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/22/165-revision-v1/', 6, 'revision', '', 0),
(167, 1, '2017-09-22 10:02:52', '2017-09-22 10:02:52', '[artist_resetpassword]', 'Reset Your Password', '', 'inherit', 'closed', 'closed', '', '165-revision-v1', '', '', '2017-09-22 10:02:52', '2017-09-22 10:02:52', '', 165, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/22/165-revision-v1/', 6, 'revision', '', 0),
(168, 1, '2017-09-22 10:52:18', '0000-00-00 00:00:00', '', 'Change Password', '', 'draft', 'closed', 'closed', '', '', '', '', '2017-09-22 10:52:18', '2017-09-22 10:52:18', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=168', 6, 'page', '', 0),
(169, 1, '2017-09-22 10:52:55', '2017-09-22 10:52:55', '', 'Change Password', '', 'publish', 'closed', 'closed', '', 'change-password', '', '', '2017-09-22 10:53:04', '2017-09-22 10:53:04', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=169', 6, 'page', '', 0),
(170, 1, '2017-09-22 10:52:55', '2017-09-22 10:52:55', '', 'Change Password', '', 'inherit', 'closed', 'closed', '', '169-revision-v1', '', '', '2017-09-22 10:52:55', '2017-09-22 10:52:55', '', 169, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/22/169-revision-v1/', 6, 'revision', '', 0),
(171, 1, '2017-09-26 12:30:46', '2017-09-26 12:30:46', '', 'Singer', '', 'publish', 'closed', 'closed', '', 'singer', '', '', '2017-10-12 10:55:08', '2017-10-12 10:55:08', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=171', 4, 'category', '', 0),
(172, 1, '2017-09-26 12:30:37', '2017-09-26 12:30:37', '', 'Male-VO-Icon-300x300', '', 'inherit', 'open', 'closed', '', 'male-vo-icon-300x300', '', '', '2017-09-26 12:30:37', '2017-09-26 12:30:37', '', 171, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/Male-VO-Icon-300x300.jpg', 6, 'attachment', 'image/jpeg', 0),
(173, 1, '2017-09-26 12:30:46', '2017-09-26 12:30:46', '', 'Singer', '', 'inherit', 'closed', 'closed', '', '171-revision-v1', '', '', '2017-09-26 12:30:46', '2017-09-26 12:30:46', '', 171, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/26/171-revision-v1/', 6, 'revision', '', 0),
(175, 1, '2017-09-26 13:08:24', '2017-09-26 13:08:24', '', 'DJ', '', 'publish', 'closed', 'closed', '', 'dj', '', '', '2017-09-26 13:08:24', '2017-09-26 13:08:24', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=175', 6, 'category', '', 0),
(176, 1, '2017-09-26 13:08:18', '2017-09-26 13:08:18', '', 'dj', '', 'inherit', 'open', 'closed', '', 'dj', '', '', '2017-09-26 13:08:18', '2017-09-26 13:08:18', '', 175, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/dj.png', 6, 'attachment', 'image/png', 0),
(177, 1, '2017-09-26 13:08:24', '2017-09-26 13:08:24', '', 'DJ', '', 'inherit', 'closed', 'closed', '', '175-revision-v1', '', '', '2017-09-26 13:08:24', '2017-09-26 13:08:24', '', 175, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/26/175-revision-v1/', 6, 'revision', '', 0),
(178, 1, '2017-09-26 13:08:56', '2017-09-26 13:08:56', '', 'Lyricist', '', 'publish', 'closed', 'closed', '', 'lyricist', '', '', '2017-09-26 13:08:56', '2017-09-26 13:08:56', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=178', 6, 'category', '', 0),
(179, 1, '2017-09-26 13:08:49', '2017-09-26 13:08:49', '', 'lyrics', '', 'inherit', 'open', 'closed', '', 'lyrics', '', '', '2017-09-26 13:08:49', '2017-09-26 13:08:49', '', 178, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/lyrics.png', 6, 'attachment', 'image/png', 0),
(180, 1, '2017-09-26 13:08:56', '2017-09-26 13:08:56', '', 'Lyricist', '', 'inherit', 'closed', 'closed', '', '178-revision-v1', '', '', '2017-09-26 13:08:56', '2017-09-26 13:08:56', '', 178, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/26/178-revision-v1/', 6, 'revision', '', 0),
(181, 1, '2017-09-26 13:09:34', '2017-09-26 13:09:34', '', 'Editor', '', 'publish', 'closed', 'closed', '', 'editor', '', '', '2017-09-26 13:09:34', '2017-09-26 13:09:34', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=181', 6, 'category', '', 0),
(182, 1, '2017-09-26 13:09:27', '2017-09-26 13:09:27', '', 'Editor', '', 'inherit', 'open', 'closed', '', 'editor', '', '', '2017-09-26 13:09:27', '2017-09-26 13:09:27', '', 181, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/Editor.png', 6, 'attachment', 'image/png', 0),
(183, 1, '2017-09-26 13:09:34', '2017-09-26 13:09:34', '', 'Editor', '', 'inherit', 'closed', 'closed', '', '181-revision-v1', '', '', '2017-09-26 13:09:34', '2017-09-26 13:09:34', '', 181, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/26/181-revision-v1/', 6, 'revision', '', 0),
(184, 1, '2017-09-26 13:10:37', '2017-09-26 13:10:37', '', 'Voice over artist', '', 'publish', 'closed', 'closed', '', 'voice-over-artist', '', '', '2017-09-26 13:10:37', '2017-09-26 13:10:37', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=184', 6, 'category', '', 0),
(185, 1, '2017-09-26 13:10:29', '2017-09-26 13:10:29', '', 'voiceoverartist', '', 'inherit', 'open', 'closed', '', 'voiceoverartist', '', '', '2017-09-26 13:10:29', '2017-09-26 13:10:29', '', 184, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/voiceoverartist.png', 6, 'attachment', 'image/png', 0),
(186, 1, '2017-09-26 13:10:37', '2017-09-26 13:10:37', '', 'Voice over artist', '', 'inherit', 'closed', 'closed', '', '184-revision-v1', '', '', '2017-09-26 13:10:37', '2017-09-26 13:10:37', '', 184, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/26/184-revision-v1/', 6, 'revision', '', 0),
(187, 1, '2017-09-26 13:13:07', '2017-09-26 13:13:07', '', 'Sound engineer', '', 'trash', 'closed', 'closed', '', 'sound-engineer__trashed', '', '', '2017-09-26 13:13:32', '2017-09-26 13:13:32', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=187', 6, 'category', '', 0),
(188, 1, '2017-09-26 13:13:07', '2017-09-26 13:13:07', '', 'Sound engineer', '', 'inherit', 'closed', 'closed', '', '187-revision-v1', '', '', '2017-09-26 13:13:07', '2017-09-26 13:13:07', '', 187, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/26/187-revision-v1/', 6, 'revision', '', 0),
(189, 1, '2017-09-27 04:16:09', '2017-09-27 04:16:09', '', 'Sound engineer', '', 'publish', 'closed', 'closed', '', 'sound-engineer', '', '', '2017-09-27 04:16:09', '2017-09-27 04:16:09', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=189', 6, 'category', '', 0),
(190, 1, '2017-09-27 04:16:02', '2017-09-27 04:16:02', '', 'soundengineer', '', 'inherit', 'open', 'closed', '', 'soundengineer', '', '', '2017-09-27 04:16:02', '2017-09-27 04:16:02', '', 189, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/soundengineer.png', 6, 'attachment', 'image/png', 0),
(191, 1, '2017-09-27 04:16:09', '2017-09-27 04:16:09', '', 'Sound engineer', '', 'inherit', 'closed', 'closed', '', '189-revision-v1', '', '', '2017-09-27 04:16:09', '2017-09-27 04:16:09', '', 189, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/27/189-revision-v1/', 6, 'revision', '', 0),
(192, 1, '2017-09-27 04:16:57', '2017-09-27 04:16:57', '', 'Sound recordist', '', 'publish', 'closed', 'closed', '', 'sound-recordist', '', '', '2017-09-27 04:16:57', '2017-09-27 04:16:57', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=192', 6, 'category', '', 0),
(193, 1, '2017-09-27 04:16:49', '2017-09-27 04:16:49', '', 'soundrecord', '', 'inherit', 'open', 'closed', '', 'soundrecord', '', '', '2017-09-27 04:16:49', '2017-09-27 04:16:49', '', 192, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/soundrecord.png', 6, 'attachment', 'image/png', 0),
(194, 1, '2017-09-27 04:16:57', '2017-09-27 04:16:57', '', 'Sound recordist', '', 'inherit', 'closed', 'closed', '', '192-revision-v1', '', '', '2017-09-27 04:16:57', '2017-09-27 04:16:57', '', 192, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/27/192-revision-v1/', 6, 'revision', '', 0),
(195, 1, '2017-09-27 04:17:27', '2017-09-27 04:17:27', '', 'Standup Comedian', '', 'publish', 'closed', 'closed', '', 'standup-comedian', '', '', '2017-09-27 04:17:27', '2017-09-27 04:17:27', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=195', 6, 'category', '', 0),
(196, 1, '2017-09-27 04:17:19', '2017-09-27 04:17:19', '', 'comedian', '', 'inherit', 'open', 'closed', '', 'comedian', '', '', '2017-09-27 04:17:19', '2017-09-27 04:17:19', '', 195, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/comedian.png', 6, 'attachment', 'image/png', 0),
(197, 1, '2017-09-27 04:17:27', '2017-09-27 04:17:27', '', 'Standup Comedian', '', 'inherit', 'closed', 'closed', '', '195-revision-v1', '', '', '2017-09-27 04:17:27', '2017-09-27 04:17:27', '', 195, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/27/195-revision-v1/', 6, 'revision', '', 0),
(198, 1, '2017-09-27 04:18:05', '2017-09-27 04:18:05', '', 'Stunt Director', '', 'publish', 'closed', 'closed', '', 'stunt-director', '', '', '2017-09-27 04:18:05', '2017-09-27 04:18:05', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=198', 6, 'category', '', 0),
(199, 1, '2017-09-27 04:17:59', '2017-09-27 04:17:59', '', 'stunt', '', 'inherit', 'open', 'closed', '', 'stunt', '', '', '2017-09-27 04:17:59', '2017-09-27 04:17:59', '', 198, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/stunt.png', 6, 'attachment', 'image/png', 0),
(200, 1, '2017-09-27 04:18:05', '2017-09-27 04:18:05', '', 'Stunt Director', '', 'inherit', 'closed', 'closed', '', '198-revision-v1', '', '', '2017-09-27 04:18:05', '2017-09-27 04:18:05', '', 198, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/27/198-revision-v1/', 6, 'revision', '', 0),
(201, 1, '2017-09-27 04:18:51', '2017-09-27 04:18:51', '', 'Choreographer', '', 'publish', 'closed', 'closed', '', 'choreographer', '', '', '2017-09-27 04:18:51', '2017-09-27 04:18:51', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=201', 6, 'category', '', 0),
(202, 1, '2017-09-27 04:18:33', '2017-09-27 04:18:33', '', 'Choreographer', '', 'inherit', 'open', 'closed', '', 'choreographer', '', '', '2017-09-27 04:18:33', '2017-09-27 04:18:33', '', 201, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/Choreographer.png', 6, 'attachment', 'image/png', 0),
(203, 1, '2017-09-27 04:18:51', '2017-09-27 04:18:51', '', 'Choreographer', '', 'inherit', 'closed', 'closed', '', '201-revision-v1', '', '', '2017-09-27 04:18:51', '2017-09-27 04:18:51', '', 201, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/27/201-revision-v1/', 6, 'revision', '', 0),
(204, 1, '2017-09-27 04:20:52', '2017-09-27 04:20:52', '', 'Makeup and Hair', '', 'publish', 'closed', 'closed', '', 'makeup-and-hair', '', '', '2017-09-27 04:20:52', '2017-09-27 04:20:52', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=204', 6, 'category', '', 0),
(205, 1, '2017-09-27 04:20:46', '2017-09-27 04:20:46', '', 'hairstyle', '', 'inherit', 'open', 'closed', '', 'hairstyle', '', '', '2017-09-27 04:20:46', '2017-09-27 04:20:46', '', 204, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/hairstyle.png', 6, 'attachment', 'image/png', 0),
(206, 1, '2017-09-27 04:20:52', '2017-09-27 04:20:52', '', 'Makeup and Hair', '', 'inherit', 'closed', 'closed', '', '204-revision-v1', '', '', '2017-09-27 04:20:52', '2017-09-27 04:20:52', '', 204, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/27/204-revision-v1/', 6, 'revision', '', 0),
(207, 1, '2017-09-27 04:23:17', '2017-09-27 04:23:17', '', 'Fashion Stylist', '', 'publish', 'closed', 'closed', '', 'fashion-stylist', '', '', '2017-09-27 04:23:17', '2017-09-27 04:23:17', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=207', 6, 'category', '', 0),
(208, 1, '2017-09-27 04:23:04', '2017-09-27 04:23:04', '', 'fastion designer', '', 'inherit', 'open', 'closed', '', 'fastion-designer', '', '', '2017-09-27 04:23:04', '2017-09-27 04:23:04', '', 207, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/fastion-designer.png', 6, 'attachment', 'image/png', 0),
(209, 1, '2017-09-27 04:23:17', '2017-09-27 04:23:17', '', 'Fashion Stylist', '', 'inherit', 'closed', 'closed', '', '207-revision-v1', '', '', '2017-09-27 04:23:17', '2017-09-27 04:23:17', '', 207, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/27/207-revision-v1/', 6, 'revision', '', 0),
(210, 1, '2017-09-27 04:24:01', '2017-09-27 04:24:01', '', 'Cinematographer', '', 'publish', 'closed', 'closed', '', 'cinematographer', '', '', '2017-09-27 04:24:01', '2017-09-27 04:24:01', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=210', 6, 'category', '', 0),
(211, 1, '2017-09-27 04:23:54', '2017-09-27 04:23:54', '', 'Cinematographer', '', 'inherit', 'open', 'closed', '', 'cinematographer', '', '', '2017-09-27 04:23:54', '2017-09-27 04:23:54', '', 210, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/Cinematographer.png', 6, 'attachment', 'image/png', 0),
(212, 1, '2017-09-27 04:24:01', '2017-09-27 04:24:01', '', 'Cinematographer', '', 'inherit', 'closed', 'closed', '', '210-revision-v1', '', '', '2017-09-27 04:24:01', '2017-09-27 04:24:01', '', 210, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/27/210-revision-v1/', 6, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(213, 1, '2017-09-27 04:24:34', '2017-09-27 04:24:34', '', 'Casting', '', 'publish', 'closed', 'closed', '', 'casting', '', '', '2017-09-27 04:24:34', '2017-09-27 04:24:34', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=213', 6, 'category', '', 0),
(214, 1, '2017-09-27 04:24:25', '2017-09-27 04:24:25', '', 'casting', '', 'inherit', 'open', 'closed', '', 'casting', '', '', '2017-09-27 04:24:25', '2017-09-27 04:24:25', '', 213, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/casting.png', 6, 'attachment', 'image/png', 0),
(215, 1, '2017-09-27 04:24:34', '2017-09-27 04:24:34', '', 'Casting', '', 'inherit', 'closed', 'closed', '', '213-revision-v1', '', '', '2017-09-27 04:24:34', '2017-09-27 04:24:34', '', 213, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/27/213-revision-v1/', 6, 'revision', '', 0),
(216, 1, '2017-09-27 04:25:09', '2017-09-27 04:25:09', '', 'Costume Designer', '', 'publish', 'closed', 'closed', '', 'costume-designer', '', '', '2017-09-27 04:25:09', '2017-09-27 04:25:09', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=216', 6, 'category', '', 0),
(217, 1, '2017-09-27 04:25:02', '2017-09-27 04:25:02', '', 'CUSTOMDESIGNER', '', 'inherit', 'open', 'closed', '', 'customdesigner', '', '', '2017-09-27 04:25:02', '2017-09-27 04:25:02', '', 216, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/CUSTOMDESIGNER.png', 6, 'attachment', 'image/png', 0),
(218, 1, '2017-09-27 04:25:09', '2017-09-27 04:25:09', '', 'Costume Designer', '', 'inherit', 'closed', 'closed', '', '216-revision-v1', '', '', '2017-09-27 04:25:09', '2017-09-27 04:25:09', '', 216, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/27/216-revision-v1/', 6, 'revision', '', 0),
(219, 1, '2017-09-27 04:25:57', '2017-09-27 04:25:57', '', 'Production Manager', '', 'publish', 'closed', 'closed', '', 'production-manager', '', '', '2017-09-27 04:25:57', '2017-09-27 04:25:57', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=219', 6, 'category', '', 0),
(220, 1, '2017-09-27 04:25:51', '2017-09-27 04:25:51', '', 'Production Manager', '', 'inherit', 'open', 'closed', '', 'production-manager', '', '', '2017-09-27 04:25:51', '2017-09-27 04:25:51', '', 219, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/Production-Manager.png', 6, 'attachment', 'image/png', 0),
(221, 1, '2017-09-27 04:25:57', '2017-09-27 04:25:57', '', 'Production Manager', '', 'inherit', 'closed', 'closed', '', '219-revision-v1', '', '', '2017-09-27 04:25:57', '2017-09-27 04:25:57', '', 219, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/27/219-revision-v1/', 6, 'revision', '', 0),
(222, 1, '2017-09-27 04:26:41', '2017-09-27 04:26:41', '', 'Photographer', '', 'publish', 'closed', 'closed', '', 'photographer', '', '', '2017-09-27 04:26:41', '2017-09-27 04:26:41', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?post_type=category&#038;p=222', 6, 'category', '', 0),
(223, 1, '2017-09-27 04:26:20', '2017-09-27 04:26:20', '', 'PHOTOGRAPHER', '', 'inherit', 'open', 'closed', '', 'photographer', '', '', '2017-09-27 04:26:20', '2017-09-27 04:26:20', '', 222, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/PHOTOGRAPHER.png', 6, 'attachment', 'image/png', 0),
(224, 1, '2017-09-27 04:26:41', '2017-09-27 04:26:41', '', 'Photographer', '', 'inherit', 'closed', 'closed', '', '222-revision-v1', '', '', '2017-09-27 04:26:41', '2017-09-27 04:26:41', '', 222, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/27/222-revision-v1/', 6, 'revision', '', 0),
(225, 1, '2017-09-28 09:22:24', '2017-09-28 09:22:24', '<div class="plan-section">\r\n<div class="col-md-6 free-plan plan">\r\n<h2>Free</h2>\r\n<ul>\r\n 	<li>Lorem Ipsim dolor sit</li>\r\n 	<li>Lorem Ipsim dolor sit</li>\r\n 	<li>Lorem Ipsim dolor sit</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-6 prime-plan plan">\r\n<h2>Prime</h2>\r\n<ul>\r\n 	<li>Lorem Ipsim dolor sit</li>\r\n 	<li>Lorem Ipsim dolor sit</li>\r\n 	<li>Lorem Ipsim dolor sit</li>\r\n</ul>\r\n</div>\r\n<div class="clear"></div>\r\n<div class="price-p p1">\r\n<h2>1 Month</h2>\r\n<h3>Rs2500</h3>\r\n<a href="#">Upgrade to Prime</a>\r\n\r\n</div>\r\n<div class="price-p p2">\r\n<h2>2 Month</h2>\r\n<h3>Rs2500</h3>\r\n<a href="#">Upgrade to Prime</a>\r\n\r\n</div>\r\n<div class="price-p p3">\r\n<h2>3 Month</h2>\r\n<h3>Rs2500</h3>\r\n<a href="#">Upgrade to Prime</a>\r\n\r\n</div>\r\n<div class="price-p p4">\r\n<h2>4 Month</h2>\r\n<h3>Rs2500</h3>\r\n<a href="#">Upgrade to Prime</a>\r\n\r\n</div>\r\n<div class="clear"></div>\r\n</div>', 'Plan', '', 'publish', 'closed', 'closed', '', 'plan', '', '', '2017-09-28 11:53:20', '2017-09-28 11:53:20', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/?page_id=225', 6, 'page', '', 0),
(226, 1, '2017-09-28 09:22:24', '2017-09-28 09:22:24', '', 'Plan', '', 'inherit', 'closed', 'closed', '', '225-revision-v1', '', '', '2017-09-28 09:22:24', '2017-09-28 09:22:24', '', 225, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/28/225-revision-v1/', 6, 'revision', '', 0),
(227, 1, '2017-09-28 11:51:51', '2017-09-28 11:51:51', '<div class="plan-section">\n<div class="col-md-6 free-plan plan">\n<h2>Free</h2>\n<ul>\n 	<li>Lorem Ipsim dolor sit</li>\n 	<li>Lorem Ipsim dolor sit</li>\n 	<li>Lorem Ipsim dolor sit</li>\n</ul>\n</div>\n<div class="col-md-6 prime-plan plan">\n<h2>Prime</h2>\n<ul>\n 	<li>Lorem Ipsim dolor sit</li>\n 	<li>Lorem Ipsim dolor sit</li>\n 	<li>Lorem Ipsim dolor sit</li>\n</ul>\n</div>\n<div class="clear"></div>\n<div class="price-p p1">\n<h2>1 Month</h2>\n<h3>Rs2500</h3>\n<a href="#">Upgrade to Prime</a>\n\n</div>\n<div class="price-p p2">\n<h2>2 Month</h2>\n<h3>Rs2500</h3>\n<a href="#">Upgrade to Prime</a>\n\n</div>\n<div class="price-p">\n<h2>3 Month</h2>\n<h3>Rs2500</h3>\n<a href="#">Upgrade to Prime</a>\n\n</div>\n<div class="price-p">\n<h2>4 Month</h2>\n<h3>Rs2500</h3>\n<a href="#">Upgrade to Prime</a>\n\n</div>\n<div class="clear"></div>\n</div>', 'Plan', '', 'inherit', 'closed', 'closed', '', '225-autosave-v1', '', '', '2017-09-28 11:51:51', '2017-09-28 11:51:51', '', 225, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/28/225-autosave-v1/', 6, 'revision', '', 0),
(228, 1, '2017-09-28 09:34:02', '2017-09-28 09:34:02', '<div class="plan-section">\r\n   <div class="col-md-6 free-plan plan">\r\n         <h2>>Free</h2>\r\n         <ul>\r\n               <li>Lorem Ipsim dolor sit</li>\r\n               <li>Lorem Ipsim dolor sit</li> \r\n               <li>Lorem Ipsim dolor sit</li>\r\n         </ul>\r\n   </div>\r\n   <div class="col-md-6 prime-plan plan">\r\n         <h2>>Prime</h2>\r\n         <ul>\r\n               <li>Lorem Ipsim dolor sit</li>\r\n               <li>Lorem Ipsim dolor sit</li> \r\n               <li>Lorem Ipsim dolor sit</li>\r\n         </ul>\r\n   </div>\r\n   <div class="clear"></div>\r\n</div>', 'Plan', '', 'inherit', 'closed', 'closed', '', '225-revision-v1', '', '', '2017-09-28 09:34:02', '2017-09-28 09:34:02', '', 225, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/28/225-revision-v1/', 6, 'revision', '', 0),
(229, 1, '2017-09-28 09:34:31', '2017-09-28 09:34:31', '<div class="plan-section">\r\n   <div class="col-md-6 free-plan plan">\r\n         <h2>Free</h2>\r\n         <ul>\r\n               <li>Lorem Ipsim dolor sit</li>\r\n               <li>Lorem Ipsim dolor sit</li> \r\n               <li>Lorem Ipsim dolor sit</li>\r\n         </ul>\r\n   </div>\r\n   <div class="col-md-6 prime-plan plan">\r\n         <h2>Prime</h2>\r\n         <ul>\r\n               <li>Lorem Ipsim dolor sit</li>\r\n               <li>Lorem Ipsim dolor sit</li> \r\n               <li>Lorem Ipsim dolor sit</li>\r\n         </ul>\r\n   </div>\r\n   <div class="clear"></div>\r\n</div>', 'Plan', '', 'inherit', 'closed', 'closed', '', '225-revision-v1', '', '', '2017-09-28 09:34:31', '2017-09-28 09:34:31', '', 225, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/28/225-revision-v1/', 6, 'revision', '', 0),
(230, 1, '2017-09-28 09:36:45', '2017-09-28 09:36:45', '<div class="plan-section">\r\n   <div class="col-md-6 free-plan plan">\r\n         <h2>Free</h2>\r\n         <ul>\r\n               <li>Lorem Ipsim dolor sit</li>\r\n               <li>Lorem Ipsim dolor sit</li> \r\n               <li>Lorem Ipsim dolor sit</li>\r\n         </ul>\r\n   </div>\r\n   <div class="col-md-6 prime-plan plan">\r\n         <h2>Prime</h2>\r\n         <ul>\r\n               <li>Lorem Ipsim dolor sit</li>\r\n               <li>Lorem Ipsim dolor sit</li> \r\n               <li>Lorem Ipsim dolor sit</li>\r\n         </ul>\r\n   </div>\r\n   <div class="clear"></div>\r\n   <div class="col-md-4 price-p">\r\n         <h2>1 Month</h2>\r\n         <h3>Rs2500</h3>\r\n   </div>\r\n   <div class="col-md-4 price-p">\r\n         <h2>1 Month</h2>\r\n         <h3>Rs2500</h3>\r\n   </div>\r\n   <div class="col-md-4 price-p">\r\n         <h2>1 Month</h2>\r\n         <h3>Rs2500</h3>\r\n   </div>\r\n   <div class="col-md-4 price-p">\r\n         <h2>1 Month</h2>\r\n         <h3>Rs2500</h3>\r\n   </div>\r\n   <div class="clear"></div> \r\n</div>', 'Plan', '', 'inherit', 'closed', 'closed', '', '225-revision-v1', '', '', '2017-09-28 09:36:45', '2017-09-28 09:36:45', '', 225, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/28/225-revision-v1/', 6, 'revision', '', 0),
(231, 1, '2017-09-28 09:39:03', '2017-09-28 09:39:03', '<div class="plan-section">\r\n   <div class="col-md-6 free-plan plan">\r\n         <h2>Free</h2>\r\n         <ul>\r\n               <li>Lorem Ipsim dolor sit</li>\r\n               <li>Lorem Ipsim dolor sit</li> \r\n               <li>Lorem Ipsim dolor sit</li>\r\n         </ul>\r\n   </div>\r\n   <div class="col-md-6 prime-plan plan">\r\n         <h2>Prime</h2>\r\n         <ul>\r\n               <li>Lorem Ipsim dolor sit</li>\r\n               <li>Lorem Ipsim dolor sit</li> \r\n               <li>Lorem Ipsim dolor sit</li>\r\n         </ul>\r\n   </div>\r\n   <div class="clear"></div>\r\n   <div class="col-md-4 price-p">\r\n         <h2>1 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a>\r\n   </div>\r\n   <div class="col-md-4 price-p">\r\n         <h2>1 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a>\r\n   </div>\r\n   <div class="col-md-4 price-p">\r\n         <h2>1 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a>\r\n   </div>\r\n   <div class="col-md-4 price-p">\r\n         <h2>1 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a> \r\n   </div>\r\n   <div class="clear"></div> \r\n</div>', 'Plan', '', 'inherit', 'closed', 'closed', '', '225-revision-v1', '', '', '2017-09-28 09:39:03', '2017-09-28 09:39:03', '', 225, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/28/225-revision-v1/', 6, 'revision', '', 0),
(232, 1, '2017-09-28 09:40:04', '2017-09-28 09:40:04', '<div class="plan-section">\r\n   <div class="col-md-6 free-plan plan">\r\n         <h2>Free</h2>\r\n         <ul>\r\n               <li>Lorem Ipsim dolor sit</li>\r\n               <li>Lorem Ipsim dolor sit</li> \r\n               <li>Lorem Ipsim dolor sit</li>\r\n         </ul>\r\n   </div>\r\n   <div class="col-md-6 prime-plan plan">\r\n         <h2>Prime</h2>\r\n         <ul>\r\n               <li>Lorem Ipsim dolor sit</li>\r\n               <li>Lorem Ipsim dolor sit</li> \r\n               <li>Lorem Ipsim dolor sit</li>\r\n         </ul>\r\n   </div>\r\n   <div class="clear"></div>\r\n   <div class="col-md-3 price-p">\r\n         <h2>1 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a>\r\n   </div>\r\n   <div class="col-md-3 price-p">\r\n         <h2>1 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a>\r\n   </div>\r\n   <div class="col-md-3 price-p">\r\n         <h2>1 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a>\r\n   </div>\r\n   <div class="col-md-3 price-p">\r\n         <h2>1 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a> \r\n   </div>\r\n   <div class="clear"></div> \r\n</div>', 'Plan', '', 'inherit', 'closed', 'closed', '', '225-revision-v1', '', '', '2017-09-28 09:40:04', '2017-09-28 09:40:04', '', 225, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/28/225-revision-v1/', 6, 'revision', '', 0),
(233, 1, '2017-09-28 09:42:48', '2017-09-28 09:42:48', '<div class="plan-section">\r\n   <div class="col-md-6 free-plan plan">\r\n         <h2>Free</h2>\r\n         <ul>\r\n               <li>Lorem Ipsim dolor sit</li>\r\n               <li>Lorem Ipsim dolor sit</li> \r\n               <li>Lorem Ipsim dolor sit</li>\r\n         </ul>\r\n   </div>\r\n   <div class="col-md-6 prime-plan plan">\r\n         <h2>Prime</h2>\r\n         <ul>\r\n               <li>Lorem Ipsim dolor sit</li>\r\n               <li>Lorem Ipsim dolor sit</li> \r\n               <li>Lorem Ipsim dolor sit</li>\r\n         </ul>\r\n   </div>\r\n   <div class="clear"></div>\r\n   <div class="col-md-3 price-p">\r\n         <h2>1 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a>\r\n   </div>\r\n   <div class="col-md-3 price-p">\r\n         <h2>2 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a>\r\n   </div>\r\n   <div class="col-md-3 price-p">\r\n         <h2>3 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a>\r\n   </div>\r\n   <div class="col-md-3 price-p">\r\n         <h2>4 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a> \r\n   </div>\r\n   <div class="clear"></div> \r\n</div>', 'Plan', '', 'inherit', 'closed', 'closed', '', '225-revision-v1', '', '', '2017-09-28 09:42:48', '2017-09-28 09:42:48', '', 225, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/28/225-revision-v1/', 6, 'revision', '', 0),
(234, 1, '2017-09-28 10:35:39', '2017-09-28 10:35:39', '<strong>Gateway to Bollywood </strong>\r\n\r\nGateway to Bollywood, being a talent hunt portal is a boon for aspiring individuals, whether they are models, photographers, directors, actors or anyone related to the film production industry.\r\n\r\nThere is no dearth of talent in our country and as talent always pays off, it’s an open hunting for the ones who are in a need to make a brighter career in Bollywood.\r\n\r\nAnyone can get registered himself or herself online here to become a part of the Gateway to Bollywood family to get an entry to Bollywood. It’s your own platform and your chance and the selection is beyond nepotism.\r\n\r\nDon’t think out of the box.  Think like there is no Box.\r\n\r\nWe also do have a “no box” approach towards recruitment solutions for film producers, casting directors, and production houses, where we provide endwise hiring solutions.\r\n\r\nGateway to Bollywood assures you for providing a platform and promoting yourselves among the film makers, casting and modeling agencies, and production houses besides informing you about the latest castings and auditions.\r\n\r\nOn the other hand, we are not prejudiced by your physical appearance and the background you come from. All that is needed is the zeal to move ahead in life and willingness to face the challenges with great eagerness. Gateway to Bollywood is a radical concept in the promotion of fine arts and theatre in particular. We envision providing a see-through via media between budding stars desiring for the correct launch pad into glitter town and establish leaders of the world of Bollywood.\r\n\r\n&nbsp;', 'About', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2017-09-28 10:35:39', '2017-09-28 10:35:39', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/28/6-revision-v1/', 6, 'revision', '', 0),
(235, 1, '2017-09-28 11:34:42', '2017-09-28 11:34:42', '<div class="plan-section">\r\n   <div class="col-md-6 free-plan plan">\r\n         <h2>Free</h2>\r\n         <ul>\r\n               <li>Lorem Ipsim dolor sit</li>\r\n               <li>Lorem Ipsim dolor sit</li> \r\n               <li>Lorem Ipsim dolor sit</li>\r\n         </ul>\r\n   </div>\r\n   <div class="col-md-6 prime-plan plan">\r\n         <h2>Prime</h2>\r\n         <ul>\r\n               <li>Lorem Ipsim dolor sit</li>\r\n               <li>Lorem Ipsim dolor sit</li> \r\n               <li>Lorem Ipsim dolor sit</li>\r\n         </ul>\r\n   </div>\r\n   <div class="clear"></div>\r\n   <div class="price-p">\r\n         <h2>1 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a>\r\n   </div>\r\n   <div class="price-p">\r\n         <h2>2 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a>\r\n   </div>\r\n   <div class="price-p">\r\n         <h2>3 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a>\r\n   </div>\r\n   <div class="price-p">\r\n         <h2>4 Month</h2>\r\n         <h3>Rs2500</h3>\r\n         <a href="#">Upgrade to Prime</a> \r\n   </div>\r\n   <div class="clear"></div> \r\n</div>', 'Plan', '', 'inherit', 'closed', 'closed', '', '225-revision-v1', '', '', '2017-09-28 11:34:42', '2017-09-28 11:34:42', '', 225, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/28/225-revision-v1/', 6, 'revision', '', 0),
(236, 1, '2017-09-28 11:52:01', '2017-09-28 11:52:01', '<div class="plan-section">\r\n<div class="col-md-6 free-plan plan">\r\n<h2>Free</h2>\r\n<ul>\r\n 	<li>Lorem Ipsim dolor sit</li>\r\n 	<li>Lorem Ipsim dolor sit</li>\r\n 	<li>Lorem Ipsim dolor sit</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-6 prime-plan plan">\r\n<h2>Prime</h2>\r\n<ul>\r\n 	<li>Lorem Ipsim dolor sit</li>\r\n 	<li>Lorem Ipsim dolor sit</li>\r\n 	<li>Lorem Ipsim dolor sit</li>\r\n</ul>\r\n</div>\r\n<div class="clear"></div>\r\n<div class="price-p p1">\r\n<h2>1 Month</h2>\r\n<h3>Rs2500</h3>\r\n<a href="#">Upgrade to Prime</a>\r\n\r\n</div>\r\n<div class="price-p p2">\r\n<h2>2 Month</h2>\r\n<h3>Rs2500</h3>\r\n<a href="#">Upgrade to Prime</a>\r\n\r\n</div>\r\n<div class="price-p p3">\r\n<h2>3 Month</h2>\r\n<h3>Rs2500</h3>\r\n<a href="#">Upgrade to Prime</a>\r\n\r\n</div>\r\n<div class="price-p p4">\r\n<h2>4 Month</h2>\r\n<h3>Rs2500</h3>\r\n<a href="#">Upgrade to Prime</a>\r\n\r\n</div>\r\n<div class="clear"></div>\r\n</div>', 'Plan', '', 'inherit', 'closed', 'closed', '', '225-revision-v1', '', '', '2017-09-28 11:52:01', '2017-09-28 11:52:01', '', 225, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/28/225-revision-v1/', 6, 'revision', '', 0),
(237, 4, '2017-09-28 16:35:22', '2017-09-28 16:35:22', 'No Information', 'Hrishank', '', 'publish', 'open', 'closed', '', 'hrishank', '', '', '2017-09-28 16:35:22', '2017-09-28 16:35:22', '', 0, 'http://projects.seawindsolution.com/five/gatewaytobollywood/upg/uncategorized/hrishank/', 6, 'upg', '', 0),
(238, 4, '2017-09-28 16:35:23', '2017-09-28 16:35:23', '', 'download (1)', '', 'inherit', 'open', 'closed', '', 'download-1', '', '', '2017-09-28 16:35:23', '2017-09-28 16:35:23', '', 237, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/download-1.jpg', 6, 'attachment', 'image/jpeg', 0),
(239, 1, '2017-09-29 07:12:51', '2017-09-29 07:12:51', '<div class="col-md-7">\r\n<strong>Address</strong>\r\n25, Lorem Ipsum Dolor,\r\nLorem ipsum, \r\nLipsum Dolor - 000000.\r\n<br/>\r\n<strong>Email</strong> \r\n<a href="mailto:info@example.com">info@example.com</a>\r\n\r\n<strong>Call Us </strong> \r\n+91 99999 99999\r\n\r\n<br/>\r\n <!--<iframe  width="100%" height="400" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3672.585688481838!2d72.61665431454537!3d23.00225798496341!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e86742b6dc88f%3A0x759d5db9ab4771c4!2sSeawind+Solution+Pvt+Ltd!5e0!3m2!1sen!2sin!4v1481979184975" frameborder="0" style="border:0" allowfullscreen></iframe>-->\r\n<div style="width: 100%"><iframe width="100%" height="600" src="https://www.mapsdirections.info/en/custom-google-maps/map.php?width=100%&height=600&hl=ru&q=andheri%20mumbai+(Gateway%20to%20Bollywood)&ie=UTF8&t=&z=14&iwloc=A&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"><a href="https://www.mapsdirections.info/en/custom-google-maps/">Embed Google Map</a> by <a href="https://www.mapsdirections.info/en/">Measure area on map</a></iframe></div><br />\r\n</div>\r\n<div class="col-md-5">\r\n[vfb id=\'1\']\r\n</div>', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2017-09-29 07:12:51', '2017-09-29 07:12:51', '', 22, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/29/22-revision-v1/', 6, 'revision', '', 0),
(241, 1, '2017-10-02 05:46:16', '2017-10-02 05:46:16', '<strong>Gateway to Bollywood </strong>\n\nGateway to Bollywood, being a talent hunt portal is a boon for aspiring individuals, whether they are models, photographers, directors, actors or anyone related to the film production industry. There is no dearth of talent in our country and as talent always pays off, it’s an open hunting for the ones who are in a need to make a brighter career in Bollywood.\n\nAnyone can get registered himself or herself online here to become a part of the Gateway to Bollywood family to get an entry to Bollywood. It’s your own platform and your chance and the selection is beyond nepotism.Don’t think out of the box.  Think like there is no Box. We also do have a “no box” approach towards recruitment solutions for film producers, casting directors, and production houses, where we provide endwise hiring solutions.\n\nGateway to Bollywood assures you for providing a platform and promoting yourselves among the film makers, casting and modeling agencies, and production houses besides informing you about the latest castings and auditions. On the other hand, we are not prejudiced by your physical appearance and the background you come from. All that is needed is the zeal to move ahead in life and willingness to face the challenges with great eagerness. Gateway to Bollywood is a radical concept in the promotion of fine arts and theatre in particular. We envision providing a see-through via media between budding stars desiring for the correct launch pad into glitter town and establish leaders of the world of Bollywood.\n\n<div class="about about1">\n    <h2>How it works for a Recruiter ?</h2>\n    <div class="row">\n          <div class="col-md-3"> \n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\n             <strong>Sign up</strong> \n            <p>Industry professionals sign up and create their a user profile with the Company Logo, Profile &amp; past work.</p>\n          </div>\n          <div class="col-md-3">\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\n            <strong>Verification</strong>\n            <p>Verified user by admin team after the recruiter will be allowed to access the website.</p>\n          </div>\n          <div class="col-md-3">\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\n            <strong>Search for Talent nearby</strong>\n            <p>Once Verified – Recruiters will be able to post jobs and search for talent profiles, based on their exact requirements.</p>\n          </div>\n\n          <div class="col-md-3">\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/contact-us.png" />\n               <strong>Contact us </strong> \n            <p>Recruiters can directly communicate with their shortlisted talent through the website.</p>\n          </div>\n        </div>\n</div>\n\n\n<div class="about about2">\n    <h2>How it works for a Talent ?</h2>\n    <div class="row">\n          <div class="col-md-3">\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\n             <strong>Sign up</strong> \n            <p>Talent sign up and create their a user profile with their , Profile &amp; past work.</p>\n          </div>\n          <div class="col-md-3">\n            <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\n            <strong>Verification</strong>\n            <p>Verified user by admin team after the recruiter will be allowed to access the website.</p>\n          </div>\n          <div class="col-md-3">\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\n            <strong>Search for Job</strong>\n            <p>Once Verified, talent will have access to jobs that they would normally not even be aware of. Talent can apply for jobs and give auditions from the comfort of their home. </p>\n          </div>\n\n          <div class="col-md-3">\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/contact-us.png" />\n               <strong>Contact us</strong> \n            <p>If Shortlisted, they can directly contact with the recruiter and finalize the job on mutual consent through the website.</p>\n          </div>\n        </div>\n</div>\n\n\n ', 'About', '', 'inherit', 'closed', 'closed', '', '6-autosave-v1', '', '', '2017-10-02 05:46:16', '2017-10-02 05:46:16', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/29/6-autosave-v1/', 6, 'revision', '', 0),
(242, 1, '2017-09-29 12:11:10', '2017-09-29 12:11:10', '<strong>Gateway to Bollywood </strong>\r\n\r\nGateway to Bollywood, being a talent hunt portal is a boon for aspiring individuals, whether they are models, photographers, directors, actors or anyone related to the film production industry.\r\n\r\nThere is no dearth of talent in our country and as talent always pays off, it’s an open hunting for the ones who are in a need to make a brighter career in Bollywood.\r\n\r\nAnyone can get registered himself or herself online here to become a part of the Gateway to Bollywood family to get an entry to Bollywood. It’s your own platform and your chance and the selection is beyond nepotism.\r\n\r\nDon’t think out of the box.  Think like there is no Box.\r\n\r\nWe also do have a “no box” approach towards recruitment solutions for film producers, casting directors, and production houses, where we provide endwise hiring solutions.\r\n\r\nGateway to Bollywood assures you for providing a platform and promoting yourselves among the film makers, casting and modeling agencies, and production houses besides informing you about the latest castings and auditions.\r\n\r\nOn the other hand, we are not prejudiced by your physical appearance and the background you come from. All that is needed is the zeal to move ahead in life and willingness to face the challenges with great eagerness. Gateway to Bollywood is a radical concept in the promotion of fine arts and theatre in particular. We envision providing a see-through via media between budding stars desiring for the correct launch pad into glitter town and establish leaders of the world of Bollywood.\r\n\r\n<div class="about about1">\r\n    <div class="row">\r\n          <div class="col-md-3">\r\n            <div class="circle">\r\n              <div class="circle-icon circle-icon-1"></div>\r\n            </div>\r\n            <div class="title"><strong>Sign up</strong></div>\r\n            <p>Industry professionals sign up via  Email / Linkedin / Facebook / Google accounts and create their a user profile with the Company Logo, Profile &amp; past work.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n            <div class="circle">\r\n              <div class="circle-icon circle-icon-2"></div>\r\n            </div>\r\n            <div class="title"><strong>Verification</strong></div>\r\n            <p>The individual/ company will be checked through email and OTP verification and will be reviewed and assessed by the team. Only on completion of the above, the recruiter will be allowed to access the website and post jobs.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<div class="circle">\r\n              <div class="circle-icon circle-icon-5"></div>\r\n                </div>\r\n            <div class="title"><strong>Search for Talent nearby</strong></div>\r\n            <p>Once Verified – Recruiters will be able to post jobs and search for talent profiles, based on their exact requirements.</p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<div class="circle">\r\n                  <div class="circle-icon circle-icon-4"></div>\r\n               </div>\r\n            <div class="title"><strong>Connect &amp; Book</strong></div>\r\n            <p>Recruiters can directly communicate with their shortlisted talent and request bookings through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n', 'About', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2017-09-29 12:11:10', '2017-09-29 12:11:10', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/29/6-revision-v1/', 6, 'revision', '', 0),
(243, 1, '2017-09-29 12:13:58', '2017-09-29 12:13:58', '<strong>Gateway to Bollywood </strong>\r\n\r\nGateway to Bollywood, being a talent hunt portal is a boon for aspiring individuals, whether they are models, photographers, directors, actors or anyone related to the film production industry.\r\n\r\nThere is no dearth of talent in our country and as talent always pays off, it’s an open hunting for the ones who are in a need to make a brighter career in Bollywood.\r\n\r\nAnyone can get registered himself or herself online here to become a part of the Gateway to Bollywood family to get an entry to Bollywood. It’s your own platform and your chance and the selection is beyond nepotism.\r\n\r\nDon’t think out of the box.  Think like there is no Box.\r\n\r\nWe also do have a “no box” approach towards recruitment solutions for film producers, casting directors, and production houses, where we provide endwise hiring solutions.\r\n\r\nGateway to Bollywood assures you for providing a platform and promoting yourselves among the film makers, casting and modeling agencies, and production houses besides informing you about the latest castings and auditions.\r\n\r\nOn the other hand, we are not prejudiced by your physical appearance and the background you come from. All that is needed is the zeal to move ahead in life and willingness to face the challenges with great eagerness. Gateway to Bollywood is a radical concept in the promotion of fine arts and theatre in particular. We envision providing a see-through via media between budding stars desiring for the correct launch pad into glitter town and establish leaders of the world of Bollywood.\r\n\r\n<div class="about about1">\r\n    <h2>How it works for a Recruiter ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3">\r\n            <div class="circle">\r\n              <div class="circle-icon circle-icon-1"></div>\r\n            </div>\r\n            <div class="title"><strong>Sign up</strong></div>\r\n            <p>Industry professionals sign up via  Email / Linkedin / Facebook / Google accounts and create their a user profile with the Company Logo, Profile &amp; past work.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n            <div class="circle">\r\n              <div class="circle-icon circle-icon-2"></div>\r\n            </div>\r\n            <div class="title"><strong>Verification</strong></div>\r\n            <p>The individual/ company will be checked through email and OTP verification and will be reviewed and assessed by the team. Only on completion of the above, the recruiter will be allowed to access the website and post jobs.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<div class="circle">\r\n              <div class="circle-icon circle-icon-5"></div>\r\n                </div>\r\n            <div class="title"><strong>Search for Talent nearby</strong></div>\r\n            <p>Once Verified – Recruiters will be able to post jobs and search for talent profiles, based on their exact requirements.</p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<div class="circle">\r\n                  <div class="circle-icon circle-icon-4"></div>\r\n               </div>\r\n            <div class="title"><strong>Connect &amp; Book</strong></div>\r\n            <p>Recruiters can directly communicate with their shortlisted talent and request bookings through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n<div class="about about2">\r\n    <h2>How it works for a Talent ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3">\r\n            <div class="circle">\r\n              <div class="circle-icon circle-icon-1"></div>\r\n            </div>\r\n            <div class="title"><strong>Sign up</strong></div>\r\n            <p>Amateurs & professionals sign up via Email/ Linkedin/Facebook /Google accounts and create a user profile with relevant information pertaining to their talent (For e.g. an actor will upload their portfolio pictures, past work if any etc.)</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n            <div class="circle">\r\n              <div class="circle-icon circle-icon-2"></div>\r\n            </div>\r\n            <div class="title"><strong>Verification</strong></div>\r\n            <p>The talent will be checked through email and OTP verification and will be reviewed and assessed by the team. Only on completion of the above, the talent will be allowed to access the website and apply for jobs. </p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<div class="circle">\r\n              <div class="circle-icon circle-icon-5"></div>\r\n                </div>\r\n            <div class="title"><strong>Search for Talent nearby</strong></div>\r\n            <p>Once Verified, talent will have access to jobs that they would normally not even be aware of. Talent can apply for jobs and give auditions from the comfort of their home. </p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<div class="circle">\r\n                  <div class="circle-icon circle-icon-4"></div>\r\n               </div>\r\n            <div class="title"><strong>Connect &amp; Book</strong></div>\r\n            <p>If Shortlisted, they can directly connect with the recruiter and finalize the job on mutual consent through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n<div class="about about3">\r\n    <h2>How it works for an Agent ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3">\r\n            <div class="circle">\r\n              <div class="circle-icon circle-icon-1"></div>\r\n            </div>\r\n            <div class="title"><strong>Sign up</strong></div>\r\n            <p>Agents sign up via Email/ Linkedin/Facebook /Google accounts and create a user profile with relevant information pertaining to the exclusive artists under them.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n            <div class="circle">\r\n              <div class="circle-icon circle-icon-2"></div>\r\n            </div>\r\n            <div class="title"><strong>Verification</strong></div>\r\n            <p>The agent profile will be verified through email and OTP verification and will be reviewed and assessed by the team. Only on completion of the above, the agent will be allowed to access the website and apply for jobs.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<div class="circle">\r\n              <div class="circle-icon circle-icon-5"></div>\r\n                </div>\r\n            <div class="title"><strong>Search for Talent nearby</strong></div>\r\n            <p>Once Verified, an agent can access and manage the artist’s profiles and apply for multiple jobs on their behalf. The agent can then organise various auditions for his/her artists with just a click away.</p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<div class="circle">\r\n                  <div class="circle-icon circle-icon-4"></div>\r\n               </div>\r\n            <div class="title"><strong>Connect &amp; Book</strong></div>\r\n            <p>If Shortlisted, the agent can directly connect with the recruiter on behalf of various artists under him/her and finalize the jobs on mutual consent, through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>', 'About', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2017-09-29 12:13:58', '2017-09-29 12:13:58', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/29/6-revision-v1/', 6, 'revision', '', 0),
(244, 1, '2017-09-29 12:37:04', '2017-09-29 12:37:04', '', 'connect-book', '', 'inherit', 'open', 'closed', '', 'connect-book', '', '', '2017-09-29 12:37:04', '2017-09-29 12:37:04', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/connect-book.png', 6, 'attachment', 'image/png', 0),
(245, 1, '2017-09-29 12:37:06', '2017-09-29 12:37:06', '', 'job-op', '', 'inherit', 'open', 'closed', '', 'job-op', '', '', '2017-09-29 12:37:06', '2017-09-29 12:37:06', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png', 6, 'attachment', 'image/png', 0),
(246, 1, '2017-09-29 12:37:07', '2017-09-29 12:37:07', '', 'sign-up', '', 'inherit', 'open', 'closed', '', 'sign-up', '', '', '2017-09-29 12:37:07', '2017-09-29 12:37:07', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png', 6, 'attachment', 'image/png', 0),
(247, 1, '2017-09-29 12:37:22', '2017-09-29 12:37:22', '', 'verification', '', 'inherit', 'open', 'closed', '', 'verification', '', '', '2017-09-29 12:37:22', '2017-09-29 12:37:22', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png', 6, 'attachment', 'image/png', 0),
(248, 1, '2017-09-29 12:41:10', '2017-09-29 12:41:10', '<strong>Gateway to Bollywood </strong>\r\n\r\nGateway to Bollywood, being a talent hunt portal is a boon for aspiring individuals, whether they are models, photographers, directors, actors or anyone related to the film production industry.\r\n\r\nThere is no dearth of talent in our country and as talent always pays off, it’s an open hunting for the ones who are in a need to make a brighter career in Bollywood.\r\n\r\nAnyone can get registered himself or herself online here to become a part of the Gateway to Bollywood family to get an entry to Bollywood. It’s your own platform and your chance and the selection is beyond nepotism.\r\n\r\nDon’t think out of the box.  Think like there is no Box.\r\n\r\nWe also do have a “no box” approach towards recruitment solutions for film producers, casting directors, and production houses, where we provide endwise hiring solutions.\r\n\r\nGateway to Bollywood assures you for providing a platform and promoting yourselves among the film makers, casting and modeling agencies, and production houses besides informing you about the latest castings and auditions.\r\n\r\nOn the other hand, we are not prejudiced by your physical appearance and the background you come from. All that is needed is the zeal to move ahead in life and willingness to face the challenges with great eagerness. Gateway to Bollywood is a radical concept in the promotion of fine arts and theatre in particular. We envision providing a see-through via media between budding stars desiring for the correct launch pad into glitter town and establish leaders of the world of Bollywood.\r\n\r\n<div class="about about1">\r\n    <h2>How it works for a Recruiter ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3"> \r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Industry professionals sign up via  Email / Linkedin / Facebook / Google accounts and create their a user profile with the Company Logo, Profile &amp; past work.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>The individual/ company will be checked through email and OTP verification and will be reviewed and assessed by the team. Only on completion of the above, the recruiter will be allowed to access the website and post jobs.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Talent nearby</strong>\r\n            <p>Once Verified – Recruiters will be able to post jobs and search for talent profiles, based on their exact requirements.</p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/connect-book.png" />\r\n               <strong>Connect &amp; Book</strong> \r\n            <p>Recruiters can directly communicate with their shortlisted talent and request bookings through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n<div class="about about2">\r\n    <h2>How it works for a Talent ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Amateurs & professionals sign up via Email/ Linkedin/Facebook /Google accounts and create a user profile with relevant information pertaining to their talent (For e.g. an actor will upload their portfolio pictures, past work if any etc.)</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n            <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>The talent will be checked through email and OTP verification and will be reviewed and assessed by the team. Only on completion of the above, the talent will be allowed to access the website and apply for jobs. </p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Talent nearby</strong>\r\n            <p>Once Verified, talent will have access to jobs that they would normally not even be aware of. Talent can apply for jobs and give auditions from the comfort of their home. </p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<div class="circle">\r\n                  <div class="circle-icon circle-icon-4"></div>\r\n               </div>\r\n            <div class="title"><strong>Connect &amp; Book</strong></div>\r\n            <p>If Shortlisted, they can directly connect with the recruiter and finalize the job on mutual consent through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n<div class="about about3">\r\n    <h2>How it works for an Agent ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Agents sign up via Email/ Linkedin/Facebook /Google accounts and create a user profile with relevant information pertaining to the exclusive artists under them.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n            <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>The agent profile will be verified through email and OTP verification and will be reviewed and assessed by the team. Only on completion of the above, the agent will be allowed to access the website and apply for jobs.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Talent nearby</strong>\r\n            <p>Once Verified, an agent can access and manage the artist’s profiles and apply for multiple jobs on their behalf. The agent can then organise various auditions for his/her artists with just a click away.</p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/connect-book.png" />\r\n               <strong>Connect &amp; Book</strong> \r\n            <p>If Shortlisted, the agent can directly connect with the recruiter on behalf of various artists under him/her and finalize the jobs on mutual consent, through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>', 'About', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2017-09-29 12:41:10', '2017-09-29 12:41:10', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/29/6-revision-v1/', 6, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(249, 1, '2017-09-29 14:03:49', '2017-09-29 14:03:49', '<strong>Gateway to Bollywood </strong>\r\n\r\nGateway to Bollywood, being a talent hunt portal is a boon for aspiring individuals, whether they are models, photographers, directors, actors or anyone related to the film production industry.\r\n\r\nThere is no dearth of talent in our country and as talent always pays off, it’s an open hunting for the ones who are in a need to make a brighter career in Bollywood.\r\n\r\nAnyone can get registered himself or herself online here to become a part of the Gateway to Bollywood family to get an entry to Bollywood. It’s your own platform and your chance and the selection is beyond nepotism.\r\n\r\nDon’t think out of the box.  Think like there is no Box.\r\n\r\nWe also do have a “no box” approach towards recruitment solutions for film producers, casting directors, and production houses, where we provide endwise hiring solutions.\r\n\r\nGateway to Bollywood assures you for providing a platform and promoting yourselves among the film makers, casting and modeling agencies, and production houses besides informing you about the latest castings and auditions.\r\n\r\nOn the other hand, we are not prejudiced by your physical appearance and the background you come from. All that is needed is the zeal to move ahead in life and willingness to face the challenges with great eagerness. Gateway to Bollywood is a radical concept in the promotion of fine arts and theatre in particular. We envision providing a see-through via media between budding stars desiring for the correct launch pad into glitter town and establish leaders of the world of Bollywood.\r\n\r\n<div class="about about1">\r\n    <h2>How it works for a Recruiter ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3"> \r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Industry professionals sign up via  Email / Linkedin / Facebook / Google accounts and create their a user profile with the Company Logo, Profile &amp; past work.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>The individual/ company will be checked through email and OTP verification and will be reviewed and assessed by the team. Only on completion of the above, the recruiter will be allowed to access the website and post jobs.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Talent nearby</strong>\r\n            <p>Once Verified – Recruiters will be able to post jobs and search for talent profiles, based on their exact requirements.</p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/connect-book.png" />\r\n               <strong>Connect &amp; Book</strong> \r\n            <p>Recruiters can directly communicate with their shortlisted talent and request bookings through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n<div class="about about2">\r\n    <h2>How it works for a Talent ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Amateurs & professionals sign up via Email/ Linkedin/Facebook /Google accounts and create a user profile with relevant information pertaining to their talent (For e.g. an actor will upload their portfolio pictures, past work if any etc.)</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n            <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>The talent will be checked through email and OTP verification and will be reviewed and assessed by the team. Only on completion of the above, the talent will be allowed to access the website and apply for jobs. </p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Talent nearby</strong>\r\n            <p>Once Verified, talent will have access to jobs that they would normally not even be aware of. Talent can apply for jobs and give auditions from the comfort of their home. </p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/connect-book.png" />\r\n               <strong>Connect &amp; Book</strong> \r\n            <p>If Shortlisted, they can directly connect with the recruiter and finalize the job on mutual consent through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n ', 'About', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2017-09-29 14:03:49', '2017-09-29 14:03:49', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/29/6-revision-v1/', 6, 'revision', '', 0),
(250, 1, '2017-09-29 14:05:23', '2017-09-29 14:05:23', '\r\n\r\n<div class="about about1">\r\n    <h2>How it works for a Recruiter ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3"> \r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Industry professionals sign up via  Email / Linkedin / Facebook / Google accounts and create their a user profile with the Company Logo, Profile &amp; past work.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>The individual/ company will be checked through email and OTP verification and will be reviewed and assessed by the team. Only on completion of the above, the recruiter will be allowed to access the website and post jobs.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Talent nearby</strong>\r\n            <p>Once Verified – Recruiters will be able to post jobs and search for talent profiles, based on their exact requirements.</p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/connect-book.png" />\r\n               <strong>Connect &amp; Book</strong> \r\n            <p>Recruiters can directly communicate with their shortlisted talent and request bookings through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n<div class="about about2">\r\n    <h2>How it works for a Talent ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Amateurs & professionals sign up via Email/ Linkedin/Facebook /Google accounts and create a user profile with relevant information pertaining to their talent (For e.g. an actor will upload their portfolio pictures, past work if any etc.)</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n            <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>The talent will be checked through email and OTP verification and will be reviewed and assessed by the team. Only on completion of the above, the talent will be allowed to access the website and apply for jobs. </p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Talent nearby</strong>\r\n            <p>Once Verified, talent will have access to jobs that they would normally not even be aware of. Talent can apply for jobs and give auditions from the comfort of their home. </p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/connect-book.png" />\r\n               <strong>Connect &amp; Book</strong> \r\n            <p>If Shortlisted, they can directly connect with the recruiter and finalize the job on mutual consent through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n<strong>Gateway to Bollywood </strong>\r\n\r\nGateway to Bollywood, being a talent hunt portal is a boon for aspiring individuals, whether they are models, photographers, directors, actors or anyone related to the film production industry.\r\n\r\nThere is no dearth of talent in our country and as talent always pays off, it’s an open hunting for the ones who are in a need to make a brighter career in Bollywood.\r\n\r\nAnyone can get registered himself or herself online here to become a part of the Gateway to Bollywood family to get an entry to Bollywood. It’s your own platform and your chance and the selection is beyond nepotism.\r\n\r\nDon’t think out of the box.  Think like there is no Box.\r\n\r\nWe also do have a “no box” approach towards recruitment solutions for film producers, casting directors, and production houses, where we provide endwise hiring solutions.\r\n\r\nGateway to Bollywood assures you for providing a platform and promoting yourselves among the film makers, casting and modeling agencies, and production houses besides informing you about the latest castings and auditions.\r\n\r\nOn the other hand, we are not prejudiced by your physical appearance and the background you come from. All that is needed is the zeal to move ahead in life and willingness to face the challenges with great eagerness. Gateway to Bollywood is a radical concept in the promotion of fine arts and theatre in particular. We envision providing a see-through via media between budding stars desiring for the correct launch pad into glitter town and establish leaders of the world of Bollywood.\r\n ', 'About', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2017-09-29 14:05:23', '2017-09-29 14:05:23', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/29/6-revision-v1/', 6, 'revision', '', 0),
(251, 1, '2017-09-29 14:10:18', '2017-09-29 14:10:18', '<strong>Gateway to Bollywood </strong>\r\n\r\nGateway to Bollywood, being a talent hunt portal is a boon for aspiring individuals, whether they are models, photographers, directors, actors or anyone related to the film production industry. There is no dearth of talent in our country and as talent always pays off, it’s an open hunting for the ones who are in a need to make a brighter career in Bollywood.\r\n\r\nAnyone can get registered himself or herself online here to become a part of the Gateway to Bollywood family to get an entry to Bollywood. It’s your own platform and your chance and the selection is beyond nepotism.Don’t think out of the box.  Think like there is no Box. We also do have a “no box” approach towards recruitment solutions for film producers, casting directors, and production houses, where we provide endwise hiring solutions.\r\n\r\nGateway to Bollywood assures you for providing a platform and promoting yourselves among the film makers, casting and modeling agencies, and production houses besides informing you about the latest castings and auditions. On the other hand, we are not prejudiced by your physical appearance and the background you come from. All that is needed is the zeal to move ahead in life and willingness to face the challenges with great eagerness. Gateway to Bollywood is a radical concept in the promotion of fine arts and theatre in particular. We envision providing a see-through via media between budding stars desiring for the correct launch pad into glitter town and establish leaders of the world of Bollywood.\r\n\r\n<div class="about about1">\r\n    <h2>How it works for a Recruiter ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3"> \r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Industry professionals sign up via  Email / Linkedin / Facebook / Google accounts and create their a user profile with the Company Logo, Profile &amp; past work.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>The individual/ company will be checked through email and OTP verification and will be reviewed and assessed by the team. Only on completion of the above, the recruiter will be allowed to access the website and post jobs.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Talent nearby</strong>\r\n            <p>Once Verified – Recruiters will be able to post jobs and search for talent profiles, based on their exact requirements.</p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/connect-book.png" />\r\n               <strong>Connect &amp; Book</strong> \r\n            <p>Recruiters can directly communicate with their shortlisted talent and request bookings through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n<div class="about about2">\r\n    <h2>How it works for a Talent ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Amateurs & professionals sign up via Email/ Linkedin/Facebook /Google accounts and create a user profile with relevant information pertaining to their talent (For e.g. an actor will upload their portfolio pictures, past work if any etc.)</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n            <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>The talent will be checked through email and OTP verification and will be reviewed and assessed by the team. Only on completion of the above, the talent will be allowed to access the website and apply for jobs. </p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Talent nearby</strong>\r\n            <p>Once Verified, talent will have access to jobs that they would normally not even be aware of. Talent can apply for jobs and give auditions from the comfort of their home. </p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/connect-book.png" />\r\n               <strong>Connect &amp; Book</strong> \r\n            <p>If Shortlisted, they can directly connect with the recruiter and finalize the job on mutual consent through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n ', 'About', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2017-09-29 14:10:18', '2017-09-29 14:10:18', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/29/6-revision-v1/', 6, 'revision', '', 0),
(252, 1, '2017-09-30 04:32:30', '2017-09-30 04:32:30', '<strong>Gateway to Bollywood </strong>\r\n\r\nGateway to Bollywood, being a talent hunt portal is a boon for aspiring individuals, whether they are models, photographers, directors, actors or anyone related to the film production industry. There is no dearth of talent in our country and as talent always pays off, it’s an open hunting for the ones who are in a need to make a brighter career in Bollywood.\r\n\r\nAnyone can get registered himself or herself online here to become a part of the Gateway to Bollywood family to get an entry to Bollywood. It’s your own platform and your chance and the selection is beyond nepotism.Don’t think out of the box.  Think like there is no Box. We also do have a “no box” approach towards recruitment solutions for film producers, casting directors, and production houses, where we provide endwise hiring solutions.\r\n\r\nGateway to Bollywood assures you for providing a platform and promoting yourselves among the film makers, casting and modeling agencies, and production houses besides informing you about the latest castings and auditions. On the other hand, we are not prejudiced by your physical appearance and the background you come from. All that is needed is the zeal to move ahead in life and willingness to face the challenges with great eagerness. Gateway to Bollywood is a radical concept in the promotion of fine arts and theatre in particular. We envision providing a see-through via media between budding stars desiring for the correct launch pad into glitter town and establish leaders of the world of Bollywood.\r\n\r\n<div class="about about1">\r\n    <h2>How it works for a Recruiter ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3"> \r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Industry professionals sign up and create their a user profile with the Company Logo, Profile &amp; past work.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>Verified user by admin team after the recruiter will be allowed to access the website.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Talent nearby</strong>\r\n            <p>Once Verified – Recruiters will be able to post jobs and search for talent profiles, based on their exact requirements.</p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/connect-book.png" />\r\n               <strong>Contact us </strong> \r\n            <p>Recruiters can directly communicate with their shortlisted talent through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n<div class="about about2">\r\n    <h2>How it works for a Talent ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Industry professionals sign up and create their a user profile with the Company Logo, Profile &amp; past work.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n            <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>Verified user by admin team after the recruiter will be allowed to access the website.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Job</strong>\r\n            <p>Once Verified, talent will have access to jobs that they would normally not even be aware of. Talent can apply for jobs and give auditions from the comfort of their home. </p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/connect-book.png" />\r\n               <strong>Contact us</strong> \r\n            <p>If Shortlisted, they can directly contact with the recruiter and finalize the job on mutual consent through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n ', 'About', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2017-09-30 04:32:30', '2017-09-30 04:32:30', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/30/6-revision-v1/', 6, 'revision', '', 0),
(253, 1, '2017-09-30 04:50:34', '2017-09-30 04:50:34', '', 'contact-us', '', 'inherit', 'open', 'closed', '', 'contact-us-2', '', '', '2017-09-30 04:50:34', '2017-09-30 04:50:34', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/contact-us.png', 6, 'attachment', 'image/png', 0),
(254, 1, '2017-09-30 04:50:52', '2017-09-30 04:50:52', '<strong>Gateway to Bollywood </strong>\r\n\r\nGateway to Bollywood, being a talent hunt portal is a boon for aspiring individuals, whether they are models, photographers, directors, actors or anyone related to the film production industry. There is no dearth of talent in our country and as talent always pays off, it’s an open hunting for the ones who are in a need to make a brighter career in Bollywood.\r\n\r\nAnyone can get registered himself or herself online here to become a part of the Gateway to Bollywood family to get an entry to Bollywood. It’s your own platform and your chance and the selection is beyond nepotism.Don’t think out of the box.  Think like there is no Box. We also do have a “no box” approach towards recruitment solutions for film producers, casting directors, and production houses, where we provide endwise hiring solutions.\r\n\r\nGateway to Bollywood assures you for providing a platform and promoting yourselves among the film makers, casting and modeling agencies, and production houses besides informing you about the latest castings and auditions. On the other hand, we are not prejudiced by your physical appearance and the background you come from. All that is needed is the zeal to move ahead in life and willingness to face the challenges with great eagerness. Gateway to Bollywood is a radical concept in the promotion of fine arts and theatre in particular. We envision providing a see-through via media between budding stars desiring for the correct launch pad into glitter town and establish leaders of the world of Bollywood.\r\n\r\n<div class="about about1">\r\n    <h2>How it works for a Recruiter ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3"> \r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Industry professionals sign up and create their a user profile with the Company Logo, Profile &amp; past work.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>Verified user by admin team after the recruiter will be allowed to access the website.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Talent nearby</strong>\r\n            <p>Once Verified – Recruiters will be able to post jobs and search for talent profiles, based on their exact requirements.</p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/contact-us.png" />\r\n               <strong>Contact us </strong> \r\n            <p>Recruiters can directly communicate with their shortlisted talent through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n<div class="about about2">\r\n    <h2>How it works for a Talent ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Industry professionals sign up and create their a user profile with the Company Logo, Profile &amp; past work.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n            <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>Verified user by admin team after the recruiter will be allowed to access the website.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Job</strong>\r\n            <p>Once Verified, talent will have access to jobs that they would normally not even be aware of. Talent can apply for jobs and give auditions from the comfort of their home. </p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/contact-us.png" />\r\n               <strong>Contact us</strong> \r\n            <p>If Shortlisted, they can directly contact with the recruiter and finalize the job on mutual consent through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n ', 'About', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2017-09-30 04:50:52', '2017-09-30 04:50:52', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/09/30/6-revision-v1/', 6, 'revision', '', 0),
(255, 1, '2017-10-02 05:46:43', '2017-10-02 05:46:43', '<strong>Gateway to Bollywood </strong>\r\n\r\nGateway to Bollywood, being a talent hunt portal is a boon for aspiring individuals, whether they are models, photographers, directors, actors or anyone related to the film production industry. There is no dearth of talent in our country and as talent always pays off, it’s an open hunting for the ones who are in a need to make a brighter career in Bollywood.\r\n\r\nAnyone can get registered himself or herself online here to become a part of the Gateway to Bollywood family to get an entry to Bollywood. It’s your own platform and your chance and the selection is beyond nepotism.Don’t think out of the box.  Think like there is no Box. We also do have a “no box” approach towards recruitment solutions for film producers, casting directors, and production houses, where we provide endwise hiring solutions.\r\n\r\nGateway to Bollywood assures you for providing a platform and promoting yourselves among the film makers, casting and modeling agencies, and production houses besides informing you about the latest castings and auditions. On the other hand, we are not prejudiced by your physical appearance and the background you come from. All that is needed is the zeal to move ahead in life and willingness to face the challenges with great eagerness. Gateway to Bollywood is a radical concept in the promotion of fine arts and theatre in particular. We envision providing a see-through via media between budding stars desiring for the correct launch pad into glitter town and establish leaders of the world of Bollywood.\r\n\r\n<div class="about about1">\r\n    <h2>How it works for a Recruiter ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3"> \r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Industry professionals sign up and create their a user profile with the Company Logo, Profile &amp; past work.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>Verified user by admin team after the recruiter will be allowed to access the website.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Talent nearby</strong>\r\n            <p>Once Verified – Recruiters will be able to post jobs and search for talent profiles, based on their exact requirements.</p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/contact-us.png" />\r\n               <strong>Contact us </strong> \r\n            <p>Recruiters can directly communicate with their shortlisted talent through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n<div class="about about2">\r\n    <h2>How it works for a Talent ?</h2>\r\n    <div class="row">\r\n          <div class="col-md-3">\r\n             <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/sign-up.png" />\r\n             <strong>Sign up</strong> \r\n            <p>Talent sign up and create their a user profile with their Profile picture, Skills &amp; past work.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n            <img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/verification.png" />\r\n            <strong>Verification</strong>\r\n            <p>Verified user by admin team after the talent will be allowed to access the website.</p>\r\n          </div>\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/job-op.png" />\r\n            <strong>Search for Job</strong>\r\n            <p>Once Verified, talent will have access to jobs that they would normally not even be aware of. Talent can apply for jobs and give auditions from the comfort of their home. </p>\r\n          </div>\r\n\r\n          <div class="col-md-3">\r\n          	<img src="http://projects.seawindsolution.com/five/gatewaytobollywood/wp-content/uploads/2017/09/contact-us.png" />\r\n               <strong>Contact us</strong> \r\n            <p>If Shortlisted, they can directly contact with the recruiter and finalize the job on mutual consent through the website.</p>\r\n          </div>\r\n        </div>\r\n</div>\r\n\r\n\r\n ', 'About', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2017-10-02 05:46:43', '2017-10-02 05:46:43', '', 6, 'http://projects.seawindsolution.com/five/gatewaytobollywood/2017/10/02/6-revision-v1/', 6, 'revision', '', 0),
(256, 1, '2017-10-11 11:09:41', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2017-10-11 11:09:41', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/gatewaytobollywood/?p=256', 6, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_termmeta`
--

INSERT INTO `wp_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(3, 8, 'upg_show_cate', '0');

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Main menu', 'main-menu', 0),
(3, 'Footer Menu', 'footer-menu', 0),
(4, 'Testimonial', 'testimonial', 0),
(5, 'Success Story', 'success-story', 0),
(8, 'gateway', 'gateway', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(5, 2, 0),
(8, 2, 0),
(13, 2, 0),
(24, 3, 0),
(25, 3, 0),
(26, 3, 0),
(27, 3, 0),
(28, 3, 0),
(29, 3, 0),
(49, 4, 0),
(51, 4, 0),
(53, 5, 0),
(61, 5, 0),
(63, 5, 0),
(65, 5, 0),
(115, 2, 0),
(119, 8, 0),
(121, 8, 0),
(151, 2, 0),
(237, 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 5),
(3, 3, 'nav_menu', '', 0, 6),
(4, 4, 'category', '', 0, 2),
(5, 5, 'category', '', 0, 4),
(8, 8, 'upg_cate', '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'locale', ''),
(11, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(12, 1, 'wp_user_level', '10'),
(13, 1, 'dismissed_wp_pointers', 'text_widget_custom_html'),
(14, 1, 'show_welcome_panel', '0'),
(16, 1, 'wp_dashboard_quick_press_last_post_id', '256'),
(17, 1, 'community-events-location', 'a:1:{s:2:"ip";s:2:"::";}'),
(18, 1, 'nav_menu_recently_edited', '2'),
(19, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(20, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:"add-post_tag";}'),
(21, 1, 'wp_user-settings', 'editor=html&libraryContent=browse&unfold=1&mfold=o'),
(22, 1, 'wp_user-settings-time', '1507720214'),
(25, 1, 'closedpostboxes_testimonial_rotator', 'a:0:{}'),
(26, 1, 'metaboxhidden_testimonial_rotator', 'a:1:{i:0;s:7:"slugdiv";}'),
(27, 1, 'closedpostboxes_post', 'a:0:{}'),
(28, 1, 'metaboxhidden_post', 'a:6:{i:0;s:11:"postexcerpt";i:1;s:13:"trackbacksdiv";i:2;s:16:"commentstatusdiv";i:3;s:11:"commentsdiv";i:4;s:7:"slugdiv";i:5;s:9:"authordiv";}'),
(29, 2, 'nickname', 'KK'),
(30, 2, 'first_name', 'Karan'),
(31, 2, 'last_name', 'Khanna'),
(32, 2, 'description', 'Actor, Model'),
(33, 2, 'rich_editing', 'true'),
(34, 2, 'comment_shortcuts', 'false'),
(35, 2, 'admin_color', 'fresh'),
(36, 2, 'use_ssl', '0'),
(37, 2, 'show_admin_bar_front', 'true'),
(38, 2, 'locale', ''),
(39, 2, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(40, 2, 'wp_user_level', '0'),
(42, 2, 'user_meta_image', '1504950761.jpg'),
(43, 2, 'email', 'karankhanna@mailinator.com'),
(44, 2, 'age', '22'),
(45, 2, 'complexion', 'Fair'),
(46, 2, 'eye_color', 'Black'),
(47, 2, 'hair_color', 'Brown'),
(48, 2, 'languages', 'a:2:{i:0;s:1:"1";i:1;s:1:"2";}'),
(49, 2, 'gender', '1'),
(50, 2, 'artist_category', 'a:2:{i:0;s:2:"90";i:1;s:2:"87";}'),
(51, 2, 'artist_interest', 'a:3:{i:0;s:3:"110";i:1;s:3:"104";i:2;s:2:"98";}'),
(52, 3, 'nickname', 'sanju'),
(53, 3, 'first_name', 'sanjay'),
(54, 3, 'last_name', 'patel'),
(55, 3, 'description', 'test'),
(56, 3, 'rich_editing', 'true'),
(57, 3, 'comment_shortcuts', 'false'),
(58, 3, 'admin_color', 'fresh'),
(59, 3, 'use_ssl', '0'),
(60, 3, 'show_admin_bar_front', 'true'),
(61, 3, 'locale', ''),
(62, 3, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(63, 3, 'wp_user_level', '0'),
(65, 3, 'user_meta_image', '1504954726.png'),
(66, 3, 'email', 'sanjay@seawindsolution.com'),
(67, 3, 'user_url', 'http://www.info.com'),
(68, 3, 'age', '31'),
(69, 3, 'complexion', 'dgdgd'),
(70, 3, 'eye_color', 'brown'),
(71, 3, 'hair_color', 'black'),
(72, 3, 'height', 'heihgt'),
(73, 3, 'hips', 'hips'),
(74, 3, 'languages', 'a:3:{i:0;s:1:"1";i:1;s:1:"5";i:2;s:1:"8";}'),
(75, 3, 'gender', '1'),
(76, 3, 'artist_category', 'a:1:{i:0;s:2:"90";}'),
(77, 3, 'artist_interest', 'a:2:{i:0;s:3:"110";i:1;s:3:"102";}'),
(78, 3, 'years_experience', '1'),
(79, 3, 'months_experience', '2'),
(80, 3, 'work_description', 'ttetetrtetete'),
(81, 2, 'years_experience', '5'),
(82, 2, 'months_experience', '5'),
(83, 2, 'work_description', '- I have done three films :- 1] xyz 2] dfkf 3]lkvmlkdf\r\n- I have worked on five web series'),
(84, 4, 'nickname', 'hrishank20'),
(85, 4, 'first_name', 'hrishank'),
(86, 4, 'last_name', 'Sh'),
(87, 4, 'description', 'Actor'),
(88, 4, 'rich_editing', 'true'),
(89, 4, 'comment_shortcuts', 'false'),
(90, 4, 'admin_color', 'blue'),
(91, 4, 'use_ssl', '0'),
(92, 4, 'show_admin_bar_front', 'true'),
(93, 4, 'locale', ''),
(94, 4, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(95, 4, 'wp_user_level', '0'),
(97, 4, 'community-events-location', 'a:1:{s:2:"ip";s:12:"202.179.71.0";}'),
(99, 2, 'location', 'Mumbai'),
(101, 3, 'community-events-location', 'a:1:{s:2:"ip";s:13:"103.238.106.0";}'),
(102, 5, 'nickname', 'priya'),
(103, 5, 'first_name', 'Priyank'),
(104, 5, 'last_name', 'Sharma'),
(105, 5, 'description', 'Model'),
(106, 5, 'rich_editing', 'true'),
(107, 5, 'comment_shortcuts', 'false'),
(108, 5, 'admin_color', 'fresh'),
(109, 5, 'use_ssl', '0'),
(110, 5, 'show_admin_bar_front', 'true'),
(111, 5, 'locale', ''),
(112, 5, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(113, 5, 'wp_user_level', '0'),
(115, 5, 'user_meta_image', '1505307181.jpg'),
(116, 5, 'email', 'priyanksharma@mailinator.com'),
(117, 5, 'age', '19'),
(118, 5, 'languages', 'a:2:{i:0;s:1:"1";i:1;s:1:"2";}'),
(119, 5, 'gender', '1'),
(120, 5, 'location', 'Banglore'),
(121, 5, 'artist_category', 'a:1:{i:0;s:3:"139";}'),
(122, 5, 'artist_interest', 'a:2:{i:0;s:3:"110";i:1;s:2:"98";}'),
(123, 5, 'years_experience', '1'),
(124, 5, 'months_experience', '5'),
(125, 5, 'work_description', 'Model'),
(126, 6, 'nickname', 'divya'),
(127, 6, 'first_name', 'Divya'),
(128, 6, 'last_name', 'Dutta'),
(129, 6, 'description', 'Talent'),
(130, 6, 'rich_editing', 'true'),
(131, 6, 'comment_shortcuts', 'false'),
(132, 6, 'admin_color', 'fresh'),
(133, 6, 'use_ssl', '0'),
(134, 6, 'show_admin_bar_front', 'true'),
(135, 6, 'locale', ''),
(136, 6, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(137, 6, 'wp_user_level', '0'),
(139, 6, 'user_meta_image', '1505307354.jpg'),
(140, 6, 'email', 'divyadutta@mailinator.com'),
(141, 6, 'age', '23'),
(142, 6, 'languages', 'a:4:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"5";i:3;s:1:"7";}'),
(143, 6, 'gender', '2'),
(144, 6, 'location', 'Pune'),
(145, 6, 'artist_category', 'a:2:{i:0;s:3:"139";i:1;s:3:"136";}'),
(146, 6, 'artist_interest', 'a:3:{i:0;s:3:"110";i:1;s:3:"106";i:2;s:2:"98";}'),
(147, 6, 'years_experience', '3'),
(148, 6, 'months_experience', '2'),
(149, 6, 'work_description', 'dance'),
(150, 7, 'nickname', 'samir'),
(151, 7, 'first_name', 'Samir'),
(152, 7, 'last_name', 'Nadiyadi'),
(153, 7, 'description', 'director'),
(154, 7, 'rich_editing', 'true'),
(155, 7, 'comment_shortcuts', 'false'),
(156, 7, 'admin_color', 'fresh'),
(157, 7, 'use_ssl', '0'),
(158, 7, 'show_admin_bar_front', 'true'),
(159, 7, 'locale', ''),
(160, 7, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(161, 7, 'wp_user_level', '0'),
(163, 7, 'user_meta_image', '1505307533.jpg'),
(164, 7, 'email', 'samirnadiyadi@mailinator.com'),
(165, 7, 'age', '50'),
(166, 7, 'languages', 'a:2:{i:0;s:1:"1";i:1;s:1:"2";}'),
(167, 7, 'gender', '1'),
(168, 7, 'location', 'Mumbai'),
(169, 7, 'artist_category', 'a:1:{i:0;s:2:"90";}'),
(170, 7, 'artist_interest', 'a:2:{i:0;s:3:"110";i:1;s:3:"100";}'),
(171, 7, 'years_experience', '10'),
(172, 7, 'months_experience', '5'),
(173, 7, 'work_description', 'films most'),
(174, 8, 'nickname', 'sunil'),
(175, 8, 'first_name', 'Sunil'),
(176, 8, 'last_name', 'Panchal'),
(177, 8, 'description', 'art diector'),
(178, 8, 'rich_editing', 'true'),
(179, 8, 'comment_shortcuts', 'false'),
(180, 8, 'admin_color', 'fresh'),
(181, 8, 'use_ssl', '0'),
(182, 8, 'show_admin_bar_front', 'true'),
(183, 8, 'locale', ''),
(184, 8, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(185, 8, 'wp_user_level', '0'),
(187, 8, 'user_meta_image', '1505307702.jpg'),
(188, 8, 'email', 'sunilpanchal@mailinator.com'),
(189, 8, 'age', '30'),
(190, 8, 'languages', 'a:2:{i:0;s:1:"2";i:1;s:1:"3";}'),
(191, 8, 'gender', '1'),
(192, 8, 'location', 'Ahmedabad'),
(193, 8, 'artist_category', 'a:1:{i:0;s:3:"133";}'),
(194, 8, 'artist_interest', 'a:3:{i:0;s:3:"104";i:1;s:3:"102";i:2;s:2:"98";}'),
(195, 8, 'years_experience', '2'),
(196, 8, 'months_experience', '1'),
(197, 8, 'work_description', 'art, art and art'),
(198, 9, 'nickname', 'priitu'),
(199, 9, 'first_name', 'Pritam'),
(200, 9, 'last_name', 'Saini'),
(201, 9, 'description', 'Music composer by proffession'),
(202, 9, 'rich_editing', 'true'),
(203, 9, 'comment_shortcuts', 'false'),
(204, 9, 'admin_color', 'fresh'),
(205, 9, 'use_ssl', '0'),
(206, 9, 'show_admin_bar_front', 'true'),
(207, 9, 'locale', ''),
(208, 9, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(209, 9, 'wp_user_level', '0'),
(211, 9, 'user_meta_image', '1505307865.png'),
(212, 9, 'email', 'pritamsaini@mailinator.com'),
(213, 9, 'age', '28'),
(214, 9, 'languages', 'a:2:{i:0;s:1:"1";i:1;s:1:"2";}'),
(215, 9, 'gender', '2'),
(216, 9, 'location', 'Mumbai'),
(217, 9, 'artist_category', 'a:1:{i:0;s:3:"130";}'),
(218, 9, 'artist_interest', 'a:3:{i:0;s:3:"110";i:1;s:3:"108";i:2;s:3:"100";}'),
(219, 9, 'years_experience', '3'),
(220, 9, 'months_experience', '1'),
(221, 9, 'work_description', 'Music 1\r\nMusic 2\r\nMusic 3'),
(222, 10, 'nickname', 'kk'),
(223, 10, 'first_name', 'Khoosnuma'),
(224, 10, 'last_name', 'Khan'),
(225, 10, 'description', 'model'),
(226, 10, 'rich_editing', 'true'),
(227, 10, 'comment_shortcuts', 'false'),
(228, 10, 'admin_color', 'fresh'),
(229, 10, 'use_ssl', '0'),
(230, 10, 'show_admin_bar_front', 'true'),
(231, 10, 'locale', ''),
(232, 10, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(233, 10, 'wp_user_level', '0'),
(235, 10, 'user_meta_image', '1505308103.png'),
(236, 10, 'email', 'khoosnumakhan@mailinator.com'),
(237, 10, 'age', '20'),
(238, 10, 'languages', 'a:3:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"6";}'),
(239, 10, 'gender', '2'),
(240, 10, 'location', 'Hydrabad'),
(241, 10, 'artist_category', 'a:1:{i:0;s:3:"139";}'),
(242, 10, 'artist_interest', 'a:7:{i:0;s:3:"110";i:1;s:3:"108";i:2;s:3:"106";i:3;s:3:"104";i:4;s:3:"102";i:5;s:3:"100";i:6;s:2:"98";}'),
(243, 10, 'years_experience', '1'),
(244, 10, 'months_experience', '1'),
(245, 10, 'work_description', 'modeling'),
(246, 11, 'nickname', 'mikin'),
(247, 11, 'first_name', 'Mikin'),
(248, 11, 'last_name', 'Patel'),
(249, 11, 'description', ''),
(250, 11, 'rich_editing', 'true'),
(251, 11, 'comment_shortcuts', 'false'),
(252, 11, 'admin_color', 'fresh'),
(253, 11, 'use_ssl', '0'),
(254, 11, 'show_admin_bar_front', 'true'),
(255, 11, 'locale', ''),
(256, 11, 'wp_capabilities', 'a:1:{s:9:"recruiter";b:1;}'),
(257, 11, 'wp_user_level', '0'),
(258, 11, 'session_tokens', 'a:2:{s:64:"f07acc4e3135c11002df493ee40fe364da98e4017ee770aff43b0570e8459251";a:4:{s:10:"expiration";i:1507186665;s:2:"ip";s:15:"103.250.145.139";s:2:"ua";s:102:"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36";s:5:"login";i:1505977065;}s:64:"766afd57ee78d5e8938597f264accf68b49bf4dca99bccdbdcf799e090887c05";a:4:{s:10:"expiration";i:1507210014;s:2:"ip";s:14:"43.242.116.190";s:2:"ua";s:102:"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36";s:5:"login";i:1506000414;}}'),
(260, 11, 'community-events-location', 'a:1:{s:2:"ip";s:12:"43.241.144.0";}'),
(261, 11, 'user_meta_image', '1505905191.png'),
(262, 11, 'email', 'mikinpatel@mailinator.com'),
(263, 11, 'artist_category', 'a:7:{i:0;s:3:"139";i:1;s:3:"136";i:2;s:3:"133";i:3;s:3:"130";i:4;s:3:"127";i:5;s:2:"90";i:6;s:2:"87";}'),
(264, 11, 'artist_interest', 'a:7:{i:0;s:3:"110";i:1;s:3:"108";i:2;s:3:"106";i:3;s:3:"104";i:4;s:3:"102";i:5;s:3:"100";i:6;s:2:"98";}'),
(265, 11, 'years_experience', '10'),
(266, 11, 'months_experience', '5'),
(267, 11, 'work_description', 'No 1 recruiter'),
(268, 12, 'nickname', 'global'),
(269, 12, 'first_name', 'Global'),
(270, 12, 'last_name', 'Talent'),
(271, 12, 'description', 'We are mumbai based talent recruiter.'),
(272, 12, 'rich_editing', 'true'),
(273, 12, 'comment_shortcuts', 'false'),
(274, 12, 'admin_color', 'fresh'),
(275, 12, 'use_ssl', '0'),
(276, 12, 'show_admin_bar_front', 'true'),
(277, 12, 'locale', ''),
(278, 12, 'wp_capabilities', 'a:1:{s:9:"recruiter";b:1;}'),
(279, 12, 'wp_user_level', '0'),
(281, 12, 'user_meta_image', '1505972953.jpg'),
(282, 12, 'email', 'globaltalent@mailinator.com'),
(283, 12, 'artist_category', 'a:7:{i:0;s:3:"139";i:1;s:3:"136";i:2;s:3:"133";i:3;s:3:"130";i:4;s:3:"127";i:5;s:2:"90";i:6;s:2:"87";}'),
(284, 12, 'artist_interest', 'a:7:{i:0;s:3:"110";i:1;s:3:"108";i:2;s:3:"106";i:3;s:3:"104";i:4;s:3:"102";i:5;s:3:"100";i:6;s:2:"98";}'),
(285, 12, 'years_experience', '3'),
(286, 12, 'months_experience', '5'),
(287, 12, 'work_description', '3 yrs and 300 persons recruited successfully !!'),
(288, 3, 'session_tokens', 'a:3:{s:64:"df9b4296bfaedc6dd581d75477c5812cd32f5a8935a316f57415dac5852c38d0";a:4:{s:10:"expiration";i:1507184579;s:2:"ip";s:15:"103.250.145.139";s:2:"ua";s:65:"Mozilla/5.0 (Windows NT 6.1; rv:55.0) Gecko/20100101 Firefox/55.0";s:5:"login";i:1505974979;}s:64:"b95992fabbee1511180f754f4cd512d1f501d53db8ecbcc1c59ad69176a11300";a:4:{s:10:"expiration";i:1507715284;s:2:"ip";s:14:"43.242.116.254";s:2:"ua";s:102:"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36";s:5:"login";i:1506505684;}s:64:"e14219801bb76166d13291067c3e7a8d08ddbe8feb505cca5a41af3d2d72de77";a:4:{s:10:"expiration";i:1507872005;s:2:"ip";s:14:"103.238.106.48";s:2:"ua";s:102:"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36";s:5:"login";i:1506662405;}}'),
(289, 13, 'nickname', 'directorajit'),
(290, 13, 'first_name', 'ajit'),
(291, 13, 'last_name', 'kamdar'),
(292, 13, 'description', 'I have 2 Hindi film experience as a 1 asst.director'),
(293, 13, 'rich_editing', 'true'),
(294, 13, 'comment_shortcuts', 'false'),
(295, 13, 'admin_color', 'fresh'),
(296, 13, 'use_ssl', '0'),
(297, 13, 'show_admin_bar_front', 'true'),
(298, 13, 'locale', ''),
(299, 13, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(300, 13, 'wp_user_level', '0'),
(301, 13, 'session_tokens', 'a:1:{s:64:"fb2c40a82b0dc49eca5f71d1ff7de0db811604e63128e7a7eebf5d3b70fbaecb";a:4:{s:10:"expiration";i:1507187289;s:2:"ip";s:13:"45.117.74.122";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36";s:5:"login";i:1505977689;}}'),
(302, 13, 'email', 'directorajitkamdar@gmail.com'),
(303, 13, 'age', '29'),
(304, 13, 'languages', 'a:2:{i:0;s:1:"1";i:1;s:1:"2";}'),
(305, 13, 'gender', '1'),
(306, 13, 'location', 'Mumbai'),
(307, 13, 'artist_category', 'a:2:{i:0;s:3:"127";i:1;s:2:"90";}'),
(308, 13, 'artist_interest', 'a:2:{i:0;s:3:"102";i:1;s:3:"100";}'),
(309, 13, 'years_experience', '3'),
(310, 13, 'months_experience', '9'),
(311, 13, 'work_description', '2 film experience '),
(315, 7, 'artist_category_str', '90'),
(317, 6, 'artist_category_str', '139,136'),
(319, 2, 'artist_category_str', '90,87'),
(321, 5, 'artist_category_str', '139'),
(323, 10, 'artist_category_str', '139'),
(325, 9, 'artist_category_str', '130'),
(327, 8, 'artist_category_str', '133'),
(328, 3, 'artist_category_str', '90'),
(329, 13, 'artist_category_str', '90,127'),
(330, 14, 'nickname', 'TA'),
(331, 14, 'first_name', 'Talent'),
(332, 14, 'last_name', 'Academy'),
(333, 14, 'description', 'We are TA !'),
(334, 14, 'rich_editing', 'true'),
(335, 14, 'comment_shortcuts', 'false'),
(336, 14, 'admin_color', 'fresh'),
(337, 14, 'use_ssl', '0'),
(338, 14, 'show_admin_bar_front', 'true'),
(339, 14, 'locale', ''),
(340, 14, 'wp_capabilities', 'a:1:{s:9:"recruiter";b:1;}'),
(341, 14, 'wp_user_level', '0'),
(342, 15, 'nickname', 'DA'),
(343, 15, 'first_name', 'Dance'),
(344, 15, 'last_name', 'Academy'),
(345, 15, 'description', 'We are DA'),
(346, 15, 'rich_editing', 'true'),
(347, 15, 'comment_shortcuts', 'false'),
(348, 15, 'admin_color', 'fresh'),
(349, 15, 'use_ssl', '0'),
(350, 15, 'show_admin_bar_front', 'true'),
(351, 15, 'locale', ''),
(352, 15, 'wp_capabilities', 'a:1:{s:9:"recruiter";b:1;}'),
(353, 15, 'wp_user_level', '0'),
(354, 16, 'nickname', 'WeDA'),
(355, 16, 'first_name', 'Dance'),
(356, 16, 'last_name', 'Academy'),
(357, 16, 'description', 'WeDA'),
(358, 16, 'rich_editing', 'true'),
(359, 16, 'comment_shortcuts', 'false'),
(360, 16, 'admin_color', 'fresh'),
(361, 16, 'use_ssl', '0'),
(362, 16, 'show_admin_bar_front', 'true'),
(363, 16, 'locale', ''),
(364, 16, 'wp_capabilities', 'a:1:{s:9:"recruiter";b:1;}'),
(365, 16, 'wp_user_level', '0'),
(366, 17, 'nickname', 'Ripple C'),
(367, 17, 'first_name', 'Ripple'),
(368, 17, 'last_name', 'C'),
(369, 17, 'description', 'We are talent consultancy.'),
(370, 17, 'rich_editing', 'true'),
(371, 17, 'comment_shortcuts', 'false'),
(372, 17, 'admin_color', 'fresh'),
(373, 17, 'use_ssl', '0'),
(374, 17, 'show_admin_bar_front', 'true'),
(375, 17, 'locale', ''),
(376, 17, 'wp_capabilities', 'a:1:{s:9:"recruiter";b:1;}'),
(377, 17, 'wp_user_level', '0'),
(378, 18, 'nickname', '247'),
(379, 18, 'first_name', 'Twenty Four'),
(380, 18, 'last_name', 'Seven'),
(381, 18, 'description', ''),
(382, 18, 'rich_editing', 'true'),
(383, 18, 'comment_shortcuts', 'false'),
(384, 18, 'admin_color', 'fresh'),
(385, 18, 'use_ssl', '0'),
(386, 18, 'show_admin_bar_front', 'true'),
(387, 18, 'locale', ''),
(388, 18, 'wp_capabilities', 'a:1:{s:9:"recruiter";b:1;}'),
(389, 18, 'wp_user_level', '0'),
(390, 19, 'nickname', 'SEAC'),
(391, 19, 'first_name', 'Sea'),
(392, 19, 'last_name', 'C'),
(393, 19, 'description', ''),
(394, 19, 'rich_editing', 'true'),
(395, 19, 'comment_shortcuts', 'false'),
(396, 19, 'admin_color', 'fresh'),
(397, 19, 'use_ssl', '0'),
(398, 19, 'show_admin_bar_front', 'true'),
(399, 19, 'locale', ''),
(400, 19, 'wp_capabilities', 'a:1:{s:9:"recruiter";b:1;}'),
(401, 19, 'wp_user_level', '0'),
(402, 20, 'nickname', 'Sri'),
(403, 20, 'first_name', 'Sri'),
(404, 20, 'last_name', 'Consult'),
(405, 20, 'description', ''),
(406, 20, 'rich_editing', 'true'),
(407, 20, 'comment_shortcuts', 'false'),
(408, 20, 'admin_color', 'fresh'),
(409, 20, 'use_ssl', '0'),
(410, 20, 'show_admin_bar_front', 'true'),
(411, 20, 'locale', ''),
(412, 20, 'wp_capabilities', 'a:1:{s:9:"recruiter";b:1;}'),
(413, 20, 'wp_user_level', '0'),
(414, 21, 'nickname', 'Raj'),
(415, 21, 'first_name', 'Raj'),
(416, 21, 'last_name', 'Malhotra'),
(417, 21, 'description', ''),
(418, 21, 'rich_editing', 'true'),
(419, 21, 'comment_shortcuts', 'false'),
(420, 21, 'admin_color', 'fresh'),
(421, 21, 'use_ssl', '0'),
(422, 21, 'show_admin_bar_front', 'true'),
(423, 21, 'locale', ''),
(424, 21, 'wp_capabilities', 'a:1:{s:9:"recruiter";b:1;}'),
(425, 21, 'wp_user_level', '0'),
(426, 22, 'nickname', 'fake'),
(427, 22, 'first_name', 'Fake'),
(428, 22, 'last_name', 'Recruiter'),
(429, 22, 'description', ''),
(430, 22, 'rich_editing', 'true'),
(431, 22, 'comment_shortcuts', 'false'),
(432, 22, 'admin_color', 'fresh'),
(433, 22, 'use_ssl', '0'),
(434, 22, 'show_admin_bar_front', 'true'),
(435, 22, 'locale', ''),
(436, 22, 'wp_capabilities', 'a:1:{s:9:"recruiter";b:1;}'),
(437, 22, 'wp_user_level', '0'),
(438, 22, 'pw_user_status', 'approved'),
(439, 11, 'default_password_nag', ''),
(440, 6, 'session_tokens', 'a:4:{s:64:"183213673685a19f996820c35d2b0e06463487c4a750ceb9021d66066614f9ed";a:4:{s:10:"expiration";i:1507284395;s:2:"ip";s:15:"103.250.145.245";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36";s:5:"login";i:1506074795;}s:64:"c862c30323d6ba8116818ab838b2cb7e0e8a8885a33d46c3d9cd1ddddb02a5d2";a:4:{s:10:"expiration";i:1507287250;s:2:"ip";s:15:"103.250.145.245";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36";s:5:"login";i:1506077650;}s:64:"30e0c9cb99f47101824f409b07adf8e09f899951bd7f9d3030e4643d9f947191";a:4:{s:10:"expiration";i:1507292292;s:2:"ip";s:15:"103.250.145.245";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36";s:5:"login";i:1506082692;}s:64:"f73ea500430ba9d69e9cd7fa09b351133c90e03484bca6c39a1fe6ee1edbbe5a";a:4:{s:10:"expiration";i:1507639643;s:2:"ip";s:13:"43.242.116.19";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:55.0) Gecko/20100101 Firefox/55.0";s:5:"login";i:1506430043;}}'),
(441, 6, 'pw_new_user_approve_has_signed_in', '1506074795'),
(442, 23, 'nickname', 'some'),
(443, 23, 'first_name', 'Some'),
(444, 23, 'last_name', 'Agent'),
(445, 23, 'description', ''),
(446, 23, 'rich_editing', 'true'),
(447, 23, 'comment_shortcuts', 'false'),
(448, 23, 'admin_color', 'fresh'),
(449, 23, 'use_ssl', '0'),
(450, 23, 'show_admin_bar_front', 'true'),
(451, 23, 'locale', ''),
(452, 23, 'wp_capabilities', 'a:1:{s:9:"recruiter";b:1;}'),
(453, 23, 'wp_user_level', '0'),
(454, 23, 'pw_user_status', 'approved'),
(456, 23, 'pw_new_user_approve_has_signed_in', '1506081578'),
(457, 11, 'pw_new_user_approve_has_signed_in', '1506422976'),
(458, 1, 'pw_new_user_approve_has_signed_in', '1506428959'),
(459, 1, 'session_tokens', 'a:2:{s:64:"2ca75ac3316d2699cc76a684f04fc426c240fc79b03f75830ee7862a8d10655a";a:4:{s:10:"expiration";i:1507892978;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:76:"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:56.0) Gecko/20100101 Firefox/56.0";s:5:"login";i:1507720178;}s:64:"5b3ebb8940f048941148215744f398e8e984bbd65f9318dd26e14fa802337394";a:4:{s:10:"expiration";i:1507978272;s:2:"ip";s:3:"::1";s:2:"ua";s:105:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36";s:5:"login";i:1507805472;}}'),
(460, 1, 'pw_new_user_approve_settings_notice', '1'),
(461, 3, 'pw_new_user_approve_has_signed_in', '1506497906'),
(462, 24, 'nickname', 'sanju'),
(463, 24, 'first_name', 'sanjay'),
(464, 24, 'last_name', 'patel'),
(465, 24, 'description', 'testststss'),
(466, 24, 'rich_editing', 'true'),
(467, 24, 'comment_shortcuts', 'false'),
(468, 24, 'admin_color', 'fresh'),
(469, 24, 'use_ssl', '0'),
(470, 24, 'show_admin_bar_front', 'true'),
(471, 24, 'locale', ''),
(472, 24, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(473, 24, 'wp_user_level', '0'),
(474, 24, 'pw_user_status', 'pending'),
(475, 25, 'nickname', 'sanju'),
(476, 25, 'first_name', 'sanjay'),
(477, 25, 'last_name', 'patel'),
(478, 25, 'description', 'testststss'),
(479, 25, 'rich_editing', 'true'),
(480, 25, 'comment_shortcuts', 'false'),
(481, 25, 'admin_color', 'fresh'),
(482, 25, 'use_ssl', '0'),
(483, 25, 'show_admin_bar_front', 'true'),
(484, 25, 'locale', ''),
(485, 25, 'wp_capabilities', 'a:1:{s:9:"recruiter";b:1;}'),
(486, 25, 'wp_user_level', '0'),
(487, 25, 'pw_user_status', 'pending'),
(488, 3, 'location', 'ah'),
(490, 9, 'pw_new_user_approve_has_signed_in', '1506514845'),
(491, 26, 'nickname', 'sushi'),
(492, 26, 'first_name', 'Sushant'),
(493, 26, 'last_name', 'Rajput'),
(494, 26, 'description', ''),
(495, 26, 'rich_editing', 'true'),
(496, 26, 'comment_shortcuts', 'false'),
(497, 26, 'admin_color', 'fresh'),
(498, 26, 'use_ssl', '0'),
(499, 26, 'show_admin_bar_front', 'true'),
(500, 26, 'locale', ''),
(501, 26, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(502, 26, 'wp_user_level', '0'),
(503, 26, 'pw_user_status', 'approved'),
(505, 26, 'pw_new_user_approve_has_signed_in', '1506516541'),
(506, 4, 'pw_new_user_approve_has_signed_in', '1506598859'),
(508, 8, 'pw_new_user_approve_has_signed_in', '1506604661'),
(509, 27, 'nickname', 'rohan'),
(510, 27, 'first_name', 'maddy'),
(511, 27, 'last_name', 'kumar'),
(512, 27, 'description', 'Director'),
(513, 27, 'rich_editing', 'true'),
(514, 27, 'comment_shortcuts', 'false'),
(515, 27, 'admin_color', 'fresh'),
(516, 27, 'use_ssl', '0'),
(517, 27, 'show_admin_bar_front', 'true'),
(518, 27, 'locale', ''),
(519, 27, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(520, 27, 'wp_user_level', '0'),
(521, 27, 'pw_user_status', 'pending'),
(522, 28, 'nickname', 'deep'),
(523, 28, 'first_name', 'deepak'),
(524, 28, 'last_name', 'Singh'),
(525, 28, 'description', 'actor'),
(526, 28, 'rich_editing', 'true'),
(527, 28, 'comment_shortcuts', 'false'),
(528, 28, 'admin_color', 'fresh'),
(529, 28, 'use_ssl', '0'),
(530, 28, 'show_admin_bar_front', 'true'),
(531, 28, 'locale', ''),
(532, 28, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(533, 28, 'wp_user_level', '0'),
(534, 28, 'pw_user_status', 'pending'),
(536, 4, 'user_meta_image', '1506616379.jpg'),
(537, 4, 'email', 'hrishank20@gmail.com'),
(538, 4, 'age', '22'),
(539, 4, 'languages', 'a:2:{i:0;s:1:"1";i:1;s:1:"2";}'),
(540, 4, 'gender', '1'),
(541, 4, 'location', 'Mumbai'),
(542, 4, 'artist_category_str', '139,87'),
(543, 4, 'artist_category', 'a:2:{i:0;s:3:"139";i:1;s:2:"87";}'),
(544, 4, 'artist_interest', 'a:7:{i:0;s:3:"110";i:1;s:3:"108";i:2;s:3:"106";i:3;s:3:"104";i:4;s:3:"102";i:5;s:3:"100";i:6;s:2:"98";}'),
(545, 4, 'years_experience', '1'),
(546, 4, 'months_experience', '1'),
(547, 4, 'work_description', 'worked in film'),
(549, 2, 'pw_new_user_approve_has_signed_in', '1507720432'),
(550, 29, 'nickname', 'shakko'),
(551, 29, 'first_name', 'Shakti'),
(552, 29, 'last_name', 'Devi'),
(553, 29, 'description', 'Dancer !'),
(554, 29, 'rich_editing', 'true'),
(555, 29, 'comment_shortcuts', 'false'),
(556, 29, 'admin_color', 'fresh'),
(557, 29, 'use_ssl', '0'),
(558, 29, 'show_admin_bar_front', 'true'),
(559, 29, 'locale', ''),
(560, 29, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(561, 29, 'wp_user_level', '0'),
(562, 29, 'pw_user_status', 'pending'),
(563, 30, 'nickname', 'MD'),
(564, 30, 'first_name', 'Mukti'),
(565, 30, 'last_name', 'Devi'),
(566, 30, 'description', ''),
(567, 30, 'rich_editing', 'true'),
(568, 30, 'comment_shortcuts', 'false'),
(569, 30, 'admin_color', 'fresh'),
(570, 30, 'use_ssl', '0'),
(571, 30, 'show_admin_bar_front', 'true'),
(572, 30, 'locale', ''),
(573, 30, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(574, 30, 'wp_user_level', '0'),
(575, 30, 'pw_user_status', 'pending'),
(576, 31, 'nickname', 'Bhakt'),
(577, 31, 'first_name', 'Bhakti'),
(578, 31, 'last_name', 'Devi'),
(579, 31, 'description', 'Dancing doll'),
(580, 31, 'rich_editing', 'true'),
(581, 31, 'comment_shortcuts', 'false'),
(582, 31, 'admin_color', 'fresh'),
(583, 31, 'use_ssl', '0'),
(584, 31, 'show_admin_bar_front', 'true'),
(585, 31, 'locale', ''),
(586, 31, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(587, 31, 'wp_user_level', '0'),
(588, 31, 'pw_user_status', 'approved'),
(589, 31, 'mobileno', '9998887770'),
(591, 31, 'pw_new_user_approve_has_signed_in', '1507724300'),
(592, 32, 'nickname', 'sag'),
(593, 32, 'first_name', 'Sagar'),
(594, 32, 'last_name', 'Trivedi'),
(595, 32, 'description', 'photographer'),
(596, 32, 'rich_editing', 'true'),
(597, 32, 'comment_shortcuts', 'false'),
(598, 32, 'admin_color', 'fresh'),
(599, 32, 'use_ssl', '0'),
(600, 32, 'show_admin_bar_front', 'true'),
(601, 32, 'locale', ''),
(602, 32, 'wp_capabilities', 'a:1:{s:6:"artist";b:1;}'),
(603, 32, 'wp_user_level', '0'),
(604, 32, 'pw_user_status', 'pending'),
(605, 32, 'mobileno', '79465455558'),
(606, 31, 'session_tokens', 'a:1:{s:64:"1413957b978564871843fdd91d2d30ae4088f1dbe8443d0862765eacc9942d72";a:4:{s:10:"expiration";i:1507899366;s:2:"ip";s:3:"::1";s:2:"ua";s:105:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36";s:5:"login";i:1507726566;}}'),
(607, 31, 'user_meta_image', '1507727630.jpg'),
(608, 31, 'email', 'bhaktidevi@mailinator.com'),
(609, 9998887771, 'mobileno', ''),
(610, 31, 'age', '20'),
(611, 31, 'languages', 'a:1:{i:0;s:1:"2";}'),
(612, 31, 'gender', '2'),
(613, 31, 'location', 'Pune');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$Bzhhrpor1Ue/8w90ZVJqGBTBoCxLfg0', 'admin', 'chintan@seawindsolution.com', '', '2017-09-07 04:49:39', '', 0, 'admin'),
(2, 'karankhanna', '$P$B0kJb2gTLHf7kdYjPYd9DTHfvbkZGn/', 'karankhanna', 'karankhanna@mailinator.com', '', '2017-09-09 09:50:46', '', 0, 'Karan Khanna'),
(3, 'sanjay', '$P$BEJuZWYKcKPbjtFiZ.xid.tGZHPegv0', 'sanjay', 'sanjay@seawindsolution.com', '', '2017-09-09 10:12:59', '', 0, 'sanjay patel'),
(4, 'hrishank20', '$P$BAy5oRFqncdn1AlZ6ebbHJno0C6H/T1', 'hrishank20', 'hrishank20@gmail.com', '', '2017-09-09 16:26:28', '', 0, 'hrishank Sh'),
(5, 'priyanksharma', '$P$BNxFQAeD0kCVlQRjRTjCllmbgV2TIZ/', 'priyanksharma', 'priyanksharma@mailinator.com', '', '2017-09-13 12:52:10', '', 0, 'Priyank Sharma'),
(6, 'divyadutta', '$P$BKlEz4AtwVtiRab1etCBU99X28iM0k.', 'divyadutta', 'divyadutta@mailinator.com', '', '2017-09-13 12:54:21', '', 0, 'Divya Dutta'),
(7, 'samirnadiyadi', '$P$BmavKHh.YBI284xDhOQExjfHNwJuRJ1', 'samirnadiyadi', 'samirnadiyadi@mailinator.com', '', '2017-09-13 12:57:48', '', 0, 'Samir Nadiyadi'),
(8, 'sunilpanchal', '$P$B8099YXEKq2AMybRv2.DFg42hzp1Uj0', 'sunilpanchal', 'sunilpanchal@mailinator.com', '', '2017-09-13 13:00:45', '', 0, 'Sunil Panchal'),
(9, 'pritamsaini', '$P$BgIHrghIrznQ8ZPoZ3jxAFk0A70De91', 'pritamsaini', 'pritamsaini@mailinator.com', '', '2017-09-13 13:03:33', '', 0, 'Pritam Saini'),
(10, 'khoosnumakhan', '$P$BfB9c0F9OJEyfnzOQ/hV6vi1ikbSwE1', 'khoosnumakhan', 'khoosnumakhan@mailinator.com', '', '2017-09-13 13:07:40', '', 0, 'Khoosnuma Khan'),
(11, 'mikinpatel', '$P$BE6MbQUrE53ptLJQ37/LWw9z1zc4b9.', 'mikinpatel', 'mikinpatel@mailinator.com', '', '2017-09-19 09:22:10', '', 0, 'Mikin Patel'),
(12, 'globaltalent', '$P$BF6vSBBHZa9eaomX5cDacPeQDiVvnA0', 'globaltalent', 'globaltalent@mailinator.com', '', '2017-09-21 05:47:21', '', 0, 'Global Talent'),
(13, 'directorajit', '$P$BNgX6.152oF/CP5sZK6.wKSgkENtOJ/', 'directorajit', 'directorajitkamdar@gmail.com', '', '2017-09-21 07:07:30', '', 0, 'ajit kamdar'),
(14, 'talentacademy', '$P$BLQ3Re/vxtZJfOPXXJ.rRJKEk21De3/', 'talentacademy', 'talentacademy@mailinator.com', '', '2017-09-21 12:16:42', '1505996204:$P$BAlHDCaN5xSbql8HRdGc.WoGmzkn661', 0, 'Talent Academy'),
(15, 'danceacademy', '$P$Bq07tzykIfTLClAFP0nDCmy0G8.zNL1', 'danceacademy', 'danceacademy@mailinator.com', '', '2017-09-21 12:23:14', '1505996596:$P$BqvZO9DAaOVr7F1Vsxu1jpk00rdcV30', 0, 'Dance Academy'),
(16, 'wedanceacademy', '$P$Buzku7eA.e3l6Wv5xLoYoPvDeswABR0', 'wedanceacademy', 'wedanceacademy@mailinator.com', '', '2017-09-21 12:25:52', '1505996754:$P$Bj1QhiiM/9FqRJLVOLvM3t/K8ujKnp.', 0, 'Dance Academy'),
(17, 'rippleconsultancy', '$P$Bpc3FjWkNBHBQy15sSIHLI34x5Zg1h0', 'rippleconsultancy', 'rippleconsultancy@mailinator.com', '', '2017-09-21 12:29:07', '1505996949:$P$BwO8Okg1MZ1/eDeQjfAMJfattGJUAV/', 0, 'Ripple C'),
(18, '247consultancy', '$P$BrUixBCSeDTZO8U17pkHmecSps7GdQ/', '247consultancy', '247consultancy@mailinator.com', '', '2017-09-21 12:32:32', '', 0, 'Twenty Four Seven'),
(19, 'seaconsultancy', '$P$BllDRKCDtIbBWNqDMMkH8BPJYHom81.', 'seaconsultancy', 'seaconsultancy@mailinator.com', '', '2017-09-21 12:42:20', '', 0, 'Sea C'),
(20, 'sriconsult', '$P$BXKxQuS12hRu3AloF0gIyZWLdcLPFC.', 'sriconsult', 'sriconsult@mailinator.com', '', '2017-09-21 12:48:28', '', 0, 'Sri Consult'),
(21, 'rajconsultancy', '$P$BgZyJO194fq5aw3yZQn36Yc1Vn5yQ40', 'rajconsultancy', 'rajconsultancy@mailinator.com', '', '2017-09-21 12:51:08', '', 0, 'Raj Malhotra'),
(22, 'fakerecruiter', '$P$BtIcnSUrg15iMIMgB34U2fn2qDeIzn/', 'fakerecruiter', 'fakerecruiter@mailinator.com', '', '2017-09-22 08:05:08', '1506516494:$P$BKCCZPm15IgYO1bNZL3nEgOG7Rac7Z1', 0, 'Fake Recruiter'),
(23, 'someagent', '$P$B0LqXldyhTwXYbPJxiUzcGfKyiNIw60', 'someagent', 'someagent@mailinator.com', '', '2017-09-22 11:58:36', '1506081566:$P$BlHMvAD80XaaelkxUYwxnfyrtwi1ih/', 0, 'Some Agent'),
(24, 'sanjaypatel', '$P$BXEOVrU5fs6x7KCLil1IGHVQWTwMSw1', 'sanjaypatel', 'sanjay1@seawindsolution.com', '', '2017-09-27 09:43:55', '', 0, 'sanjay patel'),
(25, 'sanjaypatel1', '$P$B/NRtW9CoaDdf2GqL2tpIyY7ynWmTX.', 'sanjaypatel1', 'sanjay2@seawindsolution.com', '', '2017-09-27 09:46:10', '', 0, 'sanjay patel'),
(26, 'sushantrajput', '$P$Bh1d7yaMiaHgUaHibGXjJdPRkti38C0', 'sushantrajput', 'sushantrajput@mailinator.com', '', '2017-09-27 12:47:50', '1506516500:$P$BscsJNMpQY3hjGWVFnYLsiAL9Q9Q3z0', 0, 'Sushant Rajput'),
(27, 'Maddy kumar', '$P$B.SjvyDd6kSxSFjPwZThP.NdUz/4Eh/', 'maddy-kumar', 'khera.pro@gmail.com', '', '2017-09-28 16:08:03', '', 0, 'maddy kumar'),
(28, 'deepak', '$P$BvuKw26jjnne0n.2O74UVDa7mbrJxY/', 'deepak', 'info.deep20@gmail.com', '', '2017-09-28 16:30:36', '', 0, 'deepak Singh'),
(29, 'shaktidevi', '$P$B7CnLoej14R5SjsVJQ8FREs.kH.Unj1', 'shaktidevi', 'shaktidevi@mailinator.com', '', '2017-10-11 11:52:16', '', 0, 'Shakti Devi'),
(30, 'muktidevi', '$P$BotqyYSJOWww.nORWkC6mnbboAiXrz1', 'muktidevi', 'muktidevi@mailinator.com', '', '2017-10-11 12:08:04', '', 0, 'Mukti Devi'),
(31, 'bhaktidevi', '$P$BwBilPuqxeN7fdoWBdvj91/6ImveUZ1', 'bhaktidevi', 'bhaktidevi@mailinator.com', '', '2017-10-11 12:13:41', '1507724254:$P$B/PBDrm7jZwHH5WMgzEdJJhLdKhSZ8.', 0, 'Bhakti Devi'),
(32, 'sagartrivedi', '$P$BvVwico/H8EgEG1ZkmOTtLQlJmRUCQ/', 'sagartrivedi', 'sagartrivedi@mailinator.com', '', '2017-10-11 12:29:33', '', 0, 'Sagar Trivedi');

-- --------------------------------------------------------

--
-- Table structure for table `wp_visual_form_builder_entries`
--

CREATE TABLE `wp_visual_form_builder_entries` (
  `entries_id` bigint(20) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `data` longtext NOT NULL,
  `subject` text,
  `sender_name` varchar(255) DEFAULT NULL,
  `sender_email` varchar(255) DEFAULT NULL,
  `emails_to` text,
  `date_submitted` datetime DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `entry_approved` varchar(20) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_visual_form_builder_fields`
--

CREATE TABLE `wp_visual_form_builder_fields` (
  `field_id` bigint(20) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `field_key` varchar(255) NOT NULL,
  `field_type` varchar(25) NOT NULL,
  `field_options` text,
  `field_description` text,
  `field_name` text NOT NULL,
  `field_sequence` bigint(20) DEFAULT '0',
  `field_parent` bigint(20) DEFAULT '0',
  `field_validation` varchar(25) DEFAULT NULL,
  `field_required` varchar(25) DEFAULT NULL,
  `field_size` varchar(25) DEFAULT 'medium',
  `field_css` varchar(255) DEFAULT NULL,
  `field_layout` varchar(255) DEFAULT NULL,
  `field_default` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_visual_form_builder_fields`
--

INSERT INTO `wp_visual_form_builder_fields` (`field_id`, `form_id`, `field_key`, `field_type`, `field_options`, `field_description`, `field_name`, `field_sequence`, `field_parent`, `field_validation`, `field_required`, `field_size`, `field_css`, `field_layout`, `field_default`) VALUES
(1, 1, 'fill-your-inquiry', 'fieldset', '', '', 'Fill your Inquiry', 0, 0, '', '', '', '', '', ''),
(2, 1, 'verification', 'verification', '', '', 'Verification', 5, 0, '', '', '', '', '', ''),
(3, 1, 'please-enter-any-two-digits', 'secret', '', 'Example: 12', 'Please enter any two digits', 6, 2, '', 'yes', 'medium', '', '', ''),
(4, 1, 'submit', 'submit', '', '', 'Submit', 7, 2, '', '', '', '', '', ''),
(5, 1, 'your-name', 'text', '', '', 'Your Name', 1, 0, '', 'yes', 'large', '', '', ''),
(6, 1, 'your-email', 'text', '', '', 'Your Email', 2, 0, 'email', 'yes', 'large', '', '', ''),
(7, 1, 'inquiry-for', 'text', '', '', 'Inquiry For', 3, 0, '', 'yes', 'large', '', '', ''),
(8, 1, 'write-your-inquiry-in-detail', 'textarea', '', '', 'Write your inquiry in detail', 4, 0, '', 'yes', 'medium', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_visual_form_builder_forms`
--

CREATE TABLE `wp_visual_form_builder_forms` (
  `form_id` bigint(20) NOT NULL,
  `form_key` tinytext NOT NULL,
  `form_title` text NOT NULL,
  `form_email_subject` text,
  `form_email_to` text,
  `form_email_from` varchar(255) DEFAULT NULL,
  `form_email_from_name` varchar(255) DEFAULT NULL,
  `form_email_from_override` varchar(255) DEFAULT NULL,
  `form_email_from_name_override` varchar(255) DEFAULT NULL,
  `form_success_type` varchar(25) DEFAULT 'text',
  `form_success_message` text,
  `form_notification_setting` varchar(25) DEFAULT NULL,
  `form_notification_email_name` varchar(255) DEFAULT NULL,
  `form_notification_email_from` varchar(255) DEFAULT NULL,
  `form_notification_email` varchar(25) DEFAULT NULL,
  `form_notification_subject` varchar(255) DEFAULT NULL,
  `form_notification_message` text,
  `form_notification_entry` varchar(25) DEFAULT NULL,
  `form_label_alignment` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_visual_form_builder_forms`
--

INSERT INTO `wp_visual_form_builder_forms` (`form_id`, `form_key`, `form_title`, `form_email_subject`, `form_email_to`, `form_email_from`, `form_email_from_name`, `form_email_from_override`, `form_email_from_name_override`, `form_success_type`, `form_success_message`, `form_notification_setting`, `form_notification_email_name`, `form_notification_email_from`, `form_notification_email`, `form_notification_subject`, `form_notification_message`, `form_notification_entry`, `form_label_alignment`) VALUES
(1, 'contact-us', 'Contact Us', 'Contact-us Inquiry', 'a:1:{i:0;s:27:"chintan@seawindsolution.com";}', 'chintan@seawindsolution.com', 'Gateway to Bollywood', '', '', 'text', '&lt;p id=\\"form_success\\"&gt;Your form was successfully submitted. Thank you for contacting us.&lt;/p&gt;', '', '', '', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_gateway_bollywood_fields`
--
ALTER TABLE `wp_gateway_bollywood_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_gateway_bollywood_jobs`
--
ALTER TABLE `wp_gateway_bollywood_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `wp_visual_form_builder_entries`
--
ALTER TABLE `wp_visual_form_builder_entries`
  ADD PRIMARY KEY (`entries_id`);

--
-- Indexes for table `wp_visual_form_builder_fields`
--
ALTER TABLE `wp_visual_form_builder_fields`
  ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `wp_visual_form_builder_forms`
--
ALTER TABLE `wp_visual_form_builder_forms`
  ADD PRIMARY KEY (`form_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_gateway_bollywood_fields`
--
ALTER TABLE `wp_gateway_bollywood_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `wp_gateway_bollywood_jobs`
--
ALTER TABLE `wp_gateway_bollywood_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=811;
--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;
--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;
--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=614;
--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `wp_visual_form_builder_entries`
--
ALTER TABLE `wp_visual_form_builder_entries`
  MODIFY `entries_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_visual_form_builder_fields`
--
ALTER TABLE `wp_visual_form_builder_fields`
  MODIFY `field_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `wp_visual_form_builder_forms`
--
ALTER TABLE `wp_visual_form_builder_forms`
  MODIFY `form_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
