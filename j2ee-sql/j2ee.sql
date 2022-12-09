/*
 Navicat MySQL Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : j2ee

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 10/12/2022 02:15:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_areabelong
-- ----------------------------
DROP TABLE IF EXISTS `t_areabelong`;
CREATE TABLE `t_areabelong`  (
  `id` int NOT NULL,
  `areabelong` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_areabelong
-- ----------------------------
INSERT INTO `t_areabelong` VALUES (1, '朝阳小区');
INSERT INTO `t_areabelong` VALUES (2, '第一小区');
INSERT INTO `t_areabelong` VALUES (3, '第二小区');
INSERT INTO `t_areabelong` VALUES (4, '第三小区');

-- ----------------------------
-- Table structure for t_areaclass
-- ----------------------------
DROP TABLE IF EXISTS `t_areaclass`;
CREATE TABLE `t_areaclass`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_building
-- ----------------------------
INSERT INTO `t_building` VALUES (1, '01', '朝阳小区');

-- ----------------------------
-- Table structure for t_decorateclass
-- ----------------------------
DROP TABLE IF EXISTS `t_decorateclass`;
CREATE TABLE `t_decorateclass`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_displaylocation
-- ----------------------------
INSERT INTO `t_displaylocation` VALUES (1, '01', '客厅');

-- ----------------------------
-- Table structure for t_fitup
-- ----------------------------
DROP TABLE IF EXISTS `t_fitup`;
CREATE TABLE `t_fitup`  (
  `id` int NOT NULL,
  `fitup` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`fitup`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_fitup
-- ----------------------------
INSERT INTO `t_fitup` VALUES (0, '不限');
INSERT INTO `t_fitup` VALUES (2, '普通装修');
INSERT INTO `t_fitup` VALUES (1, '精装');

-- ----------------------------
-- Table structure for t_housingcondition
-- ----------------------------
DROP TABLE IF EXISTS `t_housingcondition`;
CREATE TABLE `t_housingcondition`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_ownership
-- ----------------------------
INSERT INTO `t_ownership` VALUES (1, '01', '经济适用房');

-- ----------------------------
-- Table structure for t_propertyclass
-- ----------------------------
DROP TABLE IF EXISTS `t_propertyclass`;
CREATE TABLE `t_propertyclass`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_propertyclass
-- ----------------------------
INSERT INTO `t_propertyclass` VALUES (1, '01', '普通');

-- ----------------------------
-- Table structure for t_roleclass
-- ----------------------------
DROP TABLE IF EXISTS `t_roleclass`;
CREATE TABLE `t_roleclass`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_roleclass
-- ----------------------------
INSERT INTO `t_roleclass` VALUES (1, '01', '所有');

-- ----------------------------
-- Table structure for t_sellhouse
-- ----------------------------
DROP TABLE IF EXISTS `t_sellhouse`;
CREATE TABLE `t_sellhouse`  (
  `id` int NOT NULL,
  `sellperson` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sellhouse
-- ----------------------------
INSERT INTO `t_sellhouse` VALUES (1, 'Amly');
INSERT INTO `t_sellhouse` VALUES (2, 'Ruby');
INSERT INTO `t_sellhouse` VALUES (3, 'Emli');
INSERT INTO `t_sellhouse` VALUES (4, 'Tob');
INSERT INTO `t_sellhouse` VALUES (5, 'Alicl');

-- ----------------------------
-- Table structure for t_status
-- ----------------------------
DROP TABLE IF EXISTS `t_status`;
CREATE TABLE `t_status`  (
  `id` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_status
-- ----------------------------
INSERT INTO `t_status` VALUES (0, '不限');
INSERT INTO `t_status` VALUES (1, '待售');
INSERT INTO `t_status` VALUES (2, '已售');

-- ----------------------------
-- Table structure for t_suiteclass
-- ----------------------------
DROP TABLE IF EXISTS `t_suiteclass`;
CREATE TABLE `t_suiteclass`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_suiteclass
-- ----------------------------
INSERT INTO `t_suiteclass` VALUES (1, '00', '四室');

-- ----------------------------
-- Table structure for t_towardall
-- ----------------------------
DROP TABLE IF EXISTS `t_towardall`;
CREATE TABLE `t_towardall`  (
  `id` int NOT NULL,
  `toward` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_towardall
-- ----------------------------
INSERT INTO `t_towardall` VALUES (0, '不限');
INSERT INTO `t_towardall` VALUES (1, '南');
INSERT INTO `t_towardall` VALUES (2, '北');
INSERT INTO `t_towardall` VALUES (3, '东');
INSERT INTO `t_towardall` VALUES (4, '西');
INSERT INTO `t_towardall` VALUES (5, '东南');
INSERT INTO `t_towardall` VALUES (6, '西南');
INSERT INTO `t_towardall` VALUES (7, '东北');
INSERT INTO `t_towardall` VALUES (8, '西北');

-- ----------------------------
-- Table structure for t_towardsclass
-- ----------------------------
DROP TABLE IF EXISTS `t_towardsclass`;
CREATE TABLE `t_towardsclass`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `caption` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_towardsclass
-- ----------------------------
INSERT INTO `t_towardsclass` VALUES (1, '01', '南');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `t_user` VALUES (29, '1', '1', '1', '1');

-- ----------------------------
-- Table structure for t_userrole
-- ----------------------------
DROP TABLE IF EXISTS `t_userrole`;
CREATE TABLE `t_userrole`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rolecode` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `caption` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `t_userrole` VALUES (31, '1', '00', '普通用户');

-- ----------------------------
-- Table structure for t_wuye
-- ----------------------------
DROP TABLE IF EXISTS `t_wuye`;
CREATE TABLE `t_wuye`  (
  `id` int NOT NULL,
  `wuye` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`wuye`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wuye
-- ----------------------------
INSERT INTO `t_wuye` VALUES (1, '不限');
INSERT INTO `t_wuye` VALUES (3, '中等');
INSERT INTO `t_wuye` VALUES (2, '普通');
INSERT INTO `t_wuye` VALUES (4, '高级');

SET FOREIGN_KEY_CHECKS = 1;
