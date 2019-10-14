/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : fullstack

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-10-06 18:18:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account_logs
-- ----------------------------
DROP TABLE IF EXISTS `account_logs`;
CREATE TABLE `account_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adminid` int(11) DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of account_logs
-- ----------------------------

-- ----------------------------
-- Table structure for action_logs
-- ----------------------------
DROP TABLE IF EXISTS `action_logs`;
CREATE TABLE `action_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of action_logs
-- ----------------------------
INSERT INTO `action_logs` VALUES ('1', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-09 16:02:50', '2019-09-09 16:02:50');
INSERT INTO `action_logs` VALUES ('2', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-09 16:03:30', '2019-09-09 16:03:30');
INSERT INTO `action_logs` VALUES ('3', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-09 19:10:00', '2019-09-09 19:10:00');
INSERT INTO `action_logs` VALUES ('4', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-10 11:37:29', '2019-09-10 11:37:29');
INSERT INTO `action_logs` VALUES ('5', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-10 17:21:55', '2019-09-10 17:21:55');
INSERT INTO `action_logs` VALUES ('6', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-11 08:31:24', '2019-09-11 08:31:24');
INSERT INTO `action_logs` VALUES ('7', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-11 11:34:47', '2019-09-11 11:34:47');
INSERT INTO `action_logs` VALUES ('8', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-11 16:32:17', '2019-09-11 16:32:17');
INSERT INTO `action_logs` VALUES ('9', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-11 20:31:03', '2019-09-11 20:31:03');
INSERT INTO `action_logs` VALUES ('10', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-12 08:57:07', '2019-09-12 08:57:07');
INSERT INTO `action_logs` VALUES ('11', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-12 14:27:52', '2019-09-12 14:27:52');
INSERT INTO `action_logs` VALUES ('12', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-12 17:45:33', '2019-09-12 17:45:33');
INSERT INTO `action_logs` VALUES ('13', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-19 10:24:34', '2019-09-19 10:24:34');
INSERT INTO `action_logs` VALUES ('14', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-19 16:33:19', '2019-09-19 16:33:19');
INSERT INTO `action_logs` VALUES ('15', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-19 19:34:23', '2019-09-19 19:34:23');
INSERT INTO `action_logs` VALUES ('16', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-20 19:11:07', '2019-09-20 19:11:07');
INSERT INTO `action_logs` VALUES ('17', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-23 08:59:31', '2019-09-23 08:59:31');
INSERT INTO `action_logs` VALUES ('18', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-23 11:59:55', '2019-09-23 11:59:55');
INSERT INTO `action_logs` VALUES ('19', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-23 15:15:10', '2019-09-23 15:15:10');
INSERT INTO `action_logs` VALUES ('20', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-23 18:26:26', '2019-09-23 18:26:26');
INSERT INTO `action_logs` VALUES ('21', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-24 08:04:42', '2019-09-24 08:04:42');
INSERT INTO `action_logs` VALUES ('22', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-24 11:09:15', '2019-09-24 11:09:15');
INSERT INTO `action_logs` VALUES ('23', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-24 15:09:32', '2019-09-24 15:09:32');
INSERT INTO `action_logs` VALUES ('24', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-25 13:53:04', '2019-09-25 13:53:04');
INSERT INTO `action_logs` VALUES ('25', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-26 15:15:03', '2019-09-26 15:15:03');
INSERT INTO `action_logs` VALUES ('26', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-26 16:16:30', '2019-09-26 16:16:30');
INSERT INTO `action_logs` VALUES ('27', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-27 11:38:55', '2019-09-27 11:38:55');
INSERT INTO `action_logs` VALUES ('28', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-28 13:44:56', '2019-09-28 13:44:56');
INSERT INTO `action_logs` VALUES ('29', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-28 17:40:00', '2019-09-28 17:40:00');
INSERT INTO `action_logs` VALUES ('30', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-29 08:23:32', '2019-09-29 08:23:32');
INSERT INTO `action_logs` VALUES ('31', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-29 13:45:22', '2019-09-29 13:45:22');
INSERT INTO `action_logs` VALUES ('32', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-29 17:43:14', '2019-09-29 17:43:14');
INSERT INTO `action_logs` VALUES ('33', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-30 09:02:34', '2019-09-30 09:02:34');
INSERT INTO `action_logs` VALUES ('34', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-09-30 17:42:48', '2019-09-30 17:42:48');
INSERT INTO `action_logs` VALUES ('35', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-10-06 09:41:52', '2019-10-06 09:41:52');
INSERT INTO `action_logs` VALUES ('36', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-10-06 13:21:21', '2019-10-06 13:21:21');
INSERT INTO `action_logs` VALUES ('37', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-10-06 16:24:23', '2019-10-06 16:24:23');

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `consignee` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `county` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT '1',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wechat_openid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `wechat_unionid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `qq_openid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weibo_uid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `last_login_time` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_username_unique` (`username`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'administrator', '超级管理员', 'admin@yourweb.com', '10086', '1', '$2y$10$zWF6zkB5wnvnTtKhimqHou9Lb5UqK.hvvmZHZ6sqEro2CQHfwbIG.', null, '', '', '', '', '127.0.0.1', '2019-10-06 16:24:23', '1', 'tknSNMBj4p', '2019-09-09 15:56:53', '2019-10-06 16:24:23', null);

-- ----------------------------
-- Table structure for areas
-- ----------------------------
DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `area_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '栏目名',
  `pid` int(11) DEFAULT NULL COMMENT '父栏目',
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL COMMENT '1.省 2.市 3.区 4.镇',
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '50' COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of areas
-- ----------------------------
INSERT INTO `areas` VALUES ('1', '中国', null, '0', '0', '0', '0', '0', '0');
INSERT INTO `areas` VALUES ('110000', '北京', '1', '北京', '116.405289', '39.904987', '1', 'tr_0', '1');
INSERT INTO `areas` VALUES ('110100', '北京市', '110000', '北京', '116.405289', '39.904987', '2', 'tr_0 tr_110000', '1');
INSERT INTO `areas` VALUES ('110101', '东城区', '110100', '东城', '116.418755', '39.917545', '3', 'tr_0 tr_110000 tr_110100', '3');
INSERT INTO `areas` VALUES ('110102', '西城区', '110100', '西城', '116.366791', '39.91531', '3', 'tr_0 tr_110000 tr_110100', '15');
INSERT INTO `areas` VALUES ('110105', '朝阳区', '110100', '朝阳', '116.486412', '39.92149', '3', 'tr_0 tr_110000 tr_110100', '2');
INSERT INTO `areas` VALUES ('110106', '丰台区', '110100', '丰台', '116.286964', '39.863644', '3', 'tr_0 tr_110000 tr_110100', '6');
INSERT INTO `areas` VALUES ('110107', '石景山区', '110100', '石景山', '116.195442', '39.9146', '3', 'tr_0 tr_110000 tr_110100', '12');
INSERT INTO `areas` VALUES ('110108', '海淀区', '110100', '海淀', '116.310318', '39.956074', '3', 'tr_0 tr_110000 tr_110100', '7');
INSERT INTO `areas` VALUES ('110109', '门头沟区', '110100', '门头沟', '116.105377', '39.937183', '3', 'tr_0 tr_110000 tr_110100', '9');
INSERT INTO `areas` VALUES ('110111', '房山区', '110100', '房山', '116.13916', '39.735535', '3', 'tr_0 tr_110000 tr_110100', '5');
INSERT INTO `areas` VALUES ('110112', '通州区', '110100', '通州', '116.6586', '39.902485', '3', 'tr_0 tr_110000 tr_110100', '14');
INSERT INTO `areas` VALUES ('110113', '顺义区', '110100', '顺义', '116.653526', '40.128937', '3', 'tr_0 tr_110000 tr_110100', '13');
INSERT INTO `areas` VALUES ('110114', '昌平区', '110100', '昌平', '116.235909', '40.218086', '3', 'tr_0 tr_110000 tr_110100', '1');
INSERT INTO `areas` VALUES ('110115', '大兴区', '110100', '大兴', '116.338036', '39.728909', '3', 'tr_0 tr_110000 tr_110100', '4');
INSERT INTO `areas` VALUES ('110116', '怀柔区', '110100', '怀柔', '116.637123', '40.324272', '3', 'tr_0 tr_110000 tr_110100', '8');
INSERT INTO `areas` VALUES ('110117', '平谷区', '110100', '平谷', '117.112335', '40.144783', '3', 'tr_0 tr_110000 tr_110100', '11');
INSERT INTO `areas` VALUES ('110228', '密云县', '110100', '密云', '116.843353', '40.377361', '3', 'tr_0 tr_110000 tr_110100', '10');
INSERT INTO `areas` VALUES ('110229', '延庆县', '110100', '延庆', '115.985008', '40.465324', '3', 'tr_0 tr_110000 tr_110100', '16');
INSERT INTO `areas` VALUES ('120000', '天津', '1', '天津', '117.190186', '39.125595', '1', 'tr_0', '2');
INSERT INTO `areas` VALUES ('120100', '天津市', '120000', '天津', '117.190186', '39.125595', '2', 'tr_0 tr_120000', '1');
INSERT INTO `areas` VALUES ('120101', '和平区', '120100', '和平', '117.195908', '39.118328', '3', 'tr_0 tr_120000 tr_120100', '7');
INSERT INTO `areas` VALUES ('120102', '河东区', '120100', '河东', '117.22657', '39.122124', '3', 'tr_0 tr_120000 tr_120100', '6');
INSERT INTO `areas` VALUES ('120103', '河西区', '120100', '河西', '117.217537', '39.101898', '3', 'tr_0 tr_120000 tr_120100', '8');
INSERT INTO `areas` VALUES ('120104', '南开区', '120100', '南开', '117.164146', '39.120476', '3', 'tr_0 tr_120000 tr_120100', '13');
INSERT INTO `areas` VALUES ('120105', '河北区', '120100', '河北', '117.201569', '39.156631', '3', 'tr_0 tr_120000 tr_120100', '5');
INSERT INTO `areas` VALUES ('120106', '红桥区', '120100', '红桥', '117.1633', '39.175068', '3', 'tr_0 tr_120000 tr_120100', '9');
INSERT INTO `areas` VALUES ('120110', '东丽区', '120100', '东丽', '117.313965', '39.087765', '3', 'tr_0 tr_120000 tr_120100', '4');
INSERT INTO `areas` VALUES ('120111', '西青区', '120100', '西青', '117.012245', '39.139446', '3', 'tr_0 tr_120000 tr_120100', '16');
INSERT INTO `areas` VALUES ('120112', '津南区', '120100', '津南', '117.382545', '38.989578', '3', 'tr_0 tr_120000 tr_120100', '11');
INSERT INTO `areas` VALUES ('120113', '北辰区', '120100', '北辰', '117.134819', '39.225555', '3', 'tr_0 tr_120000 tr_120100', '2');
INSERT INTO `areas` VALUES ('120114', '武清区', '120100', '武清', '117.057961', '39.376926', '3', 'tr_0 tr_120000 tr_120100', '15');
INSERT INTO `areas` VALUES ('120115', '宝坻区', '120100', '宝坻', '117.30809', '39.716965', '3', 'tr_0 tr_120000 tr_120100', '1');
INSERT INTO `areas` VALUES ('120116', '滨海新区', '120100', '滨海', '117.654175', '39.032845', '3', 'tr_0 tr_120000 tr_120100', '3');
INSERT INTO `areas` VALUES ('120221', '宁河县', '120100', '宁河', '117.828278', '39.328884', '3', 'tr_0 tr_120000 tr_120100', '14');
INSERT INTO `areas` VALUES ('120223', '静海县', '120100', '静海', '116.925301', '38.935673', '3', 'tr_0 tr_120000 tr_120100', '10');
INSERT INTO `areas` VALUES ('120225', '蓟县', '120100', '蓟县', '117.407448', '40.045341', '3', 'tr_0 tr_120000 tr_120100', '12');
INSERT INTO `areas` VALUES ('130000', '河北省', '1', '河北', '114.502464', '38.045475', '1', 'tr_0', '3');
INSERT INTO `areas` VALUES ('130100', '石家庄市', '130000', '石家庄', '114.502464', '38.045475', '2', 'tr_0 tr_130000', '8');
INSERT INTO `areas` VALUES ('130102', '长安区', '130100', '长安', '114.548149', '38.047501', '3', 'tr_0 tr_130000 tr_130100', '1');
INSERT INTO `areas` VALUES ('130103', '桥东区', '130100', '桥东', '114.502892', '38.040154', '3', 'tr_0 tr_130000 tr_130100', '11');
INSERT INTO `areas` VALUES ('130104', '桥西区', '130100', '桥西', '114.462929', '38.028381', '3', 'tr_0 tr_130000 tr_130100', '12');
INSERT INTO `areas` VALUES ('130105', '新华区', '130100', '新华', '114.465973', '38.067142', '3', 'tr_0 tr_130000 tr_130100', '16');
INSERT INTO `areas` VALUES ('130107', '井陉矿区', '130100', '井陉矿', '114.058182', '38.069748', '3', 'tr_0 tr_130000 tr_130100', '4');
INSERT INTO `areas` VALUES ('130108', '裕华区', '130100', '裕华', '114.533257', '38.027695', '3', 'tr_0 tr_130000 tr_130100', '20');
INSERT INTO `areas` VALUES ('130121', '井陉县', '130100', '井陉', '114.144485', '38.033615', '3', 'tr_0 tr_130000 tr_130100', '5');
INSERT INTO `areas` VALUES ('130123', '正定县', '130100', '正定', '114.569885', '38.147835', '3', 'tr_0 tr_130000 tr_130100', '23');
INSERT INTO `areas` VALUES ('130124', '栾城县', '130100', '栾城', '114.654282', '37.886909', '3', 'tr_0 tr_130000 tr_130100', '8');
INSERT INTO `areas` VALUES ('130125', '行唐县', '130100', '行唐', '114.552734', '38.437424', '3', 'tr_0 tr_130000 tr_130100', '15');
INSERT INTO `areas` VALUES ('130126', '灵寿县', '130100', '灵寿', '114.379463', '38.306545', '3', 'tr_0 tr_130000 tr_130100', '7');
INSERT INTO `areas` VALUES ('130127', '高邑县', '130100', '高邑', '114.610703', '37.605713', '3', 'tr_0 tr_130000 tr_130100', '3');
INSERT INTO `areas` VALUES ('130128', '深泽县', '130100', '深泽', '115.200211', '38.18454', '3', 'tr_0 tr_130000 tr_130100', '13');
INSERT INTO `areas` VALUES ('130129', '赞皇县', '130100', '赞皇', '114.387756', '37.660198', '3', 'tr_0 tr_130000 tr_130100', '21');
INSERT INTO `areas` VALUES ('130130', '无极县', '130100', '无极', '114.977844', '38.176376', '3', 'tr_0 tr_130000 tr_130100', '14');
INSERT INTO `areas` VALUES ('130131', '平山县', '130100', '平山', '114.184143', '38.259312', '3', 'tr_0 tr_130000 tr_130100', '10');
INSERT INTO `areas` VALUES ('130132', '元氏县', '130100', '元氏', '114.526176', '37.762512', '3', 'tr_0 tr_130000 tr_130100', '19');
INSERT INTO `areas` VALUES ('130133', '赵县', '130100', '赵县', '114.77536', '37.754341', '3', 'tr_0 tr_130000 tr_130100', '22');
INSERT INTO `areas` VALUES ('130181', '辛集市', '130100', '辛集', '115.217453', '37.929039', '3', 'tr_0 tr_130000 tr_130100', '17');
INSERT INTO `areas` VALUES ('130182', '藁城市', '130100', '藁城', '114.849648', '38.033768', '3', 'tr_0 tr_130000 tr_130100', '2');
INSERT INTO `areas` VALUES ('130183', '晋州市', '130100', '晋州', '115.044884', '38.027477', '3', 'tr_0 tr_130000 tr_130100', '6');
INSERT INTO `areas` VALUES ('130184', '新乐市', '130100', '新乐', '114.685783', '38.344769', '3', 'tr_0 tr_130000 tr_130100', '18');
INSERT INTO `areas` VALUES ('130185', '鹿泉市', '130100', '鹿泉', '114.321022', '38.093994', '3', 'tr_0 tr_130000 tr_130100', '9');
INSERT INTO `areas` VALUES ('130200', '唐山市', '130000', '唐山', '118.175392', '39.635113', '2', 'tr_0 tr_130000', '9');
INSERT INTO `areas` VALUES ('130202', '路南区', '130200', '路南', '118.210823', '39.615162', '3', 'tr_0 tr_130000 tr_130200', '10');
INSERT INTO `areas` VALUES ('130203', '路北区', '130200', '路北', '118.174736', '39.628536', '3', 'tr_0 tr_130000 tr_130200', '9');
INSERT INTO `areas` VALUES ('130204', '古冶区', '130200', '古冶', '118.454292', '39.715736', '3', 'tr_0 tr_130000 tr_130200', '4');
INSERT INTO `areas` VALUES ('130205', '开平区', '130200', '开平', '118.264427', '39.67617', '3', 'tr_0 tr_130000 tr_130200', '5');
INSERT INTO `areas` VALUES ('130207', '丰南区', '130200', '丰南', '118.110794', '39.56303', '3', 'tr_0 tr_130000 tr_130200', '2');
INSERT INTO `areas` VALUES ('130208', '丰润区', '130200', '丰润', '118.155777', '39.831364', '3', 'tr_0 tr_130000 tr_130200', '3');
INSERT INTO `areas` VALUES ('130223', '滦县', '130200', '滦县', '118.699547', '39.74485', '3', 'tr_0 tr_130000 tr_130200', '8');
INSERT INTO `areas` VALUES ('130224', '滦南县', '130200', '滦南', '118.681549', '39.506203', '3', 'tr_0 tr_130000 tr_130200', '7');
INSERT INTO `areas` VALUES ('130225', '乐亭县', '130200', '乐亭', '118.905342', '39.428131', '3', 'tr_0 tr_130000 tr_130200', '6');
INSERT INTO `areas` VALUES ('130227', '迁西县', '130200', '迁西', '118.305138', '40.146236', '3', 'tr_0 tr_130000 tr_130200', '12');
INSERT INTO `areas` VALUES ('130229', '玉田县', '130200', '玉田', '117.753662', '39.887321', '3', 'tr_0 tr_130000 tr_130200', '13');
INSERT INTO `areas` VALUES ('130230', '曹妃甸区', '130200', '曹妃甸', '118.446587', '39.278278', '3', 'tr_0 tr_130000 tr_130200', '1');
INSERT INTO `areas` VALUES ('130281', '遵化市', '130200', '遵化', '117.965874', '40.188618', '3', 'tr_0 tr_130000 tr_130200', '14');
INSERT INTO `areas` VALUES ('130283', '迁安市', '130200', '迁安', '118.701935', '40.012108', '3', 'tr_0 tr_130000 tr_130200', '11');
INSERT INTO `areas` VALUES ('130300', '秦皇岛市', '130000', '秦皇岛', '119.586578', '39.942532', '2', 'tr_0 tr_130000', '7');
INSERT INTO `areas` VALUES ('130302', '海港区', '130300', '海港', '119.596222', '39.943459', '3', 'tr_0 tr_130000 tr_130300', '4');
INSERT INTO `areas` VALUES ('130303', '山海关区', '130300', '山海关', '119.753593', '39.998024', '3', 'tr_0 tr_130000 tr_130300', '7');
INSERT INTO `areas` VALUES ('130304', '北戴河区', '130300', '北戴河', '119.486282', '39.825123', '3', 'tr_0 tr_130000 tr_130300', '1');
INSERT INTO `areas` VALUES ('130321', '青龙满族自治县', '130300', '青龙', '118.954552', '40.406021', '3', 'tr_0 tr_130000 tr_130300', '6');
INSERT INTO `areas` VALUES ('130322', '昌黎县', '130300', '昌黎', '119.164543', '39.709728', '3', 'tr_0 tr_130000 tr_130300', '2');
INSERT INTO `areas` VALUES ('130323', '抚宁县', '130300', '抚宁', '119.240654', '39.887054', '3', 'tr_0 tr_130000 tr_130300', '3');
INSERT INTO `areas` VALUES ('130324', '卢龙县', '130300', '卢龙', '118.881805', '39.89164', '3', 'tr_0 tr_130000 tr_130300', '5');
INSERT INTO `areas` VALUES ('130400', '邯郸市', '130000', '邯郸', '114.490685', '36.612274', '2', 'tr_0 tr_130000', '4');
INSERT INTO `areas` VALUES ('130402', '邯山区', '130400', '邯山', '114.484985', '36.603195', '3', 'tr_0 tr_130000 tr_130400', '11');
INSERT INTO `areas` VALUES ('130403', '丛台区', '130400', '丛台', '114.494705', '36.61108', '3', 'tr_0 tr_130000 tr_130400', '3');
INSERT INTO `areas` VALUES ('130404', '复兴区', '130400', '复兴', '114.458244', '36.615482', '3', 'tr_0 tr_130000 tr_130400', '7');
INSERT INTO `areas` VALUES ('130406', '峰峰矿区', '130400', '峰峰矿', '114.209938', '36.420486', '3', 'tr_0 tr_130000 tr_130400', '6');
INSERT INTO `areas` VALUES ('130421', '邯郸县', '130400', '邯郸', '114.531082', '36.593906', '3', 'tr_0 tr_130000 tr_130400', '10');
INSERT INTO `areas` VALUES ('130423', '临漳县', '130400', '临漳', '114.610703', '36.337605', '3', 'tr_0 tr_130000 tr_130400', '13');
INSERT INTO `areas` VALUES ('130424', '成安县', '130400', '成安', '114.680359', '36.443832', '3', 'tr_0 tr_130000 tr_130400', '1');
INSERT INTO `areas` VALUES ('130425', '大名县', '130400', '大名', '115.152588', '36.283318', '3', 'tr_0 tr_130000 tr_130400', '4');
INSERT INTO `areas` VALUES ('130426', '涉县', '130400', '涉县', '113.673294', '36.563145', '3', 'tr_0 tr_130000 tr_130400', '16');
INSERT INTO `areas` VALUES ('130427', '磁县', '130400', '磁县', '114.38208', '36.367672', '3', 'tr_0 tr_130000 tr_130400', '2');
INSERT INTO `areas` VALUES ('130428', '肥乡县', '130400', '肥乡', '114.805153', '36.555779', '3', 'tr_0 tr_130000 tr_130400', '5');
INSERT INTO `areas` VALUES ('130429', '永年县', '130400', '永年', '114.496162', '36.776413', '3', 'tr_0 tr_130000 tr_130400', '19');
INSERT INTO `areas` VALUES ('130430', '邱县', '130400', '邱县', '115.168587', '36.813251', '3', 'tr_0 tr_130000 tr_130400', '14');
INSERT INTO `areas` VALUES ('130431', '鸡泽县', '130400', '鸡泽', '114.878517', '36.914909', '3', 'tr_0 tr_130000 tr_130400', '12');
INSERT INTO `areas` VALUES ('130432', '广平县', '130400', '广平', '114.950859', '36.483604', '3', 'tr_0 tr_130000 tr_130400', '8');
INSERT INTO `areas` VALUES ('130433', '馆陶县', '130400', '馆陶', '115.289055', '36.539459', '3', 'tr_0 tr_130000 tr_130400', '9');
INSERT INTO `areas` VALUES ('130434', '魏县', '130400', '魏县', '114.934113', '36.354248', '3', 'tr_0 tr_130000 tr_130400', '17');
INSERT INTO `areas` VALUES ('130435', '曲周县', '130400', '曲周', '114.957588', '36.773399', '3', 'tr_0 tr_130000 tr_130400', '15');
INSERT INTO `areas` VALUES ('130481', '武安市', '130400', '武安', '114.19458', '36.696114', '3', 'tr_0 tr_130000 tr_130400', '18');
INSERT INTO `areas` VALUES ('130500', '邢台市', '130000', '邢台', '114.50885', '37.068199', '2', 'tr_0 tr_130000', '10');
INSERT INTO `areas` VALUES ('130502', '桥东区', '130500', '桥东', '114.507133', '37.064125', '3', 'tr_0 tr_130000 tr_130500', '12');
INSERT INTO `areas` VALUES ('130503', '桥西区', '130500', '桥西', '114.473686', '37.068008', '3', 'tr_0 tr_130000 tr_130500', '13');
INSERT INTO `areas` VALUES ('130521', '邢台县', '130500', '邢台', '114.561134', '37.050732', '3', 'tr_0 tr_130000 tr_130500', '18');
INSERT INTO `areas` VALUES ('130522', '临城县', '130500', '临城', '114.506874', '37.444008', '3', 'tr_0 tr_130000 tr_130500', '4');
INSERT INTO `areas` VALUES ('130523', '内丘县', '130500', '内丘', '114.51152', '37.287663', '3', 'tr_0 tr_130000 tr_130500', '9');
INSERT INTO `areas` VALUES ('130524', '柏乡县', '130500', '柏乡', '114.693382', '37.483597', '3', 'tr_0 tr_130000 tr_130500', '1');
INSERT INTO `areas` VALUES ('130525', '隆尧县', '130500', '隆尧', '114.776344', '37.350925', '3', 'tr_0 tr_130000 tr_130500', '6');
INSERT INTO `areas` VALUES ('130526', '任县', '130500', '任县', '114.684471', '37.129951', '3', 'tr_0 tr_130000 tr_130500', '15');
INSERT INTO `areas` VALUES ('130527', '南和县', '130500', '南和', '114.691376', '37.003811', '3', 'tr_0 tr_130000 tr_130500', '8');
INSERT INTO `areas` VALUES ('130528', '宁晋县', '130500', '宁晋', '114.921028', '37.618958', '3', 'tr_0 tr_130000 tr_130500', '10');
INSERT INTO `areas` VALUES ('130529', '巨鹿县', '130500', '巨鹿', '115.03878', '37.217682', '3', 'tr_0 tr_130000 tr_130500', '3');
INSERT INTO `areas` VALUES ('130530', '新河县', '130500', '新河', '115.247536', '37.526215', '3', 'tr_0 tr_130000 tr_130500', '19');
INSERT INTO `areas` VALUES ('130531', '广宗县', '130500', '广宗', '115.142799', '37.075546', '3', 'tr_0 tr_130000 tr_130500', '2');
INSERT INTO `areas` VALUES ('130532', '平乡县', '130500', '平乡', '115.029221', '37.069405', '3', 'tr_0 tr_130000 tr_130500', '11');
INSERT INTO `areas` VALUES ('130533', '威县', '130500', '威县', '115.272751', '36.983273', '3', 'tr_0 tr_130000 tr_130500', '17');
INSERT INTO `areas` VALUES ('130534', '清河县', '130500', '清河', '115.668999', '37.05999', '3', 'tr_0 tr_130000 tr_130500', '14');
INSERT INTO `areas` VALUES ('130535', '临西县', '130500', '临西', '115.498688', '36.864201', '3', 'tr_0 tr_130000 tr_130500', '5');
INSERT INTO `areas` VALUES ('130581', '南宫市', '130500', '南宫', '115.398102', '37.359669', '3', 'tr_0 tr_130000 tr_130500', '7');
INSERT INTO `areas` VALUES ('130582', '沙河市', '130500', '沙河', '114.504906', '36.861904', '3', 'tr_0 tr_130000 tr_130500', '16');
INSERT INTO `areas` VALUES ('130600', '保定市', '130000', '保定', '115.48233', '38.867657', '2', 'tr_0 tr_130000', '1');
INSERT INTO `areas` VALUES ('130602', '新市区', '130600', '新市', '115.470657', '38.88662', '3', 'tr_0 tr_130000 tr_130600', '21');
INSERT INTO `areas` VALUES ('130603', '北市区', '130600', '北市', '115.500931', '38.865005', '3', 'tr_0 tr_130000 tr_130600', '3');
INSERT INTO `areas` VALUES ('130604', '南市区', '130600', '南市', '115.498672', '38.856701', '3', 'tr_0 tr_130000 tr_130600', '14');
INSERT INTO `areas` VALUES ('130621', '满城县', '130600', '满城', '115.324417', '38.951382', '3', 'tr_0 tr_130000 tr_130600', '13');
INSERT INTO `areas` VALUES ('130622', '清苑县', '130600', '清苑', '115.492218', '38.771011', '3', 'tr_0 tr_130000 tr_130600', '15');
INSERT INTO `areas` VALUES ('130623', '涞水县', '130600', '涞水', '115.711983', '39.393147', '3', 'tr_0 tr_130000 tr_130600', '10');
INSERT INTO `areas` VALUES ('130624', '阜平县', '130600', '阜平', '114.198799', '38.847275', '3', 'tr_0 tr_130000 tr_130600', '7');
INSERT INTO `areas` VALUES ('130625', '徐水县', '130600', '徐水', '115.649406', '39.020393', '3', 'tr_0 tr_130000 tr_130600', '23');
INSERT INTO `areas` VALUES ('130626', '定兴县', '130600', '定兴', '115.796898', '39.266193', '3', 'tr_0 tr_130000 tr_130600', '5');
INSERT INTO `areas` VALUES ('130627', '唐县', '130600', '唐县', '114.981239', '38.748543', '3', 'tr_0 tr_130000 tr_130600', '19');
INSERT INTO `areas` VALUES ('130628', '高阳县', '130600', '高阳', '115.778877', '38.69009', '3', 'tr_0 tr_130000 tr_130600', '9');
INSERT INTO `areas` VALUES ('130629', '容城县', '130600', '容城', '115.866249', '39.052818', '3', 'tr_0 tr_130000 tr_130600', '17');
INSERT INTO `areas` VALUES ('130630', '涞源县', '130600', '涞源', '114.692566', '39.357552', '3', 'tr_0 tr_130000 tr_130600', '11');
INSERT INTO `areas` VALUES ('130631', '望都县', '130600', '望都', '115.154007', '38.707447', '3', 'tr_0 tr_130000 tr_130600', '20');
INSERT INTO `areas` VALUES ('130632', '安新县', '130600', '安新', '115.931976', '38.929913', '3', 'tr_0 tr_130000 tr_130600', '2');
INSERT INTO `areas` VALUES ('130633', '易县', '130600', '易县', '115.501144', '39.35297', '3', 'tr_0 tr_130000 tr_130600', '24');
INSERT INTO `areas` VALUES ('130634', '曲阳县', '130600', '曲阳', '114.704056', '38.619991', '3', 'tr_0 tr_130000 tr_130600', '16');
INSERT INTO `areas` VALUES ('130635', '蠡县', '130600', '蠡县', '115.583633', '38.496429', '3', 'tr_0 tr_130000 tr_130600', '12');
INSERT INTO `areas` VALUES ('130636', '顺平县', '130600', '顺平', '115.132751', '38.845127', '3', 'tr_0 tr_130000 tr_130600', '18');
INSERT INTO `areas` VALUES ('130637', '博野县', '130600', '博野', '115.4618', '38.458271', '3', 'tr_0 tr_130000 tr_130600', '4');
INSERT INTO `areas` VALUES ('130638', '雄县', '130600', '雄县', '116.107475', '38.990818', '3', 'tr_0 tr_130000 tr_130600', '22');
INSERT INTO `areas` VALUES ('130681', '涿州市', '130600', '涿州', '115.973412', '39.485764', '3', 'tr_0 tr_130000 tr_130600', '25');
INSERT INTO `areas` VALUES ('130682', '定州市', '130600', '定州', '114.991386', '38.517601', '3', 'tr_0 tr_130000 tr_130600', '6');
INSERT INTO `areas` VALUES ('130683', '安国市', '130600', '安国', '115.331413', '38.421368', '3', 'tr_0 tr_130000 tr_130600', '1');
INSERT INTO `areas` VALUES ('130684', '高碑店市', '130600', '高碑店', '115.882706', '39.32769', '3', 'tr_0 tr_130000 tr_130600', '8');
INSERT INTO `areas` VALUES ('130700', '张家口市', '130000', '张家口', '114.884094', '40.811901', '2', 'tr_0 tr_130000', '11');
INSERT INTO `areas` VALUES ('130702', '桥东区', '130700', '桥东', '114.885658', '40.813873', '3', 'tr_0 tr_130000 tr_130700', '7');
INSERT INTO `areas` VALUES ('130703', '桥西区', '130700', '桥西', '114.882126', '40.824387', '3', 'tr_0 tr_130000 tr_130700', '8');
INSERT INTO `areas` VALUES ('130705', '宣化区', '130700', '宣化区', '115.063202', '40.609367', '3', 'tr_0 tr_130000 tr_130700', '12');
INSERT INTO `areas` VALUES ('130706', '下花园区', '130700', '下花园', '115.280998', '40.488644', '3', 'tr_0 tr_130000 tr_130700', '11');
INSERT INTO `areas` VALUES ('130721', '宣化县', '130700', '宣化县', '115.033081', '40.56221', '3', 'tr_0 tr_130000 tr_130700', '13');
INSERT INTO `areas` VALUES ('130722', '张北县', '130700', '张北', '114.71595', '41.151714', '3', 'tr_0 tr_130000 tr_130700', '16');
INSERT INTO `areas` VALUES ('130723', '康保县', '130700', '康保', '114.615807', '41.850044', '3', 'tr_0 tr_130000 tr_130700', '6');
INSERT INTO `areas` VALUES ('130724', '沽源县', '130700', '沽源', '115.684837', '41.667419', '3', 'tr_0 tr_130000 tr_130700', '3');
INSERT INTO `areas` VALUES ('130725', '尚义县', '130700', '尚义', '113.977715', '41.08009', '3', 'tr_0 tr_130000 tr_130700', '9');
INSERT INTO `areas` VALUES ('130726', '蔚县', '130700', '蔚县', '114.582695', '39.837181', '3', 'tr_0 tr_130000 tr_130700', '15');
INSERT INTO `areas` VALUES ('130727', '阳原县', '130700', '阳原', '114.167343', '40.113419', '3', 'tr_0 tr_130000 tr_130700', '14');
INSERT INTO `areas` VALUES ('130728', '怀安县', '130700', '怀安', '114.422363', '40.671272', '3', 'tr_0 tr_130000 tr_130700', '4');
INSERT INTO `areas` VALUES ('130729', '万全县', '130700', '万全', '114.73613', '40.765137', '3', 'tr_0 tr_130000 tr_130700', '10');
INSERT INTO `areas` VALUES ('130730', '怀来县', '130700', '怀来', '115.520844', '40.405403', '3', 'tr_0 tr_130000 tr_130700', '5');
INSERT INTO `areas` VALUES ('130731', '涿鹿县', '130700', '涿鹿', '115.219246', '40.3787', '3', 'tr_0 tr_130000 tr_130700', '17');
INSERT INTO `areas` VALUES ('130732', '赤城县', '130700', '赤城', '115.83271', '40.912083', '3', 'tr_0 tr_130000 tr_130700', '1');
INSERT INTO `areas` VALUES ('130733', '崇礼县', '130700', '崇礼', '115.281654', '40.971302', '3', 'tr_0 tr_130000 tr_130700', '2');
INSERT INTO `areas` VALUES ('130800', '承德市', '130000', '承德', '117.939156', '40.976204', '2', 'tr_0 tr_130000', '3');
INSERT INTO `areas` VALUES ('130802', '双桥区', '130800', '双桥', '117.939156', '40.976204', '3', 'tr_0 tr_130000 tr_130800', '8');
INSERT INTO `areas` VALUES ('130803', '双滦区', '130800', '双滦', '117.797485', '40.959755', '3', 'tr_0 tr_130000 tr_130800', '7');
INSERT INTO `areas` VALUES ('130804', '鹰手营子矿区', '130800', '鹰手营子矿', '117.661156', '40.546955', '3', 'tr_0 tr_130000 tr_130800', '11');
INSERT INTO `areas` VALUES ('130821', '承德县', '130800', '承德', '118.172493', '40.768639', '3', 'tr_0 tr_130000 tr_130800', '1');
INSERT INTO `areas` VALUES ('130822', '兴隆县', '130800', '兴隆', '117.507095', '40.418526', '3', 'tr_0 tr_130000 tr_130800', '10');
INSERT INTO `areas` VALUES ('130823', '平泉县', '130800', '平泉', '118.690239', '41.005611', '3', 'tr_0 tr_130000 tr_130800', '6');
INSERT INTO `areas` VALUES ('130824', '滦平县', '130800', '滦平', '117.337128', '40.936646', '3', 'tr_0 tr_130000 tr_130800', '5');
INSERT INTO `areas` VALUES ('130825', '隆化县', '130800', '隆化', '117.736343', '41.316666', '3', 'tr_0 tr_130000 tr_130800', '4');
INSERT INTO `areas` VALUES ('130826', '丰宁满族自治县', '130800', '丰宁', '116.651207', '41.209904', '3', 'tr_0 tr_130000 tr_130800', '2');
INSERT INTO `areas` VALUES ('130827', '宽城满族自治县', '130800', '宽城', '118.48864', '40.607983', '3', 'tr_0 tr_130000 tr_130800', '3');
INSERT INTO `areas` VALUES ('130828', '围场满族蒙古族自治县', '130800', '围场', '117.764084', '41.949406', '3', 'tr_0 tr_130000 tr_130800', '9');
INSERT INTO `areas` VALUES ('130900', '沧州市', '130000', '沧州', '116.85746', '38.310581', '2', 'tr_0 tr_130000', '2');
INSERT INTO `areas` VALUES ('130902', '新华区', '130900', '新华', '116.873047', '38.308273', '3', 'tr_0 tr_130000 tr_130900', '14');
INSERT INTO `areas` VALUES ('130903', '运河区', '130900', '运河', '116.840065', '38.307404', '3', 'tr_0 tr_130000 tr_130900', '16');
INSERT INTO `areas` VALUES ('130921', '沧县', '130900', '沧县', '117.007477', '38.219856', '3', 'tr_0 tr_130000 tr_130900', '2');
INSERT INTO `areas` VALUES ('130922', '青县', '130900', '青县', '116.838387', '38.569645', '3', 'tr_0 tr_130000 tr_130900', '9');
INSERT INTO `areas` VALUES ('130923', '东光县', '130900', '东光', '116.542061', '37.886551', '3', 'tr_0 tr_130000 tr_130900', '3');
INSERT INTO `areas` VALUES ('130924', '海兴县', '130900', '海兴', '117.496605', '38.141582', '3', 'tr_0 tr_130000 tr_130900', '4');
INSERT INTO `areas` VALUES ('130925', '盐山县', '130900', '盐山', '117.229813', '38.056141', '3', 'tr_0 tr_130000 tr_130900', '15');
INSERT INTO `areas` VALUES ('130926', '肃宁县', '130900', '肃宁', '115.835854', '38.427101', '3', 'tr_0 tr_130000 tr_130900', '11');
INSERT INTO `areas` VALUES ('130927', '南皮县', '130900', '南皮', '116.709167', '38.042439', '3', 'tr_0 tr_130000 tr_130900', '8');
INSERT INTO `areas` VALUES ('130928', '吴桥县', '130900', '吴桥', '116.39151', '37.628181', '3', 'tr_0 tr_130000 tr_130900', '12');
INSERT INTO `areas` VALUES ('130929', '献县', '130900', '献县', '116.12384', '38.189659', '3', 'tr_0 tr_130000 tr_130900', '13');
INSERT INTO `areas` VALUES ('130930', '孟村回族自治县', '130900', '孟村', '117.105103', '38.057953', '3', 'tr_0 tr_130000 tr_130900', '7');
INSERT INTO `areas` VALUES ('130981', '泊头市', '130900', '泊头', '116.57016', '38.073479', '3', 'tr_0 tr_130000 tr_130900', '1');
INSERT INTO `areas` VALUES ('130982', '任丘市', '130900', '任丘', '116.106766', '38.706512', '3', 'tr_0 tr_130000 tr_130900', '10');
INSERT INTO `areas` VALUES ('130983', '黄骅市', '130900', '黄骅', '117.343803', '38.36924', '3', 'tr_0 tr_130000 tr_130900', '6');
INSERT INTO `areas` VALUES ('130984', '河间市', '130900', '河间', '116.089455', '38.44149', '3', 'tr_0 tr_130000 tr_130900', '5');
INSERT INTO `areas` VALUES ('131000', '廊坊市', '130000', '廊坊', '116.704437', '39.523926', '2', 'tr_0 tr_130000', '6');
INSERT INTO `areas` VALUES ('131002', '安次区', '131000', '安次', '116.694542', '39.502567', '3', 'tr_0 tr_130000 tr_131000', '1');
INSERT INTO `areas` VALUES ('131003', '广阳区', '131000', '广阳', '116.713707', '39.521931', '3', 'tr_0 tr_130000 tr_131000', '5');
INSERT INTO `areas` VALUES ('131022', '固安县', '131000', '固安', '116.299896', '39.436466', '3', 'tr_0 tr_130000 tr_131000', '6');
INSERT INTO `areas` VALUES ('131023', '永清县', '131000', '永清', '116.498093', '39.319717', '3', 'tr_0 tr_130000 tr_131000', '10');
INSERT INTO `areas` VALUES ('131024', '香河县', '131000', '香河', '117.007164', '39.757214', '3', 'tr_0 tr_130000 tr_131000', '9');
INSERT INTO `areas` VALUES ('131025', '大城县', '131000', '大城', '116.640732', '38.699215', '3', 'tr_0 tr_130000 tr_131000', '4');
INSERT INTO `areas` VALUES ('131026', '文安县', '131000', '文安', '116.460106', '38.866802', '3', 'tr_0 tr_130000 tr_131000', '8');
INSERT INTO `areas` VALUES ('131028', '大厂回族自治县', '131000', '大厂', '116.986504', '39.889267', '3', 'tr_0 tr_130000 tr_131000', '3');
INSERT INTO `areas` VALUES ('131081', '霸州市', '131000', '霸州', '116.392021', '39.117332', '3', 'tr_0 tr_130000 tr_131000', '2');
INSERT INTO `areas` VALUES ('131082', '三河市', '131000', '三河', '117.077019', '39.982777', '3', 'tr_0 tr_130000 tr_131000', '7');
INSERT INTO `areas` VALUES ('131100', '衡水市', '130000', '衡水', '115.665993', '37.735096', '2', 'tr_0 tr_130000', '5');
INSERT INTO `areas` VALUES ('131102', '桃城区', '131100', '桃城', '115.694946', '37.732239', '3', 'tr_0 tr_130000 tr_131100', '8');
INSERT INTO `areas` VALUES ('131121', '枣强县', '131100', '枣强', '115.726501', '37.511513', '3', 'tr_0 tr_130000 tr_131100', '11');
INSERT INTO `areas` VALUES ('131122', '武邑县', '131100', '武邑', '115.892418', '37.803776', '3', 'tr_0 tr_130000 tr_131100', '10');
INSERT INTO `areas` VALUES ('131123', '武强县', '131100', '武强', '115.970238', '38.03698', '3', 'tr_0 tr_130000 tr_131100', '9');
INSERT INTO `areas` VALUES ('131124', '饶阳县', '131100', '饶阳', '115.726578', '38.23267', '3', 'tr_0 tr_130000 tr_131100', '6');
INSERT INTO `areas` VALUES ('131125', '安平县', '131100', '安平', '115.51963', '38.233513', '3', 'tr_0 tr_130000 tr_131100', '1');
INSERT INTO `areas` VALUES ('131126', '故城县', '131100', '故城', '115.966743', '37.350983', '3', 'tr_0 tr_130000 tr_131100', '3');
INSERT INTO `areas` VALUES ('131127', '景县', '131100', '景县', '116.258446', '37.686623', '3', 'tr_0 tr_130000 tr_131100', '4');
INSERT INTO `areas` VALUES ('131128', '阜城县', '131100', '阜城', '116.164726', '37.869946', '3', 'tr_0 tr_130000 tr_131100', '2');
INSERT INTO `areas` VALUES ('131181', '冀州市', '131100', '冀州', '115.57917', '37.542789', '3', 'tr_0 tr_130000 tr_131100', '5');
INSERT INTO `areas` VALUES ('131182', '深州市', '131100', '深州', '115.554596', '38.003471', '3', 'tr_0 tr_130000 tr_131100', '7');
INSERT INTO `areas` VALUES ('140000', '山西省', '1', '山西', '112.549248', '37.857014', '1', 'tr_0', '4');
INSERT INTO `areas` VALUES ('140100', '太原市', '140000', '太原', '112.549248', '37.857014', '2', 'tr_0 tr_140000', '8');
INSERT INTO `areas` VALUES ('140105', '小店区', '140100', '小店', '112.56427', '37.817974', '3', 'tr_0 tr_140000 tr_140100', '7');
INSERT INTO `areas` VALUES ('140106', '迎泽区', '140100', '迎泽', '112.558853', '37.855804', '3', 'tr_0 tr_140000 tr_140100', '10');
INSERT INTO `areas` VALUES ('140107', '杏花岭区', '140100', '杏花岭', '112.560745', '37.879292', '3', 'tr_0 tr_140000 tr_140100', '8');
INSERT INTO `areas` VALUES ('140108', '尖草坪区', '140100', '尖草坪', '112.487122', '37.939892', '3', 'tr_0 tr_140000 tr_140100', '2');
INSERT INTO `areas` VALUES ('140109', '万柏林区', '140100', '万柏林', '112.522255', '37.862652', '3', 'tr_0 tr_140000 tr_140100', '6');
INSERT INTO `areas` VALUES ('140110', '晋源区', '140100', '晋源', '112.477852', '37.715618', '3', 'tr_0 tr_140000 tr_140100', '3');
INSERT INTO `areas` VALUES ('140121', '清徐县', '140100', '清徐', '112.357964', '37.607288', '3', 'tr_0 tr_140000 tr_140100', '5');
INSERT INTO `areas` VALUES ('140122', '阳曲县', '140100', '阳曲', '112.67382', '38.058796', '3', 'tr_0 tr_140000 tr_140100', '9');
INSERT INTO `areas` VALUES ('140123', '娄烦县', '140100', '娄烦', '111.7938', '38.066036', '3', 'tr_0 tr_140000 tr_140100', '4');
INSERT INTO `areas` VALUES ('140181', '古交市', '140100', '古交', '112.174355', '37.908535', '3', 'tr_0 tr_140000 tr_140100', '1');
INSERT INTO `areas` VALUES ('140200', '大同市', '140000', '大同', '113.295258', '40.090309', '2', 'tr_0 tr_140000', '2');
INSERT INTO `areas` VALUES ('140202', '城区', '140200', '城区', '113.301437', '40.090511', '3', 'tr_0 tr_140000 tr_140200', '1');
INSERT INTO `areas` VALUES ('140203', '矿区', '140200', '矿区', '113.168655', '40.036259', '3', 'tr_0 tr_140000 tr_140200', '5');
INSERT INTO `areas` VALUES ('140211', '南郊区', '140200', '南郊', '113.168922', '40.018021', '3', 'tr_0 tr_140000 tr_140200', '7');
INSERT INTO `areas` VALUES ('140212', '新荣区', '140200', '新荣', '113.141045', '40.25827', '3', 'tr_0 tr_140000 tr_140200', '9');
INSERT INTO `areas` VALUES ('140221', '阳高县', '140200', '阳高', '113.74987', '40.364925', '3', 'tr_0 tr_140000 tr_140200', '10');
INSERT INTO `areas` VALUES ('140222', '天镇县', '140200', '天镇', '114.091118', '40.421337', '3', 'tr_0 tr_140000 tr_140200', '8');
INSERT INTO `areas` VALUES ('140223', '广灵县', '140200', '广灵', '114.279251', '39.76305', '3', 'tr_0 tr_140000 tr_140200', '3');
INSERT INTO `areas` VALUES ('140224', '灵丘县', '140200', '灵丘', '114.235764', '39.438866', '3', 'tr_0 tr_140000 tr_140200', '6');
INSERT INTO `areas` VALUES ('140225', '浑源县', '140200', '浑源', '113.69809', '39.6991', '3', 'tr_0 tr_140000 tr_140200', '4');
INSERT INTO `areas` VALUES ('140226', '左云县', '140200', '左云', '112.706413', '40.012875', '3', 'tr_0 tr_140000 tr_140200', '11');
INSERT INTO `areas` VALUES ('140227', '大同县', '140200', '大同', '113.611305', '40.039345', '3', 'tr_0 tr_140000 tr_140200', '2');
INSERT INTO `areas` VALUES ('140300', '阳泉市', '140000', '阳泉', '113.583282', '37.861187', '2', 'tr_0 tr_140000', '10');
INSERT INTO `areas` VALUES ('140302', '城区', '140300', '城区', '113.58651', '37.860939', '3', 'tr_0 tr_140000 tr_140300', '1');
INSERT INTO `areas` VALUES ('140303', '矿区', '140300', '矿区', '113.559067', '37.870087', '3', 'tr_0 tr_140000 tr_140300', '3');
INSERT INTO `areas` VALUES ('140311', '郊区', '140300', '郊区', '113.583282', '37.861187', '3', 'tr_0 tr_140000 tr_140300', '2');
INSERT INTO `areas` VALUES ('140321', '平定县', '140300', '平定', '113.63105', '37.800289', '3', 'tr_0 tr_140000 tr_140300', '4');
INSERT INTO `areas` VALUES ('140322', '盂县', '140300', '盂县', '113.412231', '38.086132', '3', 'tr_0 tr_140000 tr_140300', '5');
INSERT INTO `areas` VALUES ('140400', '长治市', '140000', '长治', '113.113556', '36.191113', '2', 'tr_0 tr_140000', '1');
INSERT INTO `areas` VALUES ('140421', '长治县', '140400', '长治', '113.056679', '36.052437', '3', 'tr_0 tr_140000 tr_140400', '1');
INSERT INTO `areas` VALUES ('140423', '襄垣县', '140400', '襄垣', '113.050095', '36.532852', '3', 'tr_0 tr_140000 tr_140400', '12');
INSERT INTO `areas` VALUES ('140424', '屯留县', '140400', '屯留', '112.892738', '36.314072', '3', 'tr_0 tr_140000 tr_140400', '10');
INSERT INTO `areas` VALUES ('140425', '平顺县', '140400', '平顺', '113.438789', '36.200203', '3', 'tr_0 tr_140000 tr_140400', '7');
INSERT INTO `areas` VALUES ('140426', '黎城县', '140400', '黎城', '113.387367', '36.502972', '3', 'tr_0 tr_140000 tr_140400', '5');
INSERT INTO `areas` VALUES ('140427', '壶关县', '140400', '壶关', '113.206139', '36.110939', '3', 'tr_0 tr_140000 tr_140400', '3');
INSERT INTO `areas` VALUES ('140428', '长子县', '140400', '长子', '112.884659', '36.119484', '3', 'tr_0 tr_140000 tr_140400', '13');
INSERT INTO `areas` VALUES ('140429', '武乡县', '140400', '武乡', '112.865303', '36.834316', '3', 'tr_0 tr_140000 tr_140400', '11');
INSERT INTO `areas` VALUES ('140430', '沁县', '140400', '沁县', '112.701378', '36.757122', '3', 'tr_0 tr_140000 tr_140400', '8');
INSERT INTO `areas` VALUES ('140431', '沁源县', '140400', '沁源', '112.340881', '36.500778', '3', 'tr_0 tr_140000 tr_140400', '9');
INSERT INTO `areas` VALUES ('140481', '潞城市', '140400', '潞城', '113.223244', '36.332233', '3', 'tr_0 tr_140000 tr_140400', '6');
INSERT INTO `areas` VALUES ('140482', '城区', '140400', '城区', '113.114105', '36.187897', '3', 'tr_0 tr_140000 tr_140400', '2');
INSERT INTO `areas` VALUES ('140483', '郊区', '140400', '郊区', '113.101212', '36.218388', '3', 'tr_0 tr_140000 tr_140400', '4');
INSERT INTO `areas` VALUES ('140500', '晋城市', '140000', '晋城', '112.851273', '35.497555', '2', 'tr_0 tr_140000', '3');
INSERT INTO `areas` VALUES ('140502', '城区', '140500', '城区', '112.853104', '35.496639', '3', 'tr_0 tr_140000 tr_140500', '1');
INSERT INTO `areas` VALUES ('140521', '沁水县', '140500', '沁水', '112.18721', '35.689472', '3', 'tr_0 tr_140000 tr_140500', '4');
INSERT INTO `areas` VALUES ('140522', '阳城县', '140500', '阳城', '112.422012', '35.482178', '3', 'tr_0 tr_140000 tr_140500', '5');
INSERT INTO `areas` VALUES ('140524', '陵川县', '140500', '陵川', '113.278877', '35.775616', '3', 'tr_0 tr_140000 tr_140500', '3');
INSERT INTO `areas` VALUES ('140525', '泽州县', '140500', '泽州', '112.899139', '35.617222', '3', 'tr_0 tr_140000 tr_140500', '6');
INSERT INTO `areas` VALUES ('140581', '高平市', '140500', '高平', '112.930695', '35.791355', '3', 'tr_0 tr_140000 tr_140500', '2');
INSERT INTO `areas` VALUES ('140600', '朔州市', '140000', '朔州', '112.433388', '39.331261', '2', 'tr_0 tr_140000', '7');
INSERT INTO `areas` VALUES ('140602', '朔城区', '140600', '朔城', '112.428673', '39.324524', '3', 'tr_0 tr_140000 tr_140600', '4');
INSERT INTO `areas` VALUES ('140603', '平鲁区', '140600', '平鲁', '112.295227', '39.515602', '3', 'tr_0 tr_140000 tr_140600', '2');
INSERT INTO `areas` VALUES ('140621', '山阴县', '140600', '山阴', '112.816399', '39.526772', '3', 'tr_0 tr_140000 tr_140600', '3');
INSERT INTO `areas` VALUES ('140622', '应县', '140600', '应县', '113.187508', '39.559189', '3', 'tr_0 tr_140000 tr_140600', '5');
INSERT INTO `areas` VALUES ('140623', '右玉县', '140600', '右玉', '112.465591', '39.988811', '3', 'tr_0 tr_140000 tr_140600', '6');
INSERT INTO `areas` VALUES ('140624', '怀仁县', '140600', '怀仁', '113.10051', '39.820789', '3', 'tr_0 tr_140000 tr_140600', '1');
INSERT INTO `areas` VALUES ('140700', '晋中市', '140000', '晋中', '112.736465', '37.696495', '2', 'tr_0 tr_140000', '4');
INSERT INTO `areas` VALUES ('140702', '榆次区', '140700', '榆次', '112.740059', '37.697601', '3', 'tr_0 tr_140000 tr_140700', '9');
INSERT INTO `areas` VALUES ('140721', '榆社县', '140700', '榆社', '112.973518', '37.069019', '3', 'tr_0 tr_140000 tr_140700', '10');
INSERT INTO `areas` VALUES ('140722', '左权县', '140700', '左权', '113.377831', '37.079674', '3', 'tr_0 tr_140000 tr_140700', '11');
INSERT INTO `areas` VALUES ('140723', '和顺县', '140700', '和顺', '113.572922', '37.327026', '3', 'tr_0 tr_140000 tr_140700', '1');
INSERT INTO `areas` VALUES ('140724', '昔阳县', '140700', '昔阳', '113.706169', '37.60437', '3', 'tr_0 tr_140000 tr_140700', '8');
INSERT INTO `areas` VALUES ('140725', '寿阳县', '140700', '寿阳', '113.177711', '37.891136', '3', 'tr_0 tr_140000 tr_140700', '6');
INSERT INTO `areas` VALUES ('140726', '太谷县', '140700', '太谷', '112.5541', '37.424595', '3', 'tr_0 tr_140000 tr_140700', '7');
INSERT INTO `areas` VALUES ('140727', '祁县', '140700', '祁县', '112.330528', '37.358738', '3', 'tr_0 tr_140000 tr_140700', '5');
INSERT INTO `areas` VALUES ('140728', '平遥县', '140700', '平遥', '112.174057', '37.195473', '3', 'tr_0 tr_140000 tr_140700', '4');
INSERT INTO `areas` VALUES ('140729', '灵石县', '140700', '灵石', '111.772758', '36.847469', '3', 'tr_0 tr_140000 tr_140700', '3');
INSERT INTO `areas` VALUES ('140781', '介休市', '140700', '介休', '111.913857', '37.027615', '3', 'tr_0 tr_140000 tr_140700', '2');
INSERT INTO `areas` VALUES ('140800', '运城市', '140000', '运城', '111.00396', '35.022778', '2', 'tr_0 tr_140000', '11');
INSERT INTO `areas` VALUES ('140802', '盐湖区', '140800', '盐湖', '111.000626', '35.025642', '3', 'tr_0 tr_140000 tr_140800', '11');
INSERT INTO `areas` VALUES ('140821', '临猗县', '140800', '临猗', '110.774933', '35.141884', '3', 'tr_0 tr_140000 tr_140800', '4');
INSERT INTO `areas` VALUES ('140822', '万荣县', '140800', '万荣', '110.843559', '35.417042', '3', 'tr_0 tr_140000 tr_140800', '7');
INSERT INTO `areas` VALUES ('140823', '闻喜县', '140800', '闻喜', '111.220306', '35.35384', '3', 'tr_0 tr_140000 tr_140800', '8');
INSERT INTO `areas` VALUES ('140824', '稷山县', '140800', '稷山', '110.978996', '35.60041', '3', 'tr_0 tr_140000 tr_140800', '3');
INSERT INTO `areas` VALUES ('140825', '新绛县', '140800', '新绛', '111.225204', '35.613697', '3', 'tr_0 tr_140000 tr_140800', '10');
INSERT INTO `areas` VALUES ('140826', '绛县', '140800', '绛县', '111.57618', '35.490452', '3', 'tr_0 tr_140000 tr_140800', '2');
INSERT INTO `areas` VALUES ('140827', '垣曲县', '140800', '垣曲', '111.67099', '35.298294', '3', 'tr_0 tr_140000 tr_140800', '13');
INSERT INTO `areas` VALUES ('140828', '夏县', '140800', '夏县', '111.223175', '35.140442', '3', 'tr_0 tr_140000 tr_140800', '9');
INSERT INTO `areas` VALUES ('140829', '平陆县', '140800', '平陆', '111.212379', '34.837257', '3', 'tr_0 tr_140000 tr_140800', '5');
INSERT INTO `areas` VALUES ('140830', '芮城县', '140800', '芮城', '110.691139', '34.694771', '3', 'tr_0 tr_140000 tr_140800', '6');
INSERT INTO `areas` VALUES ('140881', '永济市', '140800', '永济', '110.447983', '34.865124', '3', 'tr_0 tr_140000 tr_140800', '12');
INSERT INTO `areas` VALUES ('140882', '河津市', '140800', '河津', '110.710266', '35.597149', '3', 'tr_0 tr_140000 tr_140800', '1');
INSERT INTO `areas` VALUES ('140900', '忻州市', '140000', '忻州', '112.733536', '38.41769', '2', 'tr_0 tr_140000', '9');
INSERT INTO `areas` VALUES ('140902', '忻府区', '140900', '忻府', '112.734116', '38.417744', '3', 'tr_0 tr_140000 tr_140900', '13');
INSERT INTO `areas` VALUES ('140921', '定襄县', '140900', '定襄', '112.963234', '38.484947', '3', 'tr_0 tr_140000 tr_140900', '3');
INSERT INTO `areas` VALUES ('140922', '五台县', '140900', '五台', '113.25901', '38.725712', '3', 'tr_0 tr_140000 tr_140900', '11');
INSERT INTO `areas` VALUES ('140923', '代县', '140900', '代县', '112.962517', '39.06514', '3', 'tr_0 tr_140000 tr_140900', '2');
INSERT INTO `areas` VALUES ('140924', '繁峙县', '140900', '繁峙', '113.267708', '39.188103', '3', 'tr_0 tr_140000 tr_140900', '4');
INSERT INTO `areas` VALUES ('140925', '宁武县', '140900', '宁武', '112.307938', '39.001717', '3', 'tr_0 tr_140000 tr_140900', '8');
INSERT INTO `areas` VALUES ('140926', '静乐县', '140900', '静乐', '111.940231', '38.355946', '3', 'tr_0 tr_140000 tr_140900', '6');
INSERT INTO `areas` VALUES ('140927', '神池县', '140900', '神池', '112.200439', '39.088467', '3', 'tr_0 tr_140000 tr_140900', '10');
INSERT INTO `areas` VALUES ('140928', '五寨县', '140900', '五寨', '111.841019', '38.912762', '3', 'tr_0 tr_140000 tr_140900', '12');
INSERT INTO `areas` VALUES ('140929', '岢岚县', '140900', '岢岚', '111.569809', '38.705624', '3', 'tr_0 tr_140000 tr_140900', '7');
INSERT INTO `areas` VALUES ('140930', '河曲县', '140900', '河曲', '111.146606', '39.381893', '3', 'tr_0 tr_140000 tr_140900', '5');
INSERT INTO `areas` VALUES ('140931', '保德县', '140900', '保德', '111.085686', '39.022575', '3', 'tr_0 tr_140000 tr_140900', '1');
INSERT INTO `areas` VALUES ('140932', '偏关县', '140900', '偏关', '111.500481', '39.442154', '3', 'tr_0 tr_140000 tr_140900', '9');
INSERT INTO `areas` VALUES ('140981', '原平市', '140900', '原平', '112.713135', '38.729187', '3', 'tr_0 tr_140000 tr_140900', '14');
INSERT INTO `areas` VALUES ('141000', '临汾市', '140000', '临汾', '111.517975', '36.084148', '2', 'tr_0 tr_140000', '5');
INSERT INTO `areas` VALUES ('141002', '尧都区', '141000', '尧都', '111.522942', '36.080364', '3', 'tr_0 tr_140000 tr_141000', '15');
INSERT INTO `areas` VALUES ('141021', '曲沃县', '141000', '曲沃', '111.475533', '35.641388', '3', 'tr_0 tr_140000 tr_141000', '11');
INSERT INTO `areas` VALUES ('141022', '翼城县', '141000', '翼城', '111.713509', '35.738621', '3', 'tr_0 tr_140000 tr_141000', '16');
INSERT INTO `areas` VALUES ('141023', '襄汾县', '141000', '襄汾', '111.442932', '35.876141', '3', 'tr_0 tr_140000 tr_141000', '12');
INSERT INTO `areas` VALUES ('141024', '洪洞县', '141000', '洪洞', '111.673691', '36.255741', '3', 'tr_0 tr_140000 tr_141000', '6');
INSERT INTO `areas` VALUES ('141025', '古县', '141000', '古县', '111.920204', '36.268551', '3', 'tr_0 tr_140000 tr_141000', '5');
INSERT INTO `areas` VALUES ('141026', '安泽县', '141000', '安泽', '112.251373', '36.14603', '3', 'tr_0 tr_140000 tr_141000', '1');
INSERT INTO `areas` VALUES ('141027', '浮山县', '141000', '浮山', '111.850037', '35.971359', '3', 'tr_0 tr_140000 tr_141000', '4');
INSERT INTO `areas` VALUES ('141028', '吉县', '141000', '吉县', '110.682854', '36.099354', '3', 'tr_0 tr_140000 tr_141000', '9');
INSERT INTO `areas` VALUES ('141029', '乡宁县', '141000', '乡宁', '110.857368', '35.975403', '3', 'tr_0 tr_140000 tr_141000', '13');
INSERT INTO `areas` VALUES ('141030', '大宁县', '141000', '大宁', '110.751282', '36.463829', '3', 'tr_0 tr_140000 tr_141000', '2');
INSERT INTO `areas` VALUES ('141031', '隰县', '141000', '隰县', '110.935806', '36.692677', '3', 'tr_0 tr_140000 tr_141000', '14');
INSERT INTO `areas` VALUES ('141032', '永和县', '141000', '永和', '110.631279', '36.760612', '3', 'tr_0 tr_140000 tr_141000', '17');
INSERT INTO `areas` VALUES ('141033', '蒲县', '141000', '蒲县', '111.097328', '36.411682', '3', 'tr_0 tr_140000 tr_141000', '10');
INSERT INTO `areas` VALUES ('141034', '汾西县', '141000', '汾西', '111.563019', '36.65337', '3', 'tr_0 tr_140000 tr_141000', '3');
INSERT INTO `areas` VALUES ('141081', '侯马市', '141000', '侯马', '111.371269', '35.6203', '3', 'tr_0 tr_140000 tr_141000', '7');
INSERT INTO `areas` VALUES ('141082', '霍州市', '141000', '霍州', '111.723106', '36.572021', '3', 'tr_0 tr_140000 tr_141000', '8');
INSERT INTO `areas` VALUES ('141100', '吕梁市', '140000', '吕梁', '111.134338', '37.524364', '2', 'tr_0 tr_140000', '6');
INSERT INTO `areas` VALUES ('141102', '离石区', '141100', '离石', '111.13446', '37.524036', '3', 'tr_0 tr_140000 tr_141100', '7');
INSERT INTO `areas` VALUES ('141121', '文水县', '141100', '文水', '112.032593', '37.436314', '3', 'tr_0 tr_140000 tr_141100', '10');
INSERT INTO `areas` VALUES ('141122', '交城县', '141100', '交城', '112.159157', '37.555157', '3', 'tr_0 tr_140000 tr_141100', '3');
INSERT INTO `areas` VALUES ('141123', '兴县', '141100', '兴县', '111.124817', '38.464134', '3', 'tr_0 tr_140000 tr_141100', '12');
INSERT INTO `areas` VALUES ('141124', '临县', '141100', '临县', '110.995964', '37.960808', '3', 'tr_0 tr_140000 tr_141100', '6');
INSERT INTO `areas` VALUES ('141125', '柳林县', '141100', '柳林', '110.896133', '37.431664', '3', 'tr_0 tr_140000 tr_141100', '8');
INSERT INTO `areas` VALUES ('141126', '石楼县', '141100', '石楼', '110.83712', '36.999428', '3', 'tr_0 tr_140000 tr_141100', '9');
INSERT INTO `areas` VALUES ('141127', '岚县', '141100', '岚县', '111.671555', '38.278652', '3', 'tr_0 tr_140000 tr_141100', '5');
INSERT INTO `areas` VALUES ('141128', '方山县', '141100', '方山', '111.238884', '37.892632', '3', 'tr_0 tr_140000 tr_141100', '1');
INSERT INTO `areas` VALUES ('141129', '中阳县', '141100', '中阳', '111.193321', '37.342052', '3', 'tr_0 tr_140000 tr_141100', '13');
INSERT INTO `areas` VALUES ('141130', '交口县', '141100', '交口', '111.183189', '36.983067', '3', 'tr_0 tr_140000 tr_141100', '4');
INSERT INTO `areas` VALUES ('141181', '孝义市', '141100', '孝义', '111.78157', '37.144474', '3', 'tr_0 tr_140000 tr_141100', '11');
INSERT INTO `areas` VALUES ('141182', '汾阳市', '141100', '汾阳', '111.785271', '37.267742', '3', 'tr_0 tr_140000 tr_141100', '2');
INSERT INTO `areas` VALUES ('150000', '内蒙古自治区', '1', '内蒙古', '111.670799', '40.81831', '1', 'tr_0', '5');
INSERT INTO `areas` VALUES ('150100', '呼和浩特市', '150000', '呼和浩特', '111.670799', '40.81831', '2', 'tr_0 tr_150000', '6');
INSERT INTO `areas` VALUES ('150102', '新城区', '150100', '新城', '111.685966', '40.826225', '3', 'tr_0 tr_150000 tr_150100', '8');
INSERT INTO `areas` VALUES ('150103', '回民区', '150100', '回民', '111.662163', '40.815147', '3', 'tr_0 tr_150000 tr_150100', '2');
INSERT INTO `areas` VALUES ('150104', '玉泉区', '150100', '玉泉', '111.665428', '40.799419', '3', 'tr_0 tr_150000 tr_150100', '9');
INSERT INTO `areas` VALUES ('150105', '赛罕区', '150100', '赛罕', '111.698463', '40.807835', '3', 'tr_0 tr_150000 tr_150100', '4');
INSERT INTO `areas` VALUES ('150121', '土默特左旗', '150100', '土默特左', '111.133614', '40.720417', '3', 'tr_0 tr_150000 tr_150100', '5');
INSERT INTO `areas` VALUES ('150122', '托克托县', '150100', '托克托', '111.197319', '40.27673', '3', 'tr_0 tr_150000 tr_150100', '6');
INSERT INTO `areas` VALUES ('150123', '和林格尔县', '150100', '和林格尔', '111.824142', '40.380287', '3', 'tr_0 tr_150000 tr_150100', '1');
INSERT INTO `areas` VALUES ('150124', '清水河县', '150100', '清水河', '111.672218', '39.912479', '3', 'tr_0 tr_150000 tr_150100', '3');
INSERT INTO `areas` VALUES ('150125', '武川县', '150100', '武川', '111.456566', '41.094482', '3', 'tr_0 tr_150000 tr_150100', '7');
INSERT INTO `areas` VALUES ('150200', '包头市', '150000', '包头', '109.840408', '40.658169', '2', 'tr_0 tr_150000', '2');
INSERT INTO `areas` VALUES ('150202', '东河区', '150200', '东河', '110.026894', '40.587055', '3', 'tr_0 tr_150000 tr_150200', '3');
INSERT INTO `areas` VALUES ('150203', '昆都仑区', '150200', '昆都仑', '109.822929', '40.661346', '3', 'tr_0 tr_150000 tr_150200', '6');
INSERT INTO `areas` VALUES ('150204', '青山区', '150200', '青山', '109.880051', '40.668556', '3', 'tr_0 tr_150000 tr_150200', '7');
INSERT INTO `areas` VALUES ('150205', '石拐区', '150200', '石拐', '110.272568', '40.672092', '3', 'tr_0 tr_150000 tr_150200', '8');
INSERT INTO `areas` VALUES ('150206', '白云鄂博矿区', '150200', '白云矿区', '109.970161', '41.769245', '3', 'tr_0 tr_150000 tr_150200', '1');
INSERT INTO `areas` VALUES ('150207', '九原区', '150200', '九原', '109.968124', '40.600582', '3', 'tr_0 tr_150000 tr_150200', '5');
INSERT INTO `areas` VALUES ('150221', '土默特右旗', '150200', '土默特右', '110.526764', '40.566433', '3', 'tr_0 tr_150000 tr_150200', '9');
INSERT INTO `areas` VALUES ('150222', '固阳县', '150200', '固阳', '110.063423', '41.030003', '3', 'tr_0 tr_150000 tr_150200', '4');
INSERT INTO `areas` VALUES ('150223', '达尔罕茂明安联合旗', '150200', '达尔罕茂明安联合', '109.840408', '40.658169', '3', 'tr_0 tr_150000 tr_150200', '2');
INSERT INTO `areas` VALUES ('150300', '乌海市', '150000', '乌海', '106.825562', '39.673733', '2', 'tr_0 tr_150000', '9');
INSERT INTO `areas` VALUES ('150302', '海勃湾区', '150300', '海勃湾', '106.817764', '39.673527', '3', 'tr_0 tr_150000 tr_150300', '1');
INSERT INTO `areas` VALUES ('150303', '海南区', '150300', '海南', '106.884789', '39.441528', '3', 'tr_0 tr_150000 tr_150300', '2');
INSERT INTO `areas` VALUES ('150304', '乌达区', '150300', '乌达', '106.72271', '39.502289', '3', 'tr_0 tr_150000 tr_150300', '3');
INSERT INTO `areas` VALUES ('150400', '赤峰市', '150000', '赤峰', '118.956802', '42.275318', '2', 'tr_0 tr_150000', '4');
INSERT INTO `areas` VALUES ('150402', '红山区', '150400', '红山', '118.96109', '42.269733', '3', 'tr_0 tr_150000 tr_150400', '5');
INSERT INTO `areas` VALUES ('150403', '元宝山区', '150400', '元宝山', '119.289879', '42.041168', '3', 'tr_0 tr_150000 tr_150400', '12');
INSERT INTO `areas` VALUES ('150404', '松山区', '150400', '松山', '118.938957', '42.281048', '3', 'tr_0 tr_150000 tr_150400', '10');
INSERT INTO `areas` VALUES ('150421', '阿鲁科尔沁旗', '150400', '阿鲁科尔沁', '120.094971', '43.878769', '3', 'tr_0 tr_150000 tr_150400', '1');
INSERT INTO `areas` VALUES ('150422', '巴林左旗', '150400', '巴林左', '119.391739', '43.980717', '3', 'tr_0 tr_150000 tr_150400', '4');
INSERT INTO `areas` VALUES ('150423', '巴林右旗', '150400', '巴林右', '118.678345', '43.528961', '3', 'tr_0 tr_150000 tr_150400', '3');
INSERT INTO `areas` VALUES ('150424', '林西县', '150400', '林西', '118.057747', '43.605328', '3', 'tr_0 tr_150000 tr_150400', '8');
INSERT INTO `areas` VALUES ('150425', '克什克腾旗', '150400', '克什克腾', '117.542465', '43.256233', '3', 'tr_0 tr_150000 tr_150400', '7');
INSERT INTO `areas` VALUES ('150426', '翁牛特旗', '150400', '翁牛特', '119.022621', '42.937126', '3', 'tr_0 tr_150000 tr_150400', '11');
INSERT INTO `areas` VALUES ('150428', '喀喇沁旗', '150400', '喀喇沁', '118.708572', '41.92778', '3', 'tr_0 tr_150000 tr_150400', '6');
INSERT INTO `areas` VALUES ('150429', '宁城县', '150400', '宁城', '119.339241', '41.598694', '3', 'tr_0 tr_150000 tr_150400', '9');
INSERT INTO `areas` VALUES ('150430', '敖汉旗', '150400', '敖汉', '119.906487', '42.28701', '3', 'tr_0 tr_150000 tr_150400', '2');
INSERT INTO `areas` VALUES ('150500', '通辽市', '150000', '通辽', '122.263123', '43.617428', '2', 'tr_0 tr_150000', '8');
INSERT INTO `areas` VALUES ('150502', '科尔沁区', '150500', '科尔沁', '122.264046', '43.61742', '3', 'tr_0 tr_150000 tr_150500', '3');
INSERT INTO `areas` VALUES ('150521', '科尔沁左翼中旗', '150500', '科尔沁左翼中', '123.313873', '44.127167', '3', 'tr_0 tr_150000 tr_150500', '5');
INSERT INTO `areas` VALUES ('150522', '科尔沁左翼后旗', '150500', '科尔沁左翼后', '122.355156', '42.954563', '3', 'tr_0 tr_150000 tr_150500', '4');
INSERT INTO `areas` VALUES ('150523', '开鲁县', '150500', '开鲁', '121.3088', '43.602432', '3', 'tr_0 tr_150000 tr_150500', '2');
INSERT INTO `areas` VALUES ('150524', '库伦旗', '150500', '库伦', '121.774887', '42.734692', '3', 'tr_0 tr_150000 tr_150500', '6');
INSERT INTO `areas` VALUES ('150525', '奈曼旗', '150500', '奈曼', '120.662544', '42.846851', '3', 'tr_0 tr_150000 tr_150500', '7');
INSERT INTO `areas` VALUES ('150526', '扎鲁特旗', '150500', '扎鲁特', '120.905273', '44.555294', '3', 'tr_0 tr_150000 tr_150500', '8');
INSERT INTO `areas` VALUES ('150581', '霍林郭勒市', '150500', '霍林郭勒', '119.65786', '45.53236', '3', 'tr_0 tr_150000 tr_150500', '1');
INSERT INTO `areas` VALUES ('150600', '鄂尔多斯市', '150000', '鄂尔多斯', '109.990288', '39.817181', '2', 'tr_0 tr_150000', '5');
INSERT INTO `areas` VALUES ('150602', '东胜区', '150600', '东胜', '109.989449', '39.817879', '3', 'tr_0 tr_150000 tr_150600', '2');
INSERT INTO `areas` VALUES ('150621', '达拉特旗', '150600', '达拉特', '110.040283', '40.404076', '3', 'tr_0 tr_150000 tr_150600', '1');
INSERT INTO `areas` VALUES ('150622', '准格尔旗', '150600', '准格尔', '111.238335', '39.865219', '3', 'tr_0 tr_150000 tr_150600', '8');
INSERT INTO `areas` VALUES ('150623', '鄂托克前旗', '150600', '鄂托克前', '107.48172', '38.183258', '3', 'tr_0 tr_150000 tr_150600', '4');
INSERT INTO `areas` VALUES ('150624', '鄂托克旗', '150600', '鄂托克', '107.982605', '39.095753', '3', 'tr_0 tr_150000 tr_150600', '3');
INSERT INTO `areas` VALUES ('150625', '杭锦旗', '150600', '杭锦', '108.73632', '39.831787', '3', 'tr_0 tr_150000 tr_150600', '5');
INSERT INTO `areas` VALUES ('150626', '乌审旗', '150600', '乌审', '108.842453', '38.596611', '3', 'tr_0 tr_150000 tr_150600', '6');
INSERT INTO `areas` VALUES ('150627', '伊金霍洛旗', '150600', '伊金霍洛', '109.787399', '39.604313', '3', 'tr_0 tr_150000 tr_150600', '7');
INSERT INTO `areas` VALUES ('150700', '呼伦贝尔市', '150000', '呼伦贝尔', '119.758171', '49.215332', '2', 'tr_0 tr_150000', '7');
INSERT INTO `areas` VALUES ('150702', '海拉尔区', '150700', '海拉尔', '119.764923', '49.21389', '3', 'tr_0 tr_150000 tr_150700', '7');
INSERT INTO `areas` VALUES ('150703', '扎赉诺尔区', '150700', '扎赉诺尔', '117.792702', '49.486942', '3', 'tr_0 tr_150000 tr_150700', '13');
INSERT INTO `areas` VALUES ('150721', '阿荣旗', '150700', '阿荣', '123.464615', '48.130505', '3', 'tr_0 tr_150000 tr_150700', '1');
INSERT INTO `areas` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '150700', '莫力达瓦', '124.507401', '48.478386', '3', 'tr_0 tr_150000 tr_150700', '9');
INSERT INTO `areas` VALUES ('150723', '鄂伦春自治旗', '150700', '鄂伦春', '123.725685', '50.590176', '3', 'tr_0 tr_150000 tr_150700', '4');
INSERT INTO `areas` VALUES ('150724', '鄂温克族自治旗', '150700', '鄂温克', '119.754044', '49.143291', '3', 'tr_0 tr_150000 tr_150700', '5');
INSERT INTO `areas` VALUES ('150725', '陈巴尔虎旗', '150700', '陈巴尔虎', '119.437607', '49.328423', '3', 'tr_0 tr_150000 tr_150700', '2');
INSERT INTO `areas` VALUES ('150726', '新巴尔虎左旗', '150700', '新巴尔虎左', '118.267456', '48.216572', '3', 'tr_0 tr_150000 tr_150700', '11');
INSERT INTO `areas` VALUES ('150727', '新巴尔虎右旗', '150700', '新巴尔虎右', '116.825989', '48.669132', '3', 'tr_0 tr_150000 tr_150700', '10');
INSERT INTO `areas` VALUES ('150781', '满洲里市', '150700', '满洲里', '117.455559', '49.59079', '3', 'tr_0 tr_150000 tr_150700', '8');
INSERT INTO `areas` VALUES ('150782', '牙克石市', '150700', '牙克石', '120.729004', '49.287025', '3', 'tr_0 tr_150000 tr_150700', '12');
INSERT INTO `areas` VALUES ('150783', '扎兰屯市', '150700', '扎兰屯', '122.7444', '48.007412', '3', 'tr_0 tr_150000 tr_150700', '14');
INSERT INTO `areas` VALUES ('150784', '额尔古纳市', '150700', '额尔古纳', '120.178635', '50.2439', '3', 'tr_0 tr_150000 tr_150700', '3');
INSERT INTO `areas` VALUES ('150785', '根河市', '150700', '根河', '121.532722', '50.780453', '3', 'tr_0 tr_150000 tr_150700', '6');
INSERT INTO `areas` VALUES ('150800', '巴彦淖尔市', '150000', '巴彦淖尔', '107.416962', '40.757401', '2', 'tr_0 tr_150000', '3');
INSERT INTO `areas` VALUES ('150802', '临河区', '150800', '临河', '107.417015', '40.757092', '3', 'tr_0 tr_150000 tr_150800', '3');
INSERT INTO `areas` VALUES ('150821', '五原县', '150800', '五原', '108.27066', '41.097637', '3', 'tr_0 tr_150000 tr_150800', '7');
INSERT INTO `areas` VALUES ('150822', '磴口县', '150800', '磴口', '107.006058', '40.330479', '3', 'tr_0 tr_150000 tr_150800', '1');
INSERT INTO `areas` VALUES ('150823', '乌拉特前旗', '150800', '乌拉特前', '108.656815', '40.725208', '3', 'tr_0 tr_150000 tr_150800', '5');
INSERT INTO `areas` VALUES ('150824', '乌拉特中旗', '150800', '乌拉特中', '108.515259', '41.57254', '3', 'tr_0 tr_150000 tr_150800', '6');
INSERT INTO `areas` VALUES ('150825', '乌拉特后旗', '150800', '乌拉特后', '107.074944', '41.084309', '3', 'tr_0 tr_150000 tr_150800', '4');
INSERT INTO `areas` VALUES ('150826', '杭锦后旗', '150800', '杭锦后', '107.147682', '40.888798', '3', 'tr_0 tr_150000 tr_150800', '2');
INSERT INTO `areas` VALUES ('150900', '乌兰察布市', '150000', '乌兰察布', '113.11454', '41.034126', '2', 'tr_0 tr_150000', '10');
INSERT INTO `areas` VALUES ('150902', '集宁区', '150900', '集宁', '113.116455', '41.034134', '3', 'tr_0 tr_150000 tr_150900', '6');
INSERT INTO `areas` VALUES ('150921', '卓资县', '150900', '卓资', '112.577705', '40.89576', '3', 'tr_0 tr_150000 tr_150900', '11');
INSERT INTO `areas` VALUES ('150922', '化德县', '150900', '化德', '114.010078', '41.899334', '3', 'tr_0 tr_150000 tr_150900', '5');
INSERT INTO `areas` VALUES ('150923', '商都县', '150900', '商都', '113.560646', '41.560162', '3', 'tr_0 tr_150000 tr_150900', '8');
INSERT INTO `areas` VALUES ('150924', '兴和县', '150900', '兴和', '113.834007', '40.872437', '3', 'tr_0 tr_150000 tr_150900', '10');
INSERT INTO `areas` VALUES ('150925', '凉城县', '150900', '凉城', '112.500908', '40.531628', '3', 'tr_0 tr_150000 tr_150900', '7');
INSERT INTO `areas` VALUES ('150926', '察哈尔右翼前旗', '150900', '察哈尔右翼前', '113.21196', '40.786858', '3', 'tr_0 tr_150000 tr_150900', '2');
INSERT INTO `areas` VALUES ('150927', '察哈尔右翼中旗', '150900', '察哈尔右翼中', '112.63356', '41.274212', '3', 'tr_0 tr_150000 tr_150900', '3');
INSERT INTO `areas` VALUES ('150928', '察哈尔右翼后旗', '150900', '察哈尔右翼后', '113.190598', '41.447212', '3', 'tr_0 tr_150000 tr_150900', '1');
INSERT INTO `areas` VALUES ('150929', '四子王旗', '150900', '四子王', '111.701233', '41.528114', '3', 'tr_0 tr_150000 tr_150900', '9');
INSERT INTO `areas` VALUES ('150981', '丰镇市', '150900', '丰镇', '113.16346', '40.437534', '3', 'tr_0 tr_150000 tr_150900', '4');
INSERT INTO `areas` VALUES ('152200', '兴安盟', '150000', '兴安', '122.07032', '46.076267', '2', 'tr_0 tr_150000', '12');
INSERT INTO `areas` VALUES ('152201', '乌兰浩特市', '152200', '乌兰浩特', '122.068977', '46.077236', '3', 'tr_0 tr_150000 tr_152200', '5');
INSERT INTO `areas` VALUES ('152202', '阿尔山市', '152200', '阿尔山', '119.943657', '47.176998', '3', 'tr_0 tr_150000 tr_152200', '1');
INSERT INTO `areas` VALUES ('152221', '科尔沁右翼前旗', '152200', '科尔沁右翼前', '121.957542', '46.076496', '3', 'tr_0 tr_150000 tr_152200', '2');
INSERT INTO `areas` VALUES ('152222', '科尔沁右翼中旗', '152200', '科尔沁右翼中', '121.472816', '45.059647', '3', 'tr_0 tr_150000 tr_152200', '3');
INSERT INTO `areas` VALUES ('152223', '扎赉特旗', '152200', '扎赉特', '122.909332', '46.725136', '3', 'tr_0 tr_150000 tr_152200', '6');
INSERT INTO `areas` VALUES ('152224', '突泉县', '152200', '突泉', '121.564857', '45.380985', '3', 'tr_0 tr_150000 tr_152200', '4');
INSERT INTO `areas` VALUES ('152500', '锡林郭勒盟', '150000', '锡林郭勒', '116.090996', '43.944019', '2', 'tr_0 tr_150000', '11');
INSERT INTO `areas` VALUES ('152501', '二连浩特市', '152500', '二连浩特', '111.979813', '43.652897', '3', 'tr_0 tr_150000 tr_152500', '4');
INSERT INTO `areas` VALUES ('152502', '锡林浩特市', '152500', '锡林浩特', '116.091904', '43.944302', '3', 'tr_0 tr_150000 tr_152500', '9');
INSERT INTO `areas` VALUES ('152522', '阿巴嘎旗', '152500', '阿巴嘎', '114.970619', '44.022728', '3', 'tr_0 tr_150000 tr_152500', '1');
INSERT INTO `areas` VALUES ('152523', '苏尼特左旗', '152500', '苏尼特左', '113.653412', '43.854107', '3', 'tr_0 tr_150000 tr_152500', '6');
INSERT INTO `areas` VALUES ('152524', '苏尼特右旗', '152500', '苏尼特右', '112.655388', '42.746662', '3', 'tr_0 tr_150000 tr_152500', '5');
INSERT INTO `areas` VALUES ('152525', '东乌珠穆沁旗', '152500', '东乌珠穆沁', '116.980019', '45.510307', '3', 'tr_0 tr_150000 tr_152500', '2');
INSERT INTO `areas` VALUES ('152526', '西乌珠穆沁旗', '152500', '西乌珠穆沁', '117.61525', '44.586147', '3', 'tr_0 tr_150000 tr_152500', '10');
INSERT INTO `areas` VALUES ('152527', '太仆寺旗', '152500', '太仆寺', '115.287277', '41.895199', '3', 'tr_0 tr_150000 tr_152500', '7');
INSERT INTO `areas` VALUES ('152528', '镶黄旗', '152500', '镶黄', '113.843872', '42.239227', '3', 'tr_0 tr_150000 tr_152500', '8');
INSERT INTO `areas` VALUES ('152529', '正镶白旗', '152500', '正镶白', '115.031425', '42.286808', '3', 'tr_0 tr_150000 tr_152500', '12');
INSERT INTO `areas` VALUES ('152530', '正蓝旗', '152500', '正蓝', '116.003311', '42.245895', '3', 'tr_0 tr_150000 tr_152500', '11');
INSERT INTO `areas` VALUES ('152531', '多伦县', '152500', '多伦', '116.477287', '42.197964', '3', 'tr_0 tr_150000 tr_152500', '3');
INSERT INTO `areas` VALUES ('152900', '阿拉善盟', '150000', '阿拉善', '105.706421', '38.844814', '2', 'tr_0 tr_150000', '1');
INSERT INTO `areas` VALUES ('152921', '阿拉善左旗', '152900', '阿拉善左', '105.70192', '38.84724', '3', 'tr_0 tr_150000 tr_152900', '2');
INSERT INTO `areas` VALUES ('152922', '阿拉善右旗', '152900', '阿拉善右', '101.671982', '39.21159', '3', 'tr_0 tr_150000 tr_152900', '1');
INSERT INTO `areas` VALUES ('152923', '额济纳旗', '152900', '额济纳', '101.069443', '41.958813', '3', 'tr_0 tr_150000 tr_152900', '3');
INSERT INTO `areas` VALUES ('210000', '辽宁省', '1', '辽宁', '123.429092', '41.796768', '1', 'tr_0', '6');
INSERT INTO `areas` VALUES ('210100', '沈阳市', '210000', '沈阳', '123.429092', '41.796768', '2', 'tr_0 tr_210000', '12');
INSERT INTO `areas` VALUES ('210102', '和平区', '210100', '和平', '123.406662', '41.788074', '3', 'tr_0 tr_210000 tr_210100', '4');
INSERT INTO `areas` VALUES ('210103', '沈河区', '210100', '沈河', '123.445694', '41.795589', '3', 'tr_0 tr_210000 tr_210100', '9');
INSERT INTO `areas` VALUES ('210104', '大东区', '210100', '大东', '123.469955', '41.808502', '3', 'tr_0 tr_210000 tr_210100', '1');
INSERT INTO `areas` VALUES ('210105', '皇姑区', '210100', '皇姑', '123.405678', '41.822334', '3', 'tr_0 tr_210000 tr_210100', '5');
INSERT INTO `areas` VALUES ('210106', '铁西区', '210100', '铁西', '123.350662', '41.787807', '3', 'tr_0 tr_210000 tr_210100', '11');
INSERT INTO `areas` VALUES ('210111', '苏家屯区', '210100', '苏家屯', '123.341606', '41.665905', '3', 'tr_0 tr_210000 tr_210100', '10');
INSERT INTO `areas` VALUES ('210112', '东陵区', '210100', '东陵', '123.458984', '41.741947', '3', 'tr_0 tr_210000 tr_210100', '2');
INSERT INTO `areas` VALUES ('210114', '于洪区', '210100', '于洪', '123.310829', '41.795834', '3', 'tr_0 tr_210000 tr_210100', '13');
INSERT INTO `areas` VALUES ('210122', '辽中县', '210100', '辽中', '122.73127', '41.512726', '3', 'tr_0 tr_210000 tr_210100', '7');
INSERT INTO `areas` VALUES ('210123', '康平县', '210100', '康平', '123.352699', '42.741531', '3', 'tr_0 tr_210000 tr_210100', '6');
INSERT INTO `areas` VALUES ('210124', '法库县', '210100', '法库', '123.416725', '42.507046', '3', 'tr_0 tr_210000 tr_210100', '3');
INSERT INTO `areas` VALUES ('210181', '新民市', '210100', '新民', '122.828865', '41.99651', '3', 'tr_0 tr_210000 tr_210100', '12');
INSERT INTO `areas` VALUES ('210184', '沈北新区', '210100', '沈北', '123.521469', '42.052311', '3', 'tr_0 tr_210000 tr_210100', '8');
INSERT INTO `areas` VALUES ('210200', '大连市', '210000', '大连', '121.618622', '38.914589', '2', 'tr_0 tr_210000', '4');
INSERT INTO `areas` VALUES ('210202', '中山区', '210200', '中山', '121.643761', '38.921555', '3', 'tr_0 tr_210000 tr_210200', '4');
INSERT INTO `areas` VALUES ('210203', '西岗区', '210200', '西岗', '121.616112', '38.914265', '3', 'tr_0 tr_210000 tr_210200', '9');
INSERT INTO `areas` VALUES ('210204', '沙河口区', '210200', '沙河口', '121.593704', '38.912861', '3', 'tr_0 tr_210000 tr_210200', '7');
INSERT INTO `areas` VALUES ('210211', '甘井子区', '210200', '甘井子', '121.582611', '38.975147', '3', 'tr_0 tr_210000 tr_210200', '2');
INSERT INTO `areas` VALUES ('210212', '旅顺口区', '210200', '旅顺口', '121.267128', '38.812042', '3', 'tr_0 tr_210000 tr_210200', '5');
INSERT INTO `areas` VALUES ('210213', '金州区', '210200', '金州', '121.789413', '39.052746', '3', 'tr_0 tr_210000 tr_210200', '3');
INSERT INTO `areas` VALUES ('210224', '长海县', '210200', '长海', '122.587822', '39.2724', '3', 'tr_0 tr_210000 tr_210200', '1');
INSERT INTO `areas` VALUES ('210281', '瓦房店市', '210200', '瓦房店', '122.002655', '39.63065', '3', 'tr_0 tr_210000 tr_210200', '8');
INSERT INTO `areas` VALUES ('210282', '普兰店市', '210200', '普兰店', '121.970497', '39.401554', '3', 'tr_0 tr_210000 tr_210200', '6');
INSERT INTO `areas` VALUES ('210283', '庄河市', '210200', '庄河', '122.970612', '39.698292', '3', 'tr_0 tr_210000 tr_210200', '10');
INSERT INTO `areas` VALUES ('210300', '鞍山市', '210000', '鞍山', '122.995628', '41.110626', '2', 'tr_0 tr_210000', '1');
INSERT INTO `areas` VALUES ('210302', '铁东区', '210300', '铁东', '122.994476', '41.110344', '3', 'tr_0 tr_210000 tr_210300', '5');
INSERT INTO `areas` VALUES ('210303', '铁西区', '210300', '铁西', '122.971832', '41.110691', '3', 'tr_0 tr_210000 tr_210300', '6');
INSERT INTO `areas` VALUES ('210304', '立山区', '210300', '立山', '123.024803', '41.150623', '3', 'tr_0 tr_210000 tr_210300', '2');
INSERT INTO `areas` VALUES ('210311', '千山区', '210300', '千山', '122.957878', '41.070721', '3', 'tr_0 tr_210000 tr_210300', '3');
INSERT INTO `areas` VALUES ('210321', '台安县', '210300', '台安', '122.429733', '41.38686', '3', 'tr_0 tr_210000 tr_210300', '4');
INSERT INTO `areas` VALUES ('210323', '岫岩满族自治县', '210300', '岫岩', '123.28833', '40.281509', '3', 'tr_0 tr_210000 tr_210300', '7');
INSERT INTO `areas` VALUES ('210381', '海城市', '210300', '海城', '122.752197', '40.852531', '3', 'tr_0 tr_210000 tr_210300', '1');
INSERT INTO `areas` VALUES ('210400', '抚顺市', '210000', '抚顺', '123.921112', '41.875957', '2', 'tr_0 tr_210000', '6');
INSERT INTO `areas` VALUES ('210402', '新抚区', '210400', '新抚', '123.902855', '41.860821', '3', 'tr_0 tr_210000 tr_210400', '7');
INSERT INTO `areas` VALUES ('210403', '东洲区', '210400', '东洲', '124.047218', '41.866829', '3', 'tr_0 tr_210000 tr_210400', '1');
INSERT INTO `areas` VALUES ('210404', '望花区', '210400', '望花', '123.801506', '41.851803', '3', 'tr_0 tr_210000 tr_210400', '5');
INSERT INTO `areas` VALUES ('210411', '顺城区', '210400', '顺城', '123.917168', '41.88113', '3', 'tr_0 tr_210000 tr_210400', '4');
INSERT INTO `areas` VALUES ('210421', '抚顺县', '210400', '抚顺', '124.097977', '41.922646', '3', 'tr_0 tr_210000 tr_210400', '2');
INSERT INTO `areas` VALUES ('210422', '新宾满族自治县', '210400', '新宾', '125.037544', '41.732456', '3', 'tr_0 tr_210000 tr_210400', '6');
INSERT INTO `areas` VALUES ('210423', '清原满族自治县', '210400', '清原', '124.927193', '42.101349', '3', 'tr_0 tr_210000 tr_210400', '3');
INSERT INTO `areas` VALUES ('210500', '本溪市', '210000', '本溪', '123.770515', '41.297909', '2', 'tr_0 tr_210000', '2');
INSERT INTO `areas` VALUES ('210502', '平山区', '210500', '平山', '123.76123', '41.29158', '3', 'tr_0 tr_210000 tr_210500', '5');
INSERT INTO `areas` VALUES ('210503', '溪湖区', '210500', '溪湖', '123.765228', '41.330055', '3', 'tr_0 tr_210000 tr_210500', '6');
INSERT INTO `areas` VALUES ('210504', '明山区', '210500', '明山', '123.76329', '41.302429', '3', 'tr_0 tr_210000 tr_210500', '3');
INSERT INTO `areas` VALUES ('210505', '南芬区', '210500', '南芬', '123.748383', '41.104092', '3', 'tr_0 tr_210000 tr_210500', '4');
INSERT INTO `areas` VALUES ('210521', '本溪满族自治县', '210500', '本溪', '124.12616', '41.300343', '3', 'tr_0 tr_210000 tr_210500', '1');
INSERT INTO `areas` VALUES ('210522', '桓仁满族自治县', '210500', '桓仁', '125.359192', '41.268997', '3', 'tr_0 tr_210000 tr_210500', '2');
INSERT INTO `areas` VALUES ('210600', '丹东市', '210000', '丹东', '124.383041', '40.124294', '2', 'tr_0 tr_210000', '5');
INSERT INTO `areas` VALUES ('210602', '元宝区', '210600', '元宝', '124.397812', '40.136482', '3', 'tr_0 tr_210000 tr_210600', '4');
INSERT INTO `areas` VALUES ('210603', '振兴区', '210600', '振兴', '124.361153', '40.102802', '3', 'tr_0 tr_210000 tr_210600', '6');
INSERT INTO `areas` VALUES ('210604', '振安区', '210600', '振安', '124.427711', '40.158558', '3', 'tr_0 tr_210000 tr_210600', '5');
INSERT INTO `areas` VALUES ('210624', '宽甸满族自治县', '210600', '宽甸', '124.784866', '40.730412', '3', 'tr_0 tr_210000 tr_210600', '3');
INSERT INTO `areas` VALUES ('210681', '东港市', '210600', '东港', '124.149437', '39.883469', '3', 'tr_0 tr_210000 tr_210600', '1');
INSERT INTO `areas` VALUES ('210682', '凤城市', '210600', '凤城', '124.071068', '40.457565', '3', 'tr_0 tr_210000 tr_210600', '2');
INSERT INTO `areas` VALUES ('210700', '锦州市', '210000', '锦州', '121.135742', '41.11927', '2', 'tr_0 tr_210000', '9');
INSERT INTO `areas` VALUES ('210702', '古塔区', '210700', '古塔', '121.130089', '41.115719', '3', 'tr_0 tr_210000 tr_210700', '2');
INSERT INTO `areas` VALUES ('210703', '凌河区', '210700', '凌河', '121.151306', '41.114662', '3', 'tr_0 tr_210000 tr_210700', '5');
INSERT INTO `areas` VALUES ('210711', '太和区', '210700', '太和', '121.1073', '41.105377', '3', 'tr_0 tr_210000 tr_210700', '6');
INSERT INTO `areas` VALUES ('210726', '黑山县', '210700', '黑山', '122.117912', '41.691803', '3', 'tr_0 tr_210000 tr_210700', '3');
INSERT INTO `areas` VALUES ('210727', '义县', '210700', '义县', '121.242828', '41.537224', '3', 'tr_0 tr_210000 tr_210700', '7');
INSERT INTO `areas` VALUES ('210781', '凌海市', '210700', '凌海', '121.364235', '41.171738', '3', 'tr_0 tr_210000 tr_210700', '4');
INSERT INTO `areas` VALUES ('210782', '北镇市', '210700', '北镇', '121.795959', '41.598763', '3', 'tr_0 tr_210000 tr_210700', '1');
INSERT INTO `areas` VALUES ('210800', '营口市', '210000', '营口', '122.235153', '40.667431', '2', 'tr_0 tr_210000', '14');
INSERT INTO `areas` VALUES ('210802', '站前区', '210800', '站前', '122.253235', '40.669949', '3', 'tr_0 tr_210000 tr_210800', '6');
INSERT INTO `areas` VALUES ('210803', '西市区', '210800', '西市', '122.210068', '40.663086', '3', 'tr_0 tr_210000 tr_210800', '5');
INSERT INTO `areas` VALUES ('210804', '鲅鱼圈区', '210800', '鲅鱼圈', '122.127243', '40.263645', '3', 'tr_0 tr_210000 tr_210800', '1');
INSERT INTO `areas` VALUES ('210811', '老边区', '210800', '老边', '122.382584', '40.682724', '3', 'tr_0 tr_210000 tr_210800', '4');
INSERT INTO `areas` VALUES ('210881', '盖州市', '210800', '盖州', '122.355537', '40.405235', '3', 'tr_0 tr_210000 tr_210800', '3');
INSERT INTO `areas` VALUES ('210882', '大石桥市', '210800', '大石桥', '122.505898', '40.633972', '3', 'tr_0 tr_210000 tr_210800', '2');
INSERT INTO `areas` VALUES ('210900', '阜新市', '210000', '阜新', '121.648964', '42.011795', '2', 'tr_0 tr_210000', '7');
INSERT INTO `areas` VALUES ('210902', '海州区', '210900', '海州', '121.657639', '42.011162', '3', 'tr_0 tr_210000 tr_210900', '2');
INSERT INTO `areas` VALUES ('210903', '新邱区', '210900', '新邱', '121.790543', '42.086601', '3', 'tr_0 tr_210000 tr_210900', '6');
INSERT INTO `areas` VALUES ('210904', '太平区', '210900', '太平', '121.677574', '42.011147', '3', 'tr_0 tr_210000 tr_210900', '4');
INSERT INTO `areas` VALUES ('210905', '清河门区', '210900', '清河门', '121.420181', '41.780476', '3', 'tr_0 tr_210000 tr_210900', '3');
INSERT INTO `areas` VALUES ('210911', '细河区', '210900', '细河', '121.654793', '42.019218', '3', 'tr_0 tr_210000 tr_210900', '5');
INSERT INTO `areas` VALUES ('210921', '阜新蒙古族自治县', '210900', '阜新', '121.743126', '42.058605', '3', 'tr_0 tr_210000 tr_210900', '1');
INSERT INTO `areas` VALUES ('210922', '彰武县', '210900', '彰武', '122.537445', '42.384823', '3', 'tr_0 tr_210000 tr_210900', '7');
INSERT INTO `areas` VALUES ('211000', '辽阳市', '210000', '辽阳', '123.181519', '41.269402', '2', 'tr_0 tr_210000', '10');
INSERT INTO `areas` VALUES ('211002', '白塔区', '211000', '白塔', '123.172607', '41.267448', '3', 'tr_0 tr_210000 tr_211000', '1');
INSERT INTO `areas` VALUES ('211003', '文圣区', '211000', '文圣', '123.188225', '41.266766', '3', 'tr_0 tr_210000 tr_211000', '7');
INSERT INTO `areas` VALUES ('211004', '宏伟区', '211000', '宏伟', '123.200462', '41.205746', '3', 'tr_0 tr_210000 tr_211000', '4');
INSERT INTO `areas` VALUES ('211005', '弓长岭区', '211000', '弓长岭', '123.431633', '41.157829', '3', 'tr_0 tr_210000 tr_211000', '3');
INSERT INTO `areas` VALUES ('211011', '太子河区', '211000', '太子河', '123.185333', '41.251682', '3', 'tr_0 tr_210000 tr_211000', '6');
INSERT INTO `areas` VALUES ('211021', '辽阳县', '211000', '辽阳', '123.079674', '41.21648', '3', 'tr_0 tr_210000 tr_211000', '5');
INSERT INTO `areas` VALUES ('211081', '灯塔市', '211000', '灯塔', '123.325867', '41.427837', '3', 'tr_0 tr_210000 tr_211000', '2');
INSERT INTO `areas` VALUES ('211100', '盘锦市', '210000', '盘锦', '122.069572', '41.124485', '2', 'tr_0 tr_210000', '11');
INSERT INTO `areas` VALUES ('211102', '双台子区', '211100', '双台子', '122.055733', '41.190365', '3', 'tr_0 tr_210000 tr_211100', '3');
INSERT INTO `areas` VALUES ('211103', '兴隆台区', '211100', '兴隆台', '122.071625', '41.122421', '3', 'tr_0 tr_210000 tr_211100', '4');
INSERT INTO `areas` VALUES ('211121', '大洼县', '211100', '大洼', '122.071709', '40.994427', '3', 'tr_0 tr_210000 tr_211100', '1');
INSERT INTO `areas` VALUES ('211122', '盘山县', '211100', '盘山', '121.985283', '41.2407', '3', 'tr_0 tr_210000 tr_211100', '2');
INSERT INTO `areas` VALUES ('211200', '铁岭市', '210000', '铁岭', '123.844276', '42.290585', '2', 'tr_0 tr_210000', '13');
INSERT INTO `areas` VALUES ('211202', '银州区', '211200', '银州', '123.844879', '42.292278', '3', 'tr_0 tr_210000 tr_211200', '7');
INSERT INTO `areas` VALUES ('211204', '清河区', '211200', '清河', '124.148956', '42.542976', '3', 'tr_0 tr_210000 tr_211200', '4');
INSERT INTO `areas` VALUES ('211221', '铁岭县', '211200', '铁岭', '123.72567', '42.223316', '3', 'tr_0 tr_210000 tr_211200', '5');
INSERT INTO `areas` VALUES ('211223', '西丰县', '211200', '西丰', '124.72332', '42.738091', '3', 'tr_0 tr_210000 tr_211200', '6');
INSERT INTO `areas` VALUES ('211224', '昌图县', '211200', '昌图', '124.110168', '42.784443', '3', 'tr_0 tr_210000 tr_211200', '1');
INSERT INTO `areas` VALUES ('211281', '调兵山市', '211200', '调兵山', '123.545364', '42.450733', '3', 'tr_0 tr_210000 tr_211200', '2');
INSERT INTO `areas` VALUES ('211282', '开原市', '211200', '开原', '124.045547', '42.542141', '3', 'tr_0 tr_210000 tr_211200', '3');
INSERT INTO `areas` VALUES ('211300', '朝阳市', '210000', '朝阳', '120.45118', '41.576759', '2', 'tr_0 tr_210000', '3');
INSERT INTO `areas` VALUES ('211302', '双塔区', '211300', '双塔', '120.448769', '41.579388', '3', 'tr_0 tr_210000 tr_211300', '7');
INSERT INTO `areas` VALUES ('211303', '龙城区', '211300', '龙城', '120.413376', '41.576748', '3', 'tr_0 tr_210000 tr_211300', '6');
INSERT INTO `areas` VALUES ('211321', '朝阳县', '211300', '朝阳', '120.404221', '41.52634', '3', 'tr_0 tr_210000 tr_211300', '2');
INSERT INTO `areas` VALUES ('211322', '建平县', '211300', '建平', '119.642365', '41.402576', '3', 'tr_0 tr_210000 tr_211300', '3');
INSERT INTO `areas` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '211300', '喀左', '119.744881', '41.125427', '3', 'tr_0 tr_210000 tr_211300', '4');
INSERT INTO `areas` VALUES ('211381', '北票市', '211300', '北票', '120.766953', '41.803288', '3', 'tr_0 tr_210000 tr_211300', '1');
INSERT INTO `areas` VALUES ('211382', '凌源市', '211300', '凌源', '119.404793', '41.243088', '3', 'tr_0 tr_210000 tr_211300', '5');
INSERT INTO `areas` VALUES ('211400', '葫芦岛市', '210000', '葫芦岛', '120.856392', '40.755573', '2', 'tr_0 tr_210000', '8');
INSERT INTO `areas` VALUES ('211402', '连山区', '211400', '连山', '120.859367', '40.755142', '3', 'tr_0 tr_210000 tr_211400', '2');
INSERT INTO `areas` VALUES ('211403', '龙港区', '211400', '龙港', '120.83857', '40.709991', '3', 'tr_0 tr_210000 tr_211400', '3');
INSERT INTO `areas` VALUES ('211404', '南票区', '211400', '南票', '120.752312', '41.098812', '3', 'tr_0 tr_210000 tr_211400', '4');
INSERT INTO `areas` VALUES ('211421', '绥中县', '211400', '绥中', '120.34211', '40.328407', '3', 'tr_0 tr_210000 tr_211400', '5');
INSERT INTO `areas` VALUES ('211422', '建昌县', '211400', '建昌', '119.807777', '40.81287', '3', 'tr_0 tr_210000 tr_211400', '1');
INSERT INTO `areas` VALUES ('211481', '兴城市', '211400', '兴城', '120.729362', '40.619411', '3', 'tr_0 tr_210000 tr_211400', '6');
INSERT INTO `areas` VALUES ('220000', '吉林省', '1', '吉林', '125.324501', '43.886841', '1', 'tr_0', '7');
INSERT INTO `areas` VALUES ('220100', '长春市', '220000', '长春', '125.324501', '43.886841', '2', 'tr_0 tr_220000', '3');
INSERT INTO `areas` VALUES ('220102', '南关区', '220100', '南关', '125.337234', '43.890236', '3', 'tr_0 tr_220000 tr_220100', '7');
INSERT INTO `areas` VALUES ('220103', '宽城区', '220100', '宽城', '125.342827', '43.903824', '3', 'tr_0 tr_220000 tr_220100', '5');
INSERT INTO `areas` VALUES ('220104', '朝阳区', '220100', '朝阳', '125.318039', '43.86491', '3', 'tr_0 tr_220000 tr_220100', '1');
INSERT INTO `areas` VALUES ('220105', '二道区', '220100', '二道', '125.384727', '43.870823', '3', 'tr_0 tr_220000 tr_220100', '3');
INSERT INTO `areas` VALUES ('220106', '绿园区', '220100', '绿园', '125.272469', '43.892178', '3', 'tr_0 tr_220000 tr_220100', '6');
INSERT INTO `areas` VALUES ('220112', '双阳区', '220100', '双阳', '125.659019', '43.525169', '3', 'tr_0 tr_220000 tr_220100', '9');
INSERT INTO `areas` VALUES ('220122', '农安县', '220100', '农安', '125.175285', '44.431259', '3', 'tr_0 tr_220000 tr_220100', '8');
INSERT INTO `areas` VALUES ('220181', '九台市', '220100', '九台', '125.844681', '44.157154', '3', 'tr_0 tr_220000 tr_220100', '4');
INSERT INTO `areas` VALUES ('220182', '榆树市', '220100', '榆树', '126.55011', '44.827641', '3', 'tr_0 tr_220000 tr_220100', '10');
INSERT INTO `areas` VALUES ('220183', '德惠市', '220100', '德惠', '125.703323', '44.533909', '3', 'tr_0 tr_220000 tr_220100', '2');
INSERT INTO `areas` VALUES ('220200', '吉林市', '220000', '吉林', '126.553017', '43.843578', '2', 'tr_0 tr_220000', '4');
INSERT INTO `areas` VALUES ('220202', '昌邑区', '220200', '昌邑', '126.570763', '43.851116', '3', 'tr_0 tr_220000 tr_220200', '1');
INSERT INTO `areas` VALUES ('220203', '龙潭区', '220200', '龙潭', '126.561432', '43.909756', '3', 'tr_0 tr_220000 tr_220200', '6');
INSERT INTO `areas` VALUES ('220204', '船营区', '220200', '船营', '126.552391', '43.843803', '3', 'tr_0 tr_220000 tr_220200', '2');
INSERT INTO `areas` VALUES ('220211', '丰满区', '220200', '丰满', '126.56076', '43.816593', '3', 'tr_0 tr_220000 tr_220200', '3');
INSERT INTO `areas` VALUES ('220221', '永吉县', '220200', '永吉', '126.501625', '43.667416', '3', 'tr_0 tr_220000 tr_220200', '9');
INSERT INTO `areas` VALUES ('220281', '蛟河市', '220200', '蛟河', '127.342735', '43.720577', '3', 'tr_0 tr_220000 tr_220200', '5');
INSERT INTO `areas` VALUES ('220282', '桦甸市', '220200', '桦甸', '126.745445', '42.972092', '3', 'tr_0 tr_220000 tr_220200', '4');
INSERT INTO `areas` VALUES ('220283', '舒兰市', '220200', '舒兰', '126.947815', '44.410908', '3', 'tr_0 tr_220000 tr_220200', '8');
INSERT INTO `areas` VALUES ('220284', '磐石市', '220200', '磐石', '126.059929', '42.942474', '3', 'tr_0 tr_220000 tr_220200', '7');
INSERT INTO `areas` VALUES ('220300', '四平市', '220000', '四平', '124.370789', '43.170345', '2', 'tr_0 tr_220000', '6');
INSERT INTO `areas` VALUES ('220302', '铁西区', '220300', '铁西', '124.360893', '43.176262', '3', 'tr_0 tr_220000 tr_220300', '5');
INSERT INTO `areas` VALUES ('220303', '铁东区', '220300', '铁东', '124.388466', '43.167259', '3', 'tr_0 tr_220000 tr_220300', '4');
INSERT INTO `areas` VALUES ('220322', '梨树县', '220300', '梨树', '124.3358', '43.308311', '3', 'tr_0 tr_220000 tr_220300', '2');
INSERT INTO `areas` VALUES ('220323', '伊通满族自治县', '220300', '伊通', '125.303123', '43.345463', '3', 'tr_0 tr_220000 tr_220300', '6');
INSERT INTO `areas` VALUES ('220381', '公主岭市', '220300', '公主岭', '124.817589', '43.509476', '3', 'tr_0 tr_220000 tr_220300', '1');
INSERT INTO `areas` VALUES ('220382', '双辽市', '220300', '双辽', '123.50528', '43.518276', '3', 'tr_0 tr_220000 tr_220300', '3');
INSERT INTO `areas` VALUES ('220400', '辽源市', '220000', '辽源', '125.145348', '42.902691', '2', 'tr_0 tr_220000', '5');
INSERT INTO `areas` VALUES ('220402', '龙山区', '220400', '龙山', '125.145164', '42.902702', '3', 'tr_0 tr_220000 tr_220400', '3');
INSERT INTO `areas` VALUES ('220403', '西安区', '220400', '西安', '125.151421', '42.920414', '3', 'tr_0 tr_220000 tr_220400', '4');
INSERT INTO `areas` VALUES ('220421', '东丰县', '220400', '东丰', '125.529625', '42.675228', '3', 'tr_0 tr_220000 tr_220400', '1');
INSERT INTO `areas` VALUES ('220422', '东辽县', '220400', '东辽', '124.991997', '42.927723', '3', 'tr_0 tr_220000 tr_220400', '2');
INSERT INTO `areas` VALUES ('220500', '通化市', '220000', '通化', '125.936501', '41.721176', '2', 'tr_0 tr_220000', '8');
INSERT INTO `areas` VALUES ('220502', '东昌区', '220500', '东昌', '125.936714', '41.721233', '3', 'tr_0 tr_220000 tr_220500', '1');
INSERT INTO `areas` VALUES ('220503', '二道江区', '220500', '二道江', '126.04599', '41.777565', '3', 'tr_0 tr_220000 tr_220500', '2');
INSERT INTO `areas` VALUES ('220521', '通化县', '220500', '通化', '125.75312', '41.677917', '3', 'tr_0 tr_220000 tr_220500', '7');
INSERT INTO `areas` VALUES ('220523', '辉南县', '220500', '辉南', '126.042824', '42.68346', '3', 'tr_0 tr_220000 tr_220500', '3');
INSERT INTO `areas` VALUES ('220524', '柳河县', '220500', '柳河', '125.74054', '42.281483', '3', 'tr_0 tr_220000 tr_220500', '5');
INSERT INTO `areas` VALUES ('220581', '梅河口市', '220500', '梅河口', '125.68734', '42.530003', '3', 'tr_0 tr_220000 tr_220500', '6');
INSERT INTO `areas` VALUES ('220582', '集安市', '220500', '集安', '126.186203', '41.126274', '3', 'tr_0 tr_220000 tr_220500', '4');
INSERT INTO `areas` VALUES ('220600', '白山市', '220000', '白山', '126.427841', '41.942505', '2', 'tr_0 tr_220000', '2');
INSERT INTO `areas` VALUES ('220602', '浑江区', '220600', '浑江', '126.428032', '41.943066', '3', 'tr_0 tr_220000 tr_220600', '3');
INSERT INTO `areas` VALUES ('220621', '抚松县', '220600', '抚松', '127.273796', '42.332642', '3', 'tr_0 tr_220000 tr_220600', '2');
INSERT INTO `areas` VALUES ('220622', '靖宇县', '220600', '靖宇', '126.808388', '42.38969', '3', 'tr_0 tr_220000 tr_220600', '5');
INSERT INTO `areas` VALUES ('220623', '长白朝鲜族自治县', '220600', '长白', '128.203384', '41.419361', '3', 'tr_0 tr_220000 tr_220600', '1');
INSERT INTO `areas` VALUES ('220625', '江源区', '220600', '江源', '126.584229', '42.048107', '3', 'tr_0 tr_220000 tr_220600', '4');
INSERT INTO `areas` VALUES ('220681', '临江市', '220600', '临江', '126.919296', '41.810688', '3', 'tr_0 tr_220000 tr_220600', '6');
INSERT INTO `areas` VALUES ('220700', '松原市', '220000', '松原', '124.823608', '45.118244', '2', 'tr_0 tr_220000', '7');
INSERT INTO `areas` VALUES ('220702', '宁江区', '220700', '宁江', '124.82785', '45.176498', '3', 'tr_0 tr_220000 tr_220700', '3');
INSERT INTO `areas` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '220700', '前郭', '124.826805', '45.116287', '3', 'tr_0 tr_220000 tr_220700', '5');
INSERT INTO `areas` VALUES ('220722', '长岭县', '220700', '长岭', '123.985184', '44.276581', '3', 'tr_0 tr_220000 tr_220700', '1');
INSERT INTO `areas` VALUES ('220723', '乾安县', '220700', '乾安', '124.024361', '45.006847', '3', 'tr_0 tr_220000 tr_220700', '4');
INSERT INTO `areas` VALUES ('220724', '扶余市', '220700', '扶余', '126.042755', '44.986198', '3', 'tr_0 tr_220000 tr_220700', '2');
INSERT INTO `areas` VALUES ('220800', '白城市', '220000', '白城', '122.84111', '45.619026', '2', 'tr_0 tr_220000', '1');
INSERT INTO `areas` VALUES ('220802', '洮北区', '220800', '洮北', '122.842499', '45.619251', '3', 'tr_0 tr_220000 tr_220800', '2');
INSERT INTO `areas` VALUES ('220821', '镇赉县', '220800', '镇赉', '123.202248', '45.846088', '3', 'tr_0 tr_220000 tr_220800', '5');
INSERT INTO `areas` VALUES ('220822', '通榆县', '220800', '通榆', '123.088547', '44.809151', '3', 'tr_0 tr_220000 tr_220800', '4');
INSERT INTO `areas` VALUES ('220881', '洮南市', '220800', '洮南', '122.783775', '45.339111', '3', 'tr_0 tr_220000 tr_220800', '3');
INSERT INTO `areas` VALUES ('220882', '大安市', '220800', '大安', '124.291512', '45.507648', '3', 'tr_0 tr_220000 tr_220800', '1');
INSERT INTO `areas` VALUES ('222400', '延边朝鲜族自治州', '220000', '延边朝鲜族', '129.513229', '42.904823', '2', 'tr_0 tr_220000', '9');
INSERT INTO `areas` VALUES ('222401', '延吉市', '222400', '延吉', '129.515793', '42.906963', '3', 'tr_0 tr_220000 tr_222400', '8');
INSERT INTO `areas` VALUES ('222402', '图们市', '222400', '图们', '129.846695', '42.966621', '3', 'tr_0 tr_220000 tr_222400', '6');
INSERT INTO `areas` VALUES ('222403', '敦化市', '222400', '敦化', '128.229858', '43.36692', '3', 'tr_0 tr_220000 tr_222400', '2');
INSERT INTO `areas` VALUES ('222404', '珲春市', '222400', '珲春', '130.365784', '42.871056', '3', 'tr_0 tr_220000 tr_222400', '4');
INSERT INTO `areas` VALUES ('222405', '龙井市', '222400', '龙井', '129.425751', '42.77103', '3', 'tr_0 tr_220000 tr_222400', '5');
INSERT INTO `areas` VALUES ('222406', '和龙市', '222400', '和龙', '129.008743', '42.547005', '3', 'tr_0 tr_220000 tr_222400', '3');
INSERT INTO `areas` VALUES ('222424', '汪清县', '222400', '汪清', '129.766159', '43.315426', '3', 'tr_0 tr_220000 tr_222400', '7');
INSERT INTO `areas` VALUES ('222426', '安图县', '222400', '安图', '128.901871', '43.110992', '3', 'tr_0 tr_220000 tr_222400', '1');
INSERT INTO `areas` VALUES ('230000', '黑龙江省', '1', '黑龙江', '126.642464', '45.756966', '1', 'tr_0', '8');
INSERT INTO `areas` VALUES ('230100', '哈尔滨市', '230000', '哈尔滨', '126.642464', '45.756966', '2', 'tr_0 tr_230000', '3');
INSERT INTO `areas` VALUES ('230102', '道里区', '230100', '道里', '126.612534', '45.762035', '3', 'tr_0 tr_230000 tr_230100', '4');
INSERT INTO `areas` VALUES ('230103', '南岗区', '230100', '南岗', '126.6521', '45.75597', '3', 'tr_0 tr_230000 tr_230100', '10');
INSERT INTO `areas` VALUES ('230104', '道外区', '230100', '道外', '126.648834', '45.784538', '3', 'tr_0 tr_230000 tr_230100', '5');
INSERT INTO `areas` VALUES ('230106', '香坊区', '230100', '香坊', '126.667046', '45.713066', '3', 'tr_0 tr_230000 tr_230100', '6');
INSERT INTO `areas` VALUES ('230108', '平房区', '230100', '平房', '126.629257', '45.605568', '3', 'tr_0 tr_230000 tr_230100', '11');
INSERT INTO `areas` VALUES ('230109', '松北区', '230100', '松北', '126.563065', '45.814655', '3', 'tr_0 tr_230000 tr_230100', '14');
INSERT INTO `areas` VALUES ('230111', '呼兰区', '230100', '呼兰', '126.603302', '45.98423', '3', 'tr_0 tr_230000 tr_230100', '8');
INSERT INTO `areas` VALUES ('230123', '依兰县', '230100', '依兰', '129.565598', '46.315105', '3', 'tr_0 tr_230000 tr_230100', '18');
INSERT INTO `areas` VALUES ('230124', '方正县', '230100', '方正', '128.836136', '45.839535', '3', 'tr_0 tr_230000 tr_230100', '7');
INSERT INTO `areas` VALUES ('230125', '宾县', '230100', '宾县', '127.485939', '45.759369', '3', 'tr_0 tr_230000 tr_230100', '3');
INSERT INTO `areas` VALUES ('230126', '巴彦县', '230100', '巴彦', '127.403603', '46.08189', '3', 'tr_0 tr_230000 tr_230100', '2');
INSERT INTO `areas` VALUES ('230127', '木兰县', '230100', '木兰', '128.042679', '45.949825', '3', 'tr_0 tr_230000 tr_230100', '9');
INSERT INTO `areas` VALUES ('230128', '通河县', '230100', '通河', '128.747787', '45.977619', '3', 'tr_0 tr_230000 tr_230100', '15');
INSERT INTO `areas` VALUES ('230129', '延寿县', '230100', '延寿', '128.331879', '45.455647', '3', 'tr_0 tr_230000 tr_230100', '17');
INSERT INTO `areas` VALUES ('230181', '阿城区', '230100', '阿城', '126.972725', '45.538372', '3', 'tr_0 tr_230000 tr_230100', '1');
INSERT INTO `areas` VALUES ('230182', '双城市', '230100', '双城', '126.308784', '45.377941', '3', 'tr_0 tr_230000 tr_230100', '13');
INSERT INTO `areas` VALUES ('230183', '尚志市', '230100', '尚志', '127.968536', '45.214954', '3', 'tr_0 tr_230000 tr_230100', '12');
INSERT INTO `areas` VALUES ('230184', '五常市', '230100', '五常', '127.157593', '44.919418', '3', 'tr_0 tr_230000 tr_230100', '16');
INSERT INTO `areas` VALUES ('230200', '齐齐哈尔市', '230000', '齐齐哈尔', '123.957916', '47.342079', '2', 'tr_0 tr_230000', '9');
INSERT INTO `areas` VALUES ('230202', '龙沙区', '230200', '龙沙', '123.957336', '47.341736', '3', 'tr_0 tr_230000 tr_230200', '10');
INSERT INTO `areas` VALUES ('230203', '建华区', '230200', '建华', '123.955887', '47.354492', '3', 'tr_0 tr_230000 tr_230200', '6');
INSERT INTO `areas` VALUES ('230204', '铁锋区', '230200', '铁锋', '123.973557', '47.3395', '3', 'tr_0 tr_230000 tr_230200', '15');
INSERT INTO `areas` VALUES ('230205', '昂昂溪区', '230200', '昂昂溪', '123.813179', '47.156868', '3', 'tr_0 tr_230000 tr_230200', '1');
INSERT INTO `areas` VALUES ('230206', '富拉尔基区', '230200', '富拉尔基', '123.63887', '47.20697', '3', 'tr_0 tr_230000 tr_230200', '3');
INSERT INTO `areas` VALUES ('230207', '碾子山区', '230200', '碾子山', '122.88797', '47.514011', '3', 'tr_0 tr_230000 tr_230200', '13');
INSERT INTO `areas` VALUES ('230208', '梅里斯达斡尔族区', '230200', '梅里斯达斡尔族', '123.754601', '47.311111', '3', 'tr_0 tr_230000 tr_230200', '11');
INSERT INTO `areas` VALUES ('230221', '龙江县', '230200', '龙江', '123.187225', '47.336388', '3', 'tr_0 tr_230000 tr_230200', '9');
INSERT INTO `areas` VALUES ('230223', '依安县', '230200', '依安', '125.307564', '47.890099', '3', 'tr_0 tr_230000 tr_230200', '16');
INSERT INTO `areas` VALUES ('230224', '泰来县', '230200', '泰来', '123.419533', '46.39233', '3', 'tr_0 tr_230000 tr_230200', '14');
INSERT INTO `areas` VALUES ('230225', '甘南县', '230200', '甘南', '123.506035', '47.917839', '3', 'tr_0 tr_230000 tr_230200', '5');
INSERT INTO `areas` VALUES ('230227', '富裕县', '230200', '富裕', '124.469109', '47.797173', '3', 'tr_0 tr_230000 tr_230200', '4');
INSERT INTO `areas` VALUES ('230229', '克山县', '230200', '克山', '125.874352', '48.034344', '3', 'tr_0 tr_230000 tr_230200', '8');
INSERT INTO `areas` VALUES ('230230', '克东县', '230200', '克东', '126.249092', '48.037319', '3', 'tr_0 tr_230000 tr_230200', '7');
INSERT INTO `areas` VALUES ('230231', '拜泉县', '230200', '拜泉', '126.091911', '47.607365', '3', 'tr_0 tr_230000 tr_230200', '2');
INSERT INTO `areas` VALUES ('230281', '讷河市', '230200', '讷河', '124.882172', '48.481133', '3', 'tr_0 tr_230000 tr_230200', '12');
INSERT INTO `areas` VALUES ('230300', '鸡西市', '230000', '鸡西', '130.975967', '45.300045', '2', 'tr_0 tr_230000', '7');
INSERT INTO `areas` VALUES ('230302', '鸡冠区', '230300', '鸡冠', '130.97438', '45.300339', '3', 'tr_0 tr_230000 tr_230300', '6');
INSERT INTO `areas` VALUES ('230303', '恒山区', '230300', '恒山', '130.910629', '45.213242', '3', 'tr_0 tr_230000 tr_230300', '3');
INSERT INTO `areas` VALUES ('230304', '滴道区', '230300', '滴道', '130.846817', '45.348812', '3', 'tr_0 tr_230000 tr_230300', '2');
INSERT INTO `areas` VALUES ('230305', '梨树区', '230300', '梨树', '130.697784', '45.092194', '3', 'tr_0 tr_230000 tr_230300', '7');
INSERT INTO `areas` VALUES ('230306', '城子河区', '230300', '城子河', '131.010498', '45.338249', '3', 'tr_0 tr_230000 tr_230300', '1');
INSERT INTO `areas` VALUES ('230307', '麻山区', '230300', '麻山', '130.481125', '45.209606', '3', 'tr_0 tr_230000 tr_230300', '8');
INSERT INTO `areas` VALUES ('230321', '鸡东县', '230300', '鸡东', '131.148911', '45.250893', '3', 'tr_0 tr_230000 tr_230300', '5');
INSERT INTO `areas` VALUES ('230381', '虎林市', '230300', '虎林', '132.973877', '45.767986', '3', 'tr_0 tr_230000 tr_230300', '4');
INSERT INTO `areas` VALUES ('230382', '密山市', '230300', '密山', '131.87413', '45.547249', '3', 'tr_0 tr_230000 tr_230300', '9');
INSERT INTO `areas` VALUES ('230400', '鹤岗市', '230000', '鹤岗', '130.277481', '47.332085', '2', 'tr_0 tr_230000', '4');
INSERT INTO `areas` VALUES ('230402', '向阳区', '230400', '向阳', '130.29248', '47.345371', '3', 'tr_0 tr_230000 tr_230400', '6');
INSERT INTO `areas` VALUES ('230403', '工农区', '230400', '工农', '130.276657', '47.331676', '3', 'tr_0 tr_230000 tr_230400', '2');
INSERT INTO `areas` VALUES ('230404', '南山区', '230400', '南山', '130.275528', '47.31324', '3', 'tr_0 tr_230000 tr_230400', '4');
INSERT INTO `areas` VALUES ('230405', '兴安区', '230400', '兴安', '130.236176', '47.252911', '3', 'tr_0 tr_230000 tr_230400', '7');
INSERT INTO `areas` VALUES ('230406', '东山区', '230400', '东山', '130.317139', '47.337383', '3', 'tr_0 tr_230000 tr_230400', '1');
INSERT INTO `areas` VALUES ('230407', '兴山区', '230400', '兴山', '130.305344', '47.35997', '3', 'tr_0 tr_230000 tr_230400', '8');
INSERT INTO `areas` VALUES ('230421', '萝北县', '230400', '萝北', '130.829086', '47.577576', '3', 'tr_0 tr_230000 tr_230400', '3');
INSERT INTO `areas` VALUES ('230422', '绥滨县', '230400', '绥滨', '131.860519', '47.28989', '3', 'tr_0 tr_230000 tr_230400', '5');
INSERT INTO `areas` VALUES ('230500', '双鸭山市', '230000', '双鸭山', '131.157303', '46.64344', '2', 'tr_0 tr_230000', '11');
INSERT INTO `areas` VALUES ('230502', '尖山区', '230500', '尖山', '131.158966', '46.64296', '3', 'tr_0 tr_230000 tr_230500', '3');
INSERT INTO `areas` VALUES ('230503', '岭东区', '230500', '岭东', '131.163681', '46.591076', '3', 'tr_0 tr_230000 tr_230500', '5');
INSERT INTO `areas` VALUES ('230505', '四方台区', '230500', '四方台', '131.333176', '46.594345', '3', 'tr_0 tr_230000 tr_230500', '7');
INSERT INTO `areas` VALUES ('230506', '宝山区', '230500', '宝山', '131.404297', '46.573364', '3', 'tr_0 tr_230000 tr_230500', '2');
INSERT INTO `areas` VALUES ('230521', '集贤县', '230500', '集贤', '131.139328', '46.728981', '3', 'tr_0 tr_230000 tr_230500', '4');
INSERT INTO `areas` VALUES ('230522', '友谊县', '230500', '友谊', '131.810623', '46.775158', '3', 'tr_0 tr_230000 tr_230500', '8');
INSERT INTO `areas` VALUES ('230523', '宝清县', '230500', '宝清', '132.206421', '46.328781', '3', 'tr_0 tr_230000 tr_230500', '1');
INSERT INTO `areas` VALUES ('230524', '饶河县', '230500', '饶河', '134.021164', '46.801289', '3', 'tr_0 tr_230000 tr_230500', '6');
INSERT INTO `areas` VALUES ('230600', '大庆市', '230000', '大庆', '125.112717', '46.590733', '2', 'tr_0 tr_230000', '1');
INSERT INTO `areas` VALUES ('230602', '萨尔图区', '230600', '萨尔图', '125.114639', '46.596355', '3', 'tr_0 tr_230000 tr_230600', '7');
INSERT INTO `areas` VALUES ('230603', '龙凤区', '230600', '龙凤', '125.145798', '46.573948', '3', 'tr_0 tr_230000 tr_230600', '5');
INSERT INTO `areas` VALUES ('230604', '让胡路区', '230600', '让胡路', '124.86834', '46.653255', '3', 'tr_0 tr_230000 tr_230600', '6');
INSERT INTO `areas` VALUES ('230605', '红岗区', '230600', '红岗', '124.889526', '46.403049', '3', 'tr_0 tr_230000 tr_230600', '3');
INSERT INTO `areas` VALUES ('230606', '大同区', '230600', '大同', '124.818512', '46.034306', '3', 'tr_0 tr_230000 tr_230600', '1');
INSERT INTO `areas` VALUES ('230621', '肇州县', '230600', '肇州', '125.273254', '45.708687', '3', 'tr_0 tr_230000 tr_230600', '9');
INSERT INTO `areas` VALUES ('230622', '肇源县', '230600', '肇源', '125.08197', '45.518833', '3', 'tr_0 tr_230000 tr_230600', '8');
INSERT INTO `areas` VALUES ('230623', '林甸县', '230600', '林甸', '124.877739', '47.186413', '3', 'tr_0 tr_230000 tr_230600', '4');
INSERT INTO `areas` VALUES ('230624', '杜尔伯特蒙古族自治县', '230600', '杜尔伯特', '124.446259', '46.865974', '3', 'tr_0 tr_230000 tr_230600', '2');
INSERT INTO `areas` VALUES ('230700', '伊春市', '230000', '伊春', '128.899399', '47.724773', '2', 'tr_0 tr_230000', '13');
INSERT INTO `areas` VALUES ('230702', '伊春区', '230700', '伊春', '128.899277', '47.726852', '3', 'tr_0 tr_230000 tr_230700', '16');
INSERT INTO `areas` VALUES ('230703', '南岔区', '230700', '南岔', '129.282455', '47.137314', '3', 'tr_0 tr_230000 tr_230700', '7');
INSERT INTO `areas` VALUES ('230704', '友好区', '230700', '友好', '128.838959', '47.854301', '3', 'tr_0 tr_230000 tr_230700', '17');
INSERT INTO `areas` VALUES ('230705', '西林区', '230700', '西林', '129.311447', '47.479439', '3', 'tr_0 tr_230000 tr_230700', '14');
INSERT INTO `areas` VALUES ('230706', '翠峦区', '230700', '翠峦', '128.671753', '47.726227', '3', 'tr_0 tr_230000 tr_230700', '1');
INSERT INTO `areas` VALUES ('230707', '新青区', '230700', '新青', '129.529953', '48.288292', '3', 'tr_0 tr_230000 tr_230700', '15');
INSERT INTO `areas` VALUES ('230708', '美溪区', '230700', '美溪', '129.133408', '47.636101', '3', 'tr_0 tr_230000 tr_230700', '6');
INSERT INTO `areas` VALUES ('230709', '金山屯区', '230700', '金山屯', '129.435944', '47.412949', '3', 'tr_0 tr_230000 tr_230700', '5');
INSERT INTO `areas` VALUES ('230710', '五营区', '230700', '五营', '129.245026', '48.108204', '3', 'tr_0 tr_230000 tr_230700', '13');
INSERT INTO `areas` VALUES ('230711', '乌马河区', '230700', '乌马河', '128.802948', '47.726959', '3', 'tr_0 tr_230000 tr_230700', '11');
INSERT INTO `areas` VALUES ('230712', '汤旺河区', '230700', '汤旺河', '129.572235', '48.453651', '3', 'tr_0 tr_230000 tr_230700', '9');
INSERT INTO `areas` VALUES ('230713', '带岭区', '230700', '带岭', '129.021149', '47.027531', '3', 'tr_0 tr_230000 tr_230700', '2');
INSERT INTO `areas` VALUES ('230714', '乌伊岭区', '230700', '乌伊岭', '129.437851', '48.591122', '3', 'tr_0 tr_230000 tr_230700', '12');
INSERT INTO `areas` VALUES ('230715', '红星区', '230700', '红星', '129.388794', '48.238369', '3', 'tr_0 tr_230000 tr_230700', '3');
INSERT INTO `areas` VALUES ('230716', '上甘岭区', '230700', '上甘岭', '129.025085', '47.974857', '3', 'tr_0 tr_230000 tr_230700', '8');
INSERT INTO `areas` VALUES ('230722', '嘉荫县', '230700', '嘉荫', '130.39769', '48.891376', '3', 'tr_0 tr_230000 tr_230700', '4');
INSERT INTO `areas` VALUES ('230781', '铁力市', '230700', '铁力', '128.030563', '46.985771', '3', 'tr_0 tr_230000 tr_230700', '10');
INSERT INTO `areas` VALUES ('230800', '佳木斯市', '230000', '佳木斯', '130.361633', '46.809605', '2', 'tr_0 tr_230000', '6');
INSERT INTO `areas` VALUES ('230803', '向阳区', '230800', '向阳', '130.361786', '46.809647', '3', 'tr_0 tr_230000 tr_230800', '10');
INSERT INTO `areas` VALUES ('230804', '前进区', '230800', '前进', '130.377686', '46.812344', '3', 'tr_0 tr_230000 tr_230800', '7');
INSERT INTO `areas` VALUES ('230805', '东风区', '230800', '东风', '130.40329', '46.822475', '3', 'tr_0 tr_230000 tr_230800', '1');
INSERT INTO `areas` VALUES ('230811', '郊区', '230800', '郊区', '130.361633', '46.809605', '3', 'tr_0 tr_230000 tr_230800', '6');
INSERT INTO `areas` VALUES ('230822', '桦南县', '230800', '桦南', '130.570114', '46.240116', '3', 'tr_0 tr_230000 tr_230800', '5');
INSERT INTO `areas` VALUES ('230826', '桦川县', '230800', '桦川', '130.723709', '47.023041', '3', 'tr_0 tr_230000 tr_230800', '4');
INSERT INTO `areas` VALUES ('230828', '汤原县', '230800', '汤原', '129.904465', '46.730049', '3', 'tr_0 tr_230000 tr_230800', '8');
INSERT INTO `areas` VALUES ('230833', '抚远县', '230800', '抚远', '134.294495', '48.364708', '3', 'tr_0 tr_230000 tr_230800', '3');
INSERT INTO `areas` VALUES ('230881', '同江市', '230800', '同江', '132.510117', '47.651131', '3', 'tr_0 tr_230000 tr_230800', '9');
INSERT INTO `areas` VALUES ('230882', '富锦市', '230800', '富锦', '132.037949', '47.250748', '3', 'tr_0 tr_230000 tr_230800', '2');
INSERT INTO `areas` VALUES ('230900', '七台河市', '230000', '七台河', '131.015579', '45.771267', '2', 'tr_0 tr_230000', '10');
INSERT INTO `areas` VALUES ('230902', '新兴区', '230900', '新兴', '130.889481', '45.794258', '3', 'tr_0 tr_230000 tr_230900', '4');
INSERT INTO `areas` VALUES ('230903', '桃山区', '230900', '桃山', '131.015854', '45.771217', '3', 'tr_0 tr_230000 tr_230900', '3');
INSERT INTO `areas` VALUES ('230904', '茄子河区', '230900', '茄子河', '131.071564', '45.776588', '3', 'tr_0 tr_230000 tr_230900', '2');
INSERT INTO `areas` VALUES ('230921', '勃利县', '230900', '勃利', '130.575027', '45.751572', '3', 'tr_0 tr_230000 tr_230900', '1');
INSERT INTO `areas` VALUES ('231000', '牡丹江市', '230000', '牡丹江', '129.618607', '44.582962', '2', 'tr_0 tr_230000', '8');
INSERT INTO `areas` VALUES ('231002', '东安区', '231000', '东安', '129.623291', '44.582397', '3', 'tr_0 tr_230000 tr_231000', '2');
INSERT INTO `areas` VALUES ('231003', '阳明区', '231000', '阳明', '129.634644', '44.596329', '3', 'tr_0 tr_230000 tr_231000', '10');
INSERT INTO `areas` VALUES ('231004', '爱民区', '231000', '爱民', '129.601227', '44.595444', '3', 'tr_0 tr_230000 tr_231000', '1');
INSERT INTO `areas` VALUES ('231005', '西安区', '231000', '西安', '129.613113', '44.581032', '3', 'tr_0 tr_230000 tr_231000', '9');
INSERT INTO `areas` VALUES ('231024', '东宁县', '231000', '东宁', '131.12529', '44.06358', '3', 'tr_0 tr_230000 tr_231000', '3');
INSERT INTO `areas` VALUES ('231025', '林口县', '231000', '林口', '130.268402', '45.286644', '3', 'tr_0 tr_230000 tr_231000', '5');
INSERT INTO `areas` VALUES ('231081', '绥芬河市', '231000', '绥芬河', '131.164856', '44.396866', '3', 'tr_0 tr_230000 tr_231000', '8');
INSERT INTO `areas` VALUES ('231083', '海林市', '231000', '海林', '129.387909', '44.57415', '3', 'tr_0 tr_230000 tr_231000', '4');
INSERT INTO `areas` VALUES ('231084', '宁安市', '231000', '宁安', '129.470016', '44.346836', '3', 'tr_0 tr_230000 tr_231000', '7');
INSERT INTO `areas` VALUES ('231085', '穆棱市', '231000', '穆棱', '130.527084', '44.91967', '3', 'tr_0 tr_230000 tr_231000', '6');
INSERT INTO `areas` VALUES ('231100', '黑河市', '230000', '黑河', '127.499023', '50.249584', '2', 'tr_0 tr_230000', '5');
INSERT INTO `areas` VALUES ('231102', '爱辉区', '231100', '爱辉', '127.497643', '50.249027', '3', 'tr_0 tr_230000 tr_231100', '1');
INSERT INTO `areas` VALUES ('231121', '嫩江县', '231100', '嫩江', '125.229904', '49.17746', '3', 'tr_0 tr_230000 tr_231100', '3');
INSERT INTO `areas` VALUES ('231123', '逊克县', '231100', '逊克', '128.476151', '49.582973', '3', 'tr_0 tr_230000 tr_231100', '6');
INSERT INTO `areas` VALUES ('231124', '孙吴县', '231100', '孙吴', '127.327316', '49.423943', '3', 'tr_0 tr_230000 tr_231100', '4');
INSERT INTO `areas` VALUES ('231181', '北安市', '231100', '北安', '126.508736', '48.245438', '3', 'tr_0 tr_230000 tr_231100', '2');
INSERT INTO `areas` VALUES ('231182', '五大连池市', '231100', '五大连池', '126.197693', '48.512688', '3', 'tr_0 tr_230000 tr_231100', '5');
INSERT INTO `areas` VALUES ('231200', '绥化市', '230000', '绥化', '126.992928', '46.637394', '2', 'tr_0 tr_230000', '12');
INSERT INTO `areas` VALUES ('231202', '北林区', '231200', '北林', '126.990662', '46.634911', '3', 'tr_0 tr_230000 tr_231200', '2');
INSERT INTO `areas` VALUES ('231221', '望奎县', '231200', '望奎', '126.484192', '46.833519', '3', 'tr_0 tr_230000 tr_231200', '9');
INSERT INTO `areas` VALUES ('231222', '兰西县', '231200', '兰西', '126.289314', '46.259037', '3', 'tr_0 tr_230000 tr_231200', '4');
INSERT INTO `areas` VALUES ('231223', '青冈县', '231200', '青冈', '126.112267', '46.686596', '3', 'tr_0 tr_230000 tr_231200', '7');
INSERT INTO `areas` VALUES ('231224', '庆安县', '231200', '庆安', '127.510025', '46.879204', '3', 'tr_0 tr_230000 tr_231200', '6');
INSERT INTO `areas` VALUES ('231225', '明水县', '231200', '明水', '125.907547', '47.183529', '3', 'tr_0 tr_230000 tr_231200', '5');
INSERT INTO `areas` VALUES ('231226', '绥棱县', '231200', '绥棱', '127.111122', '47.247196', '3', 'tr_0 tr_230000 tr_231200', '8');
INSERT INTO `areas` VALUES ('231281', '安达市', '231200', '安达', '125.329926', '46.410614', '3', 'tr_0 tr_230000 tr_231200', '1');
INSERT INTO `areas` VALUES ('231282', '肇东市', '231200', '肇东', '125.991402', '46.069469', '3', 'tr_0 tr_230000 tr_231200', '10');
INSERT INTO `areas` VALUES ('231283', '海伦市', '231200', '海伦', '126.969383', '47.460426', '3', 'tr_0 tr_230000 tr_231200', '3');
INSERT INTO `areas` VALUES ('232700', '大兴安岭地区', '230000', '大兴安岭', '124.711525', '52.335262', '2', 'tr_0 tr_230000', '2');
INSERT INTO `areas` VALUES ('232702', '松岭区', '232700', '松岭', '124.711525', '52.335262', '3', 'tr_0 tr_230000 tr_232700', '5');
INSERT INTO `areas` VALUES ('232703', '新林区', '232700', '新林', '124.711525', '52.335262', '3', 'tr_0 tr_230000 tr_232700', '7');
INSERT INTO `areas` VALUES ('232704', '呼中区', '232700', '呼中', '123.6035', '52.037003', '3', 'tr_0 tr_230000 tr_232700', '2');
INSERT INTO `areas` VALUES ('232721', '呼玛县', '232700', '呼玛', '126.662102', '51.726997', '3', 'tr_0 tr_230000 tr_232700', '1');
INSERT INTO `areas` VALUES ('232722', '塔河县', '232700', '塔河', '124.710518', '52.335228', '3', 'tr_0 tr_230000 tr_232700', '6');
INSERT INTO `areas` VALUES ('232723', '漠河县', '232700', '漠河', '122.536255', '52.972073', '3', 'tr_0 tr_230000 tr_232700', '4');
INSERT INTO `areas` VALUES ('232724', '加格达奇区', '232700', '加格达奇', '124.126717', '50.424652', '3', 'tr_0 tr_230000 tr_232700', '3');
INSERT INTO `areas` VALUES ('310000', '上海', '1', '上海', '121.472641', '31.231707', '1', 'tr_0', '9');
INSERT INTO `areas` VALUES ('310100', '上海市', '310000', '上海', '121.472641', '31.231707', '2', 'tr_0 tr_310000', '1');
INSERT INTO `areas` VALUES ('310101', '黄浦区', '310100', '黄浦', '121.490318', '31.222771', '3', 'tr_0 tr_310000 tr_310100', '7');
INSERT INTO `areas` VALUES ('310104', '徐汇区', '310100', '徐汇', '121.437523', '31.179974', '3', 'tr_0 tr_310000 tr_310100', '15');
INSERT INTO `areas` VALUES ('310105', '长宁区', '310100', '长宁', '121.422203', '31.218122', '3', 'tr_0 tr_310000 tr_310100', '2');
INSERT INTO `areas` VALUES ('310106', '静安区', '310100', '静安', '121.448227', '31.229004', '3', 'tr_0 tr_310000 tr_310100', '9');
INSERT INTO `areas` VALUES ('310107', '普陀区', '310100', '普陀', '121.392502', '31.241701', '3', 'tr_0 tr_310000 tr_310100', '12');
INSERT INTO `areas` VALUES ('310108', '闸北区', '310100', '闸北', '121.465691', '31.25318', '3', 'tr_0 tr_310000 tr_310100', '17');
INSERT INTO `areas` VALUES ('310109', '虹口区', '310100', '虹口', '121.491829', '31.260969', '3', 'tr_0 tr_310000 tr_310100', '6');
INSERT INTO `areas` VALUES ('310110', '杨浦区', '310100', '杨浦', '121.522797', '31.270756', '3', 'tr_0 tr_310000 tr_310100', '16');
INSERT INTO `areas` VALUES ('310112', '闵行区', '310100', '闵行', '121.375969', '31.111658', '3', 'tr_0 tr_310000 tr_310100', '11');
INSERT INTO `areas` VALUES ('310113', '宝山区', '310100', '宝山', '121.489937', '31.398895', '3', 'tr_0 tr_310000 tr_310100', '1');
INSERT INTO `areas` VALUES ('310114', '嘉定区', '310100', '嘉定', '121.250336', '31.383524', '3', 'tr_0 tr_310000 tr_310100', '8');
INSERT INTO `areas` VALUES ('310115', '浦东新区', '310100', '浦东', '121.567703', '31.245943', '3', 'tr_0 tr_310000 tr_310100', '4');
INSERT INTO `areas` VALUES ('310116', '金山区', '310100', '金山', '121.330734', '30.724697', '3', 'tr_0 tr_310000 tr_310100', '10');
INSERT INTO `areas` VALUES ('310117', '松江区', '310100', '松江', '121.223541', '31.03047', '3', 'tr_0 tr_310000 tr_310100', '14');
INSERT INTO `areas` VALUES ('310118', '青浦区', '310100', '青浦', '121.113022', '31.151209', '3', 'tr_0 tr_310000 tr_310100', '13');
INSERT INTO `areas` VALUES ('310120', '奉贤区', '310100', '奉贤', '121.458473', '30.912346', '3', 'tr_0 tr_310000 tr_310100', '5');
INSERT INTO `areas` VALUES ('310230', '崇明县', '310100', '崇明', '121.397514', '31.626945', '3', 'tr_0 tr_310000 tr_310100', '3');
INSERT INTO `areas` VALUES ('320000', '江苏省', '1', '江苏', '118.76741', '32.041546', '1', 'tr_0', '10');
INSERT INTO `areas` VALUES ('320100', '南京市', '320000', '南京', '118.76741', '32.041546', '2', 'tr_0 tr_320000', '4');
INSERT INTO `areas` VALUES ('320102', '玄武区', '320100', '玄武', '118.792198', '32.050678', '3', 'tr_0 tr_320000 tr_320100', '10');
INSERT INTO `areas` VALUES ('320104', '秦淮区', '320100', '秦淮', '118.786087', '32.033817', '3', 'tr_0 tr_320000 tr_320100', '1');
INSERT INTO `areas` VALUES ('320105', '建邺区', '320100', '建邺', '118.732689', '32.004539', '3', 'tr_0 tr_320000 tr_320100', '5');
INSERT INTO `areas` VALUES ('320106', '鼓楼区', '320100', '鼓楼', '118.769737', '32.066967', '3', 'tr_0 tr_320000 tr_320100', '3');
INSERT INTO `areas` VALUES ('320111', '浦口区', '320100', '浦口', '118.625305', '32.058392', '3', 'tr_0 tr_320000 tr_320100', '8');
INSERT INTO `areas` VALUES ('320113', '栖霞区', '320100', '栖霞', '118.808701', '32.102146', '3', 'tr_0 tr_320000 tr_320100', '9');
INSERT INTO `areas` VALUES ('320114', '雨花台区', '320100', '雨花台', '118.772072', '31.995947', '3', 'tr_0 tr_320000 tr_320100', '11');
INSERT INTO `areas` VALUES ('320115', '江宁区', '320100', '江宁', '118.850624', '31.953419', '3', 'tr_0 tr_320000 tr_320100', '4');
INSERT INTO `areas` VALUES ('320116', '六合区', '320100', '六合', '118.850647', '32.340656', '3', 'tr_0 tr_320000 tr_320100', '7');
INSERT INTO `areas` VALUES ('320124', '溧水区', '320100', '溧水', '119.028732', '31.653061', '3', 'tr_0 tr_320000 tr_320100', '6');
INSERT INTO `areas` VALUES ('320125', '高淳区', '320100', '高淳', '118.875893', '31.327131', '3', 'tr_0 tr_320000 tr_320100', '2');
INSERT INTO `areas` VALUES ('320200', '无锡市', '320000', '无锡', '120.301666', '31.57473', '2', 'tr_0 tr_320000', '9');
INSERT INTO `areas` VALUES ('320202', '崇安区', '320200', '崇安', '120.301628', '31.574705', '3', 'tr_0 tr_320000 tr_320200', '3');
INSERT INTO `areas` VALUES ('320203', '南长区', '320200', '南长', '120.308449', '31.563759', '3', 'tr_0 tr_320000 tr_320200', '6');
INSERT INTO `areas` VALUES ('320204', '北塘区', '320200', '北塘', '120.295158', '31.586575', '3', 'tr_0 tr_320000 tr_320200', '1');
INSERT INTO `areas` VALUES ('320205', '锡山区', '320200', '锡山', '120.3573', '31.58556', '3', 'tr_0 tr_320000 tr_320200', '7');
INSERT INTO `areas` VALUES ('320206', '惠山区', '320200', '惠山', '120.303543', '31.681019', '3', 'tr_0 tr_320000 tr_320200', '4');
INSERT INTO `areas` VALUES ('320211', '滨湖区', '320200', '滨湖', '120.266052', '31.550228', '3', 'tr_0 tr_320000 tr_320200', '2');
INSERT INTO `areas` VALUES ('320281', '江阴市', '320200', '江阴', '120.275894', '31.910984', '3', 'tr_0 tr_320000 tr_320200', '5');
INSERT INTO `areas` VALUES ('320282', '宜兴市', '320200', '宜兴', '119.820541', '31.364384', '3', 'tr_0 tr_320000 tr_320200', '8');
INSERT INTO `areas` VALUES ('320300', '徐州市', '320000', '徐州', '117.184814', '34.261791', '2', 'tr_0 tr_320000', '10');
INSERT INTO `areas` VALUES ('320302', '鼓楼区', '320300', '鼓楼', '117.19294', '34.269398', '3', 'tr_0 tr_320000 tr_320300', '2');
INSERT INTO `areas` VALUES ('320303', '云龙区', '320300', '云龙', '117.194588', '34.254807', '3', 'tr_0 tr_320000 tr_320300', '10');
INSERT INTO `areas` VALUES ('320305', '贾汪区', '320300', '贾汪', '117.450211', '34.441643', '3', 'tr_0 tr_320000 tr_320300', '3');
INSERT INTO `areas` VALUES ('320311', '泉山区', '320300', '泉山', '117.182228', '34.262249', '3', 'tr_0 tr_320000 tr_320300', '7');
INSERT INTO `areas` VALUES ('320321', '丰县', '320300', '丰县', '116.592888', '34.696945', '3', 'tr_0 tr_320000 tr_320300', '1');
INSERT INTO `areas` VALUES ('320322', '沛县', '320300', '沛县', '116.93718', '34.729046', '3', 'tr_0 tr_320000 tr_320300', '5');
INSERT INTO `areas` VALUES ('320323', '铜山区', '320300', '铜山', '117.183891', '34.192879', '3', 'tr_0 tr_320000 tr_320300', '4');
INSERT INTO `areas` VALUES ('320324', '睢宁县', '320300', '睢宁', '117.950661', '33.899223', '3', 'tr_0 tr_320000 tr_320300', '8');
INSERT INTO `areas` VALUES ('320381', '新沂市', '320300', '新沂', '118.345825', '34.368778', '3', 'tr_0 tr_320000 tr_320300', '9');
INSERT INTO `areas` VALUES ('320382', '邳州市', '320300', '邳州', '117.963921', '34.314709', '3', 'tr_0 tr_320000 tr_320300', '6');
INSERT INTO `areas` VALUES ('320400', '常州市', '320000', '常州', '119.946976', '31.772753', '2', 'tr_0 tr_320000', '1');
INSERT INTO `areas` VALUES ('320402', '天宁区', '320400', '天宁', '119.963783', '31.779633', '3', 'tr_0 tr_320000 tr_320400', '4');
INSERT INTO `areas` VALUES ('320404', '钟楼区', '320400', '钟楼', '119.948387', '31.78096', '3', 'tr_0 tr_320000 tr_320400', '7');
INSERT INTO `areas` VALUES ('320405', '戚墅堰区', '320400', '戚墅堰', '120.064751', '31.721663', '3', 'tr_0 tr_320000 tr_320400', '3');
INSERT INTO `areas` VALUES ('320411', '新北区', '320400', '新北', '119.974655', '31.824663', '3', 'tr_0 tr_320000 tr_320400', '6');
INSERT INTO `areas` VALUES ('320412', '武进区', '320400', '武进', '119.958771', '31.718567', '3', 'tr_0 tr_320000 tr_320400', '5');
INSERT INTO `areas` VALUES ('320481', '溧阳市', '320400', '溧阳', '119.487816', '31.42708', '3', 'tr_0 tr_320000 tr_320400', '2');
INSERT INTO `areas` VALUES ('320482', '金坛市', '320400', '金坛', '119.573395', '31.744398', '3', 'tr_0 tr_320000 tr_320400', '1');
INSERT INTO `areas` VALUES ('320500', '苏州市', '320000', '苏州', '120.619583', '31.299379', '2', 'tr_0 tr_320000', '7');
INSERT INTO `areas` VALUES ('320505', '虎丘区', '320500', '虎丘', '120.566833', '31.294846', '3', 'tr_0 tr_320000 tr_320500', '3');
INSERT INTO `areas` VALUES ('320506', '吴中区', '320500', '吴中', '120.624619', '31.27084', '3', 'tr_0 tr_320000 tr_320500', '7');
INSERT INTO `areas` VALUES ('320507', '相城区', '320500', '相城', '120.618958', '31.396685', '3', 'tr_0 tr_320000 tr_320500', '8');
INSERT INTO `areas` VALUES ('320508', '姑苏区', '320500', '姑苏', '120.622246', '31.311415', '3', 'tr_0 tr_320000 tr_320500', '2');
INSERT INTO `areas` VALUES ('320581', '常熟市', '320500', '常熟', '120.74852', '31.658155', '3', 'tr_0 tr_320000 tr_320500', '1');
INSERT INTO `areas` VALUES ('320582', '张家港市', '320500', '张家港', '120.543442', '31.865553', '3', 'tr_0 tr_320000 tr_320500', '9');
INSERT INTO `areas` VALUES ('320583', '昆山市', '320500', '昆山', '120.958138', '31.381926', '3', 'tr_0 tr_320000 tr_320500', '4');
INSERT INTO `areas` VALUES ('320584', '吴江区', '320500', '吴江', '120.641602', '31.160404', '3', 'tr_0 tr_320000 tr_320500', '6');
INSERT INTO `areas` VALUES ('320585', '太仓市', '320500', '太仓', '121.112274', '31.452568', '3', 'tr_0 tr_320000 tr_320500', '5');
INSERT INTO `areas` VALUES ('320600', '南通市', '320000', '南通', '120.864609', '32.016212', '2', 'tr_0 tr_320000', '5');
INSERT INTO `areas` VALUES ('320602', '崇川区', '320600', '崇川', '120.866348', '32.015278', '3', 'tr_0 tr_320000 tr_320600', '1');
INSERT INTO `areas` VALUES ('320611', '港闸区', '320600', '港闸', '120.8339', '32.040298', '3', 'tr_0 tr_320000 tr_320600', '2');
INSERT INTO `areas` VALUES ('320612', '通州区', '320600', '通州', '121.073174', '32.084286', '3', 'tr_0 tr_320000 tr_320600', '8');
INSERT INTO `areas` VALUES ('320621', '海安县', '320600', '海安', '120.465996', '32.540291', '3', 'tr_0 tr_320000 tr_320600', '3');
INSERT INTO `areas` VALUES ('320623', '如东县', '320600', '如东', '121.186089', '32.311832', '3', 'tr_0 tr_320000 tr_320600', '6');
INSERT INTO `areas` VALUES ('320681', '启东市', '320600', '启东', '121.659721', '31.810158', '3', 'tr_0 tr_320000 tr_320600', '5');
INSERT INTO `areas` VALUES ('320682', '如皋市', '320600', '如皋', '120.566322', '32.39159', '3', 'tr_0 tr_320000 tr_320600', '7');
INSERT INTO `areas` VALUES ('320684', '海门市', '320600', '海门', '121.176605', '31.893528', '3', 'tr_0 tr_320000 tr_320600', '4');
INSERT INTO `areas` VALUES ('320700', '连云港市', '320000', '连云港', '119.178818', '34.600018', '2', 'tr_0 tr_320000', '3');
INSERT INTO `areas` VALUES ('320703', '连云区', '320700', '连云', '119.366486', '34.739529', '3', 'tr_0 tr_320000 tr_320700', '6');
INSERT INTO `areas` VALUES ('320705', '新浦区', '320700', '新浦', '119.182106', '34.597046', '3', 'tr_0 tr_320000 tr_320700', '7');
INSERT INTO `areas` VALUES ('320706', '海州区', '320700', '海州', '119.137146', '34.571289', '3', 'tr_0 tr_320000 tr_320700', '5');
INSERT INTO `areas` VALUES ('320721', '赣榆县', '320700', '赣榆', '119.128777', '34.839153', '3', 'tr_0 tr_320000 tr_320700', '2');
INSERT INTO `areas` VALUES ('320722', '东海县', '320700', '东海', '118.766487', '34.522858', '3', 'tr_0 tr_320000 tr_320700', '1');
INSERT INTO `areas` VALUES ('320723', '灌云县', '320700', '灌云', '119.255737', '34.298435', '3', 'tr_0 tr_320000 tr_320700', '4');
INSERT INTO `areas` VALUES ('320724', '灌南县', '320700', '灌南', '119.352333', '34.092552', '3', 'tr_0 tr_320000 tr_320700', '3');
INSERT INTO `areas` VALUES ('320800', '淮安市', '320000', '淮安', '119.021263', '33.597507', '2', 'tr_0 tr_320000', '2');
INSERT INTO `areas` VALUES ('320802', '清河区', '320800', '清河', '119.019455', '33.603233', '3', 'tr_0 tr_320000 tr_320800', '6');
INSERT INTO `areas` VALUES ('320803', '淮安区', '320800', '淮安', '119.146339', '33.5075', '3', 'tr_0 tr_320000 tr_320800', '2');
INSERT INTO `areas` VALUES ('320804', '淮阴区', '320800', '淮阴', '119.020821', '33.622452', '3', 'tr_0 tr_320000 tr_320800', '3');
INSERT INTO `areas` VALUES ('320811', '清浦区', '320800', '清浦', '119.030495', '33.580742', '3', 'tr_0 tr_320000 tr_320800', '7');
INSERT INTO `areas` VALUES ('320826', '涟水县', '320800', '涟水', '119.266075', '33.771309', '3', 'tr_0 tr_320000 tr_320800', '5');
INSERT INTO `areas` VALUES ('320829', '洪泽县', '320800', '洪泽', '118.867874', '33.294975', '3', 'tr_0 tr_320000 tr_320800', '1');
INSERT INTO `areas` VALUES ('320830', '盱眙县', '320800', '盱眙', '118.49382', '33.004391', '3', 'tr_0 tr_320000 tr_320800', '8');
INSERT INTO `areas` VALUES ('320831', '金湖县', '320800', '金湖', '119.016937', '33.018162', '3', 'tr_0 tr_320000 tr_320800', '4');
INSERT INTO `areas` VALUES ('320900', '盐城市', '320000', '盐城', '120.139999', '33.377632', '2', 'tr_0 tr_320000', '11');
INSERT INTO `areas` VALUES ('320902', '亭湖区', '320900', '亭湖', '120.136078', '33.383911', '3', 'tr_0 tr_320000 tr_320900', '7');
INSERT INTO `areas` VALUES ('320903', '盐都区', '320900', '盐都', '120.139755', '33.34129', '3', 'tr_0 tr_320000 tr_320900', '9');
INSERT INTO `areas` VALUES ('320921', '响水县', '320900', '响水', '119.579575', '34.199959', '3', 'tr_0 tr_320000 tr_320900', '8');
INSERT INTO `areas` VALUES ('320922', '滨海县', '320900', '滨海', '119.828438', '33.989887', '3', 'tr_0 tr_320000 tr_320900', '1');
INSERT INTO `areas` VALUES ('320923', '阜宁县', '320900', '阜宁', '119.805336', '33.785728', '3', 'tr_0 tr_320000 tr_320900', '4');
INSERT INTO `areas` VALUES ('320924', '射阳县', '320900', '射阳', '120.257446', '33.773781', '3', 'tr_0 tr_320000 tr_320900', '6');
INSERT INTO `areas` VALUES ('320925', '建湖县', '320900', '建湖', '119.793106', '33.472622', '3', 'tr_0 tr_320000 tr_320900', '5');
INSERT INTO `areas` VALUES ('320981', '东台市', '320900', '东台', '120.314102', '32.853172', '3', 'tr_0 tr_320000 tr_320900', '3');
INSERT INTO `areas` VALUES ('320982', '大丰市', '320900', '大丰', '120.470322', '33.199532', '3', 'tr_0 tr_320000 tr_320900', '2');
INSERT INTO `areas` VALUES ('321000', '扬州市', '320000', '扬州', '119.421005', '32.393158', '2', 'tr_0 tr_320000', '12');
INSERT INTO `areas` VALUES ('321002', '广陵区', '321000', '广陵', '119.442268', '32.392155', '3', 'tr_0 tr_320000 tr_321000', '3');
INSERT INTO `areas` VALUES ('321003', '邗江区', '321000', '邗江', '119.397774', '32.377899', '3', 'tr_0 tr_320000 tr_321000', '4');
INSERT INTO `areas` VALUES ('321023', '宝应县', '321000', '宝应', '119.321281', '33.236938', '3', 'tr_0 tr_320000 tr_321000', '1');
INSERT INTO `areas` VALUES ('321081', '仪征市', '321000', '仪征', '119.182442', '32.271965', '3', 'tr_0 tr_320000 tr_321000', '6');
INSERT INTO `areas` VALUES ('321084', '高邮市', '321000', '高邮', '119.44384', '32.785164', '3', 'tr_0 tr_320000 tr_321000', '2');
INSERT INTO `areas` VALUES ('321088', '江都区', '321000', '江都', '119.567482', '32.426563', '3', 'tr_0 tr_320000 tr_321000', '5');
INSERT INTO `areas` VALUES ('321100', '镇江市', '320000', '镇江', '119.452751', '32.204403', '2', 'tr_0 tr_320000', '13');
INSERT INTO `areas` VALUES ('321102', '京口区', '321100', '京口', '119.454575', '32.206192', '3', 'tr_0 tr_320000 tr_321100', '3');
INSERT INTO `areas` VALUES ('321111', '润州区', '321100', '润州', '119.414879', '32.213501', '3', 'tr_0 tr_320000 tr_321100', '5');
INSERT INTO `areas` VALUES ('321112', '丹徒区', '321100', '丹徒', '119.433884', '32.128971', '3', 'tr_0 tr_320000 tr_321100', '1');
INSERT INTO `areas` VALUES ('321181', '丹阳市', '321100', '丹阳', '119.581909', '31.991459', '3', 'tr_0 tr_320000 tr_321100', '2');
INSERT INTO `areas` VALUES ('321182', '扬中市', '321100', '扬中', '119.828056', '32.237267', '3', 'tr_0 tr_320000 tr_321100', '6');
INSERT INTO `areas` VALUES ('321183', '句容市', '321100', '句容', '119.167137', '31.947355', '3', 'tr_0 tr_320000 tr_321100', '4');
INSERT INTO `areas` VALUES ('321200', '泰州市', '320000', '泰州', '119.915176', '32.484882', '2', 'tr_0 tr_320000', '8');
INSERT INTO `areas` VALUES ('321202', '海陵区', '321200', '海陵', '119.920189', '32.488407', '3', 'tr_0 tr_320000 tr_321200', '2');
INSERT INTO `areas` VALUES ('321203', '高港区', '321200', '高港', '119.88166', '32.315701', '3', 'tr_0 tr_320000 tr_321200', '1');
INSERT INTO `areas` VALUES ('321281', '兴化市', '321200', '兴化', '119.840164', '32.938065', '3', 'tr_0 tr_320000 tr_321200', '6');
INSERT INTO `areas` VALUES ('321282', '靖江市', '321200', '靖江', '120.26825', '32.018169', '3', 'tr_0 tr_320000 tr_321200', '4');
INSERT INTO `areas` VALUES ('321283', '泰兴市', '321200', '泰兴', '120.020226', '32.168785', '3', 'tr_0 tr_320000 tr_321200', '5');
INSERT INTO `areas` VALUES ('321284', '姜堰区', '321200', '姜堰', '120.148209', '32.508484', '3', 'tr_0 tr_320000 tr_321200', '3');
INSERT INTO `areas` VALUES ('321300', '宿迁市', '320000', '宿迁', '118.275162', '33.963009', '2', 'tr_0 tr_320000', '6');
INSERT INTO `areas` VALUES ('321302', '宿城区', '321300', '宿城', '118.278984', '33.937725', '3', 'tr_0 tr_320000 tr_321300', '4');
INSERT INTO `areas` VALUES ('321311', '宿豫区', '321300', '宿豫', '118.330009', '33.941071', '3', 'tr_0 tr_320000 tr_321300', '5');
INSERT INTO `areas` VALUES ('321322', '沭阳县', '321300', '沭阳', '118.775887', '34.129097', '3', 'tr_0 tr_320000 tr_321300', '1');
INSERT INTO `areas` VALUES ('321323', '泗阳县', '321300', '泗阳', '118.681282', '33.711433', '3', 'tr_0 tr_320000 tr_321300', '3');
INSERT INTO `areas` VALUES ('321324', '泗洪县', '321300', '泗洪', '118.211823', '33.456539', '3', 'tr_0 tr_320000 tr_321300', '2');
INSERT INTO `areas` VALUES ('330000', '浙江省', '1', '浙江', '120.15358', '30.287458', '1', 'tr_0', '11');
INSERT INTO `areas` VALUES ('330100', '杭州市', '330000', '杭州', '120.15358', '30.287458', '2', 'tr_0 tr_330000', '1');
INSERT INTO `areas` VALUES ('330102', '上城区', '330100', '上城', '120.171463', '30.250237', '3', 'tr_0 tr_330000 tr_330100', '8');
INSERT INTO `areas` VALUES ('330103', '下城区', '330100', '下城', '120.17276', '30.276272', '3', 'tr_0 tr_330000 tr_330100', '10');
INSERT INTO `areas` VALUES ('330104', '江干区', '330100', '江干', '120.202637', '30.266603', '3', 'tr_0 tr_330000 tr_330100', '6');
INSERT INTO `areas` VALUES ('330105', '拱墅区', '330100', '拱墅', '120.150055', '30.314697', '3', 'tr_0 tr_330000 tr_330100', '4');
INSERT INTO `areas` VALUES ('330106', '西湖区', '330100', '西湖', '120.147377', '30.272934', '3', 'tr_0 tr_330000 tr_330100', '12');
INSERT INTO `areas` VALUES ('330108', '滨江区', '330100', '滨江', '120.210617', '30.206615', '3', 'tr_0 tr_330000 tr_330100', '1');
INSERT INTO `areas` VALUES ('330109', '萧山区', '330100', '萧山', '120.270691', '30.162931', '3', 'tr_0 tr_330000 tr_330100', '11');
INSERT INTO `areas` VALUES ('330110', '余杭区', '330100', '余杭', '120.301735', '30.421186', '3', 'tr_0 tr_330000 tr_330100', '13');
INSERT INTO `areas` VALUES ('330122', '桐庐县', '330100', '桐庐', '119.685043', '29.797438', '3', 'tr_0 tr_330000 tr_330100', '9');
INSERT INTO `areas` VALUES ('330127', '淳安县', '330100', '淳安', '119.044273', '29.604177', '3', 'tr_0 tr_330000 tr_330100', '2');
INSERT INTO `areas` VALUES ('330182', '建德市', '330100', '建德', '119.279091', '29.472284', '3', 'tr_0 tr_330000 tr_330100', '5');
INSERT INTO `areas` VALUES ('330183', '富阳市', '330100', '富阳', '119.949867', '30.049871', '3', 'tr_0 tr_330000 tr_330100', '3');
INSERT INTO `areas` VALUES ('330185', '临安市', '330100', '临安', '119.715103', '30.231153', '3', 'tr_0 tr_330000 tr_330100', '7');
INSERT INTO `areas` VALUES ('330200', '宁波市', '330000', '宁波', '121.549789', '29.868387', '2', 'tr_0 tr_330000', '6');
INSERT INTO `areas` VALUES ('330203', '海曙区', '330200', '海曙', '121.539696', '29.874453', '3', 'tr_0 tr_330000 tr_330200', '4');
INSERT INTO `areas` VALUES ('330204', '江东区', '330200', '江东', '121.57299', '29.866543', '3', 'tr_0 tr_330000 tr_330200', '6');
INSERT INTO `areas` VALUES ('330205', '江北区', '330200', '江北', '121.55928', '29.888361', '3', 'tr_0 tr_330000 tr_330200', '5');
INSERT INTO `areas` VALUES ('330206', '北仑区', '330200', '北仑', '121.831306', '29.909439', '3', 'tr_0 tr_330000 tr_330200', '1');
INSERT INTO `areas` VALUES ('330211', '镇海区', '330200', '镇海', '121.713165', '29.952106', '3', 'tr_0 tr_330000 tr_330200', '11');
INSERT INTO `areas` VALUES ('330212', '鄞州区', '330200', '鄞州', '121.558434', '29.831661', '3', 'tr_0 tr_330000 tr_330200', '9');
INSERT INTO `areas` VALUES ('330225', '象山县', '330200', '象山', '121.87709', '29.470205', '3', 'tr_0 tr_330000 tr_330200', '8');
INSERT INTO `areas` VALUES ('330226', '宁海县', '330200', '宁海', '121.43261', '29.299835', '3', 'tr_0 tr_330000 tr_330200', '7');
INSERT INTO `areas` VALUES ('330281', '余姚市', '330200', '余姚', '121.156296', '30.045404', '3', 'tr_0 tr_330000 tr_330200', '10');
INSERT INTO `areas` VALUES ('330282', '慈溪市', '330200', '慈溪', '121.248055', '30.177141', '3', 'tr_0 tr_330000 tr_330200', '2');
INSERT INTO `areas` VALUES ('330283', '奉化市', '330200', '奉化', '121.410889', '29.662348', '3', 'tr_0 tr_330000 tr_330200', '3');
INSERT INTO `areas` VALUES ('330300', '温州市', '330000', '温州', '120.672112', '28.000574', '2', 'tr_0 tr_330000', '10');
INSERT INTO `areas` VALUES ('330302', '鹿城区', '330300', '鹿城', '120.674232', '28.003351', '3', 'tr_0 tr_330000 tr_330300', '4');
INSERT INTO `areas` VALUES ('330303', '龙湾区', '330300', '龙湾', '120.763466', '27.970255', '3', 'tr_0 tr_330000 tr_330300', '3');
INSERT INTO `areas` VALUES ('330304', '瓯海区', '330300', '瓯海', '120.637146', '28.006445', '3', 'tr_0 tr_330000 tr_330300', '5');
INSERT INTO `areas` VALUES ('330322', '洞头县', '330300', '洞头', '121.156181', '27.836058', '3', 'tr_0 tr_330000 tr_330300', '2');
INSERT INTO `areas` VALUES ('330324', '永嘉县', '330300', '永嘉', '120.690971', '28.153887', '3', 'tr_0 tr_330000 tr_330300', '10');
INSERT INTO `areas` VALUES ('330326', '平阳县', '330300', '平阳', '120.564384', '27.6693', '3', 'tr_0 tr_330000 tr_330300', '6');
INSERT INTO `areas` VALUES ('330327', '苍南县', '330300', '苍南', '120.406258', '27.507744', '3', 'tr_0 tr_330000 tr_330300', '1');
INSERT INTO `areas` VALUES ('330328', '文成县', '330300', '文成', '120.092453', '27.789133', '3', 'tr_0 tr_330000 tr_330300', '9');
INSERT INTO `areas` VALUES ('330329', '泰顺县', '330300', '泰顺', '119.71624', '27.557308', '3', 'tr_0 tr_330000 tr_330300', '8');
INSERT INTO `areas` VALUES ('330381', '瑞安市', '330300', '瑞安', '120.646172', '27.779322', '3', 'tr_0 tr_330000 tr_330300', '7');
INSERT INTO `areas` VALUES ('330382', '乐清市', '330300', '乐清', '120.967148', '28.116083', '3', 'tr_0 tr_330000 tr_330300', '11');
INSERT INTO `areas` VALUES ('330400', '嘉兴市', '330000', '嘉兴', '120.750862', '30.762653', '2', 'tr_0 tr_330000', '3');
INSERT INTO `areas` VALUES ('330402', '南湖区', '330400', '南湖', '120.749954', '30.764652', '3', 'tr_0 tr_330000 tr_330400', '4');
INSERT INTO `areas` VALUES ('330411', '秀洲区', '330400', '秀洲', '120.720428', '30.763323', '3', 'tr_0 tr_330000 tr_330400', '7');
INSERT INTO `areas` VALUES ('330421', '嘉善县', '330400', '嘉善', '120.921867', '30.841352', '3', 'tr_0 tr_330000 tr_330400', '3');
INSERT INTO `areas` VALUES ('330424', '海盐县', '330400', '海盐', '120.942017', '30.522223', '3', 'tr_0 tr_330000 tr_330400', '2');
INSERT INTO `areas` VALUES ('330481', '海宁市', '330400', '海宁', '120.68882', '30.525543', '3', 'tr_0 tr_330000 tr_330400', '1');
INSERT INTO `areas` VALUES ('330482', '平湖市', '330400', '平湖', '121.014664', '30.698921', '3', 'tr_0 tr_330000 tr_330400', '5');
INSERT INTO `areas` VALUES ('330483', '桐乡市', '330400', '桐乡', '120.551086', '30.629065', '3', 'tr_0 tr_330000 tr_330400', '6');
INSERT INTO `areas` VALUES ('330500', '湖州市', '330000', '湖州', '120.102402', '30.867199', '2', 'tr_0 tr_330000', '2');
INSERT INTO `areas` VALUES ('330502', '吴兴区', '330500', '吴兴', '120.101418', '30.867252', '3', 'tr_0 tr_330000 tr_330500', '5');
INSERT INTO `areas` VALUES ('330503', '南浔区', '330500', '南浔', '120.417198', '30.872742', '3', 'tr_0 tr_330000 tr_330500', '4');
INSERT INTO `areas` VALUES ('330521', '德清县', '330500', '德清', '119.967659', '30.534927', '3', 'tr_0 tr_330000 tr_330500', '3');
INSERT INTO `areas` VALUES ('330522', '长兴县', '330500', '长兴', '119.910126', '31.004749', '3', 'tr_0 tr_330000 tr_330500', '2');
INSERT INTO `areas` VALUES ('330523', '安吉县', '330500', '安吉', '119.687889', '30.631973', '3', 'tr_0 tr_330000 tr_330500', '1');
INSERT INTO `areas` VALUES ('330600', '绍兴市', '330000', '绍兴', '120.582115', '29.997116', '2', 'tr_0 tr_330000', '8');
INSERT INTO `areas` VALUES ('330602', '越城区', '330600', '越城', '120.585312', '29.996992', '3', 'tr_0 tr_330000 tr_330600', '5');
INSERT INTO `areas` VALUES ('330621', '绍兴县', '330600', '绍兴', '120.582115', '29.997116', '3', 'tr_0 tr_330000 tr_330600', '2');
INSERT INTO `areas` VALUES ('330624', '新昌县', '330600', '新昌', '120.905663', '29.501205', '3', 'tr_0 tr_330000 tr_330600', '4');
INSERT INTO `areas` VALUES ('330681', '诸暨市', '330600', '诸暨', '120.244324', '29.713661', '3', 'tr_0 tr_330000 tr_330600', '6');
INSERT INTO `areas` VALUES ('330682', '上虞市', '330600', '上虞', '120.582115', '29.997116', '3', 'tr_0 tr_330000 tr_330600', '1');
INSERT INTO `areas` VALUES ('330683', '嵊州市', '330600', '嵊州', '120.82888', '29.586605', '3', 'tr_0 tr_330000 tr_330600', '3');
INSERT INTO `areas` VALUES ('330700', '金华市', '330000', '金华', '119.649506', '29.089523', '2', 'tr_0 tr_330000', '4');
INSERT INTO `areas` VALUES ('330702', '婺城区', '330700', '婺城', '119.65258', '29.082607', '3', 'tr_0 tr_330000 tr_330700', '6');
INSERT INTO `areas` VALUES ('330703', '金东区', '330700', '金东', '119.681267', '29.095835', '3', 'tr_0 tr_330000 tr_330700', '2');
INSERT INTO `areas` VALUES ('330723', '武义县', '330700', '武义', '119.81916', '28.896563', '3', 'tr_0 tr_330000 tr_330700', '7');
INSERT INTO `areas` VALUES ('330726', '浦江县', '330700', '浦江', '119.893364', '29.451254', '3', 'tr_0 tr_330000 tr_330700', '5');
INSERT INTO `areas` VALUES ('330727', '磐安县', '330700', '磐安', '120.445129', '29.052628', '3', 'tr_0 tr_330000 tr_330700', '4');
INSERT INTO `areas` VALUES ('330781', '兰溪市', '330700', '兰溪', '119.460518', '29.210066', '3', 'tr_0 tr_330000 tr_330700', '3');
INSERT INTO `areas` VALUES ('330782', '义乌市', '330700', '义乌', '120.074913', '29.306864', '3', 'tr_0 tr_330000 tr_330700', '8');
INSERT INTO `areas` VALUES ('330783', '东阳市', '330700', '东阳', '120.233337', '29.262547', '3', 'tr_0 tr_330000 tr_330700', '1');
INSERT INTO `areas` VALUES ('330784', '永康市', '330700', '永康', '120.036331', '28.895292', '3', 'tr_0 tr_330000 tr_330700', '9');
INSERT INTO `areas` VALUES ('330800', '衢州市', '330000', '衢州', '118.872627', '28.941708', '2', 'tr_0 tr_330000', '7');
INSERT INTO `areas` VALUES ('330802', '柯城区', '330800', '柯城', '118.873039', '28.944538', '3', 'tr_0 tr_330000 tr_330800', '4');
INSERT INTO `areas` VALUES ('330803', '衢江区', '330800', '衢江', '118.95768', '28.973194', '3', 'tr_0 tr_330000 tr_330800', '6');
INSERT INTO `areas` VALUES ('330822', '常山县', '330800', '常山', '118.521652', '28.90004', '3', 'tr_0 tr_330000 tr_330800', '1');
INSERT INTO `areas` VALUES ('330824', '开化县', '330800', '开化', '118.414436', '29.136503', '3', 'tr_0 tr_330000 tr_330800', '3');
INSERT INTO `areas` VALUES ('330825', '龙游县', '330800', '龙游', '119.172523', '29.031364', '3', 'tr_0 tr_330000 tr_330800', '5');
INSERT INTO `areas` VALUES ('330881', '江山市', '330800', '江山', '118.627876', '28.734674', '3', 'tr_0 tr_330000 tr_330800', '2');
INSERT INTO `areas` VALUES ('330900', '舟山市', '330000', '舟山', '122.106865', '30.016027', '2', 'tr_0 tr_330000', '11');
INSERT INTO `areas` VALUES ('330902', '定海区', '330900', '定海', '122.108498', '30.016422', '3', 'tr_0 tr_330000 tr_330900', '2');
INSERT INTO `areas` VALUES ('330903', '普陀区', '330900', '普陀', '122.301956', '29.945614', '3', 'tr_0 tr_330000 tr_330900', '3');
INSERT INTO `areas` VALUES ('330921', '岱山县', '330900', '岱山', '122.201134', '30.242865', '3', 'tr_0 tr_330000 tr_330900', '1');
INSERT INTO `areas` VALUES ('330922', '嵊泗县', '330900', '嵊泗', '122.457809', '30.727165', '3', 'tr_0 tr_330000 tr_330900', '4');
INSERT INTO `areas` VALUES ('331000', '台州市', '330000', '台州', '121.428596', '28.661379', '2', 'tr_0 tr_330000', '9');
INSERT INTO `areas` VALUES ('331002', '椒江区', '331000', '椒江', '121.431046', '28.676149', '3', 'tr_0 tr_330000 tr_331000', '2');
INSERT INTO `areas` VALUES ('331003', '黄岩区', '331000', '黄岩', '121.262138', '28.64488', '3', 'tr_0 tr_330000 tr_331000', '1');
INSERT INTO `areas` VALUES ('331004', '路桥区', '331000', '路桥', '121.372917', '28.581799', '3', 'tr_0 tr_330000 tr_331000', '4');
INSERT INTO `areas` VALUES ('331021', '玉环县', '331000', '玉环', '121.232338', '28.12842', '3', 'tr_0 tr_330000 tr_331000', '9');
INSERT INTO `areas` VALUES ('331022', '三门县', '331000', '三门', '121.376427', '29.118956', '3', 'tr_0 tr_330000 tr_331000', '5');
INSERT INTO `areas` VALUES ('331023', '天台县', '331000', '天台', '121.031227', '29.141127', '3', 'tr_0 tr_330000 tr_331000', '6');
INSERT INTO `areas` VALUES ('331024', '仙居县', '331000', '仙居', '120.735077', '28.849213', '3', 'tr_0 tr_330000 tr_331000', '8');
INSERT INTO `areas` VALUES ('331081', '温岭市', '331000', '温岭', '121.373611', '28.36878', '3', 'tr_0 tr_330000 tr_331000', '7');
INSERT INTO `areas` VALUES ('331082', '临海市', '331000', '临海', '121.131226', '28.845442', '3', 'tr_0 tr_330000 tr_331000', '3');
INSERT INTO `areas` VALUES ('331100', '丽水市', '330000', '丽水', '119.921783', '28.451994', '2', 'tr_0 tr_330000', '5');
INSERT INTO `areas` VALUES ('331102', '莲都区', '331100', '莲都', '119.922295', '28.451103', '3', 'tr_0 tr_330000 tr_331100', '3');
INSERT INTO `areas` VALUES ('331121', '青田县', '331100', '青田', '120.291939', '28.135246', '3', 'tr_0 tr_330000 tr_331100', '5');
INSERT INTO `areas` VALUES ('331122', '缙云县', '331100', '缙云', '120.078964', '28.654207', '3', 'tr_0 tr_330000 tr_331100', '2');
INSERT INTO `areas` VALUES ('331123', '遂昌县', '331100', '遂昌', '119.275887', '28.5924', '3', 'tr_0 tr_330000 tr_331100', '8');
INSERT INTO `areas` VALUES ('331124', '松阳县', '331100', '松阳', '119.485291', '28.449938', '3', 'tr_0 tr_330000 tr_331100', '7');
INSERT INTO `areas` VALUES ('331125', '云和县', '331100', '云和', '119.569458', '28.111076', '3', 'tr_0 tr_330000 tr_331100', '9');
INSERT INTO `areas` VALUES ('331126', '庆元县', '331100', '庆元', '119.06723', '27.618231', '3', 'tr_0 tr_330000 tr_331100', '6');
INSERT INTO `areas` VALUES ('331127', '景宁畲族自治县', '331100', '景宁', '119.634666', '27.977247', '3', 'tr_0 tr_330000 tr_331100', '1');
INSERT INTO `areas` VALUES ('331181', '龙泉市', '331100', '龙泉', '119.132317', '28.069178', '3', 'tr_0 tr_330000 tr_331100', '4');
INSERT INTO `areas` VALUES ('340000', '安徽省', '1', '安徽', '117.283043', '31.861191', '1', 'tr_0', '12');
INSERT INTO `areas` VALUES ('340100', '合肥市', '340000', '合肥', '117.283043', '31.861191', '2', 'tr_0 tr_340000', '7');
INSERT INTO `areas` VALUES ('340102', '瑶海区', '340100', '瑶海', '117.315361', '31.86961', '3', 'tr_0 tr_340000 tr_340100', '9');
INSERT INTO `areas` VALUES ('340103', '庐阳区', '340100', '庐阳', '117.283775', '31.869011', '3', 'tr_0 tr_340000 tr_340100', '7');
INSERT INTO `areas` VALUES ('340104', '蜀山区', '340100', '蜀山', '117.26207', '31.855867', '3', 'tr_0 tr_340000 tr_340100', '8');
INSERT INTO `areas` VALUES ('340111', '包河区', '340100', '包河', '117.285751', '31.829559', '3', 'tr_0 tr_340000 tr_340100', '1');
INSERT INTO `areas` VALUES ('340121', '长丰县', '340100', '长丰', '117.164696', '32.478546', '3', 'tr_0 tr_340000 tr_340100', '2');
INSERT INTO `areas` VALUES ('340122', '肥东县', '340100', '肥东', '117.463219', '31.883991', '3', 'tr_0 tr_340000 tr_340100', '4');
INSERT INTO `areas` VALUES ('340123', '肥西县', '340100', '肥西', '117.166115', '31.719646', '3', 'tr_0 tr_340000 tr_340100', '5');
INSERT INTO `areas` VALUES ('340200', '芜湖市', '340000', '芜湖', '118.37645', '31.326319', '2', 'tr_0 tr_340000', '15');
INSERT INTO `areas` VALUES ('340202', '镜湖区', '340200', '镜湖', '118.376343', '31.32559', '3', 'tr_0 tr_340000 tr_340200', '2');
INSERT INTO `areas` VALUES ('340203', '弋江区', '340200', '弋江', '118.37748', '31.313395', '3', 'tr_0 tr_340000 tr_340200', '8');
INSERT INTO `areas` VALUES ('340207', '鸠江区', '340200', '鸠江', '118.400177', '31.362717', '3', 'tr_0 tr_340000 tr_340200', '3');
INSERT INTO `areas` VALUES ('340208', '三山区', '340200', '三山', '118.233986', '31.225424', '3', 'tr_0 tr_340000 tr_340200', '5');
INSERT INTO `areas` VALUES ('340221', '芜湖县', '340200', '芜湖', '118.572304', '31.145262', '3', 'tr_0 tr_340000 tr_340200', '6');
INSERT INTO `areas` VALUES ('340222', '繁昌县', '340200', '繁昌', '118.201347', '31.080896', '3', 'tr_0 tr_340000 tr_340200', '1');
INSERT INTO `areas` VALUES ('340223', '南陵县', '340200', '南陵', '118.337105', '30.919638', '3', 'tr_0 tr_340000 tr_340200', '4');
INSERT INTO `areas` VALUES ('340300', '蚌埠市', '340000', '蚌埠', '117.363228', '32.939667', '2', 'tr_0 tr_340000', '2');
INSERT INTO `areas` VALUES ('340302', '龙子湖区', '340300', '龙子湖', '117.382309', '32.950451', '3', 'tr_0 tr_340000 tr_340300', '5');
INSERT INTO `areas` VALUES ('340303', '蚌山区', '340300', '蚌山', '117.355789', '32.938065', '3', 'tr_0 tr_340000 tr_340300', '1');
INSERT INTO `areas` VALUES ('340304', '禹会区', '340300', '禹会', '117.352592', '32.931934', '3', 'tr_0 tr_340000 tr_340300', '7');
INSERT INTO `areas` VALUES ('340311', '淮上区', '340300', '淮上', '117.347092', '32.963146', '3', 'tr_0 tr_340000 tr_340300', '3');
INSERT INTO `areas` VALUES ('340321', '怀远县', '340300', '怀远', '117.200172', '32.956936', '3', 'tr_0 tr_340000 tr_340300', '4');
INSERT INTO `areas` VALUES ('340322', '五河县', '340300', '五河', '117.888809', '33.146202', '3', 'tr_0 tr_340000 tr_340300', '6');
INSERT INTO `areas` VALUES ('340323', '固镇县', '340300', '固镇', '117.315964', '33.31868', '3', 'tr_0 tr_340000 tr_340300', '2');
INSERT INTO `areas` VALUES ('340400', '淮南市', '340000', '淮南', '117.018326', '32.647575', '2', 'tr_0 tr_340000', '9');
INSERT INTO `areas` VALUES ('340402', '大通区', '340400', '大通', '117.052925', '32.632065', '3', 'tr_0 tr_340000 tr_340400', '2');
INSERT INTO `areas` VALUES ('340403', '田家庵区', '340400', '田家庵', '117.018318', '32.644341', '3', 'tr_0 tr_340000 tr_340400', '5');
INSERT INTO `areas` VALUES ('340404', '谢家集区', '340400', '谢家集', '116.865356', '32.598289', '3', 'tr_0 tr_340000 tr_340400', '6');
INSERT INTO `areas` VALUES ('340405', '八公山区', '340400', '八公山', '116.84111', '32.628227', '3', 'tr_0 tr_340000 tr_340400', '1');
INSERT INTO `areas` VALUES ('340406', '潘集区', '340400', '潘集', '116.816879', '32.782116', '3', 'tr_0 tr_340000 tr_340400', '4');
INSERT INTO `areas` VALUES ('340421', '凤台县', '340400', '凤台', '116.722771', '32.705383', '3', 'tr_0 tr_340000 tr_340400', '3');
INSERT INTO `areas` VALUES ('340500', '马鞍山市', '340000', '马鞍山', '118.507904', '31.689362', '2', 'tr_0 tr_340000', '12');
INSERT INTO `areas` VALUES ('340503', '花山区', '340500', '花山', '118.511307', '31.69902', '3', 'tr_0 tr_340000 tr_340500', '5');
INSERT INTO `areas` VALUES ('340504', '雨山区', '340500', '雨山', '118.493103', '31.685911', '3', 'tr_0 tr_340000 tr_340500', '6');
INSERT INTO `areas` VALUES ('340506', '博望区', '340500', '博望', '118.843742', '31.562321', '3', 'tr_0 tr_340000 tr_340500', '1');
INSERT INTO `areas` VALUES ('340521', '当涂县', '340500', '当涂', '118.489876', '31.556168', '3', 'tr_0 tr_340000 tr_340500', '2');
INSERT INTO `areas` VALUES ('340600', '淮北市', '340000', '淮北', '116.794662', '33.971706', '2', 'tr_0 tr_340000', '8');
INSERT INTO `areas` VALUES ('340602', '杜集区', '340600', '杜集', '116.833923', '33.991219', '3', 'tr_0 tr_340000 tr_340600', '1');
INSERT INTO `areas` VALUES ('340603', '相山区', '340600', '相山', '116.790771', '33.970917', '3', 'tr_0 tr_340000 tr_340600', '4');
INSERT INTO `areas` VALUES ('340604', '烈山区', '340600', '烈山', '116.809464', '33.88953', '3', 'tr_0 tr_340000 tr_340600', '2');
INSERT INTO `areas` VALUES ('340621', '濉溪县', '340600', '濉溪', '116.767433', '33.916409', '3', 'tr_0 tr_340000 tr_340600', '3');
INSERT INTO `areas` VALUES ('340700', '铜陵市', '340000', '铜陵', '117.816574', '30.929935', '2', 'tr_0 tr_340000', '14');
INSERT INTO `areas` VALUES ('340702', '铜官山区', '340700', '铜官山', '117.818428', '30.93182', '3', 'tr_0 tr_340000 tr_340700', '3');
INSERT INTO `areas` VALUES ('340703', '狮子山区', '340700', '狮子山', '117.864098', '30.946249', '3', 'tr_0 tr_340000 tr_340700', '2');
INSERT INTO `areas` VALUES ('340711', '郊区', '340700', '郊区', '117.816574', '30.929935', '3', 'tr_0 tr_340000 tr_340700', '1');
INSERT INTO `areas` VALUES ('340721', '铜陵县', '340700', '铜陵', '117.79229', '30.952337', '3', 'tr_0 tr_340000 tr_340700', '4');
INSERT INTO `areas` VALUES ('340800', '安庆市', '340000', '安庆', '117.043549', '30.508829', '2', 'tr_0 tr_340000', '1');
INSERT INTO `areas` VALUES ('340802', '迎江区', '340800', '迎江', '117.044968', '30.506374', '3', 'tr_0 tr_340000 tr_340800', '8');
INSERT INTO `areas` VALUES ('340803', '大观区', '340800', '大观', '117.034515', '30.505632', '3', 'tr_0 tr_340000 tr_340800', '1');
INSERT INTO `areas` VALUES ('340811', '宜秀区', '340800', '宜秀', '117.07', '30.541323', '3', 'tr_0 tr_340000 tr_340800', '9');
INSERT INTO `areas` VALUES ('340822', '怀宁县', '340800', '怀宁', '116.828667', '30.734995', '3', 'tr_0 tr_340000 tr_340800', '2');
INSERT INTO `areas` VALUES ('340823', '枞阳县', '340800', '枞阳', '117.222031', '30.700615', '3', 'tr_0 tr_340000 tr_340800', '11');
INSERT INTO `areas` VALUES ('340824', '潜山县', '340800', '潜山', '116.573669', '30.638222', '3', 'tr_0 tr_340000 tr_340800', '3');
INSERT INTO `areas` VALUES ('340825', '太湖县', '340800', '太湖', '116.305222', '30.451868', '3', 'tr_0 tr_340000 tr_340800', '5');
INSERT INTO `areas` VALUES ('340826', '宿松县', '340800', '宿松', '116.120201', '30.158327', '3', 'tr_0 tr_340000 tr_340800', '4');
INSERT INTO `areas` VALUES ('340827', '望江县', '340800', '望江', '116.690926', '30.12491', '3', 'tr_0 tr_340000 tr_340800', '7');
INSERT INTO `areas` VALUES ('340828', '岳西县', '340800', '岳西', '116.360481', '30.848501', '3', 'tr_0 tr_340000 tr_340800', '10');
INSERT INTO `areas` VALUES ('340881', '桐城市', '340800', '桐城', '116.959656', '31.050575', '3', 'tr_0 tr_340000 tr_340800', '6');
INSERT INTO `areas` VALUES ('341000', '黄山市', '340000', '黄山', '118.317322', '29.709238', '2', 'tr_0 tr_340000', '10');
INSERT INTO `areas` VALUES ('341002', '屯溪区', '341000', '屯溪', '118.317352', '29.709187', '3', 'tr_0 tr_340000 tr_341000', '5');
INSERT INTO `areas` VALUES ('341003', '黄山区', '341000', '黄山', '118.136642', '30.294518', '3', 'tr_0 tr_340000 tr_341000', '1');
INSERT INTO `areas` VALUES ('341004', '徽州区', '341000', '徽州', '118.339745', '29.825201', '3', 'tr_0 tr_340000 tr_341000', '2');
INSERT INTO `areas` VALUES ('341021', '歙县', '341000', '歙县', '118.428024', '29.867748', '3', 'tr_0 tr_340000 tr_341000', '4');
INSERT INTO `areas` VALUES ('341022', '休宁县', '341000', '休宁', '118.18853', '29.788877', '3', 'tr_0 tr_340000 tr_341000', '6');
INSERT INTO `areas` VALUES ('341023', '黟县', '341000', '黟县', '117.942909', '29.923813', '3', 'tr_0 tr_340000 tr_341000', '7');
INSERT INTO `areas` VALUES ('341024', '祁门县', '341000', '祁门', '117.717239', '29.853472', '3', 'tr_0 tr_340000 tr_341000', '3');
INSERT INTO `areas` VALUES ('341100', '滁州市', '340000', '滁州', '118.316261', '32.303627', '2', 'tr_0 tr_340000', '5');
INSERT INTO `areas` VALUES ('341102', '琅琊区', '341100', '琅琊', '118.316475', '32.303799', '3', 'tr_0 tr_340000 tr_341100', '4');
INSERT INTO `areas` VALUES ('341103', '南谯区', '341100', '南谯', '118.296951', '32.329842', '3', 'tr_0 tr_340000 tr_341100', '6');
INSERT INTO `areas` VALUES ('341122', '来安县', '341100', '来安', '118.433296', '32.45023', '3', 'tr_0 tr_340000 tr_341100', '3');
INSERT INTO `areas` VALUES ('341124', '全椒县', '341100', '全椒', '118.268578', '32.093849', '3', 'tr_0 tr_340000 tr_341100', '7');
INSERT INTO `areas` VALUES ('341125', '定远县', '341100', '定远', '117.683716', '32.527103', '3', 'tr_0 tr_340000 tr_341100', '1');
INSERT INTO `areas` VALUES ('341126', '凤阳县', '341100', '凤阳', '117.562462', '32.867146', '3', 'tr_0 tr_340000 tr_341100', '2');
INSERT INTO `areas` VALUES ('341181', '天长市', '341100', '天长', '119.011215', '32.681499', '3', 'tr_0 tr_340000 tr_341100', '8');
INSERT INTO `areas` VALUES ('341182', '明光市', '341100', '明光', '117.998047', '32.781204', '3', 'tr_0 tr_340000 tr_341100', '5');
INSERT INTO `areas` VALUES ('341200', '阜阳市', '340000', '阜阳', '115.819733', '32.896969', '2', 'tr_0 tr_340000', '6');
INSERT INTO `areas` VALUES ('341202', '颍州区', '341200', '颍州', '115.813911', '32.891239', '3', 'tr_0 tr_340000 tr_341200', '8');
INSERT INTO `areas` VALUES ('341203', '颍东区', '341200', '颍东', '115.858749', '32.908859', '3', 'tr_0 tr_340000 tr_341200', '5');
INSERT INTO `areas` VALUES ('341204', '颍泉区', '341200', '颍泉', '115.804527', '32.924797', '3', 'tr_0 tr_340000 tr_341200', '6');
INSERT INTO `areas` VALUES ('341221', '临泉县', '341200', '临泉', '115.261688', '33.062698', '3', 'tr_0 tr_340000 tr_341200', '3');
INSERT INTO `areas` VALUES ('341222', '太和县', '341200', '太和', '115.627243', '33.162289', '3', 'tr_0 tr_340000 tr_341200', '4');
INSERT INTO `areas` VALUES ('341225', '阜南县', '341200', '阜南', '115.59053', '32.638103', '3', 'tr_0 tr_340000 tr_341200', '1');
INSERT INTO `areas` VALUES ('341226', '颍上县', '341200', '颍上', '116.259125', '32.637066', '3', 'tr_0 tr_340000 tr_341200', '7');
INSERT INTO `areas` VALUES ('341282', '界首市', '341200', '界首', '115.362114', '33.261532', '3', 'tr_0 tr_340000 tr_341200', '2');
INSERT INTO `areas` VALUES ('341300', '宿州市', '340000', '宿州', '116.984085', '33.633892', '2', 'tr_0 tr_340000', '13');
INSERT INTO `areas` VALUES ('341302', '埇桥区', '341300', '埇桥', '116.983307', '33.633854', '3', 'tr_0 tr_340000 tr_341300', '5');
INSERT INTO `areas` VALUES ('341321', '砀山县', '341300', '砀山', '116.351112', '34.426247', '3', 'tr_0 tr_340000 tr_341300', '1');
INSERT INTO `areas` VALUES ('341322', '萧县', '341300', '萧县', '116.945396', '34.183266', '3', 'tr_0 tr_340000 tr_341300', '4');
INSERT INTO `areas` VALUES ('341323', '灵璧县', '341300', '灵璧', '117.551491', '33.54063', '3', 'tr_0 tr_340000 tr_341300', '2');
INSERT INTO `areas` VALUES ('341324', '泗县', '341300', '泗县', '117.885445', '33.477581', '3', 'tr_0 tr_340000 tr_341300', '3');
INSERT INTO `areas` VALUES ('341400', '巢湖市', '340100', '巢湖', '117.874153', '31.600517', '3', 'tr_0 tr_340000 tr_340100', '3');
INSERT INTO `areas` VALUES ('341421', '庐江县', '340100', '庐江', '117.289841', '31.251488', '3', 'tr_0 tr_340000 tr_340100', '6');
INSERT INTO `areas` VALUES ('341422', '无为县', '340200', '无为', '117.91143', '31.303076', '3', 'tr_0 tr_340000 tr_340200', '7');
INSERT INTO `areas` VALUES ('341423', '含山县', '340500', '含山', '118.105545', '31.727758', '3', 'tr_0 tr_340000 tr_340500', '3');
INSERT INTO `areas` VALUES ('341424', '和县', '340500', '和县', '118.362999', '31.716635', '3', 'tr_0 tr_340000 tr_340500', '4');
INSERT INTO `areas` VALUES ('341500', '六安市', '340000', '六安', '116.507675', '31.75289', '2', 'tr_0 tr_340000', '11');
INSERT INTO `areas` VALUES ('341502', '金安区', '341500', '金安', '116.503288', '31.754492', '3', 'tr_0 tr_340000 tr_341500', '3');
INSERT INTO `areas` VALUES ('341503', '裕安区', '341500', '裕安', '116.494545', '31.750692', '3', 'tr_0 tr_340000 tr_341500', '7');
INSERT INTO `areas` VALUES ('341521', '寿县', '341500', '寿县', '116.785347', '32.577305', '3', 'tr_0 tr_340000 tr_341500', '5');
INSERT INTO `areas` VALUES ('341522', '霍邱县', '341500', '霍邱', '116.278877', '32.341305', '3', 'tr_0 tr_340000 tr_341500', '1');
INSERT INTO `areas` VALUES ('341523', '舒城县', '341500', '舒城', '116.944092', '31.462849', '3', 'tr_0 tr_340000 tr_341500', '6');
INSERT INTO `areas` VALUES ('341524', '金寨县', '341500', '金寨', '115.878517', '31.681623', '3', 'tr_0 tr_340000 tr_341500', '4');
INSERT INTO `areas` VALUES ('341525', '霍山县', '341500', '霍山', '116.333076', '31.402456', '3', 'tr_0 tr_340000 tr_341500', '2');
INSERT INTO `areas` VALUES ('341600', '亳州市', '340000', '亳州', '115.782936', '33.869339', '2', 'tr_0 tr_340000', '3');
INSERT INTO `areas` VALUES ('341602', '谯城区', '341600', '谯城', '115.781212', '33.869286', '3', 'tr_0 tr_340000 tr_341600', '4');
INSERT INTO `areas` VALUES ('341621', '涡阳县', '341600', '涡阳', '116.211548', '33.502831', '3', 'tr_0 tr_340000 tr_341600', '1');
INSERT INTO `areas` VALUES ('341622', '蒙城县', '341600', '蒙城', '116.560333', '33.260815', '3', 'tr_0 tr_340000 tr_341600', '3');
INSERT INTO `areas` VALUES ('341623', '利辛县', '341600', '利辛', '116.207779', '33.143501', '3', 'tr_0 tr_340000 tr_341600', '2');
INSERT INTO `areas` VALUES ('341700', '池州市', '340000', '池州', '117.489159', '30.656036', '2', 'tr_0 tr_340000', '4');
INSERT INTO `areas` VALUES ('341702', '贵池区', '341700', '贵池', '117.488342', '30.657377', '3', 'tr_0 tr_340000 tr_341700', '2');
INSERT INTO `areas` VALUES ('341721', '东至县', '341700', '东至', '117.021477', '30.096567', '3', 'tr_0 tr_340000 tr_341700', '1');
INSERT INTO `areas` VALUES ('341722', '石台县', '341700', '石台', '117.48291', '30.210323', '3', 'tr_0 tr_340000 tr_341700', '4');
INSERT INTO `areas` VALUES ('341723', '青阳县', '341700', '青阳', '117.857391', '30.63818', '3', 'tr_0 tr_340000 tr_341700', '3');
INSERT INTO `areas` VALUES ('341800', '宣城市', '340000', '宣城', '118.757996', '30.945667', '2', 'tr_0 tr_340000', '16');
INSERT INTO `areas` VALUES ('341802', '宣州区', '341800', '宣州', '118.758415', '30.946003', '3', 'tr_0 tr_340000 tr_341800', '7');
INSERT INTO `areas` VALUES ('341821', '郎溪县', '341800', '郎溪', '119.18502', '31.127834', '3', 'tr_0 tr_340000 tr_341800', '5');
INSERT INTO `areas` VALUES ('341822', '广德县', '341800', '广德', '119.417519', '30.893116', '3', 'tr_0 tr_340000 tr_341800', '1');
INSERT INTO `areas` VALUES ('341823', '泾县', '341800', '泾县', '118.412399', '30.685974', '3', 'tr_0 tr_340000 tr_341800', '3');
INSERT INTO `areas` VALUES ('341824', '绩溪县', '341800', '绩溪', '118.594704', '30.065268', '3', 'tr_0 tr_340000 tr_341800', '4');
INSERT INTO `areas` VALUES ('341825', '旌德县', '341800', '旌德', '118.543083', '30.288057', '3', 'tr_0 tr_340000 tr_341800', '2');
INSERT INTO `areas` VALUES ('341881', '宁国市', '341800', '宁国', '118.983406', '30.62653', '3', 'tr_0 tr_340000 tr_341800', '6');
INSERT INTO `areas` VALUES ('350000', '福建省', '1', '福建', '119.306236', '26.075302', '1', 'tr_0', '13');
INSERT INTO `areas` VALUES ('350100', '福州市', '350000', '福州', '119.306236', '26.075302', '2', 'tr_0 tr_350000', '1');
INSERT INTO `areas` VALUES ('350102', '鼓楼区', '350100', '鼓楼', '119.299294', '26.082285', '3', 'tr_0 tr_350000 tr_350100', '4');
INSERT INTO `areas` VALUES ('350103', '台江区', '350100', '台江', '119.310158', '26.058617', '3', 'tr_0 tr_350000 tr_350100', '12');
INSERT INTO `areas` VALUES ('350104', '仓山区', '350100', '仓山', '119.320992', '26.038912', '3', 'tr_0 tr_350000 tr_350100', '1');
INSERT INTO `areas` VALUES ('350105', '马尾区', '350100', '马尾', '119.458725', '25.991976', '3', 'tr_0 tr_350000 tr_350100', '8');
INSERT INTO `areas` VALUES ('350111', '晋安区', '350100', '晋安', '119.328598', '26.078836', '3', 'tr_0 tr_350000 tr_350100', '5');
INSERT INTO `areas` VALUES ('350121', '闽侯县', '350100', '闽侯', '119.145119', '26.148567', '3', 'tr_0 tr_350000 tr_350100', '9');
INSERT INTO `areas` VALUES ('350122', '连江县', '350100', '连江', '119.538368', '26.202108', '3', 'tr_0 tr_350000 tr_350100', '6');
INSERT INTO `areas` VALUES ('350123', '罗源县', '350100', '罗源', '119.552643', '26.487234', '3', 'tr_0 tr_350000 tr_350100', '7');
INSERT INTO `areas` VALUES ('350124', '闽清县', '350100', '闽清', '118.868416', '26.223793', '3', 'tr_0 tr_350000 tr_350100', '10');
INSERT INTO `areas` VALUES ('350125', '永泰县', '350100', '永泰', '118.939087', '25.864824', '3', 'tr_0 tr_350000 tr_350100', '13');
INSERT INTO `areas` VALUES ('350128', '平潭县', '350100', '平潭', '119.791199', '25.503672', '3', 'tr_0 tr_350000 tr_350100', '11');
INSERT INTO `areas` VALUES ('350181', '福清市', '350100', '福清', '119.376991', '25.720402', '3', 'tr_0 tr_350000 tr_350100', '3');
INSERT INTO `areas` VALUES ('350182', '长乐市', '350100', '长乐', '119.510849', '25.960583', '3', 'tr_0 tr_350000 tr_350100', '2');
INSERT INTO `areas` VALUES ('350200', '厦门市', '350000', '厦门', '118.110222', '24.490475', '2', 'tr_0 tr_350000', '8');
INSERT INTO `areas` VALUES ('350203', '思明区', '350200', '思明', '118.08783', '24.462059', '3', 'tr_0 tr_350000 tr_350200', '4');
INSERT INTO `areas` VALUES ('350205', '海沧区', '350200', '海沧', '118.036362', '24.492512', '3', 'tr_0 tr_350000 tr_350200', '1');
INSERT INTO `areas` VALUES ('350206', '湖里区', '350200', '湖里', '118.109428', '24.512764', '3', 'tr_0 tr_350000 tr_350200', '2');
INSERT INTO `areas` VALUES ('350211', '集美区', '350200', '集美', '118.100868', '24.572874', '3', 'tr_0 tr_350000 tr_350200', '3');
INSERT INTO `areas` VALUES ('350212', '同安区', '350200', '同安', '118.150452', '24.729334', '3', 'tr_0 tr_350000 tr_350200', '5');
INSERT INTO `areas` VALUES ('350213', '翔安区', '350200', '翔安', '118.242813', '24.63748', '3', 'tr_0 tr_350000 tr_350200', '6');
INSERT INTO `areas` VALUES ('350300', '莆田市', '350000', '莆田', '119.007561', '25.431011', '2', 'tr_0 tr_350000', '5');
INSERT INTO `areas` VALUES ('350302', '城厢区', '350300', '城厢', '119.00103', '25.433737', '3', 'tr_0 tr_350000 tr_350300', '1');
INSERT INTO `areas` VALUES ('350303', '涵江区', '350300', '涵江', '119.119102', '25.459272', '3', 'tr_0 tr_350000 tr_350300', '2');
INSERT INTO `areas` VALUES ('350304', '荔城区', '350300', '荔城', '119.02005', '25.430046', '3', 'tr_0 tr_350000 tr_350300', '3');
INSERT INTO `areas` VALUES ('350305', '秀屿区', '350300', '秀屿', '119.092606', '25.316141', '3', 'tr_0 tr_350000 tr_350300', '5');
INSERT INTO `areas` VALUES ('350322', '仙游县', '350300', '仙游', '118.694328', '25.356529', '3', 'tr_0 tr_350000 tr_350300', '4');
INSERT INTO `areas` VALUES ('350400', '三明市', '350000', '三明', '117.635002', '26.265444', '2', 'tr_0 tr_350000', '7');
INSERT INTO `areas` VALUES ('350402', '梅列区', '350400', '梅列', '117.636871', '26.269209', '3', 'tr_0 tr_350000 tr_350400', '4');
INSERT INTO `areas` VALUES ('350403', '三元区', '350400', '三元', '117.607414', '26.234192', '3', 'tr_0 tr_350000 tr_350400', '8');
INSERT INTO `areas` VALUES ('350421', '明溪县', '350400', '明溪', '117.201843', '26.357374', '3', 'tr_0 tr_350000 tr_350400', '5');
INSERT INTO `areas` VALUES ('350423', '清流县', '350400', '清流', '116.815819', '26.17761', '3', 'tr_0 tr_350000 tr_350400', '7');
INSERT INTO `areas` VALUES ('350424', '宁化县', '350400', '宁化', '116.659721', '26.259932', '3', 'tr_0 tr_350000 tr_350400', '6');
INSERT INTO `areas` VALUES ('350425', '大田县', '350400', '大田', '117.849358', '25.690804', '3', 'tr_0 tr_350000 tr_350400', '1');
INSERT INTO `areas` VALUES ('350426', '尤溪县', '350400', '尤溪', '118.188576', '26.169262', '3', 'tr_0 tr_350000 tr_350400', '12');
INSERT INTO `areas` VALUES ('350427', '沙县', '350400', '沙县', '117.789093', '26.397362', '3', 'tr_0 tr_350000 tr_350400', '9');
INSERT INTO `areas` VALUES ('350428', '将乐县', '350400', '将乐', '117.473557', '26.728666', '3', 'tr_0 tr_350000 tr_350400', '2');
INSERT INTO `areas` VALUES ('350429', '泰宁县', '350400', '泰宁', '117.177521', '26.897995', '3', 'tr_0 tr_350000 tr_350400', '10');
INSERT INTO `areas` VALUES ('350430', '建宁县', '350400', '建宁', '116.845833', '26.831398', '3', 'tr_0 tr_350000 tr_350400', '3');
INSERT INTO `areas` VALUES ('350481', '永安市', '350400', '永安', '117.364449', '25.974075', '3', 'tr_0 tr_350000 tr_350400', '11');
INSERT INTO `areas` VALUES ('350500', '泉州市', '350000', '泉州', '118.589424', '24.908854', '2', 'tr_0 tr_350000', '6');
INSERT INTO `areas` VALUES ('350502', '鲤城区', '350500', '鲤城', '118.588928', '24.907644', '3', 'tr_0 tr_350000 tr_350500', '7');
INSERT INTO `areas` VALUES ('350503', '丰泽区', '350500', '丰泽', '118.605148', '24.896042', '3', 'tr_0 tr_350000 tr_350500', '3');
INSERT INTO `areas` VALUES ('350504', '洛江区', '350500', '洛江', '118.670311', '24.941153', '3', 'tr_0 tr_350000 tr_350500', '8');
INSERT INTO `areas` VALUES ('350505', '泉港区', '350500', '泉港', '118.912285', '25.12686', '3', 'tr_0 tr_350000 tr_350500', '10');
INSERT INTO `areas` VALUES ('350521', '惠安县', '350500', '惠安', '118.79895', '25.028719', '3', 'tr_0 tr_350000 tr_350500', '4');
INSERT INTO `areas` VALUES ('350524', '安溪县', '350500', '安溪', '118.186012', '25.056824', '3', 'tr_0 tr_350000 tr_350500', '1');
INSERT INTO `areas` VALUES ('350525', '永春县', '350500', '永春', '118.295029', '25.320721', '3', 'tr_0 tr_350000 tr_350500', '12');
INSERT INTO `areas` VALUES ('350526', '德化县', '350500', '德化', '118.242989', '25.489004', '3', 'tr_0 tr_350000 tr_350500', '2');
INSERT INTO `areas` VALUES ('350527', '金门县', '350500', '金门', '118.323219', '24.436417', '3', 'tr_0 tr_350000 tr_350500', '6');
INSERT INTO `areas` VALUES ('350581', '石狮市', '350500', '石狮', '118.628403', '24.731977', '3', 'tr_0 tr_350000 tr_350500', '11');
INSERT INTO `areas` VALUES ('350582', '晋江市', '350500', '晋江', '118.577339', '24.807322', '3', 'tr_0 tr_350000 tr_350500', '5');
INSERT INTO `areas` VALUES ('350583', '南安市', '350500', '南安', '118.387032', '24.959494', '3', 'tr_0 tr_350000 tr_350500', '9');
INSERT INTO `areas` VALUES ('350600', '漳州市', '350000', '漳州', '117.661804', '24.510897', '2', 'tr_0 tr_350000', '9');
INSERT INTO `areas` VALUES ('350602', '芗城区', '350600', '芗城', '117.656464', '24.509954', '3', 'tr_0 tr_350000 tr_350600', '8');
INSERT INTO `areas` VALUES ('350603', '龙文区', '350600', '龙文', '117.671387', '24.515656', '3', 'tr_0 tr_350000 tr_350600', '5');
INSERT INTO `areas` VALUES ('350622', '云霄县', '350600', '云霄', '117.340942', '23.950485', '3', 'tr_0 tr_350000 tr_350600', '9');
INSERT INTO `areas` VALUES ('350623', '漳浦县', '350600', '漳浦', '117.614021', '24.117907', '3', 'tr_0 tr_350000 tr_350600', '10');
INSERT INTO `areas` VALUES ('350624', '诏安县', '350600', '诏安', '117.176086', '23.710835', '3', 'tr_0 tr_350000 tr_350600', '11');
INSERT INTO `areas` VALUES ('350625', '长泰县', '350600', '长泰', '117.755913', '24.621475', '3', 'tr_0 tr_350000 tr_350600', '1');
INSERT INTO `areas` VALUES ('350626', '东山县', '350600', '东山', '117.427681', '23.702845', '3', 'tr_0 tr_350000 tr_350600', '2');
INSERT INTO `areas` VALUES ('350627', '南靖县', '350600', '南靖', '117.365463', '24.516424', '3', 'tr_0 tr_350000 tr_350600', '6');
INSERT INTO `areas` VALUES ('350628', '平和县', '350600', '平和', '117.313545', '24.366158', '3', 'tr_0 tr_350000 tr_350600', '7');
INSERT INTO `areas` VALUES ('350629', '华安县', '350600', '华安', '117.536308', '25.001415', '3', 'tr_0 tr_350000 tr_350600', '3');
INSERT INTO `areas` VALUES ('350681', '龙海市', '350600', '龙海', '117.817291', '24.445341', '3', 'tr_0 tr_350000 tr_350600', '4');
INSERT INTO `areas` VALUES ('350700', '南平市', '350000', '南平', '118.178459', '26.635628', '2', 'tr_0 tr_350000', '3');
INSERT INTO `areas` VALUES ('350702', '延平区', '350700', '延平', '118.178917', '26.63608', '3', 'tr_0 tr_350000 tr_350700', '9');
INSERT INTO `areas` VALUES ('350721', '顺昌县', '350700', '顺昌', '117.807709', '26.79285', '3', 'tr_0 tr_350000 tr_350700', '6');
INSERT INTO `areas` VALUES ('350722', '浦城县', '350700', '浦城', '118.536819', '27.920412', '3', 'tr_0 tr_350000 tr_350700', '4');
INSERT INTO `areas` VALUES ('350723', '光泽县', '350700', '光泽', '117.337898', '27.542803', '3', 'tr_0 tr_350000 tr_350700', '1');
INSERT INTO `areas` VALUES ('350724', '松溪县', '350700', '松溪', '118.783493', '27.525785', '3', 'tr_0 tr_350000 tr_350700', '7');
INSERT INTO `areas` VALUES ('350725', '政和县', '350700', '政和', '118.858658', '27.365398', '3', 'tr_0 tr_350000 tr_350700', '10');
INSERT INTO `areas` VALUES ('350781', '邵武市', '350700', '邵武', '117.491547', '27.337952', '3', 'tr_0 tr_350000 tr_350700', '5');
INSERT INTO `areas` VALUES ('350782', '武夷山市', '350700', '武夷山', '118.032799', '27.751734', '3', 'tr_0 tr_350000 tr_350700', '8');
INSERT INTO `areas` VALUES ('350783', '建瓯市', '350700', '建瓯', '118.321762', '27.035021', '3', 'tr_0 tr_350000 tr_350700', '2');
INSERT INTO `areas` VALUES ('350784', '建阳市', '350700', '建阳', '118.122673', '27.332067', '3', 'tr_0 tr_350000 tr_350700', '3');
INSERT INTO `areas` VALUES ('350800', '龙岩市', '350000', '龙岩', '117.029778', '25.091602', '2', 'tr_0 tr_350000', '2');
INSERT INTO `areas` VALUES ('350802', '新罗区', '350800', '新罗', '117.030724', '25.091801', '3', 'tr_0 tr_350000 tr_350800', '5');
INSERT INTO `areas` VALUES ('350821', '长汀县', '350800', '长汀', '116.361008', '25.842278', '3', 'tr_0 tr_350000 tr_350800', '1');
INSERT INTO `areas` VALUES ('350822', '永定县', '350800', '永定', '116.732689', '24.720442', '3', 'tr_0 tr_350000 tr_350800', '6');
INSERT INTO `areas` VALUES ('350823', '上杭县', '350800', '上杭', '116.424774', '25.050018', '3', 'tr_0 tr_350000 tr_350800', '3');
INSERT INTO `areas` VALUES ('350824', '武平县', '350800', '武平', '116.100929', '25.08865', '3', 'tr_0 tr_350000 tr_350800', '4');
INSERT INTO `areas` VALUES ('350825', '连城县', '350800', '连城', '116.756683', '25.708506', '3', 'tr_0 tr_350000 tr_350800', '2');
INSERT INTO `areas` VALUES ('350881', '漳平市', '350800', '漳平', '117.420731', '25.291597', '3', 'tr_0 tr_350000 tr_350800', '7');
INSERT INTO `areas` VALUES ('350900', '宁德市', '350000', '宁德', '119.527084', '26.659241', '2', 'tr_0 tr_350000', '4');
INSERT INTO `areas` VALUES ('350902', '蕉城区', '350900', '蕉城', '119.527222', '26.659252', '3', 'tr_0 tr_350000 tr_350900', '4');
INSERT INTO `areas` VALUES ('350921', '霞浦县', '350900', '霞浦', '120.005211', '26.882069', '3', 'tr_0 tr_350000 tr_350900', '7');
INSERT INTO `areas` VALUES ('350922', '古田县', '350900', '古田', '118.743156', '26.577492', '3', 'tr_0 tr_350000 tr_350900', '3');
INSERT INTO `areas` VALUES ('350923', '屏南县', '350900', '屏南', '118.987541', '26.910826', '3', 'tr_0 tr_350000 tr_350900', '5');
INSERT INTO `areas` VALUES ('350924', '寿宁县', '350900', '寿宁', '119.506737', '27.457798', '3', 'tr_0 tr_350000 tr_350900', '6');
INSERT INTO `areas` VALUES ('350925', '周宁县', '350900', '周宁', '119.338242', '27.103106', '3', 'tr_0 tr_350000 tr_350900', '9');
INSERT INTO `areas` VALUES ('350926', '柘荣县', '350900', '柘荣', '119.898224', '27.236162', '3', 'tr_0 tr_350000 tr_350900', '8');
INSERT INTO `areas` VALUES ('350981', '福安市', '350900', '福安', '119.650795', '27.084246', '3', 'tr_0 tr_350000 tr_350900', '1');
INSERT INTO `areas` VALUES ('350982', '福鼎市', '350900', '福鼎', '120.219765', '27.318884', '3', 'tr_0 tr_350000 tr_350900', '2');
INSERT INTO `areas` VALUES ('360000', '江西省', '1', '江西', '115.892151', '28.676493', '1', 'tr_0', '14');
INSERT INTO `areas` VALUES ('360100', '南昌市', '360000', '南昌', '115.892151', '28.676493', '2', 'tr_0 tr_360000', '6');
INSERT INTO `areas` VALUES ('360102', '东湖区', '360100', '东湖', '115.889671', '28.682987', '3', 'tr_0 tr_360000 tr_360100', '2');
INSERT INTO `areas` VALUES ('360103', '西湖区', '360100', '西湖', '115.910652', '28.662901', '3', 'tr_0 tr_360000 tr_360100', '8');
INSERT INTO `areas` VALUES ('360104', '青云谱区', '360100', '青云谱', '115.907295', '28.635723', '3', 'tr_0 tr_360000 tr_360100', '6');
INSERT INTO `areas` VALUES ('360105', '湾里区', '360100', '湾里', '115.731323', '28.714804', '3', 'tr_0 tr_360000 tr_360100', '7');
INSERT INTO `areas` VALUES ('360111', '青山湖区', '360100', '青山湖', '115.949043', '28.689293', '3', 'tr_0 tr_360000 tr_360100', '5');
INSERT INTO `areas` VALUES ('360121', '南昌县', '360100', '南昌', '115.942467', '28.543781', '3', 'tr_0 tr_360000 tr_360100', '4');
INSERT INTO `areas` VALUES ('360122', '新建县', '360100', '新建', '115.820808', '28.690788', '3', 'tr_0 tr_360000 tr_360100', '9');
INSERT INTO `areas` VALUES ('360123', '安义县', '360100', '安义', '115.553108', '28.841333', '3', 'tr_0 tr_360000 tr_360100', '1');
INSERT INTO `areas` VALUES ('360124', '进贤县', '360100', '进贤', '116.26767', '28.365681', '3', 'tr_0 tr_360000 tr_360100', '3');
INSERT INTO `areas` VALUES ('360200', '景德镇市', '360000', '景德镇', '117.214661', '29.292561', '2', 'tr_0 tr_360000', '4');
INSERT INTO `areas` VALUES ('360202', '昌江区', '360200', '昌江', '117.195023', '29.288465', '3', 'tr_0 tr_360000 tr_360200', '1');
INSERT INTO `areas` VALUES ('360203', '珠山区', '360200', '珠山', '117.214813', '29.292812', '3', 'tr_0 tr_360000 tr_360200', '4');
INSERT INTO `areas` VALUES ('360222', '浮梁县', '360200', '浮梁', '117.217613', '29.352251', '3', 'tr_0 tr_360000 tr_360200', '2');
INSERT INTO `areas` VALUES ('360281', '乐平市', '360200', '乐平', '117.129379', '28.967361', '3', 'tr_0 tr_360000 tr_360200', '3');
INSERT INTO `areas` VALUES ('360300', '萍乡市', '360000', '萍乡', '113.852188', '27.622946', '2', 'tr_0 tr_360000', '7');
INSERT INTO `areas` VALUES ('360302', '安源区', '360300', '安源', '113.855042', '27.625826', '3', 'tr_0 tr_360000 tr_360300', '1');
INSERT INTO `areas` VALUES ('360313', '湘东区', '360300', '湘东', '113.745598', '27.639318', '3', 'tr_0 tr_360000 tr_360300', '5');
INSERT INTO `areas` VALUES ('360321', '莲花县', '360300', '莲花', '113.955582', '27.127808', '3', 'tr_0 tr_360000 tr_360300', '2');
INSERT INTO `areas` VALUES ('360322', '上栗县', '360300', '上栗', '113.800522', '27.877041', '3', 'tr_0 tr_360000 tr_360300', '4');
INSERT INTO `areas` VALUES ('360323', '芦溪县', '360300', '芦溪', '114.041206', '27.633633', '3', 'tr_0 tr_360000 tr_360300', '3');
INSERT INTO `areas` VALUES ('360400', '九江市', '360000', '九江', '115.992813', '29.712034', '2', 'tr_0 tr_360000', '5');
INSERT INTO `areas` VALUES ('360402', '庐山区', '360400', '庐山', '115.99012', '29.676174', '3', 'tr_0 tr_360000 tr_360400', '6');
INSERT INTO `areas` VALUES ('360403', '浔阳区', '360400', '浔阳', '115.995949', '29.724649', '3', 'tr_0 tr_360000 tr_360400', '12');
INSERT INTO `areas` VALUES ('360421', '九江县', '360400', '九江', '115.892975', '29.610264', '3', 'tr_0 tr_360000 tr_360400', '5');
INSERT INTO `areas` VALUES ('360423', '武宁县', '360400', '武宁', '115.105644', '29.260181', '3', 'tr_0 tr_360000 tr_360400', '9');
INSERT INTO `areas` VALUES ('360424', '修水县', '360400', '修水', '114.573425', '29.032728', '3', 'tr_0 tr_360000 tr_360400', '11');
INSERT INTO `areas` VALUES ('360425', '永修县', '360400', '永修', '115.809052', '29.018211', '3', 'tr_0 tr_360000 tr_360400', '13');
INSERT INTO `areas` VALUES ('360426', '德安县', '360400', '德安', '115.762611', '29.327475', '3', 'tr_0 tr_360000 tr_360400', '1');
INSERT INTO `areas` VALUES ('360427', '星子县', '360400', '星子', '116.043739', '29.456169', '3', 'tr_0 tr_360000 tr_360400', '10');
INSERT INTO `areas` VALUES ('360428', '都昌县', '360400', '都昌', '116.205116', '29.275105', '3', 'tr_0 tr_360000 tr_360400', '2');
INSERT INTO `areas` VALUES ('360429', '湖口县', '360400', '湖口', '116.244316', '29.726299', '3', 'tr_0 tr_360000 tr_360400', '4');
INSERT INTO `areas` VALUES ('360430', '彭泽县', '360400', '彭泽', '116.55584', '29.898865', '3', 'tr_0 tr_360000 tr_360400', '7');
INSERT INTO `areas` VALUES ('360481', '瑞昌市', '360400', '瑞昌', '115.669083', '29.6766', '3', 'tr_0 tr_360000 tr_360400', '8');
INSERT INTO `areas` VALUES ('360483', '共青城市', '360400', '共青城', '115.80571', '29.247885', '3', 'tr_0 tr_360000 tr_360400', '3');
INSERT INTO `areas` VALUES ('360500', '新余市', '360000', '新余', '114.930832', '27.810835', '2', 'tr_0 tr_360000', '9');
INSERT INTO `areas` VALUES ('360502', '渝水区', '360500', '渝水', '114.92392', '27.819172', '3', 'tr_0 tr_360000 tr_360500', '2');
INSERT INTO `areas` VALUES ('360521', '分宜县', '360500', '分宜', '114.675262', '27.8113', '3', 'tr_0 tr_360000 tr_360500', '1');
INSERT INTO `areas` VALUES ('360600', '鹰潭市', '360000', '鹰潭', '117.033836', '28.238638', '2', 'tr_0 tr_360000', '11');
INSERT INTO `areas` VALUES ('360602', '月湖区', '360600', '月湖', '117.034111', '28.239077', '3', 'tr_0 tr_360000 tr_360600', '2');
INSERT INTO `areas` VALUES ('360622', '余江县', '360600', '余江', '116.822762', '28.206177', '3', 'tr_0 tr_360000 tr_360600', '3');
INSERT INTO `areas` VALUES ('360681', '贵溪市', '360600', '贵溪', '117.212105', '28.283693', '3', 'tr_0 tr_360000 tr_360600', '1');
INSERT INTO `areas` VALUES ('360700', '赣州市', '360000', '赣州', '114.940277', '25.850969', '2', 'tr_0 tr_360000', '2');
INSERT INTO `areas` VALUES ('360702', '章贡区', '360700', '章贡', '114.938721', '25.851368', '3', 'tr_0 tr_360000 tr_360700', '18');
INSERT INTO `areas` VALUES ('360721', '赣县', '360700', '赣县', '115.018463', '25.865433', '3', 'tr_0 tr_360000 tr_360700', '5');
INSERT INTO `areas` VALUES ('360722', '信丰县', '360700', '信丰', '114.930893', '25.38023', '3', 'tr_0 tr_360000 tr_360700', '13');
INSERT INTO `areas` VALUES ('360723', '大余县', '360700', '大余', '114.362244', '25.395937', '3', 'tr_0 tr_360000 tr_360700', '3');
INSERT INTO `areas` VALUES ('360724', '上犹县', '360700', '上犹', '114.540535', '25.794285', '3', 'tr_0 tr_360000 tr_360700', '12');
INSERT INTO `areas` VALUES ('360725', '崇义县', '360700', '崇义', '114.30735', '25.68791', '3', 'tr_0 tr_360000 tr_360700', '2');
INSERT INTO `areas` VALUES ('360726', '安远县', '360700', '安远', '115.392326', '25.13459', '3', 'tr_0 tr_360000 tr_360700', '1');
INSERT INTO `areas` VALUES ('360727', '龙南县', '360700', '龙南', '114.792656', '24.90476', '3', 'tr_0 tr_360000 tr_360700', '7');
INSERT INTO `areas` VALUES ('360728', '定南县', '360700', '定南', '115.032669', '24.774277', '3', 'tr_0 tr_360000 tr_360700', '4');
INSERT INTO `areas` VALUES ('360729', '全南县', '360700', '全南', '114.531586', '24.742651', '3', 'tr_0 tr_360000 tr_360700', '10');
INSERT INTO `areas` VALUES ('360730', '宁都县', '360700', '宁都', '116.018784', '26.472054', '3', 'tr_0 tr_360000 tr_360700', '9');
INSERT INTO `areas` VALUES ('360731', '于都县', '360700', '于都', '115.411201', '25.955032', '3', 'tr_0 tr_360000 tr_360700', '17');
INSERT INTO `areas` VALUES ('360732', '兴国县', '360700', '兴国', '115.351898', '26.330488', '3', 'tr_0 tr_360000 tr_360700', '15');
INSERT INTO `areas` VALUES ('360733', '会昌县', '360700', '会昌', '115.791161', '25.599125', '3', 'tr_0 tr_360000 tr_360700', '6');
INSERT INTO `areas` VALUES ('360734', '寻乌县', '360700', '寻乌', '115.651398', '24.954136', '3', 'tr_0 tr_360000 tr_360700', '16');
INSERT INTO `areas` VALUES ('360735', '石城县', '360700', '石城', '116.342247', '26.326582', '3', 'tr_0 tr_360000 tr_360700', '14');
INSERT INTO `areas` VALUES ('360781', '瑞金市', '360700', '瑞金', '116.034851', '25.875278', '3', 'tr_0 tr_360000 tr_360700', '11');
INSERT INTO `areas` VALUES ('360782', '南康市', '360700', '南康', '114.756935', '25.66172', '3', 'tr_0 tr_360000 tr_360700', '8');
INSERT INTO `areas` VALUES ('360800', '吉安市', '360000', '吉安', '114.986374', '27.111698', '2', 'tr_0 tr_360000', '3');
INSERT INTO `areas` VALUES ('360802', '吉州区', '360800', '吉州', '114.987328', '27.112368', '3', 'tr_0 tr_360000 tr_360800', '5');
INSERT INTO `areas` VALUES ('360803', '青原区', '360800', '青原', '115.016304', '27.105879', '3', 'tr_0 tr_360000 tr_360800', '6');
INSERT INTO `areas` VALUES ('360821', '吉安县', '360800', '吉安', '114.905113', '27.040043', '3', 'tr_0 tr_360000 tr_360800', '2');
INSERT INTO `areas` VALUES ('360822', '吉水县', '360800', '吉水', '115.134567', '27.213446', '3', 'tr_0 tr_360000 tr_360800', '4');
INSERT INTO `areas` VALUES ('360823', '峡江县', '360800', '峡江', '115.319328', '27.580862', '3', 'tr_0 tr_360000 tr_360800', '10');
INSERT INTO `areas` VALUES ('360824', '新干县', '360800', '新干', '115.399292', '27.755758', '3', 'tr_0 tr_360000 tr_360800', '11');
INSERT INTO `areas` VALUES ('360825', '永丰县', '360800', '永丰', '115.435562', '27.321087', '3', 'tr_0 tr_360000 tr_360800', '12');
INSERT INTO `areas` VALUES ('360826', '泰和县', '360800', '泰和', '114.90139', '26.790165', '3', 'tr_0 tr_360000 tr_360800', '8');
INSERT INTO `areas` VALUES ('360827', '遂川县', '360800', '遂川', '114.516891', '26.323706', '3', 'tr_0 tr_360000 tr_360800', '7');
INSERT INTO `areas` VALUES ('360828', '万安县', '360800', '万安', '114.784691', '26.462086', '3', 'tr_0 tr_360000 tr_360800', '9');
INSERT INTO `areas` VALUES ('360829', '安福县', '360800', '安福', '114.613838', '27.382746', '3', 'tr_0 tr_360000 tr_360800', '1');
INSERT INTO `areas` VALUES ('360830', '永新县', '360800', '永新', '114.242531', '26.944721', '3', 'tr_0 tr_360000 tr_360800', '13');
INSERT INTO `areas` VALUES ('360881', '井冈山市', '360800', '井冈山', '114.284424', '26.745918', '3', 'tr_0 tr_360000 tr_360800', '3');
INSERT INTO `areas` VALUES ('360900', '宜春市', '360000', '宜春', '114.391136', '27.8043', '2', 'tr_0 tr_360000', '10');
INSERT INTO `areas` VALUES ('360902', '袁州区', '360900', '袁州', '114.387383', '27.800117', '3', 'tr_0 tr_360000 tr_360900', '9');
INSERT INTO `areas` VALUES ('360921', '奉新县', '360900', '奉新', '115.3899', '28.700672', '3', 'tr_0 tr_360000 tr_360900', '2');
INSERT INTO `areas` VALUES ('360922', '万载县', '360900', '万载', '114.449013', '28.104528', '3', 'tr_0 tr_360000 tr_360900', '7');
INSERT INTO `areas` VALUES ('360923', '上高县', '360900', '上高', '114.932655', '28.234789', '3', 'tr_0 tr_360000 tr_360900', '5');
INSERT INTO `areas` VALUES ('360924', '宜丰县', '360900', '宜丰', '114.787384', '28.388288', '3', 'tr_0 tr_360000 tr_360900', '8');
INSERT INTO `areas` VALUES ('360925', '靖安县', '360900', '靖安', '115.361748', '28.86054', '3', 'tr_0 tr_360000 tr_360900', '4');
INSERT INTO `areas` VALUES ('360926', '铜鼓县', '360900', '铜鼓', '114.37014', '28.520956', '3', 'tr_0 tr_360000 tr_360900', '6');
INSERT INTO `areas` VALUES ('360981', '丰城市', '360900', '丰城', '115.786003', '28.191584', '3', 'tr_0 tr_360000 tr_360900', '1');
INSERT INTO `areas` VALUES ('360982', '樟树市', '360900', '樟树', '115.543388', '28.055899', '3', 'tr_0 tr_360000 tr_360900', '10');
INSERT INTO `areas` VALUES ('360983', '高安市', '360900', '高安', '115.381531', '28.420952', '3', 'tr_0 tr_360000 tr_360900', '3');
INSERT INTO `areas` VALUES ('361000', '抚州市', '360000', '抚州', '116.358353', '27.98385', '2', 'tr_0 tr_360000', '1');
INSERT INTO `areas` VALUES ('361002', '临川区', '361000', '临川', '116.361404', '27.981918', '3', 'tr_0 tr_360000 tr_361000', '7');
INSERT INTO `areas` VALUES ('361021', '南城县', '361000', '南城', '116.63945', '27.555309', '3', 'tr_0 tr_360000 tr_361000', '8');
INSERT INTO `areas` VALUES ('361022', '黎川县', '361000', '黎川', '116.914574', '27.292561', '3', 'tr_0 tr_360000 tr_361000', '6');
INSERT INTO `areas` VALUES ('361023', '南丰县', '361000', '南丰', '116.532997', '27.210133', '3', 'tr_0 tr_360000 tr_361000', '9');
INSERT INTO `areas` VALUES ('361024', '崇仁县', '361000', '崇仁', '116.059113', '27.760906', '3', 'tr_0 tr_360000 tr_361000', '1');
INSERT INTO `areas` VALUES ('361025', '乐安县', '361000', '乐安', '115.838432', '27.420101', '3', 'tr_0 tr_360000 tr_361000', '5');
INSERT INTO `areas` VALUES ('361026', '宜黄县', '361000', '宜黄', '116.223022', '27.546513', '3', 'tr_0 tr_360000 tr_361000', '10');
INSERT INTO `areas` VALUES ('361027', '金溪县', '361000', '金溪', '116.778748', '27.907387', '3', 'tr_0 tr_360000 tr_361000', '4');
INSERT INTO `areas` VALUES ('361028', '资溪县', '361000', '资溪', '117.066093', '27.70653', '3', 'tr_0 tr_360000 tr_361000', '11');
INSERT INTO `areas` VALUES ('361029', '东乡县', '361000', '东乡', '116.605339', '28.2325', '3', 'tr_0 tr_360000 tr_361000', '2');
INSERT INTO `areas` VALUES ('361030', '广昌县', '361000', '广昌', '116.327293', '26.838427', '3', 'tr_0 tr_360000 tr_361000', '3');
INSERT INTO `areas` VALUES ('361100', '上饶市', '360000', '上饶', '117.971184', '28.44442', '2', 'tr_0 tr_360000', '8');
INSERT INTO `areas` VALUES ('361102', '信州区', '361100', '信州', '117.97052', '28.445377', '3', 'tr_0 tr_360000 tr_361100', '6');
INSERT INTO `areas` VALUES ('361121', '上饶县', '361100', '上饶', '117.90612', '28.453897', '3', 'tr_0 tr_360000 tr_361100', '5');
INSERT INTO `areas` VALUES ('361122', '广丰县', '361100', '广丰', '118.18985', '28.440285', '3', 'tr_0 tr_360000 tr_361100', '2');
INSERT INTO `areas` VALUES ('361123', '玉山县', '361100', '玉山', '118.244408', '28.673479', '3', 'tr_0 tr_360000 tr_361100', '12');
INSERT INTO `areas` VALUES ('361124', '铅山县', '361100', '铅山', '117.711906', '28.310892', '3', 'tr_0 tr_360000 tr_361100', '9');
INSERT INTO `areas` VALUES ('361125', '横峰县', '361100', '横峰', '117.608246', '28.415104', '3', 'tr_0 tr_360000 tr_361100', '3');
INSERT INTO `areas` VALUES ('361126', '弋阳县', '361100', '弋阳', '117.435005', '28.402391', '3', 'tr_0 tr_360000 tr_361100', '10');
INSERT INTO `areas` VALUES ('361127', '余干县', '361100', '余干', '116.691071', '28.69173', '3', 'tr_0 tr_360000 tr_361100', '11');
INSERT INTO `areas` VALUES ('361128', '鄱阳县', '361100', '鄱阳', '116.673744', '28.993374', '3', 'tr_0 tr_360000 tr_361100', '4');
INSERT INTO `areas` VALUES ('361129', '万年县', '361100', '万年', '117.070152', '28.692589', '3', 'tr_0 tr_360000 tr_361100', '7');
INSERT INTO `areas` VALUES ('361130', '婺源县', '361100', '婺源', '117.86219', '29.254015', '3', 'tr_0 tr_360000 tr_361100', '8');
INSERT INTO `areas` VALUES ('361181', '德兴市', '361100', '德兴', '117.578735', '28.945034', '3', 'tr_0 tr_360000 tr_361100', '1');
INSERT INTO `areas` VALUES ('370000', '山东省', '1', '山东', '117.000923', '36.675808', '1', 'tr_0', '15');
INSERT INTO `areas` VALUES ('370100', '济南市', '370000', '济南', '117.000923', '36.675808', '2', 'tr_0 tr_370000', '5');
INSERT INTO `areas` VALUES ('370102', '历下区', '370100', '历下', '117.03862', '36.664169', '3', 'tr_0 tr_370000 tr_370100', '5');
INSERT INTO `areas` VALUES ('370103', '市中区', '370100', '市中', '116.998978', '36.657352', '3', 'tr_0 tr_370000 tr_370100', '8');
INSERT INTO `areas` VALUES ('370104', '槐荫区', '370100', '槐荫', '116.947922', '36.668205', '3', 'tr_0 tr_370000 tr_370100', '2');
INSERT INTO `areas` VALUES ('370105', '天桥区', '370100', '天桥', '116.996086', '36.693375', '3', 'tr_0 tr_370000 tr_370100', '9');
INSERT INTO `areas` VALUES ('370112', '历城区', '370100', '历城', '117.063744', '36.681744', '3', 'tr_0 tr_370000 tr_370100', '4');
INSERT INTO `areas` VALUES ('370113', '长清区', '370100', '长清', '116.74588', '36.56105', '3', 'tr_0 tr_370000 tr_370100', '1');
INSERT INTO `areas` VALUES ('370124', '平阴县', '370100', '平阴', '116.455055', '36.286922', '3', 'tr_0 tr_370000 tr_370100', '6');
INSERT INTO `areas` VALUES ('370125', '济阳县', '370100', '济阳', '117.176033', '36.976772', '3', 'tr_0 tr_370000 tr_370100', '3');
INSERT INTO `areas` VALUES ('370126', '商河县', '370100', '商河', '117.156372', '37.310543', '3', 'tr_0 tr_370000 tr_370100', '7');
INSERT INTO `areas` VALUES ('370181', '章丘市', '370100', '章丘', '117.540688', '36.71209', '3', 'tr_0 tr_370000 tr_370100', '10');
INSERT INTO `areas` VALUES ('370200', '青岛市', '370000', '青岛', '120.355171', '36.082981', '2', 'tr_0 tr_370000', '10');
INSERT INTO `areas` VALUES ('370202', '市南区', '370200', '市南', '120.395966', '36.070892', '3', 'tr_0 tr_370000 tr_370200', '10');
INSERT INTO `areas` VALUES ('370203', '市北区', '370200', '市北', '120.355026', '36.08382', '3', 'tr_0 tr_370000 tr_370200', '9');
INSERT INTO `areas` VALUES ('370211', '黄岛区', '370200', '黄岛', '119.995522', '35.875137', '3', 'tr_0 tr_370000 tr_370200', '2');
INSERT INTO `areas` VALUES ('370212', '崂山区', '370200', '崂山', '120.467392', '36.10257', '3', 'tr_0 tr_370000 tr_370200', '6');
INSERT INTO `areas` VALUES ('370213', '李沧区', '370200', '李沧', '120.421234', '36.160023', '3', 'tr_0 tr_370000 tr_370200', '7');
INSERT INTO `areas` VALUES ('370214', '城阳区', '370200', '城阳', '120.389137', '36.306831', '3', 'tr_0 tr_370000 tr_370200', '1');
INSERT INTO `areas` VALUES ('370281', '胶州市', '370200', '胶州', '120.006203', '36.285877', '3', 'tr_0 tr_370000 tr_370200', '3');
INSERT INTO `areas` VALUES ('370282', '即墨市', '370200', '即墨', '120.44735', '36.390846', '3', 'tr_0 tr_370000 tr_370200', '4');
INSERT INTO `areas` VALUES ('370283', '平度市', '370200', '平度', '119.959015', '36.78883', '3', 'tr_0 tr_370000 tr_370200', '8');
INSERT INTO `areas` VALUES ('370285', '莱西市', '370200', '莱西', '120.526222', '36.865089', '3', 'tr_0 tr_370000 tr_370200', '5');
INSERT INTO `areas` VALUES ('370300', '淄博市', '370000', '淄博', '118.047646', '36.814938', '2', 'tr_0 tr_370000', '17');
INSERT INTO `areas` VALUES ('370302', '淄川区', '370300', '淄川', '117.967697', '36.64727', '3', 'tr_0 tr_370000 tr_370300', '8');
INSERT INTO `areas` VALUES ('370303', '张店区', '370300', '张店', '118.05352', '36.807049', '3', 'tr_0 tr_370000 tr_370300', '6');
INSERT INTO `areas` VALUES ('370304', '博山区', '370300', '博山', '117.858231', '36.497566', '3', 'tr_0 tr_370000 tr_370300', '1');
INSERT INTO `areas` VALUES ('370305', '临淄区', '370300', '临淄', '118.306015', '36.816658', '3', 'tr_0 tr_370000 tr_370300', '4');
INSERT INTO `areas` VALUES ('370306', '周村区', '370300', '周村', '117.851036', '36.803699', '3', 'tr_0 tr_370000 tr_370300', '7');
INSERT INTO `areas` VALUES ('370321', '桓台县', '370300', '桓台', '118.101555', '36.959774', '3', 'tr_0 tr_370000 tr_370300', '3');
INSERT INTO `areas` VALUES ('370322', '高青县', '370300', '高青', '117.829842', '37.169582', '3', 'tr_0 tr_370000 tr_370300', '2');
INSERT INTO `areas` VALUES ('370323', '沂源县', '370300', '沂源', '118.166161', '36.186283', '3', 'tr_0 tr_370000 tr_370300', '5');
INSERT INTO `areas` VALUES ('370400', '枣庄市', '370000', '枣庄', '117.557961', '34.856422', '2', 'tr_0 tr_370000', '16');
INSERT INTO `areas` VALUES ('370402', '市中区', '370400', '市中', '117.557281', '34.856651', '3', 'tr_0 tr_370000 tr_370400', '2');
INSERT INTO `areas` VALUES ('370403', '薛城区', '370400', '薛城', '117.265289', '34.79789', '3', 'tr_0 tr_370000 tr_370400', '5');
INSERT INTO `areas` VALUES ('370404', '峄城区', '370400', '峄城', '117.586319', '34.767712', '3', 'tr_0 tr_370000 tr_370400', '6');
INSERT INTO `areas` VALUES ('370405', '台儿庄区', '370400', '台儿庄', '117.734749', '34.564816', '3', 'tr_0 tr_370000 tr_370400', '3');
INSERT INTO `areas` VALUES ('370406', '山亭区', '370400', '山亭', '117.458969', '35.096077', '3', 'tr_0 tr_370000 tr_370400', '1');
INSERT INTO `areas` VALUES ('370481', '滕州市', '370400', '滕州', '117.162102', '35.088497', '3', 'tr_0 tr_370000 tr_370400', '4');
INSERT INTO `areas` VALUES ('370500', '东营市', '370000', '东营', '118.664711', '37.434563', '2', 'tr_0 tr_370000', '3');
INSERT INTO `areas` VALUES ('370502', '东营区', '370500', '东营', '118.507545', '37.461567', '3', 'tr_0 tr_370000 tr_370500', '1');
INSERT INTO `areas` VALUES ('370503', '河口区', '370500', '河口', '118.52961', '37.886017', '3', 'tr_0 tr_370000 tr_370500', '3');
INSERT INTO `areas` VALUES ('370521', '垦利县', '370500', '垦利', '118.551315', '37.58868', '3', 'tr_0 tr_370000 tr_370500', '4');
INSERT INTO `areas` VALUES ('370522', '利津县', '370500', '利津', '118.248856', '37.493366', '3', 'tr_0 tr_370000 tr_370500', '5');
INSERT INTO `areas` VALUES ('370523', '广饶县', '370500', '广饶', '118.407524', '37.051609', '3', 'tr_0 tr_370000 tr_370500', '2');
INSERT INTO `areas` VALUES ('370600', '烟台市', '370000', '烟台', '121.39138', '37.539295', '2', 'tr_0 tr_370000', '15');
INSERT INTO `areas` VALUES ('370602', '芝罘区', '370600', '芝罘', '121.38588', '37.540924', '3', 'tr_0 tr_370000 tr_370600', '12');
INSERT INTO `areas` VALUES ('370611', '福山区', '370600', '福山', '121.26474', '37.496876', '3', 'tr_0 tr_370000 tr_370600', '2');
INSERT INTO `areas` VALUES ('370612', '牟平区', '370600', '牟平', '121.601509', '37.388355', '3', 'tr_0 tr_370000 tr_370600', '8');
INSERT INTO `areas` VALUES ('370613', '莱山区', '370600', '莱山', '121.448868', '37.473549', '3', 'tr_0 tr_370000 tr_370600', '4');
INSERT INTO `areas` VALUES ('370634', '长岛县', '370600', '长岛', '120.738342', '37.916195', '3', 'tr_0 tr_370000 tr_370600', '1');
INSERT INTO `areas` VALUES ('370681', '龙口市', '370600', '龙口', '120.528328', '37.648445', '3', 'tr_0 tr_370000 tr_370600', '7');
INSERT INTO `areas` VALUES ('370682', '莱阳市', '370600', '莱阳', '120.711151', '36.977036', '3', 'tr_0 tr_370000 tr_370600', '5');
INSERT INTO `areas` VALUES ('370683', '莱州市', '370600', '莱州', '119.942139', '37.182724', '3', 'tr_0 tr_370000 tr_370600', '6');
INSERT INTO `areas` VALUES ('370684', '蓬莱市', '370600', '蓬莱', '120.762688', '37.811169', '3', 'tr_0 tr_370000 tr_370600', '9');
INSERT INTO `areas` VALUES ('370685', '招远市', '370600', '招远', '120.403145', '37.364918', '3', 'tr_0 tr_370000 tr_370600', '11');
INSERT INTO `areas` VALUES ('370686', '栖霞市', '370600', '栖霞', '120.834099', '37.305855', '3', 'tr_0 tr_370000 tr_370600', '10');
INSERT INTO `areas` VALUES ('370687', '海阳市', '370600', '海阳', '121.168388', '36.780659', '3', 'tr_0 tr_370000 tr_370600', '3');
INSERT INTO `areas` VALUES ('370700', '潍坊市', '370000', '潍坊', '119.107079', '36.709251', '2', 'tr_0 tr_370000', '13');
INSERT INTO `areas` VALUES ('370702', '潍城区', '370700', '潍城', '119.103783', '36.71006', '3', 'tr_0 tr_370000 tr_370700', '11');
INSERT INTO `areas` VALUES ('370703', '寒亭区', '370700', '寒亭', '119.207863', '36.772102', '3', 'tr_0 tr_370000 tr_370700', '6');
INSERT INTO `areas` VALUES ('370704', '坊子区', '370700', '坊子', '119.166328', '36.654617', '3', 'tr_0 tr_370000 tr_370700', '4');
INSERT INTO `areas` VALUES ('370705', '奎文区', '370700', '奎文', '119.13736', '36.709496', '3', 'tr_0 tr_370000 tr_370700', '7');
INSERT INTO `areas` VALUES ('370724', '临朐县', '370700', '临朐', '118.539879', '36.516373', '3', 'tr_0 tr_370000 tr_370700', '8');
INSERT INTO `areas` VALUES ('370725', '昌乐县', '370700', '昌乐', '118.839996', '36.703255', '3', 'tr_0 tr_370000 tr_370700', '2');
INSERT INTO `areas` VALUES ('370781', '青州市', '370700', '青州', '118.484695', '36.697857', '3', 'tr_0 tr_370000 tr_370700', '9');
INSERT INTO `areas` VALUES ('370782', '诸城市', '370700', '诸城', '119.403183', '35.997093', '3', 'tr_0 tr_370000 tr_370700', '12');
INSERT INTO `areas` VALUES ('370783', '寿光市', '370700', '寿光', '118.73645', '36.874413', '3', 'tr_0 tr_370000 tr_370700', '10');
INSERT INTO `areas` VALUES ('370784', '安丘市', '370700', '安丘', '119.206886', '36.427418', '3', 'tr_0 tr_370000 tr_370700', '1');
INSERT INTO `areas` VALUES ('370785', '高密市', '370700', '高密', '119.757034', '36.377541', '3', 'tr_0 tr_370000 tr_370700', '5');
INSERT INTO `areas` VALUES ('370786', '昌邑市', '370700', '昌邑', '119.394501', '36.854939', '3', 'tr_0 tr_370000 tr_370700', '3');
INSERT INTO `areas` VALUES ('370800', '济宁市', '370000', '济宁', '116.587242', '35.415394', '2', 'tr_0 tr_370000', '6');
INSERT INTO `areas` VALUES ('370802', '市中区', '370800', '市中', '116.587242', '35.415394', '3', 'tr_0 tr_370000 tr_370800', '6');
INSERT INTO `areas` VALUES ('370811', '任城区', '370800', '任城', '116.63102', '35.431835', '3', 'tr_0 tr_370000 tr_370800', '5');
INSERT INTO `areas` VALUES ('370826', '微山县', '370800', '微山', '117.128609', '34.809525', '3', 'tr_0 tr_370000 tr_370800', '8');
INSERT INTO `areas` VALUES ('370827', '鱼台县', '370800', '鱼台', '116.650024', '34.997707', '3', 'tr_0 tr_370000 tr_370800', '11');
INSERT INTO `areas` VALUES ('370828', '金乡县', '370800', '金乡', '116.310364', '35.069771', '3', 'tr_0 tr_370000 tr_370800', '2');
INSERT INTO `areas` VALUES ('370829', '嘉祥县', '370800', '嘉祥', '116.342888', '35.398098', '3', 'tr_0 tr_370000 tr_370800', '1');
INSERT INTO `areas` VALUES ('370830', '汶上县', '370800', '汶上', '116.487144', '35.721745', '3', 'tr_0 tr_370000 tr_370800', '9');
INSERT INTO `areas` VALUES ('370831', '泗水县', '370800', '泗水', '117.273605', '35.653217', '3', 'tr_0 tr_370000 tr_370800', '7');
INSERT INTO `areas` VALUES ('370832', '梁山县', '370800', '梁山', '116.08963', '35.801842', '3', 'tr_0 tr_370000 tr_370800', '3');
INSERT INTO `areas` VALUES ('370881', '曲阜市', '370800', '曲阜', '116.991882', '35.592789', '3', 'tr_0 tr_370000 tr_370800', '4');
INSERT INTO `areas` VALUES ('370882', '兖州市', '370800', '兖州', '116.587242', '35.415394', '3', 'tr_0 tr_370000 tr_370800', '10');
INSERT INTO `areas` VALUES ('370883', '邹城市', '370800', '邹城', '116.966728', '35.405258', '3', 'tr_0 tr_370000 tr_370800', '12');
INSERT INTO `areas` VALUES ('370900', '泰安市', '370000', '泰安', '117.129066', '36.194969', '2', 'tr_0 tr_370000', '12');
INSERT INTO `areas` VALUES ('370902', '泰山区', '370900', '泰山', '117.129982', '36.189312', '3', 'tr_0 tr_370000 tr_370900', '5');
INSERT INTO `areas` VALUES ('370903', '岱岳区', '370900', '岱岳', '117.043533', '36.184101', '3', 'tr_0 tr_370000 tr_370900', '1');
INSERT INTO `areas` VALUES ('370921', '宁阳县', '370900', '宁阳', '116.799294', '35.76754', '3', 'tr_0 tr_370000 tr_370900', '4');
INSERT INTO `areas` VALUES ('370923', '东平县', '370900', '东平', '116.461052', '35.930466', '3', 'tr_0 tr_370000 tr_370900', '2');
INSERT INTO `areas` VALUES ('370982', '新泰市', '370900', '新泰', '117.76609', '35.910385', '3', 'tr_0 tr_370000 tr_370900', '6');
INSERT INTO `areas` VALUES ('370983', '肥城市', '370900', '肥城', '116.763702', '36.1856', '3', 'tr_0 tr_370000 tr_370900', '3');
INSERT INTO `areas` VALUES ('371000', '威海市', '370000', '威海', '122.116394', '37.509689', '2', 'tr_0 tr_370000', '14');
INSERT INTO `areas` VALUES ('371002', '环翠区', '371000', '环翠', '122.116188', '37.510754', '3', 'tr_0 tr_370000 tr_371000', '1');
INSERT INTO `areas` VALUES ('371081', '文登市', '371000', '文登', '122.057137', '37.196213', '3', 'tr_0 tr_370000 tr_371000', '4');
INSERT INTO `areas` VALUES ('371082', '荣成市', '371000', '荣成', '122.422897', '37.160133', '3', 'tr_0 tr_370000 tr_371000', '2');
INSERT INTO `areas` VALUES ('371083', '乳山市', '371000', '乳山', '121.536346', '36.919621', '3', 'tr_0 tr_370000 tr_371000', '3');
INSERT INTO `areas` VALUES ('371100', '日照市', '370000', '日照', '119.461205', '35.428589', '2', 'tr_0 tr_370000', '11');
INSERT INTO `areas` VALUES ('371102', '东港区', '371100', '东港', '119.457703', '35.426151', '3', 'tr_0 tr_370000 tr_371100', '1');
INSERT INTO `areas` VALUES ('371103', '岚山区', '371100', '岚山', '119.315842', '35.119793', '3', 'tr_0 tr_370000 tr_371100', '3');
INSERT INTO `areas` VALUES ('371121', '五莲县', '371100', '五莲', '119.206741', '35.751938', '3', 'tr_0 tr_370000 tr_371100', '4');
INSERT INTO `areas` VALUES ('371122', '莒县', '371100', '莒县', '118.832855', '35.588116', '3', 'tr_0 tr_370000 tr_371100', '2');
INSERT INTO `areas` VALUES ('371200', '莱芜市', '370000', '莱芜', '117.677734', '36.214397', '2', 'tr_0 tr_370000', '7');
INSERT INTO `areas` VALUES ('371202', '莱城区', '371200', '莱城', '117.678352', '36.213661', '3', 'tr_0 tr_370000 tr_371200', '2');
INSERT INTO `areas` VALUES ('371203', '钢城区', '371200', '钢城', '117.820328', '36.058037', '3', 'tr_0 tr_370000 tr_371200', '1');
INSERT INTO `areas` VALUES ('371300', '临沂市', '370000', '临沂', '118.326447', '35.065281', '2', 'tr_0 tr_370000', '9');
INSERT INTO `areas` VALUES ('371302', '兰山区', '371300', '兰山', '118.327667', '35.06163', '3', 'tr_0 tr_370000 tr_371300', '5');
INSERT INTO `areas` VALUES ('371311', '罗庄区', '371300', '罗庄', '118.284798', '34.997204', '3', 'tr_0 tr_370000 tr_371300', '7');
INSERT INTO `areas` VALUES ('371312', '河东区', '371300', '河东', '118.398293', '35.085003', '3', 'tr_0 tr_370000 tr_371300', '3');
INSERT INTO `areas` VALUES ('371321', '沂南县', '371300', '沂南', '118.455399', '35.547001', '3', 'tr_0 tr_370000 tr_371300', '11');
INSERT INTO `areas` VALUES ('371322', '郯城县', '371300', '郯城', '118.342964', '34.614742', '3', 'tr_0 tr_370000 tr_371300', '10');
INSERT INTO `areas` VALUES ('371323', '沂水县', '371300', '沂水', '118.634544', '35.787029', '3', 'tr_0 tr_370000 tr_371300', '12');
INSERT INTO `areas` VALUES ('371324', '苍山县', '371300', '苍山', '118.326447', '35.065281', '3', 'tr_0 tr_370000 tr_371300', '1');
INSERT INTO `areas` VALUES ('371325', '费县', '371300', '费县', '117.968872', '35.269173', '3', 'tr_0 tr_370000 tr_371300', '2');
INSERT INTO `areas` VALUES ('371326', '平邑县', '371300', '平邑', '117.631882', '35.51152', '3', 'tr_0 tr_370000 tr_371300', '9');
INSERT INTO `areas` VALUES ('371327', '莒南县', '371300', '莒南', '118.838326', '35.175911', '3', 'tr_0 tr_370000 tr_371300', '4');
INSERT INTO `areas` VALUES ('371328', '蒙阴县', '371300', '蒙阴', '117.943268', '35.712437', '3', 'tr_0 tr_370000 tr_371300', '8');
INSERT INTO `areas` VALUES ('371329', '临沭县', '371300', '临沭', '118.648376', '34.917061', '3', 'tr_0 tr_370000 tr_371300', '6');
INSERT INTO `areas` VALUES ('371400', '德州市', '370000', '德州', '116.307426', '37.453968', '2', 'tr_0 tr_370000', '2');
INSERT INTO `areas` VALUES ('371402', '德城区', '371400', '德城', '116.307076', '37.453922', '3', 'tr_0 tr_370000 tr_371400', '1');
INSERT INTO `areas` VALUES ('371421', '陵县', '371400', '陵县', '116.574928', '37.332848', '3', 'tr_0 tr_370000 tr_371400', '3');
INSERT INTO `areas` VALUES ('371422', '宁津县', '371400', '宁津', '116.793716', '37.64962', '3', 'tr_0 tr_370000 tr_371400', '5');
INSERT INTO `areas` VALUES ('371423', '庆云县', '371400', '庆云', '117.390511', '37.777725', '3', 'tr_0 tr_370000 tr_371400', '8');
INSERT INTO `areas` VALUES ('371424', '临邑县', '371400', '临邑', '116.867027', '37.192043', '3', 'tr_0 tr_370000 tr_371400', '4');
INSERT INTO `areas` VALUES ('371425', '齐河县', '371400', '齐河', '116.758392', '36.795498', '3', 'tr_0 tr_370000 tr_371400', '7');
INSERT INTO `areas` VALUES ('371426', '平原县', '371400', '平原', '116.433907', '37.164467', '3', 'tr_0 tr_370000 tr_371400', '6');
INSERT INTO `areas` VALUES ('371427', '夏津县', '371400', '夏津', '116.003815', '36.9505', '3', 'tr_0 tr_370000 tr_371400', '10');
INSERT INTO `areas` VALUES ('371428', '武城县', '371400', '武城', '116.078629', '37.209526', '3', 'tr_0 tr_370000 tr_371400', '9');
INSERT INTO `areas` VALUES ('371481', '乐陵市', '371400', '乐陵', '117.21666', '37.729115', '3', 'tr_0 tr_370000 tr_371400', '2');
INSERT INTO `areas` VALUES ('371482', '禹城市', '371400', '禹城', '116.642555', '36.934486', '3', 'tr_0 tr_370000 tr_371400', '11');
INSERT INTO `areas` VALUES ('371500', '聊城市', '370000', '聊城', '115.98037', '36.456013', '2', 'tr_0 tr_370000', '8');
INSERT INTO `areas` VALUES ('371502', '东昌府区', '371500', '东昌府', '115.980026', '36.456059', '3', 'tr_0 tr_370000 tr_371500', '2');
INSERT INTO `areas` VALUES ('371521', '阳谷县', '371500', '阳谷', '115.784286', '36.113708', '3', 'tr_0 tr_370000 tr_371500', '8');
INSERT INTO `areas` VALUES ('371522', '莘县', '371500', '莘县', '115.66729', '36.237598', '3', 'tr_0 tr_370000 tr_371500', '7');
INSERT INTO `areas` VALUES ('371523', '茌平县', '371500', '茌平', '116.253349', '36.591934', '3', 'tr_0 tr_370000 tr_371500', '1');
INSERT INTO `areas` VALUES ('371524', '东阿县', '371500', '东阿', '116.248856', '36.336002', '3', 'tr_0 tr_370000 tr_371500', '3');
INSERT INTO `areas` VALUES ('371525', '冠县', '371500', '冠县', '115.444809', '36.483753', '3', 'tr_0 tr_370000 tr_371500', '5');
INSERT INTO `areas` VALUES ('371526', '高唐县', '371500', '高唐', '116.22966', '36.859756', '3', 'tr_0 tr_370000 tr_371500', '4');
INSERT INTO `areas` VALUES ('371581', '临清市', '371500', '临清', '115.713463', '36.842598', '3', 'tr_0 tr_370000 tr_371500', '6');
INSERT INTO `areas` VALUES ('371600', '滨州市', '370000', '滨州', '118.016975', '37.383541', '2', 'tr_0 tr_370000', '1');
INSERT INTO `areas` VALUES ('371602', '滨城区', '371600', '滨城', '118.020149', '37.384842', '3', 'tr_0 tr_370000 tr_371600', '1');
INSERT INTO `areas` VALUES ('371621', '惠民县', '371600', '惠民', '117.508942', '37.483875', '3', 'tr_0 tr_370000 tr_371600', '3');
INSERT INTO `areas` VALUES ('371622', '阳信县', '371600', '阳信', '117.581329', '37.640491', '3', 'tr_0 tr_370000 tr_371600', '5');
INSERT INTO `areas` VALUES ('371623', '无棣县', '371600', '无棣', '117.616325', '37.740849', '3', 'tr_0 tr_370000 tr_371600', '4');
INSERT INTO `areas` VALUES ('371624', '沾化县', '371600', '沾化', '118.129906', '37.698456', '3', 'tr_0 tr_370000 tr_371600', '6');
INSERT INTO `areas` VALUES ('371625', '博兴县', '371600', '博兴', '118.123093', '37.147003', '3', 'tr_0 tr_370000 tr_371600', '2');
INSERT INTO `areas` VALUES ('371626', '邹平县', '371600', '邹平', '117.736809', '36.878029', '3', 'tr_0 tr_370000 tr_371600', '7');
INSERT INTO `areas` VALUES ('371700', '菏泽市', '370000', '菏泽', '115.469383', '35.246532', '2', 'tr_0 tr_370000', '4');
INSERT INTO `areas` VALUES ('371702', '牡丹区', '371700', '牡丹', '115.470947', '35.243111', '3', 'tr_0 tr_370000 tr_371700', '7');
INSERT INTO `areas` VALUES ('371721', '曹县', '371700', '曹县', '115.549484', '34.823254', '3', 'tr_0 tr_370000 tr_371700', '1');
INSERT INTO `areas` VALUES ('371722', '单县', '371700', '单县', '116.082619', '34.790852', '3', 'tr_0 tr_370000 tr_371700', '8');
INSERT INTO `areas` VALUES ('371723', '成武县', '371700', '成武', '115.897346', '34.947365', '3', 'tr_0 tr_370000 tr_371700', '2');
INSERT INTO `areas` VALUES ('371724', '巨野县', '371700', '巨野', '116.08934', '35.390999', '3', 'tr_0 tr_370000 tr_371700', '6');
INSERT INTO `areas` VALUES ('371725', '郓城县', '371700', '郓城', '115.93885', '35.594772', '3', 'tr_0 tr_370000 tr_371700', '9');
INSERT INTO `areas` VALUES ('371726', '鄄城县', '371700', '鄄城', '115.514343', '35.560257', '3', 'tr_0 tr_370000 tr_371700', '5');
INSERT INTO `areas` VALUES ('371727', '定陶县', '371700', '定陶', '115.569603', '35.072701', '3', 'tr_0 tr_370000 tr_371700', '3');
INSERT INTO `areas` VALUES ('371728', '东明县', '371700', '东明', '115.098412', '35.289639', '3', 'tr_0 tr_370000 tr_371700', '4');
INSERT INTO `areas` VALUES ('410000', '河南省', '1', '河南', '113.665413', '34.757977', '1', 'tr_0', '16');
INSERT INTO `areas` VALUES ('410100', '郑州市', '410000', '郑州', '113.665413', '34.757977', '2', 'tr_0 tr_410000', '16');
INSERT INTO `areas` VALUES ('410102', '中原区', '410100', '中原', '113.611572', '34.748287', '3', 'tr_0 tr_410000 tr_410100', '12');
INSERT INTO `areas` VALUES ('410103', '二七区', '410100', '二七', '113.645424', '34.730934', '3', 'tr_0 tr_410000 tr_410100', '2');
INSERT INTO `areas` VALUES ('410104', '管城回族区', '410100', '管城回族', '113.68531', '34.746452', '3', 'tr_0 tr_410000 tr_410100', '4');
INSERT INTO `areas` VALUES ('410105', '金水区', '410100', '金水', '113.686035', '34.775837', '3', 'tr_0 tr_410000 tr_410100', '6');
INSERT INTO `areas` VALUES ('410106', '上街区', '410100', '上街', '113.298279', '34.808689', '3', 'tr_0 tr_410000 tr_410100', '7');
INSERT INTO `areas` VALUES ('410108', '惠济区', '410100', '惠济', '113.618362', '34.82859', '3', 'tr_0 tr_410000 tr_410100', '5');
INSERT INTO `areas` VALUES ('410122', '中牟县', '410100', '中牟', '114.022522', '34.721977', '3', 'tr_0 tr_410000 tr_410100', '11');
INSERT INTO `areas` VALUES ('410181', '巩义市', '410100', '巩义', '112.982826', '34.752178', '3', 'tr_0 tr_410000 tr_410100', '3');
INSERT INTO `areas` VALUES ('410182', '荥阳市', '410100', '荥阳', '113.391525', '34.789078', '3', 'tr_0 tr_410000 tr_410100', '8');
INSERT INTO `areas` VALUES ('410183', '新密市', '410100', '新密', '113.380615', '34.537846', '3', 'tr_0 tr_410000 tr_410100', '9');
INSERT INTO `areas` VALUES ('410184', '新郑市', '410100', '新郑', '113.73967', '34.394218', '3', 'tr_0 tr_410000 tr_410100', '10');
INSERT INTO `areas` VALUES ('410185', '登封市', '410100', '登封', '113.037766', '34.459938', '3', 'tr_0 tr_410000 tr_410100', '1');
INSERT INTO `areas` VALUES ('410200', '开封市', '410000', '开封', '114.341446', '34.79705', '2', 'tr_0 tr_410000', '5');
INSERT INTO `areas` VALUES ('410202', '龙亭区', '410200', '龙亭', '114.353348', '34.799831', '3', 'tr_0 tr_410000 tr_410200', '5');
INSERT INTO `areas` VALUES ('410203', '顺河回族区', '410200', '顺河回族', '114.364876', '34.800461', '3', 'tr_0 tr_410000 tr_410200', '7');
INSERT INTO `areas` VALUES ('410204', '鼓楼区', '410200', '鼓楼', '114.348503', '34.792381', '3', 'tr_0 tr_410000 tr_410200', '1');
INSERT INTO `areas` VALUES ('410205', '禹王台区', '410200', '禹王台', '114.350243', '34.779728', '3', 'tr_0 tr_410000 tr_410200', '10');
INSERT INTO `areas` VALUES ('410211', '金明区', '410200', '金明', '114.300682', '34.791512', '3', 'tr_0 tr_410000 tr_410200', '2');
INSERT INTO `areas` VALUES ('410221', '杞县', '410200', '杞县', '114.77047', '34.554585', '3', 'tr_0 tr_410000 tr_410200', '6');
INSERT INTO `areas` VALUES ('410222', '通许县', '410200', '通许', '114.467735', '34.477303', '3', 'tr_0 tr_410000 tr_410200', '8');
INSERT INTO `areas` VALUES ('410223', '尉氏县', '410200', '尉氏', '114.193924', '34.412254', '3', 'tr_0 tr_410000 tr_410200', '9');
INSERT INTO `areas` VALUES ('410224', '开封县', '410200', '开封', '114.437622', '34.756477', '3', 'tr_0 tr_410000 tr_410200', '3');
INSERT INTO `areas` VALUES ('410225', '兰考县', '410200', '兰考', '114.820572', '34.829899', '3', 'tr_0 tr_410000 tr_410200', '4');
INSERT INTO `areas` VALUES ('410300', '洛阳市', '410000', '洛阳', '112.434471', '34.66304', '2', 'tr_0 tr_410000', '7');
INSERT INTO `areas` VALUES ('410302', '老城区', '410300', '老城', '112.477295', '34.682945', '3', 'tr_0 tr_410000 tr_410300', '4');
INSERT INTO `areas` VALUES ('410303', '西工区', '410300', '西工', '112.44323', '34.667847', '3', 'tr_0 tr_410000 tr_410300', '11');
INSERT INTO `areas` VALUES ('410304', '瀍河回族区', '410300', '瀍河回族', '112.491623', '34.684738', '3', 'tr_0 tr_410000 tr_410300', '1');
INSERT INTO `areas` VALUES ('410305', '涧西区', '410300', '涧西', '112.399246', '34.654251', '3', 'tr_0 tr_410000 tr_410300', '2');
INSERT INTO `areas` VALUES ('410306', '吉利区', '410300', '吉利', '112.584793', '34.899094', '3', 'tr_0 tr_410000 tr_410300', '3');
INSERT INTO `areas` VALUES ('410307', '洛龙区', '410300', '洛龙', '112.456635', '34.618557', '3', 'tr_0 tr_410000 tr_410300', '6');
INSERT INTO `areas` VALUES ('410322', '孟津县', '410300', '孟津', '112.443893', '34.826485', '3', 'tr_0 tr_410000 tr_410300', '8');
INSERT INTO `areas` VALUES ('410323', '新安县', '410300', '新安', '112.141403', '34.72868', '3', 'tr_0 tr_410000 tr_410300', '12');
INSERT INTO `areas` VALUES ('410324', '栾川县', '410300', '栾川', '111.618385', '33.783195', '3', 'tr_0 tr_410000 tr_410300', '5');
INSERT INTO `areas` VALUES ('410325', '嵩县', '410300', '嵩县', '112.087769', '34.131561', '3', 'tr_0 tr_410000 tr_410300', '10');
INSERT INTO `areas` VALUES ('410326', '汝阳县', '410300', '汝阳', '112.473785', '34.153229', '3', 'tr_0 tr_410000 tr_410300', '9');
INSERT INTO `areas` VALUES ('410327', '宜阳县', '410300', '宜阳', '112.179993', '34.516479', '3', 'tr_0 tr_410000 tr_410300', '15');
INSERT INTO `areas` VALUES ('410328', '洛宁县', '410300', '洛宁', '111.655396', '34.38718', '3', 'tr_0 tr_410000 tr_410300', '7');
INSERT INTO `areas` VALUES ('410329', '伊川县', '410300', '伊川', '112.429382', '34.423416', '3', 'tr_0 tr_410000 tr_410300', '14');
INSERT INTO `areas` VALUES ('410381', '偃师市', '410300', '偃师', '112.787743', '34.723042', '3', 'tr_0 tr_410000 tr_410300', '13');
INSERT INTO `areas` VALUES ('410400', '平顶山市', '410000', '平顶山', '113.307716', '33.735241', '2', 'tr_0 tr_410000', '9');
INSERT INTO `areas` VALUES ('410402', '新华区', '410400', '新华', '113.299065', '33.737579', '3', 'tr_0 tr_410000 tr_410400', '8');
INSERT INTO `areas` VALUES ('410403', '卫东区', '410400', '卫东', '113.310326', '33.739285', '3', 'tr_0 tr_410000 tr_410400', '6');
INSERT INTO `areas` VALUES ('410404', '石龙区', '410400', '石龙', '112.889885', '33.901539', '3', 'tr_0 tr_410000 tr_410400', '5');
INSERT INTO `areas` VALUES ('410411', '湛河区', '410400', '湛河', '113.320869', '33.725681', '3', 'tr_0 tr_410000 tr_410400', '10');
INSERT INTO `areas` VALUES ('410421', '宝丰县', '410400', '宝丰', '113.066811', '33.86636', '3', 'tr_0 tr_410000 tr_410400', '1');
INSERT INTO `areas` VALUES ('410422', '叶县', '410400', '叶县', '113.358299', '33.62125', '3', 'tr_0 tr_410000 tr_410400', '9');
INSERT INTO `areas` VALUES ('410423', '鲁山县', '410400', '鲁山', '112.9067', '33.740326', '3', 'tr_0 tr_410000 tr_410400', '3');
INSERT INTO `areas` VALUES ('410425', '郏县', '410400', '郏县', '113.220451', '33.971992', '3', 'tr_0 tr_410000 tr_410400', '2');
INSERT INTO `areas` VALUES ('410481', '舞钢市', '410400', '舞钢', '113.526253', '33.302082', '3', 'tr_0 tr_410000 tr_410400', '7');
INSERT INTO `areas` VALUES ('410482', '汝州市', '410400', '汝州', '112.845337', '34.167408', '3', 'tr_0 tr_410000 tr_410400', '4');
INSERT INTO `areas` VALUES ('410500', '安阳市', '410000', '安阳', '114.352486', '36.103443', '2', 'tr_0 tr_410000', '1');
INSERT INTO `areas` VALUES ('410502', '文峰区', '410500', '文峰', '114.352562', '36.098103', '3', 'tr_0 tr_410000 tr_410500', '8');
INSERT INTO `areas` VALUES ('410503', '北关区', '410500', '北关', '114.352646', '36.109779', '3', 'tr_0 tr_410000 tr_410500', '2');
INSERT INTO `areas` VALUES ('410505', '殷都区', '410500', '殷都', '114.300095', '36.108974', '3', 'tr_0 tr_410000 tr_410500', '9');
INSERT INTO `areas` VALUES ('410506', '龙安区', '410500', '龙安', '114.323524', '36.09557', '3', 'tr_0 tr_410000 tr_410500', '5');
INSERT INTO `areas` VALUES ('410522', '安阳县', '410500', '安阳', '114.130203', '36.130585', '3', 'tr_0 tr_410000 tr_410500', '1');
INSERT INTO `areas` VALUES ('410523', '汤阴县', '410500', '汤阴', '114.362358', '35.922348', '3', 'tr_0 tr_410000 tr_410500', '7');
INSERT INTO `areas` VALUES ('410526', '滑县', '410500', '滑县', '114.524002', '35.574627', '3', 'tr_0 tr_410000 tr_410500', '3');
INSERT INTO `areas` VALUES ('410527', '内黄县', '410500', '内黄', '114.904579', '35.953701', '3', 'tr_0 tr_410000 tr_410500', '6');
INSERT INTO `areas` VALUES ('410581', '林州市', '410500', '林州', '113.823769', '36.063404', '3', 'tr_0 tr_410000 tr_410500', '4');
INSERT INTO `areas` VALUES ('410600', '鹤壁市', '410000', '鹤壁', '114.295441', '35.748238', '2', 'tr_0 tr_410000', '2');
INSERT INTO `areas` VALUES ('410602', '鹤山区', '410600', '鹤山', '114.16655', '35.936127', '3', 'tr_0 tr_410000 tr_410600', '1');
INSERT INTO `areas` VALUES ('410603', '山城区', '410600', '山城', '114.184204', '35.896057', '3', 'tr_0 tr_410000 tr_410600', '4');
INSERT INTO `areas` VALUES ('410611', '淇滨区', '410600', '淇滨', '114.293915', '35.748383', '3', 'tr_0 tr_410000 tr_410600', '2');
INSERT INTO `areas` VALUES ('410621', '浚县', '410600', '浚县', '114.550163', '35.671284', '3', 'tr_0 tr_410000 tr_410600', '5');
INSERT INTO `areas` VALUES ('410622', '淇县', '410600', '淇县', '114.200378', '35.609478', '3', 'tr_0 tr_410000 tr_410600', '3');
INSERT INTO `areas` VALUES ('410700', '新乡市', '410000', '新乡', '113.883987', '35.302616', '2', 'tr_0 tr_410000', '14');
INSERT INTO `areas` VALUES ('410702', '红旗区', '410700', '红旗', '113.878159', '35.302685', '3', 'tr_0 tr_410000 tr_410700', '4');
INSERT INTO `areas` VALUES ('410703', '卫滨区', '410700', '卫滨', '113.866066', '35.304905', '3', 'tr_0 tr_410000 tr_410700', '8');
INSERT INTO `areas` VALUES ('410704', '凤泉区', '410700', '凤泉', '113.906715', '35.379856', '3', 'tr_0 tr_410000 tr_410700', '3');
INSERT INTO `areas` VALUES ('410711', '牧野区', '410700', '牧野', '113.897163', '35.312973', '3', 'tr_0 tr_410000 tr_410700', '7');
INSERT INTO `areas` VALUES ('410721', '新乡县', '410700', '新乡', '113.806183', '35.190022', '3', 'tr_0 tr_410000 tr_410700', '10');
INSERT INTO `areas` VALUES ('410724', '获嘉县', '410700', '获嘉', '113.657249', '35.261684', '3', 'tr_0 tr_410000 tr_410700', '6');
INSERT INTO `areas` VALUES ('410725', '原阳县', '410700', '原阳', '113.965965', '35.054001', '3', 'tr_0 tr_410000 tr_410700', '12');
INSERT INTO `areas` VALUES ('410726', '延津县', '410700', '延津', '114.200981', '35.149513', '3', 'tr_0 tr_410000 tr_410700', '11');
INSERT INTO `areas` VALUES ('410727', '封丘县', '410700', '封丘', '114.423409', '35.040569', '3', 'tr_0 tr_410000 tr_410700', '2');
INSERT INTO `areas` VALUES ('410728', '长垣县', '410700', '长垣', '114.673805', '35.196152', '3', 'tr_0 tr_410000 tr_410700', '1');
INSERT INTO `areas` VALUES ('410781', '卫辉市', '410700', '卫辉', '114.065857', '35.404297', '3', 'tr_0 tr_410000 tr_410700', '9');
INSERT INTO `areas` VALUES ('410782', '辉县市', '410700', '辉县', '113.802521', '35.461319', '3', 'tr_0 tr_410000 tr_410700', '5');
INSERT INTO `areas` VALUES ('410800', '焦作市', '410000', '焦作', '113.238266', '35.23904', '2', 'tr_0 tr_410000', '3');
INSERT INTO `areas` VALUES ('410802', '解放区', '410800', '解放', '113.226128', '35.241352', '3', 'tr_0 tr_410000 tr_410800', '2');
INSERT INTO `areas` VALUES ('410803', '中站区', '410800', '中站', '113.175484', '35.236145', '3', 'tr_0 tr_410000 tr_410800', '10');
INSERT INTO `areas` VALUES ('410804', '马村区', '410800', '马村', '113.321701', '35.265453', '3', 'tr_0 tr_410000 tr_410800', '3');
INSERT INTO `areas` VALUES ('410811', '山阳区', '410800', '山阳', '113.267662', '35.21476', '3', 'tr_0 tr_410000 tr_410800', '6');
INSERT INTO `areas` VALUES ('410821', '修武县', '410800', '修武', '113.447464', '35.229923', '3', 'tr_0 tr_410000 tr_410800', '9');
INSERT INTO `areas` VALUES ('410822', '博爱县', '410800', '博爱', '113.069313', '35.170349', '3', 'tr_0 tr_410000 tr_410800', '1');
INSERT INTO `areas` VALUES ('410823', '武陟县', '410800', '武陟', '113.408333', '35.09885', '3', 'tr_0 tr_410000 tr_410800', '8');
INSERT INTO `areas` VALUES ('410825', '温县', '410800', '温县', '113.079117', '34.941235', '3', 'tr_0 tr_410000 tr_410800', '7');
INSERT INTO `areas` VALUES ('410881', '济源市', '410000', '济源', '112.59005', '35.090378', '2', 'tr_0 tr_410000', '4');
INSERT INTO `areas` VALUES ('410882', '沁阳市', '410800', '沁阳', '112.93454', '35.089008', '3', 'tr_0 tr_410000 tr_410800', '5');
INSERT INTO `areas` VALUES ('410883', '孟州市', '410800', '孟州', '112.787079', '34.90963', '3', 'tr_0 tr_410000 tr_410800', '4');
INSERT INTO `areas` VALUES ('410900', '濮阳市', '410000', '濮阳', '115.041298', '35.768234', '2', 'tr_0 tr_410000', '10');
INSERT INTO `areas` VALUES ('410902', '华龙区', '410900', '华龙', '115.031837', '35.760471', '3', 'tr_0 tr_410000 tr_410900', '2');
INSERT INTO `areas` VALUES ('410922', '清丰县', '410900', '清丰', '115.107285', '35.902412', '3', 'tr_0 tr_410000 tr_410900', '5');
INSERT INTO `areas` VALUES ('410923', '南乐县', '410900', '南乐', '115.204338', '36.075203', '3', 'tr_0 tr_410000 tr_410900', '3');
INSERT INTO `areas` VALUES ('410926', '范县', '410900', '范县', '115.504211', '35.851978', '3', 'tr_0 tr_410000 tr_410900', '1');
INSERT INTO `areas` VALUES ('410927', '台前县', '410900', '台前', '115.855682', '35.996475', '3', 'tr_0 tr_410000 tr_410900', '6');
INSERT INTO `areas` VALUES ('410928', '濮阳县', '410900', '濮阳', '115.023842', '35.71035', '3', 'tr_0 tr_410000 tr_410900', '4');
INSERT INTO `areas` VALUES ('411000', '许昌市', '410000', '许昌', '113.826065', '34.022957', '2', 'tr_0 tr_410000', '15');
INSERT INTO `areas` VALUES ('411002', '魏都区', '411000', '魏都', '113.828308', '34.027111', '3', 'tr_0 tr_410000 tr_411000', '2');
INSERT INTO `areas` VALUES ('411023', '许昌县', '411000', '许昌', '113.842896', '34.005016', '3', 'tr_0 tr_410000 tr_411000', '4');
INSERT INTO `areas` VALUES ('411024', '鄢陵县', '411000', '鄢陵', '114.188507', '34.100502', '3', 'tr_0 tr_410000 tr_411000', '5');
INSERT INTO `areas` VALUES ('411025', '襄城县', '411000', '襄城', '113.493164', '33.855942', '3', 'tr_0 tr_410000 tr_411000', '3');
INSERT INTO `areas` VALUES ('411081', '禹州市', '411000', '禹州', '113.471313', '34.154404', '3', 'tr_0 tr_410000 tr_411000', '6');
INSERT INTO `areas` VALUES ('411082', '长葛市', '411000', '长葛', '113.768913', '34.219257', '3', 'tr_0 tr_410000 tr_411000', '1');
INSERT INTO `areas` VALUES ('411100', '漯河市', '410000', '漯河', '114.026405', '33.575855', '2', 'tr_0 tr_410000', '6');
INSERT INTO `areas` VALUES ('411102', '源汇区', '411100', '源汇', '114.017944', '33.565441', '3', 'tr_0 tr_410000 tr_411100', '4');
INSERT INTO `areas` VALUES ('411103', '郾城区', '411100', '郾城', '114.016815', '33.588898', '3', 'tr_0 tr_410000 tr_411100', '3');
INSERT INTO `areas` VALUES ('411104', '召陵区', '411100', '召陵', '114.051689', '33.567554', '3', 'tr_0 tr_410000 tr_411100', '5');
INSERT INTO `areas` VALUES ('411121', '舞阳县', '411100', '舞阳', '113.610565', '33.436279', '3', 'tr_0 tr_410000 tr_411100', '2');
INSERT INTO `areas` VALUES ('411122', '临颍县', '411100', '临颍', '113.938889', '33.806091', '3', 'tr_0 tr_410000 tr_411100', '1');
INSERT INTO `areas` VALUES ('411200', '三门峡市', '410000', '三门峡', '111.194099', '34.777336', '2', 'tr_0 tr_410000', '11');
INSERT INTO `areas` VALUES ('411202', '湖滨区', '411200', '湖滨', '111.19487', '34.778118', '3', 'tr_0 tr_410000 tr_411200', '1');
INSERT INTO `areas` VALUES ('411221', '渑池县', '411200', '渑池', '111.762993', '34.763489', '3', 'tr_0 tr_410000 tr_411200', '4');
INSERT INTO `areas` VALUES ('411222', '陕县', '411200', '陕县', '111.103851', '34.720245', '3', 'tr_0 tr_410000 tr_411200', '5');
INSERT INTO `areas` VALUES ('411224', '卢氏县', '411200', '卢氏', '111.05265', '34.053993', '3', 'tr_0 tr_410000 tr_411200', '3');
INSERT INTO `areas` VALUES ('411281', '义马市', '411200', '义马', '111.869415', '34.746868', '3', 'tr_0 tr_410000 tr_411200', '6');
INSERT INTO `areas` VALUES ('411282', '灵宝市', '411200', '灵宝', '110.885773', '34.521263', '3', 'tr_0 tr_410000 tr_411200', '2');
INSERT INTO `areas` VALUES ('411300', '南阳市', '410000', '南阳', '112.540916', '32.999081', '2', 'tr_0 tr_410000', '8');
INSERT INTO `areas` VALUES ('411302', '宛城区', '411300', '宛城', '112.544594', '32.994858', '3', 'tr_0 tr_410000 tr_411300', '8');
INSERT INTO `areas` VALUES ('411303', '卧龙区', '411300', '卧龙', '112.528786', '32.989876', '3', 'tr_0 tr_410000 tr_411300', '9');
INSERT INTO `areas` VALUES ('411321', '南召县', '411300', '南召', '112.435585', '33.488617', '3', 'tr_0 tr_410000 tr_411300', '3');
INSERT INTO `areas` VALUES ('411322', '方城县', '411300', '方城', '113.010933', '33.255138', '3', 'tr_0 tr_410000 tr_411300', '2');
INSERT INTO `areas` VALUES ('411323', '西峡县', '411300', '西峡', '111.485771', '33.302982', '3', 'tr_0 tr_410000 tr_411300', '12');
INSERT INTO `areas` VALUES ('411324', '镇平县', '411300', '镇平', '112.232719', '33.036652', '3', 'tr_0 tr_410000 tr_411300', '13');
INSERT INTO `areas` VALUES ('411325', '内乡县', '411300', '内乡', '111.843803', '33.046356', '3', 'tr_0 tr_410000 tr_411300', '4');
INSERT INTO `areas` VALUES ('411326', '淅川县', '411300', '淅川', '111.489029', '33.136105', '3', 'tr_0 tr_410000 tr_411300', '10');
INSERT INTO `areas` VALUES ('411327', '社旗县', '411300', '社旗县', '112.938278', '33.056126', '3', 'tr_0 tr_410000 tr_411300', '5');
INSERT INTO `areas` VALUES ('411328', '唐河县', '411300', '唐河', '112.838493', '32.687893', '3', 'tr_0 tr_410000 tr_411300', '6');
INSERT INTO `areas` VALUES ('411329', '新野县', '411300', '新野', '112.365623', '32.524006', '3', 'tr_0 tr_410000 tr_411300', '11');
INSERT INTO `areas` VALUES ('411330', '桐柏县', '411300', '桐柏', '113.406059', '32.367153', '3', 'tr_0 tr_410000 tr_411300', '7');
INSERT INTO `areas` VALUES ('411381', '邓州市', '411300', '邓州', '112.092712', '32.681641', '3', 'tr_0 tr_410000 tr_411300', '1');
INSERT INTO `areas` VALUES ('411400', '商丘市', '410000', '商丘', '115.650497', '34.437054', '2', 'tr_0 tr_410000', '12');
INSERT INTO `areas` VALUES ('411402', '梁园区', '411400', '梁园', '115.654587', '34.436554', '3', 'tr_0 tr_410000 tr_411400', '1');
INSERT INTO `areas` VALUES ('411403', '睢阳区', '411400', '睢阳', '115.653816', '34.390537', '3', 'tr_0 tr_410000 tr_411400', '5');
INSERT INTO `areas` VALUES ('411421', '民权县', '411400', '民权', '115.148148', '34.648457', '3', 'tr_0 tr_410000 tr_411400', '2');
INSERT INTO `areas` VALUES ('411422', '睢县', '411400', '睢县', '115.070107', '34.428432', '3', 'tr_0 tr_410000 tr_411400', '4');
INSERT INTO `areas` VALUES ('411423', '宁陵县', '411400', '宁陵', '115.320053', '34.449299', '3', 'tr_0 tr_410000 tr_411400', '3');
INSERT INTO `areas` VALUES ('411424', '柘城县', '411400', '柘城', '115.307434', '34.075275', '3', 'tr_0 tr_410000 tr_411400', '9');
INSERT INTO `areas` VALUES ('411425', '虞城县', '411400', '虞城', '115.863808', '34.399635', '3', 'tr_0 tr_410000 tr_411400', '8');
INSERT INTO `areas` VALUES ('411426', '夏邑县', '411400', '夏邑', '116.139893', '34.240894', '3', 'tr_0 tr_410000 tr_411400', '6');
INSERT INTO `areas` VALUES ('411481', '永城市', '411400', '永城', '116.449669', '33.931316', '3', 'tr_0 tr_410000 tr_411400', '7');
INSERT INTO `areas` VALUES ('411500', '信阳市', '410000', '信阳', '114.075027', '32.123276', '2', 'tr_0 tr_410000', '13');
INSERT INTO `areas` VALUES ('411502', '浉河区', '411500', '浉河', '114.075027', '32.123276', '3', 'tr_0 tr_410000 tr_411500', '8');
INSERT INTO `areas` VALUES ('411503', '平桥区', '411500', '平桥', '114.12603', '32.098396', '3', 'tr_0 tr_410000 tr_411500', '6');
INSERT INTO `areas` VALUES ('411521', '罗山县', '411500', '罗山', '114.533417', '32.203205', '3', 'tr_0 tr_410000 tr_411500', '5');
INSERT INTO `areas` VALUES ('411522', '光山县', '411500', '光山', '114.90358', '32.010399', '3', 'tr_0 tr_410000 tr_411500', '1');
INSERT INTO `areas` VALUES ('411523', '新县', '411500', '新县', '114.877052', '31.635151', '3', 'tr_0 tr_410000 tr_411500', '9');
INSERT INTO `areas` VALUES ('411524', '商城县', '411500', '商城', '115.406296', '31.799982', '3', 'tr_0 tr_410000 tr_411500', '7');
INSERT INTO `areas` VALUES ('411525', '固始县', '411500', '固始', '115.667328', '32.183075', '3', 'tr_0 tr_410000 tr_411500', '2');
INSERT INTO `areas` VALUES ('411526', '潢川县', '411500', '潢川', '115.050125', '32.134026', '3', 'tr_0 tr_410000 tr_411500', '4');
INSERT INTO `areas` VALUES ('411527', '淮滨县', '411500', '淮滨', '115.415451', '32.452641', '3', 'tr_0 tr_410000 tr_411500', '3');
INSERT INTO `areas` VALUES ('411528', '息县', '411500', '息县', '114.740715', '32.344746', '3', 'tr_0 tr_410000 tr_411500', '10');
INSERT INTO `areas` VALUES ('411600', '周口市', '410000', '周口', '114.649651', '33.620358', '2', 'tr_0 tr_410000', '17');
INSERT INTO `areas` VALUES ('411602', '川汇区', '411600', '川汇', '114.652138', '33.614838', '3', 'tr_0 tr_410000 tr_411600', '1');
INSERT INTO `areas` VALUES ('411621', '扶沟县', '411600', '扶沟', '114.392006', '34.054062', '3', 'tr_0 tr_410000 tr_411600', '3');
INSERT INTO `areas` VALUES ('411622', '西华县', '411600', '西华', '114.530067', '33.784378', '3', 'tr_0 tr_410000 tr_411600', '10');
INSERT INTO `areas` VALUES ('411623', '商水县', '411600', '商水', '114.609268', '33.543846', '3', 'tr_0 tr_410000 tr_411600', '6');
INSERT INTO `areas` VALUES ('411624', '沈丘县', '411600', '沈丘', '115.078377', '33.395515', '3', 'tr_0 tr_410000 tr_411600', '7');
INSERT INTO `areas` VALUES ('411625', '郸城县', '411600', '郸城', '115.189003', '33.643852', '3', 'tr_0 tr_410000 tr_411600', '2');
INSERT INTO `areas` VALUES ('411626', '淮阳县', '411600', '淮阳', '114.870163', '33.732548', '3', 'tr_0 tr_410000 tr_411600', '4');
INSERT INTO `areas` VALUES ('411627', '太康县', '411600', '太康', '114.853836', '34.065311', '3', 'tr_0 tr_410000 tr_411600', '8');
INSERT INTO `areas` VALUES ('411628', '鹿邑县', '411600', '鹿邑', '115.486389', '33.861069', '3', 'tr_0 tr_410000 tr_411600', '5');
INSERT INTO `areas` VALUES ('411681', '项城市', '411600', '项城', '114.899521', '33.443085', '3', 'tr_0 tr_410000 tr_411600', '9');
INSERT INTO `areas` VALUES ('411700', '驻马店市', '410000', '驻马店', '114.024734', '32.980167', '2', 'tr_0 tr_410000', '18');
INSERT INTO `areas` VALUES ('411702', '驿城区', '411700', '驿城', '114.029152', '32.977558', '3', 'tr_0 tr_410000 tr_411700', '9');
INSERT INTO `areas` VALUES ('411721', '西平县', '411700', '西平', '114.026863', '33.382317', '3', 'tr_0 tr_410000 tr_411700', '8');
INSERT INTO `areas` VALUES ('411722', '上蔡县', '411700', '上蔡', '114.266891', '33.264717', '3', 'tr_0 tr_410000 tr_411700', '5');
INSERT INTO `areas` VALUES ('411723', '平舆县', '411700', '平舆', '114.637108', '32.955627', '3', 'tr_0 tr_410000 tr_411700', '2');
INSERT INTO `areas` VALUES ('411724', '正阳县', '411700', '正阳', '114.389481', '32.601826', '3', 'tr_0 tr_410000 tr_411700', '10');
INSERT INTO `areas` VALUES ('411725', '确山县', '411700', '确山', '114.02668', '32.801537', '3', 'tr_0 tr_410000 tr_411700', '3');
INSERT INTO `areas` VALUES ('411726', '泌阳县', '411700', '泌阳', '113.32605', '32.725128', '3', 'tr_0 tr_410000 tr_411700', '1');
INSERT INTO `areas` VALUES ('411727', '汝南县', '411700', '汝南', '114.359497', '33.004536', '3', 'tr_0 tr_410000 tr_411700', '4');
INSERT INTO `areas` VALUES ('411728', '遂平县', '411700', '遂平', '114.003708', '33.14698', '3', 'tr_0 tr_410000 tr_411700', '6');
INSERT INTO `areas` VALUES ('411729', '新蔡县', '411700', '新蔡', '114.975243', '32.749947', '3', 'tr_0 tr_410000 tr_411700', '7');
INSERT INTO `areas` VALUES ('420000', '湖北省', '1', '湖北', '114.298569', '30.584354', '1', 'tr_0', '17');
INSERT INTO `areas` VALUES ('420100', '武汉市', '420000', '武汉', '114.298569', '30.584354', '2', 'tr_0 tr_420000', '12');
INSERT INTO `areas` VALUES ('420102', '江岸区', '420100', '江岸', '114.30304', '30.594912', '3', 'tr_0 tr_420000 tr_420100', '7');
INSERT INTO `areas` VALUES ('420103', '江汉区', '420100', '江汉', '114.283112', '30.578772', '3', 'tr_0 tr_420000 tr_420100', '8');
INSERT INTO `areas` VALUES ('420104', '硚口区', '420100', '硚口', '114.264565', '30.57061', '3', 'tr_0 tr_420000 tr_420100', '10');
INSERT INTO `areas` VALUES ('420105', '汉阳区', '420100', '汉阳', '114.265808', '30.549326', '3', 'tr_0 tr_420000 tr_420100', '4');
INSERT INTO `areas` VALUES ('420106', '武昌区', '420100', '武昌', '114.307343', '30.546535', '3', 'tr_0 tr_420000 tr_420100', '12');
INSERT INTO `areas` VALUES ('420107', '青山区', '420100', '青山', '114.397072', '30.634214', '3', 'tr_0 tr_420000 tr_420100', '11');
INSERT INTO `areas` VALUES ('420111', '洪山区', '420100', '洪山', '114.400719', '30.504259', '3', 'tr_0 tr_420000 tr_420100', '5');
INSERT INTO `areas` VALUES ('420112', '东西湖区', '420100', '东西湖', '114.142487', '30.622467', '3', 'tr_0 tr_420000 tr_420100', '2');
INSERT INTO `areas` VALUES ('420113', '汉南区', '420100', '汉南', '114.081238', '30.309637', '3', 'tr_0 tr_420000 tr_420100', '3');
INSERT INTO `areas` VALUES ('420114', '蔡甸区', '420100', '蔡甸', '114.029343', '30.582186', '3', 'tr_0 tr_420000 tr_420100', '1');
INSERT INTO `areas` VALUES ('420115', '江夏区', '420100', '江夏', '114.313957', '30.349045', '3', 'tr_0 tr_420000 tr_420100', '9');
INSERT INTO `areas` VALUES ('420116', '黄陂区', '420100', '黄陂', '114.374023', '30.874155', '3', 'tr_0 tr_420000 tr_420100', '6');
INSERT INTO `areas` VALUES ('420117', '新洲区', '420100', '新洲', '114.802109', '30.84215', '3', 'tr_0 tr_420000 tr_420100', '13');
INSERT INTO `areas` VALUES ('420200', '黄石市', '420000', '黄石', '115.077049', '30.220074', '2', 'tr_0 tr_420000', '4');
INSERT INTO `areas` VALUES ('420202', '黄石港区', '420200', '黄石港', '115.090164', '30.212086', '3', 'tr_0 tr_420000 tr_420200', '2');
INSERT INTO `areas` VALUES ('420203', '西塞山区', '420200', '西塞山', '115.093353', '30.205364', '3', 'tr_0 tr_420000 tr_420200', '5');
INSERT INTO `areas` VALUES ('420204', '下陆区', '420200', '下陆', '114.975754', '30.177845', '3', 'tr_0 tr_420000 tr_420200', '4');
INSERT INTO `areas` VALUES ('420205', '铁山区', '420200', '铁山', '114.901367', '30.206011', '3', 'tr_0 tr_420000 tr_420200', '3');
INSERT INTO `areas` VALUES ('420222', '阳新县', '420200', '阳新', '115.212883', '29.841572', '3', 'tr_0 tr_420000 tr_420200', '6');
INSERT INTO `areas` VALUES ('420281', '大冶市', '420200', '大冶', '114.974838', '30.098804', '3', 'tr_0 tr_420000 tr_420200', '1');
INSERT INTO `areas` VALUES ('420300', '十堰市', '420000', '十堰', '110.787918', '32.646908', '2', 'tr_0 tr_420000', '9');
INSERT INTO `areas` VALUES ('420302', '茅箭区', '420300', '茅箭', '110.786209', '32.644463', '3', 'tr_0 tr_420000 tr_420300', '3');
INSERT INTO `areas` VALUES ('420303', '张湾区', '420300', '张湾', '110.772362', '32.652515', '3', 'tr_0 tr_420000 tr_420300', '6');
INSERT INTO `areas` VALUES ('420321', '郧县', '420300', '郧县', '110.812096', '32.838268', '3', 'tr_0 tr_420000 tr_420300', '4');
INSERT INTO `areas` VALUES ('420322', '郧西县', '420300', '郧西', '110.426476', '32.991459', '3', 'tr_0 tr_420000 tr_420300', '5');
INSERT INTO `areas` VALUES ('420323', '竹山县', '420300', '竹山', '110.229599', '32.225861', '3', 'tr_0 tr_420000 tr_420300', '7');
INSERT INTO `areas` VALUES ('420324', '竹溪县', '420300', '竹溪', '109.717194', '32.315342', '3', 'tr_0 tr_420000 tr_420300', '8');
INSERT INTO `areas` VALUES ('420325', '房县', '420300', '房县', '110.741966', '32.055', '3', 'tr_0 tr_420000 tr_420300', '2');
INSERT INTO `areas` VALUES ('420381', '丹江口市', '420300', '丹江口', '111.513794', '32.538837', '3', 'tr_0 tr_420000 tr_420300', '1');
INSERT INTO `areas` VALUES ('420500', '宜昌市', '420000', '宜昌', '111.29084', '30.702637', '2', 'tr_0 tr_420000', '17');
INSERT INTO `areas` VALUES ('420502', '西陵区', '420500', '西陵', '111.295471', '30.702477', '3', 'tr_0 tr_420000 tr_420500', '6');
INSERT INTO `areas` VALUES ('420503', '伍家岗区', '420500', '伍家岗', '111.307213', '30.679052', '3', 'tr_0 tr_420000 tr_420500', '5');
INSERT INTO `areas` VALUES ('420504', '点军区', '420500', '点军', '111.268166', '30.692322', '3', 'tr_0 tr_420000 tr_420500', '3');
INSERT INTO `areas` VALUES ('420505', '猇亭区', '420500', '猇亭', '111.29084', '30.702637', '3', 'tr_0 tr_420000 tr_420500', '8');
INSERT INTO `areas` VALUES ('420506', '夷陵区', '420500', '夷陵', '111.326744', '30.770199', '3', 'tr_0 tr_420000 tr_420500', '10');
INSERT INTO `areas` VALUES ('420525', '远安县', '420500', '远安', '111.643311', '31.059626', '3', 'tr_0 tr_420000 tr_420500', '11');
INSERT INTO `areas` VALUES ('420526', '兴山县', '420500', '兴山', '110.754501', '31.34795', '3', 'tr_0 tr_420000 tr_420500', '7');
INSERT INTO `areas` VALUES ('420527', '秭归县', '420500', '秭归', '110.976784', '30.823908', '3', 'tr_0 tr_420000 tr_420500', '13');
INSERT INTO `areas` VALUES ('420528', '长阳土家族自治县', '420500', '长阳', '111.198479', '30.466534', '3', 'tr_0 tr_420000 tr_420500', '1');
INSERT INTO `areas` VALUES ('420529', '五峰土家族自治县', '420500', '五峰', '110.674934', '30.199251', '3', 'tr_0 tr_420000 tr_420500', '4');
INSERT INTO `areas` VALUES ('420581', '宜都市', '420500', '宜都', '111.454369', '30.387234', '3', 'tr_0 tr_420000 tr_420500', '9');
INSERT INTO `areas` VALUES ('420582', '当阳市', '420500', '当阳', '111.793419', '30.824492', '3', 'tr_0 tr_420000 tr_420500', '2');
INSERT INTO `areas` VALUES ('420583', '枝江市', '420500', '枝江', '111.751801', '30.425364', '3', 'tr_0 tr_420000 tr_420500', '12');
INSERT INTO `areas` VALUES ('420600', '襄阳市', '420000', '襄阳', '112.14415', '32.042427', '2', 'tr_0 tr_420000', '13');
INSERT INTO `areas` VALUES ('420602', '襄城区', '420600', '襄城', '112.15033', '32.015087', '3', 'tr_0 tr_420000 tr_420600', '6');
INSERT INTO `areas` VALUES ('420606', '樊城区', '420600', '樊城', '112.139572', '32.05859', '3', 'tr_0 tr_420000 tr_420600', '2');
INSERT INTO `areas` VALUES ('420607', '襄州区', '420600', '襄州', '112.19738', '32.085518', '3', 'tr_0 tr_420000 tr_420600', '7');
INSERT INTO `areas` VALUES ('420624', '南漳县', '420600', '南漳', '111.844421', '31.77692', '3', 'tr_0 tr_420000 tr_420600', '5');
INSERT INTO `areas` VALUES ('420625', '谷城县', '420600', '谷城', '111.640144', '32.262676', '3', 'tr_0 tr_420000 tr_420600', '3');
INSERT INTO `areas` VALUES ('420626', '保康县', '420600', '保康', '111.262238', '31.873507', '3', 'tr_0 tr_420000 tr_420600', '1');
INSERT INTO `areas` VALUES ('420682', '老河口市', '420600', '老河口', '111.675735', '32.385437', '3', 'tr_0 tr_420000 tr_420600', '4');
INSERT INTO `areas` VALUES ('420683', '枣阳市', '420600', '枣阳', '112.765266', '32.123081', '3', 'tr_0 tr_420000 tr_420600', '9');
INSERT INTO `areas` VALUES ('420684', '宜城市', '420600', '宜城', '112.261444', '31.709204', '3', 'tr_0 tr_420000 tr_420600', '8');
INSERT INTO `areas` VALUES ('420700', '鄂州市', '420000', '鄂州', '114.890594', '30.396536', '2', 'tr_0 tr_420000', '2');
INSERT INTO `areas` VALUES ('420702', '梁子湖区', '420700', '梁子湖', '114.681969', '30.09819', '3', 'tr_0 tr_420000 tr_420700', '3');
INSERT INTO `areas` VALUES ('420703', '华容区', '420700', '华容', '114.741478', '30.534468', '3', 'tr_0 tr_420000 tr_420700', '2');
INSERT INTO `areas` VALUES ('420704', '鄂城区', '420700', '鄂城', '114.890015', '30.39669', '3', 'tr_0 tr_420000 tr_420700', '1');
INSERT INTO `areas` VALUES ('420800', '荆门市', '420000', '荆门', '112.204254', '31.035419', '2', 'tr_0 tr_420000', '5');
INSERT INTO `areas` VALUES ('420802', '东宝区', '420800', '东宝', '112.204803', '31.033461', '3', 'tr_0 tr_420000 tr_420800', '1');
INSERT INTO `areas` VALUES ('420804', '掇刀区', '420800', '掇刀', '112.19841', '30.980799', '3', 'tr_0 tr_420000 tr_420800', '2');
INSERT INTO `areas` VALUES ('420821', '京山县', '420800', '京山', '113.114594', '31.022457', '3', 'tr_0 tr_420000 tr_420800', '3');
INSERT INTO `areas` VALUES ('420822', '沙洋县', '420800', '沙洋', '112.595215', '30.70359', '3', 'tr_0 tr_420000 tr_420800', '4');
INSERT INTO `areas` VALUES ('420881', '钟祥市', '420800', '钟祥', '112.587265', '31.165573', '3', 'tr_0 tr_420000 tr_420800', '5');
INSERT INTO `areas` VALUES ('420900', '孝感市', '420000', '孝感', '113.926659', '30.926422', '2', 'tr_0 tr_420000', '16');
INSERT INTO `areas` VALUES ('420902', '孝南区', '420900', '孝南', '113.92585', '30.925966', '3', 'tr_0 tr_420000 tr_420900', '5');
INSERT INTO `areas` VALUES ('420921', '孝昌县', '420900', '孝昌', '113.98896', '31.251617', '3', 'tr_0 tr_420000 tr_420900', '4');
INSERT INTO `areas` VALUES ('420922', '大悟县', '420900', '大悟', '114.126251', '31.565483', '3', 'tr_0 tr_420000 tr_420900', '2');
INSERT INTO `areas` VALUES ('420923', '云梦县', '420900', '云梦', '113.750618', '31.02169', '3', 'tr_0 tr_420000 tr_420900', '7');
INSERT INTO `areas` VALUES ('420981', '应城市', '420900', '应城', '113.573845', '30.939037', '3', 'tr_0 tr_420000 tr_420900', '6');
INSERT INTO `areas` VALUES ('420982', '安陆市', '420900', '安陆', '113.690399', '31.26174', '3', 'tr_0 tr_420000 tr_420900', '1');
INSERT INTO `areas` VALUES ('420984', '汉川市', '420900', '汉川', '113.835304', '30.652164', '3', 'tr_0 tr_420000 tr_420900', '3');
INSERT INTO `areas` VALUES ('421000', '荆州市', '420000', '荆州', '112.238129', '30.326857', '2', 'tr_0 tr_420000', '6');
INSERT INTO `areas` VALUES ('421002', '沙市区', '421000', '沙市', '112.257431', '30.315895', '3', 'tr_0 tr_420000 tr_421000', '6');
INSERT INTO `areas` VALUES ('421003', '荆州区', '421000', '荆州', '112.195351', '30.350674', '3', 'tr_0 tr_420000 tr_421000', '5');
INSERT INTO `areas` VALUES ('421022', '公安县', '421000', '公安', '112.230179', '30.059065', '3', 'tr_0 tr_420000 tr_421000', '1');
INSERT INTO `areas` VALUES ('421023', '监利县', '421000', '监利', '112.904343', '29.82008', '3', 'tr_0 tr_420000 tr_421000', '4');
INSERT INTO `areas` VALUES ('421024', '江陵县', '421000', '江陵', '112.417351', '30.033918', '3', 'tr_0 tr_420000 tr_421000', '3');
INSERT INTO `areas` VALUES ('421081', '石首市', '421000', '石首', '112.408867', '29.716436', '3', 'tr_0 tr_420000 tr_421000', '7');
INSERT INTO `areas` VALUES ('421083', '洪湖市', '421000', '洪湖', '113.470306', '29.812969', '3', 'tr_0 tr_420000 tr_421000', '2');
INSERT INTO `areas` VALUES ('421087', '松滋市', '421000', '松滋', '111.778183', '30.176037', '3', 'tr_0 tr_420000 tr_421000', '8');
INSERT INTO `areas` VALUES ('421100', '黄冈市', '420000', '黄冈', '114.879364', '30.447712', '2', 'tr_0 tr_420000', '3');
INSERT INTO `areas` VALUES ('421102', '黄州区', '421100', '黄州', '114.878937', '30.447435', '3', 'tr_0 tr_420000 tr_421100', '3');
INSERT INTO `areas` VALUES ('421121', '团风县', '421100', '团风', '114.872032', '30.635691', '3', 'tr_0 tr_420000 tr_421100', '7');
INSERT INTO `areas` VALUES ('421122', '红安县', '421100', '红安', '114.615097', '31.284777', '3', 'tr_0 tr_420000 tr_421100', '1');
INSERT INTO `areas` VALUES ('421123', '罗田县', '421100', '罗田', '115.398987', '30.781679', '3', 'tr_0 tr_420000 tr_421100', '4');
INSERT INTO `areas` VALUES ('421124', '英山县', '421100', '英山', '115.677528', '30.735794', '3', 'tr_0 tr_420000 tr_421100', '10');
INSERT INTO `areas` VALUES ('421125', '浠水县', '421100', '浠水', '115.263443', '30.454838', '3', 'tr_0 tr_420000 tr_421100', '9');
INSERT INTO `areas` VALUES ('421126', '蕲春县', '421100', '蕲春', '115.433968', '30.234926', '3', 'tr_0 tr_420000 tr_421100', '6');
INSERT INTO `areas` VALUES ('421127', '黄梅县', '421100', '黄梅', '115.942551', '30.075113', '3', 'tr_0 tr_420000 tr_421100', '2');
INSERT INTO `areas` VALUES ('421181', '麻城市', '421100', '麻城', '115.025414', '31.177906', '3', 'tr_0 tr_420000 tr_421100', '5');
INSERT INTO `areas` VALUES ('421182', '武穴市', '421100', '武穴', '115.562424', '29.849342', '3', 'tr_0 tr_420000 tr_421100', '8');
INSERT INTO `areas` VALUES ('421200', '咸宁市', '420000', '咸宁', '114.328964', '29.832798', '2', 'tr_0 tr_420000', '14');
INSERT INTO `areas` VALUES ('421202', '咸安区', '421200', '咸安', '114.333893', '29.824717', '3', 'tr_0 tr_420000 tr_421200', '6');
INSERT INTO `areas` VALUES ('421221', '嘉鱼县', '421200', '嘉鱼', '113.921547', '29.973364', '3', 'tr_0 tr_420000 tr_421200', '3');
INSERT INTO `areas` VALUES ('421222', '通城县', '421200', '通城', '113.814133', '29.246077', '3', 'tr_0 tr_420000 tr_421200', '4');
INSERT INTO `areas` VALUES ('421223', '崇阳县', '421200', '崇阳', '114.049957', '29.54101', '3', 'tr_0 tr_420000 tr_421200', '2');
INSERT INTO `areas` VALUES ('421224', '通山县', '421200', '通山', '114.493164', '29.604456', '3', 'tr_0 tr_420000 tr_421200', '5');
INSERT INTO `areas` VALUES ('421281', '赤壁市', '421200', '赤壁', '113.883659', '29.716879', '3', 'tr_0 tr_420000 tr_421200', '1');
INSERT INTO `areas` VALUES ('421300', '随州市', '420000', '随州', '113.373772', '31.717497', '2', 'tr_0 tr_420000', '10');
INSERT INTO `areas` VALUES ('421302', '曾都区', '421300', '曾都', '113.374519', '31.717522', '3', 'tr_0 tr_420000 tr_421300', '3');
INSERT INTO `areas` VALUES ('421321', '随县', '421300', '随县', '113.301384', '31.854246', '3', 'tr_0 tr_420000 tr_421300', '2');
INSERT INTO `areas` VALUES ('421381', '广水市', '421300', '广水', '113.826599', '31.617731', '3', 'tr_0 tr_420000 tr_421300', '1');
INSERT INTO `areas` VALUES ('422800', '恩施土家族苗族自治州', '420000', '恩施', '109.486992', '30.283113', '2', 'tr_0 tr_420000', '1');
INSERT INTO `areas` VALUES ('422801', '恩施市', '422800', '恩施', '109.486763', '30.282406', '3', 'tr_0 tr_420000 tr_422800', '2');
INSERT INTO `areas` VALUES ('422802', '利川市', '422800', '利川', '108.943489', '30.294247', '3', 'tr_0 tr_420000 tr_422800', '6');
INSERT INTO `areas` VALUES ('422822', '建始县', '422800', '建始', '109.723824', '30.601631', '3', 'tr_0 tr_420000 tr_422800', '4');
INSERT INTO `areas` VALUES ('422823', '巴东县', '422800', '巴东', '110.336662', '31.041403', '3', 'tr_0 tr_420000 tr_422800', '1');
INSERT INTO `areas` VALUES ('422825', '宣恩县', '422800', '宣恩', '109.482819', '29.98867', '3', 'tr_0 tr_420000 tr_422800', '8');
INSERT INTO `areas` VALUES ('422826', '咸丰县', '422800', '咸丰', '109.150414', '29.678967', '3', 'tr_0 tr_420000 tr_422800', '7');
INSERT INTO `areas` VALUES ('422827', '来凤县', '422800', '来凤', '109.408325', '29.506945', '3', 'tr_0 tr_420000 tr_422800', '5');
INSERT INTO `areas` VALUES ('422828', '鹤峰县', '422800', '鹤峰', '110.033699', '29.887299', '3', 'tr_0 tr_420000 tr_422800', '3');
INSERT INTO `areas` VALUES ('429004', '仙桃市', '420000', '仙桃', '113.453972', '30.364952', '2', 'tr_0 tr_420000', '15');
INSERT INTO `areas` VALUES ('429005', '潜江市', '420000', '潜江', '112.896866', '30.421215', '2', 'tr_0 tr_420000', '7');
INSERT INTO `areas` VALUES ('429006', '天门市', '420000', '天门', '113.165863', '30.653061', '2', 'tr_0 tr_420000', '11');
INSERT INTO `areas` VALUES ('429021', '神农架林区', '420000', '神农架', '114.298569', '30.584354', '2', 'tr_0 tr_420000', '8');
INSERT INTO `areas` VALUES ('430000', '湖南省', '1', '湖南', '112.982277', '28.19409', '1', 'tr_0', '18');
INSERT INTO `areas` VALUES ('430100', '长沙市', '430000', '长沙', '112.982277', '28.19409', '2', 'tr_0 tr_430000', '2');
INSERT INTO `areas` VALUES ('430102', '芙蓉区', '430100', '芙蓉', '112.988091', '28.193106', '3', 'tr_0 tr_430000 tr_430100', '2');
INSERT INTO `areas` VALUES ('430103', '天心区', '430100', '天心', '112.973068', '28.192375', '3', 'tr_0 tr_430000 tr_430100', '6');
INSERT INTO `areas` VALUES ('430104', '岳麓区', '430100', '岳麓', '112.911591', '28.213043', '3', 'tr_0 tr_430000 tr_430100', '8');
INSERT INTO `areas` VALUES ('430105', '开福区', '430100', '开福', '112.985527', '28.201336', '3', 'tr_0 tr_430000 tr_430100', '3');
INSERT INTO `areas` VALUES ('430111', '雨花区', '430100', '雨花', '113.016335', '28.109938', '3', 'tr_0 tr_430000 tr_430100', '9');
INSERT INTO `areas` VALUES ('430121', '长沙县', '430100', '长沙', '113.080101', '28.237888', '3', 'tr_0 tr_430000 tr_430100', '1');
INSERT INTO `areas` VALUES ('430122', '望城区', '430100', '望城', '112.81955', '28.347458', '3', 'tr_0 tr_430000 tr_430100', '7');
INSERT INTO `areas` VALUES ('430124', '宁乡县', '430100', '宁乡', '112.553185', '28.253927', '3', 'tr_0 tr_430000 tr_430100', '5');
INSERT INTO `areas` VALUES ('430181', '浏阳市', '430100', '浏阳', '113.633301', '28.141111', '3', 'tr_0 tr_430000 tr_430100', '4');
INSERT INTO `areas` VALUES ('430200', '株洲市', '430000', '株洲', '113.151733', '27.835806', '2', 'tr_0 tr_430000', '14');
INSERT INTO `areas` VALUES ('430202', '荷塘区', '430200', '荷塘', '113.162544', '27.833036', '3', 'tr_0 tr_430000 tr_430200', '2');
INSERT INTO `areas` VALUES ('430203', '芦淞区', '430200', '芦淞', '113.155167', '27.827246', '3', 'tr_0 tr_430000 tr_430200', '4');
INSERT INTO `areas` VALUES ('430204', '石峰区', '430200', '石峰', '113.112953', '27.871944', '3', 'tr_0 tr_430000 tr_430200', '5');
INSERT INTO `areas` VALUES ('430211', '天元区', '430200', '天元', '113.136253', '27.826908', '3', 'tr_0 tr_430000 tr_430200', '6');
INSERT INTO `areas` VALUES ('430221', '株洲县', '430200', '株洲', '113.146179', '27.705845', '3', 'tr_0 tr_430000 tr_430200', '9');
INSERT INTO `areas` VALUES ('430223', '攸县', '430200', '攸县', '113.345772', '27.000071', '3', 'tr_0 tr_430000 tr_430200', '8');
INSERT INTO `areas` VALUES ('430224', '茶陵县', '430200', '茶陵', '113.546509', '26.789534', '3', 'tr_0 tr_430000 tr_430200', '1');
INSERT INTO `areas` VALUES ('430225', '炎陵县', '430200', '炎陵', '113.776886', '26.489458', '3', 'tr_0 tr_430000 tr_430200', '7');
INSERT INTO `areas` VALUES ('430281', '醴陵市', '430200', '醴陵', '113.507156', '27.657873', '3', 'tr_0 tr_430000 tr_430200', '3');
INSERT INTO `areas` VALUES ('430300', '湘潭市', '430000', '湘潭', '112.944054', '27.829729', '2', 'tr_0 tr_430000', '8');
INSERT INTO `areas` VALUES ('430302', '雨湖区', '430300', '雨湖', '112.907425', '27.860769', '3', 'tr_0 tr_430000 tr_430300', '5');
INSERT INTO `areas` VALUES ('430304', '岳塘区', '430300', '岳塘', '112.927704', '27.828854', '3', 'tr_0 tr_430000 tr_430300', '4');
INSERT INTO `areas` VALUES ('430321', '湘潭县', '430300', '湘潭', '112.952827', '27.778601', '3', 'tr_0 tr_430000 tr_430300', '2');
INSERT INTO `areas` VALUES ('430381', '湘乡市', '430300', '湘乡', '112.525215', '27.734919', '3', 'tr_0 tr_430000 tr_430300', '3');
INSERT INTO `areas` VALUES ('430382', '韶山市', '430300', '韶山', '112.528481', '27.922682', '3', 'tr_0 tr_430000 tr_430300', '1');
INSERT INTO `areas` VALUES ('430400', '衡阳市', '430000', '衡阳', '112.607697', '26.900358', '2', 'tr_0 tr_430000', '4');
INSERT INTO `areas` VALUES ('430405', '珠晖区', '430400', '珠晖', '112.626328', '26.891064', '3', 'tr_0 tr_430000 tr_430400', '12');
INSERT INTO `areas` VALUES ('430406', '雁峰区', '430400', '雁峰', '112.612244', '26.893694', '3', 'tr_0 tr_430000 tr_430400', '10');
INSERT INTO `areas` VALUES ('430407', '石鼓区', '430400', '石鼓', '112.607635', '26.903908', '3', 'tr_0 tr_430000 tr_430400', '9');
INSERT INTO `areas` VALUES ('430408', '蒸湘区', '430400', '蒸湘', '112.57061', '26.890869', '3', 'tr_0 tr_430000 tr_430400', '11');
INSERT INTO `areas` VALUES ('430412', '南岳区', '430400', '南岳', '112.734146', '27.240536', '3', 'tr_0 tr_430000 tr_430400', '7');
INSERT INTO `areas` VALUES ('430421', '衡阳县', '430400', '衡阳', '112.379646', '26.962387', '3', 'tr_0 tr_430000 tr_430400', '5');
INSERT INTO `areas` VALUES ('430422', '衡南县', '430400', '衡南', '112.67746', '26.739973', '3', 'tr_0 tr_430000 tr_430400', '3');
INSERT INTO `areas` VALUES ('430423', '衡山县', '430400', '衡山', '112.869713', '27.234808', '3', 'tr_0 tr_430000 tr_430400', '4');
INSERT INTO `areas` VALUES ('430424', '衡东县', '430400', '衡东', '112.950409', '27.08353', '3', 'tr_0 tr_430000 tr_430400', '2');
INSERT INTO `areas` VALUES ('430426', '祁东县', '430400', '祁东', '112.111191', '26.787109', '3', 'tr_0 tr_430000 tr_430400', '8');
INSERT INTO `areas` VALUES ('430481', '耒阳市', '430400', '耒阳', '112.847214', '26.414162', '3', 'tr_0 tr_430000 tr_430400', '6');
INSERT INTO `areas` VALUES ('430482', '常宁市', '430400', '常宁', '112.39682', '26.406773', '3', 'tr_0 tr_430000 tr_430400', '1');
INSERT INTO `areas` VALUES ('430500', '邵阳市', '430000', '邵阳', '111.469231', '27.237843', '2', 'tr_0 tr_430000', '7');
INSERT INTO `areas` VALUES ('430502', '双清区', '430500', '双清', '111.479759', '27.240002', '3', 'tr_0 tr_430000 tr_430500', '8');
INSERT INTO `areas` VALUES ('430503', '大祥区', '430500', '大祥', '111.462967', '27.233593', '3', 'tr_0 tr_430000 tr_430500', '3');
INSERT INTO `areas` VALUES ('430511', '北塔区', '430500', '北塔', '111.452316', '27.245687', '3', 'tr_0 tr_430000 tr_430500', '1');
INSERT INTO `areas` VALUES ('430521', '邵东县', '430500', '邵东', '111.743172', '27.257273', '3', 'tr_0 tr_430000 tr_430500', '6');
INSERT INTO `areas` VALUES ('430522', '新邵县', '430500', '新邵', '111.459763', '27.311428', '3', 'tr_0 tr_430000 tr_430500', '12');
INSERT INTO `areas` VALUES ('430523', '邵阳县', '430500', '邵阳', '111.275703', '26.989714', '3', 'tr_0 tr_430000 tr_430500', '7');
INSERT INTO `areas` VALUES ('430524', '隆回县', '430500', '隆回', '111.038788', '27.116001', '3', 'tr_0 tr_430000 tr_430500', '5');
INSERT INTO `areas` VALUES ('430525', '洞口县', '430500', '洞口', '110.579208', '27.062286', '3', 'tr_0 tr_430000 tr_430500', '4');
INSERT INTO `areas` VALUES ('430527', '绥宁县', '430500', '绥宁', '110.155075', '26.580622', '3', 'tr_0 tr_430000 tr_430500', '9');
INSERT INTO `areas` VALUES ('430528', '新宁县', '430500', '新宁', '110.859116', '26.438911', '3', 'tr_0 tr_430000 tr_430500', '11');
INSERT INTO `areas` VALUES ('430529', '城步苗族自治县', '430500', '城步', '110.313225', '26.363575', '3', 'tr_0 tr_430000 tr_430500', '2');
INSERT INTO `areas` VALUES ('430581', '武冈市', '430500', '武冈', '110.636803', '26.732086', '3', 'tr_0 tr_430000 tr_430500', '10');
INSERT INTO `areas` VALUES ('430600', '岳阳市', '430000', '岳阳', '113.132858', '29.370291', '2', 'tr_0 tr_430000', '12');
INSERT INTO `areas` VALUES ('430602', '岳阳楼区', '430600', '岳阳楼', '113.12075', '29.366783', '3', 'tr_0 tr_430000 tr_430600', '7');
INSERT INTO `areas` VALUES ('430603', '云溪区', '430600', '云溪', '113.273872', '29.473394', '3', 'tr_0 tr_430000 tr_430600', '9');
INSERT INTO `areas` VALUES ('430611', '君山区', '430600', '君山', '113.004082', '29.438063', '3', 'tr_0 tr_430000 tr_430600', '2');
INSERT INTO `areas` VALUES ('430621', '岳阳县', '430600', '岳阳', '113.116074', '29.144842', '3', 'tr_0 tr_430000 tr_430600', '8');
INSERT INTO `areas` VALUES ('430623', '华容县', '430600', '华容', '112.559372', '29.524107', '3', 'tr_0 tr_430000 tr_430600', '1');
INSERT INTO `areas` VALUES ('430624', '湘阴县', '430600', '湘阴', '112.889748', '28.677498', '3', 'tr_0 tr_430000 tr_430600', '6');
INSERT INTO `areas` VALUES ('430626', '平江县', '430600', '平江', '113.59375', '28.701523', '3', 'tr_0 tr_430000 tr_430600', '5');
INSERT INTO `areas` VALUES ('430681', '汨罗市', '430600', '汨罗', '113.079422', '28.803148', '3', 'tr_0 tr_430000 tr_430600', '4');
INSERT INTO `areas` VALUES ('430682', '临湘市', '430600', '临湘', '113.450806', '29.471594', '3', 'tr_0 tr_430000 tr_430600', '3');
INSERT INTO `areas` VALUES ('430700', '常德市', '430000', '常德', '111.691345', '29.040224', '2', 'tr_0 tr_430000', '1');
INSERT INTO `areas` VALUES ('430702', '武陵区', '430700', '武陵', '111.69072', '29.040478', '3', 'tr_0 tr_430000 tr_430700', '9');
INSERT INTO `areas` VALUES ('430703', '鼎城区', '430700', '鼎城', '111.685326', '29.014425', '3', 'tr_0 tr_430000 tr_430700', '2');
INSERT INTO `areas` VALUES ('430721', '安乡县', '430700', '安乡', '112.172287', '29.414482', '3', 'tr_0 tr_430000 tr_430700', '1');
INSERT INTO `areas` VALUES ('430722', '汉寿县', '430700', '汉寿', '111.968506', '28.907318', '3', 'tr_0 tr_430000 tr_430700', '3');
INSERT INTO `areas` VALUES ('430723', '澧县', '430700', '澧县', '111.761681', '29.642639', '3', 'tr_0 tr_430000 tr_430700', '6');
INSERT INTO `areas` VALUES ('430724', '临澧县', '430700', '临澧', '111.645599', '29.443216', '3', 'tr_0 tr_430000 tr_430700', '5');
INSERT INTO `areas` VALUES ('430725', '桃源县', '430700', '桃源', '111.484505', '28.902735', '3', 'tr_0 tr_430000 tr_430700', '8');
INSERT INTO `areas` VALUES ('430726', '石门县', '430700', '石门', '111.379089', '29.584703', '3', 'tr_0 tr_430000 tr_430700', '7');
INSERT INTO `areas` VALUES ('430781', '津市市', '430700', '津市', '111.879608', '29.630867', '3', 'tr_0 tr_430000 tr_430700', '4');
INSERT INTO `areas` VALUES ('430800', '张家界市', '430000', '张家界', '110.479919', '29.127401', '2', 'tr_0 tr_430000', '13');
INSERT INTO `areas` VALUES ('430802', '永定区', '430800', '永定', '110.484558', '29.125961', '3', 'tr_0 tr_430000 tr_430800', '4');
INSERT INTO `areas` VALUES ('430811', '武陵源区', '430800', '武陵源', '110.547577', '29.347828', '3', 'tr_0 tr_430000 tr_430800', '3');
INSERT INTO `areas` VALUES ('430821', '慈利县', '430800', '慈利', '111.132706', '29.423876', '3', 'tr_0 tr_430000 tr_430800', '1');
INSERT INTO `areas` VALUES ('430822', '桑植县', '430800', '桑植', '110.16404', '29.399939', '3', 'tr_0 tr_430000 tr_430800', '2');
INSERT INTO `areas` VALUES ('430900', '益阳市', '430000', '益阳', '112.355042', '28.570066', '2', 'tr_0 tr_430000', '10');
INSERT INTO `areas` VALUES ('430902', '资阳区', '430900', '资阳', '112.330841', '28.592772', '3', 'tr_0 tr_430000 tr_430900', '6');
INSERT INTO `areas` VALUES ('430903', '赫山区', '430900', '赫山', '112.360947', '28.568327', '3', 'tr_0 tr_430000 tr_430900', '2');
INSERT INTO `areas` VALUES ('430921', '南县', '430900', '南县', '112.4104', '29.372181', '3', 'tr_0 tr_430000 tr_430900', '3');
INSERT INTO `areas` VALUES ('430922', '桃江县', '430900', '桃江', '112.139732', '28.520992', '3', 'tr_0 tr_430000 tr_430900', '4');
INSERT INTO `areas` VALUES ('430923', '安化县', '430900', '安化', '111.221825', '28.37742', '3', 'tr_0 tr_430000 tr_430900', '1');
INSERT INTO `areas` VALUES ('430981', '沅江市', '430900', '沅江', '112.361092', '28.839712', '3', 'tr_0 tr_430000 tr_430900', '5');
INSERT INTO `areas` VALUES ('431000', '郴州市', '430000', '郴州', '113.032066', '25.793589', '2', 'tr_0 tr_430000', '3');
INSERT INTO `areas` VALUES ('431002', '北湖区', '431000', '北湖', '113.032211', '25.792627', '3', 'tr_0 tr_430000 tr_431000', '2');
INSERT INTO `areas` VALUES ('431003', '苏仙区', '431000', '苏仙', '113.038696', '25.793158', '3', 'tr_0 tr_430000 tr_431000', '8');
INSERT INTO `areas` VALUES ('431021', '桂阳县', '431000', '桂阳', '112.734467', '25.737448', '3', 'tr_0 tr_430000 tr_431000', '4');
INSERT INTO `areas` VALUES ('431022', '宜章县', '431000', '宜章', '112.947884', '25.394344', '3', 'tr_0 tr_430000 tr_431000', '9');
INSERT INTO `areas` VALUES ('431023', '永兴县', '431000', '永兴', '113.114822', '26.129393', '3', 'tr_0 tr_430000 tr_431000', '10');
INSERT INTO `areas` VALUES ('431024', '嘉禾县', '431000', '嘉禾', '112.370621', '25.587309', '3', 'tr_0 tr_430000 tr_431000', '5');
INSERT INTO `areas` VALUES ('431025', '临武县', '431000', '临武', '112.56459', '25.279119', '3', 'tr_0 tr_430000 tr_431000', '6');
INSERT INTO `areas` VALUES ('431026', '汝城县', '431000', '汝城', '113.685684', '25.553759', '3', 'tr_0 tr_430000 tr_431000', '7');
INSERT INTO `areas` VALUES ('431027', '桂东县', '431000', '桂东', '113.945877', '26.073917', '3', 'tr_0 tr_430000 tr_431000', '3');
INSERT INTO `areas` VALUES ('431028', '安仁县', '431000', '安仁', '113.272171', '26.708626', '3', 'tr_0 tr_430000 tr_431000', '1');
INSERT INTO `areas` VALUES ('431081', '资兴市', '431000', '资兴', '113.236816', '25.974152', '3', 'tr_0 tr_430000 tr_431000', '11');
INSERT INTO `areas` VALUES ('431100', '永州市', '430000', '永州', '111.608017', '26.434517', '2', 'tr_0 tr_430000', '11');
INSERT INTO `areas` VALUES ('431102', '零陵区', '431100', '零陵', '111.62635', '26.223347', '3', 'tr_0 tr_430000 tr_431100', '7');
INSERT INTO `areas` VALUES ('431103', '冷水滩区', '431100', '冷水滩', '111.607155', '26.434364', '3', 'tr_0 tr_430000 tr_431100', '6');
INSERT INTO `areas` VALUES ('431121', '祁阳县', '431100', '祁阳', '111.857338', '26.58593', '3', 'tr_0 tr_430000 tr_431100', '9');
INSERT INTO `areas` VALUES ('431122', '东安县', '431100', '东安', '111.313034', '26.397278', '3', 'tr_0 tr_430000 tr_431100', '2');
INSERT INTO `areas` VALUES ('431123', '双牌县', '431100', '双牌', '111.662148', '25.959396', '3', 'tr_0 tr_430000 tr_431100', '10');
INSERT INTO `areas` VALUES ('431124', '道县', '431100', '道县', '111.591614', '25.518444', '3', 'tr_0 tr_430000 tr_431100', '1');
INSERT INTO `areas` VALUES ('431125', '江永县', '431100', '江永', '111.346802', '25.268154', '3', 'tr_0 tr_430000 tr_431100', '4');
INSERT INTO `areas` VALUES ('431126', '宁远县', '431100', '宁远', '111.944527', '25.584112', '3', 'tr_0 tr_430000 tr_431100', '8');
INSERT INTO `areas` VALUES ('431127', '蓝山县', '431100', '蓝山', '112.194199', '25.375256', '3', 'tr_0 tr_430000 tr_431100', '5');
INSERT INTO `areas` VALUES ('431128', '新田县', '431100', '新田', '112.220345', '25.906927', '3', 'tr_0 tr_430000 tr_431100', '11');
INSERT INTO `areas` VALUES ('431129', '江华瑶族自治县', '431100', '江华', '111.577278', '25.182596', '3', 'tr_0 tr_430000 tr_431100', '3');
INSERT INTO `areas` VALUES ('431200', '怀化市', '430000', '怀化', '109.978241', '27.550081', '2', 'tr_0 tr_430000', '5');
INSERT INTO `areas` VALUES ('431202', '鹤城区', '431200', '鹤城', '109.982239', '27.548473', '3', 'tr_0 tr_430000 tr_431200', '2');
INSERT INTO `areas` VALUES ('431221', '中方县', '431200', '中方', '109.948059', '27.437361', '3', 'tr_0 tr_430000 tr_431200', '12');
INSERT INTO `areas` VALUES ('431222', '沅陵县', '431200', '沅陵', '110.399162', '28.455553', '3', 'tr_0 tr_430000 tr_431200', '10');
INSERT INTO `areas` VALUES ('431223', '辰溪县', '431200', '辰溪', '110.196953', '28.005474', '3', 'tr_0 tr_430000 tr_431200', '1');
INSERT INTO `areas` VALUES ('431224', '溆浦县', '431200', '溆浦', '110.593376', '27.903803', '3', 'tr_0 tr_430000 tr_431200', '9');
INSERT INTO `areas` VALUES ('431225', '会同县', '431200', '会同', '109.720787', '26.870789', '3', 'tr_0 tr_430000 tr_431200', '4');
INSERT INTO `areas` VALUES ('431226', '麻阳苗族自治县', '431200', '麻阳', '109.802811', '27.865992', '3', 'tr_0 tr_430000 tr_431200', '6');
INSERT INTO `areas` VALUES ('431227', '新晃侗族自治县', '431200', '新晃', '109.174446', '27.359898', '3', 'tr_0 tr_430000 tr_431200', '8');
INSERT INTO `areas` VALUES ('431228', '芷江侗族自治县', '431200', '芷江', '109.687775', '27.437996', '3', 'tr_0 tr_430000 tr_431200', '11');
INSERT INTO `areas` VALUES ('431229', '靖州苗族侗族自治县', '431200', '靖州', '109.691162', '26.573511', '3', 'tr_0 tr_430000 tr_431200', '5');
INSERT INTO `areas` VALUES ('431230', '通道侗族自治县', '431200', '通道', '109.783356', '26.158348', '3', 'tr_0 tr_430000 tr_431200', '7');
INSERT INTO `areas` VALUES ('431281', '洪江市', '431200', '洪江', '109.831764', '27.201876', '3', 'tr_0 tr_430000 tr_431200', '3');
INSERT INTO `areas` VALUES ('431300', '娄底市', '430000', '娄底', '112.008499', '27.728136', '2', 'tr_0 tr_430000', '6');
INSERT INTO `areas` VALUES ('431302', '娄星区', '431300', '娄星', '112.008484', '27.726643', '3', 'tr_0 tr_430000 tr_431300', '3');
INSERT INTO `areas` VALUES ('431321', '双峰县', '431300', '双峰', '112.198242', '27.459126', '3', 'tr_0 tr_430000 tr_431300', '4');
INSERT INTO `areas` VALUES ('431322', '新化县', '431300', '新化', '111.306747', '27.737455', '3', 'tr_0 tr_430000 tr_431300', '5');
INSERT INTO `areas` VALUES ('431381', '冷水江市', '431300', '冷水江', '111.434677', '27.685759', '3', 'tr_0 tr_430000 tr_431300', '1');
INSERT INTO `areas` VALUES ('431382', '涟源市', '431300', '涟源', '111.670845', '27.692301', '3', 'tr_0 tr_430000 tr_431300', '2');
INSERT INTO `areas` VALUES ('433100', '湘西土家族苗族自治州', '430000', '湘西', '109.739738', '28.314297', '2', 'tr_0 tr_430000', '9');
INSERT INTO `areas` VALUES ('433101', '吉首市', '433100', '吉首', '109.738274', '28.314827', '3', 'tr_0 tr_430000 tr_433100', '5');
INSERT INTO `areas` VALUES ('433122', '泸溪县', '433100', '泸溪', '110.214432', '28.214516', '3', 'tr_0 tr_430000 tr_433100', '7');
INSERT INTO `areas` VALUES ('433123', '凤凰县', '433100', '凤凰', '109.59919', '27.948309', '3', 'tr_0 tr_430000 tr_433100', '2');
INSERT INTO `areas` VALUES ('433124', '花垣县', '433100', '花垣', '109.479065', '28.581352', '3', 'tr_0 tr_430000 tr_433100', '4');
INSERT INTO `areas` VALUES ('433125', '保靖县', '433100', '保靖', '109.651443', '28.709604', '3', 'tr_0 tr_430000 tr_433100', '1');
INSERT INTO `areas` VALUES ('433126', '古丈县', '433100', '古丈', '109.949593', '28.616974', '3', 'tr_0 tr_430000 tr_433100', '3');
INSERT INTO `areas` VALUES ('433127', '永顺县', '433100', '永顺', '109.853294', '28.998068', '3', 'tr_0 tr_430000 tr_433100', '8');
INSERT INTO `areas` VALUES ('433130', '龙山县', '433100', '龙山', '109.441193', '29.453438', '3', 'tr_0 tr_430000 tr_433100', '6');
INSERT INTO `areas` VALUES ('440000', '广东省', '1', '广东', '113.28064', '23.125177', '1', 'tr_0', '19');
INSERT INTO `areas` VALUES ('440100', '广州市', '440000', '广州', '113.28064', '23.125177', '2', 'tr_0 tr_440000', '5');
INSERT INTO `areas` VALUES ('440103', '荔湾区', '440100', '荔湾', '113.243034', '23.124943', '3', 'tr_0 tr_440000 tr_440100', '7');
INSERT INTO `areas` VALUES ('440104', '越秀区', '440100', '越秀', '113.280716', '23.125624', '3', 'tr_0 tr_440000 tr_440100', '3');
INSERT INTO `areas` VALUES ('440105', '海珠区', '440100', '海珠', '113.262009', '23.10313', '3', 'tr_0 tr_440000 tr_440100', '4');
INSERT INTO `areas` VALUES ('440106', '天河区', '440100', '天河', '113.335365', '23.13559', '3', 'tr_0 tr_440000 tr_440100', '11');
INSERT INTO `areas` VALUES ('440111', '白云区', '440100', '白云', '113.262833', '23.162281', '3', 'tr_0 tr_440000 tr_440100', '1');
INSERT INTO `areas` VALUES ('440112', '黄埔区', '440100', '黄埔', '113.45076', '23.103239', '3', 'tr_0 tr_440000 tr_440100', '6');
INSERT INTO `areas` VALUES ('440113', '番禺区', '440100', '番禺', '113.364616', '22.938581', '3', 'tr_0 tr_440000 tr_440100', '10');
INSERT INTO `areas` VALUES ('440114', '花都区', '440100', '花都', '113.211182', '23.39205', '3', 'tr_0 tr_440000 tr_440100', '5');
INSERT INTO `areas` VALUES ('440115', '南沙区', '440100', '南沙', '113.537376', '22.794531', '3', 'tr_0 tr_440000 tr_440100', '9');
INSERT INTO `areas` VALUES ('440116', '萝岗区', '440100', '萝岗', '113.28064', '23.125177', '3', 'tr_0 tr_440000 tr_440100', '8');
INSERT INTO `areas` VALUES ('440183', '增城市', '440100', '增城', '113.28064', '23.125177', '3', 'tr_0 tr_440000 tr_440100', '12');
INSERT INTO `areas` VALUES ('440184', '从化市', '440100', '从化', '113.28064', '23.125177', '3', 'tr_0 tr_440000 tr_440100', '2');
INSERT INTO `areas` VALUES ('440200', '韶关市', '440000', '韶关', '113.591545', '24.801323', '2', 'tr_0 tr_440000', '15');
INSERT INTO `areas` VALUES ('440203', '武江区', '440200', '武江', '113.588287', '24.800159', '3', 'tr_0 tr_440000 tr_440200', '8');
INSERT INTO `areas` VALUES ('440204', '浈江区', '440200', '浈江', '113.59922', '24.803976', '3', 'tr_0 tr_440000 tr_440200', '10');
INSERT INTO `areas` VALUES ('440205', '曲江区', '440200', '曲江', '113.605583', '24.680195', '3', 'tr_0 tr_440000 tr_440200', '3');
INSERT INTO `areas` VALUES ('440222', '始兴县', '440200', '始兴', '114.067207', '24.948364', '3', 'tr_0 tr_440000 tr_440200', '6');
INSERT INTO `areas` VALUES ('440224', '仁化县', '440200', '仁化', '113.748627', '25.088226', '3', 'tr_0 tr_440000 tr_440200', '4');
INSERT INTO `areas` VALUES ('440229', '翁源县', '440200', '翁源', '114.131287', '24.353888', '3', 'tr_0 tr_440000 tr_440200', '7');
INSERT INTO `areas` VALUES ('440232', '乳源瑶族自治县', '440200', '乳源', '113.278419', '24.77611', '3', 'tr_0 tr_440000 tr_440200', '5');
INSERT INTO `areas` VALUES ('440233', '新丰县', '440200', '新丰', '114.207031', '24.055412', '3', 'tr_0 tr_440000 tr_440200', '9');
INSERT INTO `areas` VALUES ('440281', '乐昌市', '440200', '乐昌', '113.352409', '25.128445', '3', 'tr_0 tr_440000 tr_440200', '1');
INSERT INTO `areas` VALUES ('440282', '南雄市', '440200', '南雄', '114.311234', '25.115328', '3', 'tr_0 tr_440000 tr_440200', '2');
INSERT INTO `areas` VALUES ('440300', '深圳市', '440000', '深圳', '114.085945', '22.547001', '2', 'tr_0 tr_440000', '16');
INSERT INTO `areas` VALUES ('440303', '罗湖区', '440300', '罗湖', '114.123886', '22.555342', '3', 'tr_0 tr_440000 tr_440300', '7');
INSERT INTO `areas` VALUES ('440304', '福田区', '440300', '福田', '114.050957', '22.54101', '3', 'tr_0 tr_440000 tr_440300', '3');
INSERT INTO `areas` VALUES ('440305', '南山区', '440300', '南山', '113.929428', '22.531221', '3', 'tr_0 tr_440000 tr_440300', '8');
INSERT INTO `areas` VALUES ('440306', '宝安区', '440300', '宝安', '113.828674', '22.754742', '3', 'tr_0 tr_440000 tr_440300', '1');
INSERT INTO `areas` VALUES ('440307', '龙岗区', '440300', '龙岗', '114.251373', '22.721512', '3', 'tr_0 tr_440000 tr_440300', '5');
INSERT INTO `areas` VALUES ('440308', '盐田区', '440300', '盐田', '114.235367', '22.555069', '3', 'tr_0 tr_440000 tr_440300', '10');
INSERT INTO `areas` VALUES ('440320', '光明新区', '440300', '光明', '113.905037', '22.561985', '3', 'tr_0 tr_440000 tr_440300', '4');
INSERT INTO `areas` VALUES ('440321', '坪山新区', '440300', '坪山', '114.346252', '22.691254', '3', 'tr_0 tr_440000 tr_440300', '9');
INSERT INTO `areas` VALUES ('440322', '大鹏新区', '440300', '大鹏', '114.474602', '22.597641', '3', 'tr_0 tr_440000 tr_440300', '2');
INSERT INTO `areas` VALUES ('440323', '龙华新区', '440300', '龙华', '114.019348', '22.656408', '3', 'tr_0 tr_440000 tr_440300', '6');
INSERT INTO `areas` VALUES ('440400', '珠海市', '440000', '珠海', '113.553986', '22.224979', '2', 'tr_0 tr_440000', '22');
INSERT INTO `areas` VALUES ('440402', '香洲区', '440400', '香洲', '113.55027', '22.27125', '3', 'tr_0 tr_440000 tr_440400', '3');
INSERT INTO `areas` VALUES ('440403', '斗门区', '440400', '斗门', '113.297737', '22.209118', '3', 'tr_0 tr_440000 tr_440400', '1');
INSERT INTO `areas` VALUES ('440404', '金湾区', '440400', '金湾', '113.34507', '22.139122', '3', 'tr_0 tr_440000 tr_440400', '2');
INSERT INTO `areas` VALUES ('440500', '汕头市', '440000', '汕头', '116.708466', '23.371019', '2', 'tr_0 tr_440000', '13');
INSERT INTO `areas` VALUES ('440507', '龙湖区', '440500', '龙湖', '116.732018', '23.373755', '3', 'tr_0 tr_440000 tr_440500', '6');
INSERT INTO `areas` VALUES ('440511', '金平区', '440500', '金平', '116.703583', '23.367071', '3', 'tr_0 tr_440000 tr_440500', '5');
INSERT INTO `areas` VALUES ('440512', '濠江区', '440500', '濠江', '116.72953', '23.279345', '3', 'tr_0 tr_440000 tr_440500', '4');
INSERT INTO `areas` VALUES ('440513', '潮阳区', '440500', '潮阳', '116.6026', '23.262337', '3', 'tr_0 tr_440000 tr_440500', '2');
INSERT INTO `areas` VALUES ('440514', '潮南区', '440500', '潮南', '116.423607', '23.249798', '3', 'tr_0 tr_440000 tr_440500', '1');
INSERT INTO `areas` VALUES ('440515', '澄海区', '440500', '澄海', '116.763359', '23.468439', '3', 'tr_0 tr_440000 tr_440500', '3');
INSERT INTO `areas` VALUES ('440523', '南澳县', '440500', '南澳', '117.027107', '23.419561', '3', 'tr_0 tr_440000 tr_440500', '7');
INSERT INTO `areas` VALUES ('440600', '佛山市', '440000', '佛山', '113.122719', '23.028763', '2', 'tr_0 tr_440000', '4');
INSERT INTO `areas` VALUES ('440604', '禅城区', '440600', '禅城', '113.112411', '23.019644', '3', 'tr_0 tr_440000 tr_440600', '1');
INSERT INTO `areas` VALUES ('440605', '南海区', '440600', '南海', '113.145576', '23.031563', '3', 'tr_0 tr_440000 tr_440600', '3');
INSERT INTO `areas` VALUES ('440606', '顺德区', '440600', '顺德', '113.281822', '22.758511', '3', 'tr_0 tr_440000 tr_440600', '5');
INSERT INTO `areas` VALUES ('440607', '三水区', '440600', '三水', '112.899414', '23.165039', '3', 'tr_0 tr_440000 tr_440600', '4');
INSERT INTO `areas` VALUES ('440608', '高明区', '440600', '高明', '112.882126', '22.893854', '3', 'tr_0 tr_440000 tr_440600', '2');
INSERT INTO `areas` VALUES ('440700', '江门市', '440000', '江门', '113.09494', '22.590431', '2', 'tr_0 tr_440000', '8');
INSERT INTO `areas` VALUES ('440703', '蓬江区', '440700', '蓬江', '113.07859', '22.596769', '3', 'tr_0 tr_440000 tr_440700', '5');
INSERT INTO `areas` VALUES ('440704', '江海区', '440700', '江海', '113.120598', '22.57221', '3', 'tr_0 tr_440000 tr_440700', '3');
INSERT INTO `areas` VALUES ('440705', '新会区', '440700', '新会', '113.038582', '22.520247', '3', 'tr_0 tr_440000 tr_440700', '7');
INSERT INTO `areas` VALUES ('440781', '台山市', '440700', '台山', '112.793411', '22.250713', '3', 'tr_0 tr_440000 tr_440700', '6');
INSERT INTO `areas` VALUES ('440783', '开平市', '440700', '开平', '112.692261', '22.366285', '3', 'tr_0 tr_440000 tr_440700', '4');
INSERT INTO `areas` VALUES ('440784', '鹤山市', '440700', '鹤山', '112.961792', '22.768105', '3', 'tr_0 tr_440000 tr_440700', '2');
INSERT INTO `areas` VALUES ('440785', '恩平市', '440700', '恩平', '112.314049', '22.182957', '3', 'tr_0 tr_440000 tr_440700', '1');
INSERT INTO `areas` VALUES ('440800', '湛江市', '440000', '湛江', '110.364975', '21.274899', '2', 'tr_0 tr_440000', '19');
INSERT INTO `areas` VALUES ('440802', '赤坎区', '440800', '赤坎', '110.361633', '21.273365', '3', 'tr_0 tr_440000 tr_440800', '1');
INSERT INTO `areas` VALUES ('440803', '霞山区', '440800', '霞山', '110.40638', '21.194229', '3', 'tr_0 tr_440000 tr_440800', '8');
INSERT INTO `areas` VALUES ('440804', '坡头区', '440800', '坡头', '110.455635', '21.24441', '3', 'tr_0 tr_440000 tr_440800', '5');
INSERT INTO `areas` VALUES ('440811', '麻章区', '440800', '麻章', '110.32917', '21.265997', '3', 'tr_0 tr_440000 tr_440800', '4');
INSERT INTO `areas` VALUES ('440823', '遂溪县', '440800', '遂溪', '110.255318', '21.376915', '3', 'tr_0 tr_440000 tr_440800', '6');
INSERT INTO `areas` VALUES ('440825', '徐闻县', '440800', '徐闻', '110.17572', '20.326082', '3', 'tr_0 tr_440000 tr_440800', '9');
INSERT INTO `areas` VALUES ('440881', '廉江市', '440800', '廉江', '110.284958', '21.61128', '3', 'tr_0 tr_440000 tr_440800', '3');
INSERT INTO `areas` VALUES ('440882', '雷州市', '440800', '雷州', '110.088272', '20.908524', '3', 'tr_0 tr_440000 tr_440800', '2');
INSERT INTO `areas` VALUES ('440883', '吴川市', '440800', '吴川', '110.78051', '21.428453', '3', 'tr_0 tr_440000 tr_440800', '7');
INSERT INTO `areas` VALUES ('440900', '茂名市', '440000', '茂名', '110.919228', '21.659752', '2', 'tr_0 tr_440000', '10');
INSERT INTO `areas` VALUES ('440902', '茂南区', '440900', '茂南', '110.92054', '21.660425', '3', 'tr_0 tr_440000 tr_440900', '5');
INSERT INTO `areas` VALUES ('440903', '茂港区', '440900', '茂港', '111.052147', '21.463388', '3', 'tr_0 tr_440000 tr_440900', '4');
INSERT INTO `areas` VALUES ('440923', '电白县', '440900', '电白', '111.007263', '21.507219', '3', 'tr_0 tr_440000 tr_440900', '1');
INSERT INTO `areas` VALUES ('440981', '高州市', '440900', '高州', '110.853249', '21.915154', '3', 'tr_0 tr_440000 tr_440900', '2');
INSERT INTO `areas` VALUES ('440982', '化州市', '440900', '化州', '110.63839', '21.654953', '3', 'tr_0 tr_440000 tr_440900', '3');
INSERT INTO `areas` VALUES ('440983', '信宜市', '440900', '信宜', '110.941658', '22.35268', '3', 'tr_0 tr_440000 tr_440900', '6');
INSERT INTO `areas` VALUES ('441200', '肇庆市', '440000', '肇庆', '112.472527', '23.051546', '2', 'tr_0 tr_440000', '20');
INSERT INTO `areas` VALUES ('441202', '端州区', '441200', '端州', '112.472328', '23.052662', '3', 'tr_0 tr_440000 tr_441200', '3');
INSERT INTO `areas` VALUES ('441203', '鼎湖区', '441200', '鼎湖', '112.565247', '23.155823', '3', 'tr_0 tr_440000 tr_441200', '2');
INSERT INTO `areas` VALUES ('441223', '广宁县', '441200', '广宁', '112.440422', '23.631487', '3', 'tr_0 tr_440000 tr_441200', '6');
INSERT INTO `areas` VALUES ('441224', '怀集县', '441200', '怀集', '112.182465', '23.913073', '3', 'tr_0 tr_440000 tr_441200', '7');
INSERT INTO `areas` VALUES ('441225', '封开县', '441200', '封开', '111.502975', '23.434731', '3', 'tr_0 tr_440000 tr_441200', '4');
INSERT INTO `areas` VALUES ('441226', '德庆县', '441200', '德庆', '111.781563', '23.14171', '3', 'tr_0 tr_440000 tr_441200', '1');
INSERT INTO `areas` VALUES ('441283', '高要市', '441200', '高要', '112.460846', '23.027695', '3', 'tr_0 tr_440000 tr_441200', '5');
INSERT INTO `areas` VALUES ('441284', '四会市', '441200', '四会', '112.69503', '23.340324', '3', 'tr_0 tr_440000 tr_441200', '8');
INSERT INTO `areas` VALUES ('441300', '惠州市', '440000', '惠州', '114.412598', '23.079405', '2', 'tr_0 tr_440000', '7');
INSERT INTO `areas` VALUES ('441302', '惠城区', '441300', '惠城', '114.413979', '23.079884', '3', 'tr_0 tr_440000 tr_441300', '2');
INSERT INTO `areas` VALUES ('441303', '惠阳区', '441300', '惠阳', '114.469444', '22.788509', '3', 'tr_0 tr_440000 tr_441300', '4');
INSERT INTO `areas` VALUES ('441322', '博罗县', '441300', '博罗', '114.284256', '23.167576', '3', 'tr_0 tr_440000 tr_441300', '1');
INSERT INTO `areas` VALUES ('441323', '惠东县', '441300', '惠东', '114.723091', '22.983036', '3', 'tr_0 tr_440000 tr_441300', '3');
INSERT INTO `areas` VALUES ('441324', '龙门县', '441300', '龙门', '114.259987', '23.723894', '3', 'tr_0 tr_440000 tr_441300', '5');
INSERT INTO `areas` VALUES ('441400', '梅州市', '440000', '梅州', '116.117584', '24.299112', '2', 'tr_0 tr_440000', '11');
INSERT INTO `areas` VALUES ('441402', '梅江区', '441400', '梅江', '116.121162', '24.302593', '3', 'tr_0 tr_440000 tr_441400', '4');
INSERT INTO `areas` VALUES ('441421', '梅县', '441400', '梅县', '116.083481', '24.267824', '3', 'tr_0 tr_440000 tr_441400', '5');
INSERT INTO `areas` VALUES ('441422', '大埔县', '441400', '大埔', '116.695518', '24.351587', '3', 'tr_0 tr_440000 tr_441400', '1');
INSERT INTO `areas` VALUES ('441423', '丰顺县', '441400', '丰顺', '116.184418', '23.752771', '3', 'tr_0 tr_440000 tr_441400', '2');
INSERT INTO `areas` VALUES ('441424', '五华县', '441400', '五华', '115.775002', '23.925425', '3', 'tr_0 tr_440000 tr_441400', '7');
INSERT INTO `areas` VALUES ('441426', '平远县', '441400', '平远', '115.891731', '24.569651', '3', 'tr_0 tr_440000 tr_441400', '6');
INSERT INTO `areas` VALUES ('441427', '蕉岭县', '441400', '蕉岭', '116.170532', '24.653313', '3', 'tr_0 tr_440000 tr_441400', '3');
INSERT INTO `areas` VALUES ('441481', '兴宁市', '441400', '兴宁', '115.731651', '24.138077', '3', 'tr_0 tr_440000 tr_441400', '8');
INSERT INTO `areas` VALUES ('441500', '汕尾市', '440000', '汕尾', '115.364235', '22.774485', '2', 'tr_0 tr_440000', '14');
INSERT INTO `areas` VALUES ('441502', '城区', '441500', '城区', '115.36367', '22.776228', '3', 'tr_0 tr_440000 tr_441500', '1');
INSERT INTO `areas` VALUES ('441521', '海丰县', '441500', '海丰', '115.337326', '22.971043', '3', 'tr_0 tr_440000 tr_441500', '2');
INSERT INTO `areas` VALUES ('441523', '陆河县', '441500', '陆河', '115.657562', '23.302683', '3', 'tr_0 tr_440000 tr_441500', '4');
INSERT INTO `areas` VALUES ('441581', '陆丰市', '441500', '陆丰', '115.644203', '22.946104', '3', 'tr_0 tr_440000 tr_441500', '3');
INSERT INTO `areas` VALUES ('441600', '河源市', '440000', '河源', '114.6978', '23.746265', '2', 'tr_0 tr_440000', '6');
INSERT INTO `areas` VALUES ('441602', '源城区', '441600', '源城', '114.696831', '23.746256', '3', 'tr_0 tr_440000 tr_441600', '5');
INSERT INTO `areas` VALUES ('441621', '紫金县', '441600', '紫金', '115.18438', '23.633743', '3', 'tr_0 tr_440000 tr_441600', '6');
INSERT INTO `areas` VALUES ('441622', '龙川县', '441600', '龙川', '115.256416', '24.101173', '3', 'tr_0 tr_440000 tr_441600', '4');
INSERT INTO `areas` VALUES ('441623', '连平县', '441600', '连平', '114.495949', '24.364227', '3', 'tr_0 tr_440000 tr_441600', '3');
INSERT INTO `areas` VALUES ('441624', '和平县', '441600', '和平', '114.941475', '24.44318', '3', 'tr_0 tr_440000 tr_441600', '2');
INSERT INTO `areas` VALUES ('441625', '东源县', '441600', '东源', '114.742714', '23.789093', '3', 'tr_0 tr_440000 tr_441600', '1');
INSERT INTO `areas` VALUES ('441700', '阳江市', '440000', '阳江', '111.975105', '21.859222', '2', 'tr_0 tr_440000', '17');
INSERT INTO `areas` VALUES ('441702', '江城区', '441700', '江城', '111.96891', '21.859182', '3', 'tr_0 tr_440000 tr_441700', '1');
INSERT INTO `areas` VALUES ('441721', '阳西县', '441700', '阳西', '111.617554', '21.75367', '3', 'tr_0 tr_440000 tr_441700', '4');
INSERT INTO `areas` VALUES ('441723', '阳东县', '441700', '阳东', '112.011269', '21.864729', '3', 'tr_0 tr_440000 tr_441700', '3');
INSERT INTO `areas` VALUES ('441781', '阳春市', '441700', '阳春', '111.790497', '22.169598', '3', 'tr_0 tr_440000 tr_441700', '2');
INSERT INTO `areas` VALUES ('441800', '清远市', '440000', '清远', '113.051224', '23.685022', '2', 'tr_0 tr_440000', '12');
INSERT INTO `areas` VALUES ('441802', '清城区', '441800', '清城', '113.048698', '23.688976', '3', 'tr_0 tr_440000 tr_441800', '5');
INSERT INTO `areas` VALUES ('441821', '佛冈县', '441800', '佛冈', '113.534096', '23.866739', '3', 'tr_0 tr_440000 tr_441800', '1');
INSERT INTO `areas` VALUES ('441823', '阳山县', '441800', '阳山', '112.634018', '24.470285', '3', 'tr_0 tr_440000 tr_441800', '7');
INSERT INTO `areas` VALUES ('441825', '连山壮族瑶族自治县', '441800', '连山', '112.086555', '24.56727', '3', 'tr_0 tr_440000 tr_441800', '3');
INSERT INTO `areas` VALUES ('441826', '连南瑶族自治县', '441800', '连南', '112.29081', '24.719097', '3', 'tr_0 tr_440000 tr_441800', '2');
INSERT INTO `areas` VALUES ('441827', '清新区', '441800', '清新', '113.015205', '23.73695', '3', 'tr_0 tr_440000 tr_441800', '6');
INSERT INTO `areas` VALUES ('441881', '英德市', '441800', '英德', '113.405403', '24.186119', '3', 'tr_0 tr_440000 tr_441800', '8');
INSERT INTO `areas` VALUES ('441882', '连州市', '441800', '连州', '112.379272', '24.783966', '3', 'tr_0 tr_440000 tr_441800', '4');
INSERT INTO `areas` VALUES ('441900', '东莞市', '440000', '东莞', '113.746262', '23.046238', '2', 'tr_0 tr_440000', '2');
INSERT INTO `areas` VALUES ('442000', '中山市', '440000', '中山', '113.382393', '22.521112', '2', 'tr_0 tr_440000', '21');
INSERT INTO `areas` VALUES ('442101', '东沙群岛', null, '东沙', '112.552948', '21.810463', '2', 'tr_0 tr_440000', '3');
INSERT INTO `areas` VALUES ('445100', '潮州市', '440000', '潮州', '116.632301', '23.661701', '2', 'tr_0 tr_440000', '1');
INSERT INTO `areas` VALUES ('445102', '湘桥区', '445100', '湘桥', '116.633652', '23.664675', '3', 'tr_0 tr_440000 tr_445100', '3');
INSERT INTO `areas` VALUES ('445121', '潮安区', '445100', '潮安', '116.679314', '23.461012', '3', 'tr_0 tr_440000 tr_445100', '1');
INSERT INTO `areas` VALUES ('445122', '饶平县', '445100', '饶平', '117.002052', '23.668171', '3', 'tr_0 tr_440000 tr_445100', '2');
INSERT INTO `areas` VALUES ('445200', '揭阳市', '440000', '揭阳', '116.355736', '23.543777', '2', 'tr_0 tr_440000', '9');
INSERT INTO `areas` VALUES ('445202', '榕城区', '445200', '榕城', '116.357048', '23.535524', '3', 'tr_0 tr_440000 tr_445200', '5');
INSERT INTO `areas` VALUES ('445221', '揭东区', '445200', '揭东', '116.412949', '23.569887', '3', 'tr_0 tr_440000 tr_445200', '2');
INSERT INTO `areas` VALUES ('445222', '揭西县', '445200', '揭西', '115.838707', '23.427299', '3', 'tr_0 tr_440000 tr_445200', '3');
INSERT INTO `areas` VALUES ('445224', '惠来县', '445200', '惠来', '116.29583', '23.029835', '3', 'tr_0 tr_440000 tr_445200', '1');
INSERT INTO `areas` VALUES ('445281', '普宁市', '445200', '普宁', '116.165085', '23.29788', '3', 'tr_0 tr_440000 tr_445200', '4');
INSERT INTO `areas` VALUES ('445300', '云浮市', '440000', '云浮', '112.044441', '22.929802', '2', 'tr_0 tr_440000', '18');
INSERT INTO `areas` VALUES ('445302', '云城区', '445300', '云城', '112.044708', '22.930826', '3', 'tr_0 tr_440000 tr_445300', '5');
INSERT INTO `areas` VALUES ('445321', '新兴县', '445300', '新兴', '112.230827', '22.703203', '3', 'tr_0 tr_440000 tr_445300', '2');
INSERT INTO `areas` VALUES ('445322', '郁南县', '445300', '郁南', '111.535919', '23.237709', '3', 'tr_0 tr_440000 tr_445300', '3');
INSERT INTO `areas` VALUES ('445323', '云安县', '445300', '云安', '112.005608', '23.073153', '3', 'tr_0 tr_440000 tr_445300', '4');
INSERT INTO `areas` VALUES ('445381', '罗定市', '445300', '罗定', '111.578201', '22.765415', '3', 'tr_0 tr_440000 tr_445300', '1');
INSERT INTO `areas` VALUES ('450000', '广西壮族自治区', '1', '广西', '108.320007', '22.82402', '1', 'tr_0', '20');
INSERT INTO `areas` VALUES ('450100', '南宁市', '450000', '南宁', '108.320007', '22.82402', '2', 'tr_0 tr_450000', '11');
INSERT INTO `areas` VALUES ('450102', '兴宁区', '450100', '兴宁', '108.32019', '22.819511', '3', 'tr_0 tr_450000 tr_450100', '10');
INSERT INTO `areas` VALUES ('450103', '青秀区', '450100', '青秀', '108.346115', '22.816614', '3', 'tr_0 tr_450000 tr_450100', '7');
INSERT INTO `areas` VALUES ('450105', '江南区', '450100', '江南', '108.310478', '22.799593', '3', 'tr_0 tr_450000 tr_450100', '3');
INSERT INTO `areas` VALUES ('450107', '西乡塘区', '450100', '西乡塘', '108.3069', '22.832779', '3', 'tr_0 tr_450000 tr_450100', '11');
INSERT INTO `areas` VALUES ('450108', '良庆区', '450100', '良庆', '108.322105', '22.75909', '3', 'tr_0 tr_450000 tr_450100', '4');
INSERT INTO `areas` VALUES ('450109', '邕宁区', '450100', '邕宁', '108.484253', '22.756598', '3', 'tr_0 tr_450000 tr_450100', '12');
INSERT INTO `areas` VALUES ('450122', '武鸣县', '450100', '武鸣', '108.280716', '23.157164', '3', 'tr_0 tr_450000 tr_450100', '9');
INSERT INTO `areas` VALUES ('450123', '隆安县', '450100', '隆安', '107.68866', '23.174763', '3', 'tr_0 tr_450000 tr_450100', '5');
INSERT INTO `areas` VALUES ('450124', '马山县', '450100', '马山', '108.172905', '23.711758', '3', 'tr_0 tr_450000 tr_450100', '6');
INSERT INTO `areas` VALUES ('450125', '上林县', '450100', '上林', '108.603935', '23.431768', '3', 'tr_0 tr_450000 tr_450100', '8');
INSERT INTO `areas` VALUES ('450126', '宾阳县', '450100', '宾阳', '108.816734', '23.216885', '3', 'tr_0 tr_450000 tr_450100', '1');
INSERT INTO `areas` VALUES ('450127', '横县', '450100', '横县', '109.270988', '22.687429', '3', 'tr_0 tr_450000 tr_450100', '2');
INSERT INTO `areas` VALUES ('450200', '柳州市', '450000', '柳州', '109.411705', '24.314617', '2', 'tr_0 tr_450000', '10');
INSERT INTO `areas` VALUES ('450202', '城中区', '450200', '城中', '109.411751', '24.312325', '3', 'tr_0 tr_450000 tr_450200', '1');
INSERT INTO `areas` VALUES ('450203', '鱼峰区', '450200', '鱼峰', '109.415367', '24.303848', '3', 'tr_0 tr_450000 tr_450200', '10');
INSERT INTO `areas` VALUES ('450204', '柳南区', '450200', '柳南', '109.395935', '24.287012', '3', 'tr_0 tr_450000 tr_450200', '5');
INSERT INTO `areas` VALUES ('450205', '柳北区', '450200', '柳北', '109.406578', '24.359144', '3', 'tr_0 tr_450000 tr_450200', '2');
INSERT INTO `areas` VALUES ('450221', '柳江县', '450200', '柳江', '109.334503', '24.257511', '3', 'tr_0 tr_450000 tr_450200', '4');
INSERT INTO `areas` VALUES ('450222', '柳城县', '450200', '柳城', '109.245811', '24.655121', '3', 'tr_0 tr_450000 tr_450200', '3');
INSERT INTO `areas` VALUES ('450223', '鹿寨县', '450200', '鹿寨', '109.740807', '24.483404', '3', 'tr_0 tr_450000 tr_450200', '6');
INSERT INTO `areas` VALUES ('450224', '融安县', '450200', '融安', '109.403618', '25.214703', '3', 'tr_0 tr_450000 tr_450200', '7');
INSERT INTO `areas` VALUES ('450225', '融水苗族自治县', '450200', '融水', '109.252747', '25.068811', '3', 'tr_0 tr_450000 tr_450200', '8');
INSERT INTO `areas` VALUES ('450226', '三江侗族自治县', '450200', '三江', '109.614845', '25.78553', '3', 'tr_0 tr_450000 tr_450200', '9');
INSERT INTO `areas` VALUES ('450300', '桂林市', '450000', '桂林', '110.299118', '25.274216', '2', 'tr_0 tr_450000', '6');
INSERT INTO `areas` VALUES ('450302', '秀峰区', '450300', '秀峰', '110.292442', '25.278543', '3', 'tr_0 tr_450000 tr_450300', '13');
INSERT INTO `areas` VALUES ('450303', '叠彩区', '450300', '叠彩', '110.300781', '25.301334', '3', 'tr_0 tr_450000 tr_450300', '1');
INSERT INTO `areas` VALUES ('450304', '象山区', '450300', '象山', '110.284882', '25.261986', '3', 'tr_0 tr_450000 tr_450300', '11');
INSERT INTO `areas` VALUES ('450305', '七星区', '450300', '七星', '110.317574', '25.254339', '3', 'tr_0 tr_450000 tr_450300', '9');
INSERT INTO `areas` VALUES ('450311', '雁山区', '450300', '雁山', '110.305664', '25.077646', '3', 'tr_0 tr_450000 tr_450300', '15');
INSERT INTO `areas` VALUES ('450321', '阳朔县', '450300', '阳朔', '110.494698', '24.775339', '3', 'tr_0 tr_450000 tr_450300', '14');
INSERT INTO `areas` VALUES ('450322', '临桂区', '450300', '临桂', '110.20549', '25.246258', '3', 'tr_0 tr_450000 tr_450300', '5');
INSERT INTO `areas` VALUES ('450323', '灵川县', '450300', '灵川', '110.325714', '25.408541', '3', 'tr_0 tr_450000 tr_450300', '4');
INSERT INTO `areas` VALUES ('450324', '全州县', '450300', '全州', '111.07299', '25.929897', '3', 'tr_0 tr_450000 tr_450300', '10');
INSERT INTO `areas` VALUES ('450325', '兴安县', '450300', '兴安', '110.670784', '25.609554', '3', 'tr_0 tr_450000 tr_450300', '12');
INSERT INTO `areas` VALUES ('450326', '永福县', '450300', '永福', '109.989204', '24.986692', '3', 'tr_0 tr_450000 tr_450300', '16');
INSERT INTO `areas` VALUES ('450327', '灌阳县', '450300', '灌阳', '111.160248', '25.489098', '3', 'tr_0 tr_450000 tr_450300', '3');
INSERT INTO `areas` VALUES ('450328', '龙胜各族自治县', '450300', '龙胜', '110.009422', '25.796429', '3', 'tr_0 tr_450000 tr_450300', '7');
INSERT INTO `areas` VALUES ('450329', '资源县', '450300', '资源', '110.642586', '26.034201', '3', 'tr_0 tr_450000 tr_450300', '17');
INSERT INTO `areas` VALUES ('450330', '平乐县', '450300', '平乐', '110.642822', '24.632215', '3', 'tr_0 tr_450000 tr_450300', '8');
INSERT INTO `areas` VALUES ('450331', '荔浦县', '450300', '荔浦', '110.400146', '24.497786', '3', 'tr_0 tr_450000 tr_450300', '6');
INSERT INTO `areas` VALUES ('450332', '恭城瑶族自治县', '450300', '恭城', '110.829521', '24.833612', '3', 'tr_0 tr_450000 tr_450300', '2');
INSERT INTO `areas` VALUES ('450400', '梧州市', '450000', '梧州', '111.297607', '23.474804', '2', 'tr_0 tr_450000', '13');
INSERT INTO `areas` VALUES ('450403', '万秀区', '450400', '万秀', '111.315819', '23.471317', '3', 'tr_0 tr_450000 tr_450400', '4');
INSERT INTO `areas` VALUES ('450405', '长洲区', '450400', '长洲', '111.275681', '23.477699', '3', 'tr_0 tr_450000 tr_450400', '3');
INSERT INTO `areas` VALUES ('450406', '龙圩区', '450400', '龙圩', '111.246033', '23.40996', '3', 'tr_0 tr_450000 tr_450400', '5');
INSERT INTO `areas` VALUES ('450421', '苍梧县', '450400', '苍梧', '111.544006', '23.845097', '3', 'tr_0 tr_450000 tr_450400', '1');
INSERT INTO `areas` VALUES ('450422', '藤县', '450400', '藤县', '110.931824', '23.373962', '3', 'tr_0 tr_450000 tr_450400', '7');
INSERT INTO `areas` VALUES ('450423', '蒙山县', '450400', '蒙山', '110.522598', '24.199829', '3', 'tr_0 tr_450000 tr_450400', '6');
INSERT INTO `areas` VALUES ('450481', '岑溪市', '450400', '岑溪', '110.998116', '22.918406', '3', 'tr_0 tr_450000 tr_450400', '2');
INSERT INTO `areas` VALUES ('450500', '北海市', '450000', '北海', '109.119255', '21.473343', '2', 'tr_0 tr_450000', '1');
INSERT INTO `areas` VALUES ('450502', '海城区', '450500', '海城', '109.107529', '21.468443', '3', 'tr_0 tr_450000 tr_450500', '1');
INSERT INTO `areas` VALUES ('450503', '银海区', '450500', '银海', '109.118706', '21.444908', '3', 'tr_0 tr_450000 tr_450500', '4');
INSERT INTO `areas` VALUES ('450512', '铁山港区', '450500', '铁山港', '109.450577', '21.5928', '3', 'tr_0 tr_450000 tr_450500', '3');
INSERT INTO `areas` VALUES ('450521', '合浦县', '450500', '合浦', '109.200691', '21.663553', '3', 'tr_0 tr_450000 tr_450500', '2');
INSERT INTO `areas` VALUES ('450600', '防城港市', '450000', '防城港', '108.345474', '21.614632', '2', 'tr_0 tr_450000', '4');
INSERT INTO `areas` VALUES ('450602', '港口区', '450600', '港口', '108.346283', '21.614407', '3', 'tr_0 tr_450000 tr_450600', '3');
INSERT INTO `areas` VALUES ('450603', '防城区', '450600', '防城', '108.358429', '21.764757', '3', 'tr_0 tr_450000 tr_450600', '2');
INSERT INTO `areas` VALUES ('450621', '上思县', '450600', '上思', '107.98214', '22.151423', '3', 'tr_0 tr_450000 tr_450600', '4');
INSERT INTO `areas` VALUES ('450681', '东兴市', '450600', '东兴', '107.970169', '21.541172', '3', 'tr_0 tr_450000 tr_450600', '1');
INSERT INTO `areas` VALUES ('450700', '钦州市', '450000', '钦州', '108.624176', '21.967127', '2', 'tr_0 tr_450000', '12');
INSERT INTO `areas` VALUES ('450702', '钦南区', '450700', '钦南', '108.626633', '21.966808', '3', 'tr_0 tr_450000 tr_450700', '4');
INSERT INTO `areas` VALUES ('450703', '钦北区', '450700', '钦北', '108.449112', '22.132761', '3', 'tr_0 tr_450000 tr_450700', '3');
INSERT INTO `areas` VALUES ('450721', '灵山县', '450700', '灵山', '109.293465', '22.418041', '3', 'tr_0 tr_450000 tr_450700', '1');
INSERT INTO `areas` VALUES ('450722', '浦北县', '450700', '浦北', '109.556343', '22.268335', '3', 'tr_0 tr_450000 tr_450700', '2');
INSERT INTO `areas` VALUES ('450800', '贵港市', '450000', '贵港', '109.602142', '23.093599', '2', 'tr_0 tr_450000', '5');
INSERT INTO `areas` VALUES ('450802', '港北区', '450800', '港北', '109.59481', '23.107677', '3', 'tr_0 tr_450000 tr_450800', '1');
INSERT INTO `areas` VALUES ('450803', '港南区', '450800', '港南', '109.604668', '23.067516', '3', 'tr_0 tr_450000 tr_450800', '2');
INSERT INTO `areas` VALUES ('450804', '覃塘区', '450800', '覃塘', '109.415695', '23.132814', '3', 'tr_0 tr_450000 tr_450800', '5');
INSERT INTO `areas` VALUES ('450821', '平南县', '450800', '平南', '110.397484', '23.544546', '3', 'tr_0 tr_450000 tr_450800', '4');
INSERT INTO `areas` VALUES ('450881', '桂平市', '450800', '桂平', '110.074669', '23.382473', '3', 'tr_0 tr_450000 tr_450800', '3');
INSERT INTO `areas` VALUES ('450900', '玉林市', '450000', '玉林', '110.154396', '22.631359', '2', 'tr_0 tr_450000', '14');
INSERT INTO `areas` VALUES ('450902', '玉州区', '450900', '玉州', '110.154915', '22.632132', '3', 'tr_0 tr_450000 tr_450900', '7');
INSERT INTO `areas` VALUES ('450903', '福绵区', '450900', '福绵', '110.05143', '22.579947', '3', 'tr_0 tr_450000 tr_450900', '3');
INSERT INTO `areas` VALUES ('450921', '容县', '450900', '容县', '110.552467', '22.856436', '3', 'tr_0 tr_450000 tr_450900', '5');
INSERT INTO `areas` VALUES ('450922', '陆川县', '450900', '陆川', '110.264839', '22.321054', '3', 'tr_0 tr_450000 tr_450900', '4');
INSERT INTO `areas` VALUES ('450923', '博白县', '450900', '博白', '109.980003', '22.271284', '3', 'tr_0 tr_450000 tr_450900', '2');
INSERT INTO `areas` VALUES ('450924', '兴业县', '450900', '兴业', '109.877769', '22.741871', '3', 'tr_0 tr_450000 tr_450900', '6');
INSERT INTO `areas` VALUES ('450981', '北流市', '450900', '北流', '110.348053', '22.701649', '3', 'tr_0 tr_450000 tr_450900', '1');
INSERT INTO `areas` VALUES ('451000', '百色市', '450000', '百色', '106.616287', '23.897741', '2', 'tr_0 tr_450000', '2');
INSERT INTO `areas` VALUES ('451002', '右江区', '451000', '右江', '106.61573', '23.897675', '3', 'tr_0 tr_450000 tr_451000', '12');
INSERT INTO `areas` VALUES ('451021', '田阳县', '451000', '田阳', '106.904312', '23.736078', '3', 'tr_0 tr_450000 tr_451000', '10');
INSERT INTO `areas` VALUES ('451022', '田东县', '451000', '田东', '107.12426', '23.600445', '3', 'tr_0 tr_450000 tr_451000', '8');
INSERT INTO `areas` VALUES ('451023', '平果县', '451000', '平果', '107.580406', '23.320478', '3', 'tr_0 tr_450000 tr_451000', '7');
INSERT INTO `areas` VALUES ('451024', '德保县', '451000', '德保', '106.618164', '23.321465', '3', 'tr_0 tr_450000 tr_451000', '1');
INSERT INTO `areas` VALUES ('451025', '靖西县', '451000', '靖西', '106.417549', '23.134766', '3', 'tr_0 tr_450000 tr_451000', '2');
INSERT INTO `areas` VALUES ('451026', '那坡县', '451000', '那坡', '105.833549', '23.400785', '3', 'tr_0 tr_450000 tr_451000', '6');
INSERT INTO `areas` VALUES ('451027', '凌云县', '451000', '凌云', '106.564873', '24.345642', '3', 'tr_0 tr_450000 tr_451000', '4');
INSERT INTO `areas` VALUES ('451028', '乐业县', '451000', '乐业', '106.559639', '24.782204', '3', 'tr_0 tr_450000 tr_451000', '3');
INSERT INTO `areas` VALUES ('451029', '田林县', '451000', '田林', '106.235046', '24.290262', '3', 'tr_0 tr_450000 tr_451000', '9');
INSERT INTO `areas` VALUES ('451030', '西林县', '451000', '西林', '105.095024', '24.492041', '3', 'tr_0 tr_450000 tr_451000', '11');
INSERT INTO `areas` VALUES ('451031', '隆林各族自治县', '451000', '隆林', '105.342361', '24.774319', '3', 'tr_0 tr_450000 tr_451000', '5');
INSERT INTO `areas` VALUES ('451100', '贺州市', '450000', '贺州', '111.552055', '24.414141', '2', 'tr_0 tr_450000', '8');
INSERT INTO `areas` VALUES ('451102', '八步区', '451100', '八步', '111.551994', '24.412445', '3', 'tr_0 tr_450000 tr_451100', '1');
INSERT INTO `areas` VALUES ('451119', '平桂管理区', '451100', '平桂', '111.552055', '24.414141', '3', 'tr_0 tr_450000 tr_451100', '3');
INSERT INTO `areas` VALUES ('451121', '昭平县', '451100', '昭平', '110.810867', '24.172958', '3', 'tr_0 tr_450000 tr_451100', '4');
INSERT INTO `areas` VALUES ('451122', '钟山县', '451100', '钟山', '111.303627', '24.528566', '3', 'tr_0 tr_450000 tr_451100', '5');
INSERT INTO `areas` VALUES ('451123', '富川瑶族自治县', '451100', '富川', '111.277229', '24.81896', '3', 'tr_0 tr_450000 tr_451100', '2');
INSERT INTO `areas` VALUES ('451200', '河池市', '450000', '河池', '108.062103', '24.695898', '2', 'tr_0 tr_450000', '7');
INSERT INTO `areas` VALUES ('451202', '金城江区', '451200', '金城江', '108.062134', '24.695625', '3', 'tr_0 tr_450000 tr_451200', '7');
INSERT INTO `areas` VALUES ('451221', '南丹县', '451200', '南丹', '107.546608', '24.983192', '3', 'tr_0 tr_450000 tr_451200', '9');
INSERT INTO `areas` VALUES ('451222', '天峨县', '451200', '天峨', '107.174942', '24.985964', '3', 'tr_0 tr_450000 tr_451200', '10');
INSERT INTO `areas` VALUES ('451223', '凤山县', '451200', '凤山', '107.044594', '24.544561', '3', 'tr_0 tr_450000 tr_451200', '5');
INSERT INTO `areas` VALUES ('451224', '东兰县', '451200', '东兰', '107.373695', '24.509367', '3', 'tr_0 tr_450000 tr_451200', '3');
INSERT INTO `areas` VALUES ('451225', '罗城仫佬族自治县', '451200', '罗城', '108.902451', '24.779327', '3', 'tr_0 tr_450000 tr_451200', '8');
INSERT INTO `areas` VALUES ('451226', '环江毛南族自治县', '451200', '环江', '108.258667', '24.827627', '3', 'tr_0 tr_450000 tr_451200', '6');
INSERT INTO `areas` VALUES ('451227', '巴马瑶族自治县', '451200', '巴马', '107.253128', '24.139538', '3', 'tr_0 tr_450000 tr_451200', '1');
INSERT INTO `areas` VALUES ('451228', '都安瑶族自治县', '451200', '都安', '108.10276', '23.934963', '3', 'tr_0 tr_450000 tr_451200', '4');
INSERT INTO `areas` VALUES ('451229', '大化瑶族自治县', '451200', '大化', '107.994499', '23.739595', '3', 'tr_0 tr_450000 tr_451200', '2');
INSERT INTO `areas` VALUES ('451281', '宜州市', '451200', '宜州', '108.653969', '24.492193', '3', 'tr_0 tr_450000 tr_451200', '11');
INSERT INTO `areas` VALUES ('451300', '来宾市', '450000', '来宾', '109.229774', '23.733767', '2', 'tr_0 tr_450000', '9');
INSERT INTO `areas` VALUES ('451302', '兴宾区', '451300', '兴宾', '109.230537', '23.732925', '3', 'tr_0 tr_450000 tr_451300', '6');
INSERT INTO `areas` VALUES ('451321', '忻城县', '451300', '忻城', '108.667358', '24.064779', '3', 'tr_0 tr_450000 tr_451300', '5');
INSERT INTO `areas` VALUES ('451322', '象州县', '451300', '象州', '109.684555', '23.959824', '3', 'tr_0 tr_450000 tr_451300', '4');
INSERT INTO `areas` VALUES ('451323', '武宣县', '451300', '武宣', '109.662872', '23.604162', '3', 'tr_0 tr_450000 tr_451300', '3');
INSERT INTO `areas` VALUES ('451324', '金秀瑶族自治县', '451300', '金秀', '110.188553', '24.134941', '3', 'tr_0 tr_450000 tr_451300', '2');
INSERT INTO `areas` VALUES ('451381', '合山市', '451300', '合山', '108.88858', '23.81311', '3', 'tr_0 tr_450000 tr_451300', '1');
INSERT INTO `areas` VALUES ('451400', '崇左市', '450000', '崇左', '107.353928', '22.404108', '2', 'tr_0 tr_450000', '3');
INSERT INTO `areas` VALUES ('451402', '江州区', '451400', '江州', '107.354446', '22.40469', '3', 'tr_0 tr_450000 tr_451400', '3');
INSERT INTO `areas` VALUES ('451421', '扶绥县', '451400', '扶绥', '107.91153', '22.63582', '3', 'tr_0 tr_450000 tr_451400', '2');
INSERT INTO `areas` VALUES ('451422', '宁明县', '451400', '宁明', '107.067619', '22.131353', '3', 'tr_0 tr_450000 tr_451400', '5');
INSERT INTO `areas` VALUES ('451423', '龙州县', '451400', '龙州', '106.857506', '22.343716', '3', 'tr_0 tr_450000 tr_451400', '4');
INSERT INTO `areas` VALUES ('451424', '大新县', '451400', '大新', '107.200806', '22.833368', '3', 'tr_0 tr_450000 tr_451400', '1');
INSERT INTO `areas` VALUES ('451425', '天等县', '451400', '天等', '107.142441', '23.082483', '3', 'tr_0 tr_450000 tr_451400', '7');
INSERT INTO `areas` VALUES ('451481', '凭祥市', '451400', '凭祥', '106.759041', '22.108883', '3', 'tr_0 tr_450000 tr_451400', '6');
INSERT INTO `areas` VALUES ('460000', '海南省', '1', '海南', '110.331192', '20.031971', '1', 'tr_0', '21');
INSERT INTO `areas` VALUES ('460100', '海口市', '460000', '海口', '110.331192', '20.031971', '2', 'tr_0 tr_460000', '8');
INSERT INTO `areas` VALUES ('460105', '秀英区', '460100', '秀英', '110.282394', '20.008144', '3', 'tr_0 tr_460000 tr_460100', '4');
INSERT INTO `areas` VALUES ('460106', '龙华区', '460100', '龙华', '110.330376', '20.031027', '3', 'tr_0 tr_460000 tr_460100', '1');
INSERT INTO `areas` VALUES ('460107', '琼山区', '460100', '琼山', '110.354721', '20.001051', '3', 'tr_0 tr_460000 tr_460100', '3');
INSERT INTO `areas` VALUES ('460108', '美兰区', '460100', '美兰', '110.356567', '20.030741', '3', 'tr_0 tr_460000 tr_460100', '2');
INSERT INTO `areas` VALUES ('460200', '三亚市', '460000', '三亚', '109.50827', '18.247871', '2', 'tr_0 tr_460000', '15');
INSERT INTO `areas` VALUES ('460300', '三沙市', '460000', '三沙', '112.348824', '16.831039', '2', 'tr_0 tr_460000', '14');
INSERT INTO `areas` VALUES ('460321', '西沙群岛', '460300', '西沙', '111.792946', '16.204546', '3', 'tr_0 tr_460000 tr_460300', '2');
INSERT INTO `areas` VALUES ('460322', '南沙群岛', '460300', '南沙', '116.75', '11.471888', '3', 'tr_0 tr_460000 tr_460300', '1');
INSERT INTO `areas` VALUES ('460323', '中沙群岛的岛礁及其海域', '460300', '中沙', '117.740074', '15.112856', '3', 'tr_0 tr_460000 tr_460300', '3');
INSERT INTO `areas` VALUES ('469001', '五指山市', '460000', '五指山', '109.516663', '18.77692', '2', 'tr_0 tr_460000', '19');
INSERT INTO `areas` VALUES ('469002', '琼海市', '460000', '琼海', '110.466782', '19.246012', '2', 'tr_0 tr_460000', '12');
INSERT INTO `areas` VALUES ('469003', '儋州市', '460000', '儋州', '109.576782', '19.517487', '2', 'tr_0 tr_460000', '5');
INSERT INTO `areas` VALUES ('469005', '文昌市', '460000', '文昌', '110.753975', '19.612986', '2', 'tr_0 tr_460000', '18');
INSERT INTO `areas` VALUES ('469006', '万宁市', '460000', '万宁', '110.388794', '18.796215', '2', 'tr_0 tr_460000', '17');
INSERT INTO `areas` VALUES ('469007', '东方市', '460000', '东方', '108.653786', '19.10198', '2', 'tr_0 tr_460000', '7');
INSERT INTO `areas` VALUES ('469025', '定安县', '460000', '定安', '110.349236', '19.684965', '2', 'tr_0 tr_460000', '6');
INSERT INTO `areas` VALUES ('469026', '屯昌县', '460000', '屯昌', '110.102776', '19.362917', '2', 'tr_0 tr_460000', '16');
INSERT INTO `areas` VALUES ('469027', '澄迈县', '460000', '澄迈', '110.007149', '19.737095', '2', 'tr_0 tr_460000', '4');
INSERT INTO `areas` VALUES ('469028', '临高县', '460000', '临高', '109.687698', '19.908293', '2', 'tr_0 tr_460000', '10');
INSERT INTO `areas` VALUES ('469030', '白沙黎族自治县', '460000', '白沙', '109.452606', '19.224585', '2', 'tr_0 tr_460000', '1');
INSERT INTO `areas` VALUES ('469031', '昌江黎族自治县', '460000', '昌江', '109.053352', '19.260967', '2', 'tr_0 tr_460000', '3');
INSERT INTO `areas` VALUES ('469033', '乐东黎族自治县', '460000', '乐东', '109.175446', '18.74758', '2', 'tr_0 tr_460000', '9');
INSERT INTO `areas` VALUES ('469034', '陵水黎族自治县', '460000', '陵水', '110.037216', '18.505007', '2', 'tr_0 tr_460000', '11');
INSERT INTO `areas` VALUES ('469035', '保亭黎族苗族自治县', '460000', '保亭', '109.702454', '18.636372', '2', 'tr_0 tr_460000', '2');
INSERT INTO `areas` VALUES ('469036', '琼中黎族苗族自治县', '460000', '琼中', '109.839996', '19.03557', '2', 'tr_0 tr_460000', '13');
INSERT INTO `areas` VALUES ('500000', '重庆', '1', '重庆', '106.504959', '29.533155', '1', 'tr_0', '22');
INSERT INTO `areas` VALUES ('500100', '重庆市', '500000', '重庆', '106.504959', '29.533155', '2', 'tr_0 tr_500000', '1');
INSERT INTO `areas` VALUES ('500101', '万州区', '500100', '万州', '108.380249', '30.807808', '3', 'tr_0 tr_500000 tr_500100', '28');
INSERT INTO `areas` VALUES ('500102', '涪陵区', '500100', '涪陵', '107.394905', '29.703651', '3', 'tr_0 tr_500000 tr_500100', '11');
INSERT INTO `areas` VALUES ('500103', '渝中区', '500100', '渝中', '106.562881', '29.556742', '3', 'tr_0 tr_500000 tr_500100', '37');
INSERT INTO `areas` VALUES ('500104', '大渡口区', '500100', '大渡口', '106.48613', '29.481003', '3', 'tr_0 tr_500000 tr_500100', '6');
INSERT INTO `areas` VALUES ('500105', '江北区', '500100', '江北', '106.532845', '29.575352', '3', 'tr_0 tr_500000 tr_500100', '13');
INSERT INTO `areas` VALUES ('500106', '沙坪坝区', '500100', '沙坪坝', '106.454201', '29.541224', '3', 'tr_0 tr_500000 tr_500100', '24');
INSERT INTO `areas` VALUES ('500107', '九龙坡区', '500100', '九龙坡', '106.480988', '29.523493', '3', 'tr_0 tr_500000 tr_500100', '15');
INSERT INTO `areas` VALUES ('500108', '南岸区', '500100', '南岸', '106.560814', '29.523993', '3', 'tr_0 tr_500000 tr_500100', '18');
INSERT INTO `areas` VALUES ('500109', '北碚区', '500100', '北碚', '106.437866', '29.82543', '3', 'tr_0 tr_500000 tr_500100', '2');
INSERT INTO `areas` VALUES ('500112', '渝北区', '500100', '渝北', '106.512848', '29.601452', '3', 'tr_0 tr_500000 tr_500100', '35');
INSERT INTO `areas` VALUES ('500113', '巴南区', '500100', '巴南', '106.519424', '29.38192', '3', 'tr_0 tr_500000 tr_500100', '1');
INSERT INTO `areas` VALUES ('500114', '黔江区', '500100', '黔江', '108.782578', '29.527548', '3', 'tr_0 tr_500000 tr_500100', '21');
INSERT INTO `areas` VALUES ('500115', '长寿区', '500100', '长寿', '107.074852', '29.833672', '3', 'tr_0 tr_500000 tr_500100', '4');
INSERT INTO `areas` VALUES ('500222', '綦江区', '500100', '綦江', '106.651421', '29.028091', '3', 'tr_0 tr_500000 tr_500100', '22');
INSERT INTO `areas` VALUES ('500223', '潼南县', '500100', '潼南', '105.84182', '30.189554', '3', 'tr_0 tr_500000 tr_500100', '27');
INSERT INTO `areas` VALUES ('500224', '铜梁县', '500100', '铜梁', '106.054947', '29.839945', '3', 'tr_0 tr_500000 tr_500100', '26');
INSERT INTO `areas` VALUES ('500225', '大足区', '500100', '大足', '105.715317', '29.700499', '3', 'tr_0 tr_500000 tr_500100', '7');
INSERT INTO `areas` VALUES ('500226', '荣昌县', '500100', '荣昌', '105.594063', '29.403627', '3', 'tr_0 tr_500000 tr_500100', '23');
INSERT INTO `areas` VALUES ('500227', '璧山县', '500100', '璧山', '106.231125', '29.59358', '3', 'tr_0 tr_500000 tr_500100', '3');
INSERT INTO `areas` VALUES ('500228', '梁平县', '500100', '梁平', '107.800034', '30.672169', '3', 'tr_0 tr_500000 tr_500100', '17');
INSERT INTO `areas` VALUES ('500229', '城口县', '500100', '城口', '108.664902', '31.946293', '3', 'tr_0 tr_500000 tr_500100', '5');
INSERT INTO `areas` VALUES ('500230', '丰都县', '500100', '丰都', '107.732483', '29.866425', '3', 'tr_0 tr_500000 tr_500100', '9');
INSERT INTO `areas` VALUES ('500231', '垫江县', '500100', '垫江', '107.348694', '30.330011', '3', 'tr_0 tr_500000 tr_500100', '8');
INSERT INTO `areas` VALUES ('500232', '武隆县', '500100', '武隆', '107.756554', '29.323759', '3', 'tr_0 tr_500000 tr_500100', '29');
INSERT INTO `areas` VALUES ('500233', '忠县', '500100', '忠县', '108.037521', '30.291536', '3', 'tr_0 tr_500000 tr_500100', '38');
INSERT INTO `areas` VALUES ('500234', '开县', '500100', '开县', '108.413315', '31.167734', '3', 'tr_0 tr_500000 tr_500100', '16');
INSERT INTO `areas` VALUES ('500235', '云阳县', '500100', '云阳', '108.697701', '30.930529', '3', 'tr_0 tr_500000 tr_500100', '36');
INSERT INTO `areas` VALUES ('500236', '奉节县', '500100', '奉节', '109.465775', '31.019966', '3', 'tr_0 tr_500000 tr_500100', '10');
INSERT INTO `areas` VALUES ('500237', '巫山县', '500100', '巫山', '109.878929', '31.074842', '3', 'tr_0 tr_500000 tr_500100', '30');
INSERT INTO `areas` VALUES ('500238', '巫溪县', '500100', '巫溪', '109.628914', '31.396601', '3', 'tr_0 tr_500000 tr_500100', '31');
INSERT INTO `areas` VALUES ('500240', '石柱土家族自治县', '500100', '石柱', '108.11245', '29.998529', '3', 'tr_0 tr_500000 tr_500100', '25');
INSERT INTO `areas` VALUES ('500241', '秀山土家族苗族自治县', '500100', '秀山', '108.99604', '28.444773', '3', 'tr_0 tr_500000 tr_500100', '32');
INSERT INTO `areas` VALUES ('500242', '酉阳土家族苗族自治县', '500100', '酉阳', '108.767204', '28.839828', '3', 'tr_0 tr_500000 tr_500100', '34');
INSERT INTO `areas` VALUES ('500243', '彭水苗族土家族自治县', '500100', '彭水', '108.16655', '29.293856', '3', 'tr_0 tr_500000 tr_500100', '20');
INSERT INTO `areas` VALUES ('500381', '江津区', '500100', '江津', '106.253159', '29.283386', '3', 'tr_0 tr_500000 tr_500100', '14');
INSERT INTO `areas` VALUES ('500382', '合川区', '500100', '合川', '106.265556', '29.990993', '3', 'tr_0 tr_500000 tr_500100', '12');
INSERT INTO `areas` VALUES ('500383', '永川区', '500100', '永川', '105.894714', '29.348747', '3', 'tr_0 tr_500000 tr_500100', '33');
INSERT INTO `areas` VALUES ('500384', '南川区', '500100', '南川', '107.098152', '29.156647', '3', 'tr_0 tr_500000 tr_500100', '19');
INSERT INTO `areas` VALUES ('510000', '四川省', '1', '四川', '104.065735', '30.659462', '1', 'tr_0', '23');
INSERT INTO `areas` VALUES ('510100', '成都市', '510000', '成都', '104.065735', '30.659462', '2', 'tr_0 tr_510000', '3');
INSERT INTO `areas` VALUES ('510104', '锦江区', '510100', '锦江', '104.080986', '30.657688', '3', 'tr_0 tr_510000 tr_510100', '5');
INSERT INTO `areas` VALUES ('510105', '青羊区', '510100', '青羊', '104.055733', '30.667648', '3', 'tr_0 tr_510000 tr_510100', '13');
INSERT INTO `areas` VALUES ('510106', '金牛区', '510100', '金牛', '104.043488', '30.692059', '3', 'tr_0 tr_510000 tr_510100', '6');
INSERT INTO `areas` VALUES ('510107', '武侯区', '510100', '武侯', '104.051666', '30.630861', '3', 'tr_0 tr_510000 tr_510100', '17');
INSERT INTO `areas` VALUES ('510108', '成华区', '510100', '成华', '104.103081', '30.660275', '3', 'tr_0 tr_510000 tr_510100', '1');
INSERT INTO `areas` VALUES ('510112', '龙泉驿区', '510100', '龙泉驿', '104.26918', '30.56065', '3', 'tr_0 tr_510000 tr_510100', '8');
INSERT INTO `areas` VALUES ('510113', '青白江区', '510100', '青白江', '104.254936', '30.883438', '3', 'tr_0 tr_510000 tr_510100', '12');
INSERT INTO `areas` VALUES ('510114', '新都区', '510100', '新都', '104.160217', '30.824223', '3', 'tr_0 tr_510000 tr_510100', '18');
INSERT INTO `areas` VALUES ('510115', '温江区', '510100', '温江', '103.836777', '30.697996', '3', 'tr_0 tr_510000 tr_510100', '16');
INSERT INTO `areas` VALUES ('510121', '金堂县', '510100', '金堂', '104.415604', '30.858418', '3', 'tr_0 tr_510000 tr_510100', '7');
INSERT INTO `areas` VALUES ('510122', '双流县', '510100', '双流', '103.922707', '30.573242', '3', 'tr_0 tr_510000 tr_510100', '15');
INSERT INTO `areas` VALUES ('510124', '郫县', '510100', '郫县', '103.88784', '30.808752', '3', 'tr_0 tr_510000 tr_510100', '10');
INSERT INTO `areas` VALUES ('510129', '大邑县', '510100', '大邑', '103.5224', '30.586601', '3', 'tr_0 tr_510000 tr_510100', '3');
INSERT INTO `areas` VALUES ('510131', '蒲江县', '510100', '蒲江', '103.511543', '30.194359', '3', 'tr_0 tr_510000 tr_510100', '11');
INSERT INTO `areas` VALUES ('510132', '新津县', '510100', '新津', '103.812447', '30.414284', '3', 'tr_0 tr_510000 tr_510100', '19');
INSERT INTO `areas` VALUES ('510181', '都江堰市', '510100', '都江堰', '103.627899', '30.99114', '3', 'tr_0 tr_510000 tr_510100', '4');
INSERT INTO `areas` VALUES ('510182', '彭州市', '510100', '彭州', '103.94117', '30.985161', '3', 'tr_0 tr_510000 tr_510100', '9');
INSERT INTO `areas` VALUES ('510183', '邛崃市', '510100', '邛崃', '103.461433', '30.413271', '3', 'tr_0 tr_510000 tr_510100', '14');
INSERT INTO `areas` VALUES ('510184', '崇州市', '510100', '崇州', '103.671051', '30.631477', '3', 'tr_0 tr_510000 tr_510100', '2');
INSERT INTO `areas` VALUES ('510300', '自贡市', '510000', '自贡', '104.773445', '29.352764', '2', 'tr_0 tr_510000', '20');
INSERT INTO `areas` VALUES ('510302', '自流井区', '510300', '自流井', '104.778191', '29.343231', '3', 'tr_0 tr_510000 tr_510300', '6');
INSERT INTO `areas` VALUES ('510303', '贡井区', '510300', '贡井', '104.714371', '29.345675', '3', 'tr_0 tr_510000 tr_510300', '3');
INSERT INTO `areas` VALUES ('510304', '大安区', '510300', '大安', '104.783226', '29.367136', '3', 'tr_0 tr_510000 tr_510300', '1');
INSERT INTO `areas` VALUES ('510311', '沿滩区', '510300', '沿滩', '104.876419', '29.27252', '3', 'tr_0 tr_510000 tr_510300', '5');
INSERT INTO `areas` VALUES ('510321', '荣县', '510300', '荣县', '104.423935', '29.454851', '3', 'tr_0 tr_510000 tr_510300', '4');
INSERT INTO `areas` VALUES ('510322', '富顺县', '510300', '富顺', '104.984253', '29.181282', '3', 'tr_0 tr_510000 tr_510300', '2');
INSERT INTO `areas` VALUES ('510400', '攀枝花市', '510000', '攀枝花', '101.716003', '26.580446', '2', 'tr_0 tr_510000', '16');
INSERT INTO `areas` VALUES ('510402', '东区', '510400', '东区', '101.715134', '26.580887', '3', 'tr_0 tr_510000 tr_510400', '1');
INSERT INTO `areas` VALUES ('510403', '西区', '510400', '西区', '101.63797', '26.596775', '3', 'tr_0 tr_510000 tr_510400', '4');
INSERT INTO `areas` VALUES ('510411', '仁和区', '510400', '仁和', '101.737915', '26.497185', '3', 'tr_0 tr_510000 tr_510400', '3');
INSERT INTO `areas` VALUES ('510421', '米易县', '510400', '米易', '102.109879', '26.887474', '3', 'tr_0 tr_510000 tr_510400', '2');
INSERT INTO `areas` VALUES ('510422', '盐边县', '510400', '盐边', '101.851845', '26.67762', '3', 'tr_0 tr_510000 tr_510400', '5');
INSERT INTO `areas` VALUES ('510500', '泸州市', '510000', '泸州', '105.443352', '28.889137', '2', 'tr_0 tr_510000', '11');
INSERT INTO `areas` VALUES ('510502', '江阳区', '510500', '江阳', '105.445129', '28.882889', '3', 'tr_0 tr_510000 tr_510500', '3');
INSERT INTO `areas` VALUES ('510503', '纳溪区', '510500', '纳溪', '105.377213', '28.77631', '3', 'tr_0 tr_510000 tr_510500', '6');
INSERT INTO `areas` VALUES ('510504', '龙马潭区', '510500', '龙马潭', '105.435226', '28.897572', '3', 'tr_0 tr_510000 tr_510500', '4');
INSERT INTO `areas` VALUES ('510521', '泸县', '510500', '泸县', '105.376335', '29.151287', '3', 'tr_0 tr_510000 tr_510500', '5');
INSERT INTO `areas` VALUES ('510522', '合江县', '510500', '合江', '105.834099', '28.810326', '3', 'tr_0 tr_510000 tr_510500', '2');
INSERT INTO `areas` VALUES ('510524', '叙永县', '510500', '叙永', '105.437775', '28.167919', '3', 'tr_0 tr_510000 tr_510500', '7');
INSERT INTO `areas` VALUES ('510525', '古蔺县', '510500', '古蔺', '105.813362', '28.03948', '3', 'tr_0 tr_510000 tr_510500', '1');
INSERT INTO `areas` VALUES ('510600', '德阳市', '510000', '德阳', '104.398651', '31.127991', '2', 'tr_0 tr_510000', '5');
INSERT INTO `areas` VALUES ('510603', '旌阳区', '510600', '旌阳', '104.389648', '31.130428', '3', 'tr_0 tr_510000 tr_510600', '2');
INSERT INTO `areas` VALUES ('510623', '中江县', '510600', '中江', '104.677834', '31.03681', '3', 'tr_0 tr_510000 tr_510600', '6');
INSERT INTO `areas` VALUES ('510626', '罗江县', '510600', '罗江', '104.507126', '31.303282', '3', 'tr_0 tr_510000 tr_510600', '3');
INSERT INTO `areas` VALUES ('510681', '广汉市', '510600', '广汉', '104.281906', '30.97715', '3', 'tr_0 tr_510000 tr_510600', '1');
INSERT INTO `areas` VALUES ('510682', '什邡市', '510600', '什邡', '104.173653', '31.126881', '3', 'tr_0 tr_510000 tr_510600', '5');
INSERT INTO `areas` VALUES ('510683', '绵竹市', '510600', '绵竹', '104.200165', '31.343084', '3', 'tr_0 tr_510000 tr_510600', '4');
INSERT INTO `areas` VALUES ('510700', '绵阳市', '510000', '绵阳', '104.741722', '31.46402', '2', 'tr_0 tr_510000', '13');
INSERT INTO `areas` VALUES ('510703', '涪城区', '510700', '涪城', '104.740974', '31.463556', '3', 'tr_0 tr_510000 tr_510700', '3');
INSERT INTO `areas` VALUES ('510704', '游仙区', '510700', '游仙', '104.770004', '31.484772', '3', 'tr_0 tr_510000 tr_510700', '8');
INSERT INTO `areas` VALUES ('510722', '三台县', '510700', '三台', '105.090317', '31.090908', '3', 'tr_0 tr_510000 tr_510700', '6');
INSERT INTO `areas` VALUES ('510723', '盐亭县', '510700', '盐亭', '105.391991', '31.223181', '3', 'tr_0 tr_510000 tr_510700', '7');
INSERT INTO `areas` VALUES ('510724', '安县', '510700', '安县', '104.560341', '31.53894', '3', 'tr_0 tr_510000 tr_510700', '1');
INSERT INTO `areas` VALUES ('510725', '梓潼县', '510700', '梓潼', '105.163528', '31.635225', '3', 'tr_0 tr_510000 tr_510700', '9');
INSERT INTO `areas` VALUES ('510726', '北川羌族自治县', '510700', '北川', '104.468071', '31.615864', '3', 'tr_0 tr_510000 tr_510700', '2');
INSERT INTO `areas` VALUES ('510727', '平武县', '510700', '平武', '104.530556', '32.407589', '3', 'tr_0 tr_510000 tr_510700', '5');
INSERT INTO `areas` VALUES ('510781', '江油市', '510700', '江油', '104.744431', '31.776386', '3', 'tr_0 tr_510000 tr_510700', '4');
INSERT INTO `areas` VALUES ('510800', '广元市', '510000', '广元', '105.829758', '32.433666', '2', 'tr_0 tr_510000', '8');
INSERT INTO `areas` VALUES ('510802', '利州区', '510800', '利州', '105.826195', '32.432278', '3', 'tr_0 tr_510000 tr_510800', '4');
INSERT INTO `areas` VALUES ('510811', '昭化区', '510800', '昭化', '105.964119', '32.322788', '3', 'tr_0 tr_510000 tr_510800', '7');
INSERT INTO `areas` VALUES ('510812', '朝天区', '510800', '朝天', '105.889168', '32.642632', '3', 'tr_0 tr_510000 tr_510800', '2');
INSERT INTO `areas` VALUES ('510821', '旺苍县', '510800', '旺苍', '106.290428', '32.228329', '3', 'tr_0 tr_510000 tr_510800', '6');
INSERT INTO `areas` VALUES ('510822', '青川县', '510800', '青川', '105.238846', '32.585655', '3', 'tr_0 tr_510000 tr_510800', '5');
INSERT INTO `areas` VALUES ('510823', '剑阁县', '510800', '剑阁', '105.527039', '32.286518', '3', 'tr_0 tr_510000 tr_510800', '3');
INSERT INTO `areas` VALUES ('510824', '苍溪县', '510800', '苍溪', '105.939705', '31.73225', '3', 'tr_0 tr_510000 tr_510800', '1');
INSERT INTO `areas` VALUES ('510900', '遂宁市', '510000', '遂宁', '105.571327', '30.513311', '2', 'tr_0 tr_510000', '17');
INSERT INTO `areas` VALUES ('510903', '船山区', '510900', '船山', '105.582214', '30.502647', '3', 'tr_0 tr_510000 tr_510900', '2');
INSERT INTO `areas` VALUES ('510904', '安居区', '510900', '安居', '105.459381', '30.346121', '3', 'tr_0 tr_510000 tr_510900', '1');
INSERT INTO `areas` VALUES ('510921', '蓬溪县', '510900', '蓬溪', '105.713699', '30.774883', '3', 'tr_0 tr_510000 tr_510900', '4');
INSERT INTO `areas` VALUES ('510922', '射洪县', '510900', '射洪', '105.381851', '30.868752', '3', 'tr_0 tr_510000 tr_510900', '5');
INSERT INTO `areas` VALUES ('510923', '大英县', '510900', '大英', '105.25219', '30.581572', '3', 'tr_0 tr_510000 tr_510900', '3');
INSERT INTO `areas` VALUES ('511000', '内江市', '510000', '内江', '105.066139', '29.58708', '2', 'tr_0 tr_510000', '15');
INSERT INTO `areas` VALUES ('511002', '市中区', '511000', '市中', '105.065468', '29.585264', '3', 'tr_0 tr_510000 tr_511000', '3');
INSERT INTO `areas` VALUES ('511011', '东兴区', '511000', '东兴', '105.0672', '29.600107', '3', 'tr_0 tr_510000 tr_511000', '1');
INSERT INTO `areas` VALUES ('511024', '威远县', '511000', '威远', '104.668327', '29.526859', '3', 'tr_0 tr_510000 tr_511000', '4');
INSERT INTO `areas` VALUES ('511025', '资中县', '511000', '资中', '104.852463', '29.775295', '3', 'tr_0 tr_510000 tr_511000', '5');
INSERT INTO `areas` VALUES ('511028', '隆昌县', '511000', '隆昌', '105.288071', '29.338161', '3', 'tr_0 tr_510000 tr_511000', '2');
INSERT INTO `areas` VALUES ('511100', '乐山市', '510000', '乐山', '103.761261', '29.582024', '2', 'tr_0 tr_510000', '9');
INSERT INTO `areas` VALUES ('511102', '市中区', '511100', '市中', '103.755386', '29.588327', '3', 'tr_0 tr_510000 tr_511100', '10');
INSERT INTO `areas` VALUES ('511111', '沙湾区', '511100', '沙湾', '103.549957', '29.416536', '3', 'tr_0 tr_510000 tr_511100', '9');
INSERT INTO `areas` VALUES ('511112', '五通桥区', '511100', '五通桥', '103.816833', '29.406185', '3', 'tr_0 tr_510000 tr_511100', '11');
INSERT INTO `areas` VALUES ('511113', '金口河区', '511100', '金口河', '103.077827', '29.246019', '3', 'tr_0 tr_510000 tr_511100', '5');
INSERT INTO `areas` VALUES ('511123', '犍为县', '511100', '犍为', '103.944267', '29.209782', '3', 'tr_0 tr_510000 tr_511100', '8');
INSERT INTO `areas` VALUES ('511124', '井研县', '511100', '井研', '104.068848', '29.651646', '3', 'tr_0 tr_510000 tr_511100', '4');
INSERT INTO `areas` VALUES ('511126', '夹江县', '511100', '夹江', '103.578865', '29.741018', '3', 'tr_0 tr_510000 tr_511100', '3');
INSERT INTO `areas` VALUES ('511129', '沐川县', '511100', '沐川', '103.902107', '28.956339', '3', 'tr_0 tr_510000 tr_511100', '7');
INSERT INTO `areas` VALUES ('511132', '峨边彝族自治县', '511100', '峨边', '103.262146', '29.23027', '3', 'tr_0 tr_510000 tr_511100', '1');
INSERT INTO `areas` VALUES ('511133', '马边彝族自治县', '511100', '马边', '103.546852', '28.838934', '3', 'tr_0 tr_510000 tr_511100', '6');
INSERT INTO `areas` VALUES ('511181', '峨眉山市', '511100', '峨眉山', '103.492485', '29.597479', '3', 'tr_0 tr_510000 tr_511100', '2');
INSERT INTO `areas` VALUES ('511300', '南充市', '510000', '南充', '106.082977', '30.79528', '2', 'tr_0 tr_510000', '14');
INSERT INTO `areas` VALUES ('511302', '顺庆区', '511300', '顺庆', '106.084091', '30.795572', '3', 'tr_0 tr_510000 tr_511300', '6');
INSERT INTO `areas` VALUES ('511303', '高坪区', '511300', '高坪', '106.108994', '30.781809', '3', 'tr_0 tr_510000 tr_511300', '1');
INSERT INTO `areas` VALUES ('511304', '嘉陵区', '511300', '嘉陵', '106.067024', '30.762976', '3', 'tr_0 tr_510000 tr_511300', '2');
INSERT INTO `areas` VALUES ('511321', '南部县', '511300', '南部', '106.061134', '31.349407', '3', 'tr_0 tr_510000 tr_511300', '4');
INSERT INTO `areas` VALUES ('511322', '营山县', '511300', '营山', '106.564896', '31.075907', '3', 'tr_0 tr_510000 tr_511300', '9');
INSERT INTO `areas` VALUES ('511323', '蓬安县', '511300', '蓬安', '106.41349', '31.027979', '3', 'tr_0 tr_510000 tr_511300', '5');
INSERT INTO `areas` VALUES ('511324', '仪陇县', '511300', '仪陇', '106.297081', '31.271261', '3', 'tr_0 tr_510000 tr_511300', '8');
INSERT INTO `areas` VALUES ('511325', '西充县', '511300', '西充', '105.893021', '30.994616', '3', 'tr_0 tr_510000 tr_511300', '7');
INSERT INTO `areas` VALUES ('511381', '阆中市', '511300', '阆中', '105.975266', '31.580465', '3', 'tr_0 tr_510000 tr_511300', '3');
INSERT INTO `areas` VALUES ('511400', '眉山市', '510000', '眉山', '103.831787', '30.048319', '2', 'tr_0 tr_510000', '12');
INSERT INTO `areas` VALUES ('511402', '东坡区', '511400', '东坡', '103.831551', '30.048128', '3', 'tr_0 tr_510000 tr_511400', '2');
INSERT INTO `areas` VALUES ('511421', '仁寿县', '511400', '仁寿', '104.147644', '29.996721', '3', 'tr_0 tr_510000 tr_511400', '6');
INSERT INTO `areas` VALUES ('511422', '彭山县', '511400', '彭山', '103.870102', '30.192299', '3', 'tr_0 tr_510000 tr_511400', '4');
INSERT INTO `areas` VALUES ('511423', '洪雅县', '511400', '洪雅', '103.375008', '29.904867', '3', 'tr_0 tr_510000 tr_511400', '3');
INSERT INTO `areas` VALUES ('511424', '丹棱县', '511400', '丹棱', '103.518333', '30.012751', '3', 'tr_0 tr_510000 tr_511400', '1');
INSERT INTO `areas` VALUES ('511425', '青神县', '511400', '青神', '103.84613', '29.831469', '3', 'tr_0 tr_510000 tr_511400', '5');
INSERT INTO `areas` VALUES ('511500', '宜宾市', '510000', '宜宾', '104.630821', '28.760189', '2', 'tr_0 tr_510000', '19');
INSERT INTO `areas` VALUES ('511502', '翠屏区', '511500', '翠屏', '104.630234', '28.76018', '3', 'tr_0 tr_510000 tr_511500', '2');
INSERT INTO `areas` VALUES ('511521', '宜宾县', '511500', '宜宾', '104.541489', '28.695679', '3', 'tr_0 tr_510000 tr_511500', '10');
INSERT INTO `areas` VALUES ('511522', '南溪区', '511500', '南溪', '104.981133', '28.839806', '3', 'tr_0 tr_510000 tr_511500', '7');
INSERT INTO `areas` VALUES ('511523', '江安县', '511500', '江安', '105.068695', '28.728102', '3', 'tr_0 tr_510000 tr_511500', '5');
INSERT INTO `areas` VALUES ('511524', '长宁县', '511500', '长宁', '104.92112', '28.577271', '3', 'tr_0 tr_510000 tr_511500', '1');
INSERT INTO `areas` VALUES ('511525', '高县', '511500', '高县', '104.519188', '28.435677', '3', 'tr_0 tr_510000 tr_511500', '3');
INSERT INTO `areas` VALUES ('511526', '珙县', '511500', '珙县', '104.712265', '28.449041', '3', 'tr_0 tr_510000 tr_511500', '4');
INSERT INTO `areas` VALUES ('511527', '筠连县', '511500', '筠连', '104.507851', '28.162018', '3', 'tr_0 tr_510000 tr_511500', '6');
INSERT INTO `areas` VALUES ('511528', '兴文县', '511500', '兴文', '105.236549', '28.302988', '3', 'tr_0 tr_510000 tr_511500', '9');
INSERT INTO `areas` VALUES ('511529', '屏山县', '511500', '屏山', '104.162621', '28.64237', '3', 'tr_0 tr_510000 tr_511500', '8');
INSERT INTO `areas` VALUES ('511600', '广安市', '510000', '广安', '106.633369', '30.456398', '2', 'tr_0 tr_510000', '7');
INSERT INTO `areas` VALUES ('511602', '广安区', '511600', '广安', '106.632904', '30.456463', '3', 'tr_0 tr_510000 tr_511600', '1');
INSERT INTO `areas` VALUES ('511603', '前锋区', '511600', '前锋', '106.89328', '30.4963', '3', 'tr_0 tr_510000 tr_511600', '4');
INSERT INTO `areas` VALUES ('511621', '岳池县', '511600', '岳池', '106.44445', '30.533539', '3', 'tr_0 tr_510000 tr_511600', '6');
INSERT INTO `areas` VALUES ('511622', '武胜县', '511600', '武胜', '106.292473', '30.344292', '3', 'tr_0 tr_510000 tr_511600', '5');
INSERT INTO `areas` VALUES ('511623', '邻水县', '511600', '邻水', '106.934967', '30.334324', '3', 'tr_0 tr_510000 tr_511600', '3');
INSERT INTO `areas` VALUES ('511681', '华蓥市', '511600', '华蓥', '106.777885', '30.380573', '3', 'tr_0 tr_510000 tr_511600', '2');
INSERT INTO `areas` VALUES ('511700', '达州市', '510000', '达州', '107.502258', '31.209484', '2', 'tr_0 tr_510000', '4');
INSERT INTO `areas` VALUES ('511702', '通川区', '511700', '通川', '107.50106', '31.213522', '3', 'tr_0 tr_510000 tr_511700', '5');
INSERT INTO `areas` VALUES ('511721', '达川区', '511700', '达川', '107.507927', '31.199062', '3', 'tr_0 tr_510000 tr_511700', '1');
INSERT INTO `areas` VALUES ('511722', '宣汉县', '511700', '宣汉', '107.722252', '31.355024', '3', 'tr_0 tr_510000 tr_511700', '7');
INSERT INTO `areas` VALUES ('511723', '开江县', '511700', '开江', '107.864136', '31.085537', '3', 'tr_0 tr_510000 tr_511700', '3');
INSERT INTO `areas` VALUES ('511724', '大竹县', '511700', '大竹', '107.20742', '30.736288', '3', 'tr_0 tr_510000 tr_511700', '2');
INSERT INTO `areas` VALUES ('511725', '渠县', '511700', '渠县', '106.970749', '30.836348', '3', 'tr_0 tr_510000 tr_511700', '4');
INSERT INTO `areas` VALUES ('511781', '万源市', '511700', '万源', '108.037544', '32.067768', '3', 'tr_0 tr_510000 tr_511700', '6');
INSERT INTO `areas` VALUES ('511800', '雅安市', '510000', '雅安', '103.00103', '29.987722', '2', 'tr_0 tr_510000', '18');
INSERT INTO `areas` VALUES ('511802', '雨城区', '511800', '雨城', '103.003395', '29.981831', '3', 'tr_0 tr_510000 tr_511800', '8');
INSERT INTO `areas` VALUES ('511821', '名山区', '511800', '名山', '103.112213', '30.084719', '3', 'tr_0 tr_510000 tr_511800', '4');
INSERT INTO `areas` VALUES ('511822', '荥经县', '511800', '荥经', '102.844673', '29.795528', '3', 'tr_0 tr_510000 tr_511800', '7');
INSERT INTO `areas` VALUES ('511823', '汉源县', '511800', '汉源', '102.677147', '29.349915', '3', 'tr_0 tr_510000 tr_511800', '2');
INSERT INTO `areas` VALUES ('511824', '石棉县', '511800', '石棉', '102.359619', '29.234062', '3', 'tr_0 tr_510000 tr_511800', '5');
INSERT INTO `areas` VALUES ('511825', '天全县', '511800', '天全', '102.763458', '30.059956', '3', 'tr_0 tr_510000 tr_511800', '6');
INSERT INTO `areas` VALUES ('511826', '芦山县', '511800', '芦山', '102.924019', '30.152906', '3', 'tr_0 tr_510000 tr_511800', '3');
INSERT INTO `areas` VALUES ('511827', '宝兴县', '511800', '宝兴', '102.813377', '30.369026', '3', 'tr_0 tr_510000 tr_511800', '1');
INSERT INTO `areas` VALUES ('511900', '巴中市', '510000', '巴中', '106.75367', '31.858809', '2', 'tr_0 tr_510000', '2');
INSERT INTO `areas` VALUES ('511902', '巴州区', '511900', '巴州', '106.75367', '31.858366', '3', 'tr_0 tr_510000 tr_511900', '1');
INSERT INTO `areas` VALUES ('511903', '恩阳区', '511900', '恩阳', '106.636078', '31.789442', '3', 'tr_0 tr_510000 tr_511900', '2');
INSERT INTO `areas` VALUES ('511921', '通江县', '511900', '通江', '107.24762', '31.912121', '3', 'tr_0 tr_510000 tr_511900', '5');
INSERT INTO `areas` VALUES ('511922', '南江县', '511900', '南江', '106.843414', '32.353165', '3', 'tr_0 tr_510000 tr_511900', '3');
INSERT INTO `areas` VALUES ('511923', '平昌县', '511900', '平昌', '107.101936', '31.562815', '3', 'tr_0 tr_510000 tr_511900', '4');
INSERT INTO `areas` VALUES ('512000', '资阳市', '510000', '资阳', '104.641914', '30.122211', '2', 'tr_0 tr_510000', '21');
INSERT INTO `areas` VALUES ('512002', '雁江区', '512000', '雁江', '104.642342', '30.121687', '3', 'tr_0 tr_510000 tr_512000', '4');
INSERT INTO `areas` VALUES ('512021', '安岳县', '512000', '安岳', '105.336761', '30.099207', '3', 'tr_0 tr_510000 tr_512000', '1');
INSERT INTO `areas` VALUES ('512022', '乐至县', '512000', '乐至', '105.031143', '30.27562', '3', 'tr_0 tr_510000 tr_512000', '3');
INSERT INTO `areas` VALUES ('512081', '简阳市', '512000', '简阳', '104.550339', '30.390665', '3', 'tr_0 tr_510000 tr_512000', '2');
INSERT INTO `areas` VALUES ('513200', '阿坝藏族羌族自治州', '510000', '阿坝', '102.221375', '31.899792', '2', 'tr_0 tr_510000', '1');
INSERT INTO `areas` VALUES ('513221', '汶川县', '513200', '汶川', '103.580673', '31.47463', '3', 'tr_0 tr_510000 tr_513200', '12');
INSERT INTO `areas` VALUES ('513222', '理县', '513200', '理县', '103.165489', '31.436764', '3', 'tr_0 tr_510000 tr_513200', '6');
INSERT INTO `areas` VALUES ('513223', '茂县', '513200', '茂县', '103.850685', '31.680407', '3', 'tr_0 tr_510000 tr_513200', '8');
INSERT INTO `areas` VALUES ('513224', '松潘县', '513200', '松潘', '103.599174', '32.638378', '3', 'tr_0 tr_510000 tr_513200', '11');
INSERT INTO `areas` VALUES ('513225', '九寨沟县', '513200', '九寨沟', '104.236343', '33.262096', '3', 'tr_0 tr_510000 tr_513200', '5');
INSERT INTO `areas` VALUES ('513226', '金川县', '513200', '金川', '102.064644', '31.476357', '3', 'tr_0 tr_510000 tr_513200', '4');
INSERT INTO `areas` VALUES ('513227', '小金县', '513200', '小金', '102.36319', '30.999016', '3', 'tr_0 tr_510000 tr_513200', '13');
INSERT INTO `areas` VALUES ('513228', '黑水县', '513200', '黑水', '102.990807', '32.061722', '3', 'tr_0 tr_510000 tr_513200', '2');
INSERT INTO `areas` VALUES ('513229', '马尔康县', '513200', '马尔康', '102.221184', '31.899761', '3', 'tr_0 tr_510000 tr_513200', '7');
INSERT INTO `areas` VALUES ('513230', '壤塘县', '513200', '壤塘', '100.979134', '32.264889', '3', 'tr_0 tr_510000 tr_513200', '9');
INSERT INTO `areas` VALUES ('513231', '阿坝县', '513200', '阿坝', '101.700989', '32.904224', '3', 'tr_0 tr_510000 tr_513200', '1');
INSERT INTO `areas` VALUES ('513232', '若尔盖县', '513200', '若尔盖', '102.963722', '33.575935', '3', 'tr_0 tr_510000 tr_513200', '10');
INSERT INTO `areas` VALUES ('513233', '红原县', '513200', '红原', '102.544907', '32.793903', '3', 'tr_0 tr_510000 tr_513200', '3');
INSERT INTO `areas` VALUES ('513300', '甘孜藏族自治州', '510000', '甘孜', '101.963814', '30.050663', '2', 'tr_0 tr_510000', '6');
INSERT INTO `areas` VALUES ('513321', '康定县', '513300', '康定', '101.964058', '30.050737', '3', 'tr_0 tr_510000 tr_513300', '10');
INSERT INTO `areas` VALUES ('513322', '泸定县', '513300', '泸定', '102.233223', '29.912481', '3', 'tr_0 tr_510000 tr_513300', '12');
INSERT INTO `areas` VALUES ('513323', '丹巴县', '513300', '丹巴', '101.886124', '30.877083', '3', 'tr_0 tr_510000 tr_513300', '3');
INSERT INTO `areas` VALUES ('513324', '九龙县', '513300', '九龙', '101.506943', '29.001974', '3', 'tr_0 tr_510000 tr_513300', '9');
INSERT INTO `areas` VALUES ('513325', '雅江县', '513300', '雅江', '101.015732', '30.032249', '3', 'tr_0 tr_510000 tr_513300', '18');
INSERT INTO `areas` VALUES ('513326', '道孚县', '513300', '道孚', '101.123329', '30.978767', '3', 'tr_0 tr_510000 tr_513300', '5');
INSERT INTO `areas` VALUES ('513327', '炉霍县', '513300', '炉霍', '100.679497', '31.392673', '3', 'tr_0 tr_510000 tr_513300', '13');
INSERT INTO `areas` VALUES ('513328', '甘孜县', '513300', '甘孜', '99.991753', '31.619749', '3', 'tr_0 tr_510000 tr_513300', '8');
INSERT INTO `areas` VALUES ('513329', '新龙县', '513300', '新龙', '100.312096', '30.938959', '3', 'tr_0 tr_510000 tr_513300', '17');
INSERT INTO `areas` VALUES ('513330', '德格县', '513300', '德格', '98.579987', '31.806728', '3', 'tr_0 tr_510000 tr_513300', '6');
INSERT INTO `areas` VALUES ('513331', '白玉县', '513300', '白玉', '98.824341', '31.208805', '3', 'tr_0 tr_510000 tr_513300', '1');
INSERT INTO `areas` VALUES ('513332', '石渠县', '513300', '石渠', '98.100883', '32.975304', '3', 'tr_0 tr_510000 tr_513300', '15');
INSERT INTO `areas` VALUES ('513333', '色达县', '513300', '色达', '100.331657', '32.268776', '3', 'tr_0 tr_510000 tr_513300', '14');
INSERT INTO `areas` VALUES ('513334', '理塘县', '513300', '理塘', '100.269859', '29.991808', '3', 'tr_0 tr_510000 tr_513300', '11');
INSERT INTO `areas` VALUES ('513335', '巴塘县', '513300', '巴塘', '99.109039', '30.005724', '3', 'tr_0 tr_510000 tr_513300', '2');
INSERT INTO `areas` VALUES ('513336', '乡城县', '513300', '乡城', '99.799942', '28.930855', '3', 'tr_0 tr_510000 tr_513300', '16');
INSERT INTO `areas` VALUES ('513337', '稻城县', '513300', '稻城', '100.296692', '29.037544', '3', 'tr_0 tr_510000 tr_513300', '4');
INSERT INTO `areas` VALUES ('513338', '得荣县', '513300', '得荣', '99.288033', '28.71134', '3', 'tr_0 tr_510000 tr_513300', '7');
INSERT INTO `areas` VALUES ('513400', '凉山彝族自治州', '510000', '凉山', '102.258743', '27.886763', '2', 'tr_0 tr_510000', '10');
INSERT INTO `areas` VALUES ('513401', '西昌市', '513400', '西昌', '102.258759', '27.885786', '3', 'tr_0 tr_510000 tr_513400', '13');
INSERT INTO `areas` VALUES ('513422', '木里藏族自治县', '513400', '木里', '101.280182', '27.926859', '3', 'tr_0 tr_510000 tr_513400', '10');
INSERT INTO `areas` VALUES ('513423', '盐源县', '513400', '盐源', '101.508911', '27.423414', '3', 'tr_0 tr_510000 tr_513400', '15');
INSERT INTO `areas` VALUES ('513424', '德昌县', '513400', '德昌', '102.178848', '27.403828', '3', 'tr_0 tr_510000 tr_513400', '2');
INSERT INTO `areas` VALUES ('513425', '会理县', '513400', '会理', '102.24955', '26.658703', '3', 'tr_0 tr_510000 tr_513400', '5');
INSERT INTO `areas` VALUES ('513426', '会东县', '513400', '会东', '102.578987', '26.630713', '3', 'tr_0 tr_510000 tr_513400', '4');
INSERT INTO `areas` VALUES ('513427', '宁南县', '513400', '宁南', '102.757378', '27.065205', '3', 'tr_0 tr_510000 tr_513400', '11');
INSERT INTO `areas` VALUES ('513428', '普格县', '513400', '普格', '102.541084', '27.376827', '3', 'tr_0 tr_510000 tr_513400', '12');
INSERT INTO `areas` VALUES ('513429', '布拖县', '513400', '布拖', '102.8088', '27.709063', '3', 'tr_0 tr_510000 tr_513400', '1');
INSERT INTO `areas` VALUES ('513430', '金阳县', '513400', '金阳', '103.248703', '27.695915', '3', 'tr_0 tr_510000 tr_513400', '6');
INSERT INTO `areas` VALUES ('513431', '昭觉县', '513400', '昭觉', '102.843994', '28.010553', '3', 'tr_0 tr_510000 tr_513400', '17');
INSERT INTO `areas` VALUES ('513432', '喜德县', '513400', '喜德', '102.412338', '28.305487', '3', 'tr_0 tr_510000 tr_513400', '14');
INSERT INTO `areas` VALUES ('513433', '冕宁县', '513400', '冕宁', '102.170044', '28.550844', '3', 'tr_0 tr_510000 tr_513400', '9');
INSERT INTO `areas` VALUES ('513434', '越西县', '513400', '越西', '102.508873', '28.639631', '3', 'tr_0 tr_510000 tr_513400', '16');
INSERT INTO `areas` VALUES ('513435', '甘洛县', '513400', '甘洛', '102.775925', '28.977095', '3', 'tr_0 tr_510000 tr_513400', '3');
INSERT INTO `areas` VALUES ('513436', '美姑县', '513400', '美姑', '103.132004', '28.327946', '3', 'tr_0 tr_510000 tr_513400', '8');
INSERT INTO `areas` VALUES ('513437', '雷波县', '513400', '雷波', '103.571587', '28.262945', '3', 'tr_0 tr_510000 tr_513400', '7');
INSERT INTO `areas` VALUES ('520000', '贵州省', '1', '贵州', '106.713478', '26.578342', '1', 'tr_0', '24');
INSERT INTO `areas` VALUES ('520100', '贵阳市', '520000', '贵阳', '106.713478', '26.578342', '2', 'tr_0 tr_520000', '3');
INSERT INTO `areas` VALUES ('520102', '南明区', '520100', '南明', '106.715965', '26.573744', '3', 'tr_0 tr_520000 tr_520100', '5');
INSERT INTO `areas` VALUES ('520103', '云岩区', '520100', '云岩', '106.713394', '26.58301', '3', 'tr_0 tr_520000 tr_520100', '10');
INSERT INTO `areas` VALUES ('520111', '花溪区', '520100', '花溪', '106.670792', '26.410463', '3', 'tr_0 tr_520000 tr_520100', '3');
INSERT INTO `areas` VALUES ('520112', '乌当区', '520100', '乌当', '106.762123', '26.630928', '3', 'tr_0 tr_520000 tr_520100', '7');
INSERT INTO `areas` VALUES ('520113', '白云区', '520100', '白云', '106.633034', '26.676849', '3', 'tr_0 tr_520000 tr_520100', '1');
INSERT INTO `areas` VALUES ('520121', '开阳县', '520100', '开阳', '106.969437', '27.056793', '3', 'tr_0 tr_520000 tr_520100', '4');
INSERT INTO `areas` VALUES ('520122', '息烽县', '520100', '息烽', '106.737694', '27.092665', '3', 'tr_0 tr_520000 tr_520100', '8');
INSERT INTO `areas` VALUES ('520123', '修文县', '520100', '修文', '106.59922', '26.840672', '3', 'tr_0 tr_520000 tr_520100', '9');
INSERT INTO `areas` VALUES ('520151', '观山湖区', '520100', '观山湖', '106.713478', '26.578342', '3', 'tr_0 tr_520000 tr_520100', '2');
INSERT INTO `areas` VALUES ('520181', '清镇市', '520100', '清镇', '106.470276', '26.551289', '3', 'tr_0 tr_520000 tr_520100', '6');
INSERT INTO `areas` VALUES ('520200', '六盘水市', '520000', '六盘水', '104.846741', '26.584642', '2', 'tr_0 tr_520000', '4');
INSERT INTO `areas` VALUES ('520201', '钟山区', '520200', '钟山', '104.846245', '26.584805', '3', 'tr_0 tr_520000 tr_520200', '4');
INSERT INTO `areas` VALUES ('520203', '六枝特区', '520200', '六枝特', '105.474236', '26.210663', '3', 'tr_0 tr_520000 tr_520200', '1');
INSERT INTO `areas` VALUES ('520221', '水城县', '520200', '水城', '104.956848', '26.540478', '3', 'tr_0 tr_520000 tr_520200', '3');
INSERT INTO `areas` VALUES ('520222', '盘县', '520200', '盘县', '104.468369', '25.706966', '3', 'tr_0 tr_520000 tr_520200', '2');
INSERT INTO `areas` VALUES ('520300', '遵义市', '520000', '遵义', '106.937263', '27.706627', '2', 'tr_0 tr_520000', '9');
INSERT INTO `areas` VALUES ('520302', '红花岗区', '520300', '红花岗', '106.943787', '27.694395', '3', 'tr_0 tr_520000 tr_520300', '4');
INSERT INTO `areas` VALUES ('520303', '汇川区', '520300', '汇川', '106.937263', '27.706627', '3', 'tr_0 tr_520000 tr_520300', '5');
INSERT INTO `areas` VALUES ('520321', '遵义县', '520300', '遵义', '106.831665', '27.535288', '3', 'tr_0 tr_520000 tr_520300', '14');
INSERT INTO `areas` VALUES ('520322', '桐梓县', '520300', '桐梓', '106.826591', '28.131559', '3', 'tr_0 tr_520000 tr_520300', '9');
INSERT INTO `areas` VALUES ('520323', '绥阳县', '520300', '绥阳', '107.191025', '27.951342', '3', 'tr_0 tr_520000 tr_520300', '8');
INSERT INTO `areas` VALUES ('520324', '正安县', '520300', '正安', '107.441872', '28.550337', '3', 'tr_0 tr_520000 tr_520300', '13');
INSERT INTO `areas` VALUES ('520325', '道真仡佬族苗族自治县', '520300', '道真', '107.605339', '28.880089', '3', 'tr_0 tr_520000 tr_520300', '2');
INSERT INTO `areas` VALUES ('520326', '务川仡佬族苗族自治县', '520300', '务川', '107.887856', '28.521566', '3', 'tr_0 tr_520000 tr_520300', '10');
INSERT INTO `areas` VALUES ('520327', '凤冈县', '520300', '凤冈', '107.722023', '27.960857', '3', 'tr_0 tr_520000 tr_520300', '3');
INSERT INTO `areas` VALUES ('520328', '湄潭县', '520300', '湄潭', '107.485725', '27.765839', '3', 'tr_0 tr_520000 tr_520300', '6');
INSERT INTO `areas` VALUES ('520329', '余庆县', '520300', '余庆', '107.892563', '27.221552', '3', 'tr_0 tr_520000 tr_520300', '12');
INSERT INTO `areas` VALUES ('520330', '习水县', '520300', '习水', '106.200951', '28.327826', '3', 'tr_0 tr_520000 tr_520300', '11');
INSERT INTO `areas` VALUES ('520381', '赤水市', '520300', '赤水', '105.698112', '28.587057', '3', 'tr_0 tr_520000 tr_520300', '1');
INSERT INTO `areas` VALUES ('520382', '仁怀市', '520300', '仁怀', '106.412476', '27.803377', '3', 'tr_0 tr_520000 tr_520300', '7');
INSERT INTO `areas` VALUES ('520400', '安顺市', '520000', '安顺', '105.93219', '26.245544', '2', 'tr_0 tr_520000', '1');
INSERT INTO `areas` VALUES ('520402', '西秀区', '520400', '西秀', '105.946167', '26.248323', '3', 'tr_0 tr_520000 tr_520400', '4');
INSERT INTO `areas` VALUES ('520421', '平坝县', '520400', '平坝', '106.259941', '26.40608', '3', 'tr_0 tr_520000 tr_520400', '2');
INSERT INTO `areas` VALUES ('520422', '普定县', '520400', '普定', '105.745605', '26.305794', '3', 'tr_0 tr_520000 tr_520400', '3');
INSERT INTO `areas` VALUES ('520423', '镇宁布依族苗族自治县', '520400', '镇宁', '105.768654', '26.056095', '3', 'tr_0 tr_520000 tr_520400', '5');
INSERT INTO `areas` VALUES ('520424', '关岭布依族苗族自治县', '520400', '关岭', '105.618454', '25.944248', '3', 'tr_0 tr_520000 tr_520400', '1');
INSERT INTO `areas` VALUES ('520425', '紫云苗族布依族自治县', '520400', '紫云', '106.084518', '25.751568', '3', 'tr_0 tr_520000 tr_520400', '6');
INSERT INTO `areas` VALUES ('522200', '铜仁市', '520000', '铜仁', '109.191551', '27.718346', '2', 'tr_0 tr_520000', '8');
INSERT INTO `areas` VALUES ('522201', '碧江区', '522200', '碧江', '109.192116', '27.718744', '3', 'tr_0 tr_520000 tr_522200', '1');
INSERT INTO `areas` VALUES ('522222', '江口县', '522200', '江口', '108.848427', '27.691904', '3', 'tr_0 tr_520000 tr_522200', '3');
INSERT INTO `areas` VALUES ('522223', '玉屏侗族自治县', '522200', '玉屏', '108.917885', '27.238024', '3', 'tr_0 tr_520000 tr_522200', '10');
INSERT INTO `areas` VALUES ('522224', '石阡县', '522200', '石阡', '108.229851', '27.519386', '3', 'tr_0 tr_520000 tr_522200', '4');
INSERT INTO `areas` VALUES ('522225', '思南县', '522200', '思南', '108.255829', '27.941332', '3', 'tr_0 tr_520000 tr_522200', '5');
INSERT INTO `areas` VALUES ('522226', '印江土家族苗族自治县', '522200', '印江', '108.405518', '27.997976', '3', 'tr_0 tr_520000 tr_522200', '9');
INSERT INTO `areas` VALUES ('522227', '德江县', '522200', '德江', '108.117317', '28.260941', '3', 'tr_0 tr_520000 tr_522200', '2');
INSERT INTO `areas` VALUES ('522228', '沿河土家族自治县', '522200', '沿河', '108.495743', '28.560488', '3', 'tr_0 tr_520000 tr_522200', '8');
INSERT INTO `areas` VALUES ('522229', '松桃苗族自治县', '522200', '松桃', '109.202629', '28.165419', '3', 'tr_0 tr_520000 tr_522200', '6');
INSERT INTO `areas` VALUES ('522230', '万山区', '522200', '万山', '109.21199', '27.51903', '3', 'tr_0 tr_520000 tr_522200', '7');
INSERT INTO `areas` VALUES ('522300', '黔西南布依族苗族自治州', '520000', '黔西南', '104.897972', '25.08812', '2', 'tr_0 tr_520000', '7');
INSERT INTO `areas` VALUES ('522301', '兴义市', '522300', '兴义', '104.89798', '25.088598', '3', 'tr_0 tr_520000 tr_522300', '7');
INSERT INTO `areas` VALUES ('522322', '兴仁县', '522300', '兴仁', '105.19278', '25.431377', '3', 'tr_0 tr_520000 tr_522300', '6');
INSERT INTO `areas` VALUES ('522323', '普安县', '522300', '普安', '104.955345', '25.786404', '3', 'tr_0 tr_520000 tr_522300', '3');
INSERT INTO `areas` VALUES ('522324', '晴隆县', '522300', '晴隆', '105.218773', '25.832882', '3', 'tr_0 tr_520000 tr_522300', '4');
INSERT INTO `areas` VALUES ('522325', '贞丰县', '522300', '贞丰', '105.650131', '25.385752', '3', 'tr_0 tr_520000 tr_522300', '8');
INSERT INTO `areas` VALUES ('522326', '望谟县', '522300', '望谟', '106.09156', '25.166668', '3', 'tr_0 tr_520000 tr_522300', '5');
INSERT INTO `areas` VALUES ('522327', '册亨县', '522300', '册亨', '105.812408', '24.983337', '3', 'tr_0 tr_520000 tr_522300', '2');
INSERT INTO `areas` VALUES ('522328', '安龙县', '522300', '安龙', '105.471497', '25.108959', '3', 'tr_0 tr_520000 tr_522300', '1');
INSERT INTO `areas` VALUES ('522400', '毕节市', '520000', '毕节', '105.285011', '27.301693', '2', 'tr_0 tr_520000', '2');
INSERT INTO `areas` VALUES ('522401', '七星关区', '522400', '七星关', '105.284851', '27.302086', '3', 'tr_0 tr_520000 tr_522400', '6');
INSERT INTO `areas` VALUES ('522422', '大方县', '522400', '大方', '105.609253', '27.14352', '3', 'tr_0 tr_520000 tr_522400', '1');
INSERT INTO `areas` VALUES ('522423', '黔西县', '522400', '黔西', '106.0383', '27.024923', '3', 'tr_0 tr_520000 tr_522400', '5');
INSERT INTO `areas` VALUES ('522424', '金沙县', '522400', '金沙', '106.222099', '27.459694', '3', 'tr_0 tr_520000 tr_522400', '3');
INSERT INTO `areas` VALUES ('522425', '织金县', '522400', '织金', '105.768997', '26.668497', '3', 'tr_0 tr_520000 tr_522400', '8');
INSERT INTO `areas` VALUES ('522426', '纳雍县', '522400', '纳雍', '105.37532', '26.769875', '3', 'tr_0 tr_520000 tr_522400', '4');
INSERT INTO `areas` VALUES ('522427', '威宁彝族回族苗族自治县', '522400', '威宁', '104.286522', '26.859098', '3', 'tr_0 tr_520000 tr_522400', '7');
INSERT INTO `areas` VALUES ('522428', '赫章县', '522400', '赫章', '104.72644', '27.119244', '3', 'tr_0 tr_520000 tr_522400', '2');
INSERT INTO `areas` VALUES ('522600', '黔东南苗族侗族自治州', '520000', '黔东南', '107.977486', '26.583351', '2', 'tr_0 tr_520000', '5');
INSERT INTO `areas` VALUES ('522601', '凯里市', '522600', '凯里', '107.977539', '26.582964', '3', 'tr_0 tr_520000 tr_522600', '7');
INSERT INTO `areas` VALUES ('522622', '黄平县', '522600', '黄平', '107.901337', '26.896973', '3', 'tr_0 tr_520000 tr_522600', '4');
INSERT INTO `areas` VALUES ('522623', '施秉县', '522600', '施秉', '108.126778', '27.034657', '3', 'tr_0 tr_520000 tr_522600', '13');
INSERT INTO `areas` VALUES ('522624', '三穗县', '522600', '三穗', '108.681122', '26.959885', '3', 'tr_0 tr_520000 tr_522600', '12');
INSERT INTO `areas` VALUES ('522625', '镇远县', '522600', '镇远', '108.423653', '27.050234', '3', 'tr_0 tr_520000 tr_522600', '16');
INSERT INTO `areas` VALUES ('522626', '岑巩县', '522600', '岑巩', '108.81646', '27.173244', '3', 'tr_0 tr_520000 tr_522600', '1');
INSERT INTO `areas` VALUES ('522627', '天柱县', '522600', '天柱', '109.212799', '26.909683', '3', 'tr_0 tr_520000 tr_522600', '15');
INSERT INTO `areas` VALUES ('522628', '锦屏县', '522600', '锦屏', '109.202522', '26.680626', '3', 'tr_0 tr_520000 tr_522600', '6');
INSERT INTO `areas` VALUES ('522629', '剑河县', '522600', '剑河', '108.440498', '26.727348', '3', 'tr_0 tr_520000 tr_522600', '5');
INSERT INTO `areas` VALUES ('522630', '台江县', '522600', '台江', '108.314636', '26.669138', '3', 'tr_0 tr_520000 tr_522600', '14');
INSERT INTO `areas` VALUES ('522631', '黎平县', '522600', '黎平', '109.136505', '26.230637', '3', 'tr_0 tr_520000 tr_522600', '9');
INSERT INTO `areas` VALUES ('522632', '榕江县', '522600', '榕江', '108.521027', '25.931086', '3', 'tr_0 tr_520000 tr_522600', '11');
INSERT INTO `areas` VALUES ('522633', '从江县', '522600', '从江', '108.912651', '25.747059', '3', 'tr_0 tr_520000 tr_522600', '2');
INSERT INTO `areas` VALUES ('522634', '雷山县', '522600', '雷山', '108.079613', '26.381027', '3', 'tr_0 tr_520000 tr_522600', '8');
INSERT INTO `areas` VALUES ('522635', '麻江县', '522600', '麻江', '107.59317', '26.494802', '3', 'tr_0 tr_520000 tr_522600', '10');
INSERT INTO `areas` VALUES ('522636', '丹寨县', '522600', '丹寨', '107.794807', '26.199497', '3', 'tr_0 tr_520000 tr_522600', '3');
INSERT INTO `areas` VALUES ('522700', '黔南布依族苗族自治州', '520000', '黔南', '107.517159', '26.258219', '2', 'tr_0 tr_520000', '6');
INSERT INTO `areas` VALUES ('522701', '都匀市', '522700', '都匀', '107.517021', '26.258205', '3', 'tr_0 tr_520000 tr_522700', '3');
INSERT INTO `areas` VALUES ('522702', '福泉市', '522700', '福泉', '107.513512', '26.702509', '3', 'tr_0 tr_520000 tr_522700', '4');
INSERT INTO `areas` VALUES ('522722', '荔波县', '522700', '荔波', '107.883797', '25.412239', '3', 'tr_0 tr_520000 tr_522700', '7');
INSERT INTO `areas` VALUES ('522723', '贵定县', '522700', '贵定', '107.233589', '26.580807', '3', 'tr_0 tr_520000 tr_522700', '5');
INSERT INTO `areas` VALUES ('522725', '瓮安县', '522700', '瓮安', '107.478416', '27.066339', '3', 'tr_0 tr_520000 tr_522700', '12');
INSERT INTO `areas` VALUES ('522726', '独山县', '522700', '独山', '107.542755', '25.826283', '3', 'tr_0 tr_520000 tr_522700', '2');
INSERT INTO `areas` VALUES ('522727', '平塘县', '522700', '平塘', '107.324051', '25.831802', '3', 'tr_0 tr_520000 tr_522700', '10');
INSERT INTO `areas` VALUES ('522728', '罗甸县', '522700', '罗甸', '106.750008', '25.429893', '3', 'tr_0 tr_520000 tr_522700', '9');
INSERT INTO `areas` VALUES ('522729', '长顺县', '522700', '长顺', '106.447372', '26.022116', '3', 'tr_0 tr_520000 tr_522700', '1');
INSERT INTO `areas` VALUES ('522730', '龙里县', '522700', '龙里', '106.97773', '26.448809', '3', 'tr_0 tr_520000 tr_522700', '8');
INSERT INTO `areas` VALUES ('522731', '惠水县', '522700', '惠水', '106.657845', '26.128637', '3', 'tr_0 tr_520000 tr_522700', '6');
INSERT INTO `areas` VALUES ('522732', '三都水族自治县', '522700', '三都', '107.877472', '25.985184', '3', 'tr_0 tr_520000 tr_522700', '11');
INSERT INTO `areas` VALUES ('530000', '云南省', '1', '云南', '102.71225', '25.040609', '1', 'tr_0', '25');
INSERT INTO `areas` VALUES ('530100', '昆明市', '530000', '昆明', '102.71225', '25.040609', '2', 'tr_0 tr_530000', '7');
INSERT INTO `areas` VALUES ('530102', '五华区', '530100', '五华', '102.704414', '25.042166', '3', 'tr_0 tr_530000 tr_530100', '11');
INSERT INTO `areas` VALUES ('530103', '盘龙区', '530100', '盘龙', '102.729042', '25.070238', '3', 'tr_0 tr_530000 tr_530100', '8');
INSERT INTO `areas` VALUES ('530111', '官渡区', '530100', '官渡', '102.723434', '25.021212', '3', 'tr_0 tr_530000 tr_530100', '5');
INSERT INTO `areas` VALUES ('530112', '西山区', '530100', '西山', '102.705902', '25.024361', '3', 'tr_0 tr_530000 tr_530100', '12');
INSERT INTO `areas` VALUES ('530113', '东川区', '530100', '东川', '103.181999', '26.08349', '3', 'tr_0 tr_530000 tr_530100', '3');
INSERT INTO `areas` VALUES ('530121', '呈贡区', '530100', '呈贡', '102.801384', '24.889275', '3', 'tr_0 tr_530000 tr_530100', '2');
INSERT INTO `areas` VALUES ('530122', '晋宁县', '530100', '晋宁', '102.594986', '24.666945', '3', 'tr_0 tr_530000 tr_530100', '6');
INSERT INTO `areas` VALUES ('530124', '富民县', '530100', '富民', '102.497887', '25.219667', '3', 'tr_0 tr_530000 tr_530100', '4');
INSERT INTO `areas` VALUES ('530125', '宜良县', '530100', '宜良', '103.145988', '24.918215', '3', 'tr_0 tr_530000 tr_530100', '14');
INSERT INTO `areas` VALUES ('530126', '石林彝族自治县', '530100', '石林', '103.271965', '24.754545', '3', 'tr_0 tr_530000 tr_530100', '9');
INSERT INTO `areas` VALUES ('530127', '嵩明县', '530100', '嵩明', '103.03878', '25.335087', '3', 'tr_0 tr_530000 tr_530100', '10');
INSERT INTO `areas` VALUES ('530128', '禄劝彝族苗族自治县', '530100', '禄劝', '102.469048', '25.556534', '3', 'tr_0 tr_530000 tr_530100', '7');
INSERT INTO `areas` VALUES ('530129', '寻甸回族彝族自治县', '530100', '寻甸', '103.257591', '25.559475', '3', 'tr_0 tr_530000 tr_530100', '13');
INSERT INTO `areas` VALUES ('530181', '安宁市', '530100', '安宁', '102.485542', '24.921785', '3', 'tr_0 tr_530000 tr_530100', '1');
INSERT INTO `areas` VALUES ('530300', '曲靖市', '530000', '曲靖', '103.797852', '25.501556', '2', 'tr_0 tr_530000', '12');
INSERT INTO `areas` VALUES ('530302', '麒麟区', '530300', '麒麟', '103.798058', '25.501268', '3', 'tr_0 tr_530000 tr_530300', '6');
INSERT INTO `areas` VALUES ('530321', '马龙县', '530300', '马龙', '103.578758', '25.429451', '3', 'tr_0 tr_530000 tr_530300', '5');
INSERT INTO `areas` VALUES ('530322', '陆良县', '530300', '陆良', '103.655235', '25.022879', '3', 'tr_0 tr_530000 tr_530300', '3');
INSERT INTO `areas` VALUES ('530323', '师宗县', '530300', '师宗', '103.993805', '24.825682', '3', 'tr_0 tr_530000 tr_530300', '7');
INSERT INTO `areas` VALUES ('530324', '罗平县', '530300', '罗平', '104.309265', '24.885708', '3', 'tr_0 tr_530000 tr_530300', '4');
INSERT INTO `areas` VALUES ('530325', '富源县', '530300', '富源', '104.25692', '25.670641', '3', 'tr_0 tr_530000 tr_530300', '1');
INSERT INTO `areas` VALUES ('530326', '会泽县', '530300', '会泽', '103.300041', '26.412861', '3', 'tr_0 tr_530000 tr_530300', '2');
INSERT INTO `areas` VALUES ('530328', '沾益县', '530300', '沾益', '103.81926', '25.600878', '3', 'tr_0 tr_530000 tr_530300', '9');
INSERT INTO `areas` VALUES ('530381', '宣威市', '530300', '宣威', '104.095543', '26.227777', '3', 'tr_0 tr_530000 tr_530300', '8');
INSERT INTO `areas` VALUES ('530400', '玉溪市', '530000', '玉溪', '102.543907', '24.35046', '2', 'tr_0 tr_530000', '15');
INSERT INTO `areas` VALUES ('530402', '红塔区', '530400', '红塔', '102.543465', '24.350754', '3', 'tr_0 tr_530000 tr_530400', '3');
INSERT INTO `areas` VALUES ('530421', '江川县', '530400', '江川', '102.74984', '24.291006', '3', 'tr_0 tr_530000 tr_530400', '5');
INSERT INTO `areas` VALUES ('530422', '澄江县', '530400', '澄江', '102.916649', '24.66968', '3', 'tr_0 tr_530000 tr_530400', '1');
INSERT INTO `areas` VALUES ('530423', '通海县', '530400', '通海', '102.76004', '24.112206', '3', 'tr_0 tr_530000 tr_530400', '6');
INSERT INTO `areas` VALUES ('530424', '华宁县', '530400', '华宁', '102.928986', '24.189808', '3', 'tr_0 tr_530000 tr_530400', '4');
INSERT INTO `areas` VALUES ('530425', '易门县', '530400', '易门', '102.162109', '24.669598', '3', 'tr_0 tr_530000 tr_530400', '8');
INSERT INTO `areas` VALUES ('530426', '峨山彝族自治县', '530400', '峨山', '102.404358', '24.173256', '3', 'tr_0 tr_530000 tr_530400', '2');
INSERT INTO `areas` VALUES ('530427', '新平彝族傣族自治县', '530400', '新平', '101.990906', '24.066401', '3', 'tr_0 tr_530000 tr_530400', '7');
INSERT INTO `areas` VALUES ('530428', '元江哈尼族彝族傣族自治县', '530400', '元江', '101.999657', '23.597618', '3', 'tr_0 tr_530000 tr_530400', '9');
INSERT INTO `areas` VALUES ('530500', '保山市', '530000', '保山', '99.16713', '25.111801', '2', 'tr_0 tr_530000', '1');
INSERT INTO `areas` VALUES ('530502', '隆阳区', '530500', '隆阳', '99.165825', '25.112144', '3', 'tr_0 tr_530000 tr_530500', '3');
INSERT INTO `areas` VALUES ('530521', '施甸县', '530500', '施甸', '99.183762', '24.730846', '3', 'tr_0 tr_530000 tr_530500', '4');
INSERT INTO `areas` VALUES ('530522', '腾冲县', '530500', '腾冲', '98.497292', '25.01757', '3', 'tr_0 tr_530000 tr_530500', '5');
INSERT INTO `areas` VALUES ('530523', '龙陵县', '530500', '龙陵', '98.693565', '24.591911', '3', 'tr_0 tr_530000 tr_530500', '2');
INSERT INTO `areas` VALUES ('530524', '昌宁县', '530500', '昌宁', '99.612343', '24.823662', '3', 'tr_0 tr_530000 tr_530500', '1');
INSERT INTO `areas` VALUES ('530600', '昭通市', '530000', '昭通', '103.717216', '27.337', '2', 'tr_0 tr_530000', '16');
INSERT INTO `areas` VALUES ('530602', '昭阳区', '530600', '昭阳', '103.71727', '27.336636', '3', 'tr_0 tr_530000 tr_530600', '10');
INSERT INTO `areas` VALUES ('530621', '鲁甸县', '530600', '鲁甸', '103.549332', '27.191637', '3', 'tr_0 tr_530000 tr_530600', '2');
INSERT INTO `areas` VALUES ('530622', '巧家县', '530600', '巧家', '102.929283', '26.911699', '3', 'tr_0 tr_530000 tr_530600', '3');
INSERT INTO `areas` VALUES ('530623', '盐津县', '530600', '盐津', '104.235062', '28.106922', '3', 'tr_0 tr_530000 tr_530600', '7');
INSERT INTO `areas` VALUES ('530624', '大关县', '530600', '大关', '103.891609', '27.747114', '3', 'tr_0 tr_530000 tr_530600', '1');
INSERT INTO `areas` VALUES ('530625', '永善县', '530600', '永善', '103.637321', '28.231525', '3', 'tr_0 tr_530000 tr_530600', '9');
INSERT INTO `areas` VALUES ('530626', '绥江县', '530600', '绥江', '103.961098', '28.599953', '3', 'tr_0 tr_530000 tr_530600', '5');
INSERT INTO `areas` VALUES ('530627', '镇雄县', '530600', '镇雄', '104.873055', '27.436268', '3', 'tr_0 tr_530000 tr_530600', '11');
INSERT INTO `areas` VALUES ('530628', '彝良县', '530600', '彝良', '104.048492', '27.627424', '3', 'tr_0 tr_530000 tr_530600', '8');
INSERT INTO `areas` VALUES ('530629', '威信县', '530600', '威信', '105.048691', '27.843382', '3', 'tr_0 tr_530000 tr_530600', '6');
INSERT INTO `areas` VALUES ('530630', '水富县', '530600', '水富', '104.415375', '28.629688', '3', 'tr_0 tr_530000 tr_530600', '4');
INSERT INTO `areas` VALUES ('530700', '丽江市', '530000', '丽江', '100.233025', '26.872108', '2', 'tr_0 tr_530000', '8');
INSERT INTO `areas` VALUES ('530702', '古城区', '530700', '古城', '100.234413', '26.872229', '3', 'tr_0 tr_530000 tr_530700', '1');
INSERT INTO `areas` VALUES ('530721', '玉龙纳西族自治县', '530700', '玉龙', '100.238312', '26.830593', '3', 'tr_0 tr_530000 tr_530700', '5');
INSERT INTO `areas` VALUES ('530722', '永胜县', '530700', '永胜', '100.7509', '26.685623', '3', 'tr_0 tr_530000 tr_530700', '4');
INSERT INTO `areas` VALUES ('530723', '华坪县', '530700', '华坪', '101.267799', '26.628834', '3', 'tr_0 tr_530000 tr_530700', '2');
INSERT INTO `areas` VALUES ('530724', '宁蒗彝族自治县', '530700', '宁蒗', '100.852425', '27.281109', '3', 'tr_0 tr_530000 tr_530700', '3');
INSERT INTO `areas` VALUES ('530800', '普洱市', '530000', '普洱', '100.972343', '22.777321', '2', 'tr_0 tr_530000', '11');
INSERT INTO `areas` VALUES ('530802', '思茅区', '530800', '思茅', '100.973228', '22.776594', '3', 'tr_0 tr_530000 tr_530800', '8');
INSERT INTO `areas` VALUES ('530821', '宁洱哈尼族彝族自治县', '530800', '宁洱', '101.045242', '23.062508', '3', 'tr_0 tr_530000 tr_530800', '7');
INSERT INTO `areas` VALUES ('530822', '墨江哈尼族自治县', '530800', '墨江', '101.687607', '23.428165', '3', 'tr_0 tr_530000 tr_530800', '6');
INSERT INTO `areas` VALUES ('530823', '景东彝族自治县', '530800', '景东', '100.840012', '24.448523', '3', 'tr_0 tr_530000 tr_530800', '2');
INSERT INTO `areas` VALUES ('530824', '景谷傣族彝族自治县', '530800', '景谷', '100.701424', '23.500278', '3', 'tr_0 tr_530000 tr_530800', '3');
INSERT INTO `areas` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '530800', '镇沅', '101.108513', '24.005713', '3', 'tr_0 tr_530000 tr_530800', '10');
INSERT INTO `areas` VALUES ('530826', '江城哈尼族彝族自治县', '530800', '江城', '101.859146', '22.583361', '3', 'tr_0 tr_530000 tr_530800', '1');
INSERT INTO `areas` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '530800', '孟连', '99.585403', '22.325924', '3', 'tr_0 tr_530000 tr_530800', '5');
INSERT INTO `areas` VALUES ('530828', '澜沧拉祜族自治县', '530800', '澜沧', '99.931198', '22.553083', '3', 'tr_0 tr_530000 tr_530800', '4');
INSERT INTO `areas` VALUES ('530829', '西盟佤族自治县', '530800', '西盟', '99.594376', '22.644423', '3', 'tr_0 tr_530000 tr_530800', '9');
INSERT INTO `areas` VALUES ('530900', '临沧市', '530000', '临沧', '100.086967', '23.886566', '2', 'tr_0 tr_530000', '9');
INSERT INTO `areas` VALUES ('530902', '临翔区', '530900', '临翔', '100.086487', '23.886562', '3', 'tr_0 tr_530000 tr_530900', '4');
INSERT INTO `areas` VALUES ('530921', '凤庆县', '530900', '凤庆', '99.918709', '24.592737', '3', 'tr_0 tr_530000 tr_530900', '2');
INSERT INTO `areas` VALUES ('530922', '云县', '530900', '云县', '100.125633', '24.439026', '3', 'tr_0 tr_530000 tr_530900', '7');
INSERT INTO `areas` VALUES ('530923', '永德县', '530900', '永德', '99.253677', '24.028158', '3', 'tr_0 tr_530000 tr_530900', '6');
INSERT INTO `areas` VALUES ('530924', '镇康县', '530900', '镇康', '98.827431', '23.761415', '3', 'tr_0 tr_530000 tr_530900', '8');
INSERT INTO `areas` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '530900', '双江', '99.824417', '23.477476', '3', 'tr_0 tr_530000 tr_530900', '5');
INSERT INTO `areas` VALUES ('530926', '耿马傣族佤族自治县', '530900', '耿马', '99.402496', '23.534578', '3', 'tr_0 tr_530000 tr_530900', '3');
INSERT INTO `areas` VALUES ('530927', '沧源佤族自治县', '530900', '沧源', '99.247398', '23.146887', '3', 'tr_0 tr_530000 tr_530900', '1');
INSERT INTO `areas` VALUES ('532300', '楚雄彝族自治州', '530000', '楚雄', '101.546043', '25.041988', '2', 'tr_0 tr_530000', '2');
INSERT INTO `areas` VALUES ('532301', '楚雄市', '532300', '楚雄', '101.546143', '25.040913', '3', 'tr_0 tr_530000 tr_532300', '1');
INSERT INTO `areas` VALUES ('532322', '双柏县', '532300', '双柏', '101.638237', '24.685095', '3', 'tr_0 tr_530000 tr_532300', '6');
INSERT INTO `areas` VALUES ('532323', '牟定县', '532300', '牟定', '101.543045', '25.312111', '3', 'tr_0 tr_530000 tr_532300', '4');
INSERT INTO `areas` VALUES ('532324', '南华县', '532300', '南华', '101.274994', '25.192408', '3', 'tr_0 tr_530000 tr_532300', '5');
INSERT INTO `areas` VALUES ('532325', '姚安县', '532300', '姚安', '101.238396', '25.505404', '3', 'tr_0 tr_530000 tr_532300', '8');
INSERT INTO `areas` VALUES ('532326', '大姚县', '532300', '大姚', '101.323601', '25.722347', '3', 'tr_0 tr_530000 tr_532300', '2');
INSERT INTO `areas` VALUES ('532327', '永仁县', '532300', '永仁', '101.671173', '26.056316', '3', 'tr_0 tr_530000 tr_532300', '9');
INSERT INTO `areas` VALUES ('532328', '元谋县', '532300', '元谋', '101.870834', '25.703314', '3', 'tr_0 tr_530000 tr_532300', '10');
INSERT INTO `areas` VALUES ('532329', '武定县', '532300', '武定', '102.406784', '25.5301', '3', 'tr_0 tr_530000 tr_532300', '7');
INSERT INTO `areas` VALUES ('532331', '禄丰县', '532300', '禄丰', '102.075691', '25.14327', '3', 'tr_0 tr_530000 tr_532300', '3');
INSERT INTO `areas` VALUES ('532500', '红河哈尼族彝族自治州', '530000', '红河', '103.384186', '23.366776', '2', 'tr_0 tr_530000', '6');
INSERT INTO `areas` VALUES ('532501', '个旧市', '532500', '个旧', '103.154755', '23.360382', '3', 'tr_0 tr_530000 tr_532500', '1');
INSERT INTO `areas` VALUES ('532502', '开远市', '532500', '开远', '103.258682', '23.713833', '3', 'tr_0 tr_530000 tr_532500', '6');
INSERT INTO `areas` VALUES ('532522', '蒙自市', '532500', '蒙自', '103.385002', '23.366842', '3', 'tr_0 tr_530000 tr_532500', '9');
INSERT INTO `areas` VALUES ('532523', '屏边苗族自治县', '532500', '屏边', '103.687225', '22.987013', '3', 'tr_0 tr_530000 tr_532500', '11');
INSERT INTO `areas` VALUES ('532524', '建水县', '532500', '建水', '102.820496', '23.618387', '3', 'tr_0 tr_530000 tr_532500', '4');
INSERT INTO `areas` VALUES ('532525', '石屏县', '532500', '石屏', '102.484467', '23.712568', '3', 'tr_0 tr_530000 tr_532500', '12');
INSERT INTO `areas` VALUES ('532526', '弥勒市', '532500', '弥勒', '103.436989', '24.408369', '3', 'tr_0 tr_530000 tr_532500', '10');
INSERT INTO `areas` VALUES ('532527', '泸西县', '532500', '泸西', '103.759621', '24.532368', '3', 'tr_0 tr_530000 tr_532500', '7');
INSERT INTO `areas` VALUES ('532528', '元阳县', '532500', '元阳', '102.837059', '23.219772', '3', 'tr_0 tr_530000 tr_532500', '13');
INSERT INTO `areas` VALUES ('532529', '红河县', '532500', '红河', '102.421211', '23.36919', '3', 'tr_0 tr_530000 tr_532500', '3');
INSERT INTO `areas` VALUES ('532530', '金平苗族瑶族傣族自治县', '532500', '金平', '103.228355', '22.779982', '3', 'tr_0 tr_530000 tr_532500', '5');
INSERT INTO `areas` VALUES ('532531', '绿春县', '532500', '绿春', '102.39286', '22.993521', '3', 'tr_0 tr_530000 tr_532500', '8');
INSERT INTO `areas` VALUES ('532532', '河口瑶族自治县', '532500', '河口', '103.961594', '22.507563', '3', 'tr_0 tr_530000 tr_532500', '2');
INSERT INTO `areas` VALUES ('532600', '文山壮族苗族自治州', '530000', '文山', '104.244011', '23.369511', '2', 'tr_0 tr_530000', '13');
INSERT INTO `areas` VALUES ('532621', '文山市', '532600', '文山', '104.244278', '23.369217', '3', 'tr_0 tr_530000 tr_532600', '6');
INSERT INTO `areas` VALUES ('532622', '砚山县', '532600', '砚山', '104.343987', '23.612301', '3', 'tr_0 tr_530000 tr_532600', '8');
INSERT INTO `areas` VALUES ('532623', '西畴县', '532600', '西畴', '104.675713', '23.437439', '3', 'tr_0 tr_530000 tr_532600', '7');
INSERT INTO `areas` VALUES ('532624', '麻栗坡县', '532600', '麻栗坡', '104.701897', '23.124203', '3', 'tr_0 tr_530000 tr_532600', '4');
INSERT INTO `areas` VALUES ('532625', '马关县', '532600', '马关', '104.398621', '23.011723', '3', 'tr_0 tr_530000 tr_532600', '3');
INSERT INTO `areas` VALUES ('532626', '丘北县', '532600', '丘北', '104.194366', '24.040981', '3', 'tr_0 tr_530000 tr_532600', '5');
INSERT INTO `areas` VALUES ('532627', '广南县', '532600', '广南', '105.056686', '24.050272', '3', 'tr_0 tr_530000 tr_532600', '2');
INSERT INTO `areas` VALUES ('532628', '富宁县', '532600', '富宁', '105.628563', '23.626493', '3', 'tr_0 tr_530000 tr_532600', '1');
INSERT INTO `areas` VALUES ('532800', '西双版纳傣族自治州', '530000', '西双版纳', '100.797943', '22.001724', '2', 'tr_0 tr_530000', '14');
INSERT INTO `areas` VALUES ('532801', '景洪市', '532800', '景洪', '100.797951', '22.002087', '3', 'tr_0 tr_530000 tr_532800', '1');
INSERT INTO `areas` VALUES ('532822', '勐海县', '532800', '勐海', '100.448288', '21.955866', '3', 'tr_0 tr_530000 tr_532800', '2');
INSERT INTO `areas` VALUES ('532823', '勐腊县', '532800', '勐腊', '101.567055', '21.479448', '3', 'tr_0 tr_530000 tr_532800', '3');
INSERT INTO `areas` VALUES ('532900', '大理白族自治州', '530000', '大理', '100.22567', '25.589449', '2', 'tr_0 tr_530000', '3');
INSERT INTO `areas` VALUES ('532901', '大理市', '532900', '大理', '100.241371', '25.593067', '3', 'tr_0 tr_530000 tr_532900', '2');
INSERT INTO `areas` VALUES ('532922', '漾濞彝族自治县', '532900', '漾濞', '99.95797', '25.669542', '3', 'tr_0 tr_530000 tr_532900', '10');
INSERT INTO `areas` VALUES ('532923', '祥云县', '532900', '祥云', '100.554024', '25.477072', '3', 'tr_0 tr_530000 tr_532900', '9');
INSERT INTO `areas` VALUES ('532924', '宾川县', '532900', '宾川', '100.578957', '25.825905', '3', 'tr_0 tr_530000 tr_532900', '1');
INSERT INTO `areas` VALUES ('532925', '弥渡县', '532900', '弥渡', '100.490669', '25.342594', '3', 'tr_0 tr_530000 tr_532900', '6');
INSERT INTO `areas` VALUES ('532926', '南涧彝族自治县', '532900', '南涧', '100.518684', '25.041279', '3', 'tr_0 tr_530000 tr_532900', '7');
INSERT INTO `areas` VALUES ('532927', '巍山彝族回族自治县', '532900', '巍山', '100.30793', '25.230909', '3', 'tr_0 tr_530000 tr_532900', '8');
INSERT INTO `areas` VALUES ('532928', '永平县', '532900', '永平', '99.533539', '25.461281', '3', 'tr_0 tr_530000 tr_532900', '11');
INSERT INTO `areas` VALUES ('532929', '云龙县', '532900', '云龙', '99.3694', '25.884954', '3', 'tr_0 tr_530000 tr_532900', '12');
INSERT INTO `areas` VALUES ('532930', '洱源县', '532900', '洱源', '99.951706', '26.111183', '3', 'tr_0 tr_530000 tr_532900', '3');
INSERT INTO `areas` VALUES ('532931', '剑川县', '532900', '剑川', '99.905884', '26.530066', '3', 'tr_0 tr_530000 tr_532900', '5');
INSERT INTO `areas` VALUES ('532932', '鹤庆县', '532900', '鹤庆', '100.173378', '26.55839', '3', 'tr_0 tr_530000 tr_532900', '4');
INSERT INTO `areas` VALUES ('533100', '德宏傣族景颇族自治州', '530000', '德宏', '98.578362', '24.436693', '2', 'tr_0 tr_530000', '4');
INSERT INTO `areas` VALUES ('533102', '瑞丽市', '533100', '瑞丽', '97.855881', '24.010735', '3', 'tr_0 tr_530000 tr_533100', '4');
INSERT INTO `areas` VALUES ('533103', '芒市', '533100', '芒市', '98.577606', '24.436699', '3', 'tr_0 tr_530000 tr_533100', '3');
INSERT INTO `areas` VALUES ('533122', '梁河县', '533100', '梁河', '98.298195', '24.807421', '3', 'tr_0 tr_530000 tr_533100', '1');
INSERT INTO `areas` VALUES ('533123', '盈江县', '533100', '盈江', '97.933929', '24.709541', '3', 'tr_0 tr_530000 tr_533100', '5');
INSERT INTO `areas` VALUES ('533124', '陇川县', '533100', '陇川', '97.794441', '24.184065', '3', 'tr_0 tr_530000 tr_533100', '2');
INSERT INTO `areas` VALUES ('533300', '怒江傈僳族自治州', '530000', '怒江', '98.854301', '25.850948', '2', 'tr_0 tr_530000', '10');
INSERT INTO `areas` VALUES ('533321', '泸水县', '533300', '泸水', '98.854065', '25.851143', '3', 'tr_0 tr_530000 tr_533300', '4');
INSERT INTO `areas` VALUES ('533323', '福贡县', '533300', '福贡', '98.867416', '26.902739', '3', 'tr_0 tr_530000 tr_533300', '1');
INSERT INTO `areas` VALUES ('533324', '贡山独龙族怒族自治县', '533300', '贡山', '98.666138', '27.738054', '3', 'tr_0 tr_530000 tr_533300', '2');
INSERT INTO `areas` VALUES ('533325', '兰坪白族普米族自治县', '533300', '兰坪', '99.421379', '26.453838', '3', 'tr_0 tr_530000 tr_533300', '3');
INSERT INTO `areas` VALUES ('533400', '迪庆藏族自治州', '530000', '迪庆', '99.706467', '27.826853', '2', 'tr_0 tr_530000', '5');
INSERT INTO `areas` VALUES ('533421', '香格里拉县', '533400', '香格里拉', '99.708664', '27.825804', '3', 'tr_0 tr_530000 tr_533400', '3');
INSERT INTO `areas` VALUES ('533422', '德钦县', '533400', '德钦', '98.915062', '28.483273', '3', 'tr_0 tr_530000 tr_533400', '1');
INSERT INTO `areas` VALUES ('533423', '维西傈僳族自治县', '533400', '维西', '99.286354', '27.180948', '3', 'tr_0 tr_530000 tr_533400', '2');
INSERT INTO `areas` VALUES ('540000', '西藏自治区', '1', '西藏', '91.13221', '29.66036', '1', 'tr_0', '26');
INSERT INTO `areas` VALUES ('540100', '拉萨市', '540000', '拉萨', '91.13221', '29.66036', '2', 'tr_0 tr_540000', '3');
INSERT INTO `areas` VALUES ('540102', '城关区', '540100', '城关', '91.132912', '29.659472', '3', 'tr_0 tr_540000 tr_540100', '1');
INSERT INTO `areas` VALUES ('540121', '林周县', '540100', '林周', '91.261841', '29.895754', '3', 'tr_0 tr_540000 tr_540100', '5');
INSERT INTO `areas` VALUES ('540122', '当雄县', '540100', '当雄', '91.103554', '30.474819', '3', 'tr_0 tr_540000 tr_540100', '2');
INSERT INTO `areas` VALUES ('540123', '尼木县', '540100', '尼木', '90.165543', '29.431347', '3', 'tr_0 tr_540000 tr_540100', '7');
INSERT INTO `areas` VALUES ('540124', '曲水县', '540100', '曲水', '90.738052', '29.349895', '3', 'tr_0 tr_540000 tr_540100', '8');
INSERT INTO `areas` VALUES ('540125', '堆龙德庆县', '540100', '堆龙德庆', '91.002823', '29.647346', '3', 'tr_0 tr_540000 tr_540100', '4');
INSERT INTO `areas` VALUES ('540126', '达孜县', '540100', '达孜', '91.350975', '29.670315', '3', 'tr_0 tr_540000 tr_540100', '3');
INSERT INTO `areas` VALUES ('540127', '墨竹工卡县', '540100', '墨竹工卡', '91.731155', '29.834658', '3', 'tr_0 tr_540000 tr_540100', '6');
INSERT INTO `areas` VALUES ('542100', '昌都地区', '540000', '昌都', '97.178452', '31.136875', '2', 'tr_0 tr_540000', '2');
INSERT INTO `areas` VALUES ('542121', '昌都县', '542100', '昌都', '97.178253', '31.137035', '3', 'tr_0 tr_540000 tr_542100', '3');
INSERT INTO `areas` VALUES ('542122', '江达县', '542100', '江达', '98.218353', '31.499535', '3', 'tr_0 tr_540000 tr_542100', '7');
INSERT INTO `areas` VALUES ('542123', '贡觉县', '542100', '贡觉', '98.271194', '30.859205', '3', 'tr_0 tr_540000 tr_542100', '6');
INSERT INTO `areas` VALUES ('542124', '类乌齐县', '542100', '类乌齐', '96.601257', '31.213049', '3', 'tr_0 tr_540000 tr_542100', '8');
INSERT INTO `areas` VALUES ('542125', '丁青县', '542100', '丁青', '95.597748', '31.410681', '3', 'tr_0 tr_540000 tr_542100', '5');
INSERT INTO `areas` VALUES ('542126', '察雅县', '542100', '察雅', '97.565704', '30.653038', '3', 'tr_0 tr_540000 tr_542100', '4');
INSERT INTO `areas` VALUES ('542127', '八宿县', '542100', '八宿', '96.917892', '30.053408', '3', 'tr_0 tr_540000 tr_542100', '1');
INSERT INTO `areas` VALUES ('542128', '左贡县', '542100', '左贡', '97.84053', '29.671335', '3', 'tr_0 tr_540000 tr_542100', '11');
INSERT INTO `areas` VALUES ('542129', '芒康县', '542100', '芒康', '98.596443', '29.686615', '3', 'tr_0 tr_540000 tr_542100', '10');
INSERT INTO `areas` VALUES ('542132', '洛隆县', '542100', '洛隆', '95.823418', '30.741947', '3', 'tr_0 tr_540000 tr_542100', '9');
INSERT INTO `areas` VALUES ('542133', '边坝县', '542100', '边坝', '94.707504', '30.933849', '3', 'tr_0 tr_540000 tr_542100', '2');
INSERT INTO `areas` VALUES ('542200', '山南地区', '540000', '山南', '91.766525', '29.236023', '2', 'tr_0 tr_540000', '7');
INSERT INTO `areas` VALUES ('542221', '乃东县', '542200', '乃东', '91.765251', '29.236107', '3', 'tr_0 tr_540000 tr_542200', '8');
INSERT INTO `areas` VALUES ('542222', '扎囊县', '542200', '扎囊', '91.337997', '29.246475', '3', 'tr_0 tr_540000 tr_542200', '12');
INSERT INTO `areas` VALUES ('542223', '贡嘎县', '542200', '贡嘎', '90.985268', '29.289078', '3', 'tr_0 tr_540000 tr_542200', '3');
INSERT INTO `areas` VALUES ('542224', '桑日县', '542200', '桑日', '92.015732', '29.259773', '3', 'tr_0 tr_540000 tr_542200', '11');
INSERT INTO `areas` VALUES ('542225', '琼结县', '542200', '琼结', '91.683754', '29.025242', '3', 'tr_0 tr_540000 tr_542200', '9');
INSERT INTO `areas` VALUES ('542226', '曲松县', '542200', '曲松', '92.201065', '29.063656', '3', 'tr_0 tr_540000 tr_542200', '10');
INSERT INTO `areas` VALUES ('542227', '措美县', '542200', '措美', '91.43235', '28.437353', '3', 'tr_0 tr_540000 tr_542200', '1');
INSERT INTO `areas` VALUES ('542228', '洛扎县', '542200', '洛扎', '90.858246', '28.385765', '3', 'tr_0 tr_540000 tr_542200', '7');
INSERT INTO `areas` VALUES ('542229', '加查县', '542200', '加查', '92.591042', '29.140921', '3', 'tr_0 tr_540000 tr_542200', '4');
INSERT INTO `areas` VALUES ('542231', '隆子县', '542200', '隆子', '92.46331', '28.408548', '3', 'tr_0 tr_540000 tr_542200', '6');
INSERT INTO `areas` VALUES ('542232', '错那县', '542200', '错那', '91.960129', '27.991707', '3', 'tr_0 tr_540000 tr_542200', '2');
INSERT INTO `areas` VALUES ('542233', '浪卡子县', '542200', '浪卡子', '90.39875', '28.968361', '3', 'tr_0 tr_540000 tr_542200', '5');
INSERT INTO `areas` VALUES ('542300', '日喀则地区', '540000', '日喀则', '88.885147', '29.267519', '2', 'tr_0 tr_540000', '6');
INSERT INTO `areas` VALUES ('542301', '日喀则市', '542300', '日喀则', '88.886673', '29.267002', '3', 'tr_0 tr_540000 tr_542300', '13');
INSERT INTO `areas` VALUES ('542322', '南木林县', '542300', '南木林', '89.099434', '29.680458', '3', 'tr_0 tr_540000 tr_542300', '10');
INSERT INTO `areas` VALUES ('542323', '江孜县', '542300', '江孜', '89.605042', '28.908846', '3', 'tr_0 tr_540000 tr_542300', '6');
INSERT INTO `areas` VALUES ('542324', '定日县', '542300', '定日', '87.123886', '28.656668', '3', 'tr_0 tr_540000 tr_542300', '4');
INSERT INTO `areas` VALUES ('542325', '萨迦县', '542300', '萨迦', '88.02301', '28.901077', '3', 'tr_0 tr_540000 tr_542300', '15');
INSERT INTO `areas` VALUES ('542326', '拉孜县', '542300', '拉孜', '87.637428', '29.085136', '3', 'tr_0 tr_540000 tr_542300', '9');
INSERT INTO `areas` VALUES ('542327', '昂仁县', '542300', '昂仁', '87.235779', '29.294758', '3', 'tr_0 tr_540000 tr_542300', '1');
INSERT INTO `areas` VALUES ('542328', '谢通门县', '542300', '谢通门', '88.260513', '29.431597', '3', 'tr_0 tr_540000 tr_542300', '16');
INSERT INTO `areas` VALUES ('542329', '白朗县', '542300', '白朗', '89.263618', '29.106627', '3', 'tr_0 tr_540000 tr_542300', '2');
INSERT INTO `areas` VALUES ('542330', '仁布县', '542300', '仁布', '89.843208', '29.230299', '3', 'tr_0 tr_540000 tr_542300', '12');
INSERT INTO `areas` VALUES ('542331', '康马县', '542300', '康马', '89.683403', '28.55472', '3', 'tr_0 tr_540000 tr_542300', '8');
INSERT INTO `areas` VALUES ('542332', '定结县', '542300', '定结', '87.767723', '28.36409', '3', 'tr_0 tr_540000 tr_542300', '3');
INSERT INTO `areas` VALUES ('542333', '仲巴县', '542300', '仲巴', '84.032829', '29.768335', '3', 'tr_0 tr_540000 tr_542300', '18');
INSERT INTO `areas` VALUES ('542334', '亚东县', '542300', '亚东', '88.906807', '27.482773', '3', 'tr_0 tr_540000 tr_542300', '17');
INSERT INTO `areas` VALUES ('542335', '吉隆县', '542300', '吉隆', '85.298347', '28.852415', '3', 'tr_0 tr_540000 tr_542300', '7');
INSERT INTO `areas` VALUES ('542336', '聂拉木县', '542300', '聂拉木', '85.981956', '28.155951', '3', 'tr_0 tr_540000 tr_542300', '11');
INSERT INTO `areas` VALUES ('542337', '萨嘎县', '542300', '萨嘎', '85.234619', '29.328194', '3', 'tr_0 tr_540000 tr_542300', '14');
INSERT INTO `areas` VALUES ('542338', '岗巴县', '542300', '岗巴', '88.518906', '28.27437', '3', 'tr_0 tr_540000 tr_542300', '5');
INSERT INTO `areas` VALUES ('542400', '那曲地区', '540000', '那曲', '92.060211', '31.476004', '2', 'tr_0 tr_540000', '5');
INSERT INTO `areas` VALUES ('542421', '那曲县', '542400', '那曲', '92.061859', '31.475756', '3', 'tr_0 tr_540000 tr_542400', '6');
INSERT INTO `areas` VALUES ('542422', '嘉黎县', '542400', '嘉黎', '93.23291', '30.640846', '3', 'tr_0 tr_540000 tr_542400', '5');
INSERT INTO `areas` VALUES ('542423', '比如县', '542400', '比如', '93.680443', '31.479918', '3', 'tr_0 tr_540000 tr_542400', '4');
INSERT INTO `areas` VALUES ('542424', '聂荣县', '542400', '聂荣', '92.303658', '32.107857', '3', 'tr_0 tr_540000 tr_542400', '7');
INSERT INTO `areas` VALUES ('542425', '安多县', '542400', '安多', '91.681877', '32.2603', '3', 'tr_0 tr_540000 tr_542400', '1');
INSERT INTO `areas` VALUES ('542426', '申扎县', '542400', '申扎', '88.709778', '30.929056', '3', 'tr_0 tr_540000 tr_542400', '9');
INSERT INTO `areas` VALUES ('542427', '索县', '542400', '索县', '93.784966', '31.886173', '3', 'tr_0 tr_540000 tr_542400', '11');
INSERT INTO `areas` VALUES ('542428', '班戈县', '542400', '班戈', '90.011826', '31.394579', '3', 'tr_0 tr_540000 tr_542400', '2');
INSERT INTO `areas` VALUES ('542429', '巴青县', '542400', '巴青', '94.054047', '31.918692', '3', 'tr_0 tr_540000 tr_542400', '3');
INSERT INTO `areas` VALUES ('542430', '尼玛县', '542400', '尼玛', '87.236649', '31.784979', '3', 'tr_0 tr_540000 tr_542400', '8');
INSERT INTO `areas` VALUES ('542432', '双湖县', '542400', '双湖', '88.838577', '33.186981', '3', 'tr_0 tr_540000 tr_542400', '10');
INSERT INTO `areas` VALUES ('542500', '阿里地区', '540000', '阿里', '80.105499', '32.503185', '2', 'tr_0 tr_540000', '1');
INSERT INTO `areas` VALUES ('542521', '普兰县', '542500', '普兰', '81.177589', '30.291897', '3', 'tr_0 tr_540000 tr_542500', '5');
INSERT INTO `areas` VALUES ('542522', '札达县', '542500', '札达', '79.803192', '31.478586', '3', 'tr_0 tr_540000 tr_542500', '7');
INSERT INTO `areas` VALUES ('542523', '噶尔县', '542500', '噶尔', '80.105003', '32.503372', '3', 'tr_0 tr_540000 tr_542500', '2');
INSERT INTO `areas` VALUES ('542524', '日土县', '542500', '日土', '79.731934', '33.382454', '3', 'tr_0 tr_540000 tr_542500', '6');
INSERT INTO `areas` VALUES ('542525', '革吉县', '542500', '革吉', '81.142899', '32.389191', '3', 'tr_0 tr_540000 tr_542500', '4');
INSERT INTO `areas` VALUES ('542526', '改则县', '542500', '改则', '84.062386', '32.302074', '3', 'tr_0 tr_540000 tr_542500', '3');
INSERT INTO `areas` VALUES ('542527', '措勤县', '542500', '措勤', '85.159256', '31.016773', '3', 'tr_0 tr_540000 tr_542500', '1');
INSERT INTO `areas` VALUES ('542600', '林芝地区', '540000', '林芝', '94.36235', '29.654694', '2', 'tr_0 tr_540000', '4');
INSERT INTO `areas` VALUES ('542621', '林芝县', '542600', '林芝', '94.360985', '29.653732', '3', 'tr_0 tr_540000 tr_542600', '5');
INSERT INTO `areas` VALUES ('542622', '工布江达县', '542600', '工布江达', '93.246513', '29.88447', '3', 'tr_0 tr_540000 tr_542600', '3');
INSERT INTO `areas` VALUES ('542623', '米林县', '542600', '米林', '94.213676', '29.213812', '3', 'tr_0 tr_540000 tr_542600', '6');
INSERT INTO `areas` VALUES ('542624', '墨脱县', '542600', '墨脱', '95.332245', '29.325729', '3', 'tr_0 tr_540000 tr_542600', '7');
INSERT INTO `areas` VALUES ('542625', '波密县', '542600', '波密', '95.76815', '29.85877', '3', 'tr_0 tr_540000 tr_542600', '1');
INSERT INTO `areas` VALUES ('542626', '察隅县', '542600', '察隅', '97.465004', '28.660244', '3', 'tr_0 tr_540000 tr_542600', '2');
INSERT INTO `areas` VALUES ('542627', '朗县', '542600', '朗县', '93.073425', '29.0446', '3', 'tr_0 tr_540000 tr_542600', '4');
INSERT INTO `areas` VALUES ('610000', '陕西省', '1', '陕西', '108.948021', '34.263161', '1', 'tr_0', '27');
INSERT INTO `areas` VALUES ('610100', '西安市', '610000', '西安', '108.948021', '34.263161', '2', 'tr_0 tr_610000', '7');
INSERT INTO `areas` VALUES ('610102', '新城区', '610100', '新城', '108.9599', '34.269272', '3', 'tr_0 tr_610000 tr_610100', '10');
INSERT INTO `areas` VALUES ('610103', '碑林区', '610100', '碑林', '108.946991', '34.25106', '3', 'tr_0 tr_610000 tr_610100', '2');
INSERT INTO `areas` VALUES ('610104', '莲湖区', '610100', '莲湖', '108.933197', '34.265598', '3', 'tr_0 tr_610000 tr_610100', '7');
INSERT INTO `areas` VALUES ('610111', '灞桥区', '610100', '灞桥', '109.067261', '34.267452', '3', 'tr_0 tr_610000 tr_610100', '1');
INSERT INTO `areas` VALUES ('610112', '未央区', '610100', '未央', '108.946022', '34.308231', '3', 'tr_0 tr_610000 tr_610100', '9');
INSERT INTO `areas` VALUES ('610113', '雁塔区', '610100', '雁塔', '108.92659', '34.21339', '3', 'tr_0 tr_610000 tr_610100', '12');
INSERT INTO `areas` VALUES ('610114', '阎良区', '610100', '阎良', '109.22802', '34.66214', '3', 'tr_0 tr_610000 tr_610100', '11');
INSERT INTO `areas` VALUES ('610115', '临潼区', '610100', '临潼', '109.213989', '34.372066', '3', 'tr_0 tr_610000 tr_610100', '8');
INSERT INTO `areas` VALUES ('610116', '长安区', '610100', '长安', '108.941582', '34.157097', '3', 'tr_0 tr_610000 tr_610100', '3');
INSERT INTO `areas` VALUES ('610122', '蓝田县', '610100', '蓝田', '109.317635', '34.156189', '3', 'tr_0 tr_610000 tr_610100', '6');
INSERT INTO `areas` VALUES ('610124', '周至县', '610100', '周至', '108.216469', '34.161533', '3', 'tr_0 tr_610000 tr_610100', '13');
INSERT INTO `areas` VALUES ('610125', '户县', '610100', '户县', '108.607384', '34.108669', '3', 'tr_0 tr_610000 tr_610100', '5');
INSERT INTO `areas` VALUES ('610126', '高陵县', '610100', '高陵', '109.088898', '34.535065', '3', 'tr_0 tr_610000 tr_610100', '4');
INSERT INTO `areas` VALUES ('610200', '铜川市', '610000', '铜川', '108.979607', '34.91658', '2', 'tr_0 tr_610000', '5');
INSERT INTO `areas` VALUES ('610202', '王益区', '610200', '王益', '109.075859', '35.069099', '3', 'tr_0 tr_610000 tr_610200', '1');
INSERT INTO `areas` VALUES ('610203', '印台区', '610200', '印台', '109.100815', '35.111927', '3', 'tr_0 tr_610000 tr_610200', '4');
INSERT INTO `areas` VALUES ('610204', '耀州区', '610200', '耀州', '108.96254', '34.910206', '3', 'tr_0 tr_610000 tr_610200', '2');
INSERT INTO `areas` VALUES ('610222', '宜君县', '610200', '宜君', '109.118279', '35.398766', '3', 'tr_0 tr_610000 tr_610200', '3');
INSERT INTO `areas` VALUES ('610300', '宝鸡市', '610000', '宝鸡', '107.144867', '34.369316', '2', 'tr_0 tr_610000', '2');
INSERT INTO `areas` VALUES ('610302', '渭滨区', '610300', '渭滨', '107.14447', '34.37101', '3', 'tr_0 tr_610000 tr_610300', '12');
INSERT INTO `areas` VALUES ('610303', '金台区', '610300', '金台', '107.14994', '34.375191', '3', 'tr_0 tr_610000 tr_610300', '5');
INSERT INTO `areas` VALUES ('610304', '陈仓区', '610300', '陈仓', '107.383644', '34.352749', '3', 'tr_0 tr_610000 tr_610300', '1');
INSERT INTO `areas` VALUES ('610322', '凤翔县', '610300', '凤翔', '107.400574', '34.521667', '3', 'tr_0 tr_610000 tr_610300', '3');
INSERT INTO `areas` VALUES ('610323', '岐山县', '610300', '岐山', '107.624466', '34.442959', '3', 'tr_0 tr_610000 tr_610300', '10');
INSERT INTO `areas` VALUES ('610324', '扶风县', '610300', '扶风', '107.891418', '34.375496', '3', 'tr_0 tr_610000 tr_610300', '4');
INSERT INTO `areas` VALUES ('610326', '眉县', '610300', '眉县', '107.752373', '34.272137', '3', 'tr_0 tr_610000 tr_610300', '8');
INSERT INTO `areas` VALUES ('610327', '陇县', '610300', '陇县', '106.857063', '34.893261', '3', 'tr_0 tr_610000 tr_610300', '7');
INSERT INTO `areas` VALUES ('610328', '千阳县', '610300', '千阳', '107.132988', '34.642586', '3', 'tr_0 tr_610000 tr_610300', '9');
INSERT INTO `areas` VALUES ('610329', '麟游县', '610300', '麟游', '107.796608', '34.677715', '3', 'tr_0 tr_610000 tr_610300', '6');
INSERT INTO `areas` VALUES ('610330', '凤县', '610300', '凤县', '106.525215', '33.912464', '3', 'tr_0 tr_610000 tr_610300', '2');
INSERT INTO `areas` VALUES ('610331', '太白县', '610300', '太白', '107.316536', '34.059216', '3', 'tr_0 tr_610000 tr_610300', '11');
INSERT INTO `areas` VALUES ('610400', '咸阳市', '610000', '咸阳', '108.705116', '34.333439', '2', 'tr_0 tr_610000', '8');
INSERT INTO `areas` VALUES ('610402', '秦都区', '610400', '秦都', '108.698639', '34.3298', '3', 'tr_0 tr_610000 tr_610400', '7');
INSERT INTO `areas` VALUES ('610403', '杨陵区', '610400', '杨陵', '108.086349', '34.271351', '3', 'tr_0 tr_610000 tr_610400', '13');
INSERT INTO `areas` VALUES ('610404', '渭城区', '610400', '渭城', '108.730957', '34.336845', '3', 'tr_0 tr_610000 tr_610400', '9');
INSERT INTO `areas` VALUES ('610422', '三原县', '610400', '三原', '108.943481', '34.613995', '3', 'tr_0 tr_610000 tr_610400', '8');
INSERT INTO `areas` VALUES ('610423', '泾阳县', '610400', '泾阳', '108.837837', '34.528492', '3', 'tr_0 tr_610000 tr_610400', '4');
INSERT INTO `areas` VALUES ('610424', '乾县', '610400', '乾县', '108.247406', '34.52726', '3', 'tr_0 tr_610000 tr_610400', '6');
INSERT INTO `areas` VALUES ('610425', '礼泉县', '610400', '礼泉', '108.428314', '34.482582', '3', 'tr_0 tr_610000 tr_610400', '5');
INSERT INTO `areas` VALUES ('610426', '永寿县', '610400', '永寿', '108.143127', '34.692619', '3', 'tr_0 tr_610000 tr_610400', '14');
INSERT INTO `areas` VALUES ('610427', '彬县', '610400', '彬县', '108.083672', '35.034233', '3', 'tr_0 tr_610000 tr_610400', '1');
INSERT INTO `areas` VALUES ('610428', '长武县', '610400', '长武', '107.795837', '35.206123', '3', 'tr_0 tr_610000 tr_610400', '2');
INSERT INTO `areas` VALUES ('610429', '旬邑县', '610400', '旬邑', '108.337234', '35.112232', '3', 'tr_0 tr_610000 tr_610400', '12');
INSERT INTO `areas` VALUES ('610430', '淳化县', '610400', '淳化', '108.581177', '34.79797', '3', 'tr_0 tr_610000 tr_610400', '3');
INSERT INTO `areas` VALUES ('610431', '武功县', '610400', '武功', '108.21286', '34.259731', '3', 'tr_0 tr_610000 tr_610400', '10');
INSERT INTO `areas` VALUES ('610481', '兴平市', '610400', '兴平', '108.488495', '34.297134', '3', 'tr_0 tr_610000 tr_610400', '11');
INSERT INTO `areas` VALUES ('610500', '渭南市', '610000', '渭南', '109.502884', '34.499382', '2', 'tr_0 tr_610000', '6');
INSERT INTO `areas` VALUES ('610502', '临渭区', '610500', '临渭', '109.503296', '34.50127', '3', 'tr_0 tr_610000 tr_610500', '9');
INSERT INTO `areas` VALUES ('610521', '华县', '610500', '华县', '109.761414', '34.511959', '3', 'tr_0 tr_610000 tr_610500', '7');
INSERT INTO `areas` VALUES ('610522', '潼关县', '610500', '潼关', '110.247261', '34.544514', '3', 'tr_0 tr_610000 tr_610500', '11');
INSERT INTO `areas` VALUES ('610523', '大荔县', '610500', '大荔', '109.943123', '34.79501', '3', 'tr_0 tr_610000 tr_610500', '3');
INSERT INTO `areas` VALUES ('610524', '合阳县', '610500', '合阳', '110.14798', '35.237099', '3', 'tr_0 tr_610000 tr_610500', '6');
INSERT INTO `areas` VALUES ('610525', '澄城县', '610500', '澄城', '109.937607', '35.183998', '3', 'tr_0 tr_610000 tr_610500', '2');
INSERT INTO `areas` VALUES ('610526', '蒲城县', '610500', '蒲城', '109.589653', '34.956036', '3', 'tr_0 tr_610000 tr_610500', '10');
INSERT INTO `areas` VALUES ('610527', '白水县', '610500', '白水', '109.594307', '35.177292', '3', 'tr_0 tr_610000 tr_610500', '1');
INSERT INTO `areas` VALUES ('610528', '富平县', '610500', '富平', '109.187172', '34.746677', '3', 'tr_0 tr_610000 tr_610500', '4');
INSERT INTO `areas` VALUES ('610581', '韩城市', '610500', '韩城', '110.452393', '35.475239', '3', 'tr_0 tr_610000 tr_610500', '5');
INSERT INTO `areas` VALUES ('610582', '华阴市', '610500', '华阴', '110.089523', '34.565357', '3', 'tr_0 tr_610000 tr_610500', '8');
INSERT INTO `areas` VALUES ('610600', '延安市', '610000', '延安', '109.490807', '36.596539', '2', 'tr_0 tr_610000', '9');
INSERT INTO `areas` VALUES ('610602', '宝塔区', '610600', '宝塔', '109.490692', '36.596291', '3', 'tr_0 tr_610000 tr_610600', '2');
INSERT INTO `areas` VALUES ('610621', '延长县', '610600', '延长', '110.012962', '36.578304', '3', 'tr_0 tr_610000 tr_610600', '9');
INSERT INTO `areas` VALUES ('610622', '延川县', '610600', '延川', '110.190315', '36.882065', '3', 'tr_0 tr_610000 tr_610600', '10');
INSERT INTO `areas` VALUES ('610623', '子长县', '610600', '子长', '109.675964', '37.142071', '3', 'tr_0 tr_610000 tr_610600', '13');
INSERT INTO `areas` VALUES ('610624', '安塞县', '610600', '安塞', '109.32534', '36.86441', '3', 'tr_0 tr_610000 tr_610600', '1');
INSERT INTO `areas` VALUES ('610625', '志丹县', '610600', '志丹', '108.768898', '36.823032', '3', 'tr_0 tr_610000 tr_610600', '12');
INSERT INTO `areas` VALUES ('610626', '吴起县', '610600', '吴起', '108.176979', '36.92485', '3', 'tr_0 tr_610000 tr_610600', '8');
INSERT INTO `areas` VALUES ('610627', '甘泉县', '610600', '甘泉', '109.349609', '36.277729', '3', 'tr_0 tr_610000 tr_610600', '4');
INSERT INTO `areas` VALUES ('610628', '富县', '610600', '富县', '109.384132', '35.996494', '3', 'tr_0 tr_610000 tr_610600', '3');
INSERT INTO `areas` VALUES ('610629', '洛川县', '610600', '洛川', '109.435715', '35.762135', '3', 'tr_0 tr_610000 tr_610600', '7');
INSERT INTO `areas` VALUES ('610630', '宜川县', '610600', '宜川', '110.175537', '36.050392', '3', 'tr_0 tr_610000 tr_610600', '11');
INSERT INTO `areas` VALUES ('610631', '黄龙县', '610600', '黄龙', '109.835022', '35.583275', '3', 'tr_0 tr_610000 tr_610600', '6');
INSERT INTO `areas` VALUES ('610632', '黄陵县', '610600', '黄陵', '109.262466', '35.580166', '3', 'tr_0 tr_610000 tr_610600', '5');
INSERT INTO `areas` VALUES ('610700', '汉中市', '610000', '汉中', '107.028618', '33.077667', '2', 'tr_0 tr_610000', '3');
INSERT INTO `areas` VALUES ('610702', '汉台区', '610700', '汉台', '107.028236', '33.077675', '3', 'tr_0 tr_610000 tr_610700', '3');
INSERT INTO `areas` VALUES ('610721', '南郑县', '610700', '南郑', '106.94239', '33.003342', '3', 'tr_0 tr_610000 tr_610700', '7');
INSERT INTO `areas` VALUES ('610722', '城固县', '610700', '城固', '107.329887', '33.153099', '3', 'tr_0 tr_610000 tr_610700', '1');
INSERT INTO `areas` VALUES ('610723', '洋县', '610700', '洋县', '107.549965', '33.223282', '3', 'tr_0 tr_610000 tr_610700', '10');
INSERT INTO `areas` VALUES ('610724', '西乡县', '610700', '西乡', '107.765862', '32.987961', '3', 'tr_0 tr_610000 tr_610700', '9');
INSERT INTO `areas` VALUES ('610725', '勉县', '610700', '勉县', '106.680176', '33.155617', '3', 'tr_0 tr_610000 tr_610700', '6');
INSERT INTO `areas` VALUES ('610726', '宁强县', '610700', '宁强', '106.257393', '32.830807', '3', 'tr_0 tr_610000 tr_610700', '8');
INSERT INTO `areas` VALUES ('610727', '略阳县', '610700', '略阳', '106.1539', '33.329639', '3', 'tr_0 tr_610000 tr_610700', '5');
INSERT INTO `areas` VALUES ('610728', '镇巴县', '610700', '镇巴', '107.895309', '32.535854', '3', 'tr_0 tr_610000 tr_610700', '11');
INSERT INTO `areas` VALUES ('610729', '留坝县', '610700', '留坝', '106.924377', '33.613338', '3', 'tr_0 tr_610000 tr_610700', '4');
INSERT INTO `areas` VALUES ('610730', '佛坪县', '610700', '佛坪', '107.988579', '33.520744', '3', 'tr_0 tr_610000 tr_610700', '2');
INSERT INTO `areas` VALUES ('610800', '榆林市', '610000', '榆林', '109.741196', '38.290161', '2', 'tr_0 tr_610000', '10');
INSERT INTO `areas` VALUES ('610802', '榆阳区', '610800', '榆阳', '109.74791', '38.299267', '3', 'tr_0 tr_610000 tr_610800', '11');
INSERT INTO `areas` VALUES ('610821', '神木县', '610800', '神木', '110.497002', '38.83564', '3', 'tr_0 tr_610000 tr_610800', '8');
INSERT INTO `areas` VALUES ('610822', '府谷县', '610800', '府谷', '111.069649', '39.029243', '3', 'tr_0 tr_610000 tr_610800', '2');
INSERT INTO `areas` VALUES ('610823', '横山县', '610800', '横山', '109.292595', '37.964046', '3', 'tr_0 tr_610000 tr_610800', '3');
INSERT INTO `areas` VALUES ('610824', '靖边县', '610800', '靖边', '108.805672', '37.596085', '3', 'tr_0 tr_610000 tr_610800', '5');
INSERT INTO `areas` VALUES ('610825', '定边县', '610800', '定边', '107.60128', '37.59523', '3', 'tr_0 tr_610000 tr_610800', '1');
INSERT INTO `areas` VALUES ('610826', '绥德县', '610800', '绥德', '110.265373', '37.507702', '3', 'tr_0 tr_610000 tr_610800', '9');
INSERT INTO `areas` VALUES ('610827', '米脂县', '610800', '米脂', '110.17868', '37.759083', '3', 'tr_0 tr_610000 tr_610800', '6');
INSERT INTO `areas` VALUES ('610828', '佳县', '610800', '佳县', '110.49337', '38.021599', '3', 'tr_0 tr_610000 tr_610800', '4');
INSERT INTO `areas` VALUES ('610829', '吴堡县', '610800', '吴堡', '110.739311', '37.451923', '3', 'tr_0 tr_610000 tr_610800', '10');
INSERT INTO `areas` VALUES ('610830', '清涧县', '610800', '清涧', '110.12146', '37.087704', '3', 'tr_0 tr_610000 tr_610800', '7');
INSERT INTO `areas` VALUES ('610831', '子洲县', '610800', '子洲', '110.034569', '37.611572', '3', 'tr_0 tr_610000 tr_610800', '12');
INSERT INTO `areas` VALUES ('610900', '安康市', '610000', '安康', '109.029274', '32.6903', '2', 'tr_0 tr_610000', '1');
INSERT INTO `areas` VALUES ('610902', '汉滨区', '610900', '汉滨', '109.029099', '32.690819', '3', 'tr_0 tr_610000 tr_610900', '2');
INSERT INTO `areas` VALUES ('610921', '汉阴县', '610900', '汉阴', '108.510948', '32.891121', '3', 'tr_0 tr_610000 tr_610900', '3');
INSERT INTO `areas` VALUES ('610922', '石泉县', '610900', '石泉', '108.250511', '33.038513', '3', 'tr_0 tr_610000 tr_610900', '7');
INSERT INTO `areas` VALUES ('610923', '宁陕县', '610900', '宁陕', '108.313713', '33.312183', '3', 'tr_0 tr_610000 tr_610900', '5');
INSERT INTO `areas` VALUES ('610924', '紫阳县', '610900', '紫阳', '108.537788', '32.520176', '3', 'tr_0 tr_610000 tr_610900', '10');
INSERT INTO `areas` VALUES ('610925', '岚皋县', '610900', '岚皋', '108.900665', '32.310692', '3', 'tr_0 tr_610000 tr_610900', '4');
INSERT INTO `areas` VALUES ('610926', '平利县', '610900', '平利', '109.361862', '32.387932', '3', 'tr_0 tr_610000 tr_610900', '6');
INSERT INTO `areas` VALUES ('610927', '镇坪县', '610900', '镇坪', '109.526436', '31.883394', '3', 'tr_0 tr_610000 tr_610900', '9');
INSERT INTO `areas` VALUES ('610928', '旬阳县', '610900', '旬阳', '109.368149', '32.833569', '3', 'tr_0 tr_610000 tr_610900', '8');
INSERT INTO `areas` VALUES ('610929', '白河县', '610900', '白河', '110.114189', '32.809483', '3', 'tr_0 tr_610000 tr_610900', '1');
INSERT INTO `areas` VALUES ('611000', '商洛市', '610000', '商洛', '109.939774', '33.86832', '2', 'tr_0 tr_610000', '4');
INSERT INTO `areas` VALUES ('611002', '商州区', '611000', '商州', '109.937683', '33.869209', '3', 'tr_0 tr_610000 tr_611000', '4');
INSERT INTO `areas` VALUES ('611021', '洛南县', '611000', '洛南', '110.145714', '34.088501', '3', 'tr_0 tr_610000 tr_611000', '2');
INSERT INTO `areas` VALUES ('611022', '丹凤县', '611000', '丹凤', '110.331909', '33.69471', '3', 'tr_0 tr_610000 tr_611000', '1');
INSERT INTO `areas` VALUES ('611023', '商南县', '611000', '商南', '110.885437', '33.526367', '3', 'tr_0 tr_610000 tr_611000', '3');
INSERT INTO `areas` VALUES ('611024', '山阳县', '611000', '山阳', '109.880432', '33.530411', '3', 'tr_0 tr_610000 tr_611000', '5');
INSERT INTO `areas` VALUES ('611025', '镇安县', '611000', '镇安', '109.151077', '33.423981', '3', 'tr_0 tr_610000 tr_611000', '7');
INSERT INTO `areas` VALUES ('611026', '柞水县', '611000', '柞水', '109.111252', '33.682774', '3', 'tr_0 tr_610000 tr_611000', '6');
INSERT INTO `areas` VALUES ('620000', '甘肃省', '1', '甘肃', '103.823555', '36.058041', '1', 'tr_0', '28');
INSERT INTO `areas` VALUES ('620100', '兰州市', '620000', '兰州', '103.823555', '36.058041', '2', 'tr_0 tr_620000', '7');
INSERT INTO `areas` VALUES ('620102', '城关区', '620100', '城关', '103.841034', '36.049114', '3', 'tr_0 tr_620000 tr_620100', '2');
INSERT INTO `areas` VALUES ('620103', '七里河区', '620100', '七里河', '103.784325', '36.06673', '3', 'tr_0 tr_620000 tr_620100', '5');
INSERT INTO `areas` VALUES ('620104', '西固区', '620100', '西固', '103.62233', '36.100368', '3', 'tr_0 tr_620000 tr_620100', '6');
INSERT INTO `areas` VALUES ('620105', '安宁区', '620100', '安宁', '103.724037', '36.103291', '3', 'tr_0 tr_620000 tr_620100', '1');
INSERT INTO `areas` VALUES ('620111', '红古区', '620100', '红古', '102.861816', '36.344177', '3', 'tr_0 tr_620000 tr_620100', '4');
INSERT INTO `areas` VALUES ('620121', '永登县', '620100', '永登', '103.262199', '36.734428', '3', 'tr_0 tr_620000 tr_620100', '7');
INSERT INTO `areas` VALUES ('620122', '皋兰县', '620100', '皋兰', '103.949333', '36.331253', '3', 'tr_0 tr_620000 tr_620100', '3');
INSERT INTO `areas` VALUES ('620123', '榆中县', '620100', '榆中', '104.114975', '35.844429', '3', 'tr_0 tr_620000 tr_620100', '8');
INSERT INTO `areas` VALUES ('620200', '嘉峪关市', '620000', '嘉峪关', '98.277306', '39.78653', '2', 'tr_0 tr_620000', '4');
INSERT INTO `areas` VALUES ('620300', '金昌市', '620000', '金昌', '102.187889', '38.514236', '2', 'tr_0 tr_620000', '5');
INSERT INTO `areas` VALUES ('620302', '金川区', '620300', '金川', '102.187683', '38.513794', '3', 'tr_0 tr_620000 tr_620300', '1');
INSERT INTO `areas` VALUES ('620321', '永昌县', '620300', '永昌', '101.971954', '38.247353', '3', 'tr_0 tr_620000 tr_620300', '2');
INSERT INTO `areas` VALUES ('620400', '白银市', '620000', '白银', '104.173607', '36.545681', '2', 'tr_0 tr_620000', '1');
INSERT INTO `areas` VALUES ('620402', '白银区', '620400', '白银', '104.174248', '36.54565', '3', 'tr_0 tr_620000 tr_620400', '1');
INSERT INTO `areas` VALUES ('620403', '平川区', '620400', '平川', '104.819206', '36.72921', '3', 'tr_0 tr_620000 tr_620400', '5');
INSERT INTO `areas` VALUES ('620421', '靖远县', '620400', '靖远', '104.686974', '36.561424', '3', 'tr_0 tr_620000 tr_620400', '4');
INSERT INTO `areas` VALUES ('620422', '会宁县', '620400', '会宁', '105.054337', '35.692486', '3', 'tr_0 tr_620000 tr_620400', '2');
INSERT INTO `areas` VALUES ('620423', '景泰县', '620400', '景泰', '104.066391', '37.19352', '3', 'tr_0 tr_620000 tr_620400', '3');
INSERT INTO `areas` VALUES ('620500', '天水市', '620000', '天水', '105.724998', '34.578529', '2', 'tr_0 tr_620000', '12');
INSERT INTO `areas` VALUES ('620502', '秦州区', '620500', '秦州', '105.72448', '34.578644', '3', 'tr_0 tr_620000 tr_620500', '5');
INSERT INTO `areas` VALUES ('620503', '麦积区', '620500', '麦积', '105.897629', '34.563503', '3', 'tr_0 tr_620000 tr_620500', '2');
INSERT INTO `areas` VALUES ('620521', '清水县', '620500', '清水', '106.139877', '34.752869', '3', 'tr_0 tr_620000 tr_620500', '4');
INSERT INTO `areas` VALUES ('620522', '秦安县', '620500', '秦安', '105.673302', '34.862354', '3', 'tr_0 tr_620000 tr_620500', '3');
INSERT INTO `areas` VALUES ('620523', '甘谷县', '620500', '甘谷', '105.332344', '34.747326', '3', 'tr_0 tr_620000 tr_620500', '1');
INSERT INTO `areas` VALUES ('620524', '武山县', '620500', '武山', '104.891693', '34.721954', '3', 'tr_0 tr_620000 tr_620500', '6');
INSERT INTO `areas` VALUES ('620525', '张家川回族自治县', '620500', '张家川', '106.212418', '34.993237', '3', 'tr_0 tr_620000 tr_620500', '7');
INSERT INTO `areas` VALUES ('620600', '武威市', '620000', '武威', '102.634697', '37.929996', '2', 'tr_0 tr_620000', '13');
INSERT INTO `areas` VALUES ('620602', '凉州区', '620600', '凉州', '102.634491', '37.930248', '3', 'tr_0 tr_620000 tr_620600', '2');
INSERT INTO `areas` VALUES ('620621', '民勤县', '620600', '民勤', '103.090652', '38.624622', '3', 'tr_0 tr_620000 tr_620600', '3');
INSERT INTO `areas` VALUES ('620622', '古浪县', '620600', '古浪', '102.898048', '37.47057', '3', 'tr_0 tr_620000 tr_620600', '1');
INSERT INTO `areas` VALUES ('620623', '天祝藏族自治县', '620600', '天祝', '103.142036', '36.97168', '3', 'tr_0 tr_620000 tr_620600', '4');
INSERT INTO `areas` VALUES ('620700', '张掖市', '620000', '张掖', '100.455475', '38.932896', '2', 'tr_0 tr_620000', '14');
INSERT INTO `areas` VALUES ('620702', '甘州区', '620700', '甘州', '100.454865', '38.931774', '3', 'tr_0 tr_620000 tr_620700', '1');
INSERT INTO `areas` VALUES ('620721', '肃南裕固族自治县', '620700', '肃南', '99.617088', '38.837269', '3', 'tr_0 tr_620000 tr_620700', '6');
INSERT INTO `areas` VALUES ('620722', '民乐县', '620700', '民乐', '100.81662', '38.434456', '3', 'tr_0 tr_620000 tr_620700', '4');
INSERT INTO `areas` VALUES ('620723', '临泽县', '620700', '临泽', '100.166336', '39.152149', '3', 'tr_0 tr_620000 tr_620700', '3');
INSERT INTO `areas` VALUES ('620724', '高台县', '620700', '高台', '99.81665', '39.376308', '3', 'tr_0 tr_620000 tr_620700', '2');
INSERT INTO `areas` VALUES ('620725', '山丹县', '620700', '山丹', '101.08844', '38.78484', '3', 'tr_0 tr_620000 tr_620700', '5');
INSERT INTO `areas` VALUES ('620800', '平凉市', '620000', '平凉', '106.684692', '35.542789', '2', 'tr_0 tr_620000', '10');
INSERT INTO `areas` VALUES ('620802', '崆峒区', '620800', '崆峒', '106.684219', '35.541729', '3', 'tr_0 tr_620000 tr_620800', '5');
INSERT INTO `areas` VALUES ('620821', '泾川县', '620800', '泾川', '107.365219', '35.335281', '3', 'tr_0 tr_620000 tr_620800', '3');
INSERT INTO `areas` VALUES ('620822', '灵台县', '620800', '灵台', '107.62059', '35.064011', '3', 'tr_0 tr_620000 tr_620800', '6');
INSERT INTO `areas` VALUES ('620823', '崇信县', '620800', '崇信', '107.03125', '35.304531', '3', 'tr_0 tr_620000 tr_620800', '1');
INSERT INTO `areas` VALUES ('620824', '华亭县', '620800', '华亭', '106.649307', '35.215343', '3', 'tr_0 tr_620000 tr_620800', '2');
INSERT INTO `areas` VALUES ('620825', '庄浪县', '620800', '庄浪', '106.041977', '35.203426', '3', 'tr_0 tr_620000 tr_620800', '7');
INSERT INTO `areas` VALUES ('620826', '静宁县', '620800', '静宁', '105.73349', '35.525242', '3', 'tr_0 tr_620000 tr_620800', '4');
INSERT INTO `areas` VALUES ('620900', '酒泉市', '620000', '酒泉', '98.510796', '39.744022', '2', 'tr_0 tr_620000', '6');
INSERT INTO `areas` VALUES ('620902', '肃州区', '620900', '肃州', '98.511154', '39.743858', '3', 'tr_0 tr_620000 tr_620900', '6');
INSERT INTO `areas` VALUES ('620921', '金塔县', '620900', '金塔', '98.902962', '39.983036', '3', 'tr_0 tr_620000 tr_620900', '4');
INSERT INTO `areas` VALUES ('620922', '瓜州县', '620900', '瓜州', '95.780594', '40.516525', '3', 'tr_0 tr_620000 tr_620900', '3');
INSERT INTO `areas` VALUES ('620923', '肃北蒙古族自治县', '620900', '肃北', '94.877281', '39.512241', '3', 'tr_0 tr_620000 tr_620900', '5');
INSERT INTO `areas` VALUES ('620924', '阿克塞哈萨克族自治县', '620900', '阿克塞', '94.337639', '39.631641', '3', 'tr_0 tr_620000 tr_620900', '1');
INSERT INTO `areas` VALUES ('620981', '玉门市', '620900', '玉门', '97.037209', '40.286819', '3', 'tr_0 tr_620000 tr_620900', '7');
INSERT INTO `areas` VALUES ('620982', '敦煌市', '620900', '敦煌', '94.664276', '40.141117', '3', 'tr_0 tr_620000 tr_620900', '2');
INSERT INTO `areas` VALUES ('621000', '庆阳市', '620000', '庆阳', '107.638374', '35.734219', '2', 'tr_0 tr_620000', '11');
INSERT INTO `areas` VALUES ('621002', '西峰区', '621000', '西峰', '107.638824', '35.733711', '3', 'tr_0 tr_620000 tr_621000', '6');
INSERT INTO `areas` VALUES ('621021', '庆城县', '621000', '庆城', '107.885666', '36.013504', '3', 'tr_0 tr_620000 tr_621000', '5');
INSERT INTO `areas` VALUES ('621022', '环县', '621000', '环县', '107.308754', '36.569321', '3', 'tr_0 tr_620000 tr_621000', '3');
INSERT INTO `areas` VALUES ('621023', '华池县', '621000', '华池', '107.98629', '36.457302', '3', 'tr_0 tr_620000 tr_621000', '2');
INSERT INTO `areas` VALUES ('621024', '合水县', '621000', '合水', '108.019867', '35.819004', '3', 'tr_0 tr_620000 tr_621000', '1');
INSERT INTO `areas` VALUES ('621025', '正宁县', '621000', '正宁', '108.361069', '35.490643', '3', 'tr_0 tr_620000 tr_621000', '7');
INSERT INTO `areas` VALUES ('621026', '宁县', '621000', '宁县', '107.921181', '35.50201', '3', 'tr_0 tr_620000 tr_621000', '4');
INSERT INTO `areas` VALUES ('621027', '镇原县', '621000', '镇原', '107.195709', '35.677807', '3', 'tr_0 tr_620000 tr_621000', '8');
INSERT INTO `areas` VALUES ('621100', '定西市', '620000', '定西', '104.626297', '35.579578', '2', 'tr_0 tr_620000', '2');
INSERT INTO `areas` VALUES ('621102', '安定区', '621100', '安定', '104.625771', '35.579765', '3', 'tr_0 tr_620000 tr_621100', '1');
INSERT INTO `areas` VALUES ('621121', '通渭县', '621100', '通渭', '105.250099', '35.208923', '3', 'tr_0 tr_620000 tr_621100', '5');
INSERT INTO `areas` VALUES ('621122', '陇西县', '621100', '陇西', '104.63755', '35.00341', '3', 'tr_0 tr_620000 tr_621100', '3');
INSERT INTO `areas` VALUES ('621123', '渭源县', '621100', '渭源', '104.211739', '35.133022', '3', 'tr_0 tr_620000 tr_621100', '6');
INSERT INTO `areas` VALUES ('621124', '临洮县', '621100', '临洮', '103.862183', '35.376232', '3', 'tr_0 tr_620000 tr_621100', '2');
INSERT INTO `areas` VALUES ('621125', '漳县', '621100', '漳县', '104.466759', '34.84864', '3', 'tr_0 tr_620000 tr_621100', '7');
INSERT INTO `areas` VALUES ('621126', '岷县', '621100', '岷县', '104.039879', '34.439106', '3', 'tr_0 tr_620000 tr_621100', '4');
INSERT INTO `areas` VALUES ('621200', '陇南市', '620000', '陇南', '104.929382', '33.388599', '2', 'tr_0 tr_620000', '9');
INSERT INTO `areas` VALUES ('621202', '武都区', '621200', '武都', '104.929863', '33.388157', '3', 'tr_0 tr_620000 tr_621200', '8');
INSERT INTO `areas` VALUES ('621221', '成县', '621200', '成县', '105.734436', '33.739864', '3', 'tr_0 tr_620000 tr_621200', '1');
INSERT INTO `areas` VALUES ('621222', '文县', '621200', '文县', '104.682449', '32.942169', '3', 'tr_0 tr_620000 tr_621200', '7');
INSERT INTO `areas` VALUES ('621223', '宕昌县', '621200', '宕昌', '104.394478', '34.042656', '3', 'tr_0 tr_620000 tr_621200', '2');
INSERT INTO `areas` VALUES ('621224', '康县', '621200', '康县', '105.609535', '33.328266', '3', 'tr_0 tr_620000 tr_621200', '4');
INSERT INTO `areas` VALUES ('621225', '西和县', '621200', '西和', '105.299736', '34.013718', '3', 'tr_0 tr_620000 tr_621200', '9');
INSERT INTO `areas` VALUES ('621226', '礼县', '621200', '礼县', '105.181618', '34.189388', '3', 'tr_0 tr_620000 tr_621200', '6');
INSERT INTO `areas` VALUES ('621227', '徽县', '621200', '徽县', '106.085632', '33.767784', '3', 'tr_0 tr_620000 tr_621200', '3');
INSERT INTO `areas` VALUES ('621228', '两当县', '621200', '两当', '106.306961', '33.910728', '3', 'tr_0 tr_620000 tr_621200', '5');
INSERT INTO `areas` VALUES ('622900', '临夏回族自治州', '620000', '临夏', '103.212006', '35.599445', '2', 'tr_0 tr_620000', '8');
INSERT INTO `areas` VALUES ('622901', '临夏市', '622900', '临夏市', '103.211632', '35.599411', '3', 'tr_0 tr_620000 tr_622900', '6');
INSERT INTO `areas` VALUES ('622921', '临夏县', '622900', '临夏县', '102.993874', '35.492359', '3', 'tr_0 tr_620000 tr_622900', '7');
INSERT INTO `areas` VALUES ('622922', '康乐县', '622900', '康乐', '103.709854', '35.371906', '3', 'tr_0 tr_620000 tr_622900', '5');
INSERT INTO `areas` VALUES ('622923', '永靖县', '622900', '永靖', '103.31987', '35.938934', '3', 'tr_0 tr_620000 tr_622900', '8');
INSERT INTO `areas` VALUES ('622924', '广河县', '622900', '广河', '103.576187', '35.481689', '3', 'tr_0 tr_620000 tr_622900', '2');
INSERT INTO `areas` VALUES ('622925', '和政县', '622900', '和政', '103.350357', '35.425972', '3', 'tr_0 tr_620000 tr_622900', '3');
INSERT INTO `areas` VALUES ('622926', '东乡族自治县', '622900', '东乡', '103.389565', '35.66383', '3', 'tr_0 tr_620000 tr_622900', '1');
INSERT INTO `areas` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '622900', '积石山', '102.877472', '35.712906', '3', 'tr_0 tr_620000 tr_622900', '4');
INSERT INTO `areas` VALUES ('623000', '甘南藏族自治州', '620000', '甘南', '102.911011', '34.986355', '2', 'tr_0 tr_620000', '3');
INSERT INTO `areas` VALUES ('623001', '合作市', '623000', '合作', '102.911491', '34.985973', '3', 'tr_0 tr_620000 tr_623000', '2');
INSERT INTO `areas` VALUES ('623021', '临潭县', '623000', '临潭', '103.35305', '34.691639', '3', 'tr_0 tr_620000 tr_623000', '3');
INSERT INTO `areas` VALUES ('623022', '卓尼县', '623000', '卓尼', '103.508507', '34.588165', '3', 'tr_0 tr_620000 tr_623000', '8');
INSERT INTO `areas` VALUES ('623023', '舟曲县', '623000', '舟曲', '104.37027', '33.782963', '3', 'tr_0 tr_620000 tr_623000', '7');
INSERT INTO `areas` VALUES ('623024', '迭部县', '623000', '迭部', '103.221008', '34.055347', '3', 'tr_0 tr_620000 tr_623000', '1');
INSERT INTO `areas` VALUES ('623025', '玛曲县', '623000', '玛曲', '102.075768', '33.99807', '3', 'tr_0 tr_620000 tr_623000', '5');
INSERT INTO `areas` VALUES ('623026', '碌曲县', '623000', '碌曲', '102.488495', '34.589592', '3', 'tr_0 tr_620000 tr_623000', '4');
INSERT INTO `areas` VALUES ('623027', '夏河县', '623000', '夏河', '102.520744', '35.200851', '3', 'tr_0 tr_620000 tr_623000', '6');
INSERT INTO `areas` VALUES ('630000', '青海省', '1', '青海', '101.778915', '36.623177', '1', 'tr_0', '29');
INSERT INTO `areas` VALUES ('630100', '西宁市', '630000', '西宁', '101.778915', '36.623177', '2', 'tr_0 tr_630000', '7');
INSERT INTO `areas` VALUES ('630102', '城东区', '630100', '城东', '101.796097', '36.616043', '3', 'tr_0 tr_630000 tr_630100', '2');
INSERT INTO `areas` VALUES ('630103', '城中区', '630100', '城中', '101.784554', '36.621181', '3', 'tr_0 tr_630000 tr_630100', '4');
INSERT INTO `areas` VALUES ('630104', '城西区', '630100', '城西', '101.763649', '36.628323', '3', 'tr_0 tr_630000 tr_630100', '3');
INSERT INTO `areas` VALUES ('630105', '城北区', '630100', '城北', '101.761299', '36.648449', '3', 'tr_0 tr_630000 tr_630100', '1');
INSERT INTO `areas` VALUES ('630121', '大通回族土族自治县', '630100', '大通', '101.684181', '36.931343', '3', 'tr_0 tr_630000 tr_630100', '5');
INSERT INTO `areas` VALUES ('630122', '湟中县', '630100', '湟中', '101.569473', '36.50042', '3', 'tr_0 tr_630000 tr_630100', '7');
INSERT INTO `areas` VALUES ('630123', '湟源县', '630100', '湟源', '101.263435', '36.684818', '3', 'tr_0 tr_630000 tr_630100', '6');
INSERT INTO `areas` VALUES ('632100', '海东市', '630000', '海东', '102.103271', '36.502914', '2', 'tr_0 tr_630000', '3');
INSERT INTO `areas` VALUES ('632121', '平安县', '632100', '平安', '102.104294', '36.502712', '3', 'tr_0 tr_630000 tr_632100', '5');
INSERT INTO `areas` VALUES ('632122', '民和回族土族自治县', '632100', '民和', '102.804207', '36.329453', '3', 'tr_0 tr_630000 tr_632100', '4');
INSERT INTO `areas` VALUES ('632123', '乐都区', '632100', '乐都', '102.402428', '36.480289', '3', 'tr_0 tr_630000 tr_632100', '3');
INSERT INTO `areas` VALUES ('632126', '互助土族自治县', '632100', '互助', '101.956734', '36.839939', '3', 'tr_0 tr_630000 tr_632100', '2');
INSERT INTO `areas` VALUES ('632127', '化隆回族自治县', '632100', '化隆', '102.262329', '36.098324', '3', 'tr_0 tr_630000 tr_632100', '1');
INSERT INTO `areas` VALUES ('632128', '循化撒拉族自治县', '632100', '循化', '102.486534', '35.847248', '3', 'tr_0 tr_630000 tr_632100', '6');
INSERT INTO `areas` VALUES ('632200', '海北藏族自治州', '630000', '海北', '100.901062', '36.959435', '2', 'tr_0 tr_630000', '2');
INSERT INTO `areas` VALUES ('632221', '门源回族自治县', '632200', '门源', '101.618462', '37.376629', '3', 'tr_0 tr_630000 tr_632200', '3');
INSERT INTO `areas` VALUES ('632222', '祁连县', '632200', '祁连', '100.249779', '38.175407', '3', 'tr_0 tr_630000 tr_632200', '4');
INSERT INTO `areas` VALUES ('632223', '海晏县', '632200', '海晏', '100.90049', '36.959541', '3', 'tr_0 tr_630000 tr_632200', '2');
INSERT INTO `areas` VALUES ('632224', '刚察县', '632200', '刚察', '100.13842', '37.326263', '3', 'tr_0 tr_630000 tr_632200', '1');
INSERT INTO `areas` VALUES ('632300', '黄南藏族自治州', '630000', '黄南', '102.019989', '35.517742', '2', 'tr_0 tr_630000', '6');
INSERT INTO `areas` VALUES ('632321', '同仁县', '632300', '同仁', '102.017601', '35.516338', '3', 'tr_0 tr_630000 tr_632300', '3');
INSERT INTO `areas` VALUES ('632322', '尖扎县', '632300', '尖扎', '102.031952', '35.938206', '3', 'tr_0 tr_630000 tr_632300', '2');
INSERT INTO `areas` VALUES ('632323', '泽库县', '632300', '泽库', '101.469345', '35.036842', '3', 'tr_0 tr_630000 tr_632300', '4');
INSERT INTO `areas` VALUES ('632324', '河南蒙古族自治县', '632300', '河南', '101.611877', '34.734524', '3', 'tr_0 tr_630000 tr_632300', '1');
INSERT INTO `areas` VALUES ('632500', '海南藏族自治州', '630000', '海南藏族', '100.619545', '36.280354', '2', 'tr_0 tr_630000', '4');
INSERT INTO `areas` VALUES ('632521', '共和县', '632500', '共和', '100.619598', '36.280285', '3', 'tr_0 tr_630000 tr_632500', '1');
INSERT INTO `areas` VALUES ('632522', '同德县', '632500', '同德', '100.579468', '35.254494', '3', 'tr_0 tr_630000 tr_632500', '4');
INSERT INTO `areas` VALUES ('632523', '贵德县', '632500', '贵德', '101.431854', '36.040455', '3', 'tr_0 tr_630000 tr_632500', '2');
INSERT INTO `areas` VALUES ('632524', '兴海县', '632500', '兴海', '99.986961', '35.589088', '3', 'tr_0 tr_630000 tr_632500', '5');
INSERT INTO `areas` VALUES ('632525', '贵南县', '632500', '贵南', '100.747917', '35.587086', '3', 'tr_0 tr_630000 tr_632500', '3');
INSERT INTO `areas` VALUES ('632600', '果洛藏族自治州', '630000', '果洛', '100.242142', '34.473598', '2', 'tr_0 tr_630000', '1');
INSERT INTO `areas` VALUES ('632621', '玛沁县', '632600', '玛沁', '100.24353', '34.473385', '3', 'tr_0 tr_630000 tr_632600', '6');
INSERT INTO `areas` VALUES ('632622', '班玛县', '632600', '班玛', '100.737953', '32.931587', '3', 'tr_0 tr_630000 tr_632600', '1');
INSERT INTO `areas` VALUES ('632623', '甘德县', '632600', '甘德', '99.902588', '33.966988', '3', 'tr_0 tr_630000 tr_632600', '3');
INSERT INTO `areas` VALUES ('632624', '达日县', '632600', '达日', '99.651718', '33.753258', '3', 'tr_0 tr_630000 tr_632600', '2');
INSERT INTO `areas` VALUES ('632625', '久治县', '632600', '久治', '101.484886', '33.430218', '3', 'tr_0 tr_630000 tr_632600', '4');
INSERT INTO `areas` VALUES ('632626', '玛多县', '632600', '玛多', '98.211342', '34.915279', '3', 'tr_0 tr_630000 tr_632600', '5');
INSERT INTO `areas` VALUES ('632700', '玉树藏族自治州', '630000', '玉树', '97.008522', '33.004047', '2', 'tr_0 tr_630000', '8');
INSERT INTO `areas` VALUES ('632721', '玉树市', '632700', '玉树', '97.008759', '33.003929', '3', 'tr_0 tr_630000 tr_632700', '4');
INSERT INTO `areas` VALUES ('632722', '杂多县', '632700', '杂多', '95.293427', '32.891888', '3', 'tr_0 tr_630000 tr_632700', '5');
INSERT INTO `areas` VALUES ('632723', '称多县', '632700', '称多', '97.110893', '33.367886', '3', 'tr_0 tr_630000 tr_632700', '1');
INSERT INTO `areas` VALUES ('632724', '治多县', '632700', '治多', '95.616844', '33.852322', '3', 'tr_0 tr_630000 tr_632700', '6');
INSERT INTO `areas` VALUES ('632725', '囊谦县', '632700', '囊谦', '96.479797', '32.203205', '3', 'tr_0 tr_630000 tr_632700', '2');
INSERT INTO `areas` VALUES ('632726', '曲麻莱县', '632700', '曲麻莱', '95.800674', '34.126541', '3', 'tr_0 tr_630000 tr_632700', '3');
INSERT INTO `areas` VALUES ('632800', '海西蒙古族藏族自治州', '630000', '海西', '97.370789', '37.374664', '2', 'tr_0 tr_630000', '5');
INSERT INTO `areas` VALUES ('632801', '格尔木市', '632800', '格尔木', '94.905777', '36.401543', '3', 'tr_0 tr_630000 tr_632800', '3');
INSERT INTO `areas` VALUES ('632802', '德令哈市', '632800', '德令哈', '97.37014', '37.374554', '3', 'tr_0 tr_630000 tr_632800', '1');
INSERT INTO `areas` VALUES ('632821', '乌兰县', '632800', '乌兰', '98.479851', '36.930389', '3', 'tr_0 tr_630000 tr_632800', '5');
INSERT INTO `areas` VALUES ('632822', '都兰县', '632800', '都兰', '98.089165', '36.298553', '3', 'tr_0 tr_630000 tr_632800', '2');
INSERT INTO `areas` VALUES ('632823', '天峻县', '632800', '天峻', '99.020782', '37.299061', '3', 'tr_0 tr_630000 tr_632800', '4');
INSERT INTO `areas` VALUES ('640000', '宁夏回族自治区', '1', '宁夏', '106.278175', '38.46637', '1', 'tr_0', '30');
INSERT INTO `areas` VALUES ('640100', '银川市', '640000', '银川', '106.278175', '38.46637', '2', 'tr_0 tr_640000', '4');
INSERT INTO `areas` VALUES ('640104', '兴庆区', '640100', '兴庆', '106.278397', '38.467468', '3', 'tr_0 tr_640000 tr_640100', '4');
INSERT INTO `areas` VALUES ('640105', '西夏区', '640100', '西夏', '106.132118', '38.492424', '3', 'tr_0 tr_640000 tr_640100', '5');
INSERT INTO `areas` VALUES ('640106', '金凤区', '640100', '金凤', '106.228485', '38.477352', '3', 'tr_0 tr_640000 tr_640100', '2');
INSERT INTO `areas` VALUES ('640121', '永宁县', '640100', '永宁', '106.253784', '38.28043', '3', 'tr_0 tr_640000 tr_640100', '6');
INSERT INTO `areas` VALUES ('640122', '贺兰县', '640100', '贺兰', '106.345901', '38.554562', '3', 'tr_0 tr_640000 tr_640100', '1');
INSERT INTO `areas` VALUES ('640181', '灵武市', '640100', '灵武', '106.334702', '38.094059', '3', 'tr_0 tr_640000 tr_640100', '3');
INSERT INTO `areas` VALUES ('640200', '石嘴山市', '640000', '石嘴山', '106.376175', '39.013329', '2', 'tr_0 tr_640000', '2');
INSERT INTO `areas` VALUES ('640202', '大武口区', '640200', '大武口', '106.376648', '39.014156', '3', 'tr_0 tr_640000 tr_640200', '1');
INSERT INTO `areas` VALUES ('640205', '惠农区', '640200', '惠农', '106.775513', '39.230095', '3', 'tr_0 tr_640000 tr_640200', '2');
INSERT INTO `areas` VALUES ('640221', '平罗县', '640200', '平罗', '106.544891', '38.906738', '3', 'tr_0 tr_640000 tr_640200', '3');
INSERT INTO `areas` VALUES ('640300', '吴忠市', '640000', '吴忠', '106.199409', '37.986164', '2', 'tr_0 tr_640000', '3');
INSERT INTO `areas` VALUES ('640302', '利通区', '640300', '利通', '106.199417', '37.985966', '3', 'tr_0 tr_640000 tr_640300', '2');
INSERT INTO `areas` VALUES ('640303', '红寺堡区', '640300', '红寺堡', '106.067314', '37.421616', '3', 'tr_0 tr_640000 tr_640300', '1');
INSERT INTO `areas` VALUES ('640323', '盐池县', '640300', '盐池', '107.405411', '37.784222', '3', 'tr_0 tr_640000 tr_640300', '5');
INSERT INTO `areas` VALUES ('640324', '同心县', '640300', '同心', '105.914764', '36.982899', '3', 'tr_0 tr_640000 tr_640300', '4');
INSERT INTO `areas` VALUES ('640381', '青铜峡市', '640300', '青铜峡', '106.075394', '38.021507', '3', 'tr_0 tr_640000 tr_640300', '3');
INSERT INTO `areas` VALUES ('640400', '固原市', '640000', '固原', '106.28524', '36.004562', '2', 'tr_0 tr_640000', '1');
INSERT INTO `areas` VALUES ('640402', '原州区', '640400', '原州', '106.284767', '36.005337', '3', 'tr_0 tr_640000 tr_640400', '5');
INSERT INTO `areas` VALUES ('640422', '西吉县', '640400', '西吉', '105.731804', '35.965385', '3', 'tr_0 tr_640000 tr_640400', '4');
INSERT INTO `areas` VALUES ('640423', '隆德县', '640400', '隆德', '106.123444', '35.618233', '3', 'tr_0 tr_640000 tr_640400', '2');
INSERT INTO `areas` VALUES ('640424', '泾源县', '640400', '泾源', '106.338676', '35.493439', '3', 'tr_0 tr_640000 tr_640400', '1');
INSERT INTO `areas` VALUES ('640425', '彭阳县', '640400', '彭阳', '106.64151', '35.849976', '3', 'tr_0 tr_640000 tr_640400', '3');
INSERT INTO `areas` VALUES ('640500', '中卫市', '640000', '中卫', '105.189568', '37.51495', '2', 'tr_0 tr_640000', '5');
INSERT INTO `areas` VALUES ('640502', '沙坡头区', '640500', '沙坡头', '105.190536', '37.514565', '3', 'tr_0 tr_640000 tr_640500', '2');
INSERT INTO `areas` VALUES ('640521', '中宁县', '640500', '中宁', '105.675781', '37.489735', '3', 'tr_0 tr_640000 tr_640500', '3');
INSERT INTO `areas` VALUES ('640522', '海原县', '640500', '海原', '105.647324', '36.562008', '3', 'tr_0 tr_640000 tr_640500', '1');
INSERT INTO `areas` VALUES ('650000', '新疆维吾尔自治区', '1', '新疆', '87.617729', '43.792816', '1', 'tr_0', '31');
INSERT INTO `areas` VALUES ('650100', '乌鲁木齐市', '650000', '乌鲁木齐', '87.617729', '43.792816', '2', 'tr_0 tr_650000', '17');
INSERT INTO `areas` VALUES ('650102', '天山区', '650100', '天山', '87.620117', '43.796429', '3', 'tr_0 tr_650000 tr_650100', '5');
INSERT INTO `areas` VALUES ('650103', '沙依巴克区', '650100', '沙依巴克', '87.596642', '43.788872', '3', 'tr_0 tr_650000 tr_650100', '3');
INSERT INTO `areas` VALUES ('650104', '新市区', '650100', '新市', '87.560654', '43.87088', '3', 'tr_0 tr_650000 tr_650100', '8');
INSERT INTO `areas` VALUES ('650105', '水磨沟区', '650100', '水磨沟', '87.613091', '43.816746', '3', 'tr_0 tr_650000 tr_650100', '4');
INSERT INTO `areas` VALUES ('650106', '头屯河区', '650100', '头屯河', '87.425819', '43.876053', '3', 'tr_0 tr_650000 tr_650100', '6');
INSERT INTO `areas` VALUES ('650107', '达坂城区', '650100', '达坂城', '88.309937', '43.361809', '3', 'tr_0 tr_650000 tr_650100', '1');
INSERT INTO `areas` VALUES ('650109', '米东区', '650100', '米东', '87.691803', '43.960983', '3', 'tr_0 tr_650000 tr_650100', '2');
INSERT INTO `areas` VALUES ('650121', '乌鲁木齐县', '650100', '乌鲁木齐', '1.0', '0.0', '3', 'tr_0 tr_650000 tr_650100', '7');
INSERT INTO `areas` VALUES ('650200', '克拉玛依市', '650000', '克拉玛依', '84.873947', '45.595886', '2', 'tr_0 tr_650000', '10');
INSERT INTO `areas` VALUES ('650202', '独山子区', '650200', '独山子', '84.882271', '44.327206', '3', 'tr_0 tr_650000 tr_650200', '2');
INSERT INTO `areas` VALUES ('650203', '克拉玛依区', '650200', '克拉玛依', '84.868919', '45.600475', '3', 'tr_0 tr_650000 tr_650200', '3');
INSERT INTO `areas` VALUES ('650204', '白碱滩区', '650200', '白碱滩', '85.129883', '45.689022', '3', 'tr_0 tr_650000 tr_650200', '1');
INSERT INTO `areas` VALUES ('650205', '乌尔禾区', '650200', '乌尔禾', '85.697769', '46.087761', '3', 'tr_0 tr_650000 tr_650200', '4');
INSERT INTO `areas` VALUES ('652100', '吐鲁番地区', '650000', '吐鲁番', '89.184074', '42.947613', '2', 'tr_0 tr_650000', '14');
INSERT INTO `areas` VALUES ('652101', '吐鲁番市', '652100', '吐鲁番', '89.182327', '42.947628', '3', 'tr_0 tr_650000 tr_652100', '2');
INSERT INTO `areas` VALUES ('652122', '鄯善县', '652100', '鄯善', '90.212692', '42.865501', '3', 'tr_0 tr_650000 tr_652100', '1');
INSERT INTO `areas` VALUES ('652123', '托克逊县', '652100', '托克逊', '88.655769', '42.793537', '3', 'tr_0 tr_650000 tr_652100', '3');
INSERT INTO `areas` VALUES ('652200', '哈密地区', '650000', '哈密', '93.513161', '42.833248', '2', 'tr_0 tr_650000', '7');
INSERT INTO `areas` VALUES ('652201', '哈密市', '652200', '哈密', '93.509171', '42.833889', '3', 'tr_0 tr_650000 tr_652200', '2');
INSERT INTO `areas` VALUES ('652222', '巴里坤哈萨克自治县', '652200', '巴里坤', '93.021797', '43.599033', '3', 'tr_0 tr_650000 tr_652200', '1');
INSERT INTO `areas` VALUES ('652223', '伊吾县', '652200', '伊吾', '94.692772', '43.25201', '3', 'tr_0 tr_650000 tr_652200', '3');
INSERT INTO `areas` VALUES ('652300', '昌吉回族自治州', '650000', '昌吉', '87.304008', '44.014576', '2', 'tr_0 tr_650000', '6');
INSERT INTO `areas` VALUES ('652301', '昌吉市', '652300', '昌吉', '87.304115', '44.013184', '3', 'tr_0 tr_650000 tr_652300', '1');
INSERT INTO `areas` VALUES ('652302', '阜康市', '652300', '阜康', '87.983841', '44.152153', '3', 'tr_0 tr_650000 tr_652300', '2');
INSERT INTO `areas` VALUES ('652323', '呼图壁县', '652300', '呼图壁', '86.888611', '44.189342', '3', 'tr_0 tr_650000 tr_652300', '3');
INSERT INTO `areas` VALUES ('652324', '玛纳斯县', '652300', '玛纳斯', '86.21769', '44.305626', '3', 'tr_0 tr_650000 tr_652300', '5');
INSERT INTO `areas` VALUES ('652325', '奇台县', '652300', '奇台', '89.591438', '44.021996', '3', 'tr_0 tr_650000 tr_652300', '7');
INSERT INTO `areas` VALUES ('652327', '吉木萨尔县', '652300', '吉木萨尔', '89.18129', '43.997162', '3', 'tr_0 tr_650000 tr_652300', '4');
INSERT INTO `areas` VALUES ('652328', '木垒哈萨克自治县', '652300', '木垒', '90.282829', '43.832443', '3', 'tr_0 tr_650000 tr_652300', '6');
INSERT INTO `areas` VALUES ('652700', '博尔塔拉蒙古自治州', '650000', '博尔塔拉', '82.074776', '44.903259', '2', 'tr_0 tr_650000', '5');
INSERT INTO `areas` VALUES ('652701', '博乐市', '652700', '博乐', '82.072235', '44.903088', '3', 'tr_0 tr_650000 tr_652700', '2');
INSERT INTO `areas` VALUES ('652702', '阿拉山口市', '652700', '阿拉山口', '82.074776', '44.903259', '3', 'tr_0 tr_650000 tr_652700', '1');
INSERT INTO `areas` VALUES ('652722', '精河县', '652700', '精河', '82.892937', '44.605644', '3', 'tr_0 tr_650000 tr_652700', '3');
INSERT INTO `areas` VALUES ('652723', '温泉县', '652700', '温泉', '81.030991', '44.973751', '3', 'tr_0 tr_650000 tr_652700', '4');
INSERT INTO `areas` VALUES ('652800', '巴音郭楞蒙古自治州', '650000', '巴音郭楞', '86.15097', '41.768551', '2', 'tr_0 tr_650000', '4');
INSERT INTO `areas` VALUES ('652801', '库尔勒市', '652800', '库尔勒', '86.14595', '41.763123', '3', 'tr_0 tr_650000 tr_652800', '5');
INSERT INTO `areas` VALUES ('652822', '轮台县', '652800', '轮台', '84.248543', '41.781265', '3', 'tr_0 tr_650000 tr_652800', '6');
INSERT INTO `areas` VALUES ('652823', '尉犁县', '652800', '尉犁', '86.263412', '41.337429', '3', 'tr_0 tr_650000 tr_652800', '9');
INSERT INTO `areas` VALUES ('652824', '若羌县', '652800', '若羌', '88.168808', '39.023808', '3', 'tr_0 tr_650000 tr_652800', '7');
INSERT INTO `areas` VALUES ('652825', '且末县', '652800', '且末', '85.532631', '38.138561', '3', 'tr_0 tr_650000 tr_652800', '4');
INSERT INTO `areas` VALUES ('652826', '焉耆回族自治县', '652800', '焉耆', '86.569801', '42.06435', '3', 'tr_0 tr_650000 tr_652800', '8');
INSERT INTO `areas` VALUES ('652827', '和静县', '652800', '和静', '86.391068', '42.317162', '3', 'tr_0 tr_650000 tr_652800', '2');
INSERT INTO `areas` VALUES ('652828', '和硕县', '652800', '和硕', '86.864944', '42.268864', '3', 'tr_0 tr_650000 tr_652800', '3');
INSERT INTO `areas` VALUES ('652829', '博湖县', '652800', '博湖', '86.631577', '41.980167', '3', 'tr_0 tr_650000 tr_652800', '1');
INSERT INTO `areas` VALUES ('652900', '阿克苏地区', '650000', '阿克苏', '80.265068', '41.170712', '2', 'tr_0 tr_650000', '1');
INSERT INTO `areas` VALUES ('652901', '阿克苏市', '652900', '阿克苏', '80.262901', '41.171272', '3', 'tr_0 tr_650000 tr_652900', '1');
INSERT INTO `areas` VALUES ('652922', '温宿县', '652900', '温宿', '80.243271', '41.272995', '3', 'tr_0 tr_650000 tr_652900', '7');
INSERT INTO `areas` VALUES ('652923', '库车县', '652900', '库车', '82.963043', '41.71714', '3', 'tr_0 tr_650000 tr_652900', '5');
INSERT INTO `areas` VALUES ('652924', '沙雅县', '652900', '沙雅', '82.780769', '41.226269', '3', 'tr_0 tr_650000 tr_652900', '6');
INSERT INTO `areas` VALUES ('652925', '新和县', '652900', '新和', '82.610825', '41.551174', '3', 'tr_0 tr_650000 tr_652900', '9');
INSERT INTO `areas` VALUES ('652926', '拜城县', '652900', '拜城', '81.869881', '41.796101', '3', 'tr_0 tr_650000 tr_652900', '3');
INSERT INTO `areas` VALUES ('652927', '乌什县', '652900', '乌什', '79.230804', '41.21587', '3', 'tr_0 tr_650000 tr_652900', '8');
INSERT INTO `areas` VALUES ('652928', '阿瓦提县', '652900', '阿瓦提', '80.378426', '40.63842', '3', 'tr_0 tr_650000 tr_652900', '2');
INSERT INTO `areas` VALUES ('652929', '柯坪县', '652900', '柯坪', '79.047852', '40.506241', '3', 'tr_0 tr_650000 tr_652900', '4');
INSERT INTO `areas` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '650000', '克孜勒苏柯尔克孜', '76.172829', '39.713432', '2', 'tr_0 tr_650000', '11');
INSERT INTO `areas` VALUES ('653001', '阿图什市', '653000', '阿图什', '76.173943', '39.712898', '3', 'tr_0 tr_650000 tr_653000', '3');
INSERT INTO `areas` VALUES ('653022', '阿克陶县', '653000', '阿克陶', '75.94516', '39.147079', '3', 'tr_0 tr_650000 tr_653000', '2');
INSERT INTO `areas` VALUES ('653023', '阿合奇县', '653000', '阿合奇', '78.450165', '40.937569', '3', 'tr_0 tr_650000 tr_653000', '1');
INSERT INTO `areas` VALUES ('653024', '乌恰县', '653000', '乌恰', '75.259689', '39.716633', '3', 'tr_0 tr_650000 tr_653000', '4');
INSERT INTO `areas` VALUES ('653100', '喀什地区', '650000', '喀什', '75.989136', '39.467663', '2', 'tr_0 tr_650000', '9');
INSERT INTO `areas` VALUES ('653101', '喀什市', '653100', '喀什', '75.98838', '39.467861', '3', 'tr_0 tr_650000 tr_653100', '3');
INSERT INTO `areas` VALUES ('653121', '疏附县', '653100', '疏附', '75.863075', '39.378307', '3', 'tr_0 tr_650000 tr_653100', '6');
INSERT INTO `areas` VALUES ('653122', '疏勒县', '653100', '疏勒', '76.05365', '39.39946', '3', 'tr_0 tr_650000 tr_653100', '7');
INSERT INTO `areas` VALUES ('653123', '英吉沙县', '653100', '英吉沙', '76.174294', '38.92984', '3', 'tr_0 tr_650000 tr_653100', '10');
INSERT INTO `areas` VALUES ('653124', '泽普县', '653100', '泽普', '77.27359', '38.191216', '3', 'tr_0 tr_650000 tr_653100', '12');
INSERT INTO `areas` VALUES ('653125', '莎车县', '653100', '莎车', '77.248886', '38.414497', '3', 'tr_0 tr_650000 tr_653100', '5');
INSERT INTO `areas` VALUES ('653126', '叶城县', '653100', '叶城', '77.420357', '37.884678', '3', 'tr_0 tr_650000 tr_653100', '9');
INSERT INTO `areas` VALUES ('653127', '麦盖提县', '653100', '麦盖提', '77.651535', '38.903385', '3', 'tr_0 tr_650000 tr_653100', '4');
INSERT INTO `areas` VALUES ('653128', '岳普湖县', '653100', '岳普湖', '76.7724', '39.235249', '3', 'tr_0 tr_650000 tr_653100', '11');
INSERT INTO `areas` VALUES ('653129', '伽师县', '653100', '伽师', '76.741982', '39.494324', '3', 'tr_0 tr_650000 tr_653100', '2');
INSERT INTO `areas` VALUES ('653130', '巴楚县', '653100', '巴楚', '78.550407', '39.783478', '3', 'tr_0 tr_650000 tr_653100', '1');
INSERT INTO `areas` VALUES ('653131', '塔什库尔干塔吉克自治县', '653100', '塔什库尔干', '75.228065', '37.775436', '3', 'tr_0 tr_650000 tr_653100', '8');
INSERT INTO `areas` VALUES ('653200', '和田地区', '650000', '和田', '79.925331', '37.110687', '2', 'tr_0 tr_650000', '8');
INSERT INTO `areas` VALUES ('653201', '和田市', '653200', '和田市', '79.927544', '37.108944', '3', 'tr_0 tr_650000 tr_653200', '2');
INSERT INTO `areas` VALUES ('653221', '和田县', '653200', '和田县', '79.819069', '37.120029', '3', 'tr_0 tr_650000 tr_653200', '3');
INSERT INTO `areas` VALUES ('653222', '墨玉县', '653200', '墨玉', '79.736626', '37.271511', '3', 'tr_0 tr_650000 tr_653200', '6');
INSERT INTO `areas` VALUES ('653223', '皮山县', '653200', '皮山', '78.282303', '37.616333', '3', 'tr_0 tr_650000 tr_653200', '7');
INSERT INTO `areas` VALUES ('653224', '洛浦县', '653200', '洛浦', '80.184036', '37.074375', '3', 'tr_0 tr_650000 tr_653200', '4');
INSERT INTO `areas` VALUES ('653225', '策勒县', '653200', '策勒', '80.803574', '37.001671', '3', 'tr_0 tr_650000 tr_653200', '1');
INSERT INTO `areas` VALUES ('653226', '于田县', '653200', '于田', '81.667847', '36.85463', '3', 'tr_0 tr_650000 tr_653200', '8');
INSERT INTO `areas` VALUES ('653227', '民丰县', '653200', '民丰', '82.692352', '37.064911', '3', 'tr_0 tr_650000 tr_653200', '5');
INSERT INTO `areas` VALUES ('654000', '伊犁哈萨克自治州', '650000', '伊犁', '81.317947', '43.92186', '2', 'tr_0 tr_650000', '18');
INSERT INTO `areas` VALUES ('654002', '伊宁市', '654000', '伊宁市', '81.316345', '43.922211', '3', 'tr_0 tr_650000 tr_654000', '8');
INSERT INTO `areas` VALUES ('654003', '奎屯市', '654000', '奎屯', '84.901604', '44.423447', '3', 'tr_0 tr_650000 tr_654000', '4');
INSERT INTO `areas` VALUES ('654021', '伊宁县', '654000', '伊宁县', '81.524673', '43.977875', '3', 'tr_0 tr_650000 tr_654000', '9');
INSERT INTO `areas` VALUES ('654022', '察布查尔锡伯自治县', '654000', '察布查尔', '81.150871', '43.838882', '3', 'tr_0 tr_650000 tr_654000', '1');
INSERT INTO `areas` VALUES ('654023', '霍城县', '654000', '霍城', '80.872505', '44.049911', '3', 'tr_0 tr_650000 tr_654000', '3');
INSERT INTO `areas` VALUES ('654024', '巩留县', '654000', '巩留', '82.227043', '43.481617', '3', 'tr_0 tr_650000 tr_654000', '2');
INSERT INTO `areas` VALUES ('654025', '新源县', '654000', '新源', '83.258492', '43.43425', '3', 'tr_0 tr_650000 tr_654000', '7');
INSERT INTO `areas` VALUES ('654026', '昭苏县', '654000', '昭苏', '81.12603', '43.157764', '3', 'tr_0 tr_650000 tr_654000', '10');
INSERT INTO `areas` VALUES ('654027', '特克斯县', '654000', '特克斯', '81.840057', '43.214863', '3', 'tr_0 tr_650000 tr_654000', '6');
INSERT INTO `areas` VALUES ('654028', '尼勒克县', '654000', '尼勒克', '82.50412', '43.789738', '3', 'tr_0 tr_650000 tr_654000', '5');
INSERT INTO `areas` VALUES ('654200', '塔城地区', '650000', '塔城', '82.985733', '46.7463', '2', 'tr_0 tr_650000', '13');
INSERT INTO `areas` VALUES ('654201', '塔城市', '654200', '塔城', '82.983986', '46.746281', '3', 'tr_0 tr_650000 tr_654200', '4');
INSERT INTO `areas` VALUES ('654202', '乌苏市', '654200', '乌苏', '84.677628', '44.430115', '3', 'tr_0 tr_650000 tr_654200', '6');
INSERT INTO `areas` VALUES ('654221', '额敏县', '654200', '额敏', '83.622116', '46.522556', '3', 'tr_0 tr_650000 tr_654200', '1');
INSERT INTO `areas` VALUES ('654223', '沙湾县', '654200', '沙湾', '85.622505', '44.329544', '3', 'tr_0 tr_650000 tr_654200', '3');
INSERT INTO `areas` VALUES ('654224', '托里县', '654200', '托里', '83.604691', '45.935863', '3', 'tr_0 tr_650000 tr_654200', '5');
INSERT INTO `areas` VALUES ('654225', '裕民县', '654200', '裕民', '82.982155', '46.202782', '3', 'tr_0 tr_650000 tr_654200', '7');
INSERT INTO `areas` VALUES ('654226', '和布克赛尔蒙古自治县', '654200', '和布克赛尔', '85.733551', '46.792999', '3', 'tr_0 tr_650000 tr_654200', '2');
INSERT INTO `areas` VALUES ('654300', '阿勒泰地区', '650000', '阿勒泰', '88.139633', '47.848392', '2', 'tr_0 tr_650000', '3');
INSERT INTO `areas` VALUES ('654301', '阿勒泰市', '654300', '阿勒泰', '88.138741', '47.848911', '3', 'tr_0 tr_650000 tr_654300', '1');
INSERT INTO `areas` VALUES ('654321', '布尔津县', '654300', '布尔津', '86.861862', '47.704529', '3', 'tr_0 tr_650000 tr_654300', '2');
INSERT INTO `areas` VALUES ('654322', '富蕴县', '654300', '富蕴', '89.524994', '46.993107', '3', 'tr_0 tr_650000 tr_654300', '4');
INSERT INTO `areas` VALUES ('654323', '福海县', '654300', '福海', '87.494568', '47.113129', '3', 'tr_0 tr_650000 tr_654300', '3');
INSERT INTO `areas` VALUES ('654324', '哈巴河县', '654300', '哈巴河', '86.418961', '48.059284', '3', 'tr_0 tr_650000 tr_654300', '5');
INSERT INTO `areas` VALUES ('654325', '青河县', '654300', '青河', '90.381561', '46.672447', '3', 'tr_0 tr_650000 tr_654300', '7');
INSERT INTO `areas` VALUES ('654326', '吉木乃县', '654300', '吉木乃', '85.87606', '47.434631', '3', 'tr_0 tr_650000 tr_654300', '6');
INSERT INTO `areas` VALUES ('659001', '石河子市', '650000', '石河子', '86.041077', '44.305885', '2', 'tr_0 tr_650000', '12');
INSERT INTO `areas` VALUES ('659002', '阿拉尔市', '650000', '阿拉尔', '81.285881', '40.541916', '2', 'tr_0 tr_650000', '2');
INSERT INTO `areas` VALUES ('659003', '图木舒克市', '650000', '图木舒克', '79.07798', '39.867317', '2', 'tr_0 tr_650000', '15');
INSERT INTO `areas` VALUES ('659004', '五家渠市', '650000', '五家渠', '87.526886', '44.1674', '2', 'tr_0 tr_650000', '16');
INSERT INTO `areas` VALUES ('710000', '台湾', '1', '台湾', '121.509064', '25.044333', '1', 'tr_0', '34');
INSERT INTO `areas` VALUES ('710100', '台北市', '710000', '台北', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '12');
INSERT INTO `areas` VALUES ('710101', '中正区', '710100', '中正', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710100', '12');
INSERT INTO `areas` VALUES ('710102', '大同区', '710100', '大同', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710100', '3');
INSERT INTO `areas` VALUES ('710103', '中山区', '710100', '中山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710100', '11');
INSERT INTO `areas` VALUES ('710104', '松山区', '710100', '松山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710100', '8');
INSERT INTO `areas` VALUES ('710105', '大安区', '710100', '大安', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710100', '2');
INSERT INTO `areas` VALUES ('710106', '万华区', '710100', '万华', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710100', '9');
INSERT INTO `areas` VALUES ('710107', '信义区', '710100', '信义', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710100', '6');
INSERT INTO `areas` VALUES ('710108', '士林区', '710100', '士林', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710100', '7');
INSERT INTO `areas` VALUES ('710109', '北投区', '710100', '北投', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710100', '1');
INSERT INTO `areas` VALUES ('710110', '内湖区', '710100', '内湖', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710100', '5');
INSERT INTO `areas` VALUES ('710111', '南港区', '710100', '南港', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710100', '4');
INSERT INTO `areas` VALUES ('710112', '文山区', '710100', '文山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710100', '10');
INSERT INTO `areas` VALUES ('710200', '高雄市', '710000', '高雄', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '1');
INSERT INTO `areas` VALUES ('710201', '新兴区', '710200', '新兴', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '34');
INSERT INTO `areas` VALUES ('710202', '前金区', '710200', '前金', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '21');
INSERT INTO `areas` VALUES ('710203', '芩雅区', '710200', '芩雅', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '26');
INSERT INTO `areas` VALUES ('710204', '盐埕区', '710200', '盐埕', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '36');
INSERT INTO `areas` VALUES ('710205', '鼓山区', '710200', '鼓山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '7');
INSERT INTO `areas` VALUES ('710206', '旗津区', '710200', '旗津', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '25');
INSERT INTO `areas` VALUES ('710207', '前镇区', '710200', '前镇', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '22');
INSERT INTO `areas` VALUES ('710208', '三民区', '710200', '三民', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '29');
INSERT INTO `areas` VALUES ('710209', '左营区', '710200', '左营', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '39');
INSERT INTO `areas` VALUES ('710210', '楠梓区', '710200', '楠梓', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '18');
INSERT INTO `areas` VALUES ('710211', '小港区', '710200', '小港', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '33');
INSERT INTO `areas` VALUES ('710241', '苓雅区', '710200', '苓雅', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '10');
INSERT INTO `areas` VALUES ('710242', '仁武区', '710200', '仁武', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '28');
INSERT INTO `areas` VALUES ('710243', '大社区', '710200', '大社', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '3');
INSERT INTO `areas` VALUES ('710244', '冈山区', '710200', '冈山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '6');
INSERT INTO `areas` VALUES ('710245', '路竹区', '710200', '路竹', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '13');
INSERT INTO `areas` VALUES ('710246', '阿莲区', '710200', '阿莲', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '1');
INSERT INTO `areas` VALUES ('710247', '田寮区', '710200', '田寮', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '32');
INSERT INTO `areas` VALUES ('710248', '燕巢区', '710200', '燕巢', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '35');
INSERT INTO `areas` VALUES ('710249', '桥头区', '710200', '桥头', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '23');
INSERT INTO `areas` VALUES ('710250', '梓官区', '710200', '梓官', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '38');
INSERT INTO `areas` VALUES ('710251', '弥陀区', '710200', '弥陀', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '16');
INSERT INTO `areas` VALUES ('710252', '永安区', '710200', '永安', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '37');
INSERT INTO `areas` VALUES ('710253', '湖内区', '710200', '湖内', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '8');
INSERT INTO `areas` VALUES ('710254', '凤山区', '710200', '凤山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '5');
INSERT INTO `areas` VALUES ('710255', '大寮区', '710200', '大寮', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '2');
INSERT INTO `areas` VALUES ('710256', '林园区', '710200', '林园', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '11');
INSERT INTO `areas` VALUES ('710257', '鸟松区', '710200', '鸟松', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '20');
INSERT INTO `areas` VALUES ('710258', '大树区', '710200', '大树', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '4');
INSERT INTO `areas` VALUES ('710259', '旗山区', '710200', '旗山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '27');
INSERT INTO `areas` VALUES ('710260', '美浓区', '710200', '美浓', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '15');
INSERT INTO `areas` VALUES ('710261', '六龟区', '710200', '六龟', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '12');
INSERT INTO `areas` VALUES ('710262', '内门区', '710200', '内门', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '19');
INSERT INTO `areas` VALUES ('710263', '杉林区', '710200', '杉林', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '30');
INSERT INTO `areas` VALUES ('710264', '甲仙区', '710200', '甲仙', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '9');
INSERT INTO `areas` VALUES ('710265', '桃源区', '710200', '桃源', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '31');
INSERT INTO `areas` VALUES ('710266', '那玛夏区', '710200', '那玛夏', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '17');
INSERT INTO `areas` VALUES ('710267', '茂林区', '710200', '茂林', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '14');
INSERT INTO `areas` VALUES ('710268', '茄萣区', '710200', '茄萣', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710200', '24');
INSERT INTO `areas` VALUES ('710300', '台南市', '710000', '台南', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '14');
INSERT INTO `areas` VALUES ('710301', '中西区', '710300', '中西', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '36');
INSERT INTO `areas` VALUES ('710302', '东区', '710300', '东区', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '8');
INSERT INTO `areas` VALUES ('710303', '南区', '710300', '南区', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '21');
INSERT INTO `areas` VALUES ('710304', '北区', '710300', '北区', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '6');
INSERT INTO `areas` VALUES ('710305', '安平区', '710300', '安平', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '3');
INSERT INTO `areas` VALUES ('710306', '安南区', '710300', '安南', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '2');
INSERT INTO `areas` VALUES ('710339', '永康区', '710300', '永康', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '34');
INSERT INTO `areas` VALUES ('710340', '归仁区', '710300', '归仁', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '12');
INSERT INTO `areas` VALUES ('710341', '新化区', '710300', '新化', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '29');
INSERT INTO `areas` VALUES ('710342', '左镇区', '710300', '左镇', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '37');
INSERT INTO `areas` VALUES ('710343', '玉井区', '710300', '玉井', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '35');
INSERT INTO `areas` VALUES ('710344', '楠西区', '710300', '楠西', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '22');
INSERT INTO `areas` VALUES ('710345', '南化区', '710300', '南化', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '20');
INSERT INTO `areas` VALUES ('710346', '仁德区', '710300', '仁德', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '24');
INSERT INTO `areas` VALUES ('710347', '关庙区', '710300', '关庙', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '10');
INSERT INTO `areas` VALUES ('710348', '龙崎区', '710300', '龙崎', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '18');
INSERT INTO `areas` VALUES ('710349', '官田区', '710300', '官田', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '11');
INSERT INTO `areas` VALUES ('710350', '麻豆区', '710300', '麻豆', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '19');
INSERT INTO `areas` VALUES ('710351', '佳里区', '710300', '佳里', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '14');
INSERT INTO `areas` VALUES ('710352', '西港区', '710300', '西港', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '28');
INSERT INTO `areas` VALUES ('710353', '七股区', '710300', '七股', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '23');
INSERT INTO `areas` VALUES ('710354', '将军区', '710300', '将军', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '15');
INSERT INTO `areas` VALUES ('710355', '学甲区', '710300', '学甲', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '32');
INSERT INTO `areas` VALUES ('710356', '北门区', '710300', '北门', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '5');
INSERT INTO `areas` VALUES ('710357', '新营区', '710300', '新营', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '31');
INSERT INTO `areas` VALUES ('710358', '后壁区', '710300', '后壁', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '13');
INSERT INTO `areas` VALUES ('710359', '白河区', '710300', '白河', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '4');
INSERT INTO `areas` VALUES ('710360', '东山区', '710300', '东山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '9');
INSERT INTO `areas` VALUES ('710361', '六甲区', '710300', '六甲', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '16');
INSERT INTO `areas` VALUES ('710362', '下营区', '710300', '下营', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '27');
INSERT INTO `areas` VALUES ('710363', '柳营区', '710300', '柳营', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '17');
INSERT INTO `areas` VALUES ('710364', '盐水区', '710300', '盐水', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '33');
INSERT INTO `areas` VALUES ('710365', '善化区', '710300', '善化', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '25');
INSERT INTO `areas` VALUES ('710366', '大内区', '710300', '大内', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '7');
INSERT INTO `areas` VALUES ('710367', '山上区', '710300', '山上', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '26');
INSERT INTO `areas` VALUES ('710368', '新市区', '710300', '新市', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '30');
INSERT INTO `areas` VALUES ('710369', '安定区', '710300', '安定', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710300', '1');
INSERT INTO `areas` VALUES ('710400', '台中市', '710000', '台中', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '15');
INSERT INTO `areas` VALUES ('710401', '中区', '710400', '中区', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '29');
INSERT INTO `areas` VALUES ('710402', '东区', '710400', '东区', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '8');
INSERT INTO `areas` VALUES ('710403', '南区', '710400', '南区', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '14');
INSERT INTO `areas` VALUES ('710404', '西区', '710400', '西区', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '27');
INSERT INTO `areas` VALUES ('710405', '北区', '710400', '北区', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '1');
INSERT INTO `areas` VALUES ('710406', '北屯区', '710400', '北屯', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '2');
INSERT INTO `areas` VALUES ('710407', '西屯区', '710400', '西屯', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '28');
INSERT INTO `areas` VALUES ('710408', '南屯区', '710400', '南屯', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '15');
INSERT INTO `areas` VALUES ('710431', '太平区', '710400', '太平', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '20');
INSERT INTO `areas` VALUES ('710432', '大里区', '710400', '大里', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '6');
INSERT INTO `areas` VALUES ('710433', '雾峰区', '710400', '雾峰', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '23');
INSERT INTO `areas` VALUES ('710434', '乌日区', '710400', '乌日', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '25');
INSERT INTO `areas` VALUES ('710435', '丰原区', '710400', '丰原', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '10');
INSERT INTO `areas` VALUES ('710436', '后里区', '710400', '后里', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '12');
INSERT INTO `areas` VALUES ('710437', '石冈区', '710400', '石冈', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '19');
INSERT INTO `areas` VALUES ('710438', '东势区', '710400', '东势', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '9');
INSERT INTO `areas` VALUES ('710439', '和平区', '710400', '和平', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '11');
INSERT INTO `areas` VALUES ('710440', '新社区', '710400', '新社', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '26');
INSERT INTO `areas` VALUES ('710441', '潭子区', '710400', '潭子', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '21');
INSERT INTO `areas` VALUES ('710442', '大雅区', '710400', '大雅', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '7');
INSERT INTO `areas` VALUES ('710443', '神冈区', '710400', '神冈', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '18');
INSERT INTO `areas` VALUES ('710444', '大肚区', '710400', '大肚', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '4');
INSERT INTO `areas` VALUES ('710445', '沙鹿区', '710400', '沙鹿', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '17');
INSERT INTO `areas` VALUES ('710446', '龙井区', '710400', '龙井', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '13');
INSERT INTO `areas` VALUES ('710447', '梧栖区', '710400', '梧栖', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '24');
INSERT INTO `areas` VALUES ('710448', '清水区', '710400', '清水', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '16');
INSERT INTO `areas` VALUES ('710449', '大甲区', '710400', '大甲', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '5');
INSERT INTO `areas` VALUES ('710450', '外埔区', '710400', '外埔', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '22');
INSERT INTO `areas` VALUES ('710451', '大安区', '710400', '大安', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710400', '3');
INSERT INTO `areas` VALUES ('710500', '金门县', '710000', '金门', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '6');
INSERT INTO `areas` VALUES ('710507', '金沙镇', '710500', '金沙', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710500', '4');
INSERT INTO `areas` VALUES ('710508', '金湖镇', '710500', '金湖', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710500', '2');
INSERT INTO `areas` VALUES ('710509', '金宁乡', '710500', '金宁', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710500', '3');
INSERT INTO `areas` VALUES ('710510', '金城镇', '710500', '金城', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710500', '1');
INSERT INTO `areas` VALUES ('710511', '烈屿乡', '710500', '烈屿', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710500', '5');
INSERT INTO `areas` VALUES ('710512', '乌坵乡', '710500', '乌坵', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710500', '6');
INSERT INTO `areas` VALUES ('710600', '南投县', '710000', '南投', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '9');
INSERT INTO `areas` VALUES ('710614', '南投市', '710600', '南投', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710600', '8');
INSERT INTO `areas` VALUES ('710615', '中寮乡', '710600', '中寮', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710600', '3');
INSERT INTO `areas` VALUES ('710616', '草屯镇', '710600', '草屯', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710600', '1');
INSERT INTO `areas` VALUES ('710617', '国姓乡', '710600', '国姓', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710600', '2');
INSERT INTO `areas` VALUES ('710618', '埔里镇', '710600', '埔里', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710600', '9');
INSERT INTO `areas` VALUES ('710619', '仁爱乡', '710600', '仁爱', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710600', '10');
INSERT INTO `areas` VALUES ('710620', '名间乡', '710600', '名间', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710600', '7');
INSERT INTO `areas` VALUES ('710621', '集集镇', '710600', '集集', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710600', '5');
INSERT INTO `areas` VALUES ('710622', '水里乡', '710600', '水里', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710600', '11');
INSERT INTO `areas` VALUES ('710623', '鱼池乡', '710600', '鱼池', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710600', '13');
INSERT INTO `areas` VALUES ('710624', '信义乡', '710600', '信义', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710600', '12');
INSERT INTO `areas` VALUES ('710625', '竹山镇', '710600', '竹山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710600', '4');
INSERT INTO `areas` VALUES ('710626', '鹿谷乡', '710600', '鹿谷', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710600', '6');
INSERT INTO `areas` VALUES ('710700', '基隆市', '710000', '基隆', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '5');
INSERT INTO `areas` VALUES ('710701', '仁爱区', '710700', '仁爱', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710700', '4');
INSERT INTO `areas` VALUES ('710702', '信义区', '710700', '信义', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710700', '5');
INSERT INTO `areas` VALUES ('710703', '中正区', '710700', '中正', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710700', '7');
INSERT INTO `areas` VALUES ('710704', '中山区', '710700', '中山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710700', '6');
INSERT INTO `areas` VALUES ('710705', '安乐区', '710700', '安乐', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710700', '1');
INSERT INTO `areas` VALUES ('710706', '暖暖区', '710700', '暖暖', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710700', '2');
INSERT INTO `areas` VALUES ('710707', '七堵区', '710700', '七堵', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710700', '3');
INSERT INTO `areas` VALUES ('710800', '新竹市', '710000', '新竹', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '18');
INSERT INTO `areas` VALUES ('710801', '东区', '710800', '东区', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710800', '2');
INSERT INTO `areas` VALUES ('710802', '北区', '710800', '北区', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710800', '1');
INSERT INTO `areas` VALUES ('710803', '香山区', '710800', '香山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710800', '3');
INSERT INTO `areas` VALUES ('710900', '嘉义市', '710000', '嘉义', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '3');
INSERT INTO `areas` VALUES ('710901', '东区', '710900', '东区', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710900', '1');
INSERT INTO `areas` VALUES ('710902', '西区', '710900', '西区', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_710900', '2');
INSERT INTO `areas` VALUES ('711100', '新北市', '710000', '新北', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '17');
INSERT INTO `areas` VALUES ('711130', '万里区', '711100', '万里', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '25');
INSERT INTO `areas` VALUES ('711131', '金山区', '711100', '金山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '6');
INSERT INTO `areas` VALUES ('711132', '板桥区', '711100', '板桥', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '2');
INSERT INTO `areas` VALUES ('711133', '汐止区', '711100', '汐止', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '20');
INSERT INTO `areas` VALUES ('711134', '深坑区', '711100', '深坑', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '15');
INSERT INTO `areas` VALUES ('711135', '石碇区', '711100', '石碇', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '16');
INSERT INTO `areas` VALUES ('711136', '瑞芳区', '711100', '瑞芳', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '11');
INSERT INTO `areas` VALUES ('711137', '平溪区', '711100', '平溪', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '10');
INSERT INTO `areas` VALUES ('711138', '双溪区', '711100', '双溪', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '18');
INSERT INTO `areas` VALUES ('711139', '贡寮区', '711100', '贡寮', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '4');
INSERT INTO `areas` VALUES ('711140', '新店区', '711100', '新店', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '21');
INSERT INTO `areas` VALUES ('711141', '坪林区', '711100', '坪林', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '9');
INSERT INTO `areas` VALUES ('711142', '乌来区', '711100', '乌来', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '27');
INSERT INTO `areas` VALUES ('711143', '永和区', '711100', '永和', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '29');
INSERT INTO `areas` VALUES ('711144', '中和区', '711100', '中和', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '5');
INSERT INTO `areas` VALUES ('711145', '土城区', '711100', '土城', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '24');
INSERT INTO `areas` VALUES ('711146', '三峡区', '711100', '三峡', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '14');
INSERT INTO `areas` VALUES ('711147', '树林区', '711100', '树林', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '19');
INSERT INTO `areas` VALUES ('711148', '莺歌区', '711100', '莺歌', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '28');
INSERT INTO `areas` VALUES ('711149', '三重区', '711100', '三重', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '12');
INSERT INTO `areas` VALUES ('711150', '新庄区', '711100', '新庄', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '22');
INSERT INTO `areas` VALUES ('711151', '泰山区', '711100', '泰山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '23');
INSERT INTO `areas` VALUES ('711152', '林口区', '711100', '林口', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '7');
INSERT INTO `areas` VALUES ('711153', '芦洲区', '711100', '芦洲', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '8');
INSERT INTO `areas` VALUES ('711154', '五股区', '711100', '五股', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '26');
INSERT INTO `areas` VALUES ('711155', '八里区', '711100', '八里', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '1');
INSERT INTO `areas` VALUES ('711156', '淡水区', '711100', '淡水', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '3');
INSERT INTO `areas` VALUES ('711157', '三芝区', '711100', '三芝', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '13');
INSERT INTO `areas` VALUES ('711158', '石门区', '711100', '石门', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711100', '17');
INSERT INTO `areas` VALUES ('711200', '宜兰县', '710000', '宜兰', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '20');
INSERT INTO `areas` VALUES ('711214', '宜兰市', '711200', '宜兰', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711200', '12');
INSERT INTO `areas` VALUES ('711215', '头城镇', '711200', '头城', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711200', '10');
INSERT INTO `areas` VALUES ('711216', '礁溪乡', '711200', '礁溪', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711200', '5');
INSERT INTO `areas` VALUES ('711217', '壮围乡', '711200', '壮围', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711200', '4');
INSERT INTO `areas` VALUES ('711218', '员山乡', '711200', '员山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711200', '13');
INSERT INTO `areas` VALUES ('711219', '罗东镇', '711200', '罗东', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711200', '6');
INSERT INTO `areas` VALUES ('711220', '三星乡', '711200', '三星', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711200', '8');
INSERT INTO `areas` VALUES ('711221', '大同乡', '711200', '大同', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711200', '1');
INSERT INTO `areas` VALUES ('711222', '五结乡', '711200', '五结', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711200', '11');
INSERT INTO `areas` VALUES ('711223', '冬山乡', '711200', '冬山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711200', '3');
INSERT INTO `areas` VALUES ('711224', '苏澳镇', '711200', '苏澳', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711200', '9');
INSERT INTO `areas` VALUES ('711225', '南澳乡', '711200', '南澳', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711200', '7');
INSERT INTO `areas` VALUES ('711226', '钓鱼台', '711200', '钓鱼', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711200', '2');
INSERT INTO `areas` VALUES ('711300', '新竹县', '710000', '新竹', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '19');
INSERT INTO `areas` VALUES ('711314', '竹北市', '711300', '竹北', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711300', '8');
INSERT INTO `areas` VALUES ('711315', '湖口乡', '711300', '湖口', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711300', '7');
INSERT INTO `areas` VALUES ('711316', '新丰乡', '711300', '新丰', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711300', '11');
INSERT INTO `areas` VALUES ('711317', '新埔镇', '711300', '新埔', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711300', '12');
INSERT INTO `areas` VALUES ('711318', '关西镇', '711300', '关西', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711300', '5');
INSERT INTO `areas` VALUES ('711319', '芎林乡', '711300', '芎林', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711300', '3');
INSERT INTO `areas` VALUES ('711320', '宝山乡', '711300', '宝山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711300', '1');
INSERT INTO `areas` VALUES ('711321', '竹东镇', '711300', '竹东', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711300', '9');
INSERT INTO `areas` VALUES ('711322', '五峰乡', '711300', '五峰', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711300', '13');
INSERT INTO `areas` VALUES ('711323', '横山乡', '711300', '横山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711300', '6');
INSERT INTO `areas` VALUES ('711324', '尖石乡', '711300', '尖石', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711300', '10');
INSERT INTO `areas` VALUES ('711325', '北埔乡', '711300', '北埔', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711300', '2');
INSERT INTO `areas` VALUES ('711326', '峨眉乡', '711300', '峨眉', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711300', '4');
INSERT INTO `areas` VALUES ('711400', '桃园县', '710000', '桃园', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '16');
INSERT INTO `areas` VALUES ('711414', '中坜市', '711400', '中坜', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711400', '7');
INSERT INTO `areas` VALUES ('711415', '平镇市', '711400', '平镇', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711400', '10');
INSERT INTO `areas` VALUES ('711416', '龙潭乡', '711400', '龙潭', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711400', '8');
INSERT INTO `areas` VALUES ('711417', '杨梅市', '711400', '杨梅', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711400', '13');
INSERT INTO `areas` VALUES ('711418', '新屋乡', '711400', '新屋', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711400', '11');
INSERT INTO `areas` VALUES ('711419', '观音乡', '711400', '观音', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711400', '5');
INSERT INTO `areas` VALUES ('711420', '桃园市', '711400', '桃园', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711400', '12');
INSERT INTO `areas` VALUES ('711421', '龟山乡', '711400', '龟山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711400', '6');
INSERT INTO `areas` VALUES ('711422', '八德市', '711400', '八德', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711400', '1');
INSERT INTO `areas` VALUES ('711423', '大溪镇', '711400', '大溪', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711400', '2');
INSERT INTO `areas` VALUES ('711424', '复兴乡', '711400', '复兴', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711400', '4');
INSERT INTO `areas` VALUES ('711425', '大园乡', '711400', '大园', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711400', '3');
INSERT INTO `areas` VALUES ('711426', '芦竹乡', '711400', '芦竹', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711400', '9');
INSERT INTO `areas` VALUES ('711500', '苗栗县', '710000', '苗栗', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '8');
INSERT INTO `areas` VALUES ('711519', '竹南镇', '711500', '竹南', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '4');
INSERT INTO `areas` VALUES ('711520', '头份镇', '711500', '头份', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '15');
INSERT INTO `areas` VALUES ('711521', '三湾乡', '711500', '三湾', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '8');
INSERT INTO `areas` VALUES ('711522', '南庄乡', '711500', '南庄', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '7');
INSERT INTO `areas` VALUES ('711523', '狮潭乡', '711500', '狮潭', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '10');
INSERT INTO `areas` VALUES ('711524', '后龙镇', '711500', '后龙', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '3');
INSERT INTO `areas` VALUES ('711525', '通霄镇', '711500', '通霄', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '14');
INSERT INTO `areas` VALUES ('711526', '苑里镇', '711500', '苑里', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '17');
INSERT INTO `areas` VALUES ('711527', '苗栗市', '711500', '苗栗', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '6');
INSERT INTO `areas` VALUES ('711528', '造桥乡', '711500', '造桥', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '18');
INSERT INTO `areas` VALUES ('711529', '头屋乡', '711500', '头屋', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '16');
INSERT INTO `areas` VALUES ('711530', '公馆乡', '711500', '公馆', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '2');
INSERT INTO `areas` VALUES ('711531', '大湖乡', '711500', '大湖', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '1');
INSERT INTO `areas` VALUES ('711532', '泰安乡', '711500', '泰安', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '12');
INSERT INTO `areas` VALUES ('711533', '铜锣乡', '711500', '铜锣', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '13');
INSERT INTO `areas` VALUES ('711534', '三义乡', '711500', '三义', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '9');
INSERT INTO `areas` VALUES ('711535', '西湖乡', '711500', '西湖', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '11');
INSERT INTO `areas` VALUES ('711536', '卓兰镇', '711500', '卓兰', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711500', '5');
INSERT INTO `areas` VALUES ('711700', '彰化县', '710000', '彰化', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '22');
INSERT INTO `areas` VALUES ('711727', '彰化市', '711700', '彰化', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '11');
INSERT INTO `areas` VALUES ('711728', '芬园乡', '711700', '芬园', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '7');
INSERT INTO `areas` VALUES ('711729', '花坛乡', '711700', '花坛', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '10');
INSERT INTO `areas` VALUES ('711730', '秀水乡', '711700', '秀水', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '22');
INSERT INTO `areas` VALUES ('711731', '鹿港镇', '711700', '鹿港', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '13');
INSERT INTO `areas` VALUES ('711732', '福兴乡', '711700', '福兴', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '8');
INSERT INTO `areas` VALUES ('711733', '线西乡', '711700', '线西', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '19');
INSERT INTO `areas` VALUES ('711734', '和美镇', '711700', '和美', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '9');
INSERT INTO `areas` VALUES ('711735', '伸港乡', '711700', '伸港', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '17');
INSERT INTO `areas` VALUES ('711736', '员林镇', '711700', '员林', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '26');
INSERT INTO `areas` VALUES ('711737', '社头乡', '711700', '社头', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '18');
INSERT INTO `areas` VALUES ('711738', '永靖乡', '711700', '永靖', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '25');
INSERT INTO `areas` VALUES ('711739', '埔心乡', '711700', '埔心', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '15');
INSERT INTO `areas` VALUES ('711740', '溪湖镇', '711700', '溪湖', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '20');
INSERT INTO `areas` VALUES ('711741', '大村乡', '711700', '大村', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '3');
INSERT INTO `areas` VALUES ('711742', '埔盐乡', '711700', '埔盐', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '16');
INSERT INTO `areas` VALUES ('711743', '田中镇', '711700', '田中', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '23');
INSERT INTO `areas` VALUES ('711744', '北斗镇', '711700', '北斗', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '1');
INSERT INTO `areas` VALUES ('711745', '田尾乡', '711700', '田尾', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '24');
INSERT INTO `areas` VALUES ('711746', '埤头乡', '711700', '埤头', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '14');
INSERT INTO `areas` VALUES ('711747', '溪州乡', '711700', '溪州', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '21');
INSERT INTO `areas` VALUES ('711748', '竹塘乡', '711700', '竹塘', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '12');
INSERT INTO `areas` VALUES ('711749', '二林镇', '711700', '二林', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '4');
INSERT INTO `areas` VALUES ('711750', '大城乡', '711700', '大城', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '2');
INSERT INTO `areas` VALUES ('711751', '芳苑乡', '711700', '芳苑', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '6');
INSERT INTO `areas` VALUES ('711752', '二水乡', '711700', '二水', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711700', '5');
INSERT INTO `areas` VALUES ('711900', '嘉义县', '710000', '嘉义', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '4');
INSERT INTO `areas` VALUES ('711919', '番路乡', '711900', '番路', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '7');
INSERT INTO `areas` VALUES ('711920', '梅山乡', '711900', '梅山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '11');
INSERT INTO `areas` VALUES ('711921', '竹崎乡', '711900', '竹崎', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '9');
INSERT INTO `areas` VALUES ('711922', '阿里山乡', '711900', '阿里山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '1');
INSERT INTO `areas` VALUES ('711923', '中埔乡', '711900', '中埔', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '8');
INSERT INTO `areas` VALUES ('711924', '大埔乡', '711900', '大埔', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '5');
INSERT INTO `areas` VALUES ('711925', '水上乡', '711900', '水上', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '14');
INSERT INTO `areas` VALUES ('711926', '鹿草乡', '711900', '鹿草', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '2');
INSERT INTO `areas` VALUES ('711927', '太保市', '711900', '太保', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '17');
INSERT INTO `areas` VALUES ('711928', '朴子市', '711900', '朴子', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '13');
INSERT INTO `areas` VALUES ('711929', '东石乡', '711900', '东石', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '6');
INSERT INTO `areas` VALUES ('711930', '六脚乡', '711900', '六脚', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '10');
INSERT INTO `areas` VALUES ('711931', '新港乡', '711900', '新港', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '16');
INSERT INTO `areas` VALUES ('711932', '民雄乡', '711900', '民雄', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '12');
INSERT INTO `areas` VALUES ('711933', '大林镇', '711900', '大林', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '4');
INSERT INTO `areas` VALUES ('711934', '溪口乡', '711900', '溪口', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '15');
INSERT INTO `areas` VALUES ('711935', '义竹乡', '711900', '义竹', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '18');
INSERT INTO `areas` VALUES ('711936', '布袋镇', '711900', '布袋', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_711900', '3');
INSERT INTO `areas` VALUES ('712100', '云林县', '710000', '云林', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '21');
INSERT INTO `areas` VALUES ('712121', '斗南镇', '712100', '斗南', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '7');
INSERT INTO `areas` VALUES ('712122', '大埤乡', '712100', '大埤', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '4');
INSERT INTO `areas` VALUES ('712123', '虎尾镇', '712100', '虎尾', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '10');
INSERT INTO `areas` VALUES ('712124', '土库镇', '712100', '土库', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '19');
INSERT INTO `areas` VALUES ('712125', '褒忠乡', '712100', '褒忠', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '1');
INSERT INTO `areas` VALUES ('712126', '东势乡', '712100', '东势', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '5');
INSERT INTO `areas` VALUES ('712127', '台西乡', '712100', '台西', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '18');
INSERT INTO `areas` VALUES ('712128', '仑背乡', '712100', '仑背', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '13');
INSERT INTO `areas` VALUES ('712129', '麦寮乡', '712100', '麦寮', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '14');
INSERT INTO `areas` VALUES ('712130', '斗六市', '712100', '斗六', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '6');
INSERT INTO `areas` VALUES ('712131', '林内乡', '712100', '林内', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '12');
INSERT INTO `areas` VALUES ('712132', '古坑乡', '712100', '古坑', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '9');
INSERT INTO `areas` VALUES ('712133', '莿桐乡', '712100', '莿桐', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '3');
INSERT INTO `areas` VALUES ('712134', '西螺镇', '712100', '西螺', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '17');
INSERT INTO `areas` VALUES ('712135', '二仑乡', '712100', '二仑', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '8');
INSERT INTO `areas` VALUES ('712136', '北港镇', '712100', '北港', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '2');
INSERT INTO `areas` VALUES ('712137', '水林乡', '712100', '水林', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '15');
INSERT INTO `areas` VALUES ('712138', '口湖乡', '712100', '口湖', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '11');
INSERT INTO `areas` VALUES ('712139', '四湖乡', '712100', '四湖', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '16');
INSERT INTO `areas` VALUES ('712140', '元长乡', '712100', '元长', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712100', '20');
INSERT INTO `areas` VALUES ('712400', '屏东县', '710000', '屏东', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '11');
INSERT INTO `areas` VALUES ('712434', '屏东市', '712400', '屏东', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '24');
INSERT INTO `areas` VALUES ('712435', '三地门乡', '712400', '三地门', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '25');
INSERT INTO `areas` VALUES ('712436', '雾台乡', '712400', '雾台', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '32');
INSERT INTO `areas` VALUES ('712437', '玛家乡', '712400', '玛家', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '19');
INSERT INTO `areas` VALUES ('712438', '九如乡', '712400', '九如', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '12');
INSERT INTO `areas` VALUES ('712439', '里港乡', '712400', '里港', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '15');
INSERT INTO `areas` VALUES ('712440', '高树乡', '712400', '高树', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '8');
INSERT INTO `areas` VALUES ('712441', '盐埔乡', '712400', '盐埔', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '33');
INSERT INTO `areas` VALUES ('712442', '长治乡', '712400', '长治', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '1');
INSERT INTO `areas` VALUES ('712443', '麟洛乡', '712400', '麟洛', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '17');
INSERT INTO `areas` VALUES ('712444', '竹田乡', '712400', '竹田', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '10');
INSERT INTO `areas` VALUES ('712445', '内埔乡', '712400', '内埔', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '23');
INSERT INTO `areas` VALUES ('712446', '万丹乡', '712400', '万丹', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '30');
INSERT INTO `areas` VALUES ('712447', '潮州镇', '712400', '潮州', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '2');
INSERT INTO `areas` VALUES ('712448', '泰武乡', '712400', '泰武', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '29');
INSERT INTO `areas` VALUES ('712449', '来义乡', '712400', '来义', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '14');
INSERT INTO `areas` VALUES ('712450', '万峦乡', '712400', '万峦', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '31');
INSERT INTO `areas` VALUES ('712451', '崁顶乡', '712400', '崁顶', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '13');
INSERT INTO `areas` VALUES ('712452', '新埤乡', '712400', '新埤', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '27');
INSERT INTO `areas` VALUES ('712453', '南州乡', '712400', '南州', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '22');
INSERT INTO `areas` VALUES ('712454', '林边乡', '712400', '林边', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '16');
INSERT INTO `areas` VALUES ('712455', '东港镇', '712400', '东港', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '5');
INSERT INTO `areas` VALUES ('712456', '琉球乡', '712400', '琉球', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '18');
INSERT INTO `areas` VALUES ('712457', '佳冬乡', '712400', '佳冬', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '11');
INSERT INTO `areas` VALUES ('712458', '新园乡', '712400', '新园', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '28');
INSERT INTO `areas` VALUES ('712459', '枋寮乡', '712400', '枋寮', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '6');
INSERT INTO `areas` VALUES ('712460', '枋山乡', '712400', '枋山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '7');
INSERT INTO `areas` VALUES ('712461', '春日乡', '712400', '春日', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '4');
INSERT INTO `areas` VALUES ('712462', '狮子乡', '712400', '狮子', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '26');
INSERT INTO `areas` VALUES ('712463', '车城乡', '712400', '车城', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '3');
INSERT INTO `areas` VALUES ('712464', '牡丹乡', '712400', '牡丹', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '21');
INSERT INTO `areas` VALUES ('712465', '恒春镇', '712400', '恒春', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '9');
INSERT INTO `areas` VALUES ('712466', '满州乡', '712400', '满州', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712400', '20');
INSERT INTO `areas` VALUES ('712500', '台东县', '710000', '台东', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '13');
INSERT INTO `areas` VALUES ('712517', '台东市', '712500', '台东', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '14');
INSERT INTO `areas` VALUES ('712518', '绿岛乡', '712500', '绿岛', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '13');
INSERT INTO `areas` VALUES ('712519', '兰屿乡', '712500', '兰屿', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '11');
INSERT INTO `areas` VALUES ('712520', '延平乡', '712500', '延平', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '16');
INSERT INTO `areas` VALUES ('712521', '卑南乡', '712500', '卑南', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '1');
INSERT INTO `areas` VALUES ('712522', '鹿野乡', '712500', '鹿野', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '12');
INSERT INTO `areas` VALUES ('712523', '关山镇', '712500', '关山', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '8');
INSERT INTO `areas` VALUES ('712524', '海端乡', '712500', '海端', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '9');
INSERT INTO `areas` VALUES ('712525', '池上乡', '712500', '池上', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '4');
INSERT INTO `areas` VALUES ('712526', '东河乡', '712500', '东河', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '7');
INSERT INTO `areas` VALUES ('712527', '成功镇', '712500', '成功', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '3');
INSERT INTO `areas` VALUES ('712528', '长滨乡', '712500', '长滨', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '2');
INSERT INTO `areas` VALUES ('712529', '金峰乡', '712500', '金峰', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '10');
INSERT INTO `areas` VALUES ('712530', '大武乡', '712500', '大武', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '6');
INSERT INTO `areas` VALUES ('712531', '达仁乡', '712500', '达仁', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '5');
INSERT INTO `areas` VALUES ('712532', '太麻里乡', '712500', '太麻里', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712500', '15');
INSERT INTO `areas` VALUES ('712600', '花莲县', '710000', '花莲', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '2');
INSERT INTO `areas` VALUES ('712615', '花莲市', '712600', '花莲', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712600', '5');
INSERT INTO `areas` VALUES ('712616', '新城乡', '712600', '新城', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712600', '10');
INSERT INTO `areas` VALUES ('712617', '太鲁阁', '712600', '太鲁', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712600', '12');
INSERT INTO `areas` VALUES ('712618', '秀林乡', '712600', '秀林', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712600', '11');
INSERT INTO `areas` VALUES ('712619', '吉安乡', '712600', '吉安', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712600', '7');
INSERT INTO `areas` VALUES ('712620', '寿丰乡', '712600', '寿丰', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712600', '9');
INSERT INTO `areas` VALUES ('712621', '凤林镇', '712600', '凤林', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712600', '2');
INSERT INTO `areas` VALUES ('712622', '光复乡', '712600', '光复', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712600', '4');
INSERT INTO `areas` VALUES ('712623', '丰滨乡', '712600', '丰滨', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712600', '1');
INSERT INTO `areas` VALUES ('712624', '瑞穗乡', '712600', '瑞穗', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712600', '8');
INSERT INTO `areas` VALUES ('712625', '万荣乡', '712600', '万荣', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712600', '13');
INSERT INTO `areas` VALUES ('712626', '玉里镇', '712600', '玉里', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712600', '14');
INSERT INTO `areas` VALUES ('712627', '卓溪乡', '712600', '卓溪', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712600', '6');
INSERT INTO `areas` VALUES ('712628', '富里乡', '712600', '富里', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712600', '3');
INSERT INTO `areas` VALUES ('712700', '澎湖县', '710000', '澎湖', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '10');
INSERT INTO `areas` VALUES ('712707', '马公市', '712700', '马公', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712700', '4');
INSERT INTO `areas` VALUES ('712708', '西屿乡', '712700', '西屿', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712700', '5');
INSERT INTO `areas` VALUES ('712709', '望安乡', '712700', '望安', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712700', '6');
INSERT INTO `areas` VALUES ('712710', '七美乡', '712700', '七美', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712700', '2');
INSERT INTO `areas` VALUES ('712711', '白沙乡', '712700', '白沙', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712700', '1');
INSERT INTO `areas` VALUES ('712712', '湖西乡', '712700', '湖西', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712700', '3');
INSERT INTO `areas` VALUES ('712800', '连江县', '710000', '连江', '121.509064', '25.044333', '2', 'tr_0 tr_710000', '7');
INSERT INTO `areas` VALUES ('712805', '南竿乡', '712800', '南竿', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712800', '4');
INSERT INTO `areas` VALUES ('712806', '北竿乡', '712800', '北竿', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712800', '1');
INSERT INTO `areas` VALUES ('712807', '莒光乡', '712800', '莒光', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712800', '3');
INSERT INTO `areas` VALUES ('712808', '东引乡', '712800', '东引', '121.509064', '25.044333', '3', 'tr_0 tr_710000 tr_712800', '2');
INSERT INTO `areas` VALUES ('810000', '香港特别行政区', '1', '香港', '114.173355', '22.320047', '1', 'tr_0', '32');
INSERT INTO `areas` VALUES ('810100', '香港岛', '810000', '香港岛', '114.173355', '22.320047', '2', 'tr_0 tr_810000', '2');
INSERT INTO `areas` VALUES ('810101', '中西区', '810100', '中西', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810100', '4');
INSERT INTO `areas` VALUES ('810102', '湾仔', '810100', '湾仔', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810100', '3');
INSERT INTO `areas` VALUES ('810103', '东区', '810100', '东区', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810100', '1');
INSERT INTO `areas` VALUES ('810104', '南区', '810100', '南区', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810100', '2');
INSERT INTO `areas` VALUES ('810200', '九龙', '810000', '九龙', '114.173355', '22.320047', '2', 'tr_0 tr_810000', '1');
INSERT INTO `areas` VALUES ('810201', '九龙城区', '810200', '九龙城', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810200', '3');
INSERT INTO `areas` VALUES ('810202', '油尖旺区', '810200', '油尖旺', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810200', '5');
INSERT INTO `areas` VALUES ('810203', '深水埗区', '810200', '深水埗', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810200', '4');
INSERT INTO `areas` VALUES ('810204', '黄大仙区', '810200', '黄大仙', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810200', '2');
INSERT INTO `areas` VALUES ('810205', '观塘区', '810200', '观塘', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810200', '1');
INSERT INTO `areas` VALUES ('810300', '新界', '810000', '新界', '114.173355', '22.320047', '2', 'tr_0 tr_810000', '3');
INSERT INTO `areas` VALUES ('810301', '北区', '810300', '北区', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810300', '1');
INSERT INTO `areas` VALUES ('810302', '大埔区', '810300', '大埔', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810300', '2');
INSERT INTO `areas` VALUES ('810303', '沙田区', '810300', '沙田', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810300', '6');
INSERT INTO `areas` VALUES ('810304', '西贡区', '810300', '西贡', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810300', '8');
INSERT INTO `areas` VALUES ('810305', '元朗区', '810300', '元朗', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810300', '9');
INSERT INTO `areas` VALUES ('810306', '屯门区', '810300', '屯门', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810300', '7');
INSERT INTO `areas` VALUES ('810307', '荃湾区', '810300', '荃湾', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810300', '5');
INSERT INTO `areas` VALUES ('810308', '葵青区', '810300', '葵青', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810300', '3');
INSERT INTO `areas` VALUES ('810309', '离岛区', '810300', '离岛', '114.173355', '22.320047', '3', 'tr_0 tr_810000 tr_810300', '4');
INSERT INTO `areas` VALUES ('820000', '澳门特别行政区', '1', '澳门', '113.549088', '22.198952', '1', 'tr_0', '33');
INSERT INTO `areas` VALUES ('820100', '澳门半岛', '820000', '澳门半岛', '113.549133', '22.198751', '2', 'tr_0 tr_820000', '1');
INSERT INTO `areas` VALUES ('820200', '离岛', '820000', '离岛', '113.549088', '22.198952', '2', 'tr_0 tr_820000', '2');

-- ----------------------------
-- Table structure for banner_categories
-- ----------------------------
DROP TABLE IF EXISTS `banner_categories`;
CREATE TABLE `banner_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` int(11) DEFAULT '0',
  `height` int(11) DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of banner_categories
-- ----------------------------

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'url类型1：自定义链接，2：常用链接（首页、用户中心），3：文章分类（新闻、音乐），4：文章详情',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '例如：https://www.baidu.com，/article/1.html',
  `cover_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `deadline` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of banners
-- ----------------------------

-- ----------------------------
-- Table structure for brokes
-- ----------------------------
DROP TABLE IF EXISTS `brokes`;
CREATE TABLE `brokes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_ids` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of brokes
-- ----------------------------

-- ----------------------------
-- Table structure for bugs
-- ----------------------------
DROP TABLE IF EXISTS `bugs`;
CREATE TABLE `bugs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_ids` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of bugs
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) DEFAULT '0',
  `cover_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类缩略名',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分类描述',
  `count` int(11) DEFAULT '0' COMMENT '分类数量',
  `index_tpl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lists_tpl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `detail_tpl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `page_num` int(11) NOT NULL DEFAULT '10' COMMENT '分页数量',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ARTICLE' COMMENT '分类类型（ARTICLE/GOODS/STORE/TAG等）',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '0', '新闻', '0', '0', 'news', '新闻中心,包含有时政新闻、国内新闻、国际新闻、社会新闻、时事评论、新闻图片、新闻专题、新闻论坛、军事、历史、的专业时事报道门户网站。', '0', 'article/index', 'article/lists', 'article/detail', '10', '1', 'ARTICLE', '2019-09-09 15:56:53', '2019-09-09 15:56:53', null);
INSERT INTO `categories` VALUES ('2', '0', '商城', '0', '0', 'mall', '商品中心', '0', 'goods/index', 'goods/lists', 'goods/detail', '10', '1', 'GOODS', '2019-09-09 15:56:53', '2019-09-09 15:56:53', null);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `uid` int(11) NOT NULL,
  `object_id` int(11) NOT NULL COMMENT '评论对象的id（article/page/order等的id）',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_ids` text COLLATE utf8mb4_unicode_ci COMMENT '晒图',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ARTICLE' COMMENT '评论类型（ARTICLE/PAGE/ORDER等）',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ding` int(11) DEFAULT '0' COMMENT '顶',
  `cai` int(11) DEFAULT '0' COMMENT '踩',
  `report` tinyint(4) DEFAULT '0' COMMENT '举报（1：淫秽色情，2：垃圾广告，3：违法信息，4：其他）',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `rate` tinyint(4) DEFAULT '0' COMMENT '评分（1，2，3，4，5）',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for configs
-- ----------------------------
DROP TABLE IF EXISTS `configs`;
CREATE TABLE `configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `remark` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of configs
-- ----------------------------
INSERT INTO `configs` VALUES ('1', '网站名称', 'text', 'WEB_SITE_NAME', '基本', 'FullStack', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('2', '关键字', 'text', 'WEB_SITE_KEYWORDS', '基本', 'FullStack', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('3', '描述', 'textarea', 'WEB_SITE_DESCRIPTION', '基本', 'FullStack', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('4', 'Logo', 'picture', 'WEB_SITE_LOGO', '基本', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('5', '统计代码', 'textarea', 'WEB_SITE_SCRIPT', '基本', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('6', '网站版权', 'text', 'WEB_SITE_COPYRIGHT', '基本', '© Company 2018', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('7', '开启SSL', 'switch', 'SSL_OPEN', '基本', '0', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('8', '开启网站', 'switch', 'WEB_SITE_OPEN', '基本', '1', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('9', '服务器地址', 'text', 'EMAIL_HOST', '邮件', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('10', '服务器端口', 'text', 'EMAIL_PORT', '邮件', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('11', '发件人邮箱', 'text', 'EMAIL_USERNAME', '邮件', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('12', '发件人密码', 'text', 'EMAIL_PASSWORD', '邮件', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('13', 'AppKey', 'text', 'ALIDAYU_APP_KEY', '阿里云通信', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('14', 'AppSecret', 'text', 'ALIDAYU_APP_SECRET', '阿里云通信', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('15', '签名', 'text', 'ALIDAYU_SIGNNAME', '阿里云通信', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('16', '模板代码', 'text', 'ALIDAYU_TEMPLATE_CODE', '阿里云通信', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('17', 'KeyID', 'text', 'OSS_ACCESS_KEY_ID', '阿里云存储', '', '你的AccessKeyID', '1', null, null, null);
INSERT INTO `configs` VALUES ('18', 'KeySecret', 'text', 'OSS_ACCESS_KEY_SECRET', '阿里云存储', '', '你的AccessKeySecret', '1', null, null, null);
INSERT INTO `configs` VALUES ('19', 'EndPoint', 'text', 'OSS_ENDPOINT', '阿里云存储', '', '地域节点', '1', null, null, null);
INSERT INTO `configs` VALUES ('20', 'Bucket域名', 'text', 'OSS_BUCKET', '阿里云存储', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('21', '自定义域名', 'text', 'OSS_MYDOMAIN', '阿里云存储', '', '例如：oss.web.com', '1', null, null, null);
INSERT INTO `configs` VALUES ('22', '开启云存储', 'switch', 'OSS_OPEN', '阿里云存储', '0', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('23', '用户ID', 'text', 'SIOO_UID', '希奥短信', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('24', '企业代码', 'text', 'SIOO_CODE', '希奥短信', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('25', '用户密码', 'text', 'SIOO_PASSWORD', '希奥短信', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('26', '开发者ID', 'text', 'WECHAT_PAY_APP_ID', '微信支付', '', 'AppID（JSAPI支付授权目录，例如：http://www.web.com/wechat/wechat/）', '1', null, null, null);
INSERT INTO `configs` VALUES ('27', '商户号', 'text', 'WECHAT_PAY_MERCHANTID', '微信支付', '', '商户平台（商户号）', '1', null, null, null);
INSERT INTO `configs` VALUES ('28', 'API密钥', 'text', 'WECHAT_PAY_KEY', '微信支付', '', '商户平台（API密钥）', '1', null, null, null);
INSERT INTO `configs` VALUES ('29', '商户证书', 'file', 'WECHAT_PAY_APICLIENT_CERT', '微信支付', '', 'apiclient_cert.pem', '1', null, null, null);
INSERT INTO `configs` VALUES ('30', '证书密钥', 'file', 'WECHAT_PAY_APICLIENT_KEY', '微信支付', '', 'apiclient_key.pem', '1', null, null, null);
INSERT INTO `configs` VALUES ('31', '开发者ID', 'text', 'WECHAT_APP_PAY_APP_ID', '微信APP支付', '', 'AppID（需要在开放平台申请）', '1', null, null, null);
INSERT INTO `configs` VALUES ('32', '商户号', 'text', 'WECHAT_APP_PAY_MERCHANTID', '微信APP支付', '', '商户平台（商户号）', '1', null, null, null);
INSERT INTO `configs` VALUES ('33', 'API密钥', 'text', 'WECHAT_APP_PAY_KEY', '微信APP支付', '', '商户平台（API密钥）', '1', null, null, null);
INSERT INTO `configs` VALUES ('34', '商户证书', 'file', 'WECHAT_APP_PAY_APICLIENT_CERT', '微信APP支付', '', 'apiclient_cert.pem', '1', null, null, null);
INSERT INTO `configs` VALUES ('35', '证书密钥', 'file', 'WECHAT_APP_PAY_APICLIENT_KEY', '微信APP支付', '', 'apiclient_key.pem', '1', null, null, null);
INSERT INTO `configs` VALUES ('36', '签名类型', 'text', 'ALIPAY_SIGN_TYPE', '支付宝', 'RSA2', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('37', '应用ID', 'text', 'ALIPAY_APP_ID', '支付宝', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('38', '商户私钥', 'textarea', 'ALIPAY_PRIVATE_KEY', '支付宝', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('39', '支付宝公钥', 'textarea', 'ALIPAY_PUBLIC_KEY', '支付宝', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('40', '开发者ID', 'text', 'WECHAT_DYH_APPID', '微信订阅号', '', 'AppID', '1', null, null, null);
INSERT INTO `configs` VALUES ('41', '开发者密码', 'text', 'WECHAT_DYH_APPSECRET', '微信订阅号', '', 'AppSecret', '1', null, null, null);
INSERT INTO `configs` VALUES ('42', '令牌', 'text', 'WECHAT_DYH_TOKEN', '微信订阅号', '', 'Token（服务器地址：https://website.com/wechat/server/token?type=dyh）', '1', null, null, null);
INSERT INTO `configs` VALUES ('43', '消息密钥', 'textarea', 'WECHAT_DYH_ENCODINGAESKEY', '微信订阅号', '', 'EncodingAESKey', '1', null, null, null);
INSERT INTO `configs` VALUES ('44', '开发者ID', 'text', 'WECHAT_FWH_APPID', '微信服务号', '', 'AppID', '1', null, null, null);
INSERT INTO `configs` VALUES ('45', '开发者密码', 'text', 'WECHAT_FWH_APPSECRET', '微信服务号', '', 'AppSecret', '1', null, null, null);
INSERT INTO `configs` VALUES ('46', '令牌', 'text', 'WECHAT_FWH_TOKEN', '微信服务号', '', 'Token（服务器地址：https://website.com/wechat/server/token?type=fwh）', '1', null, null, null);
INSERT INTO `configs` VALUES ('47', '消息密钥', 'textarea', 'WECHAT_FWH_ENCODINGAESKEY', '微信服务号', '', 'EncodingAESKey', '1', null, null, null);
INSERT INTO `configs` VALUES ('48', '开发者ID', 'text', 'WECHAT_MP_APPID', '微信小程序', '', 'AppID', '1', null, null, null);
INSERT INTO `configs` VALUES ('49', '开发者密码', 'text', 'WECHAT_MP_APPSECRET', '微信小程序', '', 'AppSecret', '1', null, null, null);
INSERT INTO `configs` VALUES ('50', '开发者模式', 'switch', 'APP_DEBUG', '基本', '1', '', '1', null, null, null);

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件大小',
  `path` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '路径',
  `md5` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'md5唯一标识',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of files
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned DEFAULT NULL COMMENT '商家ID',
  `goods_category_id` int(11) DEFAULT NULL COMMENT '商品主分类',
  `shop_self_category_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家商品分类',
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签',
  `goods_mode` tinyint(4) DEFAULT NULL,
  `goods_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关键字',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `pricing_mode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '计价方式1：计件，2：计重',
  `goods_unit_id` tinyint(4) DEFAULT NULL COMMENT '商品单位：件，kg',
  `goods_brand_id` int(11) DEFAULT NULL COMMENT '品牌ID',
  `goods_attrs` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '平台系统属性',
  `other_attrs` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家自定义属性',
  `goods_moq` int(11) DEFAULT NULL COMMENT '最小起订量',
  `goods_price` decimal(10,2) DEFAULT NULL COMMENT '店铺价:价格必须是0.01~9999999之间的数字，且不能高于市场价',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价:为0则商品详情页不显示，价格必须是0.00~9999999之间的数字，此价格仅为市场参考售价，请根据该实际情况认真填写',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT '成本价:价格必须是0.00~9999999之间的数字，此价格为商户对所销售的商品实际成本价格进行备注记录',
  `stock_num` int(11) DEFAULT NULL COMMENT '商品库存,店铺库存数量必须为0~999999999之间的整数，若商品存在规格，则系统自动计算商品的总数，此处无需卖家填写',
  `warn_num` int(11) DEFAULT NULL COMMENT '设置最低库存预警值。当库存低于预警值时商家中心商品列表页库存列红字提醒，0为不预警',
  `goods_sn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品货号是指商家管理商品的编号，买家不可见',
  `goods_barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支持一品多码，多个条形码之间用逗号分隔',
  `goods_stockcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '实体仓库存储商品位置编码',
  `cover_id` int(11) DEFAULT NULL COMMENT '上传商品默认主图，无规格主图时展示该图',
  `video_id` int(11) DEFAULT NULL COMMENT '主图视频',
  `pc_content` longtext COLLATE utf8mb4_unicode_ci COMMENT '电脑端商品详情',
  `mobile_content` longtext COLLATE utf8mb4_unicode_ci COMMENT '手机端商品详情',
  `top_layout_id` int(11) DEFAULT NULL COMMENT '详情页顶部模板',
  `bottom_layout_id` int(11) DEFAULT NULL COMMENT '详情页底部模板',
  `packing_layout_id` int(11) DEFAULT NULL COMMENT '详情页包装清单版式',
  `service_layout_id` int(11) DEFAULT NULL COMMENT '详情页售后保证版式',
  `goods_weight` double DEFAULT NULL COMMENT '物流重量，商品的重量单位为千克，如果商品的运费模板按照重量计算请填写此项，为空则默认商品重量为0Kg；',
  `goods_volume` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的体积单位为立方米，如果商品的运费模板按照体积计算请填写此项，为空则默认商品体积为0立方米；',
  `goods_freight_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '运费类型 0：店铺承担运费 ，1：运费模板',
  `freight_id` int(11) DEFAULT NULL COMMENT '运费模板id',
  `invoice_type` tinyint(4) DEFAULT NULL COMMENT '发票：0无，1增值税普通发票，2增值税专用发票，3 增值税普通发票 和 增值税专用发票，选择“无”则将不提供发票',
  `user_discount` tinyint(4) DEFAULT NULL COMMENT '会员打折：0 不参与会员打折，1参与会员打折，指的是统一的会员折扣是否参与，参与和不参与会员折扣不影响自定义会员价',
  `stock_mode` tinyint(4) DEFAULT NULL COMMENT '库存计数：1拍下减库存，2付款减库存，3出库减库存 拍下减库存：买家拍下商品即减少库存，存在恶拍风险。热销商品如需避免超卖可选此方式',
  `comment` int(11) DEFAULT NULL COMMENT '评论数量',
  `view` int(11) DEFAULT NULL COMMENT '浏览数量',
  `sales_num` int(11) DEFAULT NULL COMMENT '销量',
  `fake_sales_num` int(11) DEFAULT NULL COMMENT '虚拟销量',
  `comment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1出售中，2审核中，3已下架，4商品违规下架',
  `goods_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '违规下架原因',
  `opened_at` timestamp NULL DEFAULT NULL COMMENT '开放销售时间',
  `closed_at` timestamp NULL DEFAULT NULL COMMENT '开放销售时间',
  `is_sku` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for goods_attribute_alias
-- ----------------------------
DROP TABLE IF EXISTS `goods_attribute_alias`;
CREATE TABLE `goods_attribute_alias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_attribute_id` int(11) DEFAULT NULL COMMENT '商品规格id',
  `goods_sku_id` int(11) DEFAULT NULL COMMENT '商品单元id',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规格别名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_attribute_alias
-- ----------------------------

-- ----------------------------
-- Table structure for goods_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `goods_attribute_values`;
CREATE TABLE `goods_attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_attribute_id` int(11) DEFAULT NULL COMMENT '商品属性id',
  `vname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '属性值名称',
  `sort` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_attribute_values
-- ----------------------------
INSERT INTO `goods_attribute_values` VALUES ('1', '1', '黄色', '0');
INSERT INTO `goods_attribute_values` VALUES ('2', '1', '红色', '0');
INSERT INTO `goods_attribute_values` VALUES ('3', '1', '青色', '0');
INSERT INTO `goods_attribute_values` VALUES ('4', '2', '大', '0');
INSERT INTO `goods_attribute_values` VALUES ('5', '2', '中', '0');
INSERT INTO `goods_attribute_values` VALUES ('6', '2', '小', '0');
INSERT INTO `goods_attribute_values` VALUES ('7', '3', '一尺', '0');
INSERT INTO `goods_attribute_values` VALUES ('8', '3', '二尺', '0');
INSERT INTO `goods_attribute_values` VALUES ('9', '3', '三尺', '0');
INSERT INTO `goods_attribute_values` VALUES ('10', '4', '尼龙', '0');
INSERT INTO `goods_attribute_values` VALUES ('11', '4', '丝绸', '0');
INSERT INTO `goods_attribute_values` VALUES ('12', '4', '棉', '0');

-- ----------------------------
-- Table structure for goods_attributes
-- ----------------------------
DROP TABLE IF EXISTS `goods_attributes`;
CREATE TABLE `goods_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned DEFAULT NULL COMMENT '商家id，可选',
  `goods_type_id` int(11) DEFAULT NULL COMMENT '商品类型',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '属性或规格名称',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '属性或规格描述',
  `style` tinyint(4) DEFAULT NULL COMMENT '显示样式：1多选，2单选，3文本，多选：以复选框的形式让商家勾选属性值；',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `type` tinyint(4) DEFAULT NULL COMMENT '1:spu商品属性,2:sku商品规格用于销售',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_attributes
-- ----------------------------
INSERT INTO `goods_attributes` VALUES ('1', null, '1', '颜色', '衣服颜色', '2', '0', '1', '1');
INSERT INTO `goods_attributes` VALUES ('2', null, '1', '尺寸', '衣服尺寸', '1', '0', '1', '1');
INSERT INTO `goods_attributes` VALUES ('3', null, '1', '尺寸', '尺寸', '1', '0', '1', '2');
INSERT INTO `goods_attributes` VALUES ('4', null, '1', '材质', '材质', '1', '0', '1', '2');

-- ----------------------------
-- Table structure for goods_brands
-- ----------------------------
DROP TABLE IF EXISTS `goods_brands`;
CREATE TABLE `goods_brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌名称：雅诗兰黛',
  `letter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌名称首字母',
  `site_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌网址',
  `logo` int(11) DEFAULT NULL COMMENT '品牌logo',
  `promotion_image` int(11) DEFAULT NULL COMMENT '品牌推广图',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌描述',
  `is_recommend` tinyint(4) DEFAULT NULL COMMENT '是否推荐',
  `sort` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_brands
-- ----------------------------
INSERT INTO `goods_brands` VALUES ('1', '三只松鼠', 'S', 'www.baidu.com', '1', '0', null, '1', '1', '1', '2019-09-09 16:35:11', '2019-09-09 16:35:11');

-- ----------------------------
-- Table structure for goods_categories
-- ----------------------------
DROP TABLE IF EXISTS `goods_categories`;
CREATE TABLE `goods_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) DEFAULT '0',
  `cover_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `goods_brand_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联品牌',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类缩略名',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类描述',
  `index_tpl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lists_tpl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail_tpl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_num` int(11) NOT NULL DEFAULT '10' COMMENT '分页数量',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_categories
-- ----------------------------
INSERT INTO `goods_categories` VALUES ('1', '0', '水果', '0', '0', null, 'suiguo', '水果', null, null, null, '10', '1', '2019-09-10 19:45:04', '2019-09-10 19:45:04', null);
INSERT INTO `goods_categories` VALUES ('2', '0', '衣服', '0', '0', '[]', 'yifu', '衣服', null, null, null, '10', '1', '2019-09-10 19:52:24', '2019-09-10 19:52:24', null);
INSERT INTO `goods_categories` VALUES ('3', '0', '手机', '0', '0', '[1]', 'phone', null, null, null, null, '10', '1', '2019-09-10 20:09:24', '2019-09-10 20:09:24', null);
INSERT INTO `goods_categories` VALUES ('4', '0', '蔬菜', '0', '0', '[1]', 'shucai', '蔬菜', null, null, null, '10', '-1', '2019-09-11 17:00:19', '2019-09-11 17:11:09', null);
INSERT INTO `goods_categories` VALUES ('5', '1', '蔬菜', '0', '2', 'null', 'shucai', '蔬菜b', 'a', 'b', 'c', '10', '1', '2019-09-11 17:14:37', '2019-09-26 16:12:45', null);

-- ----------------------------
-- Table structure for goods_category_attributes
-- ----------------------------
DROP TABLE IF EXISTS `goods_category_attributes`;
CREATE TABLE `goods_category_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_category_id` int(10) unsigned DEFAULT NULL COMMENT '商品分类',
  `goods_attribute_id` int(11) DEFAULT NULL COMMENT '关联属性id或规格id',
  `gorup_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分组名',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `type` int(11) DEFAULT NULL COMMENT '1:spu商品属性,2:sku商品规格用于销售',
  `is_required` tinyint(4) DEFAULT NULL COMMENT '是否必填',
  `is_filter` tinyint(4) DEFAULT NULL COMMENT '是否筛选 勾选后此属性、规格会作为筛选条件展示在前台的商品列表页的筛选区域',
  `is_alias` tinyint(4) DEFAULT NULL COMMENT '允许别名 勾选此项后，此规格的名称就可以被店铺修改，例如：平台方此规格是颜色，店铺在自己编辑时把颜色改为版本，其他店铺依旧是颜色',
  `is_desc` tinyint(4) DEFAULT NULL COMMENT '勾选此项后，店铺在编辑此规格时即可以为规格添加备注，前台鼠标经过规格时展示该备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_category_attributes
-- ----------------------------
INSERT INTO `goods_category_attributes` VALUES ('1', '3', '2', null, '0', '1', null, null, null, null);
INSERT INTO `goods_category_attributes` VALUES ('2', '3', '4', null, '0', '2', null, null, null, null);
INSERT INTO `goods_category_attributes` VALUES ('3', '3', '3', null, '0', '2', null, null, null, null);
INSERT INTO `goods_category_attributes` VALUES ('4', '4', '2', null, '0', '1', null, null, null, null);
INSERT INTO `goods_category_attributes` VALUES ('5', '4', '1', null, '0', '1', null, null, null, null);
INSERT INTO `goods_category_attributes` VALUES ('6', '4', '4', null, '0', '2', null, null, null, null);
INSERT INTO `goods_category_attributes` VALUES ('7', '4', '3', null, '0', '2', null, null, null, null);
INSERT INTO `goods_category_attributes` VALUES ('22', '5', '2', null, '0', '1', null, null, null, null);
INSERT INTO `goods_category_attributes` VALUES ('23', '5', '1', null, '0', '1', null, null, null, null);
INSERT INTO `goods_category_attributes` VALUES ('24', '5', '3', null, '0', '2', null, null, null, null);
INSERT INTO `goods_category_attributes` VALUES ('25', '5', '4', null, '0', '2', null, null, null, null);

-- ----------------------------
-- Table structure for goods_category_relationships
-- ----------------------------
DROP TABLE IF EXISTS `goods_category_relationships`;
CREATE TABLE `goods_category_relationships` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned DEFAULT NULL COMMENT '商品ID',
  `goods_category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品分类ID',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_category_relationships
-- ----------------------------

-- ----------------------------
-- Table structure for goods_info_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `goods_info_attribute_values`;
CREATE TABLE `goods_info_attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned DEFAULT NULL COMMENT '商品id',
  `goods_sku_id` int(11) DEFAULT NULL COMMENT '商品sku，可以为空',
  `goods_attribute_id` int(11) DEFAULT NULL COMMENT '商品规格id',
  `goods_attribute_value_id` int(11) DEFAULT NULL COMMENT '商品规格值id',
  `type` tinyint(4) DEFAULT NULL COMMENT '1:spu商品属性,2:sku商品规格用于销售',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_info_attribute_values
-- ----------------------------

-- ----------------------------
-- Table structure for goods_layouts
-- ----------------------------
DROP TABLE IF EXISTS `goods_layouts`;
CREATE TABLE `goods_layouts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `layout_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '布局名称',
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模板位置：1详情顶部，2详情底部，3包装清单，4售后保障',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板内容',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_layouts
-- ----------------------------
INSERT INTO `goods_layouts` VALUES ('1', '手机端商品详情底部', '3', '<p>手机端商品详情底部</p>', '1', '2019-09-23 12:00:21', '2019-09-23 13:29:34');
INSERT INTO `goods_layouts` VALUES ('2', '电脑端商品详情顶部', '1', '<p>电脑端商品详情顶部</p>', '1', '2019-09-23 13:59:58', '2019-09-23 13:59:58');

-- ----------------------------
-- Table structure for goods_order_details
-- ----------------------------
DROP TABLE IF EXISTS `goods_order_details`;
CREATE TABLE `goods_order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_sku_id` int(11) NOT NULL,
  `goods_order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num` int(11) NOT NULL COMMENT '购买数量',
  `goods_price` decimal(10,2) NOT NULL COMMENT '现价',
  `market_price` decimal(10,2) NOT NULL COMMENT '原价',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_ids` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:等待付款，1:已付款，2：已退款',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_order_details
-- ----------------------------

-- ----------------------------
-- Table structure for goods_orders
-- ----------------------------
DROP TABLE IF EXISTS `goods_orders`;
CREATE TABLE `goods_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cart_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '购物车json数据，用于购买完商品之后，清除购物车信息',
  `consignee` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货人',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货人电话',
  `express_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '快递名称',
  `express_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '快递单号',
  `express_created_at` datetime DEFAULT NULL COMMENT '快递发送时间',
  `express_finished_at` datetime DEFAULT NULL COMMENT '快递完成时间',
  `send_uid` tinyint(4) DEFAULT NULL COMMENT '配送员',
  `send_status` tinyint(4) DEFAULT '0' COMMENT '配送状态',
  `send_created_at` timestamp NULL DEFAULT NULL COMMENT '配送分配时间',
  `send_finished_at` timestamp NULL DEFAULT NULL COMMENT '配送完成时间',
  `trade_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'WAIT_BUYER_PAY' COMMENT 'WAIT_BUYER_PAY:交易创建，等待买家付款;TRADE_CLOSED:未付款交易超时关闭，或支付完成后全额退款;TRADE_SUCCESS:交易支付成功;TRADE_FINISHED:交易结束，不可退款',
  `remark` longtext COLLATE utf8mb4_unicode_ci COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_orders
-- ----------------------------

-- ----------------------------
-- Table structure for goods_photos
-- ----------------------------
DROP TABLE IF EXISTS `goods_photos`;
CREATE TABLE `goods_photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned DEFAULT NULL,
  `goods_sku_id` int(11) DEFAULT NULL,
  `cover_id` int(11) DEFAULT '0' COMMENT '商品相册',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_photos
-- ----------------------------

-- ----------------------------
-- Table structure for goods_skus
-- ----------------------------
DROP TABLE IF EXISTS `goods_skus`;
CREATE TABLE `goods_skus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned DEFAULT NULL,
  `shop_id` int(10) unsigned DEFAULT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci,
  `property_name` longtext COLLATE utf8mb4_unicode_ci,
  `stock_num` int(11) DEFAULT NULL,
  `warn_num` int(11) DEFAULT NULL,
  `goods_price` decimal(10,2) DEFAULT NULL,
  `market_price` decimal(10,2) DEFAULT NULL,
  `goods_sn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goods_barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_skus
-- ----------------------------

-- ----------------------------
-- Table structure for goods_types
-- ----------------------------
DROP TABLE IF EXISTS `goods_types`;
CREATE TABLE `goods_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品类型：用于对商品属性的分类',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品类型描述',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_types
-- ----------------------------
INSERT INTO `goods_types` VALUES ('1', '衣服', '衣服', '0', '1');

-- ----------------------------
-- Table structure for goods_units
-- ----------------------------
DROP TABLE IF EXISTS `goods_units`;
CREATE TABLE `goods_units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单位名称：千克',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods_units
-- ----------------------------
INSERT INTO `goods_units` VALUES ('1', null, '千克', '1', '2019-09-23 09:39:49', '2019-09-23 09:39:49');
INSERT INTO `goods_units` VALUES ('2', null, '公斤', '1', '2019-09-23 09:40:02', '2019-09-23 09:40:02');
INSERT INTO `goods_units` VALUES ('3', null, '包', '1', '2019-09-23 09:40:11', '2019-09-23 09:40:11');
INSERT INTO `goods_units` VALUES ('4', null, '盒', '1', '2019-09-23 09:40:22', '2019-09-23 09:40:29');
INSERT INTO `goods_units` VALUES ('5', null, '克', '1', '2019-09-23 09:52:47', '2019-09-23 09:52:47');

-- ----------------------------
-- Table structure for links
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '访问地址',
  `cover_id` longtext COLLATE utf8mb4_unicode_ci COMMENT '封面图',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of links
-- ----------------------------

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `show` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', '控制台', 'admin', 'home', '0', '-2', '/console', '1', '1', null, null);
INSERT INTO `menus` VALUES ('2', '主页', 'admin', '', '1', '0', '/console/index?id=1', '1', '1', null, null);
INSERT INTO `menus` VALUES ('3', '文章管理', 'admin', 'file-word', '0', '0', '/article', '1', '1', null, null);
INSERT INTO `menus` VALUES ('4', '文章列表', 'admin', '', '3', '0', '/article/index', '1', '1', null, null);
INSERT INTO `menus` VALUES ('5', '发布文章', 'admin', '', '3', '0', '/article/create', '1', '1', null, null);
INSERT INTO `menus` VALUES ('6', '我的文章', 'admin', '', '3', '0', '/article/myPublished', '1', '1', null, null);
INSERT INTO `menus` VALUES ('7', '单页管理', 'admin', 'file-ppt', '0', '0', '/page', '1', '1', null, null);
INSERT INTO `menus` VALUES ('8', '单页列表', 'admin', '', '7', '0', '/page/index', '1', '1', null, null);
INSERT INTO `menus` VALUES ('9', '添加单页', 'admin', '', '7', '0', '/page/create', '1', '1', null, null);
INSERT INTO `menus` VALUES ('10', '会员管理', 'admin', 'user-add', '0', '0', '/user', '1', '1', null, null);
INSERT INTO `menus` VALUES ('11', '会员列表', 'admin', '', '10', '0', '/user/index', '1', '1', null, null);
INSERT INTO `menus` VALUES ('12', '添加会员', 'admin', '', '10', '0', '/user/create', '1', '1', null, null);
INSERT INTO `menus` VALUES ('13', '管理员', 'admin', 'usergroup-add', '0', '0', '/admin', '1', '1', null, null);
INSERT INTO `menus` VALUES ('14', '管理员列表', 'admin', '', '13', '0', '/admin/user', '1', '1', null, null);
INSERT INTO `menus` VALUES ('15', '菜单列表', 'admin', '', '13', '0', '/admin/menu/index', '1', '1', null, null);
INSERT INTO `menus` VALUES ('16', '权限列表', 'admin', '', '13', '0', '/admin/permission', '1', '1', null, null);
INSERT INTO `menus` VALUES ('17', '角色列表', 'admin', '', '13', '0', '/admin/role', '1', '1', null, null);
INSERT INTO `menus` VALUES ('18', '广告管理', 'admin', 'file-word', '0', '0', '/banner', '1', '1', null, null);
INSERT INTO `menus` VALUES ('19', '广告列表', 'admin', '', '18', '0', '/banner/banner', '1', '1', null, null);
INSERT INTO `menus` VALUES ('20', '广告位列表', 'admin', '', '18', '0', '/banner/bannerCategory', '1', '1', null, null);
INSERT INTO `menus` VALUES ('21', '应用插件', 'admin', 'snippets', '0', '0', '/plugin', '1', '1', null, null);
INSERT INTO `menus` VALUES ('22', '评论管理', 'admin', '', '21', '0', '/plugin/comment', '1', '1', null, null);
INSERT INTO `menus` VALUES ('23', '友情链接', 'admin', '', '21', '0', '/plugin/link', '1', '1', null, null);
INSERT INTO `menus` VALUES ('24', '打印机管理', 'admin', '', '21', '0', '/plugin/printer', '1', '1', null, null);
INSERT INTO `menus` VALUES ('25', '系统配置', 'admin', 'setting', '0', '0', '/system', '1', '1', null, null);
INSERT INTO `menus` VALUES ('26', '设置管理', 'admin', '', '25', '0', '/system/config', '1', '1', null, null);
INSERT INTO `menus` VALUES ('27', '网站设置', 'admin', '', '26', '0', '/system/config/website', '1', '1', null, null);
INSERT INTO `menus` VALUES ('28', '配置管理', 'admin', '', '26', '0', '/system/config/index', '1', '1', null, null);
INSERT INTO `menus` VALUES ('29', '所有导航', 'admin', '', '25', '0', '/system/navigation', '1', '1', null, null);
INSERT INTO `menus` VALUES ('30', '分类列表', 'admin', '', '25', '0', '/system/category', '1', '1', null, null);
INSERT INTO `menus` VALUES ('31', '短信列表', 'admin', '', '25', '0', '/system/sms/index', '1', '1', null, null);
INSERT INTO `menus` VALUES ('32', '操作日志', 'admin', '', '25', '0', '/system/actionLog/index', '1', '1', null, null);
INSERT INTO `menus` VALUES ('33', '附件空间', 'admin', 'paper-clip', '0', '0', '/attachment', '1', '1', null, null);
INSERT INTO `menus` VALUES ('34', '文件管理', 'admin', '', '33', '0', '/attachment/file', '1', '1', null, null);
INSERT INTO `menus` VALUES ('35', '图片管理', 'admin', '', '33', '0', '/attachment/picture', '1', '1', null, null);
INSERT INTO `menus` VALUES ('36', '我的账号', 'admin', 'user', '0', '0', '/account', '1', '1', null, null);
INSERT INTO `menus` VALUES ('37', '个人设置', 'admin', '', '36', '0', '/account/settings', '1', '1', null, null);
INSERT INTO `menus` VALUES ('38', '商城管理', 'admin', 'shop', '0', '-1', '/mall', '1', '1', '2019-08-27 15:52:38', '2019-08-27 15:52:38');
INSERT INTO `menus` VALUES ('39', '商家管理', 'admin', '', '38', '0', '/mall/shop', '1', '1', '2019-08-27 15:53:23', '2019-08-27 15:53:23');
INSERT INTO `menus` VALUES ('40', '商家列表', 'admin', '', '39', '0', '/mall/shop/index', '1', '1', '2019-08-27 15:55:06', '2019-08-27 15:58:33');
INSERT INTO `menus` VALUES ('41', '添加商家', 'admin', '', '40', '0', '/mall/shop/create', '0', '1', '2019-08-27 15:55:29', '2019-08-27 15:58:21');
INSERT INTO `menus` VALUES ('42', '编辑商家', 'admin', '', '40', '0', '/mall/shop/edit', '0', '1', '2019-08-27 15:59:26', '2019-08-27 16:00:19');
INSERT INTO `menus` VALUES ('43', '商家分类', 'admin', '', '39', '0', '/mall/shop/categoryIndex', '1', '1', '2019-08-27 16:00:57', '2019-08-27 16:00:57');
INSERT INTO `menus` VALUES ('44', '创建分类', 'admin', '', '43', '0', '/mall/shop/categoryCreate', '0', '1', '2019-08-27 16:01:39', '2019-08-27 16:01:39');
INSERT INTO `menus` VALUES ('45', '编辑分类', 'admin', '', '43', '0', '/mall/shop/categoryEdit', '0', '1', '2019-08-27 16:02:11', '2019-08-27 16:02:11');
INSERT INTO `menus` VALUES ('46', '商品管理', 'admin', '', '38', '0', '/mall/goods', '1', '1', '2019-08-27 16:04:29', '2019-08-27 16:04:29');
INSERT INTO `menus` VALUES ('47', '商品列表', 'admin', '', '46', '0', '/mall/goods/index', '1', '1', '2019-08-27 16:05:36', '2019-08-27 16:05:36');
INSERT INTO `menus` VALUES ('48', '商品分类', 'admin', '', '46', '0', '/mall/goods/categoryIndex', '1', '1', '2019-08-27 16:06:44', '2019-08-27 16:06:44');
INSERT INTO `menus` VALUES ('49', '品牌管理', 'admin', '', '38', '0', '/mall/goodsBrand', '1', '1', '2019-08-27 16:09:07', '2019-08-27 16:09:07');
INSERT INTO `menus` VALUES ('50', '品牌列表', 'admin', '', '49', '0', '/mall/goodsBrand/index', '1', '1', '2019-08-27 16:09:55', '2019-08-27 16:09:55');
INSERT INTO `menus` VALUES ('51', '商品类型', 'admin', '', '46', '0', '/mall/goods/typeIndex', '1', '1', '2019-08-27 16:11:07', '2019-08-27 16:11:07');
INSERT INTO `menus` VALUES ('52', '商品订单', 'admin', '', '38', '0', '/mall/goodsOrder', '1', '1', '2019-08-27 16:25:31', '2019-08-27 16:25:31');
INSERT INTO `menus` VALUES ('53', '订单列表', 'admin', '', '52', '0', '/mall/goodsOrder/index', '1', '1', '2019-08-27 16:26:13', '2019-08-27 16:26:13');
INSERT INTO `menus` VALUES ('54', '退款订单', 'admin', '', '52', '0', '/mall/goodsOrder/refundIndex', '1', '1', '2019-08-27 16:27:39', '2019-08-27 16:28:24');
INSERT INTO `menus` VALUES ('55', '售后订单', 'admin', '', '52', '0', '/mall/goodsOrder/afterSaleIndex', '1', '1', '2019-08-27 16:29:09', '2019-08-27 16:29:09');
INSERT INTO `menus` VALUES ('56', '评价管理', 'admin', '', '52', '0', '/mall/goodsOrder/commentIndex', '1', '1', '2019-08-27 16:29:43', '2019-08-27 16:29:43');
INSERT INTO `menus` VALUES ('57', '商品单位', 'admin', '', '46', '0', '/mall/goods/unitIndex', '1', '1', '2019-09-23 09:15:49', '2019-09-23 09:15:49');
INSERT INTO `menus` VALUES ('58', '详情版式', 'admin', '', '46', '0', '/mall/goods/layoutIndex', '1', '1', '2019-09-23 10:10:06', '2019-09-23 10:10:06');

-- ----------------------------
-- Table structure for merchants
-- ----------------------------
DROP TABLE IF EXISTS `merchants`;
CREATE TABLE `merchants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `score` int(11) DEFAULT '0',
  `money` decimal(10,2) DEFAULT '0.00',
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开户行',
  `bank_payee` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开户行收款人',
  `bank_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开户行帐号',
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `last_login_time` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of merchants
-- ----------------------------
INSERT INTO `merchants` VALUES ('1', '1', '0', '0.00', null, null, null, '', null, '2', '2019-09-19 17:54:01', '2019-09-19 17:54:01', null);

-- ----------------------------
-- Table structure for message_reads
-- ----------------------------
DROP TABLE IF EXISTS `message_reads`;
CREATE TABLE `message_reads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of message_reads
-- ----------------------------

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息类型（SYSTEM/USER等）',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of messages
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_06_01_000001_create_oauth_auth_codes_table', '1');
INSERT INTO `migrations` VALUES ('4', '2016_06_01_000002_create_oauth_access_tokens_table', '1');
INSERT INTO `migrations` VALUES ('5', '2016_06_01_000003_create_oauth_refresh_tokens_table', '1');
INSERT INTO `migrations` VALUES ('6', '2016_06_01_000004_create_oauth_clients_table', '1');
INSERT INTO `migrations` VALUES ('7', '2016_06_01_000005_create_oauth_personal_access_clients_table', '1');
INSERT INTO `migrations` VALUES ('8', '2018_06_08_112122_create_areas_table', '1');
INSERT INTO `migrations` VALUES ('9', '2019_01_30_080034_create_admins_table', '1');
INSERT INTO `migrations` VALUES ('10', '2019_01_30_080743_create_action_logs_table', '1');
INSERT INTO `migrations` VALUES ('11', '2019_01_30_081529_create_address_table', '1');
INSERT INTO `migrations` VALUES ('12', '2019_01_30_081948_create_banner_categories_table', '1');
INSERT INTO `migrations` VALUES ('13', '2019_01_30_082453_create_banners_table', '1');
INSERT INTO `migrations` VALUES ('14', '2019_01_30_082625_create_brokes_table', '1');
INSERT INTO `migrations` VALUES ('15', '2019_01_30_082803_create_bugs_table', '1');
INSERT INTO `migrations` VALUES ('16', '2019_01_30_082859_create_categories_table', '1');
INSERT INTO `migrations` VALUES ('17', '2019_01_30_083321_create_comments_table', '1');
INSERT INTO `migrations` VALUES ('18', '2019_01_30_083510_create_configs_table', '1');
INSERT INTO `migrations` VALUES ('19', '2019_01_30_083614_create_files_table', '1');
INSERT INTO `migrations` VALUES ('20', '2019_01_30_091348_create_links_table', '1');
INSERT INTO `migrations` VALUES ('21', '2019_01_30_091501_create_menus_table', '1');
INSERT INTO `migrations` VALUES ('22', '2019_02_11_073220_create_message_reads_table', '1');
INSERT INTO `migrations` VALUES ('23', '2019_02_11_073506_create_messages_table', '1');
INSERT INTO `migrations` VALUES ('24', '2019_02_11_081013_create_navigations_table', '1');
INSERT INTO `migrations` VALUES ('25', '2019_02_11_081942_create_pictures_table', '1');
INSERT INTO `migrations` VALUES ('26', '2019_02_11_082042_create_posts_table', '1');
INSERT INTO `migrations` VALUES ('27', '2019_02_11_082339_create_sms_table', '1');
INSERT INTO `migrations` VALUES ('28', '2019_02_11_084439_create_videos_table', '1');
INSERT INTO `migrations` VALUES ('29', '2019_03_08_081738_create_permission_tables', '1');
INSERT INTO `migrations` VALUES ('30', '2019_07_24_183623_create_account_logs_table', '1');
INSERT INTO `migrations` VALUES ('31', '2019_07_24_183828_create_goods_table', '1');
INSERT INTO `migrations` VALUES ('32', '2019_07_24_183935_create_goods_attribute_alias_table', '1');
INSERT INTO `migrations` VALUES ('33', '2019_07_24_184035_create_goods_attribute_values_table', '1');
INSERT INTO `migrations` VALUES ('34', '2019_07_24_184054_create_goods_attributes_table', '1');
INSERT INTO `migrations` VALUES ('35', '2019_07_24_184200_create_goods_categories_table', '1');
INSERT INTO `migrations` VALUES ('36', '2019_07_24_184230_create_goods_category_attributes_table', '1');
INSERT INTO `migrations` VALUES ('37', '2019_07_24_184304_create_goods_info_attribute_values_table', '1');
INSERT INTO `migrations` VALUES ('38', '2019_07_24_184744_create_goods_order_details_table', '1');
INSERT INTO `migrations` VALUES ('39', '2019_07_24_184801_create_goods_orders_table', '1');
INSERT INTO `migrations` VALUES ('40', '2019_07_24_184821_create_goods_photos_table', '1');
INSERT INTO `migrations` VALUES ('41', '2019_07_24_184838_create_goods_skus_table', '1');
INSERT INTO `migrations` VALUES ('42', '2019_07_24_185051_create_goods_types_table', '1');
INSERT INTO `migrations` VALUES ('43', '2019_07_24_185141_create_orders_table', '1');
INSERT INTO `migrations` VALUES ('44', '2019_07_24_185340_create_printers_table', '1');
INSERT INTO `migrations` VALUES ('45', '2019_07_24_185405_create_shops_table', '1');
INSERT INTO `migrations` VALUES ('46', '2019_07_24_185429_create_shopping_carts_table', '1');
INSERT INTO `migrations` VALUES ('47', '2019_07_24_185527_create_shop_self_categories_table', '1');
INSERT INTO `migrations` VALUES ('48', '2019_07_24_185542_create_shop_categories_table', '1');
INSERT INTO `migrations` VALUES ('49', '2019_08_21_111548_create_merchants_table', '1');
INSERT INTO `migrations` VALUES ('50', '2019_08_21_112835_create_wechat_users_table', '1');
INSERT INTO `migrations` VALUES ('51', '2019_08_21_170544_create_goods_category_relationships_table', '1');
INSERT INTO `migrations` VALUES ('52', '2019_08_27_091806_create_goods_units_table', '1');
INSERT INTO `migrations` VALUES ('53', '2019_08_27_092130_create_goods_brands_table', '1');
INSERT INTO `migrations` VALUES ('54', '2019_09_19_201244_create_table_goods_layouts_table', '2');

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------

-- ----------------------------
-- Table structure for navigations
-- ----------------------------
DROP TABLE IF EXISTS `navigations`;
CREATE TABLE `navigations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_id` int(11) NOT NULL,
  `url_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'url类型1：自定义链接，2：常用链接（首页、用户中心），3：文章分类（新闻、音乐），4：文章详情',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '例如：https://www.baidu.com，/article/1.html',
  `sort` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of navigations
-- ----------------------------
INSERT INTO `navigations` VALUES ('1', '0', '0', '首页', '0', '', '/pc/index/index', '0', '1', '2019-09-09 15:56:53', '2019-09-09 15:56:53', null);
INSERT INTO `navigations` VALUES ('2', '0', '0', '新闻', '0', '', '/pc/article/lists?name=news', '0', '1', '2019-09-09 15:56:53', '2019-09-09 15:56:53', null);
INSERT INTO `navigations` VALUES ('3', '0', '0', '商城', '0', '', '/pc/goods/lists?name=mall', '0', '1', '2019-09-09 15:56:53', '2019-09-09 15:56:53', null);
INSERT INTO `navigations` VALUES ('4', '0', '0', '关于', '0', '', '/pc/page/index?name=aboutus', '0', '1', '2019-09-09 15:56:53', '2019-09-09 15:56:53', null);

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
INSERT INTO `oauth_access_tokens` VALUES ('02b29b31eb06b7aba283e9272196965e241f514f88047fd7315c215901526e1a907db24dafe9aefc', '1', '1', 'FullStack', '[]', '0', '2019-09-28 13:44:56', '2019-09-28 13:44:56', '2020-09-28 13:44:56');
INSERT INTO `oauth_access_tokens` VALUES ('07accc71d17999f3da0e1364bd2953d8c196e8476199691f9c7d1800440e5b33d159198131273c29', '1', '1', 'FullStack', '[]', '0', '2019-09-20 19:11:07', '2019-09-20 19:11:07', '2020-09-20 19:11:07');
INSERT INTO `oauth_access_tokens` VALUES ('0a86d3fa23cacf160cd593a7faf5f7c06b6dac0bc755511a2e6a32c721f28ea07476d640a1d0e11e', '1', '1', 'FullStack', '[]', '0', '2019-09-11 20:31:03', '2019-09-11 20:31:03', '2020-09-11 20:31:03');
INSERT INTO `oauth_access_tokens` VALUES ('0d375041319d3dff560303cb250550793af774e7ad9e6fa083c4444df0417f9861084c13faf9aa6c', '1', '1', 'FullStack', '[]', '0', '2019-09-10 17:21:55', '2019-09-10 17:21:55', '2020-09-10 17:21:55');
INSERT INTO `oauth_access_tokens` VALUES ('157afadb4330f134bcdeb991e65a78b5e23a493fc70813c7f62c0973ab97024d403d0caf6b951f9f', '1', '1', 'FullStack', '[]', '0', '2019-10-06 09:41:53', '2019-10-06 09:41:53', '2020-10-06 09:41:53');
INSERT INTO `oauth_access_tokens` VALUES ('22a47db76c95220384399703d4c28800e6799187b128e27c58225badb1219e985d1af34b9f064de1', '1', '1', 'FullStack', '[]', '0', '2019-10-06 13:21:21', '2019-10-06 13:21:21', '2020-10-06 13:21:21');
INSERT INTO `oauth_access_tokens` VALUES ('252972d62c53a2b1c398566dec19c4346a4ff9dabcd63bd1021a2c49ca093f15d574e0a30a9fd4f0', '1', '1', 'FullStack', '[]', '0', '2019-09-26 16:16:30', '2019-09-26 16:16:30', '2020-09-26 16:16:30');
INSERT INTO `oauth_access_tokens` VALUES ('275f16e9ddd85d6488d6600ca0ff378d6c3653c1480dc9c4953c9e1f342eb407bf29546ccad58c6d', '1', '1', 'FullStack', '[]', '0', '2019-09-23 15:15:10', '2019-09-23 15:15:10', '2020-09-23 15:15:10');
INSERT INTO `oauth_access_tokens` VALUES ('2cd1104f49eefc73491b673784c7332a94277063fa8b6bac29d936e108415a02c6bdbee2c06a082a', '1', '1', 'FullStack', '[]', '0', '2019-09-29 13:45:22', '2019-09-29 13:45:22', '2020-09-29 13:45:22');
INSERT INTO `oauth_access_tokens` VALUES ('30f4edc42917174063573308be9e5f8747997afe56278312435b5559869b3352149d1fa4744573ee', '1', '1', 'FullStack', '[]', '0', '2019-09-29 08:23:32', '2019-09-29 08:23:32', '2020-09-29 08:23:32');
INSERT INTO `oauth_access_tokens` VALUES ('36a213765700c25a4a2b54117e9dfc7f9d1b3274f0c23c90183102161cbde92b9dfa0526ae20ac7f', '1', '1', 'FullStack', '[]', '0', '2019-09-24 11:09:15', '2019-09-24 11:09:15', '2020-09-24 11:09:15');
INSERT INTO `oauth_access_tokens` VALUES ('469ed25f655914cffa5eedcb0d0a8f958816cf4ad0d3e3a897b8e8da43011bbe2a16198279716136', '1', '1', 'FullStack', '[]', '0', '2019-09-23 08:59:31', '2019-09-23 08:59:31', '2020-09-23 08:59:31');
INSERT INTO `oauth_access_tokens` VALUES ('5312ac72185e920e88cf7f0715a921b3250af6964da90f628908b02806d1717417d014a91c83e346', '1', '1', 'FullStack', '[]', '0', '2019-09-19 16:33:19', '2019-09-19 16:33:19', '2020-09-19 16:33:19');
INSERT INTO `oauth_access_tokens` VALUES ('553e9db6675af3eb51526bb2a6a22b6fffc785896b096e53e1fe34f803a7905465c34f48809d7e14', '1', '1', 'FullStack', '[]', '0', '2019-09-11 16:32:17', '2019-09-11 16:32:17', '2020-09-11 16:32:17');
INSERT INTO `oauth_access_tokens` VALUES ('56118b7030603537a0a8375e51db68ae759bdaff4ed4f1277a4f751847a660deb246c5ebfa8220d9', '1', '1', 'FullStack', '[]', '0', '2019-09-30 09:02:34', '2019-09-30 09:02:34', '2020-09-30 09:02:34');
INSERT INTO `oauth_access_tokens` VALUES ('590ae776cb7edb493ee91eaecc87d7ba093beecaa9a3af161fa7a4f6e8e8c2df73e6764f193b257a', '1', '1', 'FullStack', '[]', '0', '2019-09-10 11:37:29', '2019-09-10 11:37:29', '2020-09-10 11:37:29');
INSERT INTO `oauth_access_tokens` VALUES ('59572b8adedb3fea5717f19f038e124f3493fd5f5ccbe249eb84fdc664afc26851438e40b8e132e4', '1', '1', 'FullStack', '[]', '0', '2019-09-23 18:26:26', '2019-09-23 18:26:26', '2020-09-23 18:26:26');
INSERT INTO `oauth_access_tokens` VALUES ('6b0fc493bf5feea2ec15cf5298be535bd34f5dce585948ffe731615ea0db4b6de79d0f4f7567c1ef', '1', '1', 'FullStack', '[]', '0', '2019-09-09 19:10:00', '2019-09-09 19:10:00', '2020-09-09 19:10:00');
INSERT INTO `oauth_access_tokens` VALUES ('6daf8a80a5770e41c05f981c4bb0ba394e4e01650c6ca2ae43682600609e16fdcdfbbb925aea6d95', '1', '1', 'FullStack', '[]', '0', '2019-09-12 14:27:52', '2019-09-12 14:27:52', '2020-09-12 14:27:52');
INSERT INTO `oauth_access_tokens` VALUES ('7259560d0264bce428717728000f0437e5fbcfc0630d8b8635e2ac21390bfdee1b16edf5a54f1774', '1', '1', 'FullStack', '[]', '0', '2019-09-11 11:34:47', '2019-09-11 11:34:47', '2020-09-11 11:34:47');
INSERT INTO `oauth_access_tokens` VALUES ('7629d9ced63068c880b2cccf93eb10a312eda0499dc4833113ced73c3b242f5a2a95f60be288bd79', '1', '1', 'FullStack', '[]', '0', '2019-09-24 08:04:43', '2019-09-24 08:04:43', '2020-09-24 08:04:43');
INSERT INTO `oauth_access_tokens` VALUES ('8829f53080b8112a78796c9c3fffbc03fb453d8947b0e5db2311ef97b7427bb5d1b976dddcec5345', '1', '1', 'FullStack', '[]', '0', '2019-09-27 11:38:56', '2019-09-27 11:38:56', '2020-09-27 11:38:56');
INSERT INTO `oauth_access_tokens` VALUES ('8eff227966031b34035144ad81643905ac9257655a33ddfc4698c80f01c296abb26a0daf657ecd54', '1', '1', 'FullStack', '[]', '0', '2019-09-12 08:57:07', '2019-09-12 08:57:07', '2020-09-12 08:57:07');
INSERT INTO `oauth_access_tokens` VALUES ('910d17f5505881c38326f9f13b37a19353752baa6bc29d95900c0d521fca94c998a95edd3af81f26', '1', '1', 'FullStack', '[]', '0', '2019-09-26 15:15:03', '2019-09-26 15:15:03', '2020-09-26 15:15:03');
INSERT INTO `oauth_access_tokens` VALUES ('a9e502627bbbd8913bf4699dc0f92f4aba88e3f9bf644507df2afa832fbbf6350dc967eeebe98655', '1', '1', 'FullStack', '[]', '0', '2019-09-25 13:53:05', '2019-09-25 13:53:05', '2020-09-25 13:53:05');
INSERT INTO `oauth_access_tokens` VALUES ('b46b8fc42e5da8b0ac4e5d2963e0147efb449554050aecd95e1273f61b1056a20b8e3c9aa6601795', '1', '1', 'FullStack', '[]', '0', '2019-09-23 11:59:55', '2019-09-23 11:59:55', '2020-09-23 11:59:55');
INSERT INTO `oauth_access_tokens` VALUES ('b9b93abd705e5fe71016ab16d5ba0c0d69552bc06cc4303054b57af280c5d277ec70a53efaeebbf6', '1', '1', 'FullStack', '[]', '0', '2019-09-30 17:42:48', '2019-09-30 17:42:48', '2020-09-30 17:42:48');
INSERT INTO `oauth_access_tokens` VALUES ('c5527263da995f6a3456294bec4504d4a224d672cabaeeb7ce94f2cb85a8dd9a6c4918a144490c4c', '1', '1', 'FullStack', '[]', '0', '2019-09-11 08:31:24', '2019-09-11 08:31:24', '2020-09-11 08:31:24');
INSERT INTO `oauth_access_tokens` VALUES ('d267b062914ab81295fc8d2832ed38056ddac13b3b3dce6fec78be069376bff87ec51a2e21e34adf', '1', '1', 'FullStack', '[]', '0', '2019-09-19 19:34:23', '2019-09-19 19:34:23', '2020-09-19 19:34:23');
INSERT INTO `oauth_access_tokens` VALUES ('d29eab26ec7ca5e6d5574ac033de42b76a64ae1831dc2bc39c3e240c37102335934942f2d2e4e231', '1', '1', 'FullStack', '[]', '0', '2019-10-06 16:24:23', '2019-10-06 16:24:23', '2020-10-06 16:24:23');
INSERT INTO `oauth_access_tokens` VALUES ('deaf248fc7bf20352cc9938dc5013afb7cee70359b44b5cf78a4d15fd3ec12900b4e09b7fb8943b3', '1', '1', 'FullStack', '[]', '0', '2019-09-12 17:45:33', '2019-09-12 17:45:33', '2020-09-12 17:45:33');
INSERT INTO `oauth_access_tokens` VALUES ('e4951a9a255e6e56fee0733d4364f1f63959f2f434bbb55f4822f1a9fafeb0b1cd0eb9d1b00c511c', '1', '1', 'FullStack', '[]', '0', '2019-09-09 16:03:30', '2019-09-09 16:03:30', '2020-09-09 16:03:30');
INSERT INTO `oauth_access_tokens` VALUES ('eb8bf62a00aa2559312a1f292c32033aef75e047c97d280a9e993d09d6ec781a7f261bb573d8a21a', '1', '1', 'FullStack', '[]', '0', '2019-09-28 17:40:00', '2019-09-28 17:40:00', '2020-09-28 17:40:00');
INSERT INTO `oauth_access_tokens` VALUES ('eba5cfb3adcadd5fd8a8bef693614c5197c2ea40aa5f1b692ca4ebe01755543e5bee7f3c07fc14ca', '1', '1', 'FullStack', '[]', '0', '2019-09-29 17:43:14', '2019-09-29 17:43:14', '2020-09-29 17:43:14');
INSERT INTO `oauth_access_tokens` VALUES ('f1bc161ad18db13be25088c125deb79c6e496308a40fd6d8cd5c8d7dd2bfff6a458b9ac82dbb6dc2', '1', '1', 'FullStack', '[]', '0', '2019-09-19 10:24:34', '2019-09-19 10:24:34', '2020-09-19 10:24:34');
INSERT INTO `oauth_access_tokens` VALUES ('f213527daef3ada68b11c49f135834e4ab2b0066b9eb05cecee8e0e6282939d068d49f1b85a75e9f', '1', '1', 'FullStack', '[]', '0', '2019-09-24 15:09:32', '2019-09-24 15:09:32', '2020-09-24 15:09:32');

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_auth_codes
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
INSERT INTO `oauth_clients` VALUES ('1', null, 'Laravel Personal Access Client', 'Gfa6XMchR3DPiTVydraIAJgPh30vQ3sBh5b6Oj43', 'http://localhost', '1', '0', '0', '2019-09-09 16:03:13', '2019-09-09 16:03:13');
INSERT INTO `oauth_clients` VALUES ('2', null, 'Laravel Password Grant Client', 'fTA5i3JSiaEnX3mgDqYBQgqvS5O8BNbIoq9CjdEF', 'http://localhost', '0', '1', '0', '2019-09-09 16:03:13', '2019-09-09 16:03:13');

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
INSERT INTO `oauth_personal_access_clients` VALUES ('1', '1', '2019-09-09 16:03:13', '2019-09-09 16:03:13');

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `order_no` varchar(28) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '系统单号',
  `thirdparty_order_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付宝或微信单号',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL COMMENT '本次交易支付的订单金额，单位为人民币（元）',
  `pay_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'WECHAT_APP 微信APP支付， WECHAT_JSAPI 微信公众号支付， WECHAT_NATIVE 微信电脑网站支付， ALIPAY_PAGE 支付宝电脑网站支付， ALIPAY_APP 支付宝APP支付， ALIPAY_WAP 支付宝手机网站支付， ALIPAY_F2F 支付宝当面付， ALIPAY_JS 支付宝JSAPI',
  `paid_at` datetime DEFAULT NULL COMMENT '交易付款时间',
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'MALL:商城,GROUPBUY:团购,WAIMAI:外卖',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '0', 'api/admin/login', 'admin', null, null);
INSERT INTO `permissions` VALUES ('2', '0', 'api/admin/logout', 'admin', null, null);
INSERT INTO `permissions` VALUES ('3', '0', 'api/admin/loginErrorTimes', 'admin', null, null);
INSERT INTO `permissions` VALUES ('4', '0', 'api/admin/console/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('5', '0', 'api/admin/account/info', 'admin', null, null);
INSERT INTO `permissions` VALUES ('6', '0', 'api/admin/account/profile', 'admin', null, null);
INSERT INTO `permissions` VALUES ('7', '0', 'api/admin/account/password', 'admin', null, null);
INSERT INTO `permissions` VALUES ('8', '0', 'api/admin/account/menus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('9', '0', 'api/admin/article/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('10', '0', 'api/admin/article/create', 'admin', null, null);
INSERT INTO `permissions` VALUES ('11', '0', 'api/admin/article/store', 'admin', null, null);
INSERT INTO `permissions` VALUES ('12', '0', 'api/admin/article/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('13', '0', 'api/admin/article/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('14', '0', 'api/admin/article/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('15', '0', 'api/admin/article/myPublished', 'admin', null, null);
INSERT INTO `permissions` VALUES ('16', '0', 'api/admin/page/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('17', '0', 'api/admin/page/create', 'admin', null, null);
INSERT INTO `permissions` VALUES ('18', '0', 'api/admin/page/store', 'admin', null, null);
INSERT INTO `permissions` VALUES ('19', '0', 'api/admin/page/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('20', '0', 'api/admin/page/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('21', '0', 'api/admin/page/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('22', '0', 'api/admin/user/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('23', '0', 'api/admin/user/create', 'admin', null, null);
INSERT INTO `permissions` VALUES ('24', '0', 'api/admin/user/store', 'admin', null, null);
INSERT INTO `permissions` VALUES ('25', '0', 'api/admin/user/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('26', '0', 'api/admin/user/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('27', '0', 'api/admin/user/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('28', '0', 'api/admin/user/recharge', 'admin', null, null);
INSERT INTO `permissions` VALUES ('29', '0', 'api/admin/admin/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('30', '0', 'api/admin/admin/create', 'admin', null, null);
INSERT INTO `permissions` VALUES ('31', '0', 'api/admin/admin/store', 'admin', null, null);
INSERT INTO `permissions` VALUES ('32', '0', 'api/admin/admin/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('33', '0', 'api/admin/admin/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('34', '0', 'api/admin/admin/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('35', '0', 'api/admin/permission/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('36', '0', 'api/admin/permission/create', 'admin', null, null);
INSERT INTO `permissions` VALUES ('37', '0', 'api/admin/permission/store', 'admin', null, null);
INSERT INTO `permissions` VALUES ('38', '0', 'api/admin/permission/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('39', '0', 'api/admin/permission/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('40', '0', 'api/admin/permission/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('41', '0', 'api/admin/role/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('42', '0', 'api/admin/role/create', 'admin', null, null);
INSERT INTO `permissions` VALUES ('43', '0', 'api/admin/role/store', 'admin', null, null);
INSERT INTO `permissions` VALUES ('44', '0', 'api/admin/role/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('45', '0', 'api/admin/role/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('46', '0', 'api/admin/role/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('47', '0', 'api/admin/banner/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('48', '0', 'api/admin/banner/create', 'admin', null, null);
INSERT INTO `permissions` VALUES ('49', '0', 'api/admin/banner/store', 'admin', null, null);
INSERT INTO `permissions` VALUES ('50', '0', 'api/admin/banner/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('51', '0', 'api/admin/banner/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('52', '0', 'api/admin/banner/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('53', '0', 'api/admin/bannerCategory/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('54', '0', 'api/admin/bannerCategory/create', 'admin', null, null);
INSERT INTO `permissions` VALUES ('55', '0', 'api/admin/bannerCategory/store', 'admin', null, null);
INSERT INTO `permissions` VALUES ('56', '0', 'api/admin/bannerCategory/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('57', '0', 'api/admin/bannerCategory/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('58', '0', 'api/admin/bannerCategory/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('59', '0', 'api/admin/comment/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('60', '0', 'api/admin/comment/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('61', '0', 'api/admin/comment/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('62', '0', 'api/admin/comment/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('63', '0', 'api/admin/link/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('64', '0', 'api/admin/link/create', 'admin', null, null);
INSERT INTO `permissions` VALUES ('65', '0', 'api/admin/link/store', 'admin', null, null);
INSERT INTO `permissions` VALUES ('66', '0', 'api/admin/link/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('67', '0', 'api/admin/link/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('68', '0', 'api/admin/link/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('69', '0', 'api/admin/printer/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('70', '0', 'api/admin/printer/create', 'admin', null, null);
INSERT INTO `permissions` VALUES ('71', '0', 'api/admin/printer/store', 'admin', null, null);
INSERT INTO `permissions` VALUES ('72', '0', 'api/admin/printer/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('73', '0', 'api/admin/printer/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('74', '0', 'api/admin/printer/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('75', '0', 'api/admin/config/website', 'admin', null, null);
INSERT INTO `permissions` VALUES ('76', '0', 'api/admin/config/saveWebsite', 'admin', null, null);
INSERT INTO `permissions` VALUES ('77', '0', 'api/admin/config/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('78', '0', 'api/admin/config/create', 'admin', null, null);
INSERT INTO `permissions` VALUES ('79', '0', 'api/admin/config/store', 'admin', null, null);
INSERT INTO `permissions` VALUES ('80', '0', 'api/admin/config/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('81', '0', 'api/admin/config/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('82', '0', 'api/admin/config/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('83', '0', 'api/admin/menu/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('84', '0', 'api/admin/menu/create', 'admin', null, null);
INSERT INTO `permissions` VALUES ('85', '0', 'api/admin/menu/store', 'admin', null, null);
INSERT INTO `permissions` VALUES ('86', '0', 'api/admin/menu/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('87', '0', 'api/admin/menu/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('88', '0', 'api/admin/menu/destroy', 'admin', null, null);
INSERT INTO `permissions` VALUES ('89', '0', 'api/admin/menu/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('90', '0', 'api/admin/navigation/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('91', '0', 'api/admin/navigation/create', 'admin', null, null);
INSERT INTO `permissions` VALUES ('92', '0', 'api/admin/navigation/store', 'admin', null, null);
INSERT INTO `permissions` VALUES ('93', '0', 'api/admin/navigation/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('94', '0', 'api/admin/navigation/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('95', '0', 'api/admin/navigation/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('96', '0', 'api/admin/category/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('97', '0', 'api/admin/category/create', 'admin', null, null);
INSERT INTO `permissions` VALUES ('98', '0', 'api/admin/category/store', 'admin', null, null);
INSERT INTO `permissions` VALUES ('99', '0', 'api/admin/category/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('100', '0', 'api/admin/category/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('101', '0', 'api/admin/category/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('102', '0', 'api/admin/sms/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('103', '0', 'api/admin/sms/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('104', '0', 'api/admin/sms/send', 'admin', null, null);
INSERT INTO `permissions` VALUES ('105', '0', 'api/admin/actionLog/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('106', '0', 'api/admin/actionLog/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('107', '0', 'api/admin/actionLog/export', 'admin', null, null);
INSERT INTO `permissions` VALUES ('108', '0', 'api/admin/picture/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('109', '0', 'api/admin/picture/upload', 'admin', null, null);
INSERT INTO `permissions` VALUES ('110', '0', 'api/admin/picture/download', 'admin', null, null);
INSERT INTO `permissions` VALUES ('111', '0', 'api/admin/picture/update', 'admin', null, null);
INSERT INTO `permissions` VALUES ('112', '0', 'api/admin/picture/edit', 'admin', null, null);
INSERT INTO `permissions` VALUES ('113', '0', 'api/admin/picture/save', 'admin', null, null);
INSERT INTO `permissions` VALUES ('114', '0', 'api/admin/picture/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('115', '0', 'api/admin/file/index', 'admin', null, null);
INSERT INTO `permissions` VALUES ('116', '0', 'api/admin/file/upload', 'admin', null, null);
INSERT INTO `permissions` VALUES ('117', '0', 'api/admin/file/download', 'admin', null, null);
INSERT INTO `permissions` VALUES ('118', '0', 'api/admin/file/update', 'admin', null, null);
INSERT INTO `permissions` VALUES ('119', '0', 'api/admin/file/changeStatus', 'admin', null, null);
INSERT INTO `permissions` VALUES ('120', '0', 'api/admin/test/index', 'admin', null, null);

-- ----------------------------
-- Table structure for pictures
-- ----------------------------
DROP TABLE IF EXISTS `pictures`;
CREATE TABLE `pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件大小',
  `path` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '路径',
  `md5` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'md5唯一标识',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pictures
-- ----------------------------
INSERT INTO `pictures` VALUES ('1', '0', '0', 'u=919681113,1254503021&fm=85&app=79&f=PNG.jpg', '14008', 'public/uploads/pictures/nriJQ1JKziU9Q42AYFWNRnnQ4H20V6i7oCKwWGpp.png', 'c5947dd3934592b7d559e6bcf7cc04bc', '1', '2019-09-09 16:24:04', '2019-09-09 16:24:04');
INSERT INTO `pictures` VALUES ('2', '0', '0', 'u=3055523317,610222336&fm=26&gp=0.jpg', '25042', 'public/uploads/pictures/n5ZHZQpqRNT3IwhTqxdFLEa3p6buIaSROmj9TptI.jpeg', '66b403d8c7ebc01e257f401d77fa9044', '1', '2019-09-11 16:55:15', '2019-09-11 16:55:15');
INSERT INTO `pictures` VALUES ('3', '0', '0', '微信图片_20190319150608.png', '10075', 'public/uploads/pictures/9C2z8YwmFdmUf6t3iJnkIF9wXtBRnfkqw4iYWRdS.png', 'ae6d67d2069a7bfc97d79943089be03b', '1', '2019-09-19 17:52:14', '2019-09-19 17:52:14');
INSERT INTO `pictures` VALUES ('4', '0', '0', '微信图片_20190401192018.png', '49552', 'public/uploads/pictures/E17PPzgwRwV1AIVd9vjQBQi1aVLaWkE35Q1HtuJw.png', 'c70b8c251fefe7dd4ba1cbc1d552cfe0', '1', '2019-09-26 15:24:14', '2019-09-26 15:24:14');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adminid` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `category_id` int(11) NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `author` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '文章作者',
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '文章来源',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `cover_ids` text COLLATE utf8mb4_unicode_ci,
  `pid` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ARTICLE' COMMENT '文章类型（ARTICLE/PAGE/LINK等）',
  `show_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '文章展示形式（1：无图，2：单图-小，3：多图，4：单图-大）',
  `position` tinyint(4) DEFAULT '0' COMMENT '推荐位',
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '外部连接',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` int(11) DEFAULT '0' COMMENT '评论数量',
  `view` int(11) DEFAULT '0' COMMENT '浏览数量',
  `page_tpl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'page类型时模板名称',
  `comment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `file_id` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', '1', '0', '1', '默认文章,你好世界！', '你好，世界！', 'hello', 'tangtanglove', '1', 'Hello, world”程序是指在计算机屏幕上输出“Hello,world”这行字符串的计算机程序，“hello, world”的中文意思是“你好，世界。”。这个例程在Brian Kernighan 和Dennis M. Ritchie合著的《The C Programme Language》使用而广泛流行。', '', '', '0', '0', 'ARTICLE', '1', '1', '', '“Hello, world”程序是指在计算机屏幕上输出“Hello,world”这行字符串的计算机程序，“hello, world”的中文意思是“你好，世界。”。这个例程在Brian Kernighan 和Dennis M. Ritchie合著的《The C Programme Language》使用而广泛流行。因为它的简洁，实用，并包含了一个该版本的C程序首次出现在1974年Brian Kernighan所撰写的《Programming in C: A Tutorial》', '0', '0', '', 'open', '1', '0', '2019-09-09 15:56:53', '2019-09-09 15:56:53', null);
INSERT INTO `posts` VALUES ('2', '1', '0', '1', '使用说明,配置手册', '使用说明', 'doc', 'tangtanglove', '本站', '说明书多种多样，说明书的写作格式也不拘一格，不可一概而论。本文将举出一些常见的说明书的具体例子，以期使读者对此有一明确的认识。', '', '', '0', '0', 'ARTICLE', '1', '0', '', 'https://www.kancloud.cn/tangtanglove/easyadmin/435582', '0', '0', '', 'open', '1', '0', '2019-09-09 15:56:53', '2019-09-09 15:56:53', null);
INSERT INTO `posts` VALUES ('3', '1', '0', '1', '开发文档,帮助文件', '开发文档', 'help', 'tangtanglove', '本站', '软件开发文档是软件开发使用和维护过程中的必备资料。它能提高软件开发的效率，保证软件的质量，而且在软件的使用过程中有指导，帮助，解惑的作用，尤其在维护工作中，文档是不可或缺的资料。', null, '[{\"id\":3,\"uid\":3,\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20190319150608.png\",\"size\":10075,\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/9C2z8YwmFdmUf6t3iJnkIF9wXtBRnfkqw4iYWRdS.png\"},{\"id\":4,\"uid\":4,\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20190401192018.png\",\"size\":49552,\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/E17PPzgwRwV1AIVd9vjQBQi1aVLaWkE35Q1HtuJw.png\"}]', '0', '0', 'ARTICLE', '1', '0', '', '<p>https://www.kancloud.cn/tangtanglove/easyadmin/435582</p>', '0', '0', '', 'open', '1', '0', '2019-09-09 15:56:53', '2019-09-26 15:31:04', null);
INSERT INTO `posts` VALUES ('4', '1', '0', '1', '关于我们,介绍', '关于我们', 'aboutus', 'tangtanglove', '本站', '关于我们,介绍', '', '', '0', '0', 'PAGE', '1', '0', '', '这是一个关于我们的文章，您可以填一下介绍什么的。', '0', '0', 'page/index', 'open', '1', '0', '2019-09-09 15:56:53', '2019-09-09 15:56:53', null);
INSERT INTO `posts` VALUES ('5', '1', '0', '1', '帮助中心,帮助', '帮助中心', 'help', 'tangtanglove', '本站', '帮助中心,帮助', '', '', '0', '0', 'PAGE', '1', '0', '', '这是一个帮助中心的文章，您可以填一下帮助什么的。', '0', '0', 'page/index', 'open', '1', '0', '2019-09-09 15:56:53', '2019-09-09 15:56:53', null);

-- ----------------------------
-- Table structure for printers
-- ----------------------------
DROP TABLE IF EXISTS `printers`;
CREATE TABLE `printers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '打印机名称',
  `machine_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '易联云打印机终端号',
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机卡号码',
  `client_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用ID',
  `client_secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用密钥',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of printers
-- ----------------------------

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for shop_categories
-- ----------------------------
DROP TABLE IF EXISTS `shop_categories`;
CREATE TABLE `shop_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `cover_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类缩略名',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类描述',
  `index_tpl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lists_tpl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail_tpl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_num` int(11) NOT NULL DEFAULT '10' COMMENT '分页数量',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shop_categories
-- ----------------------------
INSERT INTO `shop_categories` VALUES ('1', '0', '食品', '0', '0', 'shipin', '食品', null, null, null, '10', '1', '2019-09-19 17:50:51', '2019-09-19 17:50:51', null);

-- ----------------------------
-- Table structure for shop_self_categories
-- ----------------------------
DROP TABLE IF EXISTS `shop_self_categories`;
CREATE TABLE `shop_self_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `shop_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) DEFAULT '0',
  `cover_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类缩略名',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类描述',
  `index_tpl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lists_tpl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail_tpl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_num` int(11) NOT NULL DEFAULT '10' COMMENT '分页数量',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shop_self_categories
-- ----------------------------

-- ----------------------------
-- Table structure for shopping_carts
-- ----------------------------
DROP TABLE IF EXISTS `shopping_carts`;
CREATE TABLE `shopping_carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sku_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shopping_carts
-- ----------------------------

-- ----------------------------
-- Table structure for shops
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `printer_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺名称',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺logo',
  `category_id` int(11) NOT NULL COMMENT '店铺分类',
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺标签',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺描述',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺介绍',
  `cover_ids` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺封面',
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺排序，越大越靠前',
  `position` tinyint(4) NOT NULL COMMENT '推荐位',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺联系人',
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺电话',
  `province` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省',
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '市',
  `county` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '县',
  `town` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '镇',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '详细地址',
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '经度',
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '纬度',
  `business_license_cover_id` int(11) DEFAULT NULL COMMENT '营业执照照片',
  `corporate_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '法人姓名',
  `corporate_idcard` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '法人身份证号',
  `corporate_idcard_cover_id` int(11) DEFAULT NULL COMMENT '法人身份证照片',
  `comment` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评论数',
  `view` tinyint(4) NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `comment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open' COMMENT '是否允许评论',
  `rate` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评分',
  `open_days` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '营业日期：1~2,4~7，数字代表周几',
  `open_times` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '营业时间段：09:00~12:00,13:00~14:00',
  `open_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:营业,2:打烊',
  `is_self` tinyint(4) DEFAULT NULL COMMENT '是否为自营店',
  `status` tinyint(4) NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('1', '1', '0', '迁团大卖超市', '3', '1', '', '迁团大卖超市', '<p>迁团大卖超市</p>', '[]', '1', '0', '郭云飞', '15076569631', '北京', '北京市', '东城区', null, '燕钢小区河北省迁安市迁安镇燕钢丽景家园小区', '116.397724', '39.903755', null, null, null, null, '0', '0', '1', '0', '[1,2,3,4,5,6,7]', '[\"00:00\",\"23:59\"]', '2', '0', '1', '2019-09-19 17:56:54', '2019-09-19 17:56:54');

-- ----------------------------
-- Table structure for sms
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '验证码',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送内容',
  `error_times` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sms
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `realname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT '1',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00',
  `score` int(11) DEFAULT '0',
  `wechat_openid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `wechat_unionid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `qq_openid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weibo_uid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `last_login_time` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'tangtanglove', 'tangtanglove', null, 'dai_hang_love@126.com', '15076569631', '1', '$2y$10$GehSffWOzycvxCdBVeuZfeogjRpr1eXrfFa0y9xQOieKbTIInfa5q', null, '0.00', '0', '', '', '', '', '', null, '1', null, null, '2019-09-19 17:52:48', '2019-09-19 17:52:48', null);

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adminid` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `category_id` int(11) NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `author` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '文章作者',
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '文章来源',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `cover_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pid` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '0',
  `position` tinyint(4) DEFAULT '0' COMMENT '推荐位',
  `path` int(11) NOT NULL COMMENT 'file里面的id',
  `duration` int(11) NOT NULL COMMENT '时长',
  `comment` int(11) DEFAULT '0' COMMENT '评论数量',
  `view` int(11) DEFAULT '0' COMMENT '浏览数量',
  `comment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of videos
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_users
-- ----------------------------
DROP TABLE IF EXISTS `wechat_users`;
CREATE TABLE `wechat_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `wechat_openid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wechat_unionid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'DYH,FWH,MP',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wechat_users
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
