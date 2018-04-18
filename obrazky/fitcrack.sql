-- phpMyAdmin SQL Dump
-- version 4.0.10.20
-- https://www.phpmyadmin.net
--
-- Hostiteľ: localhost
-- Vygenerované: St 18.Apr 2018, 22:41
-- Verzia serveru: 5.1.73
-- Verzia PHP: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáza: `fitcrack`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `app`
--

DROP TABLE IF EXISTS `app`;
CREATE TABLE `app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `min_version` int(11) NOT NULL DEFAULT '0',
  `deprecated` smallint(6) NOT NULL DEFAULT '0',
  `user_friendly_name` varchar(254) NOT NULL,
  `homogeneous_redundancy` smallint(6) NOT NULL DEFAULT '0',
  `weight` double NOT NULL DEFAULT '1',
  `beta` smallint(6) NOT NULL DEFAULT '0',
  `target_nresults` smallint(6) NOT NULL DEFAULT '0',
  `min_avg_pfc` double NOT NULL DEFAULT '1',
  `host_scale_check` tinyint(4) NOT NULL DEFAULT '0',
  `homogeneous_app_version` tinyint(4) NOT NULL DEFAULT '0',
  `non_cpu_intensive` tinyint(4) NOT NULL DEFAULT '0',
  `locality_scheduling` int(11) NOT NULL DEFAULT '0',
  `n_size_classes` smallint(6) NOT NULL DEFAULT '0',
  `fraction_done_exact` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `app_version`
--

DROP TABLE IF EXISTS `app_version`;
CREATE TABLE `app_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `appid` int(11) NOT NULL,
  `version_num` int(11) NOT NULL,
  `platformid` int(11) NOT NULL,
  `xml_doc` mediumblob,
  `min_core_version` int(11) NOT NULL DEFAULT '0',
  `max_core_version` int(11) NOT NULL DEFAULT '0',
  `deprecated` tinyint(4) NOT NULL DEFAULT '0',
  `plan_class` varchar(254) NOT NULL DEFAULT '',
  `pfc_n` double NOT NULL DEFAULT '0',
  `pfc_avg` double NOT NULL DEFAULT '0',
  `pfc_scale` double NOT NULL DEFAULT '0',
  `expavg_credit` double NOT NULL DEFAULT '0',
  `expavg_time` double NOT NULL DEFAULT '0',
  `beta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `apvp` (`appid`,`platformid`,`version_num`,`plan_class`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `assignment`
--

DROP TABLE IF EXISTS `assignment`;
CREATE TABLE `assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `target_type` int(11) NOT NULL,
  `multi` tinyint(4) NOT NULL,
  `workunitid` int(11) NOT NULL,
  `resultid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `asgn_target` (`target_type`,`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `badge`
--

DROP TABLE IF EXISTS `badge`;
CREATE TABLE `badge` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` double NOT NULL,
  `type` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `sql_rule` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `badge_team`
--

DROP TABLE IF EXISTS `badge_team`;
CREATE TABLE `badge_team` (
  `badge_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `create_time` double NOT NULL,
  `reassign_time` double NOT NULL,
  UNIQUE KEY `team_id` (`team_id`,`badge_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `badge_user`
--

DROP TABLE IF EXISTS `badge_user`;
CREATE TABLE `badge_user` (
  `badge_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` double NOT NULL,
  `reassign_time` double NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`badge_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `banishment_vote`
--

DROP TABLE IF EXISTS `banishment_vote`;
CREATE TABLE `banishment_vote` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `modid` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `banishment_votes`
--

DROP TABLE IF EXISTS `banishment_votes`;
CREATE TABLE `banishment_votes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `voteid` int(11) NOT NULL,
  `modid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `yes` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `batch`
--

DROP TABLE IF EXISTS `batch`;
CREATE TABLE `batch` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `logical_start_time` double NOT NULL,
  `logical_end_time` double NOT NULL,
  `est_completion_time` double NOT NULL,
  `njobs` int(11) NOT NULL,
  `fraction_done` double NOT NULL,
  `nerror_jobs` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `completion_time` double NOT NULL,
  `credit_estimate` double NOT NULL,
  `credit_canonical` double NOT NULL,
  `credit_total` double NOT NULL,
  `name` varchar(255) NOT NULL,
  `app_id` int(11) NOT NULL,
  `project_state` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `expire_time` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `name` varchar(254) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `is_helpdesk` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cat1` (`name`,`is_helpdesk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `credited_job`
--

DROP TABLE IF EXISTS `credited_job`;
CREATE TABLE `credited_job` (
  `userid` int(11) NOT NULL,
  `workunitid` bigint(20) NOT NULL,
  UNIQUE KEY `credited_job_user_wu` (`userid`,`workunitid`),
  KEY `credited_job_user` (`userid`),
  KEY `credited_job_wu` (`workunitid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `credit_team`
--

DROP TABLE IF EXISTS `credit_team`;
CREATE TABLE `credit_team` (
  `teamid` int(11) NOT NULL,
  `appid` int(11) NOT NULL,
  `njobs` int(11) NOT NULL,
  `total` double NOT NULL,
  `expavg` double NOT NULL,
  `expavg_time` double NOT NULL,
  `credit_type` int(11) NOT NULL,
  PRIMARY KEY (`teamid`,`appid`,`credit_type`),
  KEY `ct_total` (`appid`,`total`),
  KEY `ct_avg` (`appid`,`expavg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `credit_user`
--

DROP TABLE IF EXISTS `credit_user`;
CREATE TABLE `credit_user` (
  `userid` int(11) NOT NULL,
  `appid` int(11) NOT NULL,
  `njobs` int(11) NOT NULL,
  `total` double NOT NULL,
  `expavg` double NOT NULL,
  `expavg_time` double NOT NULL,
  `credit_type` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`appid`,`credit_type`),
  KEY `cu_total` (`appid`,`total`),
  KEY `cu_avg` (`appid`,`expavg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `donation_items`
--

DROP TABLE IF EXISTS `donation_items`;
CREATE TABLE `donation_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `required` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `donation_paypal`
--

DROP TABLE IF EXISTS `donation_paypal`;
CREATE TABLE `donation_paypal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_time` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `email_addr` varchar(255) NOT NULL,
  `order_amount` double(6,2) NOT NULL,
  `processed` tinyint(4) NOT NULL DEFAULT '0',
  `payment_time` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_number` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_amount` double(6,2) NOT NULL,
  `payment_fee` double(5,2) DEFAULT NULL,
  `payment_currency` varchar(255) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `receiver_email` varchar(255) NOT NULL,
  `payer_email` varchar(255) NOT NULL,
  `payer_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `forum`
--

DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `title` varchar(254) NOT NULL,
  `description` varchar(254) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `threads` int(11) NOT NULL DEFAULT '0',
  `posts` int(11) NOT NULL DEFAULT '0',
  `rate_min_expavg_credit` int(11) NOT NULL DEFAULT '0',
  `rate_min_total_credit` int(11) NOT NULL DEFAULT '0',
  `post_min_interval` int(11) NOT NULL DEFAULT '0',
  `post_min_expavg_credit` int(11) NOT NULL DEFAULT '0',
  `post_min_total_credit` int(11) NOT NULL DEFAULT '0',
  `is_dev_blog` tinyint(4) NOT NULL DEFAULT '0',
  `parent_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pct` (`parent_type`,`category`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `forum_logging`
--

DROP TABLE IF EXISTS `forum_logging`;
CREATE TABLE `forum_logging` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `threadid` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`,`threadid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `forum_preferences`
--

DROP TABLE IF EXISTS `forum_preferences`;
CREATE TABLE `forum_preferences` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `signature` varchar(254) NOT NULL DEFAULT '',
  `posts` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL,
  `avatar` varchar(254) NOT NULL DEFAULT '',
  `hide_avatars` tinyint(4) NOT NULL DEFAULT '0',
  `forum_sorting` int(11) NOT NULL,
  `thread_sorting` int(11) NOT NULL,
  `no_signature_by_default` tinyint(4) NOT NULL DEFAULT '1',
  `images_as_links` tinyint(4) NOT NULL DEFAULT '0',
  `link_popup` tinyint(4) NOT NULL DEFAULT '0',
  `mark_as_read_timestamp` int(11) NOT NULL DEFAULT '0',
  `special_user` char(12) NOT NULL DEFAULT '0',
  `jump_to_unread` tinyint(4) NOT NULL DEFAULT '1',
  `hide_signatures` tinyint(4) NOT NULL DEFAULT '0',
  `rated_posts` varchar(254) NOT NULL,
  `low_rating_threshold` int(11) NOT NULL DEFAULT '-25',
  `high_rating_threshold` int(11) NOT NULL DEFAULT '5',
  `minimum_wrap_postcount` int(11) NOT NULL DEFAULT '100',
  `display_wrap_postcount` int(11) NOT NULL DEFAULT '75',
  `ignorelist` varchar(254) NOT NULL,
  `ignore_sticky_posts` tinyint(4) NOT NULL DEFAULT '0',
  `banished_until` int(11) NOT NULL DEFAULT '0',
  `pm_notification` tinyint(4) NOT NULL DEFAULT '0',
  `highlight_special` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `friend`
--

DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `user_src` int(11) NOT NULL,
  `user_dest` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `reciprocated` tinyint(4) NOT NULL,
  UNIQUE KEY `friend_u` (`user_src`,`user_dest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `host`
--

DROP TABLE IF EXISTS `host`;
CREATE TABLE `host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `rpc_seqno` int(11) NOT NULL,
  `rpc_time` int(11) NOT NULL,
  `total_credit` double NOT NULL,
  `expavg_credit` double NOT NULL,
  `expavg_time` double NOT NULL,
  `timezone` int(11) NOT NULL,
  `domain_name` varchar(254) DEFAULT NULL,
  `serialnum` varchar(254) DEFAULT NULL,
  `last_ip_addr` varchar(254) DEFAULT NULL,
  `nsame_ip_addr` int(11) NOT NULL,
  `on_frac` double NOT NULL,
  `connected_frac` double NOT NULL,
  `active_frac` double NOT NULL,
  `cpu_efficiency` double NOT NULL,
  `duration_correction_factor` double NOT NULL,
  `p_ncpus` int(11) NOT NULL,
  `p_vendor` varchar(254) DEFAULT NULL,
  `p_model` varchar(254) DEFAULT NULL,
  `p_fpops` double NOT NULL,
  `p_iops` double NOT NULL,
  `p_membw` double NOT NULL,
  `os_name` varchar(254) DEFAULT NULL,
  `os_version` varchar(254) DEFAULT NULL,
  `m_nbytes` double NOT NULL,
  `m_cache` double NOT NULL,
  `m_swap` double NOT NULL,
  `d_total` double NOT NULL,
  `d_free` double NOT NULL,
  `d_boinc_used_total` double NOT NULL,
  `d_boinc_used_project` double NOT NULL,
  `d_boinc_max` double NOT NULL,
  `n_bwup` double NOT NULL,
  `n_bwdown` double NOT NULL,
  `credit_per_cpu_sec` double NOT NULL,
  `venue` varchar(254) NOT NULL,
  `nresults_today` int(11) NOT NULL,
  `avg_turnaround` double NOT NULL,
  `host_cpid` varchar(254) DEFAULT NULL,
  `external_ip_addr` varchar(254) DEFAULT NULL,
  `max_results_day` int(11) NOT NULL,
  `error_rate` double NOT NULL DEFAULT '0',
  `product_name` varchar(254) NOT NULL,
  `gpu_active_frac` double NOT NULL,
  `p_ngpus` int(11) NOT NULL,
  `p_gpu_fpops` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `host_user` (`userid`),
  KEY `host_avg` (`expavg_credit`),
  KEY `host_tot` (`total_credit`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- Spúšťače `host`
--
DROP TRIGGER IF EXISTS `bench_all_v1`;
DELIMITER //
CREATE TRIGGER `bench_all_v1` AFTER INSERT ON `host`
 FOR EACH ROW BEGIN
	DECLARE benchAll INT;
	DECLARE currentState INT;

	SET benchAll = (SELECT `default_bench_all` FROM `fc_settings` LIMIT 1);

	IF (benchAll)
	THEN		
		SET currentState = (SELECT `status` FROM `fc_package` WHERE `id` = 1 LIMIT 1);

		IF (currentState < 10)
        	THEN
			DELETE FROM `fc_host_activity` WHERE `package_id` = 1 ;
			UPDATE `fc_package` SET `time_start` = NOW() WHERE `id` = 1 LIMIT 1;
		END IF;

		INSERT INTO `fc_host_activity` (`boinc_host_id`, `package_id`) VALUES (NEW.id, 1);
		UPDATE `fc_package` SET `status` = 10, `time_end` = NULL WHERE `id` = 1 LIMIT 1;
	END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `host_app_version`
--

DROP TABLE IF EXISTS `host_app_version`;
CREATE TABLE `host_app_version` (
  `host_id` int(11) NOT NULL,
  `app_version_id` int(11) NOT NULL,
  `pfc_n` double NOT NULL,
  `pfc_avg` double NOT NULL,
  `et_n` double NOT NULL,
  `et_avg` double NOT NULL,
  `et_var` double NOT NULL,
  `et_q` double NOT NULL,
  `max_jobs_per_day` int(11) NOT NULL,
  `n_jobs_today` int(11) NOT NULL,
  `turnaround_n` double NOT NULL,
  `turnaround_avg` double NOT NULL,
  `turnaround_var` double NOT NULL,
  `turnaround_q` double NOT NULL,
  `consecutive_valid` int(11) NOT NULL,
  UNIQUE KEY `hap` (`host_id`,`app_version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `job_file`
--

DROP TABLE IF EXISTS `job_file`;
CREATE TABLE `job_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `create_time` double NOT NULL,
  `delete_time` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jf_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `msg_from_host`
--

DROP TABLE IF EXISTS `msg_from_host`;
CREATE TABLE `msg_from_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `hostid` int(11) NOT NULL,
  `variety` varchar(254) NOT NULL,
  `handled` smallint(6) NOT NULL,
  `xml` mediumtext,
  PRIMARY KEY (`id`),
  KEY `message_handled` (`handled`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `msg_to_host`
--

DROP TABLE IF EXISTS `msg_to_host`;
CREATE TABLE `msg_to_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `hostid` int(11) NOT NULL,
  `variety` varchar(254) NOT NULL,
  `handled` smallint(6) NOT NULL,
  `xml` mediumtext,
  PRIMARY KEY (`id`),
  KEY `msg_to_host` (`hostid`,`handled`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `notify`
--

DROP TABLE IF EXISTS `notify`;
CREATE TABLE `notify` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `opaque` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `notify_un` (`userid`,`type`,`opaque`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `platform`
--

DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `user_friendly_name` varchar(254) NOT NULL,
  `deprecated` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `content` text NOT NULL,
  `modified` int(11) NOT NULL,
  `parent_post` int(11) NOT NULL,
  `score` double NOT NULL,
  `votes` int(11) NOT NULL,
  `signature` tinyint(4) NOT NULL DEFAULT '0',
  `hidden` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_user` (`user`),
  KEY `post_thread` (`thread`),
  FULLTEXT KEY `post_content` (`content`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `post_ratings`
--

DROP TABLE IF EXISTS `post_ratings`;
CREATE TABLE `post_ratings` (
  `post` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  PRIMARY KEY (`post`,`user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `private_messages`
--

DROP TABLE IF EXISTS `private_messages`;
CREATE TABLE `private_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `senderid` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `opened` tinyint(4) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `userid` int(11) NOT NULL,
  `language` varchar(254) DEFAULT NULL,
  `response1` text,
  `response2` text,
  `has_picture` smallint(6) NOT NULL,
  `recommend` int(11) NOT NULL,
  `reject` int(11) NOT NULL,
  `posts` int(11) NOT NULL,
  `uotd_time` int(11) DEFAULT NULL,
  `verification` int(11) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `profile_userid` (`userid`),
  KEY `pro_uotd` (`uotd_time`),
  FULLTEXT KEY `profile_reponse` (`response1`,`response2`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `result`
--

DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `workunitid` int(11) NOT NULL,
  `server_state` int(11) NOT NULL,
  `outcome` int(11) NOT NULL,
  `client_state` int(11) NOT NULL,
  `hostid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `report_deadline` int(11) NOT NULL,
  `sent_time` int(11) NOT NULL,
  `received_time` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `cpu_time` double NOT NULL,
  `xml_doc_in` blob,
  `xml_doc_out` blob,
  `stderr_out` blob,
  `batch` int(11) NOT NULL,
  `file_delete_state` int(11) NOT NULL,
  `validate_state` int(11) NOT NULL,
  `claimed_credit` double NOT NULL,
  `granted_credit` double NOT NULL,
  `opaque` double NOT NULL,
  `random` int(11) NOT NULL,
  `app_version_num` int(11) NOT NULL,
  `appid` int(11) NOT NULL,
  `exit_status` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `mod_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `elapsed_time` double NOT NULL,
  `flops_estimate` double NOT NULL,
  `app_version_id` int(11) NOT NULL,
  `runtime_outlier` tinyint(4) NOT NULL,
  `size_class` smallint(6) NOT NULL DEFAULT '-1',
  `peak_working_set_size` double NOT NULL,
  `peak_swap_size` double NOT NULL,
  `peak_disk_usage` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `res_wuid` (`workunitid`),
  KEY `ind_res_st` (`server_state`,`priority`),
  KEY `res_app_state` (`appid`,`server_state`),
  KEY `res_filedel` (`file_delete_state`),
  KEY `res_userid_id` (`userid`,`id`),
  KEY `res_userid_val` (`userid`,`validate_state`),
  KEY `res_hostid_id` (`hostid`,`id`),
  KEY `res_wu_user` (`workunitid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Spúšťače `result`
--
DROP TRIGGER IF EXISTS `client_error_trigger`;
DELIMITER //
CREATE TRIGGER `client_error_trigger` BEFORE UPDATE ON `result`
 FOR EACH ROW BEGIN
	IF (NEW.outcome = 3 AND OLD.outcome != 3)
	THEN
		UPDATE `fc_job` SET retry = 1 WHERE `workunit_id` = NEW.workunitid LIMIT 1;
		UPDATE `fc_host` SET `status` = 0, `power` = 0 WHERE id IN (SELECT `host_id` FROM `fc_job` WHERE `workunit_id` = NEW.workunitid) LIMIT 1;
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `timeout_v1`;
DELIMITER //
CREATE TRIGGER `timeout_v1` AFTER UPDATE ON `result`
 FOR EACH ROW BEGIN
	IF (NEW.server_state = 5 AND OLD.server_state != 5 AND UNIX_TIMESTAMP() >= NEW.report_deadline)
	THEN
		UPDATE `fc_job` SET `retry` = 1 WHERE `workunit_id` = NEW.workunitid LIMIT 1 ; 
        UPDATE `fc_host` SET `status` = 0, `power` = 0 WHERE id IN (SELECT `host_id` FROM `fc_job` WHERE `workunit_id` = NEW.workunitid) LIMIT 1;
	END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `sent_email`
--

DROP TABLE IF EXISTS `sent_email`;
CREATE TABLE `sent_email` (
  `userid` int(11) NOT NULL,
  `time_sent` int(11) NOT NULL,
  `email_type` smallint(6) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions` (
  `userid` int(11) NOT NULL,
  `threadid` int(11) NOT NULL,
  `notified_time` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `sub_unique` (`userid`,`threadid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `name_lc` varchar(254) DEFAULT NULL,
  `url` varchar(254) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `name_html` varchar(254) DEFAULT NULL,
  `description` text,
  `nusers` int(11) NOT NULL,
  `country` varchar(254) DEFAULT NULL,
  `total_credit` double NOT NULL,
  `expavg_credit` double NOT NULL,
  `expavg_time` double NOT NULL,
  `seti_id` int(11) NOT NULL,
  `ping_user` int(11) NOT NULL DEFAULT '0',
  `ping_time` int(10) unsigned NOT NULL DEFAULT '0',
  `joinable` tinyint(4) NOT NULL DEFAULT '1',
  `mod_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `team_avg` (`expavg_credit`),
  KEY `team_tot` (`total_credit`),
  KEY `team_userid` (`userid`),
  FULLTEXT KEY `team_name_desc` (`name`,`description`),
  FULLTEXT KEY `team_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `team_admin`
--

DROP TABLE IF EXISTS `team_admin`;
CREATE TABLE `team_admin` (
  `teamid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `rights` int(11) NOT NULL,
  UNIQUE KEY `teamid` (`teamid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `team_delta`
--

DROP TABLE IF EXISTS `team_delta`;
CREATE TABLE `team_delta` (
  `userid` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `joining` tinyint(4) NOT NULL,
  `total_credit` double NOT NULL,
  KEY `team_delta_teamid` (`teamid`,`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `thread`
--

DROP TABLE IF EXISTS `thread`;
CREATE TABLE `thread` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(254) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `replies` int(11) NOT NULL,
  `activity` double NOT NULL,
  `sufferers` int(11) NOT NULL,
  `score` double NOT NULL,
  `votes` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `hidden` int(11) NOT NULL,
  `sticky` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `thread_title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `email_addr` varchar(254) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `authenticator` varchar(254) DEFAULT NULL,
  `country` varchar(254) DEFAULT NULL,
  `postal_code` varchar(254) DEFAULT NULL,
  `total_credit` double NOT NULL,
  `expavg_credit` double NOT NULL,
  `expavg_time` double NOT NULL,
  `global_prefs` blob,
  `project_prefs` blob,
  `teamid` int(11) NOT NULL,
  `venue` varchar(254) NOT NULL,
  `url` varchar(254) DEFAULT NULL,
  `send_email` smallint(6) NOT NULL,
  `show_hosts` smallint(6) NOT NULL,
  `posts` smallint(6) NOT NULL,
  `seti_id` int(11) NOT NULL,
  `seti_nresults` int(11) NOT NULL,
  `seti_last_result_time` int(11) NOT NULL,
  `seti_total_cpu` double NOT NULL,
  `signature` varchar(254) DEFAULT NULL,
  `has_profile` smallint(6) NOT NULL,
  `cross_project_id` varchar(254) NOT NULL,
  `passwd_hash` varchar(254) NOT NULL,
  `email_validated` smallint(6) NOT NULL,
  `donated` smallint(6) NOT NULL,
  `login_token` char(32) NOT NULL,
  `login_token_time` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_addr` (`email_addr`),
  UNIQUE KEY `authenticator` (`authenticator`),
  KEY `ind_tid` (`teamid`),
  KEY `user_name` (`name`),
  KEY `user_tot` (`total_credit`),
  KEY `user_avg` (`expavg_credit`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `user_submit`
--

DROP TABLE IF EXISTS `user_submit`;
CREATE TABLE `user_submit` (
  `user_id` int(11) NOT NULL,
  `quota` double NOT NULL,
  `logical_start_time` double NOT NULL,
  `submit_all` tinyint(4) NOT NULL,
  `manage_all` tinyint(4) NOT NULL,
  `max_jobs_in_progress` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `user_submit_app`
--

DROP TABLE IF EXISTS `user_submit_app`;
CREATE TABLE `user_submit_app` (
  `user_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `manage` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_id`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `workunit`
--

DROP TABLE IF EXISTS `workunit`;
CREATE TABLE `workunit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `appid` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `xml_doc` blob,
  `batch` int(11) NOT NULL,
  `rsc_fpops_est` double NOT NULL,
  `rsc_fpops_bound` double NOT NULL,
  `rsc_memory_bound` double NOT NULL,
  `rsc_disk_bound` double NOT NULL,
  `need_validate` smallint(6) NOT NULL,
  `canonical_resultid` int(11) NOT NULL,
  `canonical_credit` double NOT NULL,
  `transition_time` int(11) NOT NULL,
  `delay_bound` int(11) NOT NULL,
  `error_mask` int(11) NOT NULL,
  `file_delete_state` int(11) NOT NULL,
  `assimilate_state` int(11) NOT NULL,
  `hr_class` int(11) NOT NULL,
  `opaque` double NOT NULL,
  `min_quorum` int(11) NOT NULL,
  `target_nresults` int(11) NOT NULL,
  `max_error_results` int(11) NOT NULL,
  `max_total_results` int(11) NOT NULL,
  `max_success_results` int(11) NOT NULL,
  `result_template_file` varchar(63) NOT NULL,
  `priority` int(11) NOT NULL,
  `mod_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rsc_bandwidth_bound` double NOT NULL,
  `fileset_id` int(11) NOT NULL,
  `app_version_id` int(11) NOT NULL,
  `transitioner_flags` tinyint(4) NOT NULL,
  `size_class` smallint(6) NOT NULL DEFAULT '-1',
  `keywords` varchar(254) NOT NULL,
  `app_version_num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `wu_val` (`appid`,`need_validate`),
  KEY `wu_timeout` (`transition_time`),
  KEY `wu_filedel` (`file_delete_state`),
  KEY `wu_assim` (`appid`,`assimilate_state`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
