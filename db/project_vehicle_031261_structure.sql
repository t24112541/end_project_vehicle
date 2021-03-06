/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : project_vehicle

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-12-03 19:29:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pk_accessories
-- ----------------------------
DROP TABLE IF EXISTS `pk_accessories`;
CREATE TABLE `pk_accessories` (
  `ac_id` int(5) NOT NULL AUTO_INCREMENT,
  `ac_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_u_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_u_table` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  PRIMARY KEY (`ac_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pk_accessories_log
-- ----------------------------
DROP TABLE IF EXISTS `pk_accessories_log`;
CREATE TABLE `pk_accessories_log` (
  `run_id` int(5) NOT NULL AUTO_INCREMENT,
  `ac_id` int(5) DEFAULT NULL,
  `ac_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_u_id` int(5) NOT NULL,
  `ac_u_table` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `u_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_log_work` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`run_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pk_admin
-- ----------------------------
DROP TABLE IF EXISTS `pk_admin`;
CREATE TABLE `pk_admin` (
  `a_id` int(5) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_lname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p_id` int(5) DEFAULT NULL,
  `a_tel` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `a_username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pk_department
-- ----------------------------
DROP TABLE IF EXISTS `pk_department`;
CREATE TABLE `pk_department` (
  `d_id` int(5) NOT NULL AUTO_INCREMENT,
  `d_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pk_department_log
-- ----------------------------
DROP TABLE IF EXISTS `pk_department_log`;
CREATE TABLE `pk_department_log` (
  `run_id` int(5) NOT NULL AUTO_INCREMENT,
  `d_id` int(5) NOT NULL,
  `d_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `u_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_log_work` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'เพิ่ม ลบ หรือแก้ไข',
  `d_log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`run_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pk_group
-- ----------------------------
DROP TABLE IF EXISTS `pk_group`;
CREATE TABLE `pk_group` (
  `g_id` int(5) NOT NULL AUTO_INCREMENT,
  `g_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `t_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pk_group_log
-- ----------------------------
DROP TABLE IF EXISTS `pk_group_log`;
CREATE TABLE `pk_group_log` (
  `run_id` int(5) NOT NULL AUTO_INCREMENT,
  `g_id` int(5) NOT NULL,
  `g_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_code` text COLLATE utf8mb4_unicode_ci,
  `g_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `u_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_log_work` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_log_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`run_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pk_img
-- ----------------------------
DROP TABLE IF EXISTS `pk_img`;
CREATE TABLE `pk_img` (
  `img_id` int(100) NOT NULL AUTO_INCREMENT,
  `img_img` text COLLATE utf8mb4_unicode_ci,
  `u_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `u_table` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pk_machine
-- ----------------------------
DROP TABLE IF EXISTS `pk_machine`;
CREATE TABLE `pk_machine` (
  `mc_id` int(5) NOT NULL AUTO_INCREMENT,
  `mc_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mc_brand` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mc_series` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  PRIMARY KEY (`mc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pk_machine_log
-- ----------------------------
DROP TABLE IF EXISTS `pk_machine_log`;
CREATE TABLE `pk_machine_log` (
  `run_id` int(5) NOT NULL AUTO_INCREMENT,
  `mc_id` int(5) NOT NULL,
  `mc_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mc_brand` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mc_series` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mc_log_work` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mc_log_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `u_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`run_id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pk_match_std_tch
-- ----------------------------
DROP TABLE IF EXISTS `pk_match_std_tch`;
CREATE TABLE `pk_match_std_tch` (
  `mst_id` int(5) NOT NULL AUTO_INCREMENT,
  `t_id` int(5) NOT NULL,
  `g_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`mst_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pk_missing
-- ----------------------------
DROP TABLE IF EXISTS `pk_missing`;
CREATE TABLE `pk_missing` (
  `ms_id` int(5) NOT NULL AUTO_INCREMENT,
  `ms_u_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ms_u_table` text COLLATE utf8mb4_unicode_ci,
  `u_id` int(20) DEFAULT NULL,
  `ms_table` text COLLATE utf8mb4_unicode_ci,
  `ms_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `u_ms_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ms_status` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ms_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pk_student
-- ----------------------------
DROP TABLE IF EXISTS `pk_student`;
CREATE TABLE `pk_student` (
  `std_id` int(5) NOT NULL AUTO_INCREMENT,
  `std_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_gender` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_prename` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_lname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_pin_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_birthday` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_blood` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  PRIMARY KEY (`std_id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pk_student_log
-- ----------------------------
DROP TABLE IF EXISTS `pk_student_log`;
CREATE TABLE `pk_student_log` (
  `run_id` int(5) NOT NULL AUTO_INCREMENT,
  `std_id` int(5) NOT NULL,
  `std_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_gender` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_prename` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_lname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_pin_id` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_birthday` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_code` text COLLATE utf8mb4_unicode_ci,
  `std_blood` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_log_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `u_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_log_work` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`run_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pk_teacher
-- ----------------------------
DROP TABLE IF EXISTS `pk_teacher`;
CREATE TABLE `pk_teacher` (
  `t_id` int(5) NOT NULL AUTO_INCREMENT,
  `t_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_dep` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_tel` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  PRIMARY KEY (`t_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pk_teacher_log
-- ----------------------------
DROP TABLE IF EXISTS `pk_teacher_log`;
CREATE TABLE `pk_teacher_log` (
  `run_id` int(5) NOT NULL AUTO_INCREMENT,
  `t_id` int(5) DEFAULT NULL,
  `t_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `d_code` text COLLATE utf8mb4_unicode_ci,
  `t_tel` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_log_work` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_log_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `u_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`run_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
