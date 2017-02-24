-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 24, 2017 at 07:44 PM
-- Server version: 5.7.16
-- PHP Version: 5.5.9-1ubuntu4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nodejsDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE IF NOT EXISTS `user_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `billing_period_start_date` datetime NOT NULL,
  `billing_period_end_date` datetime NOT NULL,
  `in_free_trail_duration` int(11) NOT NULL DEFAULT '0' COMMENT '0 => ''normal payment'' , ''1''=> ''means user has upgrade his plan in free trail period',
  `subscription_status` varchar(80) NOT NULL,
  `account_merge_date` datetime NOT NULL,
  `remain_days_of_plan` int(11) NOT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `company` varchar(255) NOT NULL,
  `linkedin_user_profile_pic_url` text NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `certificate` text NOT NULL,
  `learning_goal` text NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `state_id` int(11) NOT NULL DEFAULT '0',
  `state_name` varchar(200) NOT NULL,
  `city_name` varchar(200) NOT NULL,
  `is_manager` int(11) NOT NULL DEFAULT '0',
  `address1` text NOT NULL,
  `address2` text,
  `zipcode` varchar(20) NOT NULL,
  `uin_ein_tin` varchar(200) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `secondary_email` varchar(255) NOT NULL,
  `number_of_connection` int(11) NOT NULL DEFAULT '0',
  `number_of_users_limit` int(11) NOT NULL DEFAULT '0',
  `subscription_connection_limit` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL DEFAULT '0',
  `previous_ind_organization_id` int(11) NOT NULL DEFAULT '0' COMMENT 'previous_indiviudal_organization_id',
  `pre_mobile` varchar(10) DEFAULT NULL,
  `mobile` varchar(16) NOT NULL,
  `industry_type` varchar(255) DEFAULT NULL,
  `total_employees` varchar(255) DEFAULT NULL,
  `interest` text NOT NULL,
  `yearsof_experience` int(2) NOT NULL,
  `skills` varchar(255) NOT NULL,
  `summaries_yourself` text NOT NULL,
  `facebook_url` text NOT NULL,
  `linkedin_url` text NOT NULL,
  `twitter_url` text NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `job_title_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `reporting_manager_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `who_can_view_my_profile` int(2) NOT NULL DEFAULT '1',
  `who_can_view_my_connections` int(2) NOT NULL DEFAULT '1',
  `who_can_view_my_followers` int(2) NOT NULL DEFAULT '1',
  `who_can_view_my_followings` int(2) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `plan_cancellation_request` int(1) NOT NULL DEFAULT '0' COMMENT '0 => for no request, 1 => for cancellation request, 2=> done',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status_id` (`status_id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=173 ;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `subscription_id`, `billing_period_start_date`, `billing_period_end_date`, `in_free_trail_duration`, `subscription_status`, `account_merge_date`, `remain_days_of_plan`, `first_name`, `last_name`, `company`, `linkedin_user_profile_pic_url`, `profile_pic`, `job_title`, `certificate`, `learning_goal`, `country_id`, `state_id`, `state_name`, `city_name`, `is_manager`, `address1`, `address2`, `zipcode`, `uin_ein_tin`, `email`, `secondary_email`, `number_of_connection`, `number_of_users_limit`, `subscription_connection_limit`, `organization_id`, `previous_ind_organization_id`, `pre_mobile`, `mobile`, `industry_type`, `total_employees`, `interest`, `yearsof_experience`, `skills`, `summaries_yourself`, `facebook_url`, `linkedin_url`, `twitter_url`, `url`, `status_id`, `job_title_id`, `department_id`, `reporting_manager_id`, `location_id`, `who_can_view_my_profile`, `who_can_view_my_connections`, `who_can_view_my_followers`, `who_can_view_my_followings`, `created_by`, `updated_by`, `plan_cancellation_request`, `modified`, `created`) VALUES
(172, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', '0000-00-00 00:00:00', 0, 'fsds', 'fsdfsdf', '', '', 'tom-sturridge-23.JPG', '', '', '', 0, 0, '', '', 0, 'dsf', 'dsfdsf', '', NULL, 'sdfik@yopmail.com', '', 0, 0, 0, 0, 0, NULL, '', NULL, NULL, '', 0, '', '', '', '', '', NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 0, '2016-11-15 00:00:00', '2016-11-15 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
