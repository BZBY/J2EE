/*
 Navicat Premium Data Transfer

 Source Server         : zhy_edu
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : j2ee

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 17/11/2022 16:27:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
