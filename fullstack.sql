/*
Navicat MySQL Data Transfer

Source Server         : fullstack
Source Server Version : 50562
Source Host           : 47.105.46.64:3306
Source Database       : fullstack

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2019-05-28 10:10:59
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of action_logs
-- ----------------------------
INSERT INTO `action_logs` VALUES ('1', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-03-12 06:00:51', '2019-03-12 06:00:51');
INSERT INTO `action_logs` VALUES ('2', null, 'administratorLOGIN_ERROR', '/api/admin/login', '管理员administrator尝试登录出错！', '127.0.0.1', 'ADMIN', '1', '2019-03-12 06:16:19', '2019-03-12 06:16:19');
INSERT INTO `action_logs` VALUES ('3', null, 'administratorLOGIN_ERROR', '/api/admin/login', '管理员administrator尝试登录出错！', '127.0.0.1', 'ADMIN', '1', '2019-03-12 06:17:34', '2019-03-12 06:17:34');
INSERT INTO `action_logs` VALUES ('4', null, 'administratorLOGIN_ERROR', '/api/admin/login', '管理员administrator尝试登录出错！', '127.0.0.1', 'ADMIN', '1', '2019-03-12 06:17:52', '2019-03-12 06:17:52');
INSERT INTO `action_logs` VALUES ('5', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-03-12 06:18:01', '2019-03-12 06:18:01');
INSERT INTO `action_logs` VALUES ('6', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-03-12 06:24:06', '2019-03-12 06:24:06');
INSERT INTO `action_logs` VALUES ('7', null, 'administratorLOGIN_ERROR', '/api/admin/login', '管理员administrator尝试登录出错！', '127.0.0.1', 'ADMIN', '1', '2019-03-12 06:37:21', '2019-03-12 06:37:21');
INSERT INTO `action_logs` VALUES ('8', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-03-12 06:51:15', '2019-03-12 06:51:15');
INSERT INTO `action_logs` VALUES ('9', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-03-12 07:00:29', '2019-03-12 07:00:29');
INSERT INTO `action_logs` VALUES ('10', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-03-12 07:06:40', '2019-03-12 07:06:40');
INSERT INTO `action_logs` VALUES ('11', null, 'administratorLOGIN_ERROR', '/api/admin/login', '管理员administrator尝试登录出错！', '127.0.0.1', 'ADMIN', '1', '2019-03-12 07:06:50', '2019-03-12 07:06:50');
INSERT INTO `action_logs` VALUES ('12', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-03-12 07:06:59', '2019-03-12 07:06:59');
INSERT INTO `action_logs` VALUES ('13', null, '管理员登录', '/api/admin/login', 'administrator登录后台', '127.0.0.1', 'ADMIN', '1', '2019-03-12 07:07:31', '2019-03-12 07:07:31');
INSERT INTO `action_logs` VALUES ('14', null, 'administratorLOGIN_ERROR', '/api/admin/login', '管理员administrator尝试登录出错！', '127.0.0.1', 'ADMIN', '1', '2019-03-12 07:07:42', '2019-03-12 07:07:42');
INSERT INTO `action_logs` VALUES ('15', null, 'administratorLOGIN_ERROR', '/api/admin/login', '管理员administrator尝试登录出错！', '127.0.0.1', 'ADMIN', '1', '2019-03-12 07:09:01', '2019-03-12 07:09:01');
INSERT INTO `action_logs` VALUES ('16', null, '管理员登录', '/api/admin/login', 'tangtanglove登录后台', '127.0.0.1', 'ADMIN', '1', '2019-05-20 17:56:05', '2019-05-20 17:56:05');
INSERT INTO `action_logs` VALUES ('17', null, '管理员登录', '/api/admin/login', 'tangtanglove登录后台', '127.0.0.1', 'ADMIN', '1', '2019-05-20 17:58:01', '2019-05-20 17:58:01');
INSERT INTO `action_logs` VALUES ('18', null, '管理员登录', '/api/admin/login', 'tangtanglove登录后台', '127.0.0.1', 'ADMIN', '1', '2019-05-20 17:59:18', '2019-05-20 17:59:18');
INSERT INTO `action_logs` VALUES ('19', null, '管理员登录', '/api/admin/login', 'tangtanglove登录后台', '127.0.0.1', 'ADMIN', '1', '2019-05-20 18:21:32', '2019-05-20 18:21:32');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'administrator', '超级管理员', 'admin@yourweb.com', '10086', '1', '$2y$10$3oTf1wNz/LMicAnHc0WRPujqs94E4q2Yo4L0dPNeS21Wm1xI7DwNS', '', '', '', '', '', '27.191.1.106', '2019-05-28 10:07:07', '1', 'FnMwEPMfeG', '2019-03-08 08:25:58', '2019-05-28 10:07:07', null);
INSERT INTO `admins` VALUES ('2', '郭云飞', '杨过', 'dai_hang_love@126.com', '', '1', '$2y$10$QQGux06mhnoGxDMzF7/M9O82dkMZL/TJLT4zPjvR2cGXZBLXgFujW', '', '', '', '', '', '', null, '1', null, '2019-05-09 17:29:51', '2019-05-09 17:47:51', '2019-05-09 17:47:51');
INSERT INTO `admins` VALUES ('4', '狮子鱼', '萌叔叔丶', 'dai_hang_love@136.com', '15076569622', '1', '$2y$10$2KbQstMpjTr3EakWVvIRUu.ZoGqRB8km4JvZ2cMreQlH9r4cFzoQW', '', '', '', '', '', '', null, '1', null, '2019-05-09 17:59:52', '2019-05-09 18:09:57', '2019-05-09 18:09:57');
INSERT INTO `admins` VALUES ('5', 'tangtanglove', 'tangtanglove', 'dai_hang_love@10.com', '15076569631', '1', '$2y$10$fDuJSwqjFjLDv60xFxtMu.2dfuahUuFGbanhZTmFDo4XCwRniLMaq', '', '', '', '', '', '127.0.0.1', '2019-05-20 18:21:32', '1', null, '2019-05-09 18:10:20', '2019-05-20 18:21:32', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '0', '新闻', '0', '0', 'news', '新闻中心,包含有时政新闻、国内新闻、国际新闻、社会新闻、时事评论、新闻图片、新闻专题、新闻论坛、军事、历史、的专业时事报道门户网站。', '0', 'article/index', 'article/lists', 'article/detail', '10', '1', 'ARTICLE', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);
INSERT INTO `categories` VALUES ('2', '0', '商城', '0', '0', 'mall', '商品中心', '0', 'goods/index', 'goods/lists', 'goods/detail', '10', '1', 'GOODS', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of configs
-- ----------------------------
INSERT INTO `configs` VALUES ('1', '网站名称', 'text', 'WEB_SITE_NAME', '基本', 'Admin CMF', '', '1', null, '2019-05-10 18:13:27', null);
INSERT INTO `configs` VALUES ('2', '关键字', 'text', 'WEB_SITE_KEYWORDS', '基本', 'Admin CMF', '', '1', null, '2019-05-10 18:13:27', null);
INSERT INTO `configs` VALUES ('3', '描述', 'textarea', 'WEB_SITE_DESCRIPTION', '基本', 'Admin CMF', '', '1', null, '2019-05-10 18:13:27', null);
INSERT INTO `configs` VALUES ('4', 'Logo', 'picture', 'WEB_SITE_LOGO', '基本', '1', '', '1', null, '2019-05-10 18:13:27', null);
INSERT INTO `configs` VALUES ('5', '统计代码', 'textarea', 'WEB_SITE_SCRIPT', '基本', '', '', '1', null, '2019-05-10 18:13:27', null);
INSERT INTO `configs` VALUES ('6', '网站版权', 'text', 'WEB_SITE_COPYRIGHT', '基本', '© Company 2018', '', '1', null, '2019-05-10 18:13:27', null);
INSERT INTO `configs` VALUES ('7', '开启网站', 'switch', 'WEB_SITE_OPEN', '基本', '0', '', '1', null, '2019-05-10 18:13:27', null);
INSERT INTO `configs` VALUES ('8', '服务器地址', 'text', 'EMAIL_HOST', '邮件', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('9', '服务器端口', 'text', 'EMAIL_PORT', '邮件', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('10', '发件人邮箱', 'text', 'EMAIL_USERNAME', '邮件', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('11', '发件人密码', 'text', 'EMAIL_PASSWORD', '邮件', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('12', 'app_key', 'text', 'ALIDAYU_APP_KEY', '阿里云通信', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('13', 'app_secret', 'text', 'ALIDAYU_APP_SECRET', '阿里云通信', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('14', '签名', 'text', 'ALIDAYU_SIGNNAME', '阿里云通信', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('15', '模板代码', 'text', 'ALIDAYU_TEMPLATE_CODE', '阿里云通信', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('16', 'key_id', 'text', 'OSS_ACCESS_KEY_ID', '阿里云OSS', '', '你的AccessKeyId', '1', null, null, null);
INSERT INTO `configs` VALUES ('17', 'key_secret', 'text', 'OSS_ACCESS_KEY_SECRET', '阿里云OSS', '', '你的AccessKeySecret', '1', null, null, null);
INSERT INTO `configs` VALUES ('18', 'endpoint', 'text', 'OSS_ENDPOINT', '阿里云OSS', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('19', 'bucket', 'text', 'OSS_BUCKET', '阿里云OSS', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('20', '自定义域名', 'text', 'OSS_MYDOMAIN', '阿里云OSS', '', '例如：oss.web.com', '1', null, null, null);
INSERT INTO `configs` VALUES ('21', '开启云存储', 'switch', 'OSS_OPEN', '阿里云OSS', '0', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('22', '用户ID', 'text', 'SIOO_UID', '希奥短信', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('23', '企业代码', 'text', 'SIOO_CODE', '希奥短信', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('24', '用户密码', 'text', 'SIOO_PASSWORD', '希奥短信', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('25', 'app_id', 'text', 'WECHAT_PAY_APP_ID', '微信支付', '', 'JSAPI支付授权目录，例如：http://www.web.com/wechat/wechat/', '1', null, '2019-05-10 17:26:37', null);
INSERT INTO `configs` VALUES ('26', 'merchant_id', 'text', 'WECHAT_PAY_MERCHANTID', '微信支付', '', '', '1', null, '2019-05-10 17:26:37', null);
INSERT INTO `configs` VALUES ('27', 'key', 'text', 'WECHAT_PAY_KEY', '微信支付', '', '', '1', null, '2019-05-10 17:26:37', null);
INSERT INTO `configs` VALUES ('28', 'apiclient_cert', 'file', 'WECHAT_PAY_APICLIENT_CERT', '微信支付', '2', '', '1', null, '2019-05-10 17:26:37', null);
INSERT INTO `configs` VALUES ('29', 'apiclient_key', 'file', 'WECHAT_PAY_APICLIENT_KEY', '微信支付', '4', '', '1', null, '2019-05-10 17:26:37', null);
INSERT INTO `configs` VALUES ('30', 'app_id', 'text', 'WECHAT_APP_PAY_APP_ID', '微信APP支付', '', '需要在开放平台申请', '1', null, null, null);
INSERT INTO `configs` VALUES ('31', 'merchant_id', 'text', 'WECHAT_APP_PAY_MERCHANTID', '微信APP支付', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('32', 'key', 'text', 'WECHAT_APP_PAY_KEY', '微信APP支付', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('33', 'apiclient_cert', 'file', 'WECHAT_APP_PAY_APICLIENT_CERT', '微信APP支付', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('34', 'apiclient_key', 'file', 'WECHAT_APP_PAY_APICLIENT_KEY', '微信APP支付', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('35', 'sign_type', 'text', 'ALIPAY_SIGN_TYPE', '支付宝', 'RSA2', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('36', 'app_id', 'text', 'ALIPAY_APP_ID', '支付宝', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('37', 'private_key', 'textarea', 'ALIPAY_PRIVATE_KEY', '支付宝', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('38', 'ali_public_key', 'textarea', 'ALIPAY_PUBLIC_KEY', '支付宝', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('39', 'QQ Key', 'text', 'QQ_APP_KEY', '社交登录', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('40', 'QQ Secret', 'text', 'QQ_APP_SECRET', '社交登录', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('41', '微博 Key', 'text', 'WEIBO_APP_KEY', '社交登录', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('42', '微博 Secret', 'text', 'WEIBO_APP_SECRET', '社交登录', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('43', '微信 Key', 'text', 'WECHAT_APP_KEY', '社交登录', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('44', '微信 Secret', 'text', 'WECHAT_APP_SECRET', '社交登录', '', '', '1', null, null, null);
INSERT INTO `configs` VALUES ('45', '开发者模式', 'switch', 'APP_DEBUG', '基本', '1', '', '1', null, '2019-05-10 18:13:27', null);
INSERT INTO `configs` VALUES ('46', '测试图片', 'picture', 'TEST', '基本', '6', null, '1', '2019-05-10 15:22:49', '2019-05-10 18:21:09', '2019-05-10 18:21:09');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES ('1', null, '0', 'groupRecruitHeader.png', '20202', 'public/uploads/files/TBnMmcDTzZALtoU0aZuCYRcVeBxAPlOjUNI05zmd.png', 'cd4b1c0e6a95492c1d82f34751af4d5d', '1', '2019-05-10 15:18:19', '2019-05-10 15:18:19');
INSERT INTO `files` VALUES ('2', null, '0', 'login.png', '14710', 'public/uploads/files/1lpsWW5imDypJ3l4oZPgvwAwoMGhoOvEUhDItBad.png', 'e321e6b70a980f77105a9a7530ac6cef', '1', '2019-05-10 15:18:23', '2019-05-10 15:18:23');
INSERT INTO `files` VALUES ('3', null, '0', 'topbg.png', '13432', 'public/uploads/files/jRn1waL4hk1bqDBZjgs6FHTuYapdV1KOHaYfSCRC.png', 'ce49fea5dc3fd2eba84dae70c0a7aacb', '1', '2019-05-10 17:20:13', '2019-05-10 17:20:13');
INSERT INTO `files` VALUES ('4', null, '0', 'expired.png', '10783', 'public/uploads/files/XjpPfPQ8G5TYocOAX9ULpyTttL1S1QkArCRaYavM.png', '3c1a1a2f64ae2bc39677d69f796e0a26', '1', '2019-05-10 17:26:24', '2019-05-10 17:26:24');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', '文章管理', 'admin', 'file-word', '0', '0', '/article', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('2', '文章列表', 'admin', '', '1', '0', '/article/index', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('3', '发布文章', 'admin', '', '1', '0', '/article/create', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('4', '我的文章', 'admin', '', '1', '0', '/article/myPublished', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('5', '单页管理', 'admin', 'file-ppt', '0', '0', '/page', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('6', '单页列表', 'admin', '', '5', '0', '/page/index', '1', '1', null, '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('7', '添加单页', 'admin', '', '5', '0', '/page/create', '1', '1', null, '2019-05-09 19:01:02');
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
INSERT INTO `menus` VALUES ('36', '编辑文章', 'admin', '', '1', '0', '', '0', '1', '2019-05-09 09:44:00', '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('39', '控制台', 'admin', 'home', '0', '-1', '/console', '1', '1', '2019-05-09 18:17:44', '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('40', '基础权限', 'admin', '', '39', '0', '', '0', '1', '2019-05-09 18:21:33', '2019-05-09 19:01:02');
INSERT INTO `menus` VALUES ('41', '主页', 'admin', '', '39', '0', '/console/index', '1', '1', '2019-05-13 14:41:55', '2019-05-13 14:41:55');

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
INSERT INTO `model_has_roles` VALUES ('7', 'App\\Models\\Admin', '1');
INSERT INTO `model_has_roles` VALUES ('7', 'App\\Models\\Admin', '2');
INSERT INTO `model_has_roles` VALUES ('7', 'App\\Models\\Admin', '4');
INSERT INTO `model_has_roles` VALUES ('7', 'App\\Models\\Admin', '5');

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
INSERT INTO `navigations` VALUES ('1', '0', '0', '首页', '/index/index', '0', '1', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);
INSERT INTO `navigations` VALUES ('2', '0', '0', '新闻', '/article/lists?name=news', '0', '1', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);
INSERT INTO `navigations` VALUES ('3', '0', '0', '商城', '/goods/lists?name=mall', '0', '1', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);
INSERT INTO `navigations` VALUES ('4', '0', '0', '关于', '/page/index?name=aboutus', '0', '1', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);

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
INSERT INTO `oauth_access_tokens` VALUES ('00a02d59faade06c937d30969ca3e6f0c70ecece0c8c8a81102a1a656ca9cad3c8cad9aa42e9e217', '1', '1', 'FullStack', '[]', '0', '2019-05-09 18:50:58', '2019-05-09 18:50:58', '2020-05-09 18:50:58');
INSERT INTO `oauth_access_tokens` VALUES ('02447d5eae69ea14b5828e2f374a635e348202c4c879a6ef74b0bfa87e123e2ed46bc0b985358718', '1', '1', 'FullStack', '[]', '0', '2019-04-05 09:35:45', '2019-04-05 09:35:45', '2020-04-05 09:35:45');
INSERT INTO `oauth_access_tokens` VALUES ('0415855644d8a21b6af81a6f9bd9b689446da814dd1a0c955eb0a016c9c63a2f721b03980342aaf1', '1', '1', 'FullStack', '[]', '0', '2019-04-03 14:59:39', '2019-04-03 14:59:39', '2020-04-03 14:59:39');
INSERT INTO `oauth_access_tokens` VALUES ('0704b5fc6210067dbcae177552f2d84d57bfd182a480f965b66043b317d76404ac79eb64a6204f55', '1', '1', 'FullStack', '[]', '0', '2019-05-05 16:53:20', '2019-05-05 16:53:20', '2020-05-05 16:53:20');
INSERT INTO `oauth_access_tokens` VALUES ('0c3ffaf1fbb97ee5aaf11abff97c851d30cb0040e8961f34430d75aea56555a181e3a84be20ff63e', '1', '1', 'FullStack', '[]', '0', '2019-05-09 14:56:10', '2019-05-09 14:56:10', '2020-05-09 14:56:10');
INSERT INTO `oauth_access_tokens` VALUES ('0ce5dc50d095b4250347b4867768273d2254825aaa8456532bb3d9eab4dd563873722865377d96eb', '1', '1', 'FullStack', '[]', '0', '2019-05-08 09:37:18', '2019-05-08 09:37:18', '2020-05-08 09:37:18');
INSERT INTO `oauth_access_tokens` VALUES ('1647d85a5e5464cd6811f45fa40e14f5e43428c7fe97b1a872ae281d2a777f8be7d1dbc9a5b8c1f8', '1', '1', 'FullStack', '[]', '0', '2019-05-08 13:59:10', '2019-05-08 13:59:10', '2020-05-08 13:59:10');
INSERT INTO `oauth_access_tokens` VALUES ('1ad93d755c104c4d7c5ccf87d3acf0202a37a750799fb6fec89740d96e8f1d6fc8458b99b736189b', '1', '1', 'FullStack', '[]', '0', '2019-04-04 08:57:15', '2019-04-04 08:57:15', '2020-04-04 08:57:15');
INSERT INTO `oauth_access_tokens` VALUES ('1b3cf6ac0a26c1b72258f74a860c10e7e636657723ba86226455ff3ea3ec8aeed15aeaca75ff376f', '1', '1', 'FullStack', '[]', '0', '2019-05-06 13:58:51', '2019-05-06 13:58:51', '2020-05-06 13:58:51');
INSERT INTO `oauth_access_tokens` VALUES ('1d196a4034c5af02a7a465f8bd8ead6e1ae25f7964e68132d75a90b8821a494905393b6558892cc6', '1', '1', 'FullStack', '[]', '0', '2019-05-16 11:39:29', '2019-05-16 11:39:29', '2020-05-16 11:39:29');
INSERT INTO `oauth_access_tokens` VALUES ('208224488488cd2a964e24cb6a6eb36860fea826815ddf6903b1aa2a63fd92af12a6d569fc5b926b', '1', '1', 'FullStack', '[]', '0', '2019-05-15 12:01:54', '2019-05-15 12:01:54', '2020-05-15 12:01:54');
INSERT INTO `oauth_access_tokens` VALUES ('25039f26a22df892dfc4333873222e868974218c887a9c33accef8d114b4a757cb650cd7af392983', '1', '1', 'FullStack', '[]', '0', '2019-05-07 11:10:55', '2019-05-07 11:10:55', '2020-05-07 11:10:55');
INSERT INTO `oauth_access_tokens` VALUES ('260e75939165922b584813e62c2769966853a203df3c502fa104df5fad9169aa8db95bc356171c4f', '1', '1', 'FullStack', '[]', '0', '2019-04-09 14:47:36', '2019-04-09 14:47:36', '2020-04-09 14:47:36');
INSERT INTO `oauth_access_tokens` VALUES ('26d71b7901b7832f7f2237f501058189423492af065b69bcd75ca96eaa22ddd3bd1c4be469d4d805', '5', '1', 'FullStack', '[]', '0', '2019-05-20 17:58:01', '2019-05-20 17:58:01', '2020-05-20 17:58:01');
INSERT INTO `oauth_access_tokens` VALUES ('2db7a654b7166e1eca3f250256f986ec48d8896df09bd91b297c0035de784f6c9b57fc7c1fc683c6', '1', '1', 'FullStack', '[]', '0', '2019-05-09 18:11:28', '2019-05-09 18:11:28', '2020-05-09 18:11:28');
INSERT INTO `oauth_access_tokens` VALUES ('391b45e3fd6c7852686a3032c9aec3ff10795b227469447af5e0b595396f064af83dff1ec2820306', '1', '1', 'FullStack', '[]', '0', '2019-05-20 18:59:46', '2019-05-20 18:59:46', '2020-05-20 18:59:46');
INSERT INTO `oauth_access_tokens` VALUES ('3970f8ee251b0c979dc95ddc03f467210327eb197ad8f783d154b56f206ab2784ab60cbc0db220d6', '1', '1', 'FullStack', '[]', '0', '2019-05-14 08:04:52', '2019-05-14 08:04:52', '2020-05-14 08:04:52');
INSERT INTO `oauth_access_tokens` VALUES ('3adacfac6731622ace23f37dd1de7259327a9079ff87d3d34048617a652b9928c8f303701a6c16fd', '1', '1', 'FullStack', '[]', '0', '2019-05-09 18:13:17', '2019-05-09 18:13:17', '2020-05-09 18:13:17');
INSERT INTO `oauth_access_tokens` VALUES ('3addd96ffb8a15ce9c867d5260115eecf9c611b88a81ef3c95ec733631854a3f03f849c644c1a60c', '1', '1', 'FullStack', '[]', '0', '2019-05-28 10:07:07', '2019-05-28 10:07:07', '2020-05-28 10:07:07');
INSERT INTO `oauth_access_tokens` VALUES ('3b915e8488195a45c15cf4a0283c512f89d88f07d515afefca03ca9510952673d76eb22e052f2389', '1', '1', 'FullStack', '[]', '0', '2019-05-09 11:42:20', '2019-05-09 11:42:20', '2020-05-09 11:42:20');
INSERT INTO `oauth_access_tokens` VALUES ('3d6c2fad2b8ff2e53996beb66843efb4abf6bf2b145f8bfae8b5d2b2827b3bcc44c4d339c6afd86a', '1', '1', 'FullStack', '[]', '0', '2019-05-21 10:49:10', '2019-05-21 10:49:10', '2020-05-21 10:49:10');
INSERT INTO `oauth_access_tokens` VALUES ('47f84fe347b1aeb99f551c37ca3a50865c3cdebc6f102fc68a2075f041a7b027ece3628d3164c676', '1', '1', 'FullStack', '[]', '0', '2019-05-13 17:09:53', '2019-05-13 17:09:53', '2020-05-13 17:09:53');
INSERT INTO `oauth_access_tokens` VALUES ('4e9147d888e56bb0ee8d6a9c54e53b59e0860dc4da6e6a3ceecc14a68f8066ef2020d4d0f34dee92', '1', '1', 'FullStack', '[]', '0', '2019-05-09 15:31:59', '2019-05-09 15:31:59', '2020-05-09 15:31:59');
INSERT INTO `oauth_access_tokens` VALUES ('52193a64577fa6a1641395ac5499a32fc44057e75d15c29bb8f6b8b5546653b2de481d573e3c73eb', '1', '1', 'FullStack', '[]', '0', '2019-05-13 14:03:32', '2019-05-13 14:03:32', '2020-05-13 14:03:32');
INSERT INTO `oauth_access_tokens` VALUES ('54a1e5802510d2d0e44ee13f55387d1e586116d218a6306f83e4fdf7f9d5d44bd93d801dd1ec3d09', '1', '1', 'FullStack', '[]', '0', '2019-05-07 18:49:32', '2019-05-07 18:49:32', '2020-05-07 18:49:32');
INSERT INTO `oauth_access_tokens` VALUES ('57c2b02606ff4f0e54ab6991aea68f7eee2a9e6820f735a921ab227a43b3681a238360312710b3a6', '1', '1', 'FullStack', '[]', '0', '2019-05-09 15:33:51', '2019-05-09 15:33:51', '2020-05-09 15:33:51');
INSERT INTO `oauth_access_tokens` VALUES ('595109a3f40c00e2def122dae4b73d9a667e1188bc57cc8222ac97ee260a6126c0900294b6618ce6', '5', '1', 'FullStack', '[]', '0', '2019-05-09 18:40:43', '2019-05-09 18:40:43', '2020-05-09 18:40:43');
INSERT INTO `oauth_access_tokens` VALUES ('5c61dd221f0c7377c99bddea5b1ab29921a1be0ccddabdaeb1e29504dd924cb4b188924660e35ff3', '1', '1', 'FullStack', '[]', '0', '2019-05-27 17:27:38', '2019-05-27 17:27:38', '2020-05-27 17:27:38');
INSERT INTO `oauth_access_tokens` VALUES ('5dbefbf901d077ba21ab4b92d63d00c1405ec56c9a3db5d2a6a09d536c03daea84c5ee401a79d62b', '1', '1', 'FullStack', '[]', '0', '2019-05-15 09:01:17', '2019-05-15 09:01:17', '2020-05-15 09:01:17');
INSERT INTO `oauth_access_tokens` VALUES ('5e3d56de28029b824cccf48c6557c6f08e6135ecf2622e00fa2b2c8ad73943d287f0c6cc85d4d3bf', '1', '1', 'FullStack', '[]', '0', '2019-05-20 10:27:55', '2019-05-20 10:27:55', '2020-05-20 10:27:55');
INSERT INTO `oauth_access_tokens` VALUES ('5f3e734c227f179e707bec293c0c6820b82095a162e60d5dea589edab98d05ca7bba7e98725f194a', '1', '1', 'FullStack', '[]', '0', '2019-05-08 17:05:09', '2019-05-08 17:05:09', '2020-05-08 17:05:09');
INSERT INTO `oauth_access_tokens` VALUES ('62fd49e0c87e49d6dd427732c51c0ae3d60aa8dc7e95bb5e0a69c0f24857d980bcd8295d910e0558', '1', '1', 'FullStack', '[]', '0', '2019-05-07 15:49:14', '2019-05-07 15:49:14', '2020-05-07 15:49:14');
INSERT INTO `oauth_access_tokens` VALUES ('6584a000720d5a8820b2a550a8041fc38a34b4a63a486db52fa9b43dd220a4c731076f9a94009605', '1', '1', 'FullStack', '[]', '0', '2019-05-05 17:05:34', '2019-05-05 17:05:34', '2020-05-05 17:05:34');
INSERT INTO `oauth_access_tokens` VALUES ('660fc5ce87113a901adfcec4f715b69516792db5d61f9a7190d0d797cdc89ae89147a465e7c6950b', '1', '1', 'FullStack', '[]', '0', '2019-05-14 11:07:59', '2019-05-14 11:07:59', '2020-05-14 11:07:59');
INSERT INTO `oauth_access_tokens` VALUES ('668dfb86abb52525ed0945558a681f97abab2ae1130187bae8939371085abea129154b17bbdd723e', '1', '1', 'FullStack', '[]', '0', '2019-05-06 13:56:38', '2019-05-06 13:56:38', '2020-05-06 13:56:38');
INSERT INTO `oauth_access_tokens` VALUES ('6c0e53c4585ed299d533f585e195bc29f2286639cfb526e35a2f2b7c54dd5efa8f0e2dd5a2100525', '1', '1', 'FullStack', '[]', '0', '2019-05-27 11:00:49', '2019-05-27 11:00:49', '2020-05-27 11:00:49');
INSERT INTO `oauth_access_tokens` VALUES ('6d38b85cd166f890d89bed3c444f434ba30c720299e0851b26d9ae3df412c85122f8a6658581efa0', '1', '1', 'FullStack', '[]', '0', '2019-05-06 16:59:47', '2019-05-06 16:59:47', '2020-05-06 16:59:47');
INSERT INTO `oauth_access_tokens` VALUES ('6e34bb2f4712c76c67242482838c19751e68882dfb279110cc98c900c853535d3d604bc46b7182cc', '5', '1', 'FullStack', '[]', '0', '2019-05-09 18:38:27', '2019-05-09 18:38:27', '2020-05-09 18:38:27');
INSERT INTO `oauth_access_tokens` VALUES ('6ffaf872345d256c0a41335c998de344308d5c56983aec80f5aa6030ab26fc373f4256aeeca12187', '1', '1', 'FullStack', '[]', '0', '2019-05-07 18:51:16', '2019-05-07 18:51:16', '2020-05-07 18:51:16');
INSERT INTO `oauth_access_tokens` VALUES ('75624e62bcc136a1147358aacc45ea36f6a4c00a59f59f35e09d014cc09a33c322ff176be34167db', '1', '1', 'FullStack', '[]', '0', '2019-05-14 18:06:04', '2019-05-14 18:06:04', '2020-05-14 18:06:04');
INSERT INTO `oauth_access_tokens` VALUES ('759d274291206c6d9f3727298782fb2f7009d986957c12f4cd29ee2fc9aa47acea429ef9a6d8ccbb', '1', '1', 'FullStack', '[]', '0', '2019-05-06 17:03:52', '2019-05-06 17:03:52', '2020-05-06 17:03:52');
INSERT INTO `oauth_access_tokens` VALUES ('76206739043460b4d009abafb94e4cb6790027f19735932451529e3469e235253ab923187e79509a', '1', '1', 'FullStack', '[]', '0', '2019-04-30 19:04:12', '2019-04-30 19:04:12', '2020-04-30 19:04:12');
INSERT INTO `oauth_access_tokens` VALUES ('76bdd95db95613ef981d742cfc3b567563c0dc961749738546a53c8899520a1a51e3d9f8d1d1f4e3', '1', '1', 'FullStack', '[]', '0', '2019-05-10 17:06:30', '2019-05-10 17:06:30', '2020-05-10 17:06:30');
INSERT INTO `oauth_access_tokens` VALUES ('780ad2af80c1c9de0d4443129ba40fdf94b8cdb9febd18a9900e6e530d67b39439f49caac8ad8f7c', '5', '1', 'FullStack', '[]', '0', '2019-05-09 18:10:41', '2019-05-09 18:10:41', '2020-05-09 18:10:41');
INSERT INTO `oauth_access_tokens` VALUES ('7f5f01a873f6e9e15dd64044265d29fd98fd40d41d0f67d90c4b37cc0f88d66a4c7b8d186977aff7', '1', '1', 'FullStack', '[]', '0', '2019-05-13 17:10:04', '2019-05-13 17:10:04', '2020-05-13 17:10:04');
INSERT INTO `oauth_access_tokens` VALUES ('840590f6a0d9f25241cb81c71a1e99e5cb70e93491f45adc94d858b8d7426ed5555f1eb3f5d34016', '1', '1', 'FullStack', '[]', '0', '2019-05-27 15:31:14', '2019-05-27 15:31:14', '2020-05-27 15:31:14');
INSERT INTO `oauth_access_tokens` VALUES ('8481f40518a3292312befded6831a0fb009153f568cb40c7bc2e48b88caa83c95b7bf072449463b7', '1', '1', 'FullStack', '[]', '0', '2019-04-03 15:11:06', '2019-04-03 15:11:06', '2020-04-03 15:11:06');
INSERT INTO `oauth_access_tokens` VALUES ('84ca628236fe5074ad6b4bef1628ecae22f7850356651e9742f1a9c50b2758e001707e1a1b1bcc62', '1', '1', 'FullStack', '[]', '0', '2019-05-15 15:06:21', '2019-05-15 15:06:21', '2020-05-15 15:06:21');
INSERT INTO `oauth_access_tokens` VALUES ('87f0bc087c844398d6f63c8c5a01a143a8eb7c632916f680ac2d0457c98c2f509d70b4183b25baaa', '1', '1', 'FullStack', '[]', '0', '2019-04-05 09:31:27', '2019-04-05 09:31:27', '2020-04-05 09:31:27');
INSERT INTO `oauth_access_tokens` VALUES ('8cbda48075cfb71cd421e1816af16ecc58bf2623fcb451d02ad434f548e17dd7e7ea5db278014de8', '1', '1', 'FullStack', '[]', '0', '2019-05-14 14:14:29', '2019-05-14 14:14:29', '2020-05-14 14:14:29');
INSERT INTO `oauth_access_tokens` VALUES ('9037ce3877b0dc7d1de82b70574bf9f7b1b6edb622590b83949f2d0f966ee1c5424a1ec68931b0cf', '1', '1', 'FullStack', '[]', '0', '2019-05-09 18:35:55', '2019-05-09 18:35:55', '2020-05-09 18:35:55');
INSERT INTO `oauth_access_tokens` VALUES ('945915b8e74b7919fd08a670c35be7387fd8f867ef2add7ff2d5b311dea7b529bb648957ce608198', '1', '1', 'FullStack', '[]', '0', '2019-05-09 08:39:56', '2019-05-09 08:39:56', '2020-05-09 08:39:56');
INSERT INTO `oauth_access_tokens` VALUES ('9a9d2f7376268ccc7e0d07eb90791bb1aaac94f1ef3e3b98cc25d745be93eecfc4299ae6d22d62b8', '1', '1', 'FullStack', '[]', '0', '2019-04-02 16:02:46', '2019-04-02 16:02:46', '2020-04-02 16:02:46');
INSERT INTO `oauth_access_tokens` VALUES ('9ccdd2c3759eeb0c0fb2487a9323406285fe7a9b5af96d2b5039c8bd712e7ff60a9777816d6ccbad', '1', '1', 'FullStack', '[]', '0', '2019-05-01 16:06:37', '2019-05-01 16:06:37', '2020-05-01 16:06:37');
INSERT INTO `oauth_access_tokens` VALUES ('9f6265af12df43e43d603b164d9139bf1f21de1f831373a94a05c669d0c32d3a8d5bdbf8ffed394e', '5', '1', 'FullStack', '[]', '0', '2019-05-20 17:56:05', '2019-05-20 17:56:05', '2020-05-20 17:56:05');
INSERT INTO `oauth_access_tokens` VALUES ('a71e84253aa7c9905609778afde06d61d4363f4660d27cc4ecc91b35b9fc0959dd5a40b4e594f054', '1', '1', 'FullStack', '[]', '0', '2019-05-13 17:05:18', '2019-05-13 17:05:18', '2020-05-13 17:05:18');
INSERT INTO `oauth_access_tokens` VALUES ('a95729c97be3274a0ee77f34b1bcd73ad90adeff906406c6d8c769148321033abd4d0ed7fce581a3', '1', '1', 'FullStack', '[]', '0', '2019-05-13 17:09:44', '2019-05-13 17:09:44', '2020-05-13 17:09:44');
INSERT INTO `oauth_access_tokens` VALUES ('aa4a943866dc771cc4410f0472e528e94eec8ec173b540bd71f930eb993991f364e293e19f6d0369', '1', '1', 'FullStack', '[]', '0', '2019-05-10 13:50:06', '2019-05-10 13:50:06', '2020-05-10 13:50:06');
INSERT INTO `oauth_access_tokens` VALUES ('af51a98e4b7bbdd1127bb20292c36c8b103670ae591e867acb1ca9cf4af78ded2c3bbc4aa9217073', '1', '1', 'FullStack', '[]', '0', '2019-04-05 09:21:05', '2019-04-05 09:21:05', '2020-04-05 09:21:05');
INSERT INTO `oauth_access_tokens` VALUES ('b53e790bcf194c8ebb737586d477dd1640d6b510b2909bb2ea918e648762e51af06b2d69b07f454c', '5', '1', 'FullStack', '[]', '0', '2019-05-20 18:21:32', '2019-05-20 18:21:32', '2020-05-20 18:21:32');
INSERT INTO `oauth_access_tokens` VALUES ('b9c4c31365a96148f34b81e79f1dd0cbccaa7bcd1eb97e3da8708824d8b45da21d511272c226e7ea', '5', '1', 'FullStack', '[]', '0', '2019-05-09 18:32:22', '2019-05-09 18:32:22', '2020-05-09 18:32:22');
INSERT INTO `oauth_access_tokens` VALUES ('bdbefd3260c29c068e0b7bb96a03599dc5fd40286a914cdeea90567e56c8b5d2aa66be1478b1867e', '1', '1', 'FullStack', '[]', '0', '2019-05-13 17:10:19', '2019-05-13 17:10:19', '2020-05-13 17:10:19');
INSERT INTO `oauth_access_tokens` VALUES ('c26fb34f695e7816815839f54f50b3cbf96c6b4a37ff73456779a25b8c4eb9c48e279e2ff350c4fc', '1', '1', 'FullStack', '[]', '0', '2019-05-06 09:17:22', '2019-05-06 09:17:22', '2020-05-06 09:17:22');
INSERT INTO `oauth_access_tokens` VALUES ('ca34792b7146e9cadefe0eb897475b660f41f82fc18657a501b155ddf48d6384d3cc64e80228a706', '1', '1', 'FullStack', '[]', '0', '2019-05-23 14:28:58', '2019-05-23 14:28:58', '2020-05-23 14:28:58');
INSERT INTO `oauth_access_tokens` VALUES ('cd89a320560a478d668d5eb1ef6d8f25da98d878b7d80a158fdff156dca89b69ccf63d0ab6b3ef20', '1', '1', 'FullStack', '[]', '0', '2019-05-10 17:08:03', '2019-05-10 17:08:03', '2020-05-10 17:08:03');
INSERT INTO `oauth_access_tokens` VALUES ('ce2795ef60276bda6616d56d4e9eb6e2d037550f8e174fa3d337b325a24ffb14927d115fa8ba27f2', '1', '1', 'FullStack', '[]', '0', '2019-05-05 17:17:27', '2019-05-05 17:17:27', '2020-05-05 17:17:27');
INSERT INTO `oauth_access_tokens` VALUES ('d31a8b6db98b92449f96b4a63cbbed537c33afa58e314c539992d4bcc90d62e042970ae5113b3b98', '1', '1', 'FullStack', '[]', '0', '2019-05-13 08:29:03', '2019-05-13 08:29:03', '2020-05-13 08:29:03');
INSERT INTO `oauth_access_tokens` VALUES ('d78ff1fcbf0ef40cd0ac9b1679ab7b4f4adfa5bad2b08b3b69910f6c85b71c7b6c66aafaf0eaeb1a', '1', '1', 'FullStack', '[]', '0', '2019-05-13 10:56:00', '2019-05-13 10:56:00', '2020-05-13 10:56:00');
INSERT INTO `oauth_access_tokens` VALUES ('d7a9edec3723670e93592d3e94e16858f5f8676224aee008fd8f07249ad98c21a3a73eb327d35b68', '1', '1', 'FullStack', '[]', '0', '2019-04-03 09:37:12', '2019-04-03 09:37:12', '2020-04-03 09:37:12');
INSERT INTO `oauth_access_tokens` VALUES ('d94a6cb867bd9c4277972c4bf2d2f8fc31cefacabdcf43276ed76834a50cc289103da48f9f593a35', '1', '1', 'FullStack', '[]', '0', '2019-05-17 16:51:11', '2019-05-17 16:51:11', '2020-05-17 16:51:11');
INSERT INTO `oauth_access_tokens` VALUES ('db2e519a6d2adc0ac05ba7c55044dc31d046dc9e7ced4a199d11f48715094dbd4e362faad532924a', '1', '1', 'FullStack', '[]', '0', '2019-05-05 16:45:55', '2019-05-05 16:45:55', '2020-05-05 16:45:55');
INSERT INTO `oauth_access_tokens` VALUES ('dc6e315f234ca4e0a504c6a88dbeb7950b383bb5a64179df4b5f96909552761eb98c678b7d8130fc', '1', '1', 'FullStack', '[]', '0', '2019-05-15 12:01:48', '2019-05-15 12:01:48', '2020-05-15 12:01:48');
INSERT INTO `oauth_access_tokens` VALUES ('e0f09efb595fb1ecb5eaf7a822b2ccc9500b4c820b36059ecf22f946c77b920df9b4264cae60ca8f', '1', '1', 'FullStack', '[]', '0', '2019-05-09 18:37:42', '2019-05-09 18:37:42', '2020-05-09 18:37:42');
INSERT INTO `oauth_access_tokens` VALUES ('e119a9f3567290bfcca90adc40317e9b097509789ccea828aec57217fd278cb7d7c6f70e45bbc95b', '5', '1', 'FullStack', '[]', '0', '2019-05-20 17:59:18', '2019-05-20 17:59:18', '2020-05-20 17:59:18');
INSERT INTO `oauth_access_tokens` VALUES ('ec1c39cab432a926224792ae8a0d0ada43380c8329fa58bd819e1bec0266f83062f3362f01f29835', '1', '1', 'FullStack', '[]', '0', '2019-05-13 17:11:55', '2019-05-13 17:11:55', '2020-05-13 17:11:55');
INSERT INTO `oauth_access_tokens` VALUES ('f163ef81e34c27558aa15ec4af2271e8fc44297c801bbb7c48d9ed36758ea3a208fb60f48fa40f21', '1', '1', 'FullStack', '[]', '0', '2019-05-13 17:46:18', '2019-05-13 17:46:18', '2020-05-13 17:46:18');
INSERT INTO `oauth_access_tokens` VALUES ('f90d34caf1f1e81352fcdcf250fc048f59b6db3bd8896c72d48755da67fec007c3b26c5aa826561c', '1', '1', 'FullStack', '[]', '0', '2019-05-10 08:20:38', '2019-05-10 08:20:38', '2020-05-10 08:20:38');
INSERT INTO `oauth_access_tokens` VALUES ('fd2deaf7f576e4565b47024b53e933fd495e0b4d780ae64ccb6b0d2baacb8bf687cf8abe459253dd', '1', '1', 'FullStack', '[]', '0', '2019-05-08 14:02:04', '2019-05-08 14:02:04', '2020-05-08 14:02:04');
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
  `menu_id` int(11) NOT NULL DEFAULT '0' COMMENT '菜单id',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '0', 'api/admin/login', 'admin', '2019-05-06 15:00:48', '2019-05-06 15:00:48');
INSERT INTO `permissions` VALUES ('2', '44', 'api/admin/logout', 'admin', '2019-05-06 15:00:48', '2019-05-08 18:17:45');
INSERT INTO `permissions` VALUES ('3', '50', 'api/admin/loginErrorTimes', 'admin', '2019-05-06 15:00:48', '2019-05-08 18:50:58');
INSERT INTO `permissions` VALUES ('4', '49', 'api/admin/tool/captcha', 'admin', '2019-05-06 15:00:48', '2019-05-08 18:48:57');
INSERT INTO `permissions` VALUES ('5', '50', 'api/admin/tool/qrcode', 'admin', '2019-05-06 15:00:48', '2019-05-08 18:50:58');
INSERT INTO `permissions` VALUES ('6', '48', 'api/admin/tool/sms', 'admin', '2019-05-06 15:00:48', '2019-05-08 18:40:25');
INSERT INTO `permissions` VALUES ('7', '0', 'api/admin/tool/email', 'admin', '2019-05-06 15:00:48', '2019-05-06 15:00:48');
INSERT INTO `permissions` VALUES ('8', '0', 'api/admin/tool/getPicture', 'admin', '2019-05-06 15:00:48', '2019-05-06 15:00:48');
INSERT INTO `permissions` VALUES ('9', '47', 'api/admin/tool/uploadPicture', 'admin', '2019-05-06 15:00:48', '2019-05-08 18:37:58');
INSERT INTO `permissions` VALUES ('10', '47', 'api/admin/tool/uploadFile', 'admin', '2019-05-06 15:00:48', '2019-05-08 18:37:58');
INSERT INTO `permissions` VALUES ('11', '0', 'api/admin/tool/uploadPictureFromBase64', 'admin', '2019-05-06 15:00:48', '2019-05-06 15:00:48');
INSERT INTO `permissions` VALUES ('12', '0', 'api/admin/tool/area', 'admin', '2019-05-06 15:00:48', '2019-05-06 15:00:48');
INSERT INTO `permissions` VALUES ('13', '0', 'api/admin/tool/clearCache', 'admin', '2019-05-06 15:00:48', '2019-05-06 15:00:48');
INSERT INTO `permissions` VALUES ('14', '40', 'api/admin/account/info', 'admin', '2019-05-06 15:00:48', '2019-05-09 18:51:36');
INSERT INTO `permissions` VALUES ('15', '0', 'api/admin/account/profile', 'admin', '2019-05-06 15:00:48', '2019-05-06 15:00:48');
INSERT INTO `permissions` VALUES ('16', '52', 'api/admin/account/password', 'admin', '2019-05-06 15:00:48', '2019-05-08 18:57:40');
INSERT INTO `permissions` VALUES ('17', '2', 'api/admin/article/index', 'admin', '2019-05-06 15:00:48', '2019-05-09 09:40:58');
INSERT INTO `permissions` VALUES ('18', '3', 'api/admin/article/create', 'admin', '2019-05-06 15:00:48', '2019-05-09 09:42:25');
INSERT INTO `permissions` VALUES ('19', '3', 'api/admin/article/store', 'admin', '2019-05-06 15:00:48', '2019-05-09 09:42:25');
INSERT INTO `permissions` VALUES ('20', '36', 'api/admin/article/edit', 'admin', '2019-05-06 15:00:48', '2019-05-09 09:44:00');
INSERT INTO `permissions` VALUES ('21', '36', 'api/admin/article/save', 'admin', '2019-05-06 15:00:48', '2019-05-09 09:44:00');
INSERT INTO `permissions` VALUES ('22', '2', 'api/admin/article/destroy', 'admin', '2019-05-06 15:00:48', '2019-05-09 09:40:58');
INSERT INTO `permissions` VALUES ('23', '2', 'api/admin/article/changeStatus', 'admin', '2019-05-06 15:00:48', '2019-05-09 09:40:58');
INSERT INTO `permissions` VALUES ('24', '4', 'api/admin/article/myPublished', 'admin', '2019-05-06 15:00:48', '2019-05-09 09:42:47');
INSERT INTO `permissions` VALUES ('25', '6', 'api/admin/page/index', 'admin', '2019-05-06 15:00:49', '2019-05-09 16:03:21');
INSERT INTO `permissions` VALUES ('26', '7', 'api/admin/page/create', 'admin', '2019-05-06 15:00:49', '2019-05-09 16:02:57');
INSERT INTO `permissions` VALUES ('27', '7', 'api/admin/page/store', 'admin', '2019-05-06 15:00:49', '2019-05-09 16:02:57');
INSERT INTO `permissions` VALUES ('28', '0', 'api/admin/page/edit', 'admin', '2019-05-06 15:00:49', '2019-05-09 18:31:32');
INSERT INTO `permissions` VALUES ('29', '0', 'api/admin/page/save', 'admin', '2019-05-06 15:00:49', '2019-05-09 18:31:32');
INSERT INTO `permissions` VALUES ('30', '6', 'api/admin/page/destroy', 'admin', '2019-05-06 15:00:49', '2019-05-09 16:03:21');
INSERT INTO `permissions` VALUES ('31', '6', 'api/admin/page/changeStatus', 'admin', '2019-05-06 15:00:49', '2019-05-09 16:03:21');
INSERT INTO `permissions` VALUES ('32', '0', 'api/admin/groupbuyShop/index', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('33', '0', 'api/admin/groupbuyShop/create', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('34', '0', 'api/admin/groupbuyShop/store', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('35', '0', 'api/admin/groupbuyShop/edit', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('36', '0', 'api/admin/groupbuyShop/save', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('37', '0', 'api/admin/groupbuyShop/destroy', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('38', '0', 'api/admin/groupbuyShop/changeStatus', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('39', '0', 'api/admin/groupbuyCategory/index', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('40', '0', 'api/admin/groupbuyCategory/create', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('41', '0', 'api/admin/groupbuyCategory/store', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('42', '0', 'api/admin/groupbuyCategory/edit', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('43', '0', 'api/admin/groupbuyCategory/save', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('44', '0', 'api/admin/groupbuyCategory/destroy', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('45', '0', 'api/admin/groupbuyCategory/changeStatus', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('46', '0', 'api/admin/groupbuyGoods/index', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('47', '0', 'api/admin/groupbuyGoods/edit', 'admin', '2019-05-06 15:00:49', '2019-05-06 15:00:49');
INSERT INTO `permissions` VALUES ('48', '0', 'api/admin/groupbuyGoods/save', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('49', '0', 'api/admin/groupbuyGoods/destroy', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('50', '0', 'api/admin/groupbuyGoods/changeStatus', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('51', '0', 'api/admin/groupbuyOrder/index', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('52', '0', 'api/admin/groupbuyOrder/edit', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('53', '0', 'api/admin/groupbuyOrder/save', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('54', '0', 'api/admin/groupbuyOrder/destroy', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('55', '0', 'api/admin/groupbuyOrder/changeStatus', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('56', '0', 'api/admin/user/index', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('57', '0', 'api/admin/user/create', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('58', '0', 'api/admin/user/store', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('59', '41', 'api/admin/user/edit', 'admin', '2019-05-06 15:00:50', '2019-05-08 18:03:02');
INSERT INTO `permissions` VALUES ('60', '41', 'api/admin/user/save', 'admin', '2019-05-06 15:00:50', '2019-05-08 18:03:02');
INSERT INTO `permissions` VALUES ('61', '0', 'api/admin/user/destroy', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('62', '0', 'api/admin/user/changeStatus', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('63', '0', 'api/admin/user/recharge', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('64', '0', 'api/admin/actionLog/index', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('65', '0', 'api/admin/actionLog/destroy', 'admin', '2019-05-06 15:00:50', '2019-05-06 15:00:50');
INSERT INTO `permissions` VALUES ('66', '0', 'api/admin/sms/index', 'admin', '2019-05-06 15:00:51', '2019-05-06 15:00:51');
INSERT INTO `permissions` VALUES ('67', '0', 'api/admin/sms/destroy', 'admin', '2019-05-06 15:00:51', '2019-05-06 15:00:51');
INSERT INTO `permissions` VALUES ('68', '0', 'api/admin/category/index', 'admin', '2019-05-06 15:00:51', '2019-05-06 15:00:51');
INSERT INTO `permissions` VALUES ('69', '0', 'api/admin/category/create', 'admin', '2019-05-06 15:00:51', '2019-05-06 15:00:51');
INSERT INTO `permissions` VALUES ('70', '0', 'api/admin/category/store', 'admin', '2019-05-06 15:00:51', '2019-05-06 15:00:51');
INSERT INTO `permissions` VALUES ('71', '0', 'api/admin/category/edit', 'admin', '2019-05-06 15:00:51', '2019-05-06 15:00:51');
INSERT INTO `permissions` VALUES ('72', '0', 'api/admin/category/save', 'admin', '2019-05-06 15:00:51', '2019-05-06 15:00:51');
INSERT INTO `permissions` VALUES ('73', '0', 'api/admin/category/destroy', 'admin', '2019-05-06 15:00:51', '2019-05-06 15:00:51');
INSERT INTO `permissions` VALUES ('74', '0', 'api/admin/category/changeStatus', 'admin', '2019-05-06 15:00:51', '2019-05-06 15:00:51');
INSERT INTO `permissions` VALUES ('75', '0', 'api/admin/web/edit', 'admin', '2019-05-06 15:00:51', '2019-05-06 15:00:51');
INSERT INTO `permissions` VALUES ('76', '0', 'api/admin/web/save', 'admin', '2019-05-06 15:00:51', '2019-05-06 15:00:51');
INSERT INTO `permissions` VALUES ('77', '0', 'api/admin/webConfig/index', 'admin', '2019-05-06 15:00:51', '2019-05-06 15:00:51');
INSERT INTO `permissions` VALUES ('78', '0', 'api/admin/webConfig/create', 'admin', '2019-05-06 15:00:51', '2019-05-06 15:00:51');
INSERT INTO `permissions` VALUES ('79', '0', 'api/admin/webConfig/store', 'admin', '2019-05-06 15:00:51', '2019-05-06 15:00:51');
INSERT INTO `permissions` VALUES ('80', '0', 'api/admin/webConfig/edit', 'admin', '2019-05-06 15:00:52', '2019-05-06 15:00:52');
INSERT INTO `permissions` VALUES ('81', '0', 'api/admin/webConfig/save', 'admin', '2019-05-06 15:00:52', '2019-05-06 15:00:52');
INSERT INTO `permissions` VALUES ('82', '0', 'api/admin/webConfig/changeStatus', 'admin', '2019-05-06 15:00:52', '2019-05-06 15:00:52');
INSERT INTO `permissions` VALUES ('83', '0', 'api/admin/webConfig/changeMultiStatus', 'admin', '2019-05-06 15:00:52', '2019-05-06 15:00:52');
INSERT INTO `permissions` VALUES ('84', '0', 'api/admin/webConfig/destroy', 'admin', '2019-05-06 15:00:52', '2019-05-06 15:00:52');
INSERT INTO `permissions` VALUES ('85', '0', 'api/admin/navigation/index', 'admin', '2019-05-06 15:00:52', '2019-05-06 15:00:52');
INSERT INTO `permissions` VALUES ('86', '0', 'api/admin/navigation/create', 'admin', '2019-05-06 15:00:52', '2019-05-06 15:00:52');
INSERT INTO `permissions` VALUES ('87', '0', 'api/admin/navigation/store', 'admin', '2019-05-06 15:00:52', '2019-05-06 15:00:52');
INSERT INTO `permissions` VALUES ('88', '0', 'api/admin/navigation/edit', 'admin', '2019-05-06 15:00:52', '2019-05-06 15:00:52');
INSERT INTO `permissions` VALUES ('89', '0', 'api/admin/navigation/save', 'admin', '2019-05-06 15:00:52', '2019-05-06 15:00:52');
INSERT INTO `permissions` VALUES ('90', '0', 'api/admin/navigation/destroy', 'admin', '2019-05-06 15:00:52', '2019-05-06 15:00:52');
INSERT INTO `permissions` VALUES ('91', '0', 'api/admin/navigation/changeStatus', 'admin', '2019-05-06 15:00:52', '2019-05-06 15:00:52');
INSERT INTO `permissions` VALUES ('92', '0', 'api/admin/banner/index', 'admin', '2019-05-06 15:00:52', '2019-05-06 15:00:52');
INSERT INTO `permissions` VALUES ('93', '0', 'api/admin/banner/create', 'admin', '2019-05-06 15:00:53', '2019-05-06 15:00:53');
INSERT INTO `permissions` VALUES ('94', '0', 'api/admin/banner/store', 'admin', '2019-05-06 15:00:53', '2019-05-06 15:00:53');
INSERT INTO `permissions` VALUES ('95', '0', 'api/admin/banner/edit', 'admin', '2019-05-06 15:00:53', '2019-05-06 15:00:53');
INSERT INTO `permissions` VALUES ('96', '0', 'api/admin/banner/save', 'admin', '2019-05-06 15:00:53', '2019-05-06 15:00:53');
INSERT INTO `permissions` VALUES ('97', '0', 'api/admin/banner/destroy', 'admin', '2019-05-06 15:00:53', '2019-05-06 15:00:53');
INSERT INTO `permissions` VALUES ('98', '0', 'api/admin/banner/changeStatus', 'admin', '2019-05-06 15:00:53', '2019-05-06 15:00:53');
INSERT INTO `permissions` VALUES ('99', '0', 'api/admin/bannerCategory/index', 'admin', '2019-05-06 15:00:53', '2019-05-06 15:00:53');
INSERT INTO `permissions` VALUES ('100', '0', 'api/admin/bannerCategory/create', 'admin', '2019-05-06 15:00:53', '2019-05-06 15:00:53');
INSERT INTO `permissions` VALUES ('101', '0', 'api/admin/bannerCategory/store', 'admin', '2019-05-06 15:00:53', '2019-05-06 15:00:53');
INSERT INTO `permissions` VALUES ('102', '0', 'api/admin/bannerCategory/edit', 'admin', '2019-05-06 15:00:53', '2019-05-06 15:00:53');
INSERT INTO `permissions` VALUES ('103', '0', 'api/admin/bannerCategory/save', 'admin', '2019-05-06 15:00:53', '2019-05-06 15:00:53');
INSERT INTO `permissions` VALUES ('104', '0', 'api/admin/bannerCategory/destroy', 'admin', '2019-05-06 15:00:53', '2019-05-06 15:00:53');
INSERT INTO `permissions` VALUES ('105', '0', 'api/admin/bannerCategory/changeStatus', 'admin', '2019-05-06 15:00:54', '2019-05-06 15:00:54');
INSERT INTO `permissions` VALUES ('106', '0', 'api/admin/file/index', 'admin', '2019-05-06 15:00:54', '2019-05-06 15:00:54');
INSERT INTO `permissions` VALUES ('107', '0', 'api/admin/file/upload', 'admin', '2019-05-06 15:00:54', '2019-05-06 15:00:54');
INSERT INTO `permissions` VALUES ('108', '0', 'api/admin/file/update', 'admin', '2019-05-06 15:00:54', '2019-05-06 15:00:54');
INSERT INTO `permissions` VALUES ('109', '0', 'api/admin/file/destroy', 'admin', '2019-05-06 15:00:54', '2019-05-06 15:00:54');
INSERT INTO `permissions` VALUES ('110', '0', 'api/admin/file/changeStatus', 'admin', '2019-05-06 15:00:54', '2019-05-06 15:00:54');
INSERT INTO `permissions` VALUES ('111', '0', 'api/admin/picture/index', 'admin', '2019-05-06 15:00:54', '2019-05-06 15:00:54');
INSERT INTO `permissions` VALUES ('112', '0', 'api/admin/picture/upload', 'admin', '2019-05-06 15:00:54', '2019-05-06 15:00:54');
INSERT INTO `permissions` VALUES ('113', '0', 'api/admin/picture/update', 'admin', '2019-05-06 15:00:54', '2019-05-06 15:00:54');
INSERT INTO `permissions` VALUES ('114', '0', 'api/admin/picture/edit', 'admin', '2019-05-06 15:00:54', '2019-05-06 15:00:54');
INSERT INTO `permissions` VALUES ('115', '0', 'api/admin/picture/save', 'admin', '2019-05-06 15:00:54', '2019-05-06 15:00:54');
INSERT INTO `permissions` VALUES ('116', '0', 'api/admin/picture/destroy', 'admin', '2019-05-06 15:00:55', '2019-05-06 15:00:55');
INSERT INTO `permissions` VALUES ('117', '0', 'api/admin/picture/changeStatus', 'admin', '2019-05-06 15:00:55', '2019-05-06 15:00:55');
INSERT INTO `permissions` VALUES ('118', '0', 'api/admin/comment/index', 'admin', '2019-05-06 15:00:55', '2019-05-06 15:00:55');
INSERT INTO `permissions` VALUES ('119', '0', 'api/admin/comment/edit', 'admin', '2019-05-06 15:00:55', '2019-05-06 15:00:55');
INSERT INTO `permissions` VALUES ('120', '0', 'api/admin/comment/save', 'admin', '2019-05-06 15:00:55', '2019-05-06 15:00:55');
INSERT INTO `permissions` VALUES ('121', '0', 'api/admin/comment/destroy', 'admin', '2019-05-06 15:00:55', '2019-05-06 15:00:55');
INSERT INTO `permissions` VALUES ('122', '0', 'api/admin/comment/changeStatus', 'admin', '2019-05-06 15:00:55', '2019-05-06 15:00:55');
INSERT INTO `permissions` VALUES ('123', '0', 'api/admin/link/index', 'admin', '2019-05-06 15:00:55', '2019-05-06 15:00:55');
INSERT INTO `permissions` VALUES ('124', '0', 'api/admin/link/create', 'admin', '2019-05-06 15:00:55', '2019-05-06 15:00:55');
INSERT INTO `permissions` VALUES ('125', '0', 'api/admin/link/store', 'admin', '2019-05-06 15:00:55', '2019-05-06 15:00:55');
INSERT INTO `permissions` VALUES ('126', '0', 'api/admin/link/edit', 'admin', '2019-05-06 15:00:56', '2019-05-06 15:00:56');
INSERT INTO `permissions` VALUES ('127', '0', 'api/admin/link/save', 'admin', '2019-05-06 15:00:56', '2019-05-06 15:00:56');
INSERT INTO `permissions` VALUES ('128', '0', 'api/admin/link/destroy', 'admin', '2019-05-06 15:00:56', '2019-05-06 15:00:56');
INSERT INTO `permissions` VALUES ('129', '0', 'api/admin/link/changeStatus', 'admin', '2019-05-06 15:00:56', '2019-05-06 15:00:56');
INSERT INTO `permissions` VALUES ('130', '0', 'api/admin/printer/index', 'admin', '2019-05-06 15:00:56', '2019-05-06 15:00:56');
INSERT INTO `permissions` VALUES ('131', '0', 'api/admin/printer/create', 'admin', '2019-05-06 15:00:56', '2019-05-06 15:00:56');
INSERT INTO `permissions` VALUES ('132', '0', 'api/admin/printer/store', 'admin', '2019-05-06 15:00:56', '2019-05-06 15:00:56');
INSERT INTO `permissions` VALUES ('133', '0', 'api/admin/printer/edit', 'admin', '2019-05-06 15:00:56', '2019-05-06 15:00:56');
INSERT INTO `permissions` VALUES ('134', '0', 'api/admin/printer/save', 'admin', '2019-05-06 15:00:56', '2019-05-06 15:00:56');
INSERT INTO `permissions` VALUES ('135', '0', 'api/admin/printer/destroy', 'admin', '2019-05-06 15:00:57', '2019-05-06 15:00:57');
INSERT INTO `permissions` VALUES ('136', '0', 'api/admin/printer/changeStatus', 'admin', '2019-05-06 15:00:57', '2019-05-06 15:00:57');
INSERT INTO `permissions` VALUES ('137', '0', 'api/admin/admin/index', 'admin', '2019-05-06 15:00:57', '2019-05-06 15:00:57');
INSERT INTO `permissions` VALUES ('138', '0', 'api/admin/admin/create', 'admin', '2019-05-06 15:00:57', '2019-05-06 15:00:57');
INSERT INTO `permissions` VALUES ('139', '0', 'api/admin/admin/store', 'admin', '2019-05-06 15:00:57', '2019-05-06 15:00:57');
INSERT INTO `permissions` VALUES ('140', '0', 'api/admin/admin/edit', 'admin', '2019-05-06 15:00:57', '2019-05-06 15:00:57');
INSERT INTO `permissions` VALUES ('141', '0', 'api/admin/admin/save', 'admin', '2019-05-06 15:00:57', '2019-05-06 15:00:57');
INSERT INTO `permissions` VALUES ('142', '0', 'api/admin/admin/destroy', 'admin', '2019-05-06 15:00:57', '2019-05-06 15:00:57');
INSERT INTO `permissions` VALUES ('143', '0', 'api/admin/admin/changeStatus', 'admin', '2019-05-06 15:00:57', '2019-05-06 15:00:57');
INSERT INTO `permissions` VALUES ('144', '0', 'api/admin/menu/index', 'admin', '2019-05-06 15:00:58', '2019-05-06 15:00:58');
INSERT INTO `permissions` VALUES ('145', '0', 'api/admin/menu/create', 'admin', '2019-05-06 15:00:58', '2019-05-06 15:00:58');
INSERT INTO `permissions` VALUES ('146', '0', 'api/admin/menu/store', 'admin', '2019-05-06 15:00:58', '2019-05-06 15:00:58');
INSERT INTO `permissions` VALUES ('147', '0', 'api/admin/menu/edit', 'admin', '2019-05-06 15:00:58', '2019-05-06 15:00:58');
INSERT INTO `permissions` VALUES ('148', '0', 'api/admin/menu/save', 'admin', '2019-05-06 15:00:58', '2019-05-06 15:00:58');
INSERT INTO `permissions` VALUES ('149', '0', 'api/admin/menu/destroy', 'admin', '2019-05-06 15:00:58', '2019-05-06 15:00:58');
INSERT INTO `permissions` VALUES ('150', '0', 'api/admin/menu/changeStatus', 'admin', '2019-05-06 15:00:58', '2019-05-06 15:00:58');
INSERT INTO `permissions` VALUES ('151', '0', 'api/admin/permission/index', 'admin', '2019-05-06 15:00:58', '2019-05-06 15:00:58');
INSERT INTO `permissions` VALUES ('152', '0', 'api/admin/permission/create', 'admin', '2019-05-06 15:00:59', '2019-05-06 15:00:59');
INSERT INTO `permissions` VALUES ('153', '0', 'api/admin/permission/store', 'admin', '2019-05-06 15:00:59', '2019-05-06 15:00:59');
INSERT INTO `permissions` VALUES ('154', '0', 'api/admin/permission/edit', 'admin', '2019-05-06 15:00:59', '2019-05-06 15:00:59');
INSERT INTO `permissions` VALUES ('155', '0', 'api/admin/permission/save', 'admin', '2019-05-06 15:00:59', '2019-05-06 15:00:59');
INSERT INTO `permissions` VALUES ('156', '0', 'api/admin/permission/destroy', 'admin', '2019-05-06 15:00:59', '2019-05-06 15:00:59');
INSERT INTO `permissions` VALUES ('157', '0', 'api/admin/permission/changeStatus', 'admin', '2019-05-06 15:00:59', '2019-05-06 15:00:59');
INSERT INTO `permissions` VALUES ('158', '0', 'api/admin/role/index', 'admin', '2019-05-06 15:00:59', '2019-05-06 15:00:59');
INSERT INTO `permissions` VALUES ('159', '0', 'api/admin/role/create', 'admin', '2019-05-06 15:00:59', '2019-05-06 15:00:59');
INSERT INTO `permissions` VALUES ('160', '0', 'api/admin/role/store', 'admin', '2019-05-06 15:01:00', '2019-05-06 15:01:00');
INSERT INTO `permissions` VALUES ('161', '0', 'api/admin/role/edit', 'admin', '2019-05-06 15:01:00', '2019-05-06 15:01:00');
INSERT INTO `permissions` VALUES ('162', '0', 'api/admin/role/save', 'admin', '2019-05-06 15:01:00', '2019-05-06 15:01:00');
INSERT INTO `permissions` VALUES ('163', '0', 'api/admin/role/destroy', 'admin', '2019-05-06 15:01:00', '2019-05-06 15:01:00');
INSERT INTO `permissions` VALUES ('164', '0', 'api/admin/role/changeStatus', 'admin', '2019-05-06 15:01:00', '2019-05-06 15:01:00');
INSERT INTO `permissions` VALUES ('165', '0', 'api/admin/article/export', 'admin', '2019-05-06 15:01:00', '2019-05-06 15:01:00');
INSERT INTO `permissions` VALUES ('166', '0', 'api/admin/page/export', 'admin', '2019-05-06 15:01:00', '2019-05-06 15:01:00');
INSERT INTO `permissions` VALUES ('167', '0', 'api/admin/logs/export', 'admin', '2019-05-06 15:01:01', '2019-05-06 15:01:01');
INSERT INTO `permissions` VALUES ('168', '40', 'api/admin/account/menus', 'admin', '2019-05-09 18:20:06', '2019-05-09 18:51:36');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pictures
-- ----------------------------
INSERT INTO `pictures` VALUES ('1', '0', '0', 'login.png', '14710', 'public/uploads/pictures/awuFhopsuoiPP4DtU2i3eQDCVS39aiodNZGkfM3H.png', 'e321e6b70a980f77105a9a7530ac6cef', '1', '2019-05-10 15:13:39', '2019-05-10 15:13:39');
INSERT INTO `pictures` VALUES ('2', '0', '0', 'img_trade_succeed@2x.png', '9289', 'public/uploads/pictures/vYN1ITsTr9ScaichOAnRsiPd4LMjYTuhQYQbPh2a.png', 'b6fab2f8df5c9bac972010bd30049916', '1', '2019-05-10 15:16:04', '2019-05-10 15:16:04');
INSERT INTO `pictures` VALUES ('3', '0', '0', 'used.png', '10829', 'public/uploads/pictures/wFCvBuW7fSL4AYPIFvMSbfnUTeDgAv2UVXsDvouO.png', '6429a80b2b85ff3e46f0ab815aa6431b', '1', '2019-05-10 15:16:48', '2019-05-10 15:16:48');
INSERT INTO `pictures` VALUES ('4', '0', '0', 'groupRecruitHeader.png', '20202', 'public/uploads/pictures/ihdLr5eHZCiYqsiCQyGt2ROYkCaP9P4lxnSPu3YD.png', 'cd4b1c0e6a95492c1d82f34751af4d5d', '1', '2019-05-10 15:17:34', '2019-05-10 15:17:34');
INSERT INTO `pictures` VALUES ('5', '0', '0', 'noData.png', '6477', 'public/uploads/pictures/OdxljKUnxihXKUBJ5w5moOPbolwX2bGqjHyNq0Tq.png', '4bbb805b4935174117bcd81d7862fb57', '1', '2019-05-10 15:17:52', '2019-05-10 15:17:52');
INSERT INTO `pictures` VALUES ('6', '0', '0', 'get-phone-bg.png', '11236', 'public/uploads/pictures/SRUV8lWJ7dvsEhVqpfS2OXzx7QvslUcAE5pexrWM.png', '3159573da2e244a1fb9d1a8487961f8c', '1', '2019-05-10 16:48:00', '2019-05-10 16:48:00');
INSERT INTO `pictures` VALUES ('7', '0', '0', 'topbg.png', '13432', 'public/uploads/pictures/d0xs1UFl1rblyBjuUoCJkFyhKwMA6Fdd0dtYzhok.png', 'ce49fea5dc3fd2eba84dae70c0a7aacb', '1', '2019-05-10 18:27:54', '2019-05-10 18:27:54');

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
  `cover_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', '1', '0', '1', '默认文章,你好世界！', '你好，世界！', 'hello', 'tangtanglove', '1', 'Hello, world”程序是指在计算机屏幕上输出“Hello,world”这行字符串的计算机程序，“hello, world”的中文意思是“你好，世界。”。这个例程在Brian Kernighan 和Dennis M. Ritchie合著的《The C Programme Language》使用而广泛流行。', '', '', '0', '0', 'ARTICLE', '1', '1', '', '“Hello, world”程序是指在计算机屏幕上输出“Hello,world”这行字符串的计算机程序，“hello, world”的中文意思是“你好，世界。”。这个例程在Brian Kernighan 和Dennis M. Ritchie合著的《The C Programme Language》使用而广泛流行。因为它的简洁，实用，并包含了一个该版本的C程序首次出现在1974年Brian Kernighan所撰写的《Programming in C: A Tutorial》', '0', '0', '', 'open', '1', '0', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);
INSERT INTO `posts` VALUES ('2', '1', '0', '1', '使用说明,配置手册', '使用说明', 'doc', 'tangtanglove', '本站', '说明书多种多样，说明书的写作格式也不拘一格，不可一概而论。本文将举出一些常见的说明书的具体例子，以期使读者对此有一明确的认识。', '', '', '0', '0', 'ARTICLE', '1', '0', '', 'https://www.kancloud.cn/tangtanglove/easyadmin/435582', '0', '0', '', 'open', '1', '0', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);
INSERT INTO `posts` VALUES ('3', '1', '0', '1', '开发文档,帮助文件', '开发文档', 'help', 'tangtanglove', '本站', '软件开发文档是软件开发使用和维护过程中的必备资料。它能提高软件开发的效率，保证软件的质量，而且在软件的使用过程中有指导，帮助，解惑的作用，尤其在维护工作中，文档是不可或缺的资料。', '', '', '0', '0', 'ARTICLE', '1', '0', '', 'https://www.kancloud.cn/tangtanglove/easyadmin/435582', '0', '0', '', 'open', '1', '0', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);
INSERT INTO `posts` VALUES ('4', '1', '0', '1', '关于我们,介绍', '关于我们', 'aboutus', 'tangtanglove', '本站', '关于我们,介绍', '', '', '0', '0', 'PAGE', '1', '0', '', '这是一个关于我们的文章，您可以填一下介绍什么的。', '0', '0', 'page/index', 'open', '1', '0', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);
INSERT INTO `posts` VALUES ('15', '1', '0', '1', '帮助中心,帮助', '帮助中心', 'help', 'tangtanglove', '本站', '帮助中心,帮助', '', '', '0', '0', 'PAGE', '1', '0', '', '这是一个帮助中心的文章，您可以填一下帮助什么的。', '0', '0', 'page/index', 'open', '1', '0', '2019-03-08 08:25:59', '2019-03-08 08:25:59', null);
INSERT INTO `posts` VALUES ('16', '1', '0', '1', '', '点赞！熊孩子博物馆前搞破坏 市民及时制止', '', '', '', '点赞！熊孩子博物馆前搞破坏 市民及时制止', '0', '[]', '0', '0', 'ARTICLE', '1', '0', '', '<p>点赞！熊孩子博物馆前搞破坏 市民及时制止</p>', '0', '0', '', 'open', '1', '0', '2019-05-08 18:50:09', '2019-05-08 18:50:19', '2019-05-08 18:50:19');

-- ----------------------------
-- Table structure for printers
-- ----------------------------
DROP TABLE IF EXISTS `printers`;
CREATE TABLE `printers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '打印机名称',
  `machine_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '易联云打印机终端号',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机卡号码',
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用ID',
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用密钥',
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
INSERT INTO `role_has_permissions` VALUES ('14', '7');
INSERT INTO `role_has_permissions` VALUES ('17', '7');
INSERT INTO `role_has_permissions` VALUES ('18', '7');
INSERT INTO `role_has_permissions` VALUES ('19', '7');
INSERT INTO `role_has_permissions` VALUES ('20', '7');
INSERT INTO `role_has_permissions` VALUES ('21', '7');
INSERT INTO `role_has_permissions` VALUES ('22', '7');
INSERT INTO `role_has_permissions` VALUES ('23', '7');
INSERT INTO `role_has_permissions` VALUES ('24', '7');
INSERT INTO `role_has_permissions` VALUES ('25', '7');
INSERT INTO `role_has_permissions` VALUES ('26', '7');
INSERT INTO `role_has_permissions` VALUES ('27', '7');
INSERT INTO `role_has_permissions` VALUES ('30', '7');
INSERT INTO `role_has_permissions` VALUES ('31', '7');
INSERT INTO `role_has_permissions` VALUES ('59', '7');
INSERT INTO `role_has_permissions` VALUES ('60', '7');
INSERT INTO `role_has_permissions` VALUES ('168', '7');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('7', '网站编辑', 'admin', '2019-05-09 15:47:07', '2019-05-13 18:30:09');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sms
-- ----------------------------
INSERT INTO `sms` VALUES ('1', '15076569631', '780814', '验证码：780814，请及时输入完成验证。如非本人操作，请忽略。', '0', '1', '2019-05-20 17:08:06', '2019-05-20 17:08:06');
INSERT INTO `sms` VALUES ('2', '15076569631', '397666', '验证码：397666，请及时输入完成验证。如非本人操作，请忽略。', '2', '1', '2019-05-20 17:47:48', '2019-05-20 17:48:07');
INSERT INTO `sms` VALUES ('3', '15076569631', '594166', '验证码：594166，请及时输入完成验证。如非本人操作，请忽略。', '2', '1', '2019-05-20 17:55:33', '2019-05-20 17:59:02');

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
