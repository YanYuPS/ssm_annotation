/*
 Navicat Premium Data Transfer

 Source Server         : 本地local
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : school

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 20/10/2019 08:31:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(32) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES ('11111', 'xiaoyi');
INSERT INTO `admin` VALUES ('a', 'xiaoa');
INSERT INTO `admin` VALUES ('admin', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cid` varchar(32) NOT NULL,
  `cname` varchar(200) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `course` VALUES ('001', '语文');
INSERT INTO `course` VALUES ('002', '数学');
INSERT INTO `course` VALUES ('003', '英语');
INSERT INTO `course` VALUES ('004', 'C');
INSERT INTO `course` VALUES ('005', 'Java');
COMMIT;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE,
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
BEGIN;
INSERT INTO `login` VALUES ('101', '101');
INSERT INTO `login` VALUES ('11111', '11111');
INSERT INTO `login` VALUES ('201201010203', 'hei');
INSERT INTO `login` VALUES ('201201010204', 'bai');
INSERT INTO `login` VALUES ('201201010215', 'hui');
INSERT INTO `login` VALUES ('201201010232', 'hong');
INSERT INTO `login` VALUES ('201201010307', 'zi');
INSERT INTO `login` VALUES ('201201010309', 'huang');
INSERT INTO `login` VALUES ('201201010312', 'mei');
INSERT INTO `login` VALUES ('201201010425', 'xing');
INSERT INTO `login` VALUES ('201201010439', 'yue');
INSERT INTO `login` VALUES ('22222', '22222');
INSERT INTO `login` VALUES ('a', 'a');
INSERT INTO `login` VALUES ('admin', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for login_role
-- ----------------------------
DROP TABLE IF EXISTS `login_role`;
CREATE TABLE `login_role` (
  `loginId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`loginId`,`roleId`),
  KEY `lr_roleid` (`roleId`),
  CONSTRAINT `lr_loginid` FOREIGN KEY (`loginId`) REFERENCES `login` (`username`),
  CONSTRAINT `lr_roleid` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_role
-- ----------------------------
BEGIN;
INSERT INTO `login_role` VALUES ('11111', 1);
INSERT INTO `login_role` VALUES ('201201010203', 1);
INSERT INTO `login_role` VALUES ('201201010204', 1);
INSERT INTO `login_role` VALUES ('201201010215', 1);
INSERT INTO `login_role` VALUES ('201201010232', 1);
INSERT INTO `login_role` VALUES ('201201010307', 1);
INSERT INTO `login_role` VALUES ('201201010309', 1);
INSERT INTO `login_role` VALUES ('201201010312', 1);
INSERT INTO `login_role` VALUES ('201201010425', 1);
INSERT INTO `login_role` VALUES ('201201010439', 1);
INSERT INTO `login_role` VALUES ('11111', 2);
INSERT INTO `login_role` VALUES ('a', 2);
INSERT INTO `login_role` VALUES ('admin', 2);
INSERT INTO `login_role` VALUES ('101', 3);
INSERT INTO `login_role` VALUES ('22222', 4);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'STUDENT', '学生');
INSERT INTO `role` VALUES (2, 'ADMIN', '管理员');
INSERT INTO `role` VALUES (3, 'TEACHER', '老师');
INSERT INTO `role` VALUES (4, 'NO', '无权限');
COMMIT;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birth` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
BEGIN;
INSERT INTO `student` VALUES ('11111', 'xiaoyi', '女', '1991-01-01');
INSERT INTO `student` VALUES ('201201010203', '小黑', '男', '1994-05-03');
INSERT INTO `student` VALUES ('201201010204', '小白', '女', '1994-05-03');
INSERT INTO `student` VALUES ('201201010215', '小灰', '男', '1994-01-03');
INSERT INTO `student` VALUES ('201201010232', '小红', '女', '1994-12-03');
INSERT INTO `student` VALUES ('201201010307', '小紫', '男', '1994-10-03');
INSERT INTO `student` VALUES ('201201010309', '小黄', '男', '1993-02-03');
INSERT INTO `student` VALUES ('201201010312', '小梅', '女', '1993-06-03');
INSERT INTO `student` VALUES ('201201010425', '小星', '男', '1993-07-03');
INSERT INTO `student` VALUES ('201201010439', '小月', '女', '1993-05-03');
INSERT INTO `student` VALUES ('22222', 'xiaoer', '男', '1991-02-02');
COMMIT;

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course` (
  `sid` varchar(32) NOT NULL,
  `tcid` int(32) NOT NULL,
  `score` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`,`tcid`) USING BTREE,
  KEY `sc_cid` (`tcid`),
  CONSTRAINT `sc_sid` FOREIGN KEY (`sid`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_course
-- ----------------------------
BEGIN;
INSERT INTO `student_course` VALUES ('11111', 2, 101);
INSERT INTO `student_course` VALUES ('11111', 13, 0);
INSERT INTO `student_course` VALUES ('201201010203', 1, 123);
INSERT INTO `student_course` VALUES ('201201010203', 2, 81);
INSERT INTO `student_course` VALUES ('201201010203', 3, 82);
INSERT INTO `student_course` VALUES ('201201010203', 4, 83);
INSERT INTO `student_course` VALUES ('201201010203', 5, 84);
INSERT INTO `student_course` VALUES ('201201010204', 1, 113);
INSERT INTO `student_course` VALUES ('201201010204', 2, 91);
INSERT INTO `student_course` VALUES ('201201010204', 4, 50);
INSERT INTO `student_course` VALUES ('201201010232', 9, 129);
COMMIT;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
BEGIN;
INSERT INTO `teacher` VALUES ('101', '张老师');
INSERT INTO `teacher` VALUES ('102', '王老师');
INSERT INTO `teacher` VALUES ('103', '李老师');
COMMIT;

-- ----------------------------
-- Table structure for teacher_course
-- ----------------------------
DROP TABLE IF EXISTS `teacher_course`;
CREATE TABLE `teacher_course` (
  `tcid` int(32) NOT NULL AUTO_INCREMENT COMMENT '教课表id',
  `tid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师id',
  `cid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程id',
  PRIMARY KEY (`tcid`) USING BTREE,
  KEY `tc_tid` (`tid`),
  KEY `tc_cid` (`cid`),
  CONSTRAINT `tc_cid` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  CONSTRAINT `tc_tid` FOREIGN KEY (`tid`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_course
-- ----------------------------
BEGIN;
INSERT INTO `teacher_course` VALUES (1, '101', '001');
INSERT INTO `teacher_course` VALUES (2, '101', '004');
INSERT INTO `teacher_course` VALUES (3, '102', '001');
INSERT INTO `teacher_course` VALUES (4, '102', '002');
INSERT INTO `teacher_course` VALUES (5, '102', '005');
INSERT INTO `teacher_course` VALUES (6, '103', '003');
INSERT INTO `teacher_course` VALUES (9, '101', '002');
INSERT INTO `teacher_course` VALUES (13, '103', '005');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
