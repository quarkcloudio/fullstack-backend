/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : fullstack

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-07-26 11:46:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account_logs
-- ----------------------------
DROP TABLE IF EXISTS `account_logs`;
CREATE TABLE `account_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adminid` int(11) DEFAULT NULL,
  `uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of action_logs
-- ----------------------------

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
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `qq_openid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weibo_uid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `wechat_openid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `wechat_unionid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'administrator', '超级管理员', 'admin@yourweb.com', '10086', '1', '$2y$10$3oTf1wNz/LMicAnHc0WRPujqs94E4q2Yo4L0dPNeS21Wm1xI7DwNS', '', '', '', '', '', '127.0.0.1', '2019-07-26 10:48:39', '1', 'FnMwEPMfeG', '2019-03-08 08:25:58', '2019-07-26 10:48:39', null);
INSERT INTO `admins` VALUES ('2', '郭云飞', '杨过', 'dai_hang_love@126.com', '', '1', '$2y$10$QQGux06mhnoGxDMzF7/M9O82dkMZL/TJLT4zPjvR2cGXZBLXgFujW', '', '', '', '', '', '', null, '1', null, '2019-05-09 17:29:51', '2019-05-09 17:47:51', '2019-05-09 17:47:51');
INSERT INTO `admins` VALUES ('4', '狮子鱼', '萌叔叔丶', 'dai_hang_love@136.com', '15076569622', '1', '$2y$10$2KbQstMpjTr3EakWVvIRUu.ZoGqRB8km4JvZ2cMreQlH9r4cFzoQW', '', '', '', '', '', '', null, '1', null, '2019-05-09 17:59:52', '2019-05-09 18:09:57', '2019-05-09 18:09:57');
INSERT INTO `admins` VALUES ('5', 'tangtanglove', 'tangtanglove', 'dai_hang_love@10.com', '15076569631', '1', '$2y$10$cDPbgBAVvFkfQJzCnDCQk.m.87Heo1EAd3SX3EjpZ1Qyf8mjjJA82', '', '', '', '', '', '127.0.0.1', '2019-07-26 10:43:55', '1', null, '2019-05-09 18:10:20', '2019-07-26 10:43:55', null);
INSERT INTO `admins` VALUES ('6', 'tangtanglove6', 'tangtanglove2', 'dai_hang_love@138.com', '15076568631', '1', '$2y$10$jNj.Q1n1.gmZwMzM0wX/..0VNjvD73WhvDb3AF1SSQNRSmA/5KBzS', '', '', '', '', '', '', null, '1', null, '2019-07-19 19:16:24', '2019-07-21 11:29:22', null);
INSERT INTO `admins` VALUES ('7', '狮子鱼1', '狮子鱼', 'admin@yourweb1.com', '15076568634', '1', '$2y$10$jMkWj1Gv4cmeN3gALXIdS.pHeowbjXPfQOoRIy40KA3dWYoH8gFou', '', '', '', '', '', '', null, '0', null, '2019-07-21 11:29:57', '2019-07-21 11:30:20', null);

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
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
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
  `cover_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `cover_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '0', '新闻', '0', '0', 'news', '新闻中心,包含有时政新闻、国内新闻、国际新闻、社会新闻、时事评论、新闻图片、新闻专题、新闻论坛、军事、历史、的专业时事报道门户网站。', '0', 'article/index', 'article/lists', 'article/detail', '10', '1', 'ARTICLE', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);
INSERT INTO `categories` VALUES ('2', '0', '商城', '0', '0', 'mall', '商品中心', '0', 'goods/index', 'goods/lists', 'goods/detail', '10', '1', 'GOODS', '2019-03-08 08:25:59', '2019-07-25 14:42:55', null);

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
  `cover_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '晒图',
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of configs
-- ----------------------------
INSERT INTO `configs` VALUES ('1', '网站名称', 'text', 'WEB_SITE_NAME', '基本', 'Admin CMF', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('2', '关键字', 'text', 'WEB_SITE_KEYWORDS', '基本', 'Admin CMF', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('3', '描述', 'textarea', 'WEB_SITE_DESCRIPTION', '基本', 'Admin CMF', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('4', 'Logo', 'picture', 'WEB_SITE_LOGO', '基本', '40', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('5', '统计代码', 'textarea', 'WEB_SITE_SCRIPT', '基本', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('6', '网站版权', 'text', 'WEB_SITE_COPYRIGHT', '基本', '© Company 2019', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('7', '开启网站', 'switch', 'WEB_SITE_OPEN', '基本', '1', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('8', '服务器地址', 'text', 'EMAIL_HOST', '邮件', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('9', '服务器端口', 'text', 'EMAIL_PORT', '邮件', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('10', '发件人邮箱', 'text', 'EMAIL_USERNAME', '邮件', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('11', '发件人密码', 'text', 'EMAIL_PASSWORD', '邮件', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('12', 'app_key', 'text', 'ALIDAYU_APP_KEY', '阿里云通信', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('13', 'app_secret', 'text', 'ALIDAYU_APP_SECRET', '阿里云通信', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('14', '签名', 'text', 'ALIDAYU_SIGNNAME', '阿里云通信', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('15', '模板代码', 'text', 'ALIDAYU_TEMPLATE_CODE', '阿里云通信', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('16', 'key_id', 'text', 'OSS_ACCESS_KEY_ID', '阿里云OSS', '', '你的AccessKeyId', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('17', 'key_secret', 'text', 'OSS_ACCESS_KEY_SECRET', '阿里云OSS', '', '你的AccessKeySecret', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('18', 'endpoint', 'text', 'OSS_ENDPOINT', '阿里云OSS', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('19', 'bucket', 'text', 'OSS_BUCKET', '阿里云OSS', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('20', '自定义域名', 'text', 'OSS_MYDOMAIN', '阿里云OSS', '', '例如：oss.web.com', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('21', '开启云存储', 'switch', 'OSS_OPEN', '阿里云OSS', '1', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('22', '用户ID', 'text', 'SIOO_UID', '希奥短信', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('23', '企业代码', 'text', 'SIOO_CODE', '希奥短信', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('24', '用户密码', 'text', 'SIOO_PASSWORD', '希奥短信', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('25', 'app_id', 'text', 'WECHAT_PAY_APP_ID', '微信支付', '', 'JSAPI支付授权目录，例如：http://www.web.com/wechat/wechat/', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('26', 'merchant_id', 'text', 'WECHAT_PAY_MERCHANTID', '微信支付', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('27', 'key', 'text', 'WECHAT_PAY_KEY', '微信支付', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('28', 'apiclient_cert', 'file', 'WECHAT_PAY_APICLIENT_CERT', '微信支付', '2', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('29', 'apiclient_key', 'file', 'WECHAT_PAY_APICLIENT_KEY', '微信支付', '4', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('30', 'app_id', 'text', 'WECHAT_APP_PAY_APP_ID', '微信APP支付', '', '需要在开放平台申请', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('31', 'merchant_id', 'text', 'WECHAT_APP_PAY_MERCHANTID', '微信APP支付', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('32', 'key', 'text', 'WECHAT_APP_PAY_KEY', '微信APP支付', '', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('33', 'apiclient_cert', 'file', 'WECHAT_APP_PAY_APICLIENT_CERT', '微信APP支付', null, '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('34', 'apiclient_key', 'file', 'WECHAT_APP_PAY_APICLIENT_KEY', '微信APP支付', null, '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('35', 'sign_type', 'text', 'ALIPAY_SIGN_TYPE', '支付宝', 'RSA2', '', '1', null, '2019-07-24 14:25:06', null);
INSERT INTO `configs` VALUES ('36', 'app_id', 'text', 'ALIPAY_APP_ID', '支付宝', '', '', '1', null, '2019-07-24 15:02:24', null);
INSERT INTO `configs` VALUES ('37', 'private_key', 'textarea', 'ALIPAY_PRIVATE_KEY', '支付宝', '', '', '1', null, '2019-07-24 15:02:24', null);
INSERT INTO `configs` VALUES ('38', 'ali_public_key', 'textarea', 'ALIPAY_PUBLIC_KEY', '支付宝', '', '', '1', null, '2019-07-24 15:02:24', null);
INSERT INTO `configs` VALUES ('39', 'QQ Key', 'text', 'QQ_APP_KEY', '社交登录', '', '', '1', null, '2019-07-24 15:02:24', null);
INSERT INTO `configs` VALUES ('40', 'QQ Secret', 'text', 'QQ_APP_SECRET', '社交登录', '', '', '1', null, '2019-07-24 15:02:24', null);
INSERT INTO `configs` VALUES ('41', '微博 Key', 'text', 'WEIBO_APP_KEY', '社交登录', '', '', '1', null, '2019-07-24 15:02:24', null);
INSERT INTO `configs` VALUES ('42', '微博 Secret', 'text', 'WEIBO_APP_SECRET', '社交登录', '', '', '1', null, '2019-07-24 15:02:24', null);
INSERT INTO `configs` VALUES ('43', '微信 Key', 'text', 'WECHAT_APP_KEY', '社交登录', '', '', '1', null, '2019-07-24 15:02:24', null);
INSERT INTO `configs` VALUES ('44', '微信 Secret', 'text', 'WECHAT_APP_SECRET', '社交登录', '', '', '1', null, '2019-07-24 15:02:24', null);
INSERT INTO `configs` VALUES ('45', '开发者模式', 'switch', 'APP_DEBUG', '基本', '1', '', '1', null, '2019-07-24 15:02:24', null);
INSERT INTO `configs` VALUES ('46', '测试图片', 'picture', 'TEST', '基本', '6', null, '1', '2019-05-10 15:22:49', '2019-05-10 18:21:09', '2019-05-10 18:21:09');
INSERT INTO `configs` VALUES ('47', '测试内容', 'text', 'TEST1', '基本', null, '基本', '0', '2019-07-24 14:47:50', '2019-07-24 14:53:15', null);
INSERT INTO `configs` VALUES ('48', 'FullstackCMS', 'text', 'FullstackCMS', '基础', null, 'FullstackCMS', '0', '2019-07-24 14:52:17', '2019-07-24 14:52:44', null);

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
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) unsigned DEFAULT NULL COMMENT '商家id',
  `goods_category_id` int(11) unsigned DEFAULT NULL COMMENT '商品分类',
  `shop_self_category_ids` varchar(0) DEFAULT NULL COMMENT '商家商品分类',
  `tags` varchar(255) DEFAULT NULL COMMENT '标签',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌id',
  `goods_attrs` varchar(255) DEFAULT NULL COMMENT '平台系统属性',
  `other_attrs` varchar(255) DEFAULT NULL COMMENT '商家自定义属性',
  `goods_moq` int(11) DEFAULT NULL COMMENT '最小起订量',
  `goods_price` decimal(10,2) DEFAULT NULL COMMENT '店铺价:价格必须是0.01~9999999之间的数字，且不能高于市场价',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价:为0则商品详情页不显示，价格必须是0.00~9999999之间的数字，此价格仅为市场参考售价，请根据该实际情况认真填写',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT '成本价:价格必须是0.00~9999999之间的数字，此价格为商户对所销售的商品实际成本价格进行备注记录',
  `stock_num` int(11) DEFAULT NULL COMMENT '商品库存,店铺库存数量必须为0~999999999之间的整数，若商品存在规格，则系统自动计算商品的总数，此处无需卖家填写',
  `warn_num` int(11) DEFAULT NULL COMMENT '设置最低库存预警值。当库存低于预警值时商家中心商品列表页库存列红字提醒，0为不预警',
  `goods_sn` varchar(255) DEFAULT NULL COMMENT '商品货号是指商家管理商品的编号，买家不可见',
  `goods_barcode` varchar(255) DEFAULT NULL COMMENT '支持一品多码，多个条形码之间用逗号分隔',
  `goods_stockcode` varchar(255) DEFAULT NULL COMMENT '实体仓库存储商品位置编码',
  `cover_id` int(11) DEFAULT NULL COMMENT '上传商品默认主图，无规格主图时展示该图',
  `video_id` int(11) DEFAULT NULL COMMENT '主图视频',
  `pc_content` longtext COMMENT '电脑端商品详情',
  `mobile_content` longtext COMMENT '手机端商品详情',
  `top_layout_id` int(11) DEFAULT NULL COMMENT '详情页顶部模板',
  `bottom_layout_id` int(11) DEFAULT NULL COMMENT '详情页底部模板',
  `packing_layout_id` int(11) DEFAULT NULL COMMENT '详情页包装清单版式',
  `service_layout_id` int(11) DEFAULT NULL COMMENT '详情页售后保证版式',
  `goods_weight` double DEFAULT NULL COMMENT '物流重量，商品的重量单位为千克，如果商品的运费模板按照重量计算请填写此项，为空则默认商品重量为0Kg；',
  `goods_volume` varchar(255) DEFAULT NULL COMMENT '商品的体积单位为立方米，如果商品的运费模板按照体积计算请填写此项，为空则默认商品体积为0立方米；',
  `goods_freight_type` varchar(255) DEFAULT NULL COMMENT '运费类型 0：店铺承担运费 ，1：运费模板',
  `freight_id` int(11) DEFAULT NULL COMMENT '运费模板id',
  `invoice_type` tinyint(3) DEFAULT NULL COMMENT '发票：0无，1增值税普通发票，2增值税专用发票，3 增值税普通发票 和 增值税专用发票，选择“无”则将不提供发票',
  `user_discount` tinyint(3) DEFAULT NULL COMMENT '会员打折：0 不参与会员打折，1参与会员打折，指的是统一的会员折扣是否参与，参与和不参与会员折扣不影响自定义会员价',
  `stock_mode` tinyint(3) DEFAULT NULL COMMENT '库存计数：1拍下减库存，2付款减库存，3出库减库存 拍下减库存：买家拍下商品即减少库存，存在恶拍风险。热销商品如需避免超卖可选此方式',
  `comment` int(11) DEFAULT NULL COMMENT '评论数量',
  `view` int(11) DEFAULT NULL COMMENT '浏览数量',
  `sales_num` int(11) DEFAULT NULL,
  `comment_status` varchar(255) DEFAULT NULL,
  `rate` tinyint(3) DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL COMMENT '1出售中，2审核中，3已下架，4商品违规下架',
  `goods_reason` varchar(255) DEFAULT NULL,
  `opened_at` timestamp NULL DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_sku` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for goods_attribute_alias
-- ----------------------------
DROP TABLE IF EXISTS `goods_attribute_alias`;
CREATE TABLE `goods_attribute_alias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_attribute_id` int(11) DEFAULT NULL COMMENT '商品规格id',
  `goods_sku_id` int(11) DEFAULT NULL COMMENT '商品单元id',
  `name` varchar(255) DEFAULT NULL COMMENT '规格别名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of goods_attribute_alias
-- ----------------------------

-- ----------------------------
-- Table structure for goods_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `goods_attribute_values`;
CREATE TABLE `goods_attribute_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_attribute_id` int(11) DEFAULT NULL COMMENT '商品属性id',
  `vname` varchar(255) DEFAULT NULL COMMENT '属性值名称',
  `sort` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of goods_attribute_values
-- ----------------------------

-- ----------------------------
-- Table structure for goods_attributes
-- ----------------------------
DROP TABLE IF EXISTS `goods_attributes`;
CREATE TABLE `goods_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) unsigned DEFAULT NULL COMMENT '商家id，可选',
  `goods_type_id` int(11) DEFAULT NULL COMMENT '商品类型',
  `name` varchar(255) DEFAULT NULL COMMENT '属性或规格名称',
  `description` varchar(255) DEFAULT NULL COMMENT '属性或规格描述',
  `style` tinyint(4) DEFAULT NULL COMMENT '显示样式：1多选，2单选，3文本，多选：以复选框的形式让商家勾选属性值；',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '1:spu商品属性,2:sku商品规格用于销售',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of goods_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for goods_categories
-- ----------------------------
DROP TABLE IF EXISTS `goods_categories`;
CREATE TABLE `goods_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) DEFAULT '0',
  `cover_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类缩略名',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分类描述',
  `index_tpl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lists_tpl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `detail_tpl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `page_num` int(11) NOT NULL DEFAULT '10' COMMENT '分页数量',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of goods_categories
-- ----------------------------

-- ----------------------------
-- Table structure for goods_category_attributes
-- ----------------------------
DROP TABLE IF EXISTS `goods_category_attributes`;
CREATE TABLE `goods_category_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_category_id` int(10) unsigned DEFAULT NULL COMMENT '商品分类',
  `goods_attribute_id` int(11) DEFAULT NULL COMMENT '关联属性id或规格id',
  `gorup_name` varchar(255) DEFAULT NULL COMMENT '分组名',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `type` int(11) DEFAULT NULL COMMENT '1:spu商品属性,2:sku商品规格用于销售',
  `is_required` tinyint(3) DEFAULT NULL COMMENT '是否必填',
  `is_filter` tinyint(3) DEFAULT NULL COMMENT '是否筛选 勾选后此属性、规格会作为筛选条件展示在前台的商品列表页的筛选区域',
  `is_alias` tinyint(3) DEFAULT NULL COMMENT '允许别名 勾选此项后，此规格的名称就可以被店铺修改，例如：平台方此规格是颜色，店铺在自己编辑时把颜色改为版本，其他店铺依旧是颜色',
  `is_desc` tinyint(3) DEFAULT NULL COMMENT '勾选此项后，店铺在编辑此规格时即可以为规格添加备注，前台鼠标经过规格时展示该备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of goods_category_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for goods_info_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `goods_info_attribute_values`;
CREATE TABLE `goods_info_attribute_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) unsigned DEFAULT NULL COMMENT '商品id',
  `goods_sku_id` int(11) DEFAULT NULL COMMENT '商品sku，可以为空',
  `goods_attribute_id` int(11) DEFAULT NULL COMMENT '商品规格id',
  `goods_attribute_value_id` int(11) DEFAULT NULL COMMENT '商品规格值id',
  `type` tinyint(3) DEFAULT NULL COMMENT '1:spu商品属性,2:sku商品规格用于销售',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of goods_info_attribute_values
-- ----------------------------

-- ----------------------------
-- Table structure for goods_order_details
-- ----------------------------
DROP TABLE IF EXISTS `goods_order_details`;
CREATE TABLE `goods_order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0',
  `goods_sku_id` int(11) NOT NULL,
  `mall_order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num` int(11) NOT NULL COMMENT '购买数量',
  `goods_price` decimal(10,2) NOT NULL COMMENT '现价',
  `market_price` decimal(10,2) NOT NULL COMMENT '原价',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_ids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:等待付款，1:已付款，2：已退款',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of goods_order_details
-- ----------------------------

-- ----------------------------
-- Table structure for goods_orders
-- ----------------------------
DROP TABLE IF EXISTS `goods_orders`;
CREATE TABLE `goods_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `cart_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '购物车json数据，用于购买完商品之后，清除购物车信息',
  `consignee` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '收货人',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '收货地址',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '收货人电话',
  `express_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '快递名称',
  `express_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '快递单号',
  `express_created_at` datetime DEFAULT NULL COMMENT '快递发送时间',
  `express_finished_at` datetime DEFAULT NULL COMMENT '快递完成时间',
  `send_uid` tinyint(4) DEFAULT NULL COMMENT '配送员',
  `send_status` tinyint(4) DEFAULT '0' COMMENT '配送状态',
  `send_created_at` timestamp NULL DEFAULT NULL COMMENT '配送分配时间',
  `send_finished_at` timestamp NULL DEFAULT NULL COMMENT '配送完成时间',
  `trade_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'WAIT_BUYER_PAY' COMMENT 'WAIT_BUYER_PAY:交易创建，等待买家付款;TRADE_CLOSED:未付款交易超时关闭，或支付完成后全额退款;TRADE_SUCCESS:交易支付成功;TRADE_FINISHED:交易结束，不可退款',
  `remark` longtext COLLATE utf8mb4_unicode_ci COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of goods_orders
-- ----------------------------

-- ----------------------------
-- Table structure for goods_photos
-- ----------------------------
DROP TABLE IF EXISTS `goods_photos`;
CREATE TABLE `goods_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) unsigned DEFAULT NULL,
  `goods_sku_id` int(11) DEFAULT NULL,
  `cover_id` int(11) DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of goods_photos
-- ----------------------------

-- ----------------------------
-- Table structure for goods_skus
-- ----------------------------
DROP TABLE IF EXISTS `goods_skus`;
CREATE TABLE `goods_skus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) unsigned DEFAULT NULL,
  `shop_id` int(11) unsigned DEFAULT NULL,
  `properties` longtext,
  `property_name` longtext,
  `stock_num` int(11) DEFAULT NULL,
  `warn_num` int(11) DEFAULT NULL,
  `goods_price` decimal(10,2) DEFAULT NULL,
  `market_price` decimal(10,2) DEFAULT NULL,
  `goods_sn` varchar(255) DEFAULT NULL,
  `goods_barcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of goods_skus
-- ----------------------------

-- ----------------------------
-- Table structure for goods_types
-- ----------------------------
DROP TABLE IF EXISTS `goods_types`;
CREATE TABLE `goods_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of goods_types
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', '文章管理', 'admin', 'file-word', '0', '0', '/article', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('2', '文章列表', 'admin', '', '1', '0', '/article/index', '1', '1', null, '2019-07-25 20:02:29');
INSERT INTO `menus` VALUES ('3', '发布文章', 'admin', '', '1', '0', '/article/create', '1', '1', null, '2019-07-25 20:02:45');
INSERT INTO `menus` VALUES ('4', '我的文章', 'admin', '', '1', '0', '/article/myPublished', '1', '1', null, '2019-07-25 20:03:53');
INSERT INTO `menus` VALUES ('5', '单页管理', 'admin', 'file-ppt', '0', '0', '/page', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('6', '单页列表', 'admin', '', '5', '0', '/page/index', '1', '1', null, '2019-07-25 20:04:26');
INSERT INTO `menus` VALUES ('7', '添加单页', 'admin', '', '5', '0', '/page/create', '1', '1', null, '2019-07-25 20:04:46');
INSERT INTO `menus` VALUES ('8', '会员管理', 'admin', 'user-add', '0', '0', '/user', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('9', '会员列表', 'admin', '', '8', '0', '/user/index', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('10', '添加会员', 'admin', '', '8', '0', '/user/create', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('11', '管理员', 'admin', 'usergroup-add', '0', '0', '/admin', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('12', '管理员列表', 'admin', '', '11', '0', '/admin/user', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('13', '权限列表', 'admin', '', '11', '0', '/admin/permission', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('14', '角色列表', 'admin', '', '11', '0', '/admin/role', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('15', '广告管理', 'admin', 'file-word', '0', '0', '/banner', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('16', '广告列表', 'admin', '', '15', '0', '/banner/banner', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('17', '广告位列表', 'admin', '', '15', '0', '/banner/bannerCategory', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('18', '应用插件', 'admin', 'snippets', '0', '0', '/plugin', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('19', '评论管理', 'admin', '', '18', '0', '/plugin/comment', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('20', '友情链接', 'admin', '', '18', '0', '/plugin/link', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('21', '打印机管理', 'admin', '', '18', '0', '/plugin/printer', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('22', '系统配置', 'admin', 'setting', '0', '0', '/system', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('23', '设置管理', 'admin', '', '22', '-2', '/system/config', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('24', '网站设置', 'admin', '', '23', '0', '/system/config/website', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('25', '配置管理', 'admin', '', '23', '0', '/system/config/index', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('26', '所有导航', 'admin', '', '22', '0', '/system/navigation', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('27', '分类列表', 'admin', '', '22', '0', '/system/category', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('28', '短信列表', 'admin', '', '22', '0', '/system/sms/index', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('29', '操作日志', 'admin', '', '22', '0', '/system/actionLog/index', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('30', '附件空间', 'admin', 'paper-clip', '0', '0', '/attachment', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('31', '文件管理', 'admin', '', '30', '0', '/attachment/file', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('32', '图片管理', 'admin', '', '30', '0', '/attachment/picture', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('33', '我的账号', 'admin', 'user', '0', '0', '/account', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('34', '个人设置', 'admin', '', '33', '0', '/account/settings', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('35', '菜单管理', 'admin', '', '22', '-1', '/system/menu/index', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('36', '编辑文章', 'admin', '', '1', '0', '', '0', '-1', '2019-05-09 09:44:00', '2019-07-25 20:03:03');
INSERT INTO `menus` VALUES ('39', '控制台', 'admin', 'home', '0', '-2', '/console', '1', '1', '2019-05-09 18:17:44', '2019-07-24 17:51:25');
INSERT INTO `menus` VALUES ('40', '基础权限', 'admin', '', '39', '0', null, '0', '-1', '2019-05-09 18:21:33', '2019-07-25 19:59:10');
INSERT INTO `menus` VALUES ('41', '主页', 'admin', '', '39', '0', '/console/index?id=1', '1', '1', '2019-05-13 14:41:55', '2019-07-25 20:13:44');
INSERT INTO `menus` VALUES ('45', '文章编辑', 'admin', 'bars', '42', '0', 'article/edit', '1', '-1', '2019-07-24 17:15:46', '2019-07-24 17:50:16');
INSERT INTO `menus` VALUES ('46', '网站编辑', 'admin', 'desktop', '42', '0', '/article/create', '1', '-1', '2019-07-24 17:37:04', '2019-07-24 17:48:38');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `migrations` VALUES ('8', '2019_01_30_080034_create_admins_table', '1');
INSERT INTO `migrations` VALUES ('9', '2019_01_30_080743_create_action_logs_table', '1');
INSERT INTO `migrations` VALUES ('10', '2019_01_30_081529_create_address_table', '1');
INSERT INTO `migrations` VALUES ('11', '2019_01_30_081948_create_banner_categories_table', '1');
INSERT INTO `migrations` VALUES ('12', '2019_01_30_082453_create_banners_table', '1');
INSERT INTO `migrations` VALUES ('13', '2019_01_30_082625_create_brokes_table', '1');
INSERT INTO `migrations` VALUES ('14', '2019_01_30_082803_create_bugs_table', '1');
INSERT INTO `migrations` VALUES ('15', '2019_01_30_082859_create_categories_table', '1');
INSERT INTO `migrations` VALUES ('16', '2019_01_30_083321_create_comments_table', '1');
INSERT INTO `migrations` VALUES ('17', '2019_01_30_083510_create_configs_table', '1');
INSERT INTO `migrations` VALUES ('18', '2019_01_30_083614_create_files_table', '1');
INSERT INTO `migrations` VALUES ('19', '2019_01_30_091348_create_links_table', '1');
INSERT INTO `migrations` VALUES ('20', '2019_01_30_091501_create_menus_table', '1');
INSERT INTO `migrations` VALUES ('21', '2019_02_11_073220_create_message_reads_table', '1');
INSERT INTO `migrations` VALUES ('22', '2019_02_11_073506_create_messages_table', '1');
INSERT INTO `migrations` VALUES ('23', '2019_02_11_081013_create_navigations_table', '1');
INSERT INTO `migrations` VALUES ('24', '2019_02_11_081942_create_pictures_table', '1');
INSERT INTO `migrations` VALUES ('25', '2019_02_11_082042_create_posts_table', '1');
INSERT INTO `migrations` VALUES ('26', '2019_02_11_082339_create_sms_table', '1');
INSERT INTO `migrations` VALUES ('27', '2019_02_11_084439_create_videos_table', '1');
INSERT INTO `migrations` VALUES ('28', '2019_03_08_081738_create_permission_tables', '1');

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
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_id` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of navigations
-- ----------------------------
INSERT INTO `navigations` VALUES ('1', '0', '0', '首页', '/index/index', '0', '0', '1', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);
INSERT INTO `navigations` VALUES ('2', '0', '0', '新闻', '/article/lists?name=news', '0', '0', '1', '2019-03-08 08:25:59', '2019-07-25 14:08:48', null);
INSERT INTO `navigations` VALUES ('3', '0', '0', '商城', '/goods/lists?name=mall', '0', '0', '1', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);
INSERT INTO `navigations` VALUES ('4', '0', '0', '关于', '/page/index?name=aboutus', '0', '0', '1', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);

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
INSERT INTO `oauth_access_tokens` VALUES ('00156e37fe5a260a818e348603135199e9f51690261580019360f9b90998bb0254b6dad835b4f77c', '1', '1', 'FullStack', '[]', '0', '2019-07-23 17:54:57', '2019-07-23 17:54:57', '2020-07-23 17:54:57');
INSERT INTO `oauth_access_tokens` VALUES ('00a02d59faade06c937d30969ca3e6f0c70ecece0c8c8a81102a1a656ca9cad3c8cad9aa42e9e217', '1', '1', 'FullStack', '[]', '0', '2019-05-09 18:50:58', '2019-05-09 18:50:58', '2020-05-09 18:50:58');
INSERT INTO `oauth_access_tokens` VALUES ('018db70af3d7bc545da9160a77d7c23578383ec9e19cf58554c87caa27b06eb229878ec2a97fb40e', '1', '1', 'FullStack', '[]', '0', '2019-06-12 15:13:37', '2019-06-12 15:13:37', '2020-06-12 15:13:37');
INSERT INTO `oauth_access_tokens` VALUES ('0224fc3bcd7b9ccd0d6e44075267a60f0c643837c2af6b94659b5c6ab8ece4ac528578e68663e0ba', '1', '1', 'FullStack', '[]', '0', '2019-07-25 08:35:46', '2019-07-25 08:35:46', '2020-07-25 08:35:46');
INSERT INTO `oauth_access_tokens` VALUES ('02447d5eae69ea14b5828e2f374a635e348202c4c879a6ef74b0bfa87e123e2ed46bc0b985358718', '1', '1', 'FullStack', '[]', '0', '2019-04-05 09:35:45', '2019-04-05 09:35:45', '2020-04-05 09:35:45');
INSERT INTO `oauth_access_tokens` VALUES ('025d414053cb945b5a6f2a25336a633ec5258236ba99b36bfa5b2a28f5b7955eaa077e6f61202995', '1', '1', 'FullStack', '[]', '0', '2019-05-31 15:32:53', '2019-05-31 15:32:53', '2020-05-31 15:32:53');
INSERT INTO `oauth_access_tokens` VALUES ('02950a366883c480b6f6e0a076c916eacf9b54a55ff8ac895fb87aed315ecd1bca3b59a5d759a4c2', '1', '1', 'FullStack', '[]', '0', '2019-07-19 14:30:05', '2019-07-19 14:30:05', '2020-07-19 14:30:05');
INSERT INTO `oauth_access_tokens` VALUES ('0415855644d8a21b6af81a6f9bd9b689446da814dd1a0c955eb0a016c9c63a2f721b03980342aaf1', '1', '1', 'FullStack', '[]', '0', '2019-04-03 14:59:39', '2019-04-03 14:59:39', '2020-04-03 14:59:39');
INSERT INTO `oauth_access_tokens` VALUES ('04b217ffd15cb103c55bf21f02e89ed097b49b2ee250034d6af91ef5deea7a924724281739ca4fb6', '1', '1', 'FullStack', '[]', '0', '2019-06-28 18:02:24', '2019-06-28 18:02:24', '2020-06-28 18:02:24');
INSERT INTO `oauth_access_tokens` VALUES ('04e07fdefb2c0de59244a0da77250c09a510b1ccc189b27d30853f2181f0195216f2671dc63198a5', '1', '1', 'FullStack', '[]', '0', '2019-07-23 14:50:45', '2019-07-23 14:50:45', '2020-07-23 14:50:45');
INSERT INTO `oauth_access_tokens` VALUES ('06ef55b157942c9b682128f7342f0d9b1ce6e6da10c2382622a143b84de4f3f08d953f8fc298520d', '1', '1', 'FullStack', '[]', '0', '2019-06-13 14:36:07', '2019-06-13 14:36:07', '2020-06-13 14:36:07');
INSERT INTO `oauth_access_tokens` VALUES ('0704b5fc6210067dbcae177552f2d84d57bfd182a480f965b66043b317d76404ac79eb64a6204f55', '1', '1', 'FullStack', '[]', '0', '2019-05-05 16:53:20', '2019-05-05 16:53:20', '2020-05-05 16:53:20');
INSERT INTO `oauth_access_tokens` VALUES ('085ab1af9fe2b419a308f1a6d6ee5d5ce9c4b9f98bb76cc4b4adb72263bcc657530590ef6e83a8cc', '1', '1', 'FullStack', '[]', '0', '2019-06-12 18:49:07', '2019-06-12 18:49:07', '2020-06-12 18:49:07');
INSERT INTO `oauth_access_tokens` VALUES ('097598ee6950d355bbc554d46d5cfd4224d3f681c66980c442d8a8272c55b56a76d52b58e3bfd775', '5', '1', 'FullStack', '[]', '0', '2019-07-25 20:14:21', '2019-07-25 20:14:21', '2020-07-25 20:14:21');
INSERT INTO `oauth_access_tokens` VALUES ('0a824e877ff06c2bdc5b30aaf54a1e21d824cf9a088a25bdd4ed83f5d1414c3ed299ccff93988796', '1', '1', 'FullStack', '[]', '0', '2019-07-02 14:30:28', '2019-07-02 14:30:28', '2020-07-02 14:30:28');
INSERT INTO `oauth_access_tokens` VALUES ('0acdaaf904260ea8836b2c56e70b933168530a1ea363918372ffe2df69a84401b3bf96b250456055', '1', '1', 'FullStack', '[]', '0', '2019-07-01 18:08:52', '2019-07-01 18:08:52', '2020-07-01 18:08:52');
INSERT INTO `oauth_access_tokens` VALUES ('0c3ffaf1fbb97ee5aaf11abff97c851d30cb0040e8961f34430d75aea56555a181e3a84be20ff63e', '1', '1', 'FullStack', '[]', '0', '2019-05-09 14:56:10', '2019-05-09 14:56:10', '2020-05-09 14:56:10');
INSERT INTO `oauth_access_tokens` VALUES ('0ce5dc50d095b4250347b4867768273d2254825aaa8456532bb3d9eab4dd563873722865377d96eb', '1', '1', 'FullStack', '[]', '0', '2019-05-08 09:37:18', '2019-05-08 09:37:18', '2020-05-08 09:37:18');
INSERT INTO `oauth_access_tokens` VALUES ('0e34f85761179fdfaf490f2bd10302f1fd9b3f039b2ce7230c45aeda581a9b0cfa653894e3d51e8c', '1', '1', 'FullStack', '[]', '0', '2019-07-09 08:32:29', '2019-07-09 08:32:29', '2020-07-09 08:32:29');
INSERT INTO `oauth_access_tokens` VALUES ('0f1fbea8eb2bfdf36dfd014f5721f03e669f169ae178096b0812cbc6d84f956a34069c61c83d9f36', '1', '1', 'FullStack', '[]', '0', '2019-07-24 14:35:05', '2019-07-24 14:35:05', '2020-07-24 14:35:05');
INSERT INTO `oauth_access_tokens` VALUES ('12794ce83e8130f75850ca508f6ca243e86287c2071c88d2bd7269309d1df21eea4003d39ed31bdc', '1', '1', 'FullStack', '[]', '0', '2019-07-22 11:57:22', '2019-07-22 11:57:22', '2020-07-22 11:57:22');
INSERT INTO `oauth_access_tokens` VALUES ('1366cfe76bbe34aac39a9c8eaa4df00d67fd654a3d248d23d3b4019cdae992abb3df8032638a6de4', '1', '1', 'FullStack', '[]', '0', '2019-07-12 18:01:06', '2019-07-12 18:01:06', '2020-07-12 18:01:06');
INSERT INTO `oauth_access_tokens` VALUES ('1647d85a5e5464cd6811f45fa40e14f5e43428c7fe97b1a872ae281d2a777f8be7d1dbc9a5b8c1f8', '1', '1', 'FullStack', '[]', '0', '2019-05-08 13:59:10', '2019-05-08 13:59:10', '2020-05-08 13:59:10');
INSERT INTO `oauth_access_tokens` VALUES ('180e91cf5521e72cf335154b75a5c71ab596b7b49164b2b41c970e654daaf51ab7bb65c125ed8c7a', '1', '1', 'FullStack', '[]', '0', '2019-07-25 16:59:57', '2019-07-25 16:59:57', '2020-07-25 16:59:57');
INSERT INTO `oauth_access_tokens` VALUES ('1825a19c9e597c68d03800c6a7b42981a6f36cba2687091699fcb4a32a8e998edd22253fa5f17d60', '1', '1', 'FullStack', '[]', '0', '2019-07-11 17:39:39', '2019-07-11 17:39:39', '2020-07-11 17:39:39');
INSERT INTO `oauth_access_tokens` VALUES ('1919e11a5e71a6e6d402e3c01c034256e89597d62de40e9f285d65065ffd0a571e2c86b44bf076ef', '1', '1', 'FullStack', '[]', '0', '2019-06-26 17:44:07', '2019-06-26 17:44:07', '2020-06-26 17:44:07');
INSERT INTO `oauth_access_tokens` VALUES ('1a5ab49920fe0ac9a1c6535664c95fd79516f79d4c02edba98c9338cc64cc171b45b71ba1ec3d523', '1', '1', 'FullStack', '[]', '0', '2019-07-05 17:36:55', '2019-07-05 17:36:55', '2020-07-05 17:36:55');
INSERT INTO `oauth_access_tokens` VALUES ('1a98bb9fa3b9abb7500dbcbcc43be070d51c6f6e46c554ef440c85c1a02d74b8a0ec6ab6c71c2ca8', '1', '1', 'FullStack', '[]', '0', '2019-07-15 11:42:04', '2019-07-15 11:42:04', '2020-07-15 11:42:04');
INSERT INTO `oauth_access_tokens` VALUES ('1ad93d755c104c4d7c5ccf87d3acf0202a37a750799fb6fec89740d96e8f1d6fc8458b99b736189b', '1', '1', 'FullStack', '[]', '0', '2019-04-04 08:57:15', '2019-04-04 08:57:15', '2020-04-04 08:57:15');
INSERT INTO `oauth_access_tokens` VALUES ('1b3cf6ac0a26c1b72258f74a860c10e7e636657723ba86226455ff3ea3ec8aeed15aeaca75ff376f', '1', '1', 'FullStack', '[]', '0', '2019-05-06 13:58:51', '2019-05-06 13:58:51', '2020-05-06 13:58:51');
INSERT INTO `oauth_access_tokens` VALUES ('1d196a4034c5af02a7a465f8bd8ead6e1ae25f7964e68132d75a90b8821a494905393b6558892cc6', '1', '1', 'FullStack', '[]', '0', '2019-05-16 11:39:29', '2019-05-16 11:39:29', '2020-05-16 11:39:29');
INSERT INTO `oauth_access_tokens` VALUES ('1d7339602a2e85b41019c1693c4e7d4dc20eb53a6b3c43d063366f4f1e5e58580a9002cc01c4e0ee', '1', '1', 'FullStack', '[]', '0', '2019-06-12 11:46:07', '2019-06-12 11:46:07', '2020-06-12 11:46:07');
INSERT INTO `oauth_access_tokens` VALUES ('1e3679faeb391ca6be9b2e4073150a1e0224f484dbcc09f08681a848eaa4a81b5e658eb85a160edf', '1', '1', 'FullStack', '[]', '0', '2019-07-19 17:38:15', '2019-07-19 17:38:15', '2020-07-19 17:38:15');
INSERT INTO `oauth_access_tokens` VALUES ('1ee5bbb4519f580d435da807eb93f7278d30279035f445e03a16e2c595fe5a4f3e34475f734a983e', '1', '1', 'FullStack', '[]', '0', '2019-07-19 17:39:17', '2019-07-19 17:39:17', '2020-07-19 17:39:17');
INSERT INTO `oauth_access_tokens` VALUES ('1ff3c72a8c7a1977c1552c7a9a189fc538e7fff4e718d1bda8d4589976c17e8df2d276c56443f599', '1', '1', 'FullStack', '[]', '0', '2019-06-27 09:02:03', '2019-06-27 09:02:03', '2020-06-27 09:02:03');
INSERT INTO `oauth_access_tokens` VALUES ('203b3b000306f4e704727d31eaef4051c2752427eb0cf77bec130583ba7355b5120c0404c949f450', '1', '1', 'FullStack', '[]', '0', '2019-07-26 10:39:22', '2019-07-26 10:39:22', '2020-07-26 10:39:22');
INSERT INTO `oauth_access_tokens` VALUES ('208224488488cd2a964e24cb6a6eb36860fea826815ddf6903b1aa2a63fd92af12a6d569fc5b926b', '1', '1', 'FullStack', '[]', '0', '2019-05-15 12:01:54', '2019-05-15 12:01:54', '2020-05-15 12:01:54');
INSERT INTO `oauth_access_tokens` VALUES ('25039f26a22df892dfc4333873222e868974218c887a9c33accef8d114b4a757cb650cd7af392983', '1', '1', 'FullStack', '[]', '0', '2019-05-07 11:10:55', '2019-05-07 11:10:55', '2020-05-07 11:10:55');
INSERT INTO `oauth_access_tokens` VALUES ('260e75939165922b584813e62c2769966853a203df3c502fa104df5fad9169aa8db95bc356171c4f', '1', '1', 'FullStack', '[]', '0', '2019-04-09 14:47:36', '2019-04-09 14:47:36', '2020-04-09 14:47:36');
INSERT INTO `oauth_access_tokens` VALUES ('26986ce762cc79cc69793847e45d82d62c3203545c546efe052cd4623ddcee285cd1c7376ec5f6aa', '5', '1', 'FullStack', '[]', '0', '2019-07-25 20:10:24', '2019-07-25 20:10:24', '2020-07-25 20:10:24');
INSERT INTO `oauth_access_tokens` VALUES ('26d71b7901b7832f7f2237f501058189423492af065b69bcd75ca96eaa22ddd3bd1c4be469d4d805', '5', '1', 'FullStack', '[]', '0', '2019-05-20 17:58:01', '2019-05-20 17:58:01', '2020-05-20 17:58:01');
INSERT INTO `oauth_access_tokens` VALUES ('282afb71df9c28d885ad082ebe01c6ad5e505325df3e41a60ab4600b8cf10f8b2ab2f22b49e18a9f', '1', '1', 'FullStack', '[]', '0', '2019-07-05 14:03:24', '2019-07-05 14:03:24', '2020-07-05 14:03:24');
INSERT INTO `oauth_access_tokens` VALUES ('2be9ca7bcc61032de87e36d52b92c6038a2daec42123e63fe4db75a7a01b65cebb9e2a44d8df13a7', '1', '1', 'FullStack', '[]', '0', '2019-07-23 10:56:27', '2019-07-23 10:56:27', '2020-07-23 10:56:27');
INSERT INTO `oauth_access_tokens` VALUES ('2db7a654b7166e1eca3f250256f986ec48d8896df09bd91b297c0035de784f6c9b57fc7c1fc683c6', '1', '1', 'FullStack', '[]', '0', '2019-05-09 18:11:28', '2019-05-09 18:11:28', '2020-05-09 18:11:28');
INSERT INTO `oauth_access_tokens` VALUES ('310beada5d0e4cdf058c2134bc900ee4f02ffabb26934320fc924d5a93c80db42422b199cc2aaada', '1', '1', 'FullStack', '[]', '0', '2019-07-15 11:38:00', '2019-07-15 11:38:00', '2020-07-15 11:38:00');
INSERT INTO `oauth_access_tokens` VALUES ('325bbebc73596845532e6d4e2b8dd1a6c965f18ce09b9467e1f100604e68ef6331a032f466aaad82', '1', '1', 'FullStack', '[]', '0', '2019-07-01 15:32:05', '2019-07-01 15:32:05', '2020-07-01 15:32:05');
INSERT INTO `oauth_access_tokens` VALUES ('34d2b4fa7c2bec7735d001d57fd18c384255a68c1a7e015a9397cc17659d302ee349a7a6e482b8ee', '1', '1', 'FullStack', '[]', '0', '2019-07-25 17:01:40', '2019-07-25 17:01:40', '2020-07-25 17:01:40');
INSERT INTO `oauth_access_tokens` VALUES ('391b45e3fd6c7852686a3032c9aec3ff10795b227469447af5e0b595396f064af83dff1ec2820306', '1', '1', 'FullStack', '[]', '0', '2019-05-20 18:59:46', '2019-05-20 18:59:46', '2020-05-20 18:59:46');
INSERT INTO `oauth_access_tokens` VALUES ('3970f8ee251b0c979dc95ddc03f467210327eb197ad8f783d154b56f206ab2784ab60cbc0db220d6', '1', '1', 'FullStack', '[]', '0', '2019-05-14 08:04:52', '2019-05-14 08:04:52', '2020-05-14 08:04:52');
INSERT INTO `oauth_access_tokens` VALUES ('3adacfac6731622ace23f37dd1de7259327a9079ff87d3d34048617a652b9928c8f303701a6c16fd', '1', '1', 'FullStack', '[]', '0', '2019-05-09 18:13:17', '2019-05-09 18:13:17', '2020-05-09 18:13:17');
INSERT INTO `oauth_access_tokens` VALUES ('3b915e8488195a45c15cf4a0283c512f89d88f07d515afefca03ca9510952673d76eb22e052f2389', '1', '1', 'FullStack', '[]', '0', '2019-05-09 11:42:20', '2019-05-09 11:42:20', '2020-05-09 11:42:20');
INSERT INTO `oauth_access_tokens` VALUES ('3d6c2fad2b8ff2e53996beb66843efb4abf6bf2b145f8bfae8b5d2b2827b3bcc44c4d339c6afd86a', '1', '1', 'FullStack', '[]', '0', '2019-05-21 10:49:10', '2019-05-21 10:49:10', '2020-05-21 10:49:10');
INSERT INTO `oauth_access_tokens` VALUES ('403fc9d9538dc06eb23d1010b6f4acd7dc38ce85a7ea66a860fd84069b4c8356378f9b0eeecd6f60', '1', '1', 'FullStack', '[]', '0', '2019-07-09 14:07:41', '2019-07-09 14:07:41', '2020-07-09 14:07:41');
INSERT INTO `oauth_access_tokens` VALUES ('46ae5f6b9db8be36c70369d0b82639cd854dbb70223c3eb0252c818c7f222f9eeaf91776b1f4c0e3', '1', '1', 'FullStack', '[]', '0', '2019-07-23 16:24:09', '2019-07-23 16:24:09', '2020-07-23 16:24:09');
INSERT INTO `oauth_access_tokens` VALUES ('46e53fcdbed2a9851ea54d6b8a1edfdf33a8894aae8ef7d1564fb1da5a915b90619d0873bf84f51c', '1', '1', 'FullStack', '[]', '0', '2019-07-08 17:30:59', '2019-07-08 17:30:59', '2020-07-08 17:30:59');
INSERT INTO `oauth_access_tokens` VALUES ('47f84fe347b1aeb99f551c37ca3a50865c3cdebc6f102fc68a2075f041a7b027ece3628d3164c676', '1', '1', 'FullStack', '[]', '0', '2019-05-13 17:09:53', '2019-05-13 17:09:53', '2020-05-13 17:09:53');
INSERT INTO `oauth_access_tokens` VALUES ('487b8ec47a79bc25947069ec44ca9314946bf6520ea7c97c565a71e1c84ff6e5b1cf3fe7c5a1f40d', '1', '1', 'FullStack', '[]', '0', '2019-06-23 10:21:15', '2019-06-23 10:21:15', '2020-06-23 10:21:15');
INSERT INTO `oauth_access_tokens` VALUES ('496864c9a5422308edc44c8213842510c26be882f995ed899f3ac9cc44bd73f5c73329c074129d1a', '1', '1', 'FullStack', '[]', '0', '2019-06-12 15:13:15', '2019-06-12 15:13:15', '2020-06-12 15:13:15');
INSERT INTO `oauth_access_tokens` VALUES ('49a71d4b9839161287d489c2c5543902008104b59667643b8bba60c001c1ba623e2cf4971a3c1c81', '1', '1', 'FullStack', '[]', '0', '2019-07-02 14:28:42', '2019-07-02 14:28:42', '2020-07-02 14:28:42');
INSERT INTO `oauth_access_tokens` VALUES ('4e9147d888e56bb0ee8d6a9c54e53b59e0860dc4da6e6a3ceecc14a68f8066ef2020d4d0f34dee92', '1', '1', 'FullStack', '[]', '0', '2019-05-09 15:31:59', '2019-05-09 15:31:59', '2020-05-09 15:31:59');
INSERT INTO `oauth_access_tokens` VALUES ('51652ecef2c2b8116928ea51d17b83857a8745a5ff4f622a5f3dda7dd8f614773560b32634895c02', '1', '1', 'FullStack', '[]', '0', '2019-06-27 12:04:41', '2019-06-27 12:04:41', '2020-06-27 12:04:41');
INSERT INTO `oauth_access_tokens` VALUES ('52193a64577fa6a1641395ac5499a32fc44057e75d15c29bb8f6b8b5546653b2de481d573e3c73eb', '1', '1', 'FullStack', '[]', '0', '2019-05-13 14:03:32', '2019-05-13 14:03:32', '2020-05-13 14:03:32');
INSERT INTO `oauth_access_tokens` VALUES ('531f280b6ed1fe5d40ce270dc1191104afc879bb7431f65c933e83158a049a59f370cfcaa5fb5b60', '1', '1', 'FullStack', '[]', '0', '2019-07-22 18:44:33', '2019-07-22 18:44:33', '2020-07-22 18:44:33');
INSERT INTO `oauth_access_tokens` VALUES ('542542f75299a5573747ce7e5f528a3bd576976cf153988752946187b903f9a57664952af94c93fc', '5', '1', 'FullStack', '[]', '0', '2019-07-25 20:10:54', '2019-07-25 20:10:54', '2020-07-25 20:10:54');
INSERT INTO `oauth_access_tokens` VALUES ('54a1e5802510d2d0e44ee13f55387d1e586116d218a6306f83e4fdf7f9d5d44bd93d801dd1ec3d09', '1', '1', 'FullStack', '[]', '0', '2019-05-07 18:49:32', '2019-05-07 18:49:32', '2020-05-07 18:49:32');
INSERT INTO `oauth_access_tokens` VALUES ('55ac82df60c65ef93431ea6c94694f3869952820a53f96d84f67b6349489fca5523099f1266c2874', '1', '1', 'FullStack', '[]', '0', '2019-07-15 14:51:00', '2019-07-15 14:51:00', '2020-07-15 14:51:00');
INSERT INTO `oauth_access_tokens` VALUES ('57c2b02606ff4f0e54ab6991aea68f7eee2a9e6820f735a921ab227a43b3681a238360312710b3a6', '1', '1', 'FullStack', '[]', '0', '2019-05-09 15:33:51', '2019-05-09 15:33:51', '2020-05-09 15:33:51');
INSERT INTO `oauth_access_tokens` VALUES ('58b73948f22e6850da51aa74deabd06299cfd80ed34f9aca98088e235d04d123dc523db342b9efad', '1', '1', 'FullStack', '[]', '0', '2019-06-23 11:00:32', '2019-06-23 11:00:32', '2020-06-23 11:00:32');
INSERT INTO `oauth_access_tokens` VALUES ('595109a3f40c00e2def122dae4b73d9a667e1188bc57cc8222ac97ee260a6126c0900294b6618ce6', '5', '1', 'FullStack', '[]', '0', '2019-05-09 18:40:43', '2019-05-09 18:40:43', '2020-05-09 18:40:43');
INSERT INTO `oauth_access_tokens` VALUES ('59983ad4b97a60cae5cad36673e2eba4e3637737887a520e5d7adae5b0a5ac20fee75f678d4a834c', '5', '1', 'FullStack', '[]', '0', '2019-07-26 10:43:55', '2019-07-26 10:43:55', '2020-07-26 10:43:55');
INSERT INTO `oauth_access_tokens` VALUES ('5a7e5a1575a8c79e1c5223f6f971164e35445a184ed871318ce3daf40ec6b0110de57cc3a2dae32b', '1', '1', 'FullStack', '[]', '0', '2019-07-11 14:31:37', '2019-07-11 14:31:37', '2020-07-11 14:31:37');
INSERT INTO `oauth_access_tokens` VALUES ('5c61dd221f0c7377c99bddea5b1ab29921a1be0ccddabdaeb1e29504dd924cb4b188924660e35ff3', '1', '1', 'FullStack', '[]', '0', '2019-05-27 17:27:38', '2019-05-27 17:27:38', '2020-05-27 17:27:38');
INSERT INTO `oauth_access_tokens` VALUES ('5cda5897de80ca99a12f59d21946474b1ed1d2233644b402696ff10a1751ff189ee7b5df0cd47681', '1', '1', 'FullStack', '[]', '0', '2019-06-21 17:35:47', '2019-06-21 17:35:47', '2020-06-21 17:35:47');
INSERT INTO `oauth_access_tokens` VALUES ('5d4007e7dd41f79887a3bb369583894bbd368cf628740d76963d81e82f8efea1ed1364ecac4b8f96', '1', '1', 'FullStack', '[]', '0', '2019-07-19 08:25:51', '2019-07-19 08:25:51', '2020-07-19 08:25:51');
INSERT INTO `oauth_access_tokens` VALUES ('5db7602c8bfbe6bca30b8fa182c1c6aad2fc9739c299e96b46a168f88698f8af991c851e68398d23', '1', '1', 'FullStack', '[]', '0', '2019-07-03 18:23:04', '2019-07-03 18:23:04', '2020-07-03 18:23:04');
INSERT INTO `oauth_access_tokens` VALUES ('5dbefbf901d077ba21ab4b92d63d00c1405ec56c9a3db5d2a6a09d536c03daea84c5ee401a79d62b', '1', '1', 'FullStack', '[]', '0', '2019-05-15 09:01:17', '2019-05-15 09:01:17', '2020-05-15 09:01:17');
INSERT INTO `oauth_access_tokens` VALUES ('5e3d56de28029b824cccf48c6557c6f08e6135ecf2622e00fa2b2c8ad73943d287f0c6cc85d4d3bf', '1', '1', 'FullStack', '[]', '0', '2019-05-20 10:27:55', '2019-05-20 10:27:55', '2020-05-20 10:27:55');
INSERT INTO `oauth_access_tokens` VALUES ('5f3e734c227f179e707bec293c0c6820b82095a162e60d5dea589edab98d05ca7bba7e98725f194a', '1', '1', 'FullStack', '[]', '0', '2019-05-08 17:05:09', '2019-05-08 17:05:09', '2020-05-08 17:05:09');
INSERT INTO `oauth_access_tokens` VALUES ('5fcb7df21e7f2839cbb7b525c7f952a1ea5c83c9dc75c7f78c66368bbd8df8f718a980ac22beda47', '1', '1', 'FullStack', '[]', '0', '2019-06-12 10:15:19', '2019-06-12 10:15:19', '2020-06-12 10:15:19');
INSERT INTO `oauth_access_tokens` VALUES ('62fd49e0c87e49d6dd427732c51c0ae3d60aa8dc7e95bb5e0a69c0f24857d980bcd8295d910e0558', '1', '1', 'FullStack', '[]', '0', '2019-05-07 15:49:14', '2019-05-07 15:49:14', '2020-05-07 15:49:14');
INSERT INTO `oauth_access_tokens` VALUES ('651f2b42fd3ba3781ad4480cc8b6e5742dd66549af492c578702e34795421d7b0fedb9707ef27449', '1', '1', 'FullStack', '[]', '0', '2019-06-26 19:31:20', '2019-06-26 19:31:20', '2020-06-26 19:31:20');
INSERT INTO `oauth_access_tokens` VALUES ('655323f27d0646af81d4ebcfc9d7ba3c6fe325c45e75ee7d4f9c92765e897a848c39d402ba244ac6', '1', '1', 'FullStack', '[]', '0', '2019-06-26 15:21:36', '2019-06-26 15:21:36', '2020-06-26 15:21:36');
INSERT INTO `oauth_access_tokens` VALUES ('6584a000720d5a8820b2a550a8041fc38a34b4a63a486db52fa9b43dd220a4c731076f9a94009605', '1', '1', 'FullStack', '[]', '0', '2019-05-05 17:05:34', '2019-05-05 17:05:34', '2020-05-05 17:05:34');
INSERT INTO `oauth_access_tokens` VALUES ('660fc5ce87113a901adfcec4f715b69516792db5d61f9a7190d0d797cdc89ae89147a465e7c6950b', '1', '1', 'FullStack', '[]', '0', '2019-05-14 11:07:59', '2019-05-14 11:07:59', '2020-05-14 11:07:59');
INSERT INTO `oauth_access_tokens` VALUES ('668dfb86abb52525ed0945558a681f97abab2ae1130187bae8939371085abea129154b17bbdd723e', '1', '1', 'FullStack', '[]', '0', '2019-05-06 13:56:38', '2019-05-06 13:56:38', '2020-05-06 13:56:38');
INSERT INTO `oauth_access_tokens` VALUES ('6799fa1280b5eeb5aaf720c576ef4ed939464d034f77dadd422e14858c5f5f8601784cef875ce133', '1', '1', 'FullStack', '[]', '0', '2019-06-12 14:55:43', '2019-06-12 14:55:43', '2020-06-12 14:55:43');
INSERT INTO `oauth_access_tokens` VALUES ('679a68a890f68efff573ac8596ce7061d0c64a8f3b37a93cf6b7423bc1a20bc60468158f7f799451', '1', '1', 'FullStack', '[]', '0', '2019-07-25 14:04:21', '2019-07-25 14:04:21', '2020-07-25 14:04:21');
INSERT INTO `oauth_access_tokens` VALUES ('69dff2c353ae0bc521157c68db14f4c1e251d939f3eca830b42a064c80ba8e1ee6ddc5faff88cc48', '1', '1', 'FullStack', '[]', '0', '2019-06-23 09:36:03', '2019-06-23 09:36:03', '2020-06-23 09:36:03');
INSERT INTO `oauth_access_tokens` VALUES ('69f012a83f58cf0db24a930f550f53ebdd554f280a35a9b0f35db019e43163e85d0f173fc4e8291d', '1', '1', 'FullStack', '[]', '0', '2019-07-03 14:26:55', '2019-07-03 14:26:55', '2020-07-03 14:26:55');
INSERT INTO `oauth_access_tokens` VALUES ('6ae4a7e3e1ccaecf7e8cb214d730569d036fc17378efbe33713921083d270fae495a57f2d776fce8', '1', '1', 'FullStack', '[]', '0', '2019-07-25 20:12:17', '2019-07-25 20:12:17', '2020-07-25 20:12:17');
INSERT INTO `oauth_access_tokens` VALUES ('6b94a1a3af9922bf8c1f4ea1032a1c8299f7e185014e90344d64e5d4c22f79083dcbb8fb48af0c96', '1', '1', 'FullStack', '[]', '0', '2019-07-25 17:21:28', '2019-07-25 17:21:28', '2020-07-25 17:21:28');
INSERT INTO `oauth_access_tokens` VALUES ('6c0e53c4585ed299d533f585e195bc29f2286639cfb526e35a2f2b7c54dd5efa8f0e2dd5a2100525', '1', '1', 'FullStack', '[]', '0', '2019-05-27 11:00:49', '2019-05-27 11:00:49', '2020-05-27 11:00:49');
INSERT INTO `oauth_access_tokens` VALUES ('6d38b85cd166f890d89bed3c444f434ba30c720299e0851b26d9ae3df412c85122f8a6658581efa0', '1', '1', 'FullStack', '[]', '0', '2019-05-06 16:59:47', '2019-05-06 16:59:47', '2020-05-06 16:59:47');
INSERT INTO `oauth_access_tokens` VALUES ('6de29a3d4791b00d68c6e2f6f39d88551123b3cd56775471403a6cb983b2dfdb7f14bd50bacad692', '1', '1', 'FullStack', '[]', '0', '2019-07-01 14:24:05', '2019-07-01 14:24:05', '2020-07-01 14:24:05');
INSERT INTO `oauth_access_tokens` VALUES ('6e34bb2f4712c76c67242482838c19751e68882dfb279110cc98c900c853535d3d604bc46b7182cc', '5', '1', 'FullStack', '[]', '0', '2019-05-09 18:38:27', '2019-05-09 18:38:27', '2020-05-09 18:38:27');
INSERT INTO `oauth_access_tokens` VALUES ('6f1ab2599c511595d5e23157dd641754245efaac79cfb16e58eec7b2514309f6f6001c829a2ec8eb', '1', '1', 'FullStack', '[]', '0', '2019-07-25 20:15:29', '2019-07-25 20:15:29', '2020-07-25 20:15:29');
INSERT INTO `oauth_access_tokens` VALUES ('6ffaf872345d256c0a41335c998de344308d5c56983aec80f5aa6030ab26fc373f4256aeeca12187', '1', '1', 'FullStack', '[]', '0', '2019-05-07 18:51:16', '2019-05-07 18:51:16', '2020-05-07 18:51:16');
INSERT INTO `oauth_access_tokens` VALUES ('72a4f8c453ade4b7c59393ba1786a9c4c498594ba8dce4509352c5760313b45c5db5a5efb45cacc1', '1', '1', 'FullStack', '[]', '0', '2019-07-18 09:09:21', '2019-07-18 09:09:21', '2020-07-18 09:09:21');
INSERT INTO `oauth_access_tokens` VALUES ('75624e62bcc136a1147358aacc45ea36f6a4c00a59f59f35e09d014cc09a33c322ff176be34167db', '1', '1', 'FullStack', '[]', '0', '2019-05-14 18:06:04', '2019-05-14 18:06:04', '2020-05-14 18:06:04');
INSERT INTO `oauth_access_tokens` VALUES ('759d274291206c6d9f3727298782fb2f7009d986957c12f4cd29ee2fc9aa47acea429ef9a6d8ccbb', '1', '1', 'FullStack', '[]', '0', '2019-05-06 17:03:52', '2019-05-06 17:03:52', '2020-05-06 17:03:52');
INSERT INTO `oauth_access_tokens` VALUES ('76206739043460b4d009abafb94e4cb6790027f19735932451529e3469e235253ab923187e79509a', '1', '1', 'FullStack', '[]', '0', '2019-04-30 19:04:12', '2019-04-30 19:04:12', '2020-04-30 19:04:12');
INSERT INTO `oauth_access_tokens` VALUES ('76bdd95db95613ef981d742cfc3b567563c0dc961749738546a53c8899520a1a51e3d9f8d1d1f4e3', '1', '1', 'FullStack', '[]', '0', '2019-05-10 17:06:30', '2019-05-10 17:06:30', '2020-05-10 17:06:30');
INSERT INTO `oauth_access_tokens` VALUES ('780ad2af80c1c9de0d4443129ba40fdf94b8cdb9febd18a9900e6e530d67b39439f49caac8ad8f7c', '5', '1', 'FullStack', '[]', '0', '2019-05-09 18:10:41', '2019-05-09 18:10:41', '2020-05-09 18:10:41');
INSERT INTO `oauth_access_tokens` VALUES ('79144a8ec9c6cd48668244d1983718db6821c8a68b8d2f3ce4f51ca06174ba387772a5a98c7bc598', '1', '1', 'FullStack', '[]', '0', '2019-07-19 11:26:43', '2019-07-19 11:26:43', '2020-07-19 11:26:43');
INSERT INTO `oauth_access_tokens` VALUES ('79e478e308afcd402c3a10b892cc9c948a67521a7a19c5122128aea686613c84ad8a35fdff456f95', '1', '1', 'FullStack', '[]', '0', '2019-07-16 11:44:29', '2019-07-16 11:44:29', '2020-07-16 11:44:29');
INSERT INTO `oauth_access_tokens` VALUES ('7b7f66a7944ec3165bb8ef0d4bc1776e530a2a004c6934b3ac4e0385e04b2dedaa82c0580b0b652a', '1', '1', 'FullStack', '[]', '0', '2019-06-13 10:07:33', '2019-06-13 10:07:33', '2020-06-13 10:07:33');
INSERT INTO `oauth_access_tokens` VALUES ('7c3dca2c623b6bd192e587b4c20aa30c105e9d62ff9fa22c055d835f44ed319ad8ae108269dc8a1d', '1', '1', 'FullStack', '[]', '0', '2019-07-18 15:43:14', '2019-07-18 15:43:14', '2020-07-18 15:43:14');
INSERT INTO `oauth_access_tokens` VALUES ('7d06d2bdcead82669ddd2f89c73a4bbbf4ef11a5488fadf7c9cd8605565fc183daecc0fbad51f83f', '1', '1', 'FullStack', '[]', '0', '2019-07-04 17:29:25', '2019-07-04 17:29:25', '2020-07-04 17:29:25');
INSERT INTO `oauth_access_tokens` VALUES ('7d7313c3f72e846f52e7e1c366157ae8f160d63c3114fa6878d8175ba8aee3216220725810ed4e50', '1', '1', 'FullStack', '[]', '0', '2019-06-13 10:11:56', '2019-06-13 10:11:56', '2020-06-13 10:11:56');
INSERT INTO `oauth_access_tokens` VALUES ('7e590a0ccd36594dae377dd53a0993bbec7053638e6dd9f3dfcf786121cc2e0116545537750a169f', '1', '1', 'FullStack', '[]', '0', '2019-07-02 14:32:51', '2019-07-02 14:32:51', '2020-07-02 14:32:51');
INSERT INTO `oauth_access_tokens` VALUES ('7eac681c016a242337e3ee9d21d6c32630083e952e81c64ef0b67524c71bd0a15a57c11b8247c794', '1', '1', 'FullStack', '[]', '0', '2019-06-28 10:43:37', '2019-06-28 10:43:37', '2020-06-28 10:43:37');
INSERT INTO `oauth_access_tokens` VALUES ('7f5f01a873f6e9e15dd64044265d29fd98fd40d41d0f67d90c4b37cc0f88d66a4c7b8d186977aff7', '1', '1', 'FullStack', '[]', '0', '2019-05-13 17:10:04', '2019-05-13 17:10:04', '2020-05-13 17:10:04');
INSERT INTO `oauth_access_tokens` VALUES ('80d1cb3a9ead5800718fd3fcde65f31f1d3fa258b391f14997d631f1df8a3db355f819b48a3ea178', '1', '1', 'FullStack', '[]', '0', '2019-05-29 16:29:20', '2019-05-29 16:29:20', '2020-05-29 16:29:20');
INSERT INTO `oauth_access_tokens` VALUES ('811a7336277b322b33cbbb056baa69535803967e486c5a0669240790f8b40405d8f626fc56a3156e', '1', '1', 'FullStack', '[]', '0', '2019-06-27 08:33:10', '2019-06-27 08:33:10', '2020-06-27 08:33:10');
INSERT INTO `oauth_access_tokens` VALUES ('8226e42979b3d7722f212f82296f93619557cf2907f4b119e05be08e77d2357f3e8da41a76413904', '1', '1', 'FullStack', '[]', '0', '2019-07-05 09:24:24', '2019-07-05 09:24:24', '2020-07-05 09:24:24');
INSERT INTO `oauth_access_tokens` VALUES ('840590f6a0d9f25241cb81c71a1e99e5cb70e93491f45adc94d858b8d7426ed5555f1eb3f5d34016', '1', '1', 'FullStack', '[]', '0', '2019-05-27 15:31:14', '2019-05-27 15:31:14', '2020-05-27 15:31:14');
INSERT INTO `oauth_access_tokens` VALUES ('84285fc47b93ef35c713ed1370c241d8e3d3efc74d1924a6db0019fc766b8c1a294891aa380fc1b1', '1', '1', 'FullStack', '[]', '0', '2019-06-12 18:34:56', '2019-06-12 18:34:56', '2020-06-12 18:34:56');
INSERT INTO `oauth_access_tokens` VALUES ('8481f40518a3292312befded6831a0fb009153f568cb40c7bc2e48b88caa83c95b7bf072449463b7', '1', '1', 'FullStack', '[]', '0', '2019-04-03 15:11:06', '2019-04-03 15:11:06', '2020-04-03 15:11:06');
INSERT INTO `oauth_access_tokens` VALUES ('84ca628236fe5074ad6b4bef1628ecae22f7850356651e9742f1a9c50b2758e001707e1a1b1bcc62', '1', '1', 'FullStack', '[]', '0', '2019-05-15 15:06:21', '2019-05-15 15:06:21', '2020-05-15 15:06:21');
INSERT INTO `oauth_access_tokens` VALUES ('850b4613b4689fb734abec19691876ba89ce8a7095b3af8d46af0b75cb1369ba3e25614e8c443079', '5', '1', 'FullStack', '[]', '0', '2019-07-25 20:11:44', '2019-07-25 20:11:44', '2020-07-25 20:11:44');
INSERT INTO `oauth_access_tokens` VALUES ('87b620067f96c6a4289fc9dc1e14d5d24dc7b530c06795224a8837004f9ede2119085cd760ec4702', '1', '1', 'FullStack', '[]', '0', '2019-07-04 20:35:54', '2019-07-04 20:35:54', '2020-07-04 20:35:54');
INSERT INTO `oauth_access_tokens` VALUES ('87f0bc087c844398d6f63c8c5a01a143a8eb7c632916f680ac2d0457c98c2f509d70b4183b25baaa', '1', '1', 'FullStack', '[]', '0', '2019-04-05 09:31:27', '2019-04-05 09:31:27', '2020-04-05 09:31:27');
INSERT INTO `oauth_access_tokens` VALUES ('88be7c8c7580d05a97ed7620aa2a7b0df548f66f258249b3c371c0dd4a4903b78a565514461116cb', '1', '1', 'FullStack', '[]', '0', '2019-07-25 16:59:18', '2019-07-25 16:59:18', '2020-07-25 16:59:18');
INSERT INTO `oauth_access_tokens` VALUES ('8a5945afc176fdc4d3b8d5ee9d52fdec3296d59f7f4f738893968be895566463abe649e67ceab5d1', '1', '1', 'FullStack', '[]', '0', '2019-07-04 20:43:32', '2019-07-04 20:43:32', '2020-07-04 20:43:32');
INSERT INTO `oauth_access_tokens` VALUES ('8a853a823a6d921f39d30f846e990ef839f2a6bc6905bd14d30d258270b8ae081256821cb16521f3', '1', '1', 'FullStack', '[]', '0', '2019-06-09 18:02:27', '2019-06-09 18:02:27', '2020-06-09 18:02:27');
INSERT INTO `oauth_access_tokens` VALUES ('8c5488e1338eae99f45a24c9cb9074abc923a48d3ce4ecebc9e3895ed30baa0e381a0c71a9c56854', '1', '1', 'FullStack', '[]', '0', '2019-06-23 11:40:39', '2019-06-23 11:40:39', '2020-06-23 11:40:39');
INSERT INTO `oauth_access_tokens` VALUES ('8cbda48075cfb71cd421e1816af16ecc58bf2623fcb451d02ad434f548e17dd7e7ea5db278014de8', '1', '1', 'FullStack', '[]', '0', '2019-05-14 14:14:29', '2019-05-14 14:14:29', '2020-05-14 14:14:29');
INSERT INTO `oauth_access_tokens` VALUES ('8dbb501a4ad09314b505be8c46a0125ae3f8ed5dd3dd9d44316938f4a48e58f57ed7a05c69428d93', '1', '1', 'FullStack', '[]', '0', '2019-07-15 18:59:11', '2019-07-15 18:59:11', '2020-07-15 18:59:11');
INSERT INTO `oauth_access_tokens` VALUES ('8eab6d1f011f1ab0d399c49d2271a49c60d130d2841a88233f185528db113eee6061312b984db531', '1', '1', 'FullStack', '[]', '0', '2019-07-15 17:54:47', '2019-07-15 17:54:47', '2020-07-15 17:54:47');
INSERT INTO `oauth_access_tokens` VALUES ('9037ce3877b0dc7d1de82b70574bf9f7b1b6edb622590b83949f2d0f966ee1c5424a1ec68931b0cf', '1', '1', 'FullStack', '[]', '0', '2019-05-09 18:35:55', '2019-05-09 18:35:55', '2020-05-09 18:35:55');
INSERT INTO `oauth_access_tokens` VALUES ('90b6507f99cd815c42e4d3a8ab046364867c9850c08552bdd3686e144f59867a537904ac0b2ef960', '5', '1', 'FullStack', '[]', '0', '2019-07-26 10:38:57', '2019-07-26 10:38:57', '2020-07-26 10:38:57');
INSERT INTO `oauth_access_tokens` VALUES ('91216600e86763a13641602423866ee0fbfce730412af1e61b6f28ba78cdb83f1b8df1746c04da6d', '1', '1', 'FullStack', '[]', '0', '2019-06-27 16:57:16', '2019-06-27 16:57:16', '2020-06-27 16:57:16');
INSERT INTO `oauth_access_tokens` VALUES ('931ce2aed51765cf606d094834b61882f98bec29f0224ecb991a0e80e000a7bee9d8ae41bae266cc', '1', '1', 'FullStack', '[]', '0', '2019-07-02 14:25:26', '2019-07-02 14:25:26', '2020-07-02 14:25:26');
INSERT INTO `oauth_access_tokens` VALUES ('939bec2d03d12615c439d5f86b2984f0d013eb42657710d2c03eef9401643b807bd0db2d2feb86aa', '1', '1', 'FullStack', '[]', '0', '2019-06-26 19:03:37', '2019-06-26 19:03:37', '2020-06-26 19:03:37');
INSERT INTO `oauth_access_tokens` VALUES ('945915b8e74b7919fd08a670c35be7387fd8f867ef2add7ff2d5b311dea7b529bb648957ce608198', '1', '1', 'FullStack', '[]', '0', '2019-05-09 08:39:56', '2019-05-09 08:39:56', '2020-05-09 08:39:56');
INSERT INTO `oauth_access_tokens` VALUES ('9476f3d3c230a62961ab5fec1ab13f9d757440a9779699c53b54d74bb72ecd611e8d6f2361b1907e', '1', '1', 'FullStack', '[]', '0', '2019-05-29 17:51:42', '2019-05-29 17:51:42', '2020-05-29 17:51:42');
INSERT INTO `oauth_access_tokens` VALUES ('972b2b5c02a439028edf740dfc379db2900b94d5145c8aaaf4a07f3dc53b7add2a028aaa6f338988', '1', '1', 'FullStack', '[]', '0', '2019-06-26 10:49:36', '2019-06-26 10:49:36', '2020-06-26 10:49:36');
INSERT INTO `oauth_access_tokens` VALUES ('9a9d2f7376268ccc7e0d07eb90791bb1aaac94f1ef3e3b98cc25d745be93eecfc4299ae6d22d62b8', '1', '1', 'FullStack', '[]', '0', '2019-04-02 16:02:46', '2019-04-02 16:02:46', '2020-04-02 16:02:46');
INSERT INTO `oauth_access_tokens` VALUES ('9ccdd2c3759eeb0c0fb2487a9323406285fe7a9b5af96d2b5039c8bd712e7ff60a9777816d6ccbad', '1', '1', 'FullStack', '[]', '0', '2019-05-01 16:06:37', '2019-05-01 16:06:37', '2020-05-01 16:06:37');
INSERT INTO `oauth_access_tokens` VALUES ('9f291bdb126550ed52f9e31896a397dd5b1f73735abe919e129baf00ebcf5a1888d232f3311601a8', '1', '1', 'FullStack', '[]', '0', '2019-07-25 16:59:43', '2019-07-25 16:59:43', '2020-07-25 16:59:43');
INSERT INTO `oauth_access_tokens` VALUES ('9f6265af12df43e43d603b164d9139bf1f21de1f831373a94a05c669d0c32d3a8d5bdbf8ffed394e', '5', '1', 'FullStack', '[]', '0', '2019-05-20 17:56:05', '2019-05-20 17:56:05', '2020-05-20 17:56:05');
INSERT INTO `oauth_access_tokens` VALUES ('a031be7b70489d182666e9fddf45d8fc4a064f1148e28e32ac15009dfe7cff5f68f3a5472b7dcfe5', '1', '1', 'FullStack', '[]', '0', '2019-06-12 15:37:43', '2019-06-12 15:37:43', '2020-06-12 15:37:43');
INSERT INTO `oauth_access_tokens` VALUES ('a2e9792a1de5833ace72adc223c76f00ab65b3f93b17d56f6c1f1c04123ebdc7036263901abc4e41', '1', '1', 'FullStack', '[]', '0', '2019-07-12 08:53:34', '2019-07-12 08:53:34', '2020-07-12 08:53:34');
INSERT INTO `oauth_access_tokens` VALUES ('a56590184cb4a1682702def19c0e0da7c6c678bd1166d3d10d08c2b30cc7b152e58407fd7f1688ca', '1', '1', 'FullStack', '[]', '0', '2019-07-10 09:19:56', '2019-07-10 09:19:56', '2020-07-10 09:19:56');
INSERT INTO `oauth_access_tokens` VALUES ('a6367b0f58a512cd546d618550a04394bc02af4a09eb54c69af3e4c8f3112ab8d3d7cf44fe4080a0', '1', '1', 'FullStack', '[]', '0', '2019-07-09 17:09:19', '2019-07-09 17:09:19', '2020-07-09 17:09:19');
INSERT INTO `oauth_access_tokens` VALUES ('a6411bed25cca31f6f98f42abfe38f63793ab5198f9bda762ccc66c16176b6025f430f7e4027dff9', '1', '1', 'FullStack', '[]', '0', '2019-06-13 10:16:02', '2019-06-13 10:16:02', '2020-06-13 10:16:02');
INSERT INTO `oauth_access_tokens` VALUES ('a71e84253aa7c9905609778afde06d61d4363f4660d27cc4ecc91b35b9fc0959dd5a40b4e594f054', '1', '1', 'FullStack', '[]', '0', '2019-05-13 17:05:18', '2019-05-13 17:05:18', '2020-05-13 17:05:18');
INSERT INTO `oauth_access_tokens` VALUES ('a95364518f2a582b1f5b72913b0e30a7315621b8ea2923a0a510616b61fd29475e48cccff3bdd762', '1', '1', 'FullStack', '[]', '0', '2019-07-01 11:16:09', '2019-07-01 11:16:09', '2020-07-01 11:16:09');
INSERT INTO `oauth_access_tokens` VALUES ('a95729c97be3274a0ee77f34b1bcd73ad90adeff906406c6d8c769148321033abd4d0ed7fce581a3', '1', '1', 'FullStack', '[]', '0', '2019-05-13 17:09:44', '2019-05-13 17:09:44', '2020-05-13 17:09:44');
INSERT INTO `oauth_access_tokens` VALUES ('a982aa95d71c7ee9725bb21c928d5058a42557ed41b3bcd674d8e5dacd0e2c7cabdf371faa223af8', '1', '1', 'FullStack', '[]', '0', '2019-07-11 08:30:03', '2019-07-11 08:30:03', '2020-07-11 08:30:03');
INSERT INTO `oauth_access_tokens` VALUES ('aa4a943866dc771cc4410f0472e528e94eec8ec173b540bd71f930eb993991f364e293e19f6d0369', '1', '1', 'FullStack', '[]', '0', '2019-05-10 13:50:06', '2019-05-10 13:50:06', '2020-05-10 13:50:06');
INSERT INTO `oauth_access_tokens` VALUES ('aed1f8f149b959987bef1729ce16b52a32da0197be9fb35b85cb50739e73b9945f0848be61ccddb2', '1', '1', 'FullStack', '[]', '0', '2019-07-10 19:21:23', '2019-07-10 19:21:23', '2020-07-10 19:21:23');
INSERT INTO `oauth_access_tokens` VALUES ('af51a98e4b7bbdd1127bb20292c36c8b103670ae591e867acb1ca9cf4af78ded2c3bbc4aa9217073', '1', '1', 'FullStack', '[]', '0', '2019-04-05 09:21:05', '2019-04-05 09:21:05', '2020-04-05 09:21:05');
INSERT INTO `oauth_access_tokens` VALUES ('b283e5c014993b8e3db5efd94c5b64c62b8084ee9a39c91081e82311a9360b1891147937af114827', '1', '1', 'FullStack', '[]', '0', '2019-06-11 18:20:13', '2019-06-11 18:20:13', '2020-06-11 18:20:13');
INSERT INTO `oauth_access_tokens` VALUES ('b3a6fc05e843ad1343150b0fe403e9e7be1df7b0ea6db6cd2d653e0c3c24e837e8ea0467876030b0', '1', '1', 'FullStack', '[]', '0', '2019-07-24 08:33:02', '2019-07-24 08:33:02', '2020-07-24 08:33:02');
INSERT INTO `oauth_access_tokens` VALUES ('b473b772f1fc654486f956aed2e82a136ee4b94637a7332a1c961e1c2d010f0a289fb2efd6574e7f', '1', '1', 'FullStack', '[]', '0', '2019-07-16 08:43:57', '2019-07-16 08:43:57', '2020-07-16 08:43:57');
INSERT INTO `oauth_access_tokens` VALUES ('b53e790bcf194c8ebb737586d477dd1640d6b510b2909bb2ea918e648762e51af06b2d69b07f454c', '5', '1', 'FullStack', '[]', '0', '2019-05-20 18:21:32', '2019-05-20 18:21:32', '2020-05-20 18:21:32');
INSERT INTO `oauth_access_tokens` VALUES ('b5cbe1d1d2a3491221d9748c65366b8c3f16f4b04c90f9095802915e852ef2d8baa4b7789d859fd9', '1', '1', 'FullStack', '[]', '0', '2019-07-04 14:28:29', '2019-07-04 14:28:29', '2020-07-04 14:28:29');
INSERT INTO `oauth_access_tokens` VALUES ('b75628d40f00ed803d1b91b72f8f5509ba7213eb4f3007c91e31fdf077b464154ea5ab6b18d4cd08', '1', '1', 'FullStack', '[]', '0', '2019-07-10 17:11:04', '2019-07-10 17:11:04', '2020-07-10 17:11:04');
INSERT INTO `oauth_access_tokens` VALUES ('b78f428263a00e65556828ba99093a6fcb1aa25fa00f438005741a91bcad4148b0c96277877987b7', '1', '1', 'FullStack', '[]', '0', '2019-06-23 16:09:54', '2019-06-23 16:09:54', '2020-06-23 16:09:54');
INSERT INTO `oauth_access_tokens` VALUES ('b8049871b4999d29c43abde0f7453b643de426cda326cfb0e3efe7877e71271b48b842456ce4cd3d', '1', '1', 'FullStack', '[]', '0', '2019-07-02 17:44:36', '2019-07-02 17:44:36', '2020-07-02 17:44:36');
INSERT INTO `oauth_access_tokens` VALUES ('b80f8df4828864c1e1f33c13070b04957bef26a86f981917959d2a8df0950dcf7ea7133e6e36f0f7', '1', '1', 'FullStack', '[]', '0', '2019-07-04 20:40:21', '2019-07-04 20:40:21', '2020-07-04 20:40:21');
INSERT INTO `oauth_access_tokens` VALUES ('b99ca2e7f7ed8bfcc32830c060bac754b69f61d7ac8d14e25fe104baadc1c91dbe26d9f5b0561ffa', '1', '1', 'FullStack', '[]', '0', '2019-07-02 14:28:05', '2019-07-02 14:28:05', '2020-07-02 14:28:05');
INSERT INTO `oauth_access_tokens` VALUES ('b9c4c31365a96148f34b81e79f1dd0cbccaa7bcd1eb97e3da8708824d8b45da21d511272c226e7ea', '5', '1', 'FullStack', '[]', '0', '2019-05-09 18:32:22', '2019-05-09 18:32:22', '2020-05-09 18:32:22');
INSERT INTO `oauth_access_tokens` VALUES ('baa3982aa24256d3aa2336ca9370a2699acd6655c4bd074dc735c08a12d0dfdb863a05422bf0d085', '1', '1', 'FullStack', '[]', '0', '2019-07-08 14:29:27', '2019-07-08 14:29:27', '2020-07-08 14:29:27');
INSERT INTO `oauth_access_tokens` VALUES ('baab701523b83269dddcc2c7a2b5c323bedce87ade9009c24a51d50fd58085557a1b9e9d1c3b831f', '1', '1', 'FullStack', '[]', '0', '2019-07-10 19:22:49', '2019-07-10 19:22:49', '2020-07-10 19:22:49');
INSERT INTO `oauth_access_tokens` VALUES ('bdbefd3260c29c068e0b7bb96a03599dc5fd40286a914cdeea90567e56c8b5d2aa66be1478b1867e', '1', '1', 'FullStack', '[]', '0', '2019-05-13 17:10:19', '2019-05-13 17:10:19', '2020-05-13 17:10:19');
INSERT INTO `oauth_access_tokens` VALUES ('befc10e0adc5b608ca1d4f62f6b1ef2c47cf1c122beb29a8d82bca74b323f7c8c71fa0e3d8c7b0c6', '1', '1', 'FullStack', '[]', '0', '2019-07-22 15:41:45', '2019-07-22 15:41:45', '2020-07-22 15:41:45');
INSERT INTO `oauth_access_tokens` VALUES ('c05f432e9e3144a9b71b4516e07b8a55928a690a0cec835e6b4eec67cabecaffb2184b42f9107431', '1', '1', 'FullStack', '[]', '0', '2019-06-26 19:26:46', '2019-06-26 19:26:46', '2020-06-26 19:26:46');
INSERT INTO `oauth_access_tokens` VALUES ('c06a61b27ee36f3b8f5cf488865ff62407f1836cbce99add147dbd7c1b060f30fbf8fc58480a1a71', '1', '1', 'FullStack', '[]', '0', '2019-07-24 17:35:13', '2019-07-24 17:35:13', '2020-07-24 17:35:13');
INSERT INTO `oauth_access_tokens` VALUES ('c26fb34f695e7816815839f54f50b3cbf96c6b4a37ff73456779a25b8c4eb9c48e279e2ff350c4fc', '1', '1', 'FullStack', '[]', '0', '2019-05-06 09:17:22', '2019-05-06 09:17:22', '2020-05-06 09:17:22');
INSERT INTO `oauth_access_tokens` VALUES ('c2e9a44a9f68da3071817709ffd5ffc396b93fc194026e02e9e091b34e0e6fa1c29a1082b6d85a5e', '1', '1', 'FullStack', '[]', '0', '2019-07-18 12:42:17', '2019-07-18 12:42:17', '2020-07-18 12:42:17');
INSERT INTO `oauth_access_tokens` VALUES ('c578ca4ac5375d2d38ae776f61083e099b199919be672fbb69b654d3454907bc583ef251033d0922', '1', '1', 'FullStack', '[]', '0', '2019-07-26 10:48:39', '2019-07-26 10:48:39', '2020-07-26 10:48:39');
INSERT INTO `oauth_access_tokens` VALUES ('c64957b71f26837324b7d2c8e98cce645f29bb89a71d9fd28c7f71945afa33083aa40491ab309961', '1', '1', 'FullStack', '[]', '0', '2019-07-23 10:30:24', '2019-07-23 10:30:24', '2020-07-23 10:30:24');
INSERT INTO `oauth_access_tokens` VALUES ('c82162b21934eae951ca4dadc7794baafe528934ec69e6b2c4d19a348494b04ef75f6dd86a042f58', '1', '1', 'FullStack', '[]', '0', '2019-07-02 10:46:08', '2019-07-02 10:46:08', '2020-07-02 10:46:08');
INSERT INTO `oauth_access_tokens` VALUES ('c8d896ed791814ecf0c916489262001a1db3390e9b7a2c02f1b4219cce3eb62484c5d36483c8c898', '1', '1', 'FullStack', '[]', '0', '2019-06-27 16:33:26', '2019-06-27 16:33:26', '2020-06-27 16:33:26');
INSERT INTO `oauth_access_tokens` VALUES ('ca34792b7146e9cadefe0eb897475b660f41f82fc18657a501b155ddf48d6384d3cc64e80228a706', '1', '1', 'FullStack', '[]', '0', '2019-05-23 14:28:58', '2019-05-23 14:28:58', '2020-05-23 14:28:58');
INSERT INTO `oauth_access_tokens` VALUES ('cc239b5fb11ff99a02727c4ac6b73a7dc56f4c23757e94a97ae4d08d91f0f439d6c0cc1805a9882d', '1', '1', 'FullStack', '[]', '0', '2019-07-19 11:27:08', '2019-07-19 11:27:08', '2020-07-19 11:27:08');
INSERT INTO `oauth_access_tokens` VALUES ('cd89a320560a478d668d5eb1ef6d8f25da98d878b7d80a158fdff156dca89b69ccf63d0ab6b3ef20', '1', '1', 'FullStack', '[]', '0', '2019-05-10 17:08:03', '2019-05-10 17:08:03', '2020-05-10 17:08:03');
INSERT INTO `oauth_access_tokens` VALUES ('ce0ce991d844caf51bda5b560796e8497aa5b61d9b51eac7d9bed53c45b0a1c70c4f1e93990123b1', '1', '1', 'FullStack', '[]', '0', '2019-07-10 19:38:03', '2019-07-10 19:38:03', '2020-07-10 19:38:03');
INSERT INTO `oauth_access_tokens` VALUES ('ce2795ef60276bda6616d56d4e9eb6e2d037550f8e174fa3d337b325a24ffb14927d115fa8ba27f2', '1', '1', 'FullStack', '[]', '0', '2019-05-05 17:17:27', '2019-05-05 17:17:27', '2020-05-05 17:17:27');
INSERT INTO `oauth_access_tokens` VALUES ('cef56f92f24d5c68731da11b7683535d08fe07ffe2807c37566e54e64e7f7c0204695872dc8713ae', '1', '1', 'FullStack', '[]', '0', '2019-07-21 11:02:38', '2019-07-21 11:02:38', '2020-07-21 11:02:38');
INSERT INTO `oauth_access_tokens` VALUES ('d021a650ecfbf444dabf01dd02b9b33978c6ab29581a79a1191486909dccb384f8a994e156548a47', '1', '1', 'FullStack', '[]', '0', '2019-06-23 10:26:22', '2019-06-23 10:26:22', '2020-06-23 10:26:22');
INSERT INTO `oauth_access_tokens` VALUES ('d282c3686c4c8ca26afee846932f57a02eb78a88b1464911481eb67f2fd032257a05c5c5fa1a7a3b', '1', '1', 'FullStack', '[]', '0', '2019-07-26 08:32:36', '2019-07-26 08:32:36', '2020-07-26 08:32:36');
INSERT INTO `oauth_access_tokens` VALUES ('d2c86dc7d75725be37c2921ec20d0fe2b5627ebb7fc433852b3da61b5547bc91e0fdd361b57e6c87', '1', '1', 'FullStack', '[]', '0', '2019-07-01 09:53:48', '2019-07-01 09:53:48', '2020-07-01 09:53:48');
INSERT INTO `oauth_access_tokens` VALUES ('d30518ef4ebcc9f90d2d2ea99e2cd4bb30fec12a90fe9037548dc7838478545c62927b54c321ef10', '1', '1', 'FullStack', '[]', '0', '2019-07-05 17:07:39', '2019-07-05 17:07:39', '2020-07-05 17:07:39');
INSERT INTO `oauth_access_tokens` VALUES ('d31a8b6db98b92449f96b4a63cbbed537c33afa58e314c539992d4bcc90d62e042970ae5113b3b98', '1', '1', 'FullStack', '[]', '0', '2019-05-13 08:29:03', '2019-05-13 08:29:03', '2020-05-13 08:29:03');
INSERT INTO `oauth_access_tokens` VALUES ('d32996dcd73a680eb78136816cd98242c7a555b312a2a0a13e2f691c139297e8494cdcdc3b2b97a0', '1', '1', 'FullStack', '[]', '0', '2019-06-27 14:58:43', '2019-06-27 14:58:43', '2020-06-27 14:58:43');
INSERT INTO `oauth_access_tokens` VALUES ('d4c96b686fffce5e13dba7409498a0ea63d4b7947cddef6323d74808cb2865994b0cf2f578d51477', '1', '1', 'FullStack', '[]', '0', '2019-07-09 20:10:03', '2019-07-09 20:10:03', '2020-07-09 20:10:03');
INSERT INTO `oauth_access_tokens` VALUES ('d505c0ecff71f5274d8eefd6bc7702441cdc9b34a3e1536a18db0600f6536baab7ffa6c29d88e0b1', '5', '1', 'FullStack', '[]', '0', '2019-07-25 20:16:20', '2019-07-25 20:16:20', '2020-07-25 20:16:20');
INSERT INTO `oauth_access_tokens` VALUES ('d7867887f424da38c9386cd118599107546c17ff97c6448138199eec4cc4d92d970116af35306556', '1', '1', 'FullStack', '[]', '0', '2019-06-12 18:48:45', '2019-06-12 18:48:45', '2020-06-12 18:48:45');
INSERT INTO `oauth_access_tokens` VALUES ('d78ff1fcbf0ef40cd0ac9b1679ab7b4f4adfa5bad2b08b3b69910f6c85b71c7b6c66aafaf0eaeb1a', '1', '1', 'FullStack', '[]', '0', '2019-05-13 10:56:00', '2019-05-13 10:56:00', '2020-05-13 10:56:00');
INSERT INTO `oauth_access_tokens` VALUES ('d7a3cf14f2e942d193f32a8acac198b5f038a3363c7b4f409d93070b6e3f62a92fb6dcc651619280', '1', '1', 'FullStack', '[]', '0', '2019-07-15 17:51:06', '2019-07-15 17:51:06', '2020-07-15 17:51:06');
INSERT INTO `oauth_access_tokens` VALUES ('d7a9edec3723670e93592d3e94e16858f5f8676224aee008fd8f07249ad98c21a3a73eb327d35b68', '1', '1', 'FullStack', '[]', '0', '2019-04-03 09:37:12', '2019-04-03 09:37:12', '2020-04-03 09:37:12');
INSERT INTO `oauth_access_tokens` VALUES ('d7b3979cae4f2e1cf17c338cc404933e80c55b13ce75def3064383f02d60fc1f35e93bbe9681e4ea', '1', '1', 'FullStack', '[]', '0', '2019-07-15 08:37:18', '2019-07-15 08:37:18', '2020-07-15 08:37:18');
INSERT INTO `oauth_access_tokens` VALUES ('d9042cc7989af65d72ea6114d048ca0383d35cc873d0341ddd79e9dd8e97247312d572d6c156d2f3', '1', '1', 'FullStack', '[]', '0', '2019-07-21 16:12:01', '2019-07-21 16:12:01', '2020-07-21 16:12:01');
INSERT INTO `oauth_access_tokens` VALUES ('d94a6cb867bd9c4277972c4bf2d2f8fc31cefacabdcf43276ed76834a50cc289103da48f9f593a35', '1', '1', 'FullStack', '[]', '0', '2019-05-17 16:51:11', '2019-05-17 16:51:11', '2020-05-17 16:51:11');
INSERT INTO `oauth_access_tokens` VALUES ('da13176245b5c6a0e65511d3d699524dbeb4ddb12ee607cc106eecaa1a239ca82e0539a3f4ac4099', '5', '1', 'FullStack', '[]', '0', '2019-07-26 08:38:19', '2019-07-26 08:38:19', '2020-07-26 08:38:19');
INSERT INTO `oauth_access_tokens` VALUES ('db0a0e8e9da7c4c4be8f5996b03df559cf8b39705089c43f0540299f509b7c1c41c377b0f78dfcd9', '1', '1', 'FullStack', '[]', '0', '2019-05-29 17:51:52', '2019-05-29 17:51:52', '2020-05-29 17:51:52');
INSERT INTO `oauth_access_tokens` VALUES ('db2e519a6d2adc0ac05ba7c55044dc31d046dc9e7ced4a199d11f48715094dbd4e362faad532924a', '1', '1', 'FullStack', '[]', '0', '2019-05-05 16:45:55', '2019-05-05 16:45:55', '2020-05-05 16:45:55');
INSERT INTO `oauth_access_tokens` VALUES ('dc6e315f234ca4e0a504c6a88dbeb7950b383bb5a64179df4b5f96909552761eb98c678b7d8130fc', '1', '1', 'FullStack', '[]', '0', '2019-05-15 12:01:48', '2019-05-15 12:01:48', '2020-05-15 12:01:48');
INSERT INTO `oauth_access_tokens` VALUES ('df08e9700a80fed4735078656f7811e2bfe8d6665ff9dcea23b24ed1949e42cdf38bfcf68d38c8a7', '1', '1', 'FullStack', '[]', '0', '2019-07-12 12:04:22', '2019-07-12 12:04:22', '2020-07-12 12:04:22');
INSERT INTO `oauth_access_tokens` VALUES ('e09caeeb02cb8535e11050ee6fa2213de965c856047eb3b6c39c742eebd92ce0d32279701ad9b758', '1', '1', 'FullStack', '[]', '0', '2019-07-11 11:30:29', '2019-07-11 11:30:29', '2020-07-11 11:30:29');
INSERT INTO `oauth_access_tokens` VALUES ('e0f09efb595fb1ecb5eaf7a822b2ccc9500b4c820b36059ecf22f946c77b920df9b4264cae60ca8f', '1', '1', 'FullStack', '[]', '0', '2019-05-09 18:37:42', '2019-05-09 18:37:42', '2020-05-09 18:37:42');
INSERT INTO `oauth_access_tokens` VALUES ('e119a9f3567290bfcca90adc40317e9b097509789ccea828aec57217fd278cb7d7c6f70e45bbc95b', '5', '1', 'FullStack', '[]', '0', '2019-05-20 17:59:18', '2019-05-20 17:59:18', '2020-05-20 17:59:18');
INSERT INTO `oauth_access_tokens` VALUES ('e3875ffa5ba627283eacd839af19e5455f7d8023230c5611ff99739bad859d488d82928242a2e643', '1', '1', 'FullStack', '[]', '0', '2019-06-23 10:37:12', '2019-06-23 10:37:12', '2020-06-23 10:37:12');
INSERT INTO `oauth_access_tokens` VALUES ('e51cdff8bea932f733e82baa4c50f34273916bcca7b7fa04b52526678ac4367aaea520557d9d8aa5', '1', '1', 'FullStack', '[]', '0', '2019-06-26 18:28:58', '2019-06-26 18:28:58', '2020-06-26 18:28:58');
INSERT INTO `oauth_access_tokens` VALUES ('e5ba98c734c552410263c7dd47f686b66e5bd7080557860dc69fb054cc30ece0f6eb0532bd919789', '1', '1', 'FullStack', '[]', '0', '2019-06-23 10:39:00', '2019-06-23 10:39:00', '2020-06-23 10:39:00');
INSERT INTO `oauth_access_tokens` VALUES ('e836f3c63b84b738af3a0b914f3b4f3cfcad5ff2095f39475fdc174a730e7bf2a7635f936944c906', '1', '1', 'FullStack', '[]', '0', '2019-06-28 15:47:30', '2019-06-28 15:47:30', '2020-06-28 15:47:30');
INSERT INTO `oauth_access_tokens` VALUES ('e9377bdfdd51ce2d3c89b54f7f65b6b6e42f5f7c08dbbd548aefd29b265ebf6d80c4b6e8bc320c84', '1', '1', 'FullStack', '[]', '0', '2019-07-19 11:28:13', '2019-07-19 11:28:13', '2020-07-19 11:28:13');
INSERT INTO `oauth_access_tokens` VALUES ('ec1c39cab432a926224792ae8a0d0ada43380c8329fa58bd819e1bec0266f83062f3362f01f29835', '1', '1', 'FullStack', '[]', '0', '2019-05-13 17:11:55', '2019-05-13 17:11:55', '2020-05-13 17:11:55');
INSERT INTO `oauth_access_tokens` VALUES ('ed05bafdb54cc0535af8fe4041275d167016a956aa993ee346d404ce66d85976344e88d284d49da8', '1', '1', 'FullStack', '[]', '0', '2019-07-02 14:27:23', '2019-07-02 14:27:23', '2020-07-02 14:27:23');
INSERT INTO `oauth_access_tokens` VALUES ('ed297c9585badb3b985ddb4a193c6b6d39c4aa324c9333744d233f36c94f58c379910b24a6066981', '5', '1', 'FullStack', '[]', '0', '2019-07-25 20:14:00', '2019-07-25 20:14:00', '2020-07-25 20:14:00');
INSERT INTO `oauth_access_tokens` VALUES ('ee4f8a49ecfb99bfd34e18f9fae7962117842bf4cc50c9cb5dfa2cd9d43e3d63db8ad9401b08e8ae', '1', '1', 'FullStack', '[]', '0', '2019-07-15 17:56:34', '2019-07-15 17:56:34', '2020-07-15 17:56:34');
INSERT INTO `oauth_access_tokens` VALUES ('f01c7feb25cb7491c1ffed83d6096b5e5af8e9bdb8cec16cdbf29cf98f2d2cd48d69e0a86a5c852c', '1', '1', 'FullStack', '[]', '0', '2019-07-03 09:33:56', '2019-07-03 09:33:56', '2020-07-03 09:33:56');
INSERT INTO `oauth_access_tokens` VALUES ('f12249297e45cd4a10ea71a17e5f2214e3560942387f24dfbdd2428b29b77929c388089116fff0b0', '1', '1', 'FullStack', '[]', '0', '2019-06-27 08:44:45', '2019-06-27 08:44:45', '2020-06-27 08:44:45');
INSERT INTO `oauth_access_tokens` VALUES ('f163ef81e34c27558aa15ec4af2271e8fc44297c801bbb7c48d9ed36758ea3a208fb60f48fa40f21', '1', '1', 'FullStack', '[]', '0', '2019-05-13 17:46:18', '2019-05-13 17:46:18', '2020-05-13 17:46:18');
INSERT INTO `oauth_access_tokens` VALUES ('f18024eacedb74b20ba50658cc2af828a44690e34f8896713257a6213d19145c30f08230c311a93d', '1', '1', 'FullStack', '[]', '0', '2019-06-23 11:19:33', '2019-06-23 11:19:33', '2020-06-23 11:19:33');
INSERT INTO `oauth_access_tokens` VALUES ('f4f3e9e4e9e3e0e926df5fc233941a8c047b9e49911e19c8259005888d0ee323bb637fad032b8b3f', '1', '1', 'FullStack', '[]', '0', '2019-06-23 10:22:30', '2019-06-23 10:22:30', '2020-06-23 10:22:30');
INSERT INTO `oauth_access_tokens` VALUES ('f5687df78756f35162114fee3f105e06a137404a2477c25ed262a774839cf0c0578dcad451f3a14b', '1', '1', 'FullStack', '[]', '0', '2019-07-15 17:59:54', '2019-07-15 17:59:54', '2020-07-15 17:59:54');
INSERT INTO `oauth_access_tokens` VALUES ('f5c3ec75a820c8550a497df198e7af3731e34ea3ad991cf70cb73fde436e7332451dc22e358cc737', '1', '1', 'FullStack', '[]', '0', '2019-06-26 11:14:00', '2019-06-26 11:14:00', '2020-06-26 11:14:00');
INSERT INTO `oauth_access_tokens` VALUES ('f5c75ec3d20e08504f1cb7dd9e0a3abe3dd75d955615a11476954d7cf3b4d47eb17aa94d5944ea52', '1', '1', 'FullStack', '[]', '0', '2019-07-04 10:51:31', '2019-07-04 10:51:31', '2020-07-04 10:51:31');
INSERT INTO `oauth_access_tokens` VALUES ('f763b870d44e1666767f732e11cc61e89c8a39471ab4c84cb3e6889c1bacad8ee55dbd5541444409', '1', '1', 'FullStack', '[]', '0', '2019-06-23 10:08:40', '2019-06-23 10:08:40', '2020-06-23 10:08:40');
INSERT INTO `oauth_access_tokens` VALUES ('f90d34caf1f1e81352fcdcf250fc048f59b6db3bd8896c72d48755da67fec007c3b26c5aa826561c', '1', '1', 'FullStack', '[]', '0', '2019-05-10 08:20:38', '2019-05-10 08:20:38', '2020-05-10 08:20:38');
INSERT INTO `oauth_access_tokens` VALUES ('f91992e283b025a74236e456892777a674544bce4505fa70e2db9203905d887eef90830e5e17c2d6', '1', '1', 'FullStack', '[]', '0', '2019-06-26 19:09:29', '2019-06-26 19:09:29', '2020-06-26 19:09:29');
INSERT INTO `oauth_access_tokens` VALUES ('f9c726669f701c76fe7e8131f14cdd46bbbe9844736bcfbe0b1c56ee0178dce7463da99e3775f537', '1', '1', 'FullStack', '[]', '0', '2019-07-18 18:43:28', '2019-07-18 18:43:28', '2020-07-18 18:43:28');
INSERT INTO `oauth_access_tokens` VALUES ('fc91ce8f34e6639bf5eafd2349d965e7534717bd5550b8d4c1e0ea1741b96a26c223785456c5fcd7', '1', '1', 'FullStack', '[]', '0', '2019-07-10 13:55:13', '2019-07-10 13:55:13', '2020-07-10 13:55:13');
INSERT INTO `oauth_access_tokens` VALUES ('fd2deaf7f576e4565b47024b53e933fd495e0b4d780ae64ccb6b0d2baacb8bf687cf8abe459253dd', '1', '1', 'FullStack', '[]', '0', '2019-05-08 14:02:04', '2019-05-08 14:02:04', '2020-05-08 14:02:04');
INSERT INTO `oauth_access_tokens` VALUES ('fe1c5ea0f3ec5d37fd9a7e8268f8e47cc2455f4f82e0de87ca53449931f32dfaaa7a83ea0206f8a7', '1', '1', 'FullStack', '[]', '0', '2019-07-24 11:33:48', '2019-07-24 11:33:48', '2020-07-24 11:33:48');
INSERT INTO `oauth_access_tokens` VALUES ('ff0f528eb94cfd17d10e10305bf3593c24d6d0b68b098f2972ea9b0a7fc89896136b50952858f03c', '1', '1', 'FullStack', '[]', '0', '2019-04-04 11:14:13', '2019-04-04 11:14:13', '2020-04-04 11:14:13');

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
INSERT INTO `oauth_clients` VALUES ('1', null, 'Laravel Personal Access Client', '5VP9E1z4VozC7P2rDJd9xxOdTO7dVjq6ZZpZxZmj', 'http://localhost', '1', '0', '0', '2019-04-02 16:02:39', '2019-04-02 16:02:39');
INSERT INTO `oauth_clients` VALUES ('2', null, 'Laravel Password Grant Client', 'xsk1Oe1faQ8nSqzchD8z4V30UXmCOAYDQCeoX66z', 'http://localhost', '0', '1', '0', '2019-04-02 16:02:39', '2019-04-02 16:02:39');

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
INSERT INTO `oauth_personal_access_clients` VALUES ('1', '1', '2019-04-02 16:02:39', '2019-04-02 16:02:39');

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
  `thirdparty_order_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付宝或微信单号',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL COMMENT '本次交易支付的订单金额，单位为人民币（元）',
  `pay_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'WECHAT_APP 微信APP支付，\r\nWECHAT_JSAPI 微信公众号支付，\r\nWECHAT_NATIVE 微信电脑网站支付，\r\nALIPAY_PAGE 支付宝电脑网站支付，\r\nALIPAY_APP 支付宝APP支付，\r\nALIPAY_WAP 支付宝手机网站支付，\r\nALIPAY_F2F 支付宝当面付，\r\nALIPAY_JS 支付宝JSAPI',
  `paid_at` datetime DEFAULT NULL COMMENT '交易付款时间',
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'MALL:商城,GROUPBUY:团购,WAIMAI:外卖',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=952 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('3', '123', '2018101201101', '123456789', '辣炒花蛤', '6.60', 'WECHAT_APP', null, 'GROUPBUY', '1', '2018-10-12 00:00:00', '2018-10-12 00:00:00');
INSERT INTO `orders` VALUES ('5', '125', '2018101220125', '120101201', '辣炒花蛤', '6.60', 'WECHAT_APP', null, 'GROUPBUY', '1', '2018-10-12 00:00:00', '2018-10-12 00:00:00');
INSERT INTO `orders` VALUES ('89', '87748', '2018101649555257', '4200000168201810164145957292', '讲真的', '0.02', 'WECHAT_JSAPI', '2018-10-16 10:31:03', 'REWARD', '2', '2018-10-16 10:30:57', '2018-10-16 10:31:03');
INSERT INTO `orders` VALUES ('96', '87748', '2018101698485755', '4200000177201810161596448514', '卡路里', '0.02', 'WECHAT_JSAPI', '2018-10-16 11:07:44', 'REWARD', '2', '2018-10-16 11:07:39', '2018-10-16 11:07:44');
INSERT INTO `orders` VALUES ('132', '123', '2018101753545751', '4200000202201810172166522272', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-17 15:52:48', 'GROUPBUY', '2', '2018-10-17 15:52:37', '2018-10-22 14:33:06');
INSERT INTO `orders` VALUES ('149', '87129', '2018101898505799', '4200000192201810185642560700', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-18 10:15:42', 'GROUPBUY', '2', '2018-10-18 09:41:31', '2018-10-18 10:59:13');
INSERT INTO `orders` VALUES ('150', '87129', '2018101897545497', '4200000202201810181702235170', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-18 10:18:53', 'GROUPBUY', '2', '2018-10-18 09:44:42', '2018-10-19 10:02:19');
INSERT INTO `orders` VALUES ('153', '123', '2018101810256525', '4200000198201810183787234519', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-18 10:02:02', 'GROUPBUY', '2', '2018-10-18 10:01:51', '2018-10-19 11:52:22');
INSERT INTO `orders` VALUES ('154', '87129', '2018101810151575', '4200000199201810185414371759', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-18 10:03:17', 'GROUPBUY', '2', '2018-10-18 10:03:10', '2018-11-13 08:23:09');
INSERT INTO `orders` VALUES ('155', '87129', '2018101810098101', '2018101822001451700533698498', '购买辣炒花蛤', '0.01', 'ALIPAY_APP', '2018-10-18 10:07:02', 'GROUPBUY', '2', '2018-10-18 10:06:53', '2018-10-22 15:34:54');
INSERT INTO `orders` VALUES ('156', '123', '2018101849514852', '2018101822001422261005144911', '购买辣炒花蛤', '0.01', 'ALIPAY_APP', '2018-10-18 10:21:40', 'GROUPBUY', '2', '2018-10-18 10:21:21', '2018-10-22 15:34:43');
INSERT INTO `orders` VALUES ('175', '87129', '2018101857555152', '4200000201201810186616263850', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-18 17:42:08', 'GROUPBUY', '2', '2018-10-18 17:42:01', '2018-10-18 17:42:08');
INSERT INTO `orders` VALUES ('176', '87129', '2018101953545710', '4200000204201810198378355083', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-19 09:19:07', 'GROUPBUY', '2', '2018-10-19 09:19:01', '2018-10-19 09:19:07');
INSERT INTO `orders` VALUES ('179', '18494', '2018102297100569', '2018102222001460451006426893', '购买辣炒花蛤', '0.01', 'ALIPAY_WAP', '2018-10-22 14:43:08', 'GROUPBUY', '2', '2018-10-22 14:42:50', '2018-10-22 15:15:08');
INSERT INTO `orders` VALUES ('180', '18494', '2018102252575753', '2018102222001460451006733708', '购买辣炒花蛤', '0.01', 'ALIPAY_WAP', '2018-10-22 15:17:06', 'GROUPBUY', '2', '2018-10-22 15:16:52', '2018-10-22 15:35:39');
INSERT INTO `orders` VALUES ('181', '18494', '2018102210250505', '2018102222001460451006436525', '购买辣炒花蛤', '0.01', 'ALIPAY_WAP', '2018-10-22 15:22:01', 'GROUPBUY', '2', '2018-10-22 15:21:51', '2018-10-22 15:34:37');
INSERT INTO `orders` VALUES ('182', '18494', '2018102255511001', '2018102222001460451006442723', '购买辣炒花蛤', '0.01', 'ALIPAY_WAP', '2018-10-22 15:33:35', 'GROUPBUY', '2', '2018-10-22 15:33:27', '2018-10-22 15:34:33');
INSERT INTO `orders` VALUES ('183', '123', '2018102255981005', null, '购买辣炒花蛤', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2018-10-22 16:02:31', '2018-10-22 16:02:32');
INSERT INTO `orders` VALUES ('184', '123', '2018102251521005', null, '购买辣炒花蛤', '0.01', 'ALIPAY_APP', null, 'GROUPBUY', '1', '2018-10-22 16:02:43', '2018-10-22 16:02:43');
INSERT INTO `orders` VALUES ('185', '87129', '2018102310199525', '4200000192201810231340607903', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-23 09:41:41', 'GROUPBUY', '2', '2018-10-23 09:41:34', '2018-10-23 09:41:41');
INSERT INTO `orders` VALUES ('186', '87129', '2018102349535453', '2018102322001451701006653250', '购买辣炒花蛤', '0.02', 'ALIPAY_APP', '2018-10-23 10:02:29', 'GROUPBUY', '2', '2018-10-23 10:01:53', '2018-10-23 10:02:29');
INSERT INTO `orders` VALUES ('188', '87129', '2018102353495054', '4200000195201810233045413382', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-23 10:57:45', 'GROUPBUY', '2', '2018-10-23 10:57:25', '2018-10-23 10:57:45');
INSERT INTO `orders` VALUES ('189', '87129', '2018102397485610', '4200000201201810236743983114', '购买辣炒花蛤', '0.02', 'WECHAT_APP', '2018-10-23 11:11:59', 'GROUPBUY', '2', '2018-10-23 11:11:54', '2018-10-23 11:11:59');
INSERT INTO `orders` VALUES ('191', '87129', '2018102398535110', '2018102322001451701006644501', '购买辣炒花蛤', '0.03', 'ALIPAY_APP', '2018-10-23 11:12:52', 'GROUPBUY', '2', '2018-10-23 11:12:27', '2018-10-23 11:12:52');
INSERT INTO `orders` VALUES ('192', '87129', '2018102310052564', '4200000202201810237537156232', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-23 11:16:54', 'GROUPBUY', '2', '2018-10-23 11:16:29', '2018-10-23 11:16:54');
INSERT INTO `orders` VALUES ('193', '87129', '2018102355551025', '2018102322001451701006720054', '购买辣炒花蛤', '0.01', 'ALIPAY_APP', '2018-10-23 11:18:05', 'GROUPBUY', '2', '2018-10-23 11:17:59', '2018-10-23 11:18:05');
INSERT INTO `orders` VALUES ('194', '87129', '2018102349985153', '4200000201201810234637452846', '购买辣炒花蛤', '0.01', 'WECHAT_NATIVE', '2018-10-23 11:20:00', 'GROUPBUY', '2', '2018-10-23 11:19:45', '2018-10-30 08:47:55');
INSERT INTO `orders` VALUES ('195', '87129', '2018102310255971', '2018102322001451701006735232', '购买辣炒花蛤', '0.01', 'ALIPAY_APP', '2018-10-23 11:24:07', 'GROUPBUY', '2', '2018-10-23 11:22:07', '2018-10-23 11:24:07');
INSERT INTO `orders` VALUES ('196', '87129', '2018102398575353', '4200000206201810238988145154', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-23 11:26:59', 'GROUPBUY', '2', '2018-10-23 11:26:35', '2018-10-23 11:26:59');
INSERT INTO `orders` VALUES ('197', '87129', '2018102354491025', '2018102322001451701006671268', '购买辣炒花蛤', '0.01', 'ALIPAY_APP', '2018-10-23 11:28:23', 'GROUPBUY', '2', '2018-10-23 11:28:06', '2018-10-23 12:02:20');
INSERT INTO `orders` VALUES ('198', '3944', '2018102310053101', '2018102322001490911008491469', '购买酱爆花蛤', '6.60', 'ALIPAY_WAP', '2018-10-23 11:28:39', 'GROUPBUY', '2', '2018-10-23 11:28:13', '2018-10-23 11:28:39');
INSERT INTO `orders` VALUES ('199', '87129', '2018102397561019', '4200000204201810230983889847', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-23 11:44:47', 'GROUPBUY', '2', '2018-10-23 11:44:26', '2018-10-23 11:44:47');
INSERT INTO `orders` VALUES ('200', '87129', '2018102351561021', '4200000194201810230314319205', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-23 11:45:47', 'GROUPBUY', '2', '2018-10-23 11:45:23', '2018-10-23 11:45:47');
INSERT INTO `orders` VALUES ('201', '87129', '2018102397545149', '4200000201201810238479522765', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-23 11:53:30', 'GROUPBUY', '2', '2018-10-23 11:47:54', '2018-10-23 11:53:30');
INSERT INTO `orders` VALUES ('202', '87129', '2018102348574954', '4200000199201810238455247852', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-23 12:00:32', 'GROUPBUY', '2', '2018-10-23 12:00:16', '2018-10-29 12:01:22');
INSERT INTO `orders` VALUES ('204', '41331', '2018102356515651', '2018102322001444221006312596', '购买辣炒花蛤', '0.01', 'ALIPAY_WAP', '2018-10-23 15:04:34', 'GROUPBUY', '2', '2018-10-23 15:04:08', '2019-03-14 12:14:40');
INSERT INTO `orders` VALUES ('205', '3944', '2018102449544851', '4200000205201810243498171266', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-10-24 08:26:16', 'GROUPBUY', '2', '2018-10-24 08:25:53', '2018-10-24 08:26:16');
INSERT INTO `orders` VALUES ('207', '65393', '2018102456535548', null, '购买辣炒花蛤', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2018-10-24 11:29:28', '2018-10-24 11:29:28');
INSERT INTO `orders` VALUES ('208', '57143', '2018102498571021', '4200000190201810249305466535', '购买辣炒花蛤', '0.02', 'WECHAT_APP', '2018-10-24 12:12:07', 'GROUPBUY', '2', '2018-10-24 12:11:55', '2018-10-24 12:12:07');
INSERT INTO `orders` VALUES ('209', '57143', '2018102449539810', null, '购买辣炒花蛤', '0.02', 'ALIPAY_APP', null, 'GROUPBUY', '1', '2018-10-24 12:12:33', '2018-10-24 12:12:33');
INSERT INTO `orders` VALUES ('210', '57143', '2018102450495750', null, '购买辣炒花蛤', '0.02', 'ALIPAY_APP', null, 'GROUPBUY', '1', '2018-10-24 12:12:34', '2018-10-24 12:12:34');
INSERT INTO `orders` VALUES ('211', '57143', '2018102453484897', '2018102422001474221006270151', '购买辣炒花蛤', '0.01', 'ALIPAY_APP', '2018-10-24 12:13:11', 'GROUPBUY', '2', '2018-10-24 12:12:53', '2018-10-24 12:13:11');
INSERT INTO `orders` VALUES ('212', '57143', '2018102451535357', null, '购买酱爆花蛤', '6.60', 'ALIPAY_APP', null, 'GROUPBUY', '1', '2018-10-24 12:13:39', '2018-10-24 12:13:39');
INSERT INTO `orders` VALUES ('214', '57143', '2018102453495151', null, '购买酱爆花蛤', '6.60', 'WECHAT_APP', null, 'GROUPBUY', '1', '2018-10-24 12:15:17', '2018-10-24 12:15:32');
INSERT INTO `orders` VALUES ('215', '57143', '2018102410054521', null, '购买辣炒花蛤', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2018-10-24 12:55:25', '2018-10-24 12:55:26');
INSERT INTO `orders` VALUES ('216', '57143', '2018102410254529', null, '购买辣炒花蛤', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2018-10-24 12:55:27', '2018-10-24 12:55:27');
INSERT INTO `orders` VALUES ('217', '57143', '2018102410157985', null, '购买辣炒花蛤', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2018-10-24 12:56:46', '2018-10-24 12:56:47');
INSERT INTO `orders` VALUES ('218', '57143', '2018102452544851', null, '购买辣炒花蛤', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2018-10-24 12:57:24', '2018-10-24 12:58:27');
INSERT INTO `orders` VALUES ('220', '123', '2018102610053995', null, '购买辣炒花蛤', '0.02', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-10-26 17:14:05', '2018-10-26 17:14:06');
INSERT INTO `orders` VALUES ('221', '123', '2018102656494855', null, '购买辣炒花蛤', '0.02', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-10-26 17:15:52', '2018-10-26 17:15:52');
INSERT INTO `orders` VALUES ('222', '123', '2018102650102515', null, '购买辣炒花蛤', '0.02', 'ALIPAY_PAGE', null, 'GROUPBUY', '1', '2018-10-26 17:20:19', '2018-10-26 17:20:20');
INSERT INTO `orders` VALUES ('223', '123', '2018102655539853', null, '购买辣炒花蛤', '0.02', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-10-26 17:53:11', '2018-10-26 17:53:11');
INSERT INTO `orders` VALUES ('224', '123', '2018102610156485', null, '购买辣炒花蛤', '0.02', 'ALIPAY_PAGE', null, 'GROUPBUY', '1', '2018-10-26 17:53:18', '2018-10-26 17:53:18');
INSERT INTO `orders` VALUES ('225', '123', '2018102653985152', null, '购买辣炒花蛤', '0.02', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-10-26 17:55:17', '2018-10-26 17:55:17');
INSERT INTO `orders` VALUES ('226', '123', '2018102697100521', null, '购买辣炒花蛤', '0.02', 'ALIPAY_PAGE', null, 'GROUPBUY', '1', '2018-10-26 17:55:38', '2018-10-26 17:55:39');
INSERT INTO `orders` VALUES ('227', '123', '2018102699985110', null, '购买辣炒花蛤', '0.02', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-10-26 17:55:56', '2018-10-26 17:55:56');
INSERT INTO `orders` VALUES ('228', '123', '2018102649485599', null, '购买辣炒花蛤', '0.02', 'WECHAT_APP', null, 'GROUPBUY', '1', '2018-10-26 17:59:45', '2018-10-26 17:59:45');
INSERT INTO `orders` VALUES ('230', '123', '2018102650495798', null, '购买辣炒花蛤', '0.02', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-10-26 18:06:58', '2018-10-26 18:06:58');
INSERT INTO `orders` VALUES ('231', '123', '2018102653575749', '4200000198201810266812131565', '购买辣炒花蛤', '0.01', 'WECHAT_NATIVE', '2018-10-26 18:11:40', 'GROUPBUY', '2', '2018-10-26 18:10:29', '2018-10-29 09:46:15');
INSERT INTO `orders` VALUES ('232', '123', '2018102956100511', '4200000190201810296982738727', '购买辣炒花蛤', '0.01', 'WECHAT_NATIVE', '2018-10-29 09:46:58', 'GROUPBUY', '2', '2018-10-29 08:16:56', '2018-10-31 10:24:59');
INSERT INTO `orders` VALUES ('233', '123', '2018102998485257', null, '购买辣炒花蛤', '0.01', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-10-29 09:05:31', '2018-10-29 09:49:48');
INSERT INTO `orders` VALUES ('234', '123', '2018102999529897', null, '购买辣炒花蛤', '0.01', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-10-29 10:12:28', '2018-10-29 10:22:57');
INSERT INTO `orders` VALUES ('235', '123', '2018102997489956', null, '购买辣炒花蛤', '0.01', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-10-29 10:23:06', '2018-10-29 10:23:06');
INSERT INTO `orders` VALUES ('236', '123', '2018102950541015', null, '购买辣炒花蛤', '0.01', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-10-29 10:23:14', '2018-10-29 10:23:15');
INSERT INTO `orders` VALUES ('237', '123', '2018102952101975', null, '购买辣炒花蛤', '0.01', null, null, 'GROUPBUY', '1', '2018-10-29 10:25:56', '2018-10-29 10:25:56');
INSERT INTO `orders` VALUES ('238', '123', '2018102952541014', null, '购买辣炒花蛤', '0.01', null, null, 'GROUPBUY', '1', '2018-10-29 10:26:12', '2018-10-29 10:26:12');
INSERT INTO `orders` VALUES ('239', '123', '2018102950489950', '4200000189201810311862527535', '购买辣炒花蛤', '0.01', 'WECHAT_NATIVE', '2018-10-31 10:24:22', 'GROUPBUY', '2', '2018-10-29 10:26:58', '2018-11-01 17:10:39');
INSERT INTO `orders` VALUES ('240', '123', '2018102910048102', null, '购买辣炒花蛤', '0.01', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-10-29 10:29:17', '2018-10-31 10:23:23');
INSERT INTO `orders` VALUES ('243', '41331', '2018102910297102', '2018102922001444221007045798', '购买鲜花2', '2.00', 'ALIPAY_WAP', '2018-10-29 14:01:18', 'GROUPBUY', '2', '2018-10-29 14:00:47', '2019-03-14 12:14:37');
INSERT INTO `orders` VALUES ('244', '41331', '2018102998555410', '2018102922001444221006976419', '购买鲜花2', '2.00', 'ALIPAY_WAP', '2018-10-29 14:02:57', 'GROUPBUY', '2', '2018-10-29 14:02:35', '2019-03-14 12:14:33');
INSERT INTO `orders` VALUES ('245', '47023', '2018102957554810', '4200000192201810296490880617', '购买鲜花1', '1.00', 'WECHAT_APP', '2018-10-29 14:18:11', 'GROUPBUY', '2', '2018-10-29 14:18:01', '2019-03-14 11:40:02');
INSERT INTO `orders` VALUES ('246', '123', '2018102997101991', null, '购买辣炒花蛤', '0.01', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-10-29 14:31:22', '2018-10-31 10:23:36');
INSERT INTO `orders` VALUES ('247', '123', '2018102910152555', null, '购买辣炒花蛤', '0.03', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-10-29 14:31:42', '2018-10-29 14:31:43');
INSERT INTO `orders` VALUES ('263', '87129', '2018103098985010', null, '购买辣炒花蛤', '0.01', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-10-30 10:18:35', '2018-10-30 10:18:36');
INSERT INTO `orders` VALUES ('265', '87129', '2018103048579852', null, '购买辣炒花蛤', '0.01', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-10-30 10:28:32', '2018-10-30 10:30:17');
INSERT INTO `orders` VALUES ('267', '123', '2018103010210055', '2018103022001422261006916605', '购买辣炒花蛤', '0.01', 'ALIPAY_PAGE', '2018-10-30 14:44:59', 'GROUPBUY', '2', '2018-10-30 14:40:15', '2018-11-01 10:51:18');
INSERT INTO `orders` VALUES ('269', '87129', '2018103051574951', null, '购买辣炒花蛤', '0.01', 'ALIPAY_PAGE', null, 'GROUPBUY', '1', '2018-10-30 15:54:27', '2018-10-30 16:11:59');
INSERT INTO `orders` VALUES ('270', '123', '2018103157564856', '4200000207201810310434298192', '购买辣炒花蛤', '0.01', 'WECHAT_NATIVE', '2018-10-31 10:19:54', 'GROUPBUY', '2', '2018-10-31 10:18:33', '2018-11-26 19:21:47');
INSERT INTO `orders` VALUES ('273', '87129', '2018110197102511', null, '购买辣炒花蛤', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2018-11-01 09:11:22', '2018-11-01 09:11:23');
INSERT INTO `orders` VALUES ('274', '87129', '2018110110299545', '4200000199201811013820747651', '购买辣炒花蛤', '0.01', 'WECHAT_APP', '2018-11-01 09:14:17', 'GROUPBUY', '2', '2018-11-01 09:14:07', '2018-11-01 09:14:17');
INSERT INTO `orders` VALUES ('275', '41331', '2018110149565448', '4200000197201811013705462050', '购买辣炒花蛤', '0.01', 'WECHAT_NATIVE', '2018-11-01 09:18:19', 'GROUPBUY', '2', '2018-11-01 09:17:37', '2019-03-14 12:14:31');
INSERT INTO `orders` VALUES ('278', '87129', '2018110110010156', '2018110122001428371005926275', '购买辣炒花蛤', '0.01', 'ALIPAY_WAP', '2018-11-01 09:23:13', 'GROUPBUY', '2', '2018-11-01 09:22:21', '2018-11-01 09:23:13');
INSERT INTO `orders` VALUES ('280', '87129', '2018110152102491', '2018110122001451701009714622', '购买辣炒花蛤', '0.01', 'ALIPAY_APP', '2018-11-01 09:25:06', 'GROUPBUY', '2', '2018-11-01 09:24:52', '2018-11-01 09:28:00');
INSERT INTO `orders` VALUES ('281', '3944', '2018110110156531', null, '卡路里', '1.00', 'WECHAT_JSAPI', null, 'REWARD', '1', '2018-11-01 18:14:22', '2018-11-01 18:14:22');
INSERT INTO `orders` VALUES ('283', '45749', '2018110298575255', null, '卡路里', '2.00', 'WECHAT_JSAPI', null, 'REWARD', '1', '2018-11-02 09:19:23', '2018-11-02 09:19:23');
INSERT INTO `orders` VALUES ('284', '45749', '2018110257974898', null, '卡路里', '1.00', 'WECHAT_JSAPI', null, 'REWARD', '1', '2018-11-02 09:20:09', '2018-11-02 09:20:09');
INSERT INTO `orders` VALUES ('285', '45749', '2018110257999798', null, '卡路里', '1.00', 'WECHAT_JSAPI', null, 'REWARD', '1', '2018-11-02 09:20:41', '2018-11-02 09:20:42');
INSERT INTO `orders` VALUES ('286', '36579', '2018110250495555', null, '购买烤冷面', '0.01', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2018-11-02 10:12:50', '2018-11-02 10:14:29');
INSERT INTO `orders` VALUES ('287', '36579', '2018110210253102', null, '购买烤冷面', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2018-11-02 10:13:35', '2018-11-27 15:25:51');
INSERT INTO `orders` VALUES ('291', '45749', '2018111910099100', null, '醉千年', '1.00', 'WECHAT_JSAPI', null, 'REWARD', '1', '2018-11-19 08:51:25', '2018-11-19 08:51:26');
INSERT INTO `orders` VALUES ('292', '45749', '2018111951555755', null, '醉千年', '1.00', 'WECHAT_JSAPI', null, 'REWARD', '1', '2018-11-19 08:51:31', '2018-11-19 08:51:31');
INSERT INTO `orders` VALUES ('293', '45749', '2018111910110148', null, '醉千年', '1.00', 'WECHAT_JSAPI', null, 'REWARD', '1', '2018-11-19 08:51:42', '2018-11-19 08:51:43');
INSERT INTO `orders` VALUES ('294', '45749', '2018111952485310', null, '醉千年', '10.00', 'WECHAT_JSAPI', null, 'REWARD', '1', '2018-11-19 08:51:48', '2018-11-19 08:51:48');
INSERT INTO `orders` VALUES ('295', '87713', '2018112010210048', null, '嘴巴嘟啊嘟', '10.00', 'WECHAT_JSAPI', null, 'REWARD', '1', '2018-11-20 16:16:31', '2018-11-20 16:16:32');
INSERT INTO `orders` VALUES ('296', '87129', '2018112149975310', null, '购买测试商品', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2018-11-21 16:21:05', '2018-11-21 16:21:06');
INSERT INTO `orders` VALUES ('297', '87129', '2018112155545197', null, '购买测试商品', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2018-11-21 16:21:11', '2018-11-21 17:52:57');
INSERT INTO `orders` VALUES ('298', '87129', '2018112110098569', '2018112122001451701015254227', '购买测试商品', '0.01', 'ALIPAY_APP', '2018-11-21 16:21:24', 'GROUPBUY', '2', '2018-11-21 16:21:17', '2018-11-21 16:21:24');
INSERT INTO `orders` VALUES ('299', '87129', '2018112197534951', '2018112122001451701015226126', '购买测试商品', '0.01', 'ALIPAY_APP', '2018-11-21 17:53:19', 'GROUPBUY', '2', '2018-11-21 17:53:14', '2018-11-21 17:53:19');
INSERT INTO `orders` VALUES ('300', '92130', '2018112651975455', null, '港币充值', '50.00', 'WECHAT_JSAPI', null, 'GANGCOIN_RECHARGE', '1', '2018-11-26 17:37:55', '2018-11-26 17:37:56');
INSERT INTO `orders` VALUES ('301', '36579', '2018112799971014', null, '港币充值', '50.00', null, null, 'GANGCOIN_RECHARGE', '1', '2018-11-27 15:01:32', '2018-11-27 15:01:32');
INSERT INTO `orders` VALUES ('302', '36579', '2018112755979855', null, '港币充值', '50.00', null, null, 'GANGCOIN_RECHARGE', '1', '2018-11-27 15:01:43', '2018-11-27 15:01:43');
INSERT INTO `orders` VALUES ('303', '36579', '2018112798549848', null, '港币充值', '50.00', null, null, 'GANGCOIN_RECHARGE', '1', '2018-11-27 15:04:43', '2018-11-27 15:04:43');
INSERT INTO `orders` VALUES ('304', '36579', '2018112755485153', null, '港币充值', '50.00', 'WECHAT_JSAPI', null, 'GANGCOIN_RECHARGE', '1', '2018-11-27 15:05:43', '2018-11-27 15:05:43');
INSERT INTO `orders` VALUES ('305', '36579', '2018112710298485', null, '港币充值', '50.00', 'WECHAT_JSAPI', null, 'GANGCOIN_RECHARGE', '1', '2018-11-27 15:05:51', '2018-11-27 15:05:52');
INSERT INTO `orders` VALUES ('306', '36579', '2018112750981001', null, '港币充值', '50.00', 'WECHAT_JSAPI', null, 'GANGCOIN_RECHARGE', '1', '2018-11-27 15:12:18', '2018-11-27 15:12:19');
INSERT INTO `orders` VALUES ('307', '36579', '2018112799529950', null, '港币充值', '50.00', 'WECHAT_JSAPI', null, 'GANGCOIN_RECHARGE', '1', '2018-11-27 15:13:32', '2018-11-27 15:13:40');
INSERT INTO `orders` VALUES ('308', '36579', '2018112749544952', '4200000237201811278867815797', '港币充值', '0.10', 'WECHAT_JSAPI', '2018-11-27 15:20:29', 'GANGCOIN_RECHARGE', '2', '2018-11-27 15:16:17', '2018-11-27 15:20:29');
INSERT INTO `orders` VALUES ('309', '36579', '2018112756525349', '4200000219201811275746824726', '港币充值', '0.10', 'WECHAT_JSAPI', '2018-11-27 15:20:30', 'GANGCOIN_RECHARGE', '2', '2018-11-27 15:20:24', '2018-11-27 15:20:30');
INSERT INTO `orders` VALUES ('310', '36579', '2018112755101515', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-27 15:20:40', 'MIAOSHA', '2', '2018-11-27 15:20:39', '2018-11-27 15:20:40');
INSERT INTO `orders` VALUES ('311', '36579', '2018112753979849', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-27 15:26:46', 'MIAOSHA', '2', '2018-11-27 15:26:45', '2018-11-27 15:26:46');
INSERT INTO `orders` VALUES ('312', '36579', '2018112753505353', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-27 15:29:09', 'MIAOSHA', '2', '2018-11-27 15:29:09', '2018-11-27 15:29:09');
INSERT INTO `orders` VALUES ('313', '36579', '2018112752514856', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-27 15:32:52', 'MIAOSHA', '2', '2018-11-27 15:32:52', '2018-11-30 09:31:41');
INSERT INTO `orders` VALUES ('314', '36579', '2018112755484856', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-27 16:33:27', 'MIAOSHA', '2', '2018-11-27 16:33:27', '2018-11-30 09:12:15');
INSERT INTO `orders` VALUES ('315', '36579', '2018112748505457', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-27 16:53:52', 'MIAOSHA', '2', '2018-11-27 16:53:52', '2018-11-27 16:53:52');
INSERT INTO `orders` VALUES ('316', '3944', '2018112849975152', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-28 11:17:22', 'MIAOSHA', '2', '2018-11-28 11:17:21', '2018-11-28 11:17:22');
INSERT INTO `orders` VALUES ('317', '3944', '2018112851505610', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-28 11:17:55', 'MIAOSHA', '2', '2018-11-28 11:17:55', '2018-11-28 11:17:55');
INSERT INTO `orders` VALUES ('319', '36579', '2018112897571009', null, '港币提现', '0.04', 'GANGCOIN', null, 'GANGCOIN_WITHDRAW', '1', '2018-11-28 11:54:34', '2018-11-28 11:54:34');
INSERT INTO `orders` VALUES ('320', '36579', '2018112852579949', null, '港币提现', '0.04', 'GANGCOIN', null, 'GANGCOIN_WITHDRAW', '1', '2018-11-28 11:56:20', '2018-11-28 11:56:20');
INSERT INTO `orders` VALUES ('321', '36579', '2018112854524898', null, '港币提现', '0.01', 'GANGCOIN', null, 'GANGCOIN_WITHDRAW', '1', '2018-11-28 12:00:38', '2018-11-28 12:00:38');
INSERT INTO `orders` VALUES ('322', '36579', '2018112850101495', null, '港币提现', '0.01', 'GANGCOIN', null, 'GANGCOIN_WITHDRAW', '1', '2018-11-28 12:01:54', '2018-11-28 12:01:54');
INSERT INTO `orders` VALUES ('323', '36579', '2018112848555254', null, '港币提现', '0.01', 'GANGCOIN', null, 'GANGCOIN_WITHDRAW', '1', '2018-11-28 12:02:56', '2018-11-28 12:02:56');
INSERT INTO `orders` VALUES ('324', '92129', '2018112810255571', null, '港币提现', '0.01', 'GANGCOIN', null, 'GANGCOIN_WITHDRAW', '1', '2018-11-28 12:07:27', '2018-11-28 12:07:27');
INSERT INTO `orders` VALUES ('329', '87129', '2018113054985453', '4200000230201811300986911379', '港币充值', '0.10', 'WECHAT_JSAPI', '2018-11-30 09:41:49', 'GANGCOIN_RECHARGE', '2', '2018-11-30 09:41:42', '2018-11-30 09:41:49');
INSERT INTO `orders` VALUES ('330', '87129', '2018113051525010', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 09:41:55', 'MIAOSHA', '2', '2018-11-30 09:41:55', '2018-11-30 09:41:55');
INSERT INTO `orders` VALUES ('331', '87129', '2018113048525557', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 09:43:12', 'MIAOSHA', '2', '2018-11-30 09:43:12', '2018-11-30 09:43:12');
INSERT INTO `orders` VALUES ('332', '87129', '2018113010151565', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 09:43:58', 'MIAOSHA', '2', '2018-11-30 09:43:58', '2018-11-30 09:43:58');
INSERT INTO `orders` VALUES ('333', '87129', '2018113052100549', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 09:58:29', 'MIAOSHA', '1', '2018-11-30 09:58:28', '2018-11-30 10:18:29');
INSERT INTO `orders` VALUES ('334', '87129', '2018113055995197', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 10:02:32', 'MIAOSHA', '1', '2018-11-30 10:02:31', '2018-11-30 10:02:32');
INSERT INTO `orders` VALUES ('335', '87748', '2018113097529854', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 10:35:54', 'MIAOSHA', '1', '2018-11-30 10:35:54', '2018-11-30 10:35:54');
INSERT INTO `orders` VALUES ('336', '87748', '2018113051575051', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 10:37:55', 'MIAOSHA', '1', '2018-11-30 10:37:55', '2018-11-30 10:39:59');
INSERT INTO `orders` VALUES ('337', '3944', '2018113052499951', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 11:07:03', 'MIAOSHA', '1', '2018-11-30 11:07:00', '2018-11-30 11:07:03');
INSERT INTO `orders` VALUES ('338', '3944', '2018113053100985', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 11:08:06', 'MIAOSHA', '1', '2018-11-30 11:07:01', '2018-11-30 11:08:06');
INSERT INTO `orders` VALUES ('339', '3944', '2018113054555110', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 11:07:04', 'MIAOSHA', '1', '2018-11-30 11:07:02', '2018-11-30 11:07:04');
INSERT INTO `orders` VALUES ('340', '3944', '2018113056489856', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 11:07:05', 'MIAOSHA', '1', '2018-11-30 11:07:04', '2018-11-30 11:07:05');
INSERT INTO `orders` VALUES ('341', '3944', '2018113056525010', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 11:07:05', 'MIAOSHA', '1', '2018-11-30 11:07:04', '2018-11-30 11:07:05');
INSERT INTO `orders` VALUES ('342', '3944', '2018113056545010', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 11:07:05', 'MIAOSHA', '1', '2018-11-30 11:07:04', '2018-11-30 11:07:05');
INSERT INTO `orders` VALUES ('343', '3944', '2018113057535310', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 11:07:05', 'MIAOSHA', '1', '2018-11-30 11:07:05', '2018-11-30 11:07:18');
INSERT INTO `orders` VALUES ('344', '45389', '2018113049535197', null, '港币充值', '100.00', 'WECHAT_JSAPI', null, 'GANGCOIN_RECHARGE', '1', '2018-11-30 11:17:21', '2018-11-30 11:17:21');
INSERT INTO `orders` VALUES ('345', '45389', '2018113010048575', null, '港币充值', '0.10', 'WECHAT_JSAPI', null, 'GANGCOIN_RECHARGE', '1', '2018-11-30 11:17:33', '2018-11-30 11:17:33');
INSERT INTO `orders` VALUES ('346', '45389', '2018113097985554', null, '港币充值', '0.10', 'WECHAT_JSAPI', null, 'GANGCOIN_RECHARGE', '1', '2018-11-30 11:18:02', '2018-11-30 11:18:03');
INSERT INTO `orders` VALUES ('347', '45389', '2018113010257534', '4200000214201811300925765871', '港币充值', '0.10', 'WECHAT_JSAPI', '2018-11-30 11:18:47', 'GANGCOIN_RECHARGE', '2', '2018-11-30 11:18:39', '2018-11-30 11:18:47');
INSERT INTO `orders` VALUES ('348', '45389', '2018113049509799', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 11:18:57', 'MIAOSHA', '1', '2018-11-30 11:18:57', '2018-11-30 11:18:57');
INSERT INTO `orders` VALUES ('357', '87129', '2018113054525349', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 14:52:38', 'MIAOSHA', '2', '2018-11-30 14:52:38', '2018-11-30 14:52:38');
INSERT INTO `orders` VALUES ('358', '87748', '2018113055545654', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 14:57:11', 'MIAOSHA', '2', '2018-11-30 14:57:11', '2018-11-30 14:57:11');
INSERT INTO `orders` VALUES ('359', '87748', '2018113010255485', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 14:58:07', 'MIAOSHA', '2', '2018-11-30 14:58:07', '2018-11-30 14:58:07');
INSERT INTO `orders` VALUES ('360', '87129', '2018113055561005', null, '购买测试商品', '0.01', 'GANGCOIN', '2018-11-30 15:05:59', 'MIAOSHA', '2', '2018-11-30 15:05:59', '2018-11-30 15:05:59');
INSERT INTO `orders` VALUES ('364', '87129', '2018113099544850', null, '购买测试商品1', '0.01', 'GANGCOIN', '2018-11-30 15:15:08', 'MIAOSHA', '2', '2018-11-30 15:15:08', '2018-11-30 15:15:08');
INSERT INTO `orders` VALUES ('365', '87748', '2018113052974854', null, '购买测试商品2', '0.01', 'GANGCOIN', '2018-11-30 16:21:57', 'MIAOSHA', '2', '2018-11-30 16:21:56', '2018-11-30 16:21:57');
INSERT INTO `orders` VALUES ('366', '87748', '2018113057549855', null, '购买测试商品6', '0.01', 'GANGCOIN', '2018-11-30 16:22:33', 'MIAOSHA', '2', '2018-11-30 16:22:33', '2018-11-30 16:22:33');
INSERT INTO `orders` VALUES ('367', '87748', '2018113010148545', null, '购买测试商品6', '0.01', 'GANGCOIN', '2018-11-30 16:24:30', 'MIAOSHA', '2', '2018-11-30 16:24:30', '2018-11-30 16:24:30');
INSERT INTO `orders` VALUES ('368', '87129', '2018113050979953', null, '购买测试商品2', '0.01', 'GANGCOIN', '2018-11-30 16:27:31', 'MIAOSHA', '2', '2018-11-30 16:27:30', '2018-11-30 16:27:31');
INSERT INTO `orders` VALUES ('369', '87129', '2018113052565653', null, '购买测试商品2', '0.01', 'GANGCOIN', '2018-11-30 16:28:36', 'MIAOSHA', '2', '2018-11-30 16:28:36', '2018-11-30 16:28:36');
INSERT INTO `orders` VALUES ('370', '87129', '2018113055494810', null, '购买测试商品2', '0.01', 'GANGCOIN', '2018-11-30 16:35:03', 'MIAOSHA', '2', '2018-11-30 16:35:03', '2018-11-30 16:35:03');
INSERT INTO `orders` VALUES ('371', '87129', '2018113056551005', null, '购买测试商品2', '0.01', 'GANGCOIN', '2018-11-30 16:40:40', 'MIAOSHA', '2', '2018-11-30 16:40:40', '2018-11-30 16:40:40');
INSERT INTO `orders` VALUES ('372', '87748', '2018113098485497', null, '购买测试商品2', '0.01', 'GANGCOIN', '2018-11-30 16:43:23', 'MIAOSHA', '2', '2018-11-30 16:43:23', '2018-11-30 16:43:23');
INSERT INTO `orders` VALUES ('373', '87748', '2018113055509710', null, '购买测试商品2', '0.01', 'GANGCOIN', '2018-11-30 16:46:47', 'MIAOSHA', '2', '2018-11-30 16:46:47', '2018-11-30 16:46:47');
INSERT INTO `orders` VALUES ('374', '43714', '2018113049575149', null, '港币充值', '0.10', 'WECHAT_JSAPI', null, 'GANGCOIN_RECHARGE', '1', '2018-11-30 17:59:45', '2018-11-30 17:59:45');
INSERT INTO `orders` VALUES ('375', '87129', '2018113010299991', null, '购买测试商品2', '0.01', 'GANGCOIN', '2018-11-30 18:00:16', 'MIAOSHA', '2', '2018-11-30 18:00:15', '2018-11-30 18:00:16');
INSERT INTO `orders` VALUES ('376', '87129', '2018120353554852', null, '购买测试商品2', '0.01', 'GANGCOIN', '2018-12-03 10:39:49', 'MIAOSHA', '2', '2018-12-03 10:39:49', '2018-12-03 11:46:27');
INSERT INTO `orders` VALUES ('403', '87748', '2018122798575497', null, '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', null, 'BAONISHUO', '1', '2018-12-27 14:12:43', '2018-12-27 14:12:47');
INSERT INTO `orders` VALUES ('404', '87748', '2018122797579956', '4200000251201812278130101193', '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', '2018-12-27 14:48:36', 'BAONISHUO', '2', '2018-12-27 14:14:18', '2018-12-27 14:48:36');
INSERT INTO `orders` VALUES ('405', '87748', '2018122750481005', '4200000249201812275350837275', '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', '2018-12-27 14:56:21', 'BAONISHUO', '2', '2018-12-27 14:22:10', '2018-12-27 14:56:21');
INSERT INTO `orders` VALUES ('406', '87748', '2018122749545750', '4200000254201812275630813441', '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', '2018-12-27 15:02:31', 'BAONISHUO', '2', '2018-12-27 14:28:17', '2018-12-27 15:02:31');
INSERT INTO `orders` VALUES ('407', '87748', '2018122710252985', '4200000254201812272849570167', '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', '2018-12-27 14:48:22', 'BAONISHUO', '2', '2018-12-27 14:48:15', '2018-12-27 14:48:22');
INSERT INTO `orders` VALUES ('408', '87748', '2018122710098555', '4200000250201812272355330094', '说话给钱-你好，十二月！', '1.02', 'WECHAT_JSAPI', '2018-12-27 14:52:55', 'BAONISHUO', '2', '2018-12-27 14:52:45', '2018-12-27 14:52:55');
INSERT INTO `orders` VALUES ('409', '87748', '2018122749975151', '4200000253201812273116353035', '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', '2018-12-27 15:00:24', 'BAONISHUO', '2', '2018-12-27 15:00:17', '2018-12-27 15:00:24');
INSERT INTO `orders` VALUES ('410', '87748', '2018122797101101', '4200000247201812273435735883', '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', '2018-12-27 15:05:39', 'BAONISHUO', '2', '2018-12-27 15:05:30', '2018-12-27 15:05:39');
INSERT INTO `orders` VALUES ('411', '87748', '2018122752971001', '4200000248201812276216213071', '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', '2018-12-27 15:15:07', 'BAONISHUO', '2', '2018-12-27 15:15:00', '2018-12-27 15:15:07');
INSERT INTO `orders` VALUES ('412', '87748', '2018122753100539', null, '说话给钱-恭喜发财，大吉大利！', '1.02', null, null, 'BAONISHUO', '1', '2018-12-27 16:10:29', '2018-12-27 16:10:29');
INSERT INTO `orders` VALUES ('413', '87748', '2018122749504951', null, '说话给钱-你要是行，千一行行一行，行不行行行？', '1.02', null, null, 'BAONISHUO', '1', '2018-12-27 16:11:29', '2018-12-27 16:11:29');
INSERT INTO `orders` VALUES ('414', '87748', '2018122750974957', '4200000248201812275321232087', '说话给钱-红鲤鱼与绿鲤鱼与驴', '1.02', 'WECHAT_JSAPI', '2018-12-27 16:14:02', 'BAONISHUO', '2', '2018-12-27 16:13:54', '2018-12-27 16:14:02');
INSERT INTO `orders` VALUES ('415', '87748', '2018122750505298', '4200000252201812271024417545', '说话给钱-你好，十二月！', '1.02', 'WECHAT_JSAPI', '2018-12-27 19:07:54', 'BAONISHUO', '2', '2018-12-27 19:07:46', '2018-12-27 19:07:54');
INSERT INTO `orders` VALUES ('416', '87748', '2019010251515310', '4200000256201901028297137731', '说话给钱-红鲤鱼与绿鲤鱼与驴', '1.02', 'WECHAT_JSAPI', '2019-01-02 09:14:17', 'BAONISHUO', '2', '2019-01-02 09:14:11', '2019-01-02 09:14:17');
INSERT INTO `orders` VALUES ('420', '0', '2019010451525210', null, '说话给钱-你要是行，千一行行一行，行不行行行？', '10.20', null, null, 'BAONISHUO', '1', '2019-01-04 11:58:59', '2019-01-04 11:58:59');
INSERT INTO `orders` VALUES ('421', '0', '2019010454519855', null, '说话给钱-你要是行，千一行行一行，行不行行行？', '10.20', null, null, 'BAONISHUO', '1', '2019-01-04 11:59:02', '2019-01-04 11:59:02');
INSERT INTO `orders` VALUES ('422', '0', '2019010456519856', null, '说话给钱-你要是行，千一行行一行，行不行行行？', '10.20', null, null, 'BAONISHUO', '1', '2019-01-04 11:59:04', '2019-01-04 11:59:04');
INSERT INTO `orders` VALUES ('423', '0', '2019010456101975', null, '说话给钱-你要是行，千一行行一行，行不行行行？', '10.20', null, null, 'BAONISHUO', '1', '2019-01-04 11:59:04', '2019-01-04 11:59:04');
INSERT INTO `orders` VALUES ('424', '87748', '2019010754101975', null, '说话给钱提现', '0.30', null, null, 'BAONISHUO', '1', '2019-01-07 09:27:34', '2019-01-07 09:27:34');
INSERT INTO `orders` VALUES ('425', '92149', '2019010949575310', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 15:41:37', '2019-01-09 15:41:37');
INSERT INTO `orders` VALUES ('426', '92149', '2019010998102495', null, '购买五谷豆浆', '0.01', 'ALIPAY_APP', null, 'GROUPBUY', '1', '2019-01-09 15:41:47', '2019-01-09 15:41:48');
INSERT INTO `orders` VALUES ('427', '92149', '2019010999561005', null, '购买五谷豆浆', '0.01', 'ALIPAY_APP', null, 'GROUPBUY', '1', '2019-01-09 15:41:48', '2019-01-09 15:41:48');
INSERT INTO `orders` VALUES ('428', '92149', '2019010948101539', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 15:42:08', '2019-01-09 15:42:09');
INSERT INTO `orders` VALUES ('429', '92149', '2019010950495548', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 15:42:10', '2019-01-09 15:42:10');
INSERT INTO `orders` VALUES ('430', '92149', '2019010951575110', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 15:42:11', '2019-01-09 15:42:11');
INSERT INTO `orders` VALUES ('431', '92149', '2019010952575510', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 15:42:12', '2019-01-09 15:42:12');
INSERT INTO `orders` VALUES ('435', '92149', '2019010955515010', null, '购买营养豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 15:43:35', '2019-01-09 15:43:35');
INSERT INTO `orders` VALUES ('436', '92149', '2019010910099995', null, '购买营养豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 15:43:41', '2019-01-09 15:43:42');
INSERT INTO `orders` VALUES ('437', '92149', '2019010953981021', null, '购买营养豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 15:43:49', '2019-01-09 15:43:50');
INSERT INTO `orders` VALUES ('438', '92149', '2019010954565356', null, '购买营养豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 15:43:50', '2019-01-09 15:43:50');
INSERT INTO `orders` VALUES ('439', '92149', '2019010956535198', null, '购买营养豆浆', '0.01', 'ALIPAY_APP', null, 'GROUPBUY', '1', '2019-01-09 15:43:52', '2019-01-09 15:43:52');
INSERT INTO `orders` VALUES ('440', '87129', '2019010948555148', null, '购买营养豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:24:16', '2019-01-09 16:24:16');
INSERT INTO `orders` VALUES ('441', '87129', '2019010953544852', null, '购买营养豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:24:21', '2019-01-09 16:24:21');
INSERT INTO `orders` VALUES ('442', '87129', '2019010957575149', null, '购买营养豆浆', '0.01', 'ALIPAY_APP', null, 'GROUPBUY', '1', '2019-01-09 16:24:25', '2019-01-09 16:24:25');
INSERT INTO `orders` VALUES ('443', '87129', '2019010910210110', null, '购买香皂', '0.01', 'ALIPAY_APP', null, 'GROUPBUY', '1', '2019-01-09 16:26:39', '2019-01-09 16:26:40');
INSERT INTO `orders` VALUES ('444', '92149', '2019010998101101', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:29:31', '2019-01-09 16:29:32');
INSERT INTO `orders` VALUES ('445', '92149', '2019010910110010', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:29:34', '2019-01-09 16:29:35');
INSERT INTO `orders` VALUES ('446', '92149', '2019010948975797', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:29:36', '2019-01-09 16:29:36');
INSERT INTO `orders` VALUES ('447', '92149', '2019010949515298', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:29:37', '2019-01-09 16:29:37');
INSERT INTO `orders` VALUES ('449', '92149', '2019010949974952', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:29:37', '2019-01-09 16:29:37');
INSERT INTO `orders` VALUES ('450', '92149', '2019010949102485', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:29:37', '2019-01-09 16:29:38');
INSERT INTO `orders` VALUES ('451', '92149', '2019010950991015', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:29:38', '2019-01-09 16:29:39');
INSERT INTO `orders` VALUES ('452', '92149', '2019010950101571', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:29:38', '2019-01-09 16:29:39');
INSERT INTO `orders` VALUES ('454', '92149', '2019010953995155', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:29:41', '2019-01-09 16:29:42');
INSERT INTO `orders` VALUES ('455', '92149', '2019010954534848', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:29:42', '2019-01-09 16:29:42');
INSERT INTO `orders` VALUES ('456', '92149', '2019010956504951', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:29:44', '2019-01-09 16:29:44');
INSERT INTO `orders` VALUES ('457', '92149', '2019010956521004', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:29:44', '2019-01-09 16:29:44');
INSERT INTO `orders` VALUES ('459', '92149', '2019010956995748', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:29:44', '2019-01-09 16:29:45');
INSERT INTO `orders` VALUES ('470', '87129', '2019010910156100', null, '购买香皂', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-09 16:34:38', '2019-01-09 16:34:38');
INSERT INTO `orders` VALUES ('471', '87129', '2019010997995351', null, '购买五谷豆浆', '0.01', 'ALIPAY_APP', null, 'GROUPBUY', '1', '2019-01-09 16:40:58', '2019-01-09 16:42:17');
INSERT INTO `orders` VALUES ('472', '87129', '2019011048501015', null, '港币充值', '100.00', null, null, 'GANGCOIN_RECHARGE', '1', '2019-01-10 08:11:12', '2019-01-10 08:11:12');
INSERT INTO `orders` VALUES ('473', '87129', '2019011050971021', null, '港币充值', '100.00', null, null, 'GANGCOIN_RECHARGE', '1', '2019-01-10 08:12:50', '2019-01-10 08:12:50');
INSERT INTO `orders` VALUES ('474', '87129', '2019011054579954', null, '港币充值', '100.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-10 08:13:26', '2019-01-10 08:13:26');
INSERT INTO `orders` VALUES ('475', '87129', '2019011055971015', null, '港币充值', '50.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-10 11:49:59', '2019-01-10 11:49:59');
INSERT INTO `orders` VALUES ('476', '87129', '2019011053100484', null, '购买甜豆浆', '2.00', null, null, 'GROUPBUY', '1', '2019-01-10 12:05:25', '2019-01-10 12:05:25');
INSERT INTO `orders` VALUES ('477', '87129', '2019011010210149', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-10 12:10:07', '2019-01-10 12:10:07');
INSERT INTO `orders` VALUES ('478', '87129', '2019011055521015', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-10 14:13:11', '2019-01-10 14:13:11');
INSERT INTO `orders` VALUES ('479', '87129', '2019011097489748', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-10 14:13:14', '2019-01-10 14:13:14');
INSERT INTO `orders` VALUES ('480', '87129', '2019011051525150', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-10 14:30:11', '2019-01-10 14:30:11');
INSERT INTO `orders` VALUES ('481', '87129', '2019011010198995', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-10 14:43:42', '2019-01-10 14:43:42');
INSERT INTO `orders` VALUES ('482', '87129', '2019011010253519', null, '购买甜豆浆', '2.00', null, null, 'GROUPBUY', '1', '2019-01-10 14:45:35', '2019-01-10 14:45:35');
INSERT INTO `orders` VALUES ('483', '87129', '2019011054529753', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-10 14:49:58', '2019-01-10 14:49:58');
INSERT INTO `orders` VALUES ('484', '87129', '2019011051100575', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-10 14:53:39', '2019-01-10 14:53:39');
INSERT INTO `orders` VALUES ('485', '87129', '2019011049521025', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-10 14:54:57', 'GROUPBUY', '2', '2019-01-10 14:54:57', '2019-01-10 14:54:57');
INSERT INTO `orders` VALUES ('486', '87129', '2019011051575751', null, '购买原味豆浆', '4.00', 'GANGCOIN', '2019-01-10 14:57:55', 'GROUPBUY', '2', '2019-01-10 14:57:55', '2019-01-10 14:57:55');
INSERT INTO `orders` VALUES ('487', '87129', '2019011057509910', null, '购买原味豆浆', '4.00', 'GANGCOIN', '2019-01-10 15:00:09', 'GROUPBUY', '2', '2019-01-10 15:00:09', '2019-01-10 15:00:09');
INSERT INTO `orders` VALUES ('488', '87129', '2019011052101551', null, '购买原味豆浆', '5.00', 'GANGCOIN', '2019-01-10 15:27:49', 'GROUPBUY', '2', '2019-01-10 15:27:48', '2019-01-10 15:27:49');
INSERT INTO `orders` VALUES ('490', '92151', '2019011152995410', null, '购买五谷豆浆', '0.01', null, null, 'GROUPBUY', '1', '2019-01-11 08:44:36', '2019-01-11 08:44:36');
INSERT INTO `orders` VALUES ('493', '92149', '2019011148491029', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-11 08:56:16', 'GROUPBUY', '2', '2019-01-11 08:56:16', '2019-02-26 10:59:34');
INSERT INTO `orders` VALUES ('495', '92149', '2019011156971005', null, '购买现磨豆浆', '6.00', 'GANGCOIN', '2019-01-11 08:57:13', 'GROUPBUY', '2', '2019-01-11 08:57:12', '2019-03-13 16:49:05');
INSERT INTO `orders` VALUES ('496', '92149', '2019011152485010', null, '购买原味豆浆', '5.00', 'GANGCOIN', '2019-01-11 08:57:40', 'GROUPBUY', '2', '2019-01-11 08:57:40', '2019-03-13 17:01:02');
INSERT INTO `orders` VALUES ('497', '92149', '2019011197485749', null, '购买原味豆浆', '5.00', 'GANGCOIN', '2019-01-11 08:58:02', 'GROUPBUY', '2', '2019-01-11 08:58:02', '2019-03-13 17:01:21');
INSERT INTO `orders` VALUES ('498', '92149', '2019011149579998', null, '购买原味豆浆', '5.00', 'GANGCOIN', '2019-01-11 08:58:09', 'GROUPBUY', '2', '2019-01-11 08:58:09', '2019-01-11 08:58:09');
INSERT INTO `orders` VALUES ('499', '92149', '2019011150569855', null, '购买现磨豆浆', '5.00', 'GANGCOIN', '2019-01-11 08:58:26', 'GROUPBUY', '2', '2019-01-11 08:58:26', '2019-03-13 17:01:31');
INSERT INTO `orders` VALUES ('500', '92149', '2019011150551011', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-11 08:58:42', 'GROUPBUY', '2', '2019-01-11 08:58:42', '2019-02-27 10:18:17');
INSERT INTO `orders` VALUES ('501', '92149', '2019011156974898', null, '购买原味豆浆', '5.00', 'GANGCOIN', '2019-01-11 08:58:48', 'GROUPBUY', '2', '2019-01-11 08:58:48', '2019-03-07 14:22:31');
INSERT INTO `orders` VALUES ('503', '92149', '2019011110056101', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-11 14:11:09', 'GROUPBUY', '2', '2019-01-11 14:11:09', '2019-03-07 14:22:26');
INSERT INTO `orders` VALUES ('504', '92149', '2019011157525651', null, '购买原味豆浆', '10.00', 'GANGCOIN', '2019-01-11 14:24:41', 'GROUPBUY', '2', '2019-01-11 14:24:41', '2019-03-07 14:22:24');
INSERT INTO `orders` VALUES ('505', '92149', '2019011110055485', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-11 14:24:45', 'GROUPBUY', '2', '2019-01-11 14:24:45', '2019-03-13 16:49:00');
INSERT INTO `orders` VALUES ('506', '92151', '2019011148971021', null, '购买东北杀猪菜', '112.20', null, null, 'GROUPBUY', '1', '2019-01-11 14:26:40', '2019-01-11 14:26:40');
INSERT INTO `orders` VALUES ('507', '92151', '2019011150484948', null, '购买排骨炖豆角玉米土豆', '112.20', null, null, 'GROUPBUY', '1', '2019-01-11 14:29:22', '2019-01-11 14:29:22');
INSERT INTO `orders` VALUES ('508', '92151', '2019011197989850', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-11 14:33:15', 'GROUPBUY', '2', '2019-01-11 14:33:14', '2019-01-11 14:33:15');
INSERT INTO `orders` VALUES ('509', '92151', '2019011150531005', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-11 14:38:10', 'GROUPBUY', '2', '2019-01-11 14:38:10', '2019-01-11 14:38:10');
INSERT INTO `orders` VALUES ('510', '92151', '2019011151535010', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-11 14:41:23', 'GROUPBUY', '2', '2019-01-11 14:41:23', '2019-01-11 14:41:23');
INSERT INTO `orders` VALUES ('512', '92151', '2019011154100991', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-11 14:56:51', 'GROUPBUY', '2', '2019-01-11 14:44:06', '2019-01-11 14:56:51');
INSERT INTO `orders` VALUES ('514', '92149', '2019011148575650', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-11 15:04:48', 'GROUPBUY', '2', '2019-01-11 15:04:48', '2019-03-07 14:57:21');
INSERT INTO `orders` VALUES ('515', '92149', '2019011197555297', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-11 15:19:06', 'GROUPBUY', '2', '2019-01-11 15:19:06', '2019-03-07 14:57:18');
INSERT INTO `orders` VALUES ('516', '92149', '2019011157991009', null, '购买东北杀猪菜', '85.80', 'GANGCOIN', '2019-01-11 15:20:10', 'GROUPBUY', '2', '2019-01-11 15:20:09', '2019-03-07 14:20:47');
INSERT INTO `orders` VALUES ('517', '92149', '2019011152101101', null, '购买东北杀猪菜', '99.00', 'GANGCOIN', '2019-01-11 15:20:21', 'GROUPBUY', '2', '2019-01-11 15:20:20', '2019-01-11 15:20:21');
INSERT INTO `orders` VALUES ('518', '92151', '2019011199975054', null, '购买东北杀猪菜', '132.00', 'GANGCOIN', null, 'GROUPBUY', '1', '2019-01-11 15:21:32', '2019-01-11 15:21:32');
INSERT INTO `orders` VALUES ('519', '92151', '2019011155101515', null, '购买东北杀猪菜', '132.00', 'GANGCOIN', null, 'GROUPBUY', '1', '2019-01-11 15:21:43', '2019-01-11 15:21:44');
INSERT INTO `orders` VALUES ('520', '92151', '2019011199575654', null, '购买东北杀猪菜', '118.80', 'GANGCOIN', null, 'GROUPBUY', '1', '2019-01-11 15:28:12', '2019-01-11 15:28:12');
INSERT INTO `orders` VALUES ('521', '92151', '2019011199549810', null, '购买排骨炖豆角玉米土豆', '112.20', 'GANGCOIN', null, 'GROUPBUY', '1', '2019-01-11 15:29:32', '2019-01-11 15:29:32');
INSERT INTO `orders` VALUES ('522', '92151', '2019011157559997', null, '购买东北杀猪菜', '105.60', null, null, 'GROUPBUY', '1', '2019-01-11 15:30:33', '2019-01-11 15:30:33');
INSERT INTO `orders` VALUES ('523', '92151', '2019011199515451', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-11 15:44:28', '2019-01-11 15:44:28');
INSERT INTO `orders` VALUES ('524', '92151', '2019011197561009', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-11 15:44:42', '2019-01-11 15:44:42');
INSERT INTO `orders` VALUES ('525', '92151', '2019011110153102', null, '港币充值', '50.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-11 15:45:02', '2019-01-11 15:45:02');
INSERT INTO `orders` VALUES ('526', '92151', '2019011110250574', null, '港币充值', '50.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-11 15:45:03', '2019-01-11 15:45:03');
INSERT INTO `orders` VALUES ('527', '92151', '2019011110210010', null, '港币充值', '50.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-11 15:45:03', '2019-01-11 15:45:04');
INSERT INTO `orders` VALUES ('528', '92151', '2019011152491005', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-11 15:47:48', 'GROUPBUY', '2', '2019-01-11 15:47:48', '2019-01-11 15:47:48');
INSERT INTO `orders` VALUES ('529', '92151', '2019011110157529', null, '购买东北杀猪菜', '125.40', 'GANGCOIN', null, 'GROUPBUY', '1', '2019-01-11 15:48:14', '2019-01-11 15:48:15');
INSERT INTO `orders` VALUES ('530', '92151', '2019011110199515', null, '购买东北杀猪菜', '125.40', 'GANGCOIN', null, 'GROUPBUY', '1', '2019-01-11 15:48:14', '2019-01-11 15:48:15');
INSERT INTO `orders` VALUES ('531', '92151', '2019011110250511', null, '购买东北杀猪菜', '125.40', 'GANGCOIN', null, 'GROUPBUY', '1', '2019-01-11 15:48:15', '2019-01-11 15:48:15');
INSERT INTO `orders` VALUES ('532', '92151', '2019011110253102', null, '购买东北杀猪菜', '125.40', 'GANGCOIN', null, 'GROUPBUY', '1', '2019-01-11 15:48:15', '2019-01-11 15:48:15');
INSERT INTO `orders` VALUES ('533', '92151', '2019011153525157', null, '购买酱爆花蛤', '99.00', null, null, 'GROUPBUY', '1', '2019-01-11 15:58:13', '2019-01-11 15:58:13');
INSERT INTO `orders` VALUES ('534', '92150', '2019011551995357', null, '港币充值', '10.00', null, null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 09:20:35', '2019-01-15 09:20:35');
INSERT INTO `orders` VALUES ('535', '92150', '2019011554995656', null, '港币充值', '10.00', null, null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 09:27:18', '2019-01-15 09:27:18');
INSERT INTO `orders` VALUES ('536', '92150', '2019011597505150', null, '港币充值', '20.00', null, null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 09:45:14', '2019-01-15 09:45:14');
INSERT INTO `orders` VALUES ('537', '92150', '2019011557521015', null, '港币充值', '20.00', null, null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 09:46:33', '2019-01-15 09:46:33');
INSERT INTO `orders` VALUES ('538', '92150', '2019011510052102', null, '港币充值', '30.00', null, null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 09:47:09', '2019-01-15 09:47:09');
INSERT INTO `orders` VALUES ('539', '92149', '2019011554541004', null, '港币充值', '50.00', 'ALIPAY_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 10:47:50', '2019-01-15 10:47:50');
INSERT INTO `orders` VALUES ('540', '92149', '2019011548574899', null, '港币充值', '50.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 10:48:00', '2019-01-15 10:48:00');
INSERT INTO `orders` VALUES ('541', '92149', '2019011550101485', null, '港币充值', '50.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 10:48:02', '2019-01-15 10:48:03');
INSERT INTO `orders` VALUES ('542', '92149', '2019011552101975', null, '港币充值', '50.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 10:48:04', '2019-01-15 10:48:05');
INSERT INTO `orders` VALUES ('543', '92149', '2019011557565297', null, '港币充值', '1.00', 'ALIPAY_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 10:48:57', '2019-01-15 10:48:57');
INSERT INTO `orders` VALUES ('544', '92149', '2019011557999951', null, '港币充值', '200.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 10:50:01', '2019-01-15 10:50:02');
INSERT INTO `orders` VALUES ('545', '92149', '2019011557551029', null, '港币充值', '50.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 10:50:33', '2019-01-15 10:50:33');
INSERT INTO `orders` VALUES ('546', '92149', '2019011549575610', null, '港币充值', '50.00', 'ALIPAY_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 10:51:13', '2019-01-15 10:51:13');
INSERT INTO `orders` VALUES ('547', '92149', '2019011557101531', null, '港币充值', '50.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 10:51:21', '2019-01-15 10:51:22');
INSERT INTO `orders` VALUES ('548', '92149', '2019011549555510', null, '港币充值', '50.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 10:51:29', '2019-01-15 10:51:29');
INSERT INTO `orders` VALUES ('549', '92149', '2019011548101571', null, '港币充值', '50.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 10:52:16', '2019-01-15 10:52:17');
INSERT INTO `orders` VALUES ('550', '92149', '2019011556534854', null, '港币充值', '50.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 10:52:56', '2019-01-15 10:52:56');
INSERT INTO `orders` VALUES ('551', '92149', '2019011549101499', null, '港币充值', '50.00', 'ALIPAY_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 10:53:05', '2019-01-15 10:53:06');
INSERT INTO `orders` VALUES ('552', '92149', '2019011554505799', null, '港币充值', '0.01', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 11:01:10', '2019-01-15 11:01:10');
INSERT INTO `orders` VALUES ('553', '92149', '2019011557561015', '2019011522001456931012205847', '港币充值', '0.01', 'ALIPAY_APP', '2019-01-15 11:01:19', 'GANGCOIN_RECHARGE', '2', '2019-01-15 11:01:13', '2019-01-15 11:01:19');
INSERT INTO `orders` VALUES ('554', '92149', '2019011556495251', null, '港币充值', '0.01', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-15 11:05:28', '2019-01-15 11:05:28');
INSERT INTO `orders` VALUES ('557', '92150', '2019011597100541', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-15 15:15:22', '2019-01-15 15:15:22');
INSERT INTO `orders` VALUES ('558', '92150', '2019011598985610', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-16 09:44:32', 'GROUPBUY', '2', '2019-01-15 15:20:59', '2019-04-06 08:36:25');
INSERT INTO `orders` VALUES ('559', '92150', '2019011510155481', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-15 15:27:59', 'GROUPBUY', '2', '2019-01-15 15:27:58', '2019-01-15 15:27:59');
INSERT INTO `orders` VALUES ('560', '92150', '2019011510299102', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-15 15:37:20', 'GROUPBUY', '2', '2019-01-15 15:37:19', '2019-01-15 15:37:20');
INSERT INTO `orders` VALUES ('561', '92150', '2019011552541011', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-15 15:51:01', 'GROUPBUY', '2', '2019-01-15 15:51:00', '2019-01-15 15:51:01');
INSERT INTO `orders` VALUES ('562', '92150', '2019011599499748', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-15 16:13:00', 'GROUPBUY', '2', '2019-01-15 16:13:00', '2019-01-15 16:13:00');
INSERT INTO `orders` VALUES ('563', '92150', '2019011551995756', null, '购买黑豆豆浆', '1.00', 'GANGCOIN', '2019-01-15 17:40:20', 'GROUPBUY', '2', '2019-01-15 17:40:19', '2019-01-15 17:40:20');
INSERT INTO `orders` VALUES ('564', '92150', '2019011610052504', null, '购买甜豆浆', '2.00', 'GANGCOIN', '2019-01-16 09:02:05', 'GROUPBUY', '2', '2019-01-16 09:02:05', '2019-01-16 09:02:05');
INSERT INTO `orders` VALUES ('565', '92150', '2019011698539848', null, '购买现磨豆浆', '1.00', 'GANGCOIN', '2019-01-16 09:10:04', 'GROUPBUY', '2', '2019-01-16 09:10:03', '2019-01-16 09:10:04');
INSERT INTO `orders` VALUES ('566', '92149', '2019011697101975', null, '港币充值', '500.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-16 10:40:10', '2019-01-16 10:40:11');
INSERT INTO `orders` VALUES ('567', '92149', '2019011698571019', null, '港币充值', '500.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-16 10:40:11', '2019-01-16 10:40:11');
INSERT INTO `orders` VALUES ('568', '92149', '2019011610055554', null, '港币充值', '500.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-16 10:40:13', '2019-01-16 10:40:13');
INSERT INTO `orders` VALUES ('569', '92149', '2019011648495154', null, '港币充值', '500.00', 'ALIPAY_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-16 10:40:16', '2019-01-16 10:40:16');
INSERT INTO `orders` VALUES ('570', '0', '2019011651549853', null, '说话给钱-恭喜发财，大吉大利！', '1.02', null, null, 'BAONISHUO', '1', '2019-01-16 10:52:51', '2019-01-16 10:52:51');
INSERT INTO `orders` VALUES ('571', '0', '2019011697985552', null, '说话给钱-恭喜发财，大吉大利！', '1.02', null, null, 'BAONISHUO', '1', '2019-01-16 10:53:46', '2019-01-16 10:53:46');
INSERT INTO `orders` VALUES ('572', '0', '2019011652491024', null, '说话给钱-恭喜发财，大吉大利！', '1.02', null, null, 'BAONISHUO', '1', '2019-01-16 10:59:32', '2019-01-16 10:59:32');
INSERT INTO `orders` VALUES ('573', '92150', '2019011610053995', null, '购买永和豆浆', '1.00', 'GANGCOIN', '2019-01-16 11:21:34', 'GROUPBUY', '2', '2019-01-16 11:21:33', '2019-01-16 11:21:34');
INSERT INTO `orders` VALUES ('574', '87748', '2019011610250981', null, '说话给钱-你好，十二月！', '1.02', 'WECHAT_JSAPI', null, 'BAONISHUO', '1', '2019-01-16 11:22:55', '2019-01-16 11:22:55');
INSERT INTO `orders` VALUES ('575', '87748', '2019011699974953', null, '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', null, 'BAONISHUO', '1', '2019-01-16 11:29:16', '2019-01-16 11:29:17');
INSERT INTO `orders` VALUES ('576', '87748', '2019011699100559', null, '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', null, 'BAONISHUO', '1', '2019-01-16 11:29:48', '2019-01-16 11:29:49');
INSERT INTO `orders` VALUES ('577', '92150', '2019011654495650', null, '购买甜豆浆', '2.00', 'GANGCOIN', '2019-01-16 11:37:10', 'GROUPBUY', '2', '2019-01-16 11:37:10', '2019-01-16 11:37:10');
INSERT INTO `orders` VALUES ('578', '87748', '2019011648489750', null, '说话给钱-小小大小大大小大小大大小', '1.02', 'WECHAT_JSAPI', null, 'BAONISHUO', '1', '2019-01-16 11:47:28', '2019-01-16 11:47:28');
INSERT INTO `orders` VALUES ('579', '87748', '2019011698495410', null, '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', null, 'BAONISHUO', '1', '2019-01-16 11:49:47', '2019-01-16 11:49:47');
INSERT INTO `orders` VALUES ('580', '92150', '2019011655539854', null, '购买黑豆豆浆', '1.00', 'GANGCOIN', '2019-01-16 12:57:59', 'GROUPBUY', '2', '2019-01-16 12:57:59', '2019-01-16 12:57:59');
INSERT INTO `orders` VALUES ('581', '87748', '2019011648995510', null, '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', null, 'BAONISHUO', '1', '2019-01-16 13:53:04', '2019-01-16 13:53:05');
INSERT INTO `orders` VALUES ('582', '87748', '2019011649515151', null, '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', null, 'BAONISHUO', '1', '2019-01-16 14:04:01', '2019-01-16 14:04:01');
INSERT INTO `orders` VALUES ('583', '87748', '2019011655531015', null, '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', null, 'BAONISHUO', '1', '2019-01-16 14:32:55', '2019-01-16 14:32:55');
INSERT INTO `orders` VALUES ('584', '87748', '2019011654975657', '4200000248201901162867779738', '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', '2019-01-16 15:02:53', 'BAONISHUO', '2', '2019-01-16 15:02:46', '2019-01-16 15:02:53');
INSERT INTO `orders` VALUES ('585', '87748', '2019011610249504', null, '说话给钱提现', '0.30', null, null, 'BAONISHUO', '1', '2019-01-16 15:09:35', '2019-01-16 15:09:35');
INSERT INTO `orders` VALUES ('586', '45749', '2019011653551025', '4200000253201901168357681045', '说话给钱-你好，十二月！', '1.02', 'WECHAT_JSAPI', '2019-01-16 17:21:23', 'BAONISHUO', '2', '2019-01-16 17:21:09', '2019-01-16 17:21:23');
INSERT INTO `orders` VALUES ('587', '37414', '2019011853509753', null, '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', null, 'BAONISHUO', '1', '2019-01-18 08:09:57', '2019-01-18 08:09:57');
INSERT INTO `orders` VALUES ('588', '87748', '2019011848565350', '4200000247201901188784193845', '说话给钱-恭喜发财，大吉大利！', '10.20', 'WECHAT_JSAPI', '2019-01-18 10:53:27', 'BAONISHUO', '2', '2019-01-18 10:53:20', '2019-01-18 10:53:27');
INSERT INTO `orders` VALUES ('589', '87748', '2019011857481001', '4200000257201901189625210829', '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', '2019-01-18 11:06:39', 'BAONISHUO', '2', '2019-01-18 11:06:33', '2019-01-18 11:06:39');
INSERT INTO `orders` VALUES ('590', '87748', '2019011850975150', '4200000245201901187976838194', '说话给钱-恭喜发财，大吉大利！', '5.10', 'WECHAT_JSAPI', '2019-01-18 11:10:33', 'BAONISHUO', '2', '2019-01-18 11:10:26', '2019-01-18 11:10:33');
INSERT INTO `orders` VALUES ('591', '72049', '2019011898575097', '4200000255201901182611724547', '说话给钱-小小大小大大小大小大大小', '1.02', 'WECHAT_JSAPI', '2019-01-18 11:13:04', 'BAONISHUO', '2', '2019-01-18 11:12:59', '2019-01-18 11:13:04');
INSERT INTO `orders` VALUES ('600', '92150', '2019011851519850', null, '购买秒杀春节大礼包', '1.00', null, null, 'MIAOSHA', '1', '2019-01-18 17:00:03', '2019-01-18 17:00:03');
INSERT INTO `orders` VALUES ('601', '92150', '2019011810297525', null, '购买秒杀春节大礼包', '1.00', null, null, 'MIAOSHA', '1', '2019-01-18 17:03:27', '2019-01-18 17:03:27');
INSERT INTO `orders` VALUES ('602', '92150', '2019011850995350', null, '购买秒杀春节大礼包', '1.00', null, null, 'MIAOSHA', '1', '2019-01-18 17:07:46', '2019-01-18 17:07:46');
INSERT INTO `orders` VALUES ('603', '92150', '2019011810053515', null, '购买秒杀春节大礼包', '1.00', null, null, 'MIAOSHA', '1', '2019-01-18 17:10:05', '2019-01-18 17:10:05');
INSERT INTO `orders` VALUES ('604', '92150', '2019011849501004', null, '购买秒杀春节大礼包', '1.00', null, null, 'MIAOSHA', '1', '2019-01-18 17:10:25', '2019-01-18 17:10:25');
INSERT INTO `orders` VALUES ('605', '92150', '2019011853484910', null, '购买秒杀春节大礼包', '1.00', null, null, 'MIAOSHA', '1', '2019-01-18 17:23:17', '2019-01-18 17:23:17');
INSERT INTO `orders` VALUES ('606', '3944', '2019011997545351', '4200000258201901198730170832', '说话给钱-你好，十二月！', '2.04', 'WECHAT_JSAPI', '2019-01-19 20:10:11', 'BAONISHUO', '2', '2019-01-19 20:10:02', '2019-01-19 20:10:11');
INSERT INTO `orders` VALUES ('607', '3944', '2019011953485051', null, '说话给钱提现', '0.30', null, null, 'BAONISHUO', '1', '2019-01-19 22:32:37', '2019-01-19 22:32:37');
INSERT INTO `orders` VALUES ('608', '92150', '2019012110198100', null, '购买原味豆浆', '1.00', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2019-01-21 12:04:30', '2019-01-21 12:04:32');
INSERT INTO `orders` VALUES ('609', '92150', '2019012150984851', null, '购买原味豆浆', '1.00', 'ALIPAY_PAGE', null, 'GROUPBUY', '1', '2019-01-21 12:04:50', '2019-01-21 12:04:51');
INSERT INTO `orders` VALUES ('610', '92150', '2019012110152100', null, '购买原味豆浆', '1.00', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2019-01-21 12:05:02', '2019-01-21 12:05:03');
INSERT INTO `orders` VALUES ('611', '92150', '2019012157484997', null, '购买原味豆浆', '1.00', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2019-01-21 12:05:29', '2019-01-21 12:05:30');
INSERT INTO `orders` VALUES ('612', '92150', '2019012156545555', null, '购买原味豆浆', '1.00', 'ALIPAY_PAGE', null, 'GROUPBUY', '1', '2019-01-21 12:06:32', '2019-01-21 13:26:11');
INSERT INTO `orders` VALUES ('613', '92150', '2019012151564951', null, '购买原味豆浆', '1.00', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2019-01-21 12:06:43', '2019-01-21 12:06:45');
INSERT INTO `orders` VALUES ('614', '92150', '2019012148534810', null, '购买原味豆浆', '1.00', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2019-01-21 12:09:36', '2019-01-21 13:25:54');
INSERT INTO `orders` VALUES ('615', '92150', '2019012199515610', null, '购买原味豆浆', '1.00', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-01-21 12:09:48', '2019-01-21 13:26:53');
INSERT INTO `orders` VALUES ('616', '92150', '2019012154565256', null, '购买现磨豆浆', '1.00', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-01-21 13:20:38', '2019-01-21 13:26:26');
INSERT INTO `orders` VALUES ('617', '92150', '2019012148102505', null, '购买现磨豆浆', '1.00', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-01-21 13:20:48', '2019-01-21 13:26:31');
INSERT INTO `orders` VALUES ('618', '92150', '2019012148995410', null, '购买甜豆浆', '2.00', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-01-21 13:22:56', '2019-01-21 13:26:35');
INSERT INTO `orders` VALUES ('619', '92150', '2019012152531005', null, '购买甜豆浆', '2.00', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-01-21 13:23:32', '2019-01-21 13:26:42');
INSERT INTO `orders` VALUES ('620', '92150', '2019012197495157', null, '购买甜豆浆', '2.00', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-01-21 13:24:10', '2019-01-21 13:26:46');
INSERT INTO `orders` VALUES ('621', '92150', '2019012149575555', null, '购买黑豆豆浆', '1.00', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-01-21 13:27:13', '2019-01-21 13:27:13');
INSERT INTO `orders` VALUES ('622', '92150', '2019012110257511', null, '购买黑豆豆浆', '1.00', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-01-21 13:43:27', '2019-01-21 13:43:28');
INSERT INTO `orders` VALUES ('623', '92150', '2019012110098561', null, '购买黑豆豆浆', '1.00', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-01-21 13:43:41', '2019-01-21 13:43:42');
INSERT INTO `orders` VALUES ('624', '92150', '2019012149525457', null, '购买黑豆豆浆', '1.00', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-01-21 13:43:45', '2019-01-21 13:43:45');
INSERT INTO `orders` VALUES ('625', '92150', '2019012150555099', '2019012122001419101021103837', '购买香皂', '0.01', 'ALIPAY_WAP', '2019-01-21 13:46:28', 'GROUPBUY', '2', '2019-01-21 13:46:10', '2019-01-21 13:46:28');
INSERT INTO `orders` VALUES ('626', '92150', '2019012151509954', null, '购买香皂', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-01-21 13:47:15', '2019-01-21 13:47:15');
INSERT INTO `orders` VALUES ('628', '92150', '2019012153995554', '4200000247201901210060750571', '购买五谷豆浆', '0.01', 'WECHAT_NATIVE', '2019-01-21 13:49:37', 'GROUPBUY', '2', '2019-01-21 13:49:09', '2019-01-21 13:49:37');
INSERT INTO `orders` VALUES ('629', '92150', '2019012148525456', '2019012122001419101021375372', '购买鲜花', '0.01', 'ALIPAY_PAGE', '2019-01-21 13:50:29', 'GROUPBUY', '2', '2019-01-21 13:50:08', '2019-01-21 13:50:29');
INSERT INTO `orders` VALUES ('630', '3944', '2019012156579855', null, '购买香皂', '0.01', 'GANGCOIN', '2019-01-21 16:06:01', 'GROUPBUY', '2', '2019-01-21 16:06:00', '2019-03-14 09:59:28');
INSERT INTO `orders` VALUES ('631', '3944', '2019012110150995', null, '港币充值', '50.00', 'ALIPAY_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-21 16:06:22', '2019-01-21 16:06:22');
INSERT INTO `orders` VALUES ('632', '37269', '2019012150534855', null, '购买原味豆浆', '2.00', 'GANGCOIN', '2019-01-21 16:20:02', 'GROUPBUY', '2', '2019-01-21 16:20:02', '2019-01-24 18:59:40');
INSERT INTO `orders` VALUES ('633', '35186', '2019012110248489', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-21 16:21:03', 'GROUPBUY', '2', '2019-01-21 16:21:03', '2019-01-21 16:22:38');
INSERT INTO `orders` VALUES ('634', '35186', '2019012154519910', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-21 16:23:50', 'GROUPBUY', '2', '2019-01-21 16:23:50', '2019-03-14 11:39:28');
INSERT INTO `orders` VALUES ('635', '35186', '2019012110250975', null, '购买甜豆浆', '2.00', null, null, 'GROUPBUY', '1', '2019-01-21 16:31:11', '2019-01-21 16:31:11');
INSERT INTO `orders` VALUES ('636', '35186', '2019012150535410', null, '购买原味豆浆', '1.00', 'GANGCOIN', '2019-01-21 16:32:02', 'GROUPBUY', '2', '2019-01-21 16:32:02', '2019-03-14 11:39:11');
INSERT INTO `orders` VALUES ('637', '35186', '2019012197974999', null, '购买原味豆浆', '1.00', 'GANGCOIN', null, 'GROUPBUY', '1', '2019-01-21 16:32:10', '2019-01-21 16:32:10');
INSERT INTO `orders` VALUES ('638', '35186', '2019012199100975', null, '购买原味豆浆', '1.00', 'GANGCOIN', null, 'GROUPBUY', '1', '2019-01-21 16:32:12', '2019-01-21 16:32:13');
INSERT INTO `orders` VALUES ('639', '35186', '2019012110150551', null, '购买原味豆浆', '1.00', 'GANGCOIN', null, 'GROUPBUY', '1', '2019-01-21 16:32:14', '2019-01-21 16:32:14');
INSERT INTO `orders` VALUES ('640', '35186', '2019012150551014', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-21 16:32:18', '2019-01-21 16:32:18');
INSERT INTO `orders` VALUES ('644', '43714', '2019012152511009', null, '港币充值', '50.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-21 16:47:00', '2019-01-21 16:47:00');
INSERT INTO `orders` VALUES ('650', '87713', '2019012153499752', null, '港币充值', '50.00', 'WECHAT_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-21 16:48:21', '2019-01-21 16:48:21');
INSERT INTO `orders` VALUES ('656', '87713', '2019012149494999', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-21 17:11:13', '2019-01-21 17:11:13');
INSERT INTO `orders` VALUES ('657', '87713', '2019012110152555', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-21 17:13:34', '2019-01-21 17:13:34');
INSERT INTO `orders` VALUES ('660', '92150', '2019012110150979', null, '购买洗发水', '0.01', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-01-21 17:30:06', '2019-01-21 17:30:07');
INSERT INTO `orders` VALUES ('661', '92150', '2019012151975553', null, '购买洗发水', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-01-21 17:30:27', '2019-01-21 17:30:28');
INSERT INTO `orders` VALUES ('662', '92152', '2019012156102504', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-21 17:30:48', '2019-01-21 17:30:48');
INSERT INTO `orders` VALUES ('663', '92150', '2019012152491004', null, '购买洗发水', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-01-21 17:31:00', '2019-01-21 17:31:01');
INSERT INTO `orders` VALUES ('664', '92152', '2019012152985649', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-21 17:35:48', '2019-01-21 17:35:48');
INSERT INTO `orders` VALUES ('665', '92152', '2019012199100485', null, '购买酱爆花蛤', '6.60', null, null, 'GROUPBUY', '1', '2019-01-21 17:37:00', '2019-01-21 17:37:00');
INSERT INTO `orders` VALUES ('666', '92152', '2019012152549898', null, '购买酱爆花蛤', '6.60', null, null, 'GROUPBUY', '1', '2019-01-21 17:37:08', '2019-01-21 17:37:08');
INSERT INTO `orders` VALUES ('667', '92152', '2019012150555548', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-21 17:43:46', '2019-01-21 17:43:46');
INSERT INTO `orders` VALUES ('668', '92152', '2019012154531011', null, '购买原味豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-21 17:43:50', '2019-01-21 17:43:50');
INSERT INTO `orders` VALUES ('669', '43714', '2019012156100495', null, '购买现磨豆浆', '1.00', null, null, 'GROUPBUY', '1', '2019-01-21 17:57:12', '2019-01-21 17:57:12');
INSERT INTO `orders` VALUES ('670', '87748', '2019012110098515', '4200000239201901219023477376', '说话给钱-你好，十二月！', '1.02', 'WECHAT_JSAPI', '2019-01-21 18:40:20', 'BAONISHUO', '2', '2019-01-21 18:40:13', '2019-01-21 18:40:20');
INSERT INTO `orders` VALUES ('671', '3944', '2019012110297551', '4200000241201901212139240470', '说话给钱-红鲤鱼与绿鲤鱼与驴', '2.04', 'WECHAT_JSAPI', '2019-01-21 19:00:06', 'BAONISHUO', '2', '2019-01-21 18:59:59', '2019-01-21 19:00:06');
INSERT INTO `orders` VALUES ('672', '92149', '2019012110057991', '4200000244201901214735281392', '说话给钱-恭喜发财，大吉大利！', '1.02', 'WECHAT_JSAPI', '2019-01-21 19:13:40', 'BAONISHUO', '2', '2019-01-21 19:13:33', '2019-01-21 19:13:40');
INSERT INTO `orders` VALUES ('673', '87748', '2019012153511025', '4200000256201901217972198220', '说话给钱-牛郎年年恋刘娘', '1.02', 'WECHAT_JSAPI', '2019-01-21 19:33:16', 'BAONISHUO', '2', '2019-01-21 19:33:09', '2019-01-21 19:33:16');
INSERT INTO `orders` VALUES ('674', '87129', '2019012148539948', '4200000258201901210382608944', '说话给钱-红鲤鱼与绿鲤鱼与驴', '1.02', 'WECHAT_JSAPI', '2019-01-21 19:52:24', 'BAONISHUO', '2', '2019-01-21 19:52:16', '2019-01-21 19:52:24');
INSERT INTO `orders` VALUES ('675', '92150', '2019012210210010', null, '港币充值', '50.00', 'WECHAT_JSAPI', null, 'GANGCOIN_RECHARGE', '1', '2019-01-22 07:44:31', '2019-01-22 07:44:32');
INSERT INTO `orders` VALUES ('676', '92150', '2019012248545610', null, '港币充值', '50.00', 'ALIPAY_WAP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-22 07:44:48', '2019-01-22 07:44:49');
INSERT INTO `orders` VALUES ('677', '92150', '2019012254534956', null, '港币充值', '50.00', 'WECHAT_JSAPI', null, 'GANGCOIN_RECHARGE', '1', '2019-01-22 08:07:02', '2019-01-22 08:07:03');
INSERT INTO `orders` VALUES ('678', '92150', '2019012299545651', null, '港币充值', '50.00', 'ALIPAY_WAP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-22 08:07:40', '2019-01-22 08:07:41');
INSERT INTO `orders` VALUES ('679', '92150', '2019012255102489', null, '港币充值', '50.00', 'WECHAT_JSAPI', null, 'GANGCOIN_RECHARGE', '1', '2019-01-22 08:13:27', '2019-01-22 08:13:28');
INSERT INTO `orders` VALUES ('680', '92150', '2019012254515099', null, '港币充值', '50.00', 'ALIPAY_WAP', null, 'GANGCOIN_RECHARGE', '1', '2019-01-22 09:12:22', '2019-01-22 09:12:26');
INSERT INTO `orders` VALUES ('681', '92150', '2019012251495656', null, '港币充值', '50.00', 'WECHAT_JSAPI', null, 'GANGCOIN_RECHARGE', '1', '2019-01-22 09:12:35', '2019-01-22 09:12:36');
INSERT INTO `orders` VALUES ('682', '92150', '2019012254574810', null, '港币充值', '50.00', 'WECHAT_JSAPI', null, 'GANGCOIN_RECHARGE', '1', '2019-01-22 09:12:54', '2019-01-22 09:12:55');
INSERT INTO `orders` VALUES ('683', '87748', '2019012254515356', '4200000240201901229073646872', '说话给钱-红鲤鱼与绿鲤鱼与驴', '1.02', 'WECHAT_JSAPI', '2019-01-22 18:23:24', 'BAONISHUO', '2', '2019-01-22 18:23:18', '2019-01-22 18:23:24');
INSERT INTO `orders` VALUES ('684', '87129', '2019012357531025', null, '购买老坛酸菜牛肉面', '24.00', 'GANGCOIN', '2019-01-23 10:07:37', 'GROUPBUY', '2', '2019-01-23 10:07:37', '2019-01-23 10:07:37');
INSERT INTO `orders` VALUES ('685', '87129', '2019012310156971', null, '购买甜豆浆', '4.00', 'GANGCOIN', '2019-01-23 11:43:58', 'GROUPBUY', '2', '2019-01-23 11:43:58', '2019-01-23 11:43:58');
INSERT INTO `orders` VALUES ('686', '87129', '2019012497509999', null, '购买五谷豆浆', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-01-24 09:48:10', '2019-01-24 09:48:10');
INSERT INTO `orders` VALUES ('687', '92150', '2019012451535448', '4200000260201901248367401817', '购买五谷豆浆', '0.01', 'WECHAT_JSAPI', '2019-01-24 09:50:24', 'GROUPBUY', '2', '2019-01-24 09:50:11', '2019-01-24 09:50:24');
INSERT INTO `orders` VALUES ('688', '92150', '2019012448485351', null, '购买洗发水', '0.01', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-01-24 09:50:56', '2019-01-24 09:50:56');
INSERT INTO `orders` VALUES ('689', '92150', '2019012457565110', null, '购买洗发水', '0.01', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-01-24 09:51:05', '2019-01-24 09:51:05');
INSERT INTO `orders` VALUES ('690', '92150', '2019012498565756', null, '购买洗发水', '0.01', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-01-24 09:51:23', '2019-01-24 09:51:23');
INSERT INTO `orders` VALUES ('691', '92150', '2019012497501025', null, '购买五谷豆浆', '0.01', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-01-24 10:05:14', '2019-01-24 13:15:21');
INSERT INTO `orders` VALUES ('692', '92150', '2019012451539756', null, '购买五谷豆浆', '0.01', null, null, 'GROUPBUY', '1', '2019-01-24 10:05:23', '2019-01-24 10:05:23');
INSERT INTO `orders` VALUES ('693', '92150', '2019012452995456', null, '购买五谷豆浆', '0.01', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-01-24 10:05:24', '2019-01-24 13:15:13');
INSERT INTO `orders` VALUES ('694', '92150', '2019012498100531', '2019012422001419101021982383', '购买五谷豆浆', '0.01', 'ALIPAY_WAP', '2019-01-24 10:30:34', 'GROUPBUY', '2', '2019-01-24 10:05:31', '2019-01-24 10:30:34');
INSERT INTO `orders` VALUES ('695', '87129', '2019012453100101', null, '购买牛排套餐', '0.01', 'GANGCOIN', '2019-01-24 10:30:30', 'GROUPBUY', '2', '2019-01-24 10:30:29', '2019-01-24 10:30:30');
INSERT INTO `orders` VALUES ('699', '92150', '2019012452559710', null, '购买老坛酸菜牛肉面', '24.00', 'GANGCOIN', '2019-01-24 10:45:08', 'GROUPBUY', '2', '2019-01-24 10:45:08', '2019-01-24 10:45:08');
INSERT INTO `orders` VALUES ('722', '92150', '2019012452975348', null, '购买香皂', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-01-24 13:27:32', '2019-02-15 16:23:37');
INSERT INTO `orders` VALUES ('723', '87129', '2019012455101975', null, '购买牛排套餐', '0.01', 'GANGCOIN', '2019-01-24 14:05:28', 'GROUPBUY', '2', '2019-01-24 14:05:27', '2019-01-24 14:05:28');
INSERT INTO `orders` VALUES ('724', '87129', '2019012454101991', '2019012422001451701022702682', '购买牛排套餐', '0.01', 'ALIPAY_APP', '2019-01-24 14:06:09', 'GROUPBUY', '2', '2019-01-24 14:05:58', '2019-01-24 14:06:09');
INSERT INTO `orders` VALUES ('725', '92150', '2019012556485156', '4200000287201901255059221862', '购买五谷豆浆', '0.01', 'WECHAT_JSAPI', '2019-01-25 09:37:52', 'GROUPBUY', '2', '2019-01-25 09:37:44', '2019-01-25 09:37:52');
INSERT INTO `orders` VALUES ('726', '92150', '2019012556505056', null, '购买老坛酸菜牛肉面', '24.00', 'GANGCOIN', '2019-01-25 09:39:52', 'GROUPBUY', '2', '2019-01-25 09:39:52', '2019-01-25 09:39:52');
INSERT INTO `orders` VALUES ('727', '92150', '2019012555555450', null, '购买老坛酸菜牛肉面', '24.00', 'GANGCOIN', '2019-01-25 09:40:07', 'GROUPBUY', '2', '2019-01-25 09:40:07', '2019-01-25 09:40:07');
INSERT INTO `orders` VALUES ('728', '92150', '2019012552101565', null, '购买老坛酸菜牛肉面', '24.00', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-01-25 09:54:12', '2019-02-15 16:22:34');
INSERT INTO `orders` VALUES ('735', '87129', '2019012557491009', null, '购买测试数据，请勿购买', '0.01', 'GANGCOIN', '2019-01-25 19:24:57', 'MIAOSHA', '2', '2019-01-25 19:24:57', '2019-01-25 19:24:57');
INSERT INTO `orders` VALUES ('736', '87748', '2019012710155494', null, '说话给钱提现', '10.00', null, null, 'BAONISHUO', '1', '2019-01-27 09:37:18', '2019-01-27 09:37:18');
INSERT INTO `orders` VALUES ('737', '87748', '2019013052991005', null, '港币充值', '50.00', 'WECHAT_JSAPI', null, 'GANGCOIN_RECHARGE', '1', '2019-01-30 14:22:44', '2019-01-30 14:22:55');
INSERT INTO `orders` VALUES ('739', '123', '2019021599971004', null, '购买牛排套餐', '0.01', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-02-15 10:53:48', '2019-02-15 10:53:49');
INSERT INTO `orders` VALUES ('741', '123', '2019021556555556', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-02-15 16:14:32', '2019-02-15 16:14:32');
INSERT INTO `orders` VALUES ('742', '123', '2019021555519748', null, '购买牛排套餐', '0.01', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-02-15 16:15:35', '2019-02-15 16:15:35');
INSERT INTO `orders` VALUES ('743', '123', '2019021553524810', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-02-15 16:20:53', '2019-02-15 16:20:53');
INSERT INTO `orders` VALUES ('744', '92150', '2019021510153971', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-02-15 16:24:30', '2019-02-15 16:27:15');
INSERT INTO `orders` VALUES ('745', '92150', '2019021510251524', null, '购买鲜花', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-02-15 16:27:59', '2019-02-15 16:29:47');
INSERT INTO `orders` VALUES ('746', '123', '2019021553521001', null, '购买牛排套餐', '0.01', 'WECHAT_NATIVE', null, 'GROUPBUY', '1', '2019-02-15 16:32:37', '2019-02-15 16:32:37');
INSERT INTO `orders` VALUES ('747', '123', '2019021510110199', null, '购买牛排套餐', '0.01', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-02-15 16:39:10', '2019-02-15 16:39:11');
INSERT INTO `orders` VALUES ('748', '123', '2019021554494956', null, '购买牛排套餐', '0.01', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-02-15 16:40:06', '2019-02-15 16:40:06');
INSERT INTO `orders` VALUES ('750', '41331', '2019021597531019', '2019021522001444221018407805', '购买香皂', '0.01', 'ALIPAY_WAP', '2019-02-15 17:12:19', 'GROUPBUY', '2', '2019-02-15 17:11:54', '2019-03-14 12:14:28');
INSERT INTO `orders` VALUES ('751', '123', '2019021510298565', '2019021522001422261018522049', '购买牛排套餐', '0.01', 'ALIPAY_WAP', '2019-02-15 17:16:44', 'GROUPBUY', '2', '2019-02-15 17:16:31', '2019-02-15 17:50:35');
INSERT INTO `orders` VALUES ('753', '92150', '2019021549994955', null, '购买洗发水', '0.01', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-02-15 17:24:33', '2019-02-15 17:24:34');
INSERT INTO `orders` VALUES ('754', '92150', '2019021598511021', null, '购买洗发水', '0.01', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-02-15 17:24:59', '2019-02-15 17:24:59');
INSERT INTO `orders` VALUES ('755', '123', '2019021551495357', '2019021522001422261018496830', '购买牛排套餐', '0.01', 'ALIPAY_WAP', '2019-02-15 17:46:31', 'GROUPBUY', '2', '2019-02-15 17:45:55', '2019-02-15 17:50:20');
INSERT INTO `orders` VALUES ('756', '92149', '2019021849549899', null, '购买甜豆浆', '2.00', 'GANGCOIN', '2019-02-18 08:03:45', 'GROUPBUY', '2', '2019-02-18 08:03:45', '2019-02-18 08:03:45');
INSERT INTO `orders` VALUES ('757', '123', '2019021848519953', null, '购买秒杀春节大礼包', '1.00', 'GANGCOIN', '2019-02-18 11:56:03', 'MIAOSHA', '2', '2019-02-18 11:54:56', '2019-02-18 11:56:03');
INSERT INTO `orders` VALUES ('758', '37269', '2019021850100524', null, '港币充值', '50.00', 'ALIPAY_APP', null, 'GANGCOIN_RECHARGE', '1', '2019-02-18 15:33:38', '2019-02-18 15:33:39');
INSERT INTO `orders` VALUES ('759', '92149', '2019021953565199', null, '购买测试数据，请勿购买', '0.01', 'GANGCOIN', '2019-02-19 11:59:49', 'MIAOSHA', '2', '2019-02-19 11:59:49', '2019-02-19 11:59:49');
INSERT INTO `orders` VALUES ('760', '123', '2019021954571005', null, '购买测试数据，请勿购买', '0.01', 'GANGCOIN', '2019-02-19 12:00:54', 'MIAOSHA', '2', '2019-02-19 12:00:54', '2019-02-19 12:00:54');
INSERT INTO `orders` VALUES ('761', '123', '2019021910210048', null, '购买测试数据，请勿购买', '0.01', 'GANGCOIN', '2019-02-19 14:17:59', 'MIAOSHA', '2', '2019-02-19 14:11:27', '2019-02-19 14:17:59');
INSERT INTO `orders` VALUES ('762', '123', '2019021950984810', null, '购买测试数据，请勿购买', '0.01', 'GANGCOIN', '2019-02-19 15:31:51', 'MIAOSHA', '2', '2019-02-19 15:31:30', '2019-02-19 15:31:51');
INSERT INTO `orders` VALUES ('763', '92149', '2019021957515110', null, '购买排骨炖豆角玉米土豆', '6.60', null, null, 'MIAOSHA', '1', '2019-02-19 15:36:41', '2019-02-19 15:36:41');
INSERT INTO `orders` VALUES ('764', '92149', '2019021950101999', null, '购买排骨炖豆角玉米土豆', '6.60', 'GANGCOIN', '2019-02-19 15:43:15', 'MIAOSHA', '2', '2019-02-19 15:43:14', '2019-02-19 15:43:15');
INSERT INTO `orders` VALUES ('765', '92149', '2019021949511005', null, '购买测试商品1', '0.01', 'GANGCOIN', '2019-02-19 15:44:49', 'MIAOSHA', '2', '2019-02-19 15:44:49', '2019-02-19 15:44:49');
INSERT INTO `orders` VALUES ('766', '92149', '2019021910110110', null, '购买测试数据，请勿购买', '0.01', 'GANGCOIN', '2019-02-19 15:45:35', 'MIAOSHA', '2', '2019-02-19 15:45:34', '2019-02-19 15:45:35');
INSERT INTO `orders` VALUES ('767', '92149', '2019021999525597', null, '购买测试商品3', '0.01', 'GANGCOIN', '2019-02-19 15:47:08', 'MIAOSHA', '2', '2019-02-19 15:47:08', '2019-02-19 15:47:08');
INSERT INTO `orders` VALUES ('768', '92149', '2019021950549810', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-19 15:49:54', 'MIAOSHA', '2', '2019-02-19 15:49:54', '2019-02-19 15:49:54');
INSERT INTO `orders` VALUES ('769', '92149', '2019021910248971', null, '购买东北杀猪菜', '6.60', 'GANGCOIN', '2019-02-19 16:10:55', 'MIAOSHA', '2', '2019-02-19 16:10:55', '2019-02-19 16:10:55');
INSERT INTO `orders` VALUES ('770', '92149', '2019021950101555', null, '购买东北杀猪菜', '6.60', 'GANGCOIN', '2019-02-19 16:18:43', 'MIAOSHA', '2', '2019-02-19 16:18:42', '2019-02-19 16:18:43');
INSERT INTO `orders` VALUES ('771', '92149', '2019021956541009', null, '购买东北杀猪菜', '6.60', 'GANGCOIN', '2019-02-19 16:19:52', 'MIAOSHA', '2', '2019-02-19 16:19:52', '2019-02-19 16:19:52');
INSERT INTO `orders` VALUES ('772', '92149', '2019021957975155', null, '购买东北杀猪菜', '6.60', 'GANGCOIN', '2019-02-19 16:21:45', 'MIAOSHA', '2', '2019-02-19 16:21:45', '2019-02-19 16:21:45');
INSERT INTO `orders` VALUES ('773', '92149', '2019021910053484', null, '购买东北杀猪菜', '6.60', 'GANGCOIN', '2019-02-19 16:26:53', 'MIAOSHA', '2', '2019-02-19 16:26:53', '2019-02-19 16:26:53');
INSERT INTO `orders` VALUES ('774', '92149', '2019021999515310', null, '购买东北杀猪菜', '6.60', 'GANGCOIN', '2019-02-19 16:27:08', 'MIAOSHA', '2', '2019-02-19 16:27:08', '2019-02-19 16:27:08');
INSERT INTO `orders` VALUES ('775', '92149', '2019021955515097', null, '购买排骨炖豆角玉米土豆', '6.60', 'GANGCOIN', '2019-02-19 16:35:35', 'MIAOSHA', '2', '2019-02-19 16:35:35', '2019-02-19 16:35:35');
INSERT INTO `orders` VALUES ('776', '92149', '2019021948484810', null, '购买测试商品3', '0.01', 'GANGCOIN', '2019-02-19 16:57:20', 'MIAOSHA', '2', '2019-02-19 16:57:20', '2019-02-19 16:57:20');
INSERT INTO `orders` VALUES ('777', '92149', '2019021955999948', null, '购买东北杀猪菜', '6.60', 'GANGCOIN', '2019-02-19 16:58:16', 'MIAOSHA', '2', '2019-02-19 16:58:15', '2019-02-19 16:58:16');
INSERT INTO `orders` VALUES ('778', '92149', '2019021954495255', null, '购买排骨炖豆角玉米土豆', '6.60', 'GANGCOIN', '2019-02-19 16:59:18', 'MIAOSHA', '2', '2019-02-19 16:59:18', '2019-02-19 16:59:18');
INSERT INTO `orders` VALUES ('779', '92149', '2019021910157102', null, '购买测试数据，请勿购买', '0.01', 'GANGCOIN', '2019-02-19 16:59:42', 'MIAOSHA', '2', '2019-02-19 16:59:42', '2019-02-19 16:59:42');
INSERT INTO `orders` VALUES ('780', '92149', '2019021955981001', null, '购买排骨炖豆角玉米土豆', '6.60', 'GANGCOIN', '2019-02-19 17:04:08', 'MIAOSHA', '2', '2019-02-19 17:04:07', '2019-02-19 17:04:08');
INSERT INTO `orders` VALUES ('781', '92149', '2019021951551014', null, '购买东北杀猪菜', '6.60', 'GANGCOIN', '2019-02-19 17:10:11', 'MIAOSHA', '2', '2019-02-19 17:10:11', '2019-02-19 17:10:11');
INSERT INTO `orders` VALUES ('782', '92149', '2019021998995110', null, '购买排骨炖豆角玉米土豆', '6.60', 'GANGCOIN', '2019-02-19 17:10:20', 'MIAOSHA', '2', '2019-02-19 17:10:19', '2019-02-19 17:10:20');
INSERT INTO `orders` VALUES ('783', '92149', '2019021910098521', null, '购买排骨炖豆角玉米土豆', '6.60', 'GANGCOIN', '2019-02-19 17:13:18', 'MIAOSHA', '2', '2019-02-19 17:13:17', '2019-02-19 17:13:18');
INSERT INTO `orders` VALUES ('784', '92149', '2019021910154535', null, '购买排骨炖豆角玉米土豆', '6.60', 'GANGCOIN', '2019-02-19 17:13:18', 'MIAOSHA', '2', '2019-02-19 17:13:18', '2019-02-19 17:13:18');
INSERT INTO `orders` VALUES ('785', '92149', '2019021952561005', null, '购买排骨炖豆角玉米土豆', '6.60', 'GANGCOIN', '2019-02-19 17:14:28', 'MIAOSHA', '2', '2019-02-19 17:14:28', '2019-02-19 17:14:28');
INSERT INTO `orders` VALUES ('786', '92149', '2019021954100100', null, '购买排骨炖豆角玉米土豆', '6.60', 'GANGCOIN', '2019-02-19 17:24:23', 'MIAOSHA', '2', '2019-02-19 17:24:22', '2019-02-19 17:24:23');
INSERT INTO `orders` VALUES ('787', '92149', '2019021951101100', null, '购买排骨炖豆角玉米土豆', '6.60', null, null, 'MIAOSHA', '1', '2019-02-19 17:31:31', '2019-02-19 17:31:31');
INSERT INTO `orders` VALUES ('788', '92149', '2019022049985010', null, '购买秒杀春节大礼包', '1.00', 'GANGCOIN', '2019-02-20 08:13:54', 'MIAOSHA', '2', '2019-02-20 08:13:53', '2019-02-20 08:13:54');
INSERT INTO `orders` VALUES ('789', '92149', '2019022053535156', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 08:45:41', 'MIAOSHA', '2', '2019-02-20 08:45:41', '2019-02-20 08:45:41');
INSERT INTO `orders` VALUES ('790', '92149', '2019022054541029', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 08:45:42', 'MIAOSHA', '2', '2019-02-20 08:45:42', '2019-02-20 08:45:42');
INSERT INTO `orders` VALUES ('791', '92149', '2019022010299555', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 08:51:44', 'MIAOSHA', '2', '2019-02-20 08:51:43', '2019-02-20 08:51:44');
INSERT INTO `orders` VALUES ('792', '92149', '2019022055525153', null, '购买秒杀春节大礼包', '1.00', 'GANGCOIN', '2019-02-20 08:51:51', 'MIAOSHA', '2', '2019-02-20 08:51:51', '2019-02-20 08:51:51');
INSERT INTO `orders` VALUES ('793', '92149', '2019022050539754', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 08:53:22', 'MIAOSHA', '2', '2019-02-20 08:53:22', '2019-02-20 08:53:22');
INSERT INTO `orders` VALUES ('794', '92149', '2019022053525352', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 08:56:05', 'MIAOSHA', '2', '2019-02-20 08:56:05', '2019-02-20 08:56:05');
INSERT INTO `orders` VALUES ('795', '92149', '2019022010010110', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:06:38', 'MIAOSHA', '2', '2019-02-20 08:56:29', '2019-02-20 09:06:38');
INSERT INTO `orders` VALUES ('796', '92149', '2019022053984810', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 08:57:41', 'MIAOSHA', '2', '2019-02-20 08:57:41', '2019-02-20 08:57:41');
INSERT INTO `orders` VALUES ('797', '92149', '2019022050102485', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 08:58:59', 'MIAOSHA', '2', '2019-02-20 08:58:58', '2019-02-20 08:58:59');
INSERT INTO `orders` VALUES ('798', '92149', '2019022053495610', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 08:59:33', 'MIAOSHA', '2', '2019-02-20 08:59:33', '2019-02-20 08:59:33');
INSERT INTO `orders` VALUES ('799', '92149', '2019022053495397', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:00:21', 'MIAOSHA', '2', '2019-02-20 09:00:21', '2019-02-20 09:00:21');
INSERT INTO `orders` VALUES ('800', '92149', '2019022010010110', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:06:38', 'MIAOSHA', '2', '2019-02-20 09:06:37', '2019-02-20 09:06:38');
INSERT INTO `orders` VALUES ('801', '92149', '2019022052975050', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:24:53', 'MIAOSHA', '2', '2019-02-20 09:24:52', '2019-02-20 09:24:53');
INSERT INTO `orders` VALUES ('802', '92149', '2019022048985754', null, '购买秒杀春节大礼包', '1.00', 'GANGCOIN', '2019-02-20 09:25:21', 'MIAOSHA', '2', '2019-02-20 09:25:20', '2019-02-20 09:25:21');
INSERT INTO `orders` VALUES ('803', '92149', '2019022049554855', null, '购买秒杀春节大礼包', '1.00', 'GANGCOIN', '2019-02-20 09:25:21', 'MIAOSHA', '2', '2019-02-20 09:25:21', '2019-02-20 09:25:21');
INSERT INTO `orders` VALUES ('804', '92149', '2019022053495650', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:32:21', 'MIAOSHA', '2', '2019-02-20 09:32:21', '2019-02-20 09:32:21');
INSERT INTO `orders` VALUES ('805', '92149', '2019022053979953', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:32:21', 'MIAOSHA', '2', '2019-02-20 09:32:21', '2019-02-20 09:32:21');
INSERT INTO `orders` VALUES ('806', '92149', '2019022054100979', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:33:11', 'MIAOSHA', '2', '2019-02-20 09:33:10', '2019-02-20 09:33:11');
INSERT INTO `orders` VALUES ('807', '92149', '2019022057995210', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:33:14', 'MIAOSHA', '2', '2019-02-20 09:33:13', '2019-02-20 09:33:14');
INSERT INTO `orders` VALUES ('808', '92149', '2019022097555457', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:33:14', 'MIAOSHA', '2', '2019-02-20 09:33:14', '2019-02-20 09:33:14');
INSERT INTO `orders` VALUES ('809', '92149', '2019022010049985', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:33:17', 'MIAOSHA', '2', '2019-02-20 09:33:17', '2019-02-20 09:33:17');
INSERT INTO `orders` VALUES ('810', '92149', '2019022010298102', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:33:52', 'MIAOSHA', '2', '2019-02-20 09:33:51', '2019-02-20 09:33:52');
INSERT INTO `orders` VALUES ('811', '92149', '2019022051534910', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:34:27', 'MIAOSHA', '2', '2019-02-20 09:34:27', '2019-02-20 09:34:27');
INSERT INTO `orders` VALUES ('812', '92149', '2019022010150505', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:34:38', 'MIAOSHA', '2', '2019-02-20 09:34:38', '2019-02-20 15:18:47');
INSERT INTO `orders` VALUES ('813', '92149', '2019022051515551', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:36:03', 'MIAOSHA', '2', '2019-02-20 09:36:03', '2019-02-20 15:18:47');
INSERT INTO `orders` VALUES ('814', '92149', '2019022051515651', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:36:51', 'MIAOSHA', '2', '2019-02-20 09:36:51', '2019-02-20 15:18:47');
INSERT INTO `orders` VALUES ('815', '92149', '2019022010197571', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:37:18', 'MIAOSHA', '2', '2019-02-20 09:37:18', '2019-02-20 15:18:47');
INSERT INTO `orders` VALUES ('816', '92149', '2019022052505055', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:39:00', 'MIAOSHA', '2', '2019-02-20 09:39:00', '2019-02-20 15:18:47');
INSERT INTO `orders` VALUES ('817', '92149', '2019022048489851', null, '购买秒杀春节大礼包', '1.00', 'GANGCOIN', '2019-02-20 09:47:12', 'MIAOSHA', '2', '2019-02-20 09:47:12', '2019-02-20 15:18:47');
INSERT INTO `orders` VALUES ('818', '92149', '2019022048541025', null, '购买秒杀春节大礼包', '1.00', 'GANGCOIN', '2019-02-20 09:48:48', 'MIAOSHA', '2', '2019-02-20 09:48:48', '2019-04-05 17:19:33');
INSERT INTO `orders` VALUES ('819', '92149', '2019022010154565', null, '购买烤冷面', '8.00', 'GANGCOIN', '2019-02-20 09:49:50', 'MIAOSHA', '2', '2019-02-20 09:49:50', '2019-02-20 15:18:47');
INSERT INTO `orders` VALUES ('820', '92149', '2019022053569753', null, '购买秒杀春节大礼包', '1.00', 'GANGCOIN', '2019-02-20 09:49:57', 'MIAOSHA', '2', '2019-02-20 09:49:57', '2019-02-20 15:19:23');
INSERT INTO `orders` VALUES ('821', '92149', '2019022049544997', null, '购买秒杀春节大礼包', '1.00', 'GANGCOIN', '2019-02-20 09:56:33', 'MIAOSHA', '2', '2019-02-20 09:56:33', '2019-02-20 15:19:23');
INSERT INTO `orders` VALUES ('822', '92149', '2019022054575010', null, '购买美的热水器【限5台】', '8.88', 'GANGCOIN', '2019-02-20 15:33:58', 'MIAOSHA', '2', '2019-02-20 15:33:58', '2019-02-20 15:33:58');
INSERT INTO `orders` VALUES ('823', '92149', '2019022010048975', null, '购买玻璃水杯【限50个】', '1.00', 'GANGCOIN', '2019-02-20 15:57:01', 'MIAOSHA', '2', '2019-02-20 15:57:01', '2019-02-20 15:57:52');
INSERT INTO `orders` VALUES ('824', '92149', '2019022053491005', null, '购买电脑包【限20个】', '2.00', 'GANGCOIN', '2019-02-20 16:49:41', 'MIAOSHA', '2', '2019-02-20 16:49:41', '2019-02-20 16:49:41');
INSERT INTO `orders` VALUES ('825', '55214', '2019022010197514', null, '购买玻璃水杯【限50个】', '1.00', 'GANGCOIN', '2019-02-20 17:39:11', 'MIAOSHA', '2', '2019-02-20 17:39:10', '2019-02-20 17:39:11');
INSERT INTO `orders` VALUES ('826', '55214', '2019022051579951', null, '购买YSL【限10个】', '12.00', 'GANGCOIN', '2019-02-20 17:45:55', 'MIAOSHA', '2', '2019-02-20 17:45:55', '2019-04-05 16:14:31');
INSERT INTO `orders` VALUES ('827', '55214', '2019022056515398', null, '购买电脑包【限20个】', '2.00', 'GANGCOIN', '2019-02-20 17:53:12', 'MIAOSHA', '2', '2019-02-20 17:53:12', '2019-04-05 18:03:17');
INSERT INTO `orders` VALUES ('828', '55214', '2019022156539856', null, '购买牛排套餐', '0.01', 'WECHAT_APP', null, 'GROUPBUY', '1', '2019-02-21 15:45:28', '2019-03-16 16:12:42');
INSERT INTO `orders` VALUES ('846', '87748', '2019030710098535', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '2', '2019-03-07 08:34:05', '2019-03-07 11:20:10');
INSERT INTO `orders` VALUES ('857', '87748', '2019030748561001', null, '购买五谷豆浆', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '2', '2019-03-07 09:40:32', '2019-03-07 11:18:57');
INSERT INTO `orders` VALUES ('858', '87748', '2019030797100100', null, '购买辣炒花蛤', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '2', '2019-03-07 09:48:10', '2019-03-07 11:16:22');
INSERT INTO `orders` VALUES ('859', '87748', '2019030749579756', null, '购买洗发水', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '2', '2019-03-07 10:22:41', '2019-03-07 16:13:39');
INSERT INTO `orders` VALUES ('860', '87748', '2019030750545157', null, '购买鲜花', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '2', '2019-03-07 10:54:10', '2019-03-07 16:13:05');
INSERT INTO `orders` VALUES ('861', '87748', '2019030799100555', '4200000240201903072931466760', '购买香皂', '0.01', 'WECHAT_JSAPI', '2019-03-07 11:01:27', 'GROUPBUY', '2', '2019-03-07 10:57:16', '2019-04-05 17:50:23');
INSERT INTO `orders` VALUES ('862', '87748', '2019030753485354', '4200000251201903078809707391', '购买牛排套餐', '0.01', 'WECHAT_JSAPI', '2019-03-07 11:01:15', 'GROUPBUY', '2', '2019-03-07 11:01:09', '2019-03-07 11:04:46');
INSERT INTO `orders` VALUES ('863', '87748', '2019030752564848', '4200000252201903071473247687', '购买牛排套餐', '0.01', 'WECHAT_JSAPI', '2019-03-07 11:22:02', 'GROUPBUY', '2', '2019-03-07 11:21:56', '2019-03-07 15:30:12');
INSERT INTO `orders` VALUES ('867', '123', '2019030749102501', '4200000249201903079686216754', '购买辣炒花蛤', '0.01', 'WECHAT_JSAPI', '2019-03-07 14:25:35', 'GROUPBUY', '2', '2019-03-07 14:25:21', '2019-04-05 17:52:42');
INSERT INTO `orders` VALUES ('875', '123', '2019030753491021', null, '购买牛排套餐', '0.01', 'ALIPAY_WAP', null, 'GROUPBUY', '1', '2019-03-07 15:59:01', '2019-03-07 15:59:01');
INSERT INTO `orders` VALUES ('876', '123', '2019030710054495', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-07 16:53:33', '2019-03-07 16:53:33');
INSERT INTO `orders` VALUES ('877', '123', '2019030749985010', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-07 16:53:53', '2019-03-07 16:53:54');
INSERT INTO `orders` VALUES ('895', '92149', '2019031349514950', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-13 17:24:49', '2019-03-13 17:24:49');
INSERT INTO `orders` VALUES ('898', '92149', '2019031357101565', null, '购买辣炒花蛤', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-13 17:34:33', '2019-03-13 17:34:34');
INSERT INTO `orders` VALUES ('899', '92149', '2019031398514997', null, '购买辣炒花蛤', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-13 17:34:35', '2019-03-13 17:34:35');
INSERT INTO `orders` VALUES ('904', '87748', '2019031499501005', '4200000256201903145675149344', '购买辣炒花蛤', '0.02', 'WECHAT_JSAPI', '2019-03-14 08:42:43', 'GROUPBUY', '2', '2019-03-14 08:42:36', '2019-03-14 08:42:43');
INSERT INTO `orders` VALUES ('906', '3944', '2019031448995448', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-14 09:59:12', '2019-03-14 09:59:13');
INSERT INTO `orders` VALUES ('909', '19843', '2019031457101102', '4200000245201903142765313644', '购买辣炒花蛤', '0.01', 'WECHAT_JSAPI', '2019-03-14 11:30:55', 'GROUPBUY', '2', '2019-03-14 11:30:49', '2019-04-05 17:20:38');
INSERT INTO `orders` VALUES ('910', '57143', '2019031451565710', '4200000257201903141036423314', '购买五谷豆浆', '0.01', 'WECHAT_JSAPI', '2019-03-14 11:31:06', 'GROUPBUY', '2', '2019-03-14 11:30:59', '2019-03-14 11:31:06');
INSERT INTO `orders` VALUES ('911', '72049', '2019031497984953', null, '购买洗发水', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-14 11:31:06', '2019-03-14 11:31:07');
INSERT INTO `orders` VALUES ('913', '19843', '2019031449100101', null, '购买东北杀猪菜', '6.60', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-14 11:36:33', '2019-03-14 11:36:34');
INSERT INTO `orders` VALUES ('914', '57143', '2019031457519897', '4200000244201903145257546131', '购买鲜花', '0.01', 'WECHAT_JSAPI', '2019-03-14 11:37:19', 'GROUPBUY', '2', '2019-03-14 11:37:13', '2019-04-05 17:17:51');
INSERT INTO `orders` VALUES ('916', '35186', '2019031452544897', '4200000248201903144114523344', '购买牛排套餐', '0.01', 'WECHAT_JSAPI', '2019-03-14 11:38:36', 'GROUPBUY', '2', '2019-03-14 11:38:28', '2019-04-05 17:09:14');
INSERT INTO `orders` VALUES ('918', '35186', '2019031453511005', '4200000248201903147940346247', '购买牛排套餐', '0.01', 'WECHAT_JSAPI', '2019-03-14 11:40:10', 'GROUPBUY', '2', '2019-03-14 11:40:05', '2019-03-14 11:40:10');
INSERT INTO `orders` VALUES ('919', '47023', '2019031452565354', '4200000240201903142724761249', '购买五谷豆浆', '0.01', 'WECHAT_JSAPI', '2019-03-14 11:40:25', 'GROUPBUY', '2', '2019-03-14 11:40:20', '2019-03-14 11:40:25');
INSERT INTO `orders` VALUES ('920', '37269', '2019031410010149', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-14 12:05:01', '2019-03-14 12:05:02');
INSERT INTO `orders` VALUES ('921', '37269', '2019031410252521', null, '购买牛排套餐', '0.01', null, null, 'GROUPBUY', '1', '2019-03-14 12:05:03', '2019-03-14 12:05:03');
INSERT INTO `orders` VALUES ('922', '37269', '2019031410097555', '4200000240201903147537223277', '购买牛排套餐', '0.01', 'WECHAT_JSAPI', '2019-03-14 12:06:04', 'GROUPBUY', '2', '2019-03-14 12:05:49', '2019-03-14 12:06:04');
INSERT INTO `orders` VALUES ('923', '41331', '2019031410148521', '4200000252201903147847449473', '购买牛排套餐', '0.01', 'WECHAT_JSAPI', '2019-03-14 12:08:22', 'GROUPBUY', '2', '2019-03-14 12:08:14', '2019-04-05 15:44:09');
INSERT INTO `orders` VALUES ('924', '57143', '2019031498545055', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-14 12:22:51', '2019-03-14 12:22:51');
INSERT INTO `orders` VALUES ('925', '57143', '2019031453499954', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-14 12:23:01', '2019-03-14 12:23:01');
INSERT INTO `orders` VALUES ('926', '57143', '2019031454505648', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-14 12:23:02', '2019-03-14 12:23:02');
INSERT INTO `orders` VALUES ('927', '57143', '2019031499541001', null, '购买香皂', '0.10', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-14 12:26:04', '2019-03-14 12:26:05');
INSERT INTO `orders` VALUES ('928', '57143', '2019031452100979', null, '购买香皂', '0.02', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-14 12:26:28', '2019-03-14 12:26:29');
INSERT INTO `orders` VALUES ('929', '57143', '2019031410154495', '4200000251201903140814213063', '购买香皂', '0.04', 'WECHAT_JSAPI', '2019-03-14 12:26:46', 'GROUPBUY', '2', '2019-03-14 12:26:38', '2019-03-14 12:26:46');
INSERT INTO `orders` VALUES ('931', '3944', '2019031450985053', '4200000257201903148119958578', '购买牛排套餐', '0.01', 'WECHAT_JSAPI', '2019-03-14 20:54:20', 'GROUPBUY', '2', '2019-03-14 20:54:10', '2019-03-14 20:54:20');
INSERT INTO `orders` VALUES ('932', '3944', '2019031452559954', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-14 20:54:12', '2019-03-14 20:54:13');
INSERT INTO `orders` VALUES ('933', '41331', '2019031510010010', '4200000246201903156684896787', '购买牛排套餐', '0.01', 'WECHAT_JSAPI', '2019-03-15 08:45:40', 'GROUPBUY', '2', '2019-03-15 08:45:33', '2019-03-15 08:45:40');
INSERT INTO `orders` VALUES ('934', '19843', '2019031550504951', '4200000247201903159760719237', '购买鲜花', '0.01', 'WECHAT_JSAPI', '2019-03-15 08:48:41', 'GROUPBUY', '2', '2019-03-15 08:48:34', '2019-03-15 08:48:41');
INSERT INTO `orders` VALUES ('935', '37269', '2019031552101975', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-15 08:49:40', '2019-03-15 08:49:41');
INSERT INTO `orders` VALUES ('936', '35186', '2019031555494810', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-15 08:50:31', '2019-03-15 08:50:31');
INSERT INTO `orders` VALUES ('937', '35186', '2019031557995410', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-15 08:50:33', '2019-03-15 08:50:34');
INSERT INTO `orders` VALUES ('938', '35186', '2019031599495551', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-15 08:50:36', '2019-03-15 08:50:36');
INSERT INTO `orders` VALUES ('939', '35186', '2019031550539997', null, '购买牛排套餐', '0.01', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-15 08:50:42', '2019-03-15 08:50:42');
INSERT INTO `orders` VALUES ('940', '35186', '2019031549995098', '4200000250201903157667749469', '购买牛排套餐', '0.01', 'WECHAT_JSAPI', '2019-03-15 08:51:07', 'GROUPBUY', '2', '2019-03-15 08:50:57', '2019-03-15 08:51:07');
INSERT INTO `orders` VALUES ('941', '41331', '2019031510056535', null, '购买东北杀猪菜', '6.60', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-15 08:51:09', '2019-03-15 08:51:09');
INSERT INTO `orders` VALUES ('942', '35186', '2019031555101555', '4200000255201903150670586974', '购买鲜花', '0.01', 'WECHAT_JSAPI', '2019-03-15 08:56:00', 'GROUPBUY', '2', '2019-03-15 08:55:51', '2019-03-15 08:56:00');
INSERT INTO `orders` VALUES ('943', '41331', '2019031510010052', '4200000256201903151639497064', '购买牛排套餐', '0.05', 'WECHAT_JSAPI', '2019-03-15 09:02:28', 'GROUPBUY', '2', '2019-03-15 09:02:21', '2019-03-15 09:02:28');
INSERT INTO `orders` VALUES ('951', '87748', '2019031657525097', null, '购买甜豆浆', '2.00', 'WECHAT_JSAPI', null, 'GROUPBUY', '1', '2019-03-16 16:48:25', '2019-04-06 08:50:04');

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
  `menu_id` int(11) NOT NULL DEFAULT '0' COMMENT '菜单id',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '0', 'api/admin/login', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('2', '0', 'api/admin/logout', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('3', '0', 'api/admin/loginErrorTimes', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('4', '0', 'api/admin/console/index', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('5', '0', 'api/admin/account/info', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('6', '0', 'api/admin/account/profile', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('7', '0', 'api/admin/account/password', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('8', '0', 'api/admin/account/menus', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('9', '0', 'api/admin/article/index', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('10', '0', 'api/admin/article/create', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('11', '0', 'api/admin/article/store', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('12', '0', 'api/admin/article/edit', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('13', '0', 'api/admin/article/save', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('14', '0', 'api/admin/article/changeStatus', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('15', '0', 'api/admin/article/myPublished', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('16', '0', 'api/admin/page/index', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('17', '0', 'api/admin/page/create', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('18', '0', 'api/admin/page/store', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('19', '0', 'api/admin/page/edit', 'admin', '2019-07-26 11:37:13', '2019-07-26 11:37:13');
INSERT INTO `permissions` VALUES ('20', '0', 'api/admin/page/save', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('21', '0', 'api/admin/page/changeStatus', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('22', '0', 'api/admin/user/index', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('23', '0', 'api/admin/user/create', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('24', '0', 'api/admin/user/store', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('25', '0', 'api/admin/user/edit', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('26', '0', 'api/admin/user/save', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('27', '0', 'api/admin/user/changeStatus', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('28', '0', 'api/admin/user/recharge', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('29', '0', 'api/admin/admin/index', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('30', '0', 'api/admin/admin/create', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('31', '0', 'api/admin/admin/store', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('32', '0', 'api/admin/admin/edit', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('33', '0', 'api/admin/admin/save', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('34', '0', 'api/admin/admin/changeStatus', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('35', '0', 'api/admin/permission/index', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('36', '0', 'api/admin/permission/create', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('37', '0', 'api/admin/permission/store', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('38', '0', 'api/admin/permission/edit', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('39', '0', 'api/admin/permission/save', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('40', '0', 'api/admin/permission/changeStatus', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('41', '0', 'api/admin/role/index', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('42', '0', 'api/admin/role/create', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('43', '0', 'api/admin/role/store', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('44', '0', 'api/admin/role/edit', 'admin', '2019-07-26 11:37:14', '2019-07-26 11:37:14');
INSERT INTO `permissions` VALUES ('45', '0', 'api/admin/role/save', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('46', '0', 'api/admin/role/changeStatus', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('47', '0', 'api/admin/banner/index', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('48', '0', 'api/admin/banner/create', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('49', '0', 'api/admin/banner/store', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('50', '0', 'api/admin/banner/edit', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('51', '0', 'api/admin/banner/save', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('52', '0', 'api/admin/banner/changeStatus', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('53', '0', 'api/admin/bannerCategory/index', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('54', '0', 'api/admin/bannerCategory/create', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('55', '0', 'api/admin/bannerCategory/store', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('56', '0', 'api/admin/bannerCategory/edit', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('57', '0', 'api/admin/bannerCategory/save', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('58', '0', 'api/admin/bannerCategory/changeStatus', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('59', '0', 'api/admin/comment/index', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('60', '0', 'api/admin/comment/edit', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('61', '0', 'api/admin/comment/save', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('62', '0', 'api/admin/comment/changeStatus', 'admin', '2019-07-26 11:37:15', '2019-07-26 11:37:15');
INSERT INTO `permissions` VALUES ('63', '0', 'api/admin/link/index', 'admin', '2019-07-26 11:37:16', '2019-07-26 11:37:16');
INSERT INTO `permissions` VALUES ('64', '0', 'api/admin/link/create', 'admin', '2019-07-26 11:37:16', '2019-07-26 11:37:16');
INSERT INTO `permissions` VALUES ('65', '0', 'api/admin/link/store', 'admin', '2019-07-26 11:37:16', '2019-07-26 11:37:16');
INSERT INTO `permissions` VALUES ('66', '0', 'api/admin/link/edit', 'admin', '2019-07-26 11:37:16', '2019-07-26 11:37:16');
INSERT INTO `permissions` VALUES ('67', '0', 'api/admin/link/save', 'admin', '2019-07-26 11:37:16', '2019-07-26 11:37:16');
INSERT INTO `permissions` VALUES ('68', '0', 'api/admin/link/changeStatus', 'admin', '2019-07-26 11:37:16', '2019-07-26 11:37:16');
INSERT INTO `permissions` VALUES ('69', '0', 'api/admin/printer/index', 'admin', '2019-07-26 11:37:16', '2019-07-26 11:37:16');
INSERT INTO `permissions` VALUES ('70', '0', 'api/admin/printer/create', 'admin', '2019-07-26 11:37:16', '2019-07-26 11:37:16');
INSERT INTO `permissions` VALUES ('71', '0', 'api/admin/printer/store', 'admin', '2019-07-26 11:37:16', '2019-07-26 11:37:16');
INSERT INTO `permissions` VALUES ('72', '0', 'api/admin/printer/edit', 'admin', '2019-07-26 11:37:16', '2019-07-26 11:37:16');
INSERT INTO `permissions` VALUES ('73', '0', 'api/admin/printer/save', 'admin', '2019-07-26 11:37:16', '2019-07-26 11:37:16');
INSERT INTO `permissions` VALUES ('74', '0', 'api/admin/printer/changeStatus', 'admin', '2019-07-26 11:37:16', '2019-07-26 11:37:16');
INSERT INTO `permissions` VALUES ('75', '0', 'api/admin/config/website', 'admin', '2019-07-26 11:37:16', '2019-07-26 11:37:16');
INSERT INTO `permissions` VALUES ('76', '0', 'api/admin/config/saveWebsite', 'admin', '2019-07-26 11:37:16', '2019-07-26 11:37:16');
INSERT INTO `permissions` VALUES ('77', '0', 'api/admin/config/index', 'admin', '2019-07-26 11:37:16', '2019-07-26 11:37:16');
INSERT INTO `permissions` VALUES ('78', '0', 'api/admin/config/create', 'admin', '2019-07-26 11:37:17', '2019-07-26 11:37:17');
INSERT INTO `permissions` VALUES ('79', '0', 'api/admin/config/store', 'admin', '2019-07-26 11:37:17', '2019-07-26 11:37:17');
INSERT INTO `permissions` VALUES ('80', '0', 'api/admin/config/edit', 'admin', '2019-07-26 11:37:17', '2019-07-26 11:37:17');
INSERT INTO `permissions` VALUES ('81', '0', 'api/admin/config/save', 'admin', '2019-07-26 11:37:17', '2019-07-26 11:37:17');
INSERT INTO `permissions` VALUES ('82', '0', 'api/admin/config/changeStatus', 'admin', '2019-07-26 11:37:17', '2019-07-26 11:37:17');
INSERT INTO `permissions` VALUES ('83', '0', 'api/admin/menu/index', 'admin', '2019-07-26 11:37:17', '2019-07-26 11:37:17');
INSERT INTO `permissions` VALUES ('84', '0', 'api/admin/menu/create', 'admin', '2019-07-26 11:37:17', '2019-07-26 11:37:17');
INSERT INTO `permissions` VALUES ('85', '0', 'api/admin/menu/store', 'admin', '2019-07-26 11:37:17', '2019-07-26 11:37:17');
INSERT INTO `permissions` VALUES ('86', '0', 'api/admin/menu/edit', 'admin', '2019-07-26 11:37:17', '2019-07-26 11:37:17');
INSERT INTO `permissions` VALUES ('87', '0', 'api/admin/menu/save', 'admin', '2019-07-26 11:37:17', '2019-07-26 11:37:17');
INSERT INTO `permissions` VALUES ('88', '0', 'api/admin/menu/destroy', 'admin', '2019-07-26 11:37:17', '2019-07-26 11:37:17');
INSERT INTO `permissions` VALUES ('89', '0', 'api/admin/menu/changeStatus', 'admin', '2019-07-26 11:37:17', '2019-07-26 11:37:17');
INSERT INTO `permissions` VALUES ('90', '0', 'api/admin/navigation/index', 'admin', '2019-07-26 11:37:17', '2019-07-26 11:37:17');
INSERT INTO `permissions` VALUES ('91', '0', 'api/admin/navigation/create', 'admin', '2019-07-26 11:37:18', '2019-07-26 11:37:18');
INSERT INTO `permissions` VALUES ('92', '0', 'api/admin/navigation/store', 'admin', '2019-07-26 11:37:18', '2019-07-26 11:37:18');
INSERT INTO `permissions` VALUES ('93', '0', 'api/admin/navigation/edit', 'admin', '2019-07-26 11:37:18', '2019-07-26 11:37:18');
INSERT INTO `permissions` VALUES ('94', '0', 'api/admin/navigation/save', 'admin', '2019-07-26 11:37:18', '2019-07-26 11:37:18');
INSERT INTO `permissions` VALUES ('95', '0', 'api/admin/navigation/changeStatus', 'admin', '2019-07-26 11:37:18', '2019-07-26 11:37:18');
INSERT INTO `permissions` VALUES ('96', '0', 'api/admin/category/index', 'admin', '2019-07-26 11:37:18', '2019-07-26 11:37:18');
INSERT INTO `permissions` VALUES ('97', '0', 'api/admin/category/create', 'admin', '2019-07-26 11:37:18', '2019-07-26 11:37:18');
INSERT INTO `permissions` VALUES ('98', '0', 'api/admin/category/store', 'admin', '2019-07-26 11:37:18', '2019-07-26 11:37:18');
INSERT INTO `permissions` VALUES ('99', '0', 'api/admin/category/edit', 'admin', '2019-07-26 11:37:18', '2019-07-26 11:37:18');
INSERT INTO `permissions` VALUES ('100', '0', 'api/admin/category/save', 'admin', '2019-07-26 11:37:18', '2019-07-26 11:37:18');
INSERT INTO `permissions` VALUES ('101', '0', 'api/admin/category/changeStatus', 'admin', '2019-07-26 11:37:18', '2019-07-26 11:37:18');
INSERT INTO `permissions` VALUES ('102', '0', 'api/admin/sms/index', 'admin', '2019-07-26 11:37:18', '2019-07-26 11:37:18');
INSERT INTO `permissions` VALUES ('103', '0', 'api/admin/sms/changeStatus', 'admin', '2019-07-26 11:37:19', '2019-07-26 11:37:19');
INSERT INTO `permissions` VALUES ('104', '0', 'api/admin/sms/send', 'admin', '2019-07-26 11:37:19', '2019-07-26 11:37:19');
INSERT INTO `permissions` VALUES ('105', '0', 'api/admin/actionLog/index', 'admin', '2019-07-26 11:37:19', '2019-07-26 11:37:19');
INSERT INTO `permissions` VALUES ('106', '0', 'api/admin/actionLog/changeStatus', 'admin', '2019-07-26 11:37:19', '2019-07-26 11:37:19');
INSERT INTO `permissions` VALUES ('107', '0', 'api/admin/actionLog/export', 'admin', '2019-07-26 11:37:19', '2019-07-26 11:37:19');
INSERT INTO `permissions` VALUES ('108', '0', 'api/admin/picture/index', 'admin', '2019-07-26 11:37:19', '2019-07-26 11:37:19');
INSERT INTO `permissions` VALUES ('109', '0', 'api/admin/picture/upload', 'admin', '2019-07-26 11:37:19', '2019-07-26 11:37:19');
INSERT INTO `permissions` VALUES ('110', '0', 'api/admin/picture/download', 'admin', '2019-07-26 11:37:19', '2019-07-26 11:37:19');
INSERT INTO `permissions` VALUES ('111', '0', 'api/admin/picture/update', 'admin', '2019-07-26 11:37:19', '2019-07-26 11:37:19');
INSERT INTO `permissions` VALUES ('112', '0', 'api/admin/picture/edit', 'admin', '2019-07-26 11:37:19', '2019-07-26 11:37:19');
INSERT INTO `permissions` VALUES ('113', '0', 'api/admin/picture/save', 'admin', '2019-07-26 11:37:19', '2019-07-26 11:37:19');
INSERT INTO `permissions` VALUES ('114', '0', 'api/admin/picture/changeStatus', 'admin', '2019-07-26 11:37:20', '2019-07-26 11:37:20');
INSERT INTO `permissions` VALUES ('115', '0', 'api/admin/file/index', 'admin', '2019-07-26 11:37:20', '2019-07-26 11:37:20');
INSERT INTO `permissions` VALUES ('116', '0', 'api/admin/file/upload', 'admin', '2019-07-26 11:37:20', '2019-07-26 11:37:20');
INSERT INTO `permissions` VALUES ('117', '0', 'api/admin/file/download', 'admin', '2019-07-26 11:37:20', '2019-07-26 11:37:20');
INSERT INTO `permissions` VALUES ('118', '0', 'api/admin/file/update', 'admin', '2019-07-26 11:37:20', '2019-07-26 11:37:20');
INSERT INTO `permissions` VALUES ('119', '0', 'api/admin/file/changeStatus', 'admin', '2019-07-26 11:37:20', '2019-07-26 11:37:20');
INSERT INTO `permissions` VALUES ('120', '0', 'api/admin/test/index', 'admin', '2019-07-26 11:37:20', '2019-07-26 11:37:20');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pictures
-- ----------------------------

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
  `cover_ids` varchar(10000) COLLATE utf8mb4_unicode_ci DEFAULT '',
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', '1', '0', '1', '默认文章,你好世界！', '你好，世界！', 'hello', 'tangtanglove', '1', 'Hello, world”程序是指在计算机屏幕上输出“Hello,world”这行字符串的计算机程序，“hello, world”的中文意思是“你好，世界。”。这个例程在Brian Kernighan 和Dennis M. Ritchie合著的《The C Programme Language》使用而广泛流行。', '', '', '0', '0', 'ARTICLE', '1', '1', '', '“Hello, world”程序是指在计算机屏幕上输出“Hello,world”这行字符串的计算机程序，“hello, world”的中文意思是“你好，世界。”。这个例程在Brian Kernighan 和Dennis M. Ritchie合著的《The C Programme Language》使用而广泛流行。因为它的简洁，实用，并包含了一个该版本的C程序首次出现在1974年Brian Kernighan所撰写的《Programming in C: A Tutorial》', '0', '0', '', 'open', '1', '0', '2019-03-08 08:25:59', '2019-07-11 14:40:31', null);
INSERT INTO `posts` VALUES ('2', '1', '0', '1', '使用说明,配置手册', '使用说明', 'doc', 'tangtanglove', '本站', '说明书多种多样，说明书的写作格式也不拘一格，不可一概而论。本文将举出一些常见的说明书的具体例子，以期使读者对此有一明确的认识。', '', '', '0', '0', 'ARTICLE', '1', '0', '', 'https://www.kancloud.cn/tangtanglove/easyadmin/435582', '0', '0', '', 'open', '1', '0', '2019-03-08 08:25:59', '2019-07-12 18:45:19', null);
INSERT INTO `posts` VALUES ('3', '1', '0', '1', '开发文档,帮助文件', '开发文档', 'help', 'tangtanglove', '本站', '软件开发文档是软件开发使用和维护过程中的必备资料。它能提高软件开发的效率，保证软件的质量，而且在软件的使用过程中有指导，帮助，解惑的作用，尤其在维护工作中，文档是不可或缺的资料。', null, '[15,8]', '0', '0', 'ARTICLE', '1', '0', '', '<p>https://www.kancloud.cn/tangtanglove/easyadmin/435582</p>', '0', '0', '', 'open', '1', '0', '2019-03-08 08:25:59', '2019-07-12 18:45:19', null);
INSERT INTO `posts` VALUES ('4', '1', '0', '1', '关于我们,介绍', '关于我们', 'aboutus', 'tangtanglove', '本站', '关于我们,介绍', '', '', '0', '0', 'PAGE', '1', '0', '', '这是一个关于我们的文章，您可以填一下介绍什么的。', '0', '0', 'page/index', 'open', '1', '0', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);
INSERT INTO `posts` VALUES ('15', '1', '0', '1', '帮助中心,帮助', '帮助中心', 'help', 'tangtanglove', '本站', '帮助中心,帮助', '', '', '0', '0', 'PAGE', '1', '0', '', '这是一个帮助中心的文章，您可以填一下帮助什么的。', '0', '0', 'page/index', 'open', '1', '0', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);
INSERT INTO `posts` VALUES ('16', '1', '0', '1', '', '点赞！熊孩子博物馆前搞破坏 市民及时制止', '', '', '', '点赞！熊孩子博物馆前搞破坏 市民及时制止', '0', '[]', '0', '0', 'ARTICLE', '1', '0', '', '<p>点赞！熊孩子博物馆前搞破坏 市民及时制止</p>', '0', '0', '', 'open', '1', '0', '2019-05-08 18:50:09', '2019-05-08 18:50:19', '2019-05-08 18:50:19');
INSERT INTO `posts` VALUES ('17', '0', '0', '1', '默认文章,你好世界！', '默认文章,你好世界！', '', '', '', '', '', '', '0', '0', 'ARTICLE', '1', '0', '', '默认文章,你好世界！', '0', '0', '', 'open', '1', '0', '2019-07-11 09:06:43', '2019-07-18 16:13:24', null);
INSERT INTO `posts` VALUES ('18', '1', '0', '1', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '', '', '', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '0', '[]', '0', '0', 'ARTICLE', '1', '0', '', '<p>丰安大路毛毛虫泛滥 吓坏不少路过市民</p>', '0', '0', '', 'open', '1', '0', '2019-07-11 09:07:53', '2019-07-18 16:13:24', null);
INSERT INTO `posts` VALUES ('19', '1', '0', '1', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '', '', '', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '0', '[]', '0', '0', 'ARTICLE', '1', '0', '', '<p>丰安大路毛毛虫泛滥 吓坏不少路过市民</p>', '0', '0', '', 'open', '1', '0', '2019-07-11 09:08:05', '2019-07-18 16:13:24', null);
INSERT INTO `posts` VALUES ('20', '1', '0', '1', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '', '', '', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '0', '[]', '0', '0', 'ARTICLE', '1', '0', '', '<p>丰安大路毛毛虫泛滥 吓坏不少路过市民</p>', '0', '0', '', 'open', '-1', '0', '2019-07-11 09:08:21', '2019-07-11 11:57:51', null);
INSERT INTO `posts` VALUES ('21', '1', '0', '1', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '', '', '', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '0', '[]', '0', '0', 'ARTICLE', '1', '0', '', '<p>丰安大路毛毛虫泛滥 吓坏不少路过市民</p>', '0', '0', '', 'open', '1', '0', '2019-07-11 09:08:39', '2019-07-18 16:13:24', null);
INSERT INTO `posts` VALUES ('22', '1', '0', '1', 'v', '丰安大路毛毛虫泛滥 吓坏不少路过市民', null, null, '', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '0', '[{\"uid\":30,\"name\":\"01-\\u9009\\u62e9\\u56e2\\u957f.png\",\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/anYFrBWpsNx8uaHMJzbZgRWobmxb0UtHNiZExIq6.png\",\"status\":\"done\"},{\"uid\":31,\"name\":\"02-\\u56e2\\u957f\\u5217\\u8868.png\",\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/Wiw1s1GNct2wexso0iOJMHHM5XepfvGYKGICsKDE.png\",\"status\":\"done\"},{\"uid\":32,\"name\":\"03-\\u9009\\u62e9\\u5730\\u5740-1.png\",\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/qcnpnYWc0sQQgKoicXgmsEREfgwGzwTA9dfBm0na.png\",\"status\":\"done\"}]', '0', '0', 'ARTICLE', '1', '0', '', '<p>丰安大路毛毛虫泛滥 吓坏不少路过市民</p>', '0', '0', '', 'open', '1', '0', '2019-07-11 09:08:51', '2019-07-18 16:13:24', null);
INSERT INTO `posts` VALUES ('23', '1', '0', '1', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '', '', '', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '0', '[]', '0', '0', 'ARTICLE', '1', '0', '', '<p>丰安大路毛毛虫泛滥 吓坏不少路过市民</p>', '0', '0', '', 'open', '-1', '0', '2019-07-11 09:09:02', '2019-07-11 15:07:33', null);
INSERT INTO `posts` VALUES ('24', '1', '0', '1', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '', '', '', '丰安大路毛毛虫泛滥 吓坏不少路过市民', '0', '[]', '0', '0', 'ARTICLE', '1', '0', '', '<p>丰安大路毛毛虫泛滥 吓坏不少路过市民</p>', '0', '0', '', 'open', '1', '0', '2019-07-11 09:09:23', '2019-07-18 16:13:24', null);
INSERT INTO `posts` VALUES ('25', '1', '0', '1', 'pageLoading:true', 'FullstackCMS', null, null, '', 'pageLoading:true', '0', '[{\"uid\":30,\"name\":\"01-\\u9009\\u62e9\\u56e2\\u957f.png\",\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/anYFrBWpsNx8uaHMJzbZgRWobmxb0UtHNiZExIq6.png\",\"status\":\"done\"},{\"uid\":31,\"name\":\"02-\\u56e2\\u957f\\u5217\\u8868.png\",\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/Wiw1s1GNct2wexso0iOJMHHM5XepfvGYKGICsKDE.png\",\"status\":\"done\"},{\"uid\":32,\"name\":\"03-\\u9009\\u62e9\\u5730\\u5740-1.png\",\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/qcnpnYWc0sQQgKoicXgmsEREfgwGzwTA9dfBm0na.png\",\"status\":\"done\"}]', '0', '0', 'ARTICLE', '1', '0', '', '<p>pageLoading:true</p>', '0', '0', '', 'open', '1', '0', '2019-07-15 15:40:53', '2019-07-18 16:13:24', null);
INSERT INTO `posts` VALUES ('26', '1', '0', '1', '测试内容', '测试内容', null, null, '', '测试内容', '0', '[{\"id\":30,\"name\":\"01-\\u9009\\u62e9\\u56e2\\u957f.png\",\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/anYFrBWpsNx8uaHMJzbZgRWobmxb0UtHNiZExIq6.png\",\"size\":\"84818\",\"uid\":30},{\"id\":31,\"name\":\"02-\\u56e2\\u957f\\u5217\\u8868.png\",\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/Wiw1s1GNct2wexso0iOJMHHM5XepfvGYKGICsKDE.png\",\"size\":\"141473\",\"uid\":31},{\"id\":32,\"name\":\"03-\\u9009\\u62e9\\u5730\\u5740-1.png\",\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/qcnpnYWc0sQQgKoicXgmsEREfgwGzwTA9dfBm0na.png\",\"size\":\"39698\",\"uid\":32}]', '0', '0', 'ARTICLE', '1', '0', '', '<p>测试内容</p>', '0', '0', '', 'open', '1', '0', '2019-07-15 15:41:15', '2019-07-18 16:13:24', null);
INSERT INTO `posts` VALUES ('31', '1', '0', '1', '点赞！熊孩子博物馆前搞破坏 市民及时制止', '你好，世界杯！', null, '蔡永刚', '迁安信息港', '点赞！熊孩子博物馆前搞破坏 市民及时制止', '0', '[{\"id\":32,\"uid\":32,\"name\":\"03-\\u9009\\u62e9\\u5730\\u5740-1.png\",\"size\":39698,\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/qcnpnYWc0sQQgKoicXgmsEREfgwGzwTA9dfBm0na.png\"},{\"id\":33,\"uid\":33,\"name\":\"03-\\u9009\\u62e9\\u5730\\u5740-2.png\",\"size\":66185,\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/KdxN9Q8bgxr9CgKCkFKyPB5dPLod3KZB2S5fi2xq.png\"},{\"id\":37,\"uid\":37,\"name\":\"06-\\u8bc4\\u4ef7\\u5217\\u8868.png\",\"size\":111124,\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/37vp31DKNH8PeIfTntD7PumhMf44OgFlF1g2btAR.png\"}]', '0', '1', 'ARTICLE', '1', '0', '', '<p>点赞！熊孩子博物馆前搞破坏 市民及时制止</p>', '0', '0', '', 'open', '1', '0', '2019-07-18 15:09:20', '2019-07-18 16:13:24', null);
INSERT INTO `posts` VALUES ('32', '1', '0', '1', '阳光谷物', '阳光谷物', null, '李娜', '本站', '阳光谷物', '0', '[{\"id\":30,\"uid\":30,\"name\":\"01-\\u9009\\u62e9\\u56e2\\u957f.png\",\"size\":84818,\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/anYFrBWpsNx8uaHMJzbZgRWobmxb0UtHNiZExIq6.png\"},{\"id\":31,\"uid\":31,\"name\":\"02-\\u56e2\\u957f\\u5217\\u8868.png\",\"size\":141473,\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/Wiw1s1GNct2wexso0iOJMHHM5XepfvGYKGICsKDE.png\"},{\"id\":32,\"uid\":32,\"name\":\"03-\\u9009\\u62e9\\u5730\\u5740-1.png\",\"size\":39698,\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/qcnpnYWc0sQQgKoicXgmsEREfgwGzwTA9dfBm0na.png\"}]', '0', '1', 'ARTICLE', '1', '12', '', '<p>阳光谷物</p>', '0', '0', '', 'open', '1', '0', '2019-07-18 16:00:46', '2019-07-26 10:39:46', null);
INSERT INTO `posts` VALUES ('33', '1', '0', '0', '关于生活', '关于生活', 'about', '', '', '关于生活', '0', '[{\"uid\":30,\"name\":\"01-\\u9009\\u62e9\\u56e2\\u957f.png\",\"size\":84818,\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/anYFrBWpsNx8uaHMJzbZgRWobmxb0UtHNiZExIq6.png\"}]', '0', '0', 'PAGE', '0', '0', '', '<p>关于生活</p>', '0', '0', '', 'close', '1', '0', '2019-07-18 18:58:37', '2019-07-18 19:04:10', null);
INSERT INTO `posts` VALUES ('34', '1', '0', '1', '点赞！熊孩子博物馆前搞破坏 市民及时制止', '点赞！熊孩子博物馆前搞破', null, '蔡永刚', '迁安信息港', '点赞！熊孩子博物馆前搞破坏 市民及时制止', null, '[{\"id\":27,\"uid\":27,\"name\":\"\\u8fc1\\u56e2-logo-01.png\",\"size\":8852,\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/rRSGUhzgltjejyroRkXCgTJOnfYjERJX6Hz8NxN3.png\"}]', '0', '1', 'ARTICLE', '1', '6', '', '<p>点赞！熊孩子博物馆前搞破坏 市民及时制止</p>', '0', '0', '', 'open', '-1', '0', '2019-07-19 10:23:22', '2019-07-26 10:39:41', null);
INSERT INTO `posts` VALUES ('35', '1', '0', '0', '关于生活', '关于生活', 'about', '', '', '关于生活', '0', '[{\"uid\":30,\"name\":\"01-\\u9009\\u62e9\\u56e2\\u957f.png\",\"size\":84818,\"url\":\"http:\\/\\/www.project.com\\/storage\\/uploads\\/pictures\\/anYFrBWpsNx8uaHMJzbZgRWobmxb0UtHNiZExIq6.png\"}]', '4', '0', 'PAGE', '0', '0', '', '<p>关于生活</p>', '0', '0', '', 'close', '1', '0', '2019-07-19 10:46:14', '2019-07-19 10:46:14', null);

-- ----------------------------
-- Table structure for printers
-- ----------------------------
DROP TABLE IF EXISTS `printers`;
CREATE TABLE `printers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '打印机名称',
  `machine_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '易联云打印机终端号',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机卡号码',
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用ID',
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用密钥',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of printers
-- ----------------------------
INSERT INTO `printers` VALUES ('1', '打印机', '', '15076569631', '111111', '111111', '1', '2019-07-24 11:19:24', '2019-07-24 11:24:36');

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
  `pid` int(11) DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) DEFAULT '0',
  `cover_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类缩略名',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分类描述',
  `index_tpl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lists_tpl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `detail_tpl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `page_num` int(11) NOT NULL DEFAULT '10' COMMENT '分页数量',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of shop_categories
-- ----------------------------

-- ----------------------------
-- Table structure for shop_self_categories
-- ----------------------------
DROP TABLE IF EXISTS `shop_self_categories`;
CREATE TABLE `shop_self_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `shop_id` int(11) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) DEFAULT '0',
  `cover_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类缩略名',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分类描述',
  `index_tpl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lists_tpl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `detail_tpl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `page_num` int(11) NOT NULL DEFAULT '10' COMMENT '分页数量',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of shop_self_categories
-- ----------------------------

-- ----------------------------
-- Table structure for shopping_carts
-- ----------------------------
DROP TABLE IF EXISTS `shopping_carts`;
CREATE TABLE `shopping_carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0',
  `sku_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

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
  `printer_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺名称',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺logo',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺分类',
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺标签',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺描述',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺介绍',
  `cover_ids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺封面',
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺排序，越大越靠前',
  `position` tinyint(4) NOT NULL COMMENT '推荐位',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺联系人',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺电话',
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省',
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '市',
  `county` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '县',
  `town` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '镇',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '详细地址',
  `business_license_cover_id` int(11) NOT NULL COMMENT '营业执照照片',
  `corporate_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '法人姓名',
  `corporate_idcard` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '法人身份证号',
  `corporate_idcard_cover_id` int(11) NOT NULL COMMENT '法人身份证照片',
  `comment` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评论数',
  `view` tinyint(4) NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `comment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open' COMMENT '是否允许评论',
  `rate` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评分',
  `open_days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '营业日期：1~2,4~7，数字代表周几',
  `open_times` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '营业时间段：09:00~12:00,13:00~14:00',
  `open_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:营业,2:打烊',
  `is_self` tinyint(4) DEFAULT NULL COMMENT '是否为自营店',
  `status` tinyint(4) NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of shops
-- ----------------------------

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
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `money` decimal(10,2) DEFAULT '0.00',
  `score` int(11) DEFAULT '0',
  `qq_openid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weibo_uid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `wechat_openid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `wechat_unionid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------

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
SET FOREIGN_KEY_CHECKS=1;
