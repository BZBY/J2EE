/*
 Navicat Premium Data Transfer

 Source Server         : MySQLdemo2
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : j2ee

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 02/12/2022 22:10:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_areaclass
-- ----------------------------
DROP TABLE IF EXISTS `t_areaclass`;
CREATE TABLE `t_areaclass`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_areaclass
-- ----------------------------
INSERT INTO `t_areaclass` VALUES (1, '01', '50m');
INSERT INTO `t_areaclass` VALUES (2, '02', '50m');
INSERT INTO `t_areaclass` VALUES (3, '03', '91m');
INSERT INTO `t_areaclass` VALUES (4, '04', '99m');
INSERT INTO `t_areaclass` VALUES (15, '05', '50m');

-- ----------------------------
-- Table structure for t_building
-- ----------------------------
DROP TABLE IF EXISTS `t_building`;
CREATE TABLE `t_building`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_building
-- ----------------------------
INSERT INTO `t_building` VALUES (1, '01', '朝阳小区');

-- ----------------------------
-- Table structure for t_decorateclass
-- ----------------------------
DROP TABLE IF EXISTS `t_decorateclass`;
CREATE TABLE `t_decorateclass`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_decorateclass
-- ----------------------------
INSERT INTO `t_decorateclass` VALUES (1, '01', '精装');
INSERT INTO `t_decorateclass` VALUES (2, '02', '精装');

-- ----------------------------
-- Table structure for t_displaylocation
-- ----------------------------
DROP TABLE IF EXISTS `t_displaylocation`;
CREATE TABLE `t_displaylocation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_displaylocation
-- ----------------------------
INSERT INTO `t_displaylocation` VALUES (1, '01', '客厅');

-- ----------------------------
-- Table structure for t_housingcondition
-- ----------------------------
DROP TABLE IF EXISTS `t_housingcondition`;
CREATE TABLE `t_housingcondition`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_housingcondition
-- ----------------------------
INSERT INTO `t_housingcondition` VALUES (1, '01', '未售');
INSERT INTO `t_housingcondition` VALUES (16, '02', '待售');

-- ----------------------------
-- Table structure for t_ownership
-- ----------------------------
DROP TABLE IF EXISTS `t_ownership`;
CREATE TABLE `t_ownership`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_ownership
-- ----------------------------
INSERT INTO `t_ownership` VALUES (1, '01', '经济适用房');

-- ----------------------------
-- Table structure for t_propertyclass
-- ----------------------------
DROP TABLE IF EXISTS `t_propertyclass`;
CREATE TABLE `t_propertyclass`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_propertyclass
-- ----------------------------
INSERT INTO `t_propertyclass` VALUES (1, '01', '普通');

-- ----------------------------
-- Table structure for t_roleclass
-- ----------------------------
DROP TABLE IF EXISTS `t_roleclass`;
CREATE TABLE `t_roleclass`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_roleclass
-- ----------------------------
INSERT INTO `t_roleclass` VALUES (1, '01', '所有');

-- ----------------------------
-- Table structure for t_suiteclass
-- ----------------------------
DROP TABLE IF EXISTS `t_suiteclass`;
CREATE TABLE `t_suiteclass`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_suiteclass
-- ----------------------------
INSERT INTO `t_suiteclass` VALUES (1, '00', '四室');

-- ----------------------------
-- Table structure for t_towardsclass
-- ----------------------------
DROP TABLE IF EXISTS `t_towardsclass`;
CREATE TABLE `t_towardsclass`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_towardsclass
-- ----------------------------
INSERT INTO `t_towardsclass` VALUES (1, '01', '南');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (8, 'user1', '李逍遥', '123', '18702680721');
INSERT INTO `t_user` VALUES (22, 'user2', '李霄云', '123', '15216259142');
INSERT INTO `t_user` VALUES (23, 'user3', '札克', '123', '15216259142');
INSERT INTO `t_user` VALUES (24, 'user4', '李雨皮', '123', '15216259142');
INSERT INTO `t_user` VALUES (26, 'user6', '札克', '123', '15216259142');
INSERT INTO `t_user` VALUES (27, 'user7', '札克', '123', '15216259142');
INSERT INTO `t_user` VALUES (28, 'user8', '札克', '123', '18702680721');

-- ----------------------------
-- Table structure for t_userrole
-- ----------------------------
DROP TABLE IF EXISTS `t_userrole`;
CREATE TABLE `t_userrole`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rolecode` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_userrole
-- ----------------------------
INSERT INTO `t_userrole` VALUES (8, 'user1', '00', '普通用户');
INSERT INTO `t_userrole` VALUES (22, 'user2', '00', '普通用户');
INSERT INTO `t_userrole` VALUES (23, 'user3', '00', '普通用户');
INSERT INTO `t_userrole` VALUES (24, 'user4', '00', '普通用户');
INSERT INTO `t_userrole` VALUES (26, 'user6', '00', '普通用户');
INSERT INTO `t_userrole` VALUES (27, 'user7', '00', '普通用户');
INSERT INTO `t_userrole` VALUES (28, 'user1', '01', '管理员');
INSERT INTO `t_userrole` VALUES (29, 'user8', '00', '普通用户');

SET FOREIGN_KEY_CHECKS = 1;
