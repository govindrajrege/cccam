-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 06, 2020 at 06:52 PM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `multics_dbv2`
--

-- --------------------------------------------------------

--
-- Table structure for table `ban_emails`
--

CREATE TABLE IF NOT EXISTS `ban_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ban_ips`
--

CREATE TABLE IF NOT EXISTS `ban_ips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cronjobs`
--

CREATE TABLE IF NOT EXISTS `cronjobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `filename` text NOT NULL,
  `run_per_mins` int(11) NOT NULL DEFAULT '1',
  `enabled` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `cronjobs`
--

INSERT INTO `cronjobs` (`id`, `description`, `filename`, `run_per_mins`, `enabled`) VALUES
(1, 'MultiCS Config Update', 'multics_cronjob.php', 1, 0),
(2, 'MultiCS Resharing Monitor', 'monitor_cronjob.php', 1, 1),
(3, 'MultiCS Line Online Status', 'online_cronjob.php', 2, 1),
(4, 'Notifies the user of the expiration date of his line (via email)', 'notify_cronjob.php', 4, 1),
(5, 'Check Online Status For MultiCS Servers', 'check_status_cronjob.php', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages`
--

CREATE TABLE IF NOT EXISTS `custom_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` text NOT NULL,
  `page_content` text NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `emulators`
--

CREATE TABLE IF NOT EXISTS `emulators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emulator_name` varchar(20) NOT NULL,
  `user_access` int(11) NOT NULL,
  `can_multiple` int(11) NOT NULL,
  `default_server_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `emulators`
--

INSERT INTO `emulators` (`id`, `emulator_name`, `user_access`, `can_multiple`, `default_server_id`) VALUES
(1, 'CCcam', 1, 1, 0),
(2, 'MgCamd', 1, 1, 0),
(3, 'NewCamd', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `group_packages`
--

CREATE TABLE IF NOT EXISTS `group_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=115 ;

--
-- Dumping data for table `group_packages`
--

INSERT INTO `group_packages` (`id`, `group_id`, `package_id`) VALUES
(6, 3, 1),
(5, 1, 1),
(3, 1, 2),
(4, 3, 2),
(7, 1, 3),
(8, 3, 3),
(9, 1, 4),
(10, 3, 4),
(11, 1, 5),
(12, 3, 5),
(16, 3, 6),
(15, 1, 6),
(20, 3, 7),
(19, 1, 7),
(21, 1, 8),
(22, 3, 8),
(23, 1, 9),
(24, 3, 9),
(25, 1, 10),
(26, 3, 10),
(92, 3, 11),
(91, 1, 11),
(100, 3, 12),
(99, 1, 12),
(104, 3, 13),
(103, 1, 13),
(109, 4, 14),
(108, 3, 14),
(107, 1, 14),
(67, 1, 19),
(68, 3, 19),
(69, 4, 19),
(113, 4, 1),
(96, 3, 21),
(95, 1, 21),
(114, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_title` varchar(10) NOT NULL,
  `file_name` text NOT NULL,
  `default_guests` int(11) NOT NULL DEFAULT '0',
  `can_delete` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `lang_title`, `file_name`, `default_guests`, `can_delete`) VALUES
(1, 'English', 'english', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lines`
--

CREATE TABLE IF NOT EXISTS `lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `server_id` int(11) NOT NULL,
  `date_start` int(11) NOT NULL,
  `date_end` int(11) DEFAULT NULL,
  `profiles` text NOT NULL,
  `test_line` tinyint(4) NOT NULL,
  `blocked` int(11) NOT NULL DEFAULT '0',
  `enable` int(11) NOT NULL DEFAULT '1',
  `notes` varchar(25) DEFAULT NULL,
  `user_paid` double NOT NULL DEFAULT '0',
  `line_options` text NOT NULL,
  `monitor_exclude` int(11) NOT NULL DEFAULT '0',
  `allow_ch_emu` int(11) NOT NULL DEFAULT '1',
  `reshare` int(11) NOT NULL DEFAULT '0',
  `online` int(11) NOT NULL DEFAULT '0',
  `multics_id` int(11) NOT NULL DEFAULT '0',
  `notified_expire` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `server_id` (`server_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `lines_options`
--

CREATE TABLE IF NOT EXISTS `lines_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_name` text NOT NULL,
  `duration` int(11) NOT NULL,
  `duration_in` varchar(1) NOT NULL,
  `option_type` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `normal_price` double NOT NULL,
  `profiles` text NOT NULL,
  `info` text NOT NULL,
  `allow_ch_emu` int(11) NOT NULL DEFAULT '1',
  `monitor_exclude` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `member_groups`
--

CREATE TABLE IF NOT EXISTS `member_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` text NOT NULL,
  `group_color` varchar(7) NOT NULL DEFAULT '#000000',
  `is_banned` tinyint(4) NOT NULL DEFAULT '0',
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `percent_discount` int(11) NOT NULL DEFAULT '0',
  `total_testlines` int(11) NOT NULL DEFAULT '1',
  `can_delete` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `member_groups`
--

INSERT INTO `member_groups` (`id`, `group_name`, `group_color`, `is_banned`, `is_admin`, `percent_discount`, `total_testlines`, `can_delete`) VALUES
(1, 'Administrators', '#008852', 0, 1, 0, 10, 0),
(2, 'Banned', '#030301', 1, 0, 0, 0, 0),
(3, 'Registered Users', '#0c00ff', 0, 0, 0, 1, 0),
(4, 'Reseller - 12 Month', '#3e26d6', 0, 0, 50, 100, 0),
(5, 'Pro-Reseller', '#d46000', 0, 0, 0, 50, 0),
(6, 'Sub-Reseller', '#049312', 0, 0, 0, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `monitor`
--

CREATE TABLE IF NOT EXISTS `monitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_id` int(11) NOT NULL,
  `latest_zaps` int(11) NOT NULL,
  `diff` int(11) NOT NULL,
  `warnings` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `multics_config_vars`
--

CREATE TABLE IF NOT EXISTS `multics_config_vars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_value_name` text NOT NULL,
  `config_value` text NOT NULL,
  `master_server_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=100 ;

-- --------------------------------------------------------

--
-- Table structure for table `multics_licence`
--

CREATE TABLE IF NOT EXISTS `multics_licence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `licence_key` varchar(29) NOT NULL,
  `show_message` tinyint(4) NOT NULL,
  `update_available` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `multics_licence`
--

INSERT INTO `multics_licence` (`id`, `licence_key`, `show_message`, `update_available`) VALUES
(1, 'YIqswocijZYofPt', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `multics_master_servers`
--

CREATE TABLE IF NOT EXISTS `multics_master_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `port` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `monitor_enabled` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `multics_servers`
--

CREATE TABLE IF NOT EXISTS `multics_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emulator_id` int(11) NOT NULL,
  `domain_name` text NOT NULL,
  `description` text,
  `port` int(11) NOT NULL,
  `master_server_id` int(11) DEFAULT NULL,
  `can_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Table structure for table `multics_server_emulators`
--

CREATE TABLE IF NOT EXISTS `multics_server_emulators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emulator_id` int(11) NOT NULL,
  `master_server_id` int(11) NOT NULL,
  `user_access` int(11) NOT NULL,
  `default_server_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_txn` text NOT NULL,
  `member_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `payer_email` text,
  `date` int(11) NOT NULL,
  `payment_method` text NOT NULL,
  `accepted` int(11) NOT NULL DEFAULT '0',
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(60) NOT NULL,
  `profile_options` text NOT NULL,
  `master_server_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `server_news`
--

CREATE TABLE IF NOT EXISTS `server_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` text NOT NULL,
  `news_content` text NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `server_news`
--

INSERT INTO `server_news` (`id`, `news_title`, `news_content`, `date`) VALUES
(11, 'Reseller panel', '<p>New reseller panel online ;)</p>', 1445020409);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_key` text NOT NULL,
  `setting_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`) VALUES
(1, 'SERVER_NAME', 'Welkom'),
(2, 'MIN_PASSWORD', '6'),
(3, 'ALLOW_REGISTRATIONS', '1'),
(4, 'CAN_GENERATE_NEW_DAYS', '40'),
(6, 'PAYPAL_EMAIL', ''),
(7, 'CONFIRMATION_EMAIL', '1'),
(8, 'DISCOUNT_SYSTEM', '1'),
(9, 'DISCOUNT_IN_X_LINES', '5'),
(10, 'CURRENCY_CODE', 'EURO'),
(11, 'MAIL_FROM', ''),
(12, 'SERVER_SMTP', '0'),
(13, 'SMTP_HOST', ''),
(14, 'SMTP_PORT', ''),
(15, 'SMTP_ENCRYPTION', 'tls'),
(16, 'SMTP_USERNAME', ''),
(17, 'SMTP_PASSWORD', ''),
(18, 'SMTP_FROM_NAME', ''),
(19, 'TEST_LINE_ENABLE', '1'),
(20, 'ACCEPT_PAYMENTS', '1'),
(21, 'ALLOW_SECOND_ACCOUNT', '1'),
(22, 'PAYMENT_METHODS', 'paypal<|>custom'),
(23, 'DELETE_LINES_IN', '2'),
(24, 'CAN_DELETE_LINES', '1'),
(25, 'REMOVE_LINECOST_PERCENT', '10'),
(26, 'ENABLE_TICKETS', '1'),
(27, 'USERNAME_ALPHA', '1'),
(28, 'USERNAME_STRLEN', '15'),
(29, 'MONITOR_LAST_MIN_ZAPS', '15'),
(30, 'ENABLE_PAYPAL_SHIELD', '0'),
(31, 'PAYPAL_SHIELD', 'http://www.your-shieldsite.com/'),
(32, 'PAYPAL_CMD', '_donations'),
(33, 'PAYPAL_ITEM_NAME', ''),
(34, 'MULTICS_DOMAIN', '127.0.0.1'),
(35, 'MULTICS_USER', ''),
(36, 'MULTICS_PASS', ''),
(37, 'MULTICS_PORT', ''),
(38, 'TESTLINES_DATES', 'Monday<|>Tuesday<|>Wednesday<|>Thursday<|>Friday<|>Saturday<|>Sunday'),
(39, 'CAPTCHA_LOGIN', '0'),
(40, 'CAPTCHA_REGISTER', '0'),
(41, 'CAPTCHA_FORGOT', '0'),
(42, 'ENABLE_EMAIL_BAN_LIST', '0'),
(43, 'ENABLE_IP_BAN_LIST', '0'),
(45, 'EXPIRELINE_INFORM_USER_HOURS', '48'),
(46, 'PAYPAL_ORDER_ID', '1'),
(47, 'PAYPAL_INVOICE', '0'),
(48, 'PAYPAL_THANKYOU', ''),
(49, 'PAYPAL_HEADER_IMG', ''),
(51, 'REQUIRE_TID', '1'),
(52, 'REQUIRE_TP', '1'),
(53, 'CAN_PAYMENT_HISTORY', '1'),
(55, 'EMAIL_MSG_FORGOT', '<p>Hello,</p><p>You just asked to reset your password. If it wasn&#39;t you then just ignore this e-mail. To verify the forgot password click on the following link:</p><p>{FORGOT_LINK}</p><p>Thank you!<br />{SERVER_NAME}</p>'),
(56, 'EMAIL_MSG_VERIFY', '<p>Hello,</p><p>To complete your registration please visit the following link:</p><p>{VERIFY_LINK}</p><p>Thank you!<br />{SERVER_NAME}</p>'),
(57, 'EMAIL_MSG_EXPIRE_LINE', '<p>Hello {MEMBER_NAME},</p><p>Your Line with username {LINE_USERNAME} will expire soon. Expire Date: {EXPIRE_DATE}<br /><br />If you want you can extend it anytime you want from the userpanel.</p><p>Thank you<br />{SERVER_NAME}</p>'),
(58, 'EMAIL_MSG_MONITOR_BAN', '<p>Hello {MEMBER_NAME},</p><p>We noticed that your line {LINE_USERNAME} is used for resharing and for that reason is now blocked.</p><p>Please Contact with us<br />{SERVER_NAME}</p>'),
(59, 'EMAIL_MSG_MONITOR_WARN', '<p>Hello {MEMBER_NAME},</p><p>We noticed that your line {LINE_USERNAME} is used for resharing. This is just a warning. You have to stop the resharing otherwise your line will be blocked.</p><p>Please Contact with us<br />{SERVER_NAME}</p>'),
(60, 'EMAIL_MSG_FORGOT_SUB', 'Forgot Password Request @ {SERVER_NAME}'),
(61, 'EMAIL_MSG_MONITOR_WARN_SUB', '{SERVER_NAME} - Resharing - WARNING'),
(62, 'EMAIL_MSG_EXPIRE_LINE_SUB', '{SERVER_NAME} - Your Line Will Expire Soon'),
(63, 'EMAIL_MSG_MONITOR_BAN_SUB', '{SERVER_NAME} - Resharing - Line Blocked'),
(64, 'EMAIL_MSG_VERIFY_SUB', 'Registration @ {SERVER_NAME}'),
(65, 'FULL_URL', ''),
(66, 'MONITOR_AUTO_BLOCK', '0'),
(67, 'MONITOR_BLOCK_WARNINGS', '3'),
(68, 'MONITOR_BLOCK_INFORM', '1'),
(69, 'REMOVE_COPYRIGHTS', '1'),
(70, 'OWN_COPYRIGHTS', ''),
(71, 'LOGO_URL', '');

-- --------------------------------------------------------

--
-- Table structure for table `tickets_post`
--

CREATE TABLE IF NOT EXISTS `tickets_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `post` text NOT NULL,
  `admin_reply` int(11) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`,`admin_reply`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=137 ;

-- --------------------------------------------------------

--
-- Table structure for table `tickets_topics`
--

CREATE TABLE IF NOT EXISTS `tickets_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `topic_title` varchar(70) NOT NULL,
  `date` int(11) NOT NULL,
  `admin_read` int(11) NOT NULL DEFAULT '0',
  `user_read` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`,`admin_read`,`user_read`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(250) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `date_registered` int(11) NOT NULL,
  `verify_key` varchar(10) DEFAULT NULL,
  `last_login` int(11) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT '0',
  `member_group_id` int(4) NOT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT '0',
  `total_test_lines` int(11) DEFAULT '0',
  `lang_id` int(11) NOT NULL DEFAULT '1',
  `ref_id` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=153 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `ip`, `date_registered`, `verify_key`, `last_login`, `balance`, `member_group_id`, `verified`, `total_test_lines`, `lang_id`, `ref_id`) VALUES
(1, 'admin', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'yourmail@admin.com', '37.111.129.239', 1404254166, 'TO0MW9H9Z4', 1586191594, 40, 1, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_sessions`
--

CREATE TABLE IF NOT EXISTS `users_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `user_agent` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `expire_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users_sessions`
--

INSERT INTO `users_sessions` (`id`, `member_id`, `session_id`, `user_agent`, `ip`, `expire_date`) VALUES
(4, 1, '80bnqh15u0ru63aed9o2bogrb3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', '37.111.129.239', 1586193428),
(3, 152, 'h33nrg1hr8f1dk1e2r625nacn4', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '84.104.220.68', 1445023582);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
