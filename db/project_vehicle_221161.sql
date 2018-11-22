/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : project_vehicle

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-11-22 10:25:24
*/

SET FOREIGN_KEY_CHECKS=0;

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
-- Records of pk_admin
-- ----------------------------
INSERT INTO `pk_admin` VALUES ('1', 'cv', 'builder', '0', '0852114119', 't24112541', 't24112541');

-- ----------------------------
-- Table structure for pk_department
-- ----------------------------
DROP TABLE IF EXISTS `pk_department`;
CREATE TABLE `pk_department` (
  `d_id` int(5) NOT NULL AUTO_INCREMENT,
  `d_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pk_department
-- ----------------------------
INSERT INTO `pk_department` VALUES ('1', '1001', 'ช่างกล', '1');
INSERT INTO `pk_department` VALUES ('3', '3001', 'ช่างเชื่อม', '1');
INSERT INTO `pk_department` VALUES ('4', '4001', 'ช่างไฟฟ้า', '1');
INSERT INTO `pk_department` VALUES ('5', '6001', '6001', '1');
INSERT INTO `pk_department` VALUES ('6', '2001', 'ช่าง..', '1');
INSERT INTO `pk_department` VALUES ('7', '2011', 'A2', '0');

-- ----------------------------
-- Table structure for pk_department_log
-- ----------------------------
DROP TABLE IF EXISTS `pk_department_log`;
CREATE TABLE `pk_department_log` (
  `run_id` int(5) NOT NULL AUTO_INCREMENT,
  `d_id` int(5) NOT NULL,
  `d_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `u_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_log_work` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'เพิ่ม ลบ หรือแก้ไข',
  `d_log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`run_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pk_department_log
-- ----------------------------
INSERT INTO `pk_department_log` VALUES ('10', '6', '1001', 'ช่าง..', 't24112541', 'เพิ่มข้อมูล', '2018-11-07 15:19:44');
INSERT INTO `pk_department_log` VALUES ('11', '6', 'ุ6001', 'ช่างยนต์', 't24112541', 'แก้ไขข้อมูล', '2018-11-07 15:20:13');
INSERT INTO `pk_department_log` VALUES ('12', '4', '4001', 'ช่างไฟฟ้า', 't24112541', 'แก้ไขข้อมูล', '2018-11-07 15:24:57');
INSERT INTO `pk_department_log` VALUES ('13', '6', 'ุ6001', 'ช่างยนต์', 't24112541', 'ลบข้อมูล', '2018-11-07 15:25:03');
INSERT INTO `pk_department_log` VALUES ('14', '5', '6001', '6001', 't24112541', 'เพิ่มข้อมูล', '2018-11-10 22:35:00');
INSERT INTO `pk_department_log` VALUES ('15', '2', '1', '1', 't24112541', 'ลบข้อมูล', '2018-11-10 22:35:33');
INSERT INTO `pk_department_log` VALUES ('16', '5', '6001', '6001', 't24112541', 'ลบข้อมูล', '2018-11-10 22:38:18');
INSERT INTO `pk_department_log` VALUES ('17', '4', '4001', 'ช่างไฟฟ้า', 't24112541', 'ลบข้อมูล', '2018-11-10 22:41:08');
INSERT INTO `pk_department_log` VALUES ('18', '4', '4001', '', 't24112541', 'เรียกคืนข้อมูล', '2018-11-10 23:16:36');
INSERT INTO `pk_department_log` VALUES ('19', '5', '6001', '', 't24112541', 'เรียกคืนข้อมูล', '2018-11-10 23:17:00');
INSERT INTO `pk_department_log` VALUES ('20', '6', 'ุ6001', 'ช่างยนต์', 't24112541', 'เรียกคืนข้อมูล', '2018-11-10 23:18:06');
INSERT INTO `pk_department_log` VALUES ('21', '5', '6001', '6001', 't24112541', 'ลบข้อมูล', '2018-11-10 23:18:55');
INSERT INTO `pk_department_log` VALUES ('22', '5', '6001', '6001', 't24112541', 'เรียกคืนข้อมูล', '2018-11-10 23:19:06');
INSERT INTO `pk_department_log` VALUES ('23', '5', '6001', '6001', 't24112541', 'เรียกคืนข้อมูล', '2018-11-10 23:20:36');
INSERT INTO `pk_department_log` VALUES ('24', '1', '1001', 'ช่างกล', 't24112541', 'ลบข้อมูล', '2018-11-10 23:20:59');
INSERT INTO `pk_department_log` VALUES ('25', '1', '1001', 'ช่างกล', 't24112541', 'เรียกคืนข้อมูล', '2018-11-10 23:21:10');
INSERT INTO `pk_department_log` VALUES ('26', '1', '1001', 'ช่างกลปทุมวัน', 't24112541', 'แก้ไขข้อมูล', '2018-11-10 23:21:57');
INSERT INTO `pk_department_log` VALUES ('27', '1', '1001', 'ช่างกล', 't24112541', 'เรียกคืนข้อมูล', '2018-11-10 23:22:20');
INSERT INTO `pk_department_log` VALUES ('28', '1', '1001', 'ช่างกล', 't24112541', 'เรียกคืนข้อมูล', '2018-11-10 23:24:38');
INSERT INTO `pk_department_log` VALUES ('29', '1', '1001', 'ช่างกลปทุมวัน', 't24112541', 'เรียกคืนข้อมูล', '2018-11-10 23:24:56');
INSERT INTO `pk_department_log` VALUES ('30', '1', '1001', 'ช่างกล', 't24112541', 'เรียกคืนข้อมูล', '2018-11-11 11:26:23');
INSERT INTO `pk_department_log` VALUES ('31', '1', '1001', 'ช่างกลปทุมวัน', 't24112541', 'เรียกคืนข้อมูล', '2018-11-11 11:29:04');
INSERT INTO `pk_department_log` VALUES ('32', '1', '1001', 'ช่างกล', 't24112541', 'เรียกคืนข้อมูล', '2018-11-11 11:29:56');
INSERT INTO `pk_department_log` VALUES ('33', '4', '4001', 'ช่างไฟฟ้า', 't24112541', 'เรียกคืนข้อมูล', '2018-11-11 11:30:06');
INSERT INTO `pk_department_log` VALUES ('34', '4', '4001', '', 't24112541', 'เรียกคืนข้อมูล', '2018-11-11 11:30:25');
INSERT INTO `pk_department_log` VALUES ('35', '4', '4001', 'ช่างไฟฟ้า', 't24112541', 'เรียกคืนข้อมูล', '2018-11-11 11:30:35');
INSERT INTO `pk_department_log` VALUES ('36', '6', '2001', 'ช่าง..', 't24112541', 'เพิ่มข้อมูล', '2018-11-11 12:13:01');
INSERT INTO `pk_department_log` VALUES ('37', '7', '2011', 'A2', 't24112541', 'เพิ่มข้อมูล', '2018-11-11 22:15:00');
INSERT INTO `pk_department_log` VALUES ('38', '7', '2011', 'A2', 't24112541', 'ลบข้อมูล', '2018-11-11 22:15:23');

-- ----------------------------
-- Table structure for pk_group
-- ----------------------------
DROP TABLE IF EXISTS `pk_group`;
CREATE TABLE `pk_group` (
  `g_id` int(5) NOT NULL AUTO_INCREMENT,
  `g_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `t_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pk_group
-- ----------------------------
INSERT INTO `pk_group` VALUES ('4', '1010', '1001', 'A11', '1');
INSERT INTO `pk_group` VALUES ('5', '2010', '2001', 'A1', '1');
INSERT INTO `pk_group` VALUES ('6', '1011', '1001', 'A2', '1');
INSERT INTO `pk_group` VALUES ('7', '2011', '2001', 'A2', '1');
INSERT INTO `pk_group` VALUES ('8', '3010', '3001', 'A1', '1');
INSERT INTO `pk_group` VALUES ('9', '1012', '1001', 'A3', '1');
INSERT INTO `pk_group` VALUES ('10', '3011', '3001', 'A4', '1');

-- ----------------------------
-- Table structure for pk_group_log
-- ----------------------------
DROP TABLE IF EXISTS `pk_group_log`;
CREATE TABLE `pk_group_log` (
  `run_id` int(5) NOT NULL AUTO_INCREMENT,
  `g_id` int(5) NOT NULL,
  `g_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `u_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_log_work` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_log_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`run_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pk_group_log
-- ----------------------------
INSERT INTO `pk_group_log` VALUES ('5', '4', '1010', '1001', 'A1', 't24112541', 'เพิ่มข้อมูล', '2018-11-11 12:09:42');
INSERT INTO `pk_group_log` VALUES ('6', '5', '2010', '2001', 'A1', 't24112541', 'เพิ่มข้อมูล', '2018-11-11 12:09:54');
INSERT INTO `pk_group_log` VALUES ('7', '6', '1011', '1001', 'A2', 't24112541', 'เพิ่มข้อมูล', '2018-11-11 12:10:14');
INSERT INTO `pk_group_log` VALUES ('8', '4', '1010', '1001', 'A11', 't24112541', 'แก้ไขข้อมูล', '2018-11-11 12:13:43');
INSERT INTO `pk_group_log` VALUES ('9', '7', '2011', '2001', 'A2', 't24112541', 'เพิ่มข้อมูล', '2018-11-11 22:15:34');
INSERT INTO `pk_group_log` VALUES ('10', '6', '1011', '1001', 'A2', 't24112541', 'ลบข้อมูล', '2018-11-11 22:51:28');
INSERT INTO `pk_group_log` VALUES ('11', '6', '1011', '1001', 'A2', 't24112541', 'ลบข้อมูล', '2018-11-11 22:59:38');
INSERT INTO `pk_group_log` VALUES ('12', '6', '1011', '1001', 'A2', 't24112541', 'ลบข้อมูล', '2018-11-11 23:03:12');
INSERT INTO `pk_group_log` VALUES ('13', '4', '1010', '1001', 'A11', 't24112541', 'ลบข้อมูล', '2018-11-11 23:05:23');
INSERT INTO `pk_group_log` VALUES ('14', '4', '1010', '1001', 'A11', 't24112541', 'เรียกคืนข้อมูล', '2018-11-11 23:06:14');
INSERT INTO `pk_group_log` VALUES ('15', '4', '1010', '1001', 'A11', 't24112541', 'ลบข้อมูล', '2018-11-11 23:06:19');
INSERT INTO `pk_group_log` VALUES ('16', '5', '2010', '2001', 'A1', 't24112541', 'ลบข้อมูล', '2018-11-11 23:06:23');
INSERT INTO `pk_group_log` VALUES ('17', '4', '1010', '1001', 'A11', 't24112541', 'เรียกคืนข้อมูล', '2018-11-11 23:06:34');
INSERT INTO `pk_group_log` VALUES ('18', '6', '1011', '1001', 'A2', 't24112541', 'เรียกคืนข้อมูล', '2018-11-11 23:06:49');
INSERT INTO `pk_group_log` VALUES ('19', '5', '2010', '2001', 'A1', 't24112541', 'เรียกคืนข้อมูล', '2018-11-11 23:07:42');
INSERT INTO `pk_group_log` VALUES ('20', '7', '2011', '2001', 'A22222222222222', 't24112541', 'แก้ไขข้อมูล', '2018-11-11 23:08:56');
INSERT INTO `pk_group_log` VALUES ('21', '7', '2011', '2001', 'A2', 't24112541', 'เรียกคืนข้อมูล', '2018-11-11 23:09:05');
INSERT INTO `pk_group_log` VALUES ('22', '8', '3010', '3001', 'A1', 't24112541', 'เพิ่มข้อมูล', '2018-11-11 23:10:22');
INSERT INTO `pk_group_log` VALUES ('23', '8', '3010', '3001', 'A1aSVCzxbcv zngbnm', 't24112541', 'แก้ไขข้อมูล', '2018-11-11 23:11:38');
INSERT INTO `pk_group_log` VALUES ('24', '8', '3010', '3001', 'A1aSVCzxbcv zngbnm', 't24112541', 'ลบข้อมูล', '2018-11-11 23:11:46');
INSERT INTO `pk_group_log` VALUES ('25', '8', '3010', '3001', 'A1', 't24112541', 'เรียกคืนข้อมูล', '2018-11-11 23:12:15');
INSERT INTO `pk_group_log` VALUES ('26', '9', '1012', '1001', 'A3', '1', 'เพิ่มข้อมูล', '2018-11-14 15:28:09');
INSERT INTO `pk_group_log` VALUES ('27', '4', '1010', '1001', 'A11', '1', 'ลบข้อมูล', '2018-11-19 21:31:56');
INSERT INTO `pk_group_log` VALUES ('28', '4', '1010', '1001', 'A11', '1', 'เรียกคืนข้อมูล', '2018-11-19 21:32:10');
INSERT INTO `pk_group_log` VALUES ('29', '10', '3011', '3001', 'A4', 't24112541', 'เพิ่มข้อมูล', '2018-11-21 07:03:57');
INSERT INTO `pk_group_log` VALUES ('30', '10', '3011', '3001', 'A4', 't24112541', 'แก้ไขข้อมูล', '2018-11-21 09:06:25');
INSERT INTO `pk_group_log` VALUES ('31', '10', '3011', '3001', 'A4', '1', 'เรียกคืนข้อมูล', '2018-11-21 13:19:37');

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
  PRIMARY KEY (`mc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pk_machine
-- ----------------------------
INSERT INTO `pk_machine` VALUES ('1', 'สสส 123 ชัยภูมิ', 'honda ', 'wave 110 i', '6139010001');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pk_machine_log
-- ----------------------------
INSERT INTO `pk_machine_log` VALUES ('1', '1', 'สสส 123 ชัยภูมิ', 'honda ', 'wave 110 i', '6139010001', 'เพิ่มข้อมูล', '2018-11-21 10:38:39', null);

-- ----------------------------
-- Table structure for pk_match_std_tch
-- ----------------------------
DROP TABLE IF EXISTS `pk_match_std_tch`;
CREATE TABLE `pk_match_std_tch` (
  `mst_id` int(5) NOT NULL AUTO_INCREMENT,
  `t_id` int(5) NOT NULL,
  `g_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`mst_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pk_match_std_tch
-- ----------------------------

-- ----------------------------
-- Table structure for pk_position
-- ----------------------------
DROP TABLE IF EXISTS `pk_position`;
CREATE TABLE `pk_position` (
  `p_id` int(5) NOT NULL,
  `p_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pk_position
-- ----------------------------

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
  `std_pin_id` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_birthday` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_blood` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  PRIMARY KEY (`std_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pk_student
-- ----------------------------
INSERT INTO `pk_student` VALUES ('1', '6139010001', 'ช', 'นาย', 'สมปอง', 'สมมติ', '1458769803214', '14/08/1998', '6139010001', '1458769803214', '1001', '', '1');
INSERT INTO `pk_student` VALUES ('2', '1111111111', 'ช', 'นาย', 'asd', 'fgh', '1111111111111', '12/08/2015', '1111111111', '1111111111111', '2011', '', '1');
INSERT INTO `pk_student` VALUES ('3', '2222222222', 'ช', 'นาย', 'bvcq', 'kjhl', '2222222222222', '20/08/2014', '2222222222', '2222222222222', '2011', '', '1');
INSERT INTO `pk_student` VALUES ('4', '3333333333', 'ญ', 'นางสาว', 'zDFhbg', 'srtujh', '3333333333333', '28/11/2012', '3333333333', '3333333333333', '1010', '', '1');

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
  `g_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_blood` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_log_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `u_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_log_work` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`run_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pk_student_log
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pk_teacher
-- ----------------------------
INSERT INTO `pk_teacher` VALUES ('6', '7071001', 'teacher 1', '1001', '0987654321', '7071001', '0987654321', '1');
INSERT INTO `pk_teacher` VALUES ('7', '7071002', 'teacher 2', '2001', '0987654321', '7071002', '0987654321', '1');

-- ----------------------------
-- Table structure for pk_teacher_log
-- ----------------------------
DROP TABLE IF EXISTS `pk_teacher_log`;
CREATE TABLE `pk_teacher_log` (
  `run_id` int(5) NOT NULL AUTO_INCREMENT,
  `t_id` int(5) DEFAULT NULL,
  `t_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `d_code` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_tel` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_log_work` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_log_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `u_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`run_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pk_teacher_log
-- ----------------------------
INSERT INTO `pk_teacher_log` VALUES ('20', '6', '7071001', 'teacher 1', '1001', '0987654321', '7071001', '0987654321', 'ลบข้อมูล', '2018-11-21 13:37:14', 't24112541');
INSERT INTO `pk_teacher_log` VALUES ('21', '6', '7071001', 'teacher 1', '1001', '0987654321', '7071001', '0987654321', 'เรียกคืนข้อมูล', '2018-11-21 13:37:20', 't24112541');
