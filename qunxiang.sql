/*
Navicat MySQL Data Transfer

Source Server         : yunwei
Source Server Version : 50623
Source Host           : 192.168.2.54:3306
Source Database       : qunxiang

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2015-12-10 13:37:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `business`
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `business_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_user_id` int(11) DEFAULT NULL,
  `business_status` int(11) DEFAULT NULL COMMENT '0未审核 1通过 2不通过',
  `business_type` int(11) DEFAULT NULL COMMENT '1代表供应  2代表需求',
  `business_is_top` int(11) DEFAULT NULL,
  `business_industry_id` int(11) DEFAULT NULL,
  `business_department_id` int(11) DEFAULT NULL,
  `business_view_count` int(11) DEFAULT NULL COMMENT '浏览次数',
  `business_gender` varchar(255) DEFAULT NULL,
  `business_age` int(11) DEFAULT NULL,
  `business_time` timestamp NULL DEFAULT NULL,
  `business_focus_count` int(11) DEFAULT NULL,
  `business_type_id` int(11) DEFAULT NULL COMMENT '所属业务门类编号',
  `business_name` varchar(255) DEFAULT NULL,
  `business_connecter` varchar(255) DEFAULT NULL,
  `business_mobile` varchar(255) DEFAULT NULL,
  `business_qq` varchar(255) DEFAULT NULL,
  `business_email` varchar(255) DEFAULT NULL,
  `business_address` varchar(255) DEFAULT NULL,
  `business_school` varchar(255) DEFAULT '未填写',
  `business_job` varchar(255) DEFAULT '未填写',
  `business_edu` varchar(255) DEFAULT '未填写',
  `business_position` varchar(255) DEFAULT '未填写',
  `business_require` text,
  `business_challenge_experience` text COMMENT '挑战和经验',
  `business_hobby` text COMMENT '业务专长',
  `business_product_market` text COMMENT '熟悉的产品和市场',
  `business_cooperation` text COMMENT '合作方式',
  `business_description` text,
  `business_other` text,
  `business_img1` varchar(255) DEFAULT NULL,
  `business_payment` int(11) DEFAULT NULL COMMENT '薪酬',
  `business_img2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES ('59', '1000011', '1', '2', '0', '15', '5', '6', '', '0', '2015-08-31 11:34:50', '10', '5', '每天编写代码他每天编写代码他回国后和规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈回国后和规划通过韩国高哈哈规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈回国后和规划通过韩国高哈哈每天编写代码他每天编写代码他回国后和规划通过韩国高哈哈每天编写代码', '曾杰', '13554014654', '1063304800', 'nutterzen@qq.com', '天津市;和平区;-1', '', '', '', '每天卖汽车', '必须会Java换个更好每天编写代码他回国后和规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈', '', '上海惠多超市', '接手外包任务,每天编写代码他回国后和规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈', '兼职', '<p>\r\n	上海惠多超市有限公司主要经营：null等产品。公司尊崇“踏实、拼搏、责任”的企业精神，并以诚信、共赢、开创经营理念，创造良好的企业环境，以\r\n全新的管理模式，完善的技术，周到的服务，卓越的品质为生存根本，我们始终坚持用户至上 用心服务于客户，坚持用自己的服务去打动客户。\r\n</p>\r\n<p>\r\n	欢迎各位新老客户来我公司参观指导工作，我公司具体的地址是：上海市金山区亭林镇寺平北路111弄28号二、三楼 。\r\n</p>\r\n<p>\r\n	您如果对我们的产品感兴趣或者有任何的疑问，您可以直接给我们留言或直接与我们联络，我们将在收到您的信息后，会第一时间及时与您联络。\r\n</p>', '其他', 'upload/logo.jpg', '1000', '');
INSERT INTO `business` VALUES ('60', '1000003', '1', '1', '0', '1', '1', '3', '男', '23', '2015-08-31 00:00:00', '0', '1', '数据java结构结构1111', '曾杰', '13554014654', '304000954', '304000954@qq.com', '湖北省;孝感市;-1', null, null, null, null, '有工作经验', '', '数据java结构结构<img src=\"/qunxiang/attached/image/20150831/20150831112959_949.jpg\" alt=\"\" />,', '接手外包任务,每天编写代码他回国后和规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈', '全职', '我是互联网工作9年', '数据java结构结构数据java结构结构数据java结构结构', 'upload/2015083111305835426074.jpg', '0', '');
INSERT INTO `business` VALUES ('61', '1000009', '1', '1', '0', '15', '5', '1', '女', '23', '2015-08-27 00:00:00', '0', '5', '业务能力专长', 'ganzi', '13554014654', '13554014654', '13554014654@qq.com', '湖北省;孝感市;-1', '', '', '', '我是岗位', '有工作经验', '', '我的特长有很多，你们需要哪一点？,', null, '兼职', 'ganzi henhao', '没有什么其他的要求了。。。', 'upload/2015083111331427502984.jpg', '0', '');
INSERT INTO `business` VALUES ('62', '1000003', '1', '1', '1', '1', '1', '6', '男', '23', '2015-08-31 11:34:50', '10', '1', '.net', '曾杰', '13554014654', '304000954', '304000954@qq.com', '湖北省;孝感市;-1', null, null, null, null, '在校生', null, '熟悉.net有过3年开发经验<img src=\"/qunxiang/attached/image/20150831/20150831113429_533.jpg\" alt=\"\" />, ', '.net接手外包任务,每天编写代码他回国后和规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈', '兼职', '我是互联网工作9年', '.net.net.net.net.net', 'upload/2015083111345044297296.jpg', null, null);
INSERT INTO `business` VALUES ('63', '1000011', '1', '2', '0', '1', '1', '3', '', '0', '2015-08-31 17:28:55', '0', '1', '一个月3000开发Java', '曾杰', '13554014654', '1063304800', 'nutterzen@qq.com', '河北省;-1;-1', '', '', '', '每天写代码', '一个月3000开发Java', '', '上海惠多超市杆子哦是个逗比', '接手外包任务,每天编写代码他回国后和规划通过韩国高哈哈每天编写代码他回国后和规划通过韩国高哈哈', '全职', '<p>\r\n	上海惠多超市有限公司主要经营：null等产品。公司尊崇“踏实、拼搏、责任”的企业精神，并以诚信、共赢、开创经营理念，创造良好的企业环境，以\r\n全新的管理模式，完善的技术，周到的服务，卓越的品质为生存根本，我们始终坚持用户至上 用心服务于客户，坚持用自己的服务去打动客户。\r\n</p>\r\n<p>\r\n	欢迎各位新老客户来我公司参观指导工作，我公司具体的地址是：上海市金山区亭林镇寺平北路111弄28号二、三楼 。\r\n</p>\r\n<p>\r\n	您如果对我们的产品感兴趣或者有任何的疑问，您可以直接给我们留言或直接与我们联络，我们将在收到您的信息后，会第一时间及时与您联络。\r\n</p>', '斯蒂芬斯蒂芬斯蒂芬', 'upload/201508310528555808004.jpg', '20000', '');

-- ----------------------------
-- Table structure for `businesstype`
-- ----------------------------
DROP TABLE IF EXISTS `businesstype`;
CREATE TABLE `businesstype` (
  `business_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`business_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of businesstype
-- ----------------------------
INSERT INTO `businesstype` VALUES ('1', '业务门类1');
INSERT INTO `businesstype` VALUES ('2', '业务门类2');
INSERT INTO `businesstype` VALUES ('3', '业务门类3');
INSERT INTO `businesstype` VALUES ('4', '业务门类4');
INSERT INTO `businesstype` VALUES ('5', '业务门类5');
INSERT INTO `businesstype` VALUES ('6', '业务门类6');
INSERT INTO `businesstype` VALUES ('7', '业务门类7');
INSERT INTO `businesstype` VALUES ('8', '业务门类8');
INSERT INTO `businesstype` VALUES ('9', '业务门类9');
INSERT INTO `businesstype` VALUES ('10', '业务门类10');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_user_id` int(11) DEFAULT NULL,
  `comment_content` text,
  `comment_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `comment_vote_id` int(11) DEFAULT NULL,
  `comment_train_id` int(11) DEFAULT NULL,
  `comment_business_id` int(11) DEFAULT NULL,
  `comment_rating` int(11) DEFAULT NULL COMMENT '点评等级',
  `comment_company_name` varchar(255) DEFAULT NULL,
  `comment_contact` varchar(50) DEFAULT NULL,
  `comment_phone` varchar(50) DEFAULT NULL,
  `comment_email` varchar(50) DEFAULT NULL,
  `comment_ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '棒极了', '2015-07-17 10:48:21', '1', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('2', '1', '棒极了', '2015-07-17 10:48:18', '2', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('3', '1', '棒极了', '2015-07-17 10:48:17', '2', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('4', '1', '棒极了', '2015-07-17 10:48:17', '2', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('5', '1', '棒极了', '2015-07-17 10:48:16', '1', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('6', '1', '棒极了', '2015-07-17 10:48:16', '1', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('7', '1', '棒极了', '2015-07-17 10:48:15', '1', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('8', '999999', '士大夫似的的士速递撒地方士大夫士大夫士大夫', '2015-07-17 10:48:14', '1', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('9', '999999', '士大夫似的大师傅士大夫似的', '2015-07-17 10:48:06', '3', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('10', '999999', '士大夫似的大师傅士大夫似的', '2015-07-17 10:48:07', '3', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('11', '999999', '士大夫似的大师傅士大夫似的', '2015-07-17 10:48:06', '3', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('12', '999999', '士大夫士大夫似的是发送到发送到', '2015-07-17 10:48:05', '3', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('13', '999999', 'alert(1);', '2015-07-17 10:48:05', '1', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('14', '999999', '<sciprt>(1);</>', '2015-07-17 10:48:04', '1', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('15', '999999', 'sdfsdfsdfsdfsdfsd', '2015-07-17 10:48:04', '4', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('16', '999999', '真的可以希望嘻嘻士大夫士大夫似的方式', '2015-07-16 16:24:21', null, '1', null, '8', null, null, null, null, null);
INSERT INTO `comment` VALUES ('17', '999999', '真的可以希望嘻嘻士大夫士大夫似的方式', '2015-07-16 16:26:19', null, '1', null, '8', null, null, null, null, null);
INSERT INTO `comment` VALUES ('18', '999999', '撒地方撒地方士大夫士大夫似的方式', '2015-07-16 16:28:25', null, '1', null, '8', null, null, null, null, null);
INSERT INTO `comment` VALUES ('19', '999999', '是大幅度是撒地方士大夫士大夫士大夫', '2015-07-16 16:29:13', null, '1', null, '8', null, null, null, null, null);
INSERT INTO `comment` VALUES ('20', '999999', '撒地方是的方式发送到是的撒地方是电风扇', '2015-07-16 16:30:08', null, '1', null, '8', null, null, null, null, null);
INSERT INTO `comment` VALUES ('21', '999999', '撒地方实打实地方士大夫士大夫士大夫士大夫士大夫', '2015-07-16 17:06:21', null, '1', null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('22', '999999', '士大夫士大夫士大夫是的方式', '2015-07-17 10:48:03', '5', null, null, '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('23', '999999', 'sdfsssssssdfsdsdfsdfsdf', '2015-07-17 09:41:08', null, null, '1', '8', null, null, null, null, null);
INSERT INTO `comment` VALUES ('24', '999999', 'sdfsssssssssssdfsdfsdf', '2015-07-17 09:41:22', null, null, '1', '8', null, null, null, null, null);
INSERT INTO `comment` VALUES ('25', '999999', 'sdffffffffffff', '2015-07-17 09:42:35', null, null, '1', '9', null, null, null, null, null);
INSERT INTO `comment` VALUES ('27', '999999', '少的地方士大夫士大夫士大夫', '2015-07-17 09:44:12', null, '1', null, '6', null, null, null, null, null);
INSERT INTO `comment` VALUES ('28', '999999', '撒地方撒地方士大夫士大夫似的方式', '2015-07-17 15:49:29', null, null, '1', '6', null, null, null, null, null);
INSERT INTO `comment` VALUES ('29', '999999', '122121212121212112', '2015-07-17 17:07:43', '2', null, null, null, null, null, null, null, null);
INSERT INTO `comment` VALUES ('30', '999999', '少的地方是撒地方士大夫士大夫士大夫', '2015-07-20 11:47:43', null, null, '1', '9', null, null, null, null, null);
INSERT INTO `comment` VALUES ('31', '999999', '1000sdfsdfsdfsdfsd', '2015-07-20 18:25:06', null, '1', null, '5', null, null, null, null, null);
INSERT INTO `comment` VALUES ('32', null, '测试', '2015-07-21 15:25:44', '1', null, null, null, null, null, null, null, null);
INSERT INTO `comment` VALUES ('33', null, '测试', '2015-07-21 15:29:34', '1', null, null, null, null, null, null, null, null);
INSERT INTO `comment` VALUES ('34', '999999', '师傅士大夫士大夫士大夫士大夫所发生的富士达', '2015-07-21 15:50:27', null, null, '1', '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('35', '1000002', '啊sd卡将阿斯顿路口见阿斯顿', '2015-07-28 10:40:52', null, null, '1', '10', null, null, null, null, null);
INSERT INTO `comment` VALUES ('36', '999999', 'sdfffffffffffffsdsdffsd', '2015-07-29 08:22:52', '4', null, null, null, null, null, null, null, null);
INSERT INTO `comment` VALUES ('37', '999999', 'sdfffffffffffffffffffffsdfsdf', '2015-07-29 08:23:39', '4', null, null, null, null, null, null, null, null);
INSERT INTO `comment` VALUES ('38', '999999', 'dfgdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdf', '2015-07-29 08:31:52', '2', null, null, null, null, null, null, null, null);
INSERT INTO `comment` VALUES ('39', '999999', 'sdffffffffffffffffff', '2015-07-29 08:47:39', null, '2', null, '9', null, null, null, null, null);
INSERT INTO `comment` VALUES ('40', '999999', '8888888888888888888', '2015-07-29 09:27:48', null, '2', null, '9', null, null, null, null, null);
INSERT INTO `comment` VALUES ('41', '999999', 'sdffffffffffffffffffffff', '2015-07-29 09:29:07', null, null, '2', '9', null, null, null, null, null);
INSERT INTO `comment` VALUES ('42', '999999', 'sdfffffffffffffffffffffffffffff', '2015-07-29 09:42:50', null, '2', null, '9', null, null, null, null, null);
INSERT INTO `comment` VALUES ('43', '999999', 'sdffffffffffffffffffffffffffff', '2015-07-29 09:43:29', null, '2', null, '9', null, null, null, null, null);
INSERT INTO `comment` VALUES ('44', '999999', '真的还行吧服务态度不错', '2015-07-29 09:48:12', null, '2', null, '9', null, null, null, null, null);
INSERT INTO `comment` VALUES ('45', '999999', '服务真的不错还行吧！！！', '2015-07-29 09:49:18', null, '2', null, '10', null, null, null, null, null);
INSERT INTO `comment` VALUES ('46', '999999', '真心不咋的服务稀烂！', '2015-07-29 09:50:05', null, '5', null, '10', null, null, null, null, null);
INSERT INTO `comment` VALUES ('47', '999999', '服务还行就是态度中肯吧！！', '2015-07-29 09:52:02', null, '3', null, '10', null, null, null, null, null);
INSERT INTO `comment` VALUES ('48', '999999', '套天天天天天天天天天天天天', '2015-07-29 13:03:11', null, null, '2', '1', null, null, null, null, null);
INSERT INTO `comment` VALUES ('49', '999999', '是大大大大大大大大大大大大大大大大大大', '2015-07-29 13:34:22', '10', null, null, null, null, null, null, null, null);
INSERT INTO `comment` VALUES ('50', '999999', '是地方发反反复复反复反复发反反复复方法', '2015-07-30 08:53:18', null, null, '1', '8', null, null, null, null, null);
INSERT INTO `comment` VALUES ('51', '1000002', '不错啊@ 很赞。。。。。。', '2015-07-30 13:24:08', '1', null, null, null, null, null, null, null, null);
INSERT INTO `comment` VALUES ('52', '999999', '是地方发反反复复发反反复复方法', '2015-07-31 14:03:34', null, '2', null, '8', null, null, null, null, null);
INSERT INTO `comment` VALUES ('53', '999999', 'sdsdsdsdsdsdsdsdsdsdsdsdsdsdsd', '2015-07-31 16:18:56', '2', null, null, null, null, null, null, null, null);
INSERT INTO `comment` VALUES ('54', '999999', 'sdsdsdsdsdsdsdsdsdsd', '2015-07-31 16:19:50', null, null, '1', '5', null, null, null, null, null);
INSERT INTO `comment` VALUES ('55', '999999', '13554014654111', '2015-08-03 09:07:54', null, null, '7', '10', '111', '111', '13554014654', 'nutterzen@qq.com', null);
INSERT INTO `comment` VALUES ('56', '999999', 'sdsds@qq.comsdsds@qq.com', '2015-08-03 09:25:19', null, null, '7', '9', 'sss', 'sss', '13554014654', 'sdsds@qq.com', null);
INSERT INTO `comment` VALUES ('57', '999999', '华中汽贸城华中汽贸城华中汽贸城华中汽贸城华中汽贸城', '2015-08-03 09:31:46', null, null, '1', '9', '华中汽贸城', '曾杰', '13554014654', 'nutterzen@qq.com', null);
INSERT INTO `comment` VALUES ('58', '999999', 'sdfsdfsdfsdsdsdfsdfsdfsdf', '2015-08-11 12:43:19', null, null, '9', '10', 'dsfsfsdf', 'zj', '13554014654', 'nutterzen@qq.com', null);
INSERT INTO `comment` VALUES ('59', '999999', '很好啊很好啊很好啊很好啊很好啊', '2015-08-11 12:50:39', null, '3', null, '5', '杆子', '曾', '13554014654', '2281558656@qq.com', null);
INSERT INTO `comment` VALUES ('60', '999999', '1355401465413554014654', '2015-08-11 12:56:20', null, null, '1', '10', '13554014654', '13554014654', '13554014654', '13554014654@qq.com', null);
INSERT INTO `comment` VALUES ('61', '999999', '135540146541355401465413554014654', '2015-08-11 12:57:04', null, null, '2', '5', 'true', 'true', '13554014654', '13554014654@qq.com', null);
INSERT INTO `comment` VALUES ('62', '1000009', '135540146541355401465413554014654', '2015-08-12 10:10:46', null, null, '15', '5', 'commentList', 'commentList', '13554014654', '13554014654@qq.com', null);
INSERT INTO `comment` VALUES ('63', '1000009', '1355401465413554014654135540146541355401465413554014654', '2015-08-12 10:36:02', null, null, '16', '5', '杆子', '曾', '13554014654', '13554014654@qq.com', null);
INSERT INTO `comment` VALUES ('64', '999999', '1355401465413554014654', '2015-08-12 11:31:20', null, null, '15', '5', 'sdsdsd', '13554014654', '13554014654', '13554014654@qq.com', null);
INSERT INTO `comment` VALUES ('65', '1000011', '上海小伙增发增发增发', '2015-08-12 19:06:13', null, null, '19', '10', '上海小伙', '增发', '13554014654', '13554014654@qq.com', null);
INSERT INTO `comment` VALUES ('66', '999999', '这个东西真的不错啊这个东西真的不错啊', '2015-08-12 19:14:53', null, null, '19', '10', '杆子', '曾', '13554014654', '13554014654@qq.com', null);
INSERT INTO `comment` VALUES ('67', '1000011', '13554014654', '2015-08-12 19:26:13', null, '9', null, '10', 'traintrain', 'zj', '13554014654', 'nutterzen@qq.com', null);
INSERT INTO `comment` VALUES ('68', '999999', '1355401465413554014654', '2015-08-12 19:28:28', null, null, '19', '10', '13554014654', '13554014654', '13554014654', '13554014654@qq.com', null);
INSERT INTO `comment` VALUES ('69', '1000011', '少时诵诗书少时诵诗书少时诵诗书', '2015-08-26 09:46:38', null, '2', null, '10', '少时诵诗书', '曾杰', '13554014654', 'nutterzen@qq.com', null);
INSERT INTO `comment` VALUES ('70', '1000011', '感觉还行吧！真的可以哦', '2015-08-26 10:14:52', null, null, '18', '10', '上海惠多超市', '曾杰', '13554014654', 'nutterzen@qq.com', null);
INSERT INTO `comment` VALUES ('71', '1000011', '真心不错哦继续努力', '2015-09-09 08:22:47', null, '13', null, '10', '中绑只', '曾杰', '13554014654', 'nutterzen@qq.com', null);
INSERT INTO `comment` VALUES ('72', '1000003', '上海佳海超市上海佳海超市', '2015-08-26 16:48:53', null, null, '51', '10', '上海佳海超市', '曾杰', '13554014654', 'nutterzen', null);
INSERT INTO `comment` VALUES ('73', '999999', 'sdfsdfsdfsdfsdfsdfsdf', '2015-09-02 12:50:34', null, null, '62', '10', 'sdfsdf', 'sdfsdf', '13554014654', 'sdfsdf', '127.0.0.1');
INSERT INTO `comment` VALUES ('74', '999999', 'abcabcabcabcabcabcabcabc', '2015-09-02 12:52:01', null, null, '62', '10', 'abc', 'abc', '13554014654', 'abc', '192.168.2.188');
INSERT INTO `comment` VALUES ('75', '999999', '真心不错哦继续努力', '2015-09-09 08:22:30', null, '25', null, '10', '上海芝麻开门有限责任公司', '曾杰', '13554014654', 'nutterzen@qq.com', null);
INSERT INTO `comment` VALUES ('76', '999999', '真心不错哦继续努力', '2015-09-09 08:22:46', null, null, '59', '10', '上海飞达有限责任公司', '曾杰', '13554014654', 'nutterzen@qq.com', '127.0.0.1');

-- ----------------------------
-- Table structure for `data`
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_content` text,
  `data_description` text,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data
-- ----------------------------
INSERT INTO `data` VALUES ('1', 'upload/2015081210323824299675.jpg', '首页滚动图1');
INSERT INTO `data` VALUES ('2', 'http://www.baidu.com;upload/2015081203145121592754.jpg', '首页广告');
INSERT INTO `data` VALUES ('3', 'admin;654321', '管理员信息');
INSERT INTO `data` VALUES ('4', 'upload/2015072003255622760224.jpg', '首页滚动图2');
INSERT INTO `data` VALUES ('5', 'upload/2015072003255638348567.jpg', '首页滚动图3');
INSERT INTO `data` VALUES ('6', 'upload/2015072003255650538635.jpg', '首页滚动图4');
INSERT INTO `data` VALUES ('7', 'http://www.ganzi.com;upload/201508310203258748329.jpg', '首页广告');
INSERT INTO `data` VALUES ('10', '上海群享电子商务有限公司依据以下条件和条款为您提供服务，请仔细阅读并遵守。&nbsp;<br />\r\n<br />\r\n能力资源网立足于商务，为客户提供全面的服务。<br />\r\n能力资源网的各项电子服务的所有权和运作权归上海群享电子商务有限公司。能力资源网提供的服务将完全按照其发布的章程、服务条款和操作规则严格执行。会员若完全同意所有服务条款，并完成注册程序，即可成为能力资源网的正式会员。<br />\r\n<br />\r\n<br />\r\n欢迎阅读能力资源网服务条款协议(下称“本协议”)。本协议阐述之条款和条件适用于您使用能力资源网网站（所涉域名为 ：nengliziyuan.com; 能力资源.com ），所提供的服务。&nbsp;<br />\r\n<br />\r\n一、接受条款&nbsp;<br />\r\n1、本协议内容包括协议正文及所有能力资源网已经发布或将来可能发布的各类规则。所有规则为协议不可分割的一部分，与协议正文具有同等法律效力。&nbsp;<br />\r\n2、以任何方式进入能力资源网网站并使用服务即表示您已充分阅读、理解并同意接受本协议的条款和条件(以下合称“条款”)。&nbsp;<br />\r\n3、能力资源网有权根据业务需要酌情修订“条款”，并以网站公告的形式进行更新，不再专门通知予您。经修订的“条款”一经在能力资源网网站公布，即产生效力。如您不同意相关修订，请您立即停止使用“服务”。如您继续使用“服务”，则将视为您已接受经修订的“条款”，当您与能力资源网发生争议时，应以最新的“条款”为准。&nbsp;<br />\r\n<br />\r\n二、注册&nbsp;<br />\r\n1、服务使用对象&nbsp;<br />\r\n您确认，在您完成注册程序或以其他能力资源网允许的方式实际使用服务时，您应当是具备完全民事权利能力和与所从事的民事行为相适应的行为能力的自然人、法人或其他组织。若您不具备前述主体资格，请勿使用服务，否则您及您的监护人应承担因此而导致的一切后果，且能力资源网有权注销（永久冻结）您的账户，并向您及您的监护人索偿。如您代表一家公司或其他法律主体在能力资源网网站注册，则您声明和保证，您有权使该公司或该法律主体受本协议“条款”的约束。&nbsp;<br />\r\n2、注册账户&nbsp;<br />\r\n2.1在您按照注册页面提示填写信息、阅读并同意本协议且完成全部注册程序后，或在您按照激活页面提示填写信息、阅读并同意本协议且完成全部激活程序后，或您以其他能力资源网允许的方式实际使用能力资源网网站服务时，您即受本协议的约束。您可以使用您提供或确认的邮箱、手机号码或者能力资源网允许的其它方式作为登录手段进入能力资源网网站。&nbsp;<br />\r\n2.2您可以对账户设置昵称，但您设置的昵称不得侵犯或涉嫌侵犯他人合法权益。如您设置的昵称涉嫌侵犯他人合法权益，能力资源网有权终止向您提供服务，并注销您的账户。账户注销后，相应的昵称将开放给其他有权用户登记使用。&nbsp;<br />\r\n2.3在完成注册或激活流程时，您应当按照法律法规要求，按相应页面的提示准确提供并及时更新您的资料，以使之真实、及时，完整和准确。如有合理理由怀疑您提供的资料错误、不实、过时或不完整的，能力资源网有权向您发出询问及/或要求改正的通知，并有权直接做出删除相应资料的处理，直至中止、终止对您提供部分或全部能力资源网服务，能力资源网对此不承担任何责任，您将承担因此产生的任何直接或间接损失及不利后果。<br />\r\n<br />\r\n&nbsp;<br />\r\n<br />\r\n三、账户安全&nbsp;<br />\r\n您须自行负责对您的登录名、昵称和密码保密，且须对该登录名、昵称和密码下发生的所有活动（包括但不限于信息披露、发布信息、网上点击同意或提交各类规则协议、网上续签协议或购买服务等）承担责任。您同意：(a)如发现任何人未经授权使用您的登录名、昵称和密码，或发生违反保密规定的任何其他情况，您会立即通知能力资源网，并授权能力资源网将该信息同步给能力资源网网站；(b)确保您在每个上网时段结束时，以正确步骤离开网站。能力资源网不能也不会对因您未能遵守本款规定而发生的任何损失或损毁负责。您理解能力资源网对您的请求采取行动需要合理时间，能力资源网对在采取行动前已经产生的后果（包括但不限于您的任何损失）不承担任何责任。除非有法律规定或司法裁定，且征得能力资源网的同意，否则，您的登录名、昵称和密码不得以任何方式转让。&nbsp;<br />\r\n<br />\r\n四、服务终止&nbsp;<br />\r\n1、服务终止：<br />\r\n<br />\r\n1.1您同意，在能力资源网未向您收费的情况下，上海群享电子商务有限公司可自行全权决定以任何理由(包括但不限于能力资源网认为您已违反本协议的字面意义和精神，或您以不符合本协议的字面意义和精神的方式行事)终止您的“服务”密码、账户(或其任何部份)或您对“服务”的使用。您同意，在能力资源网向您收费的情况下，能力资源网应基于合理的怀疑且经电子邮件通知的情况下实施上述终止服务的行为。您进一步承认和同意，能力资源网根据本协议规定终止您服务的情况下可立即使您的账户无效，或注销您的账户以及在您的账户内的所有相关资料和档案，和/或禁止您进一步接入该等档案或“服务”。账户终止后，能力资源网没有义务为您保留原账户中或与之相关的任何信息，或转发任何未曾阅读或发送的信息给您或第三方。此外，您同意，能力资源网不会就终止向您提供“服务”而对您或任何第三者承担任何责任。<br />\r\n<br />\r\n1.2您有权向能力资源网要求注销您的账户，经能力资源网审核同意的，能力资源网将注销您的账户，届时，您与能力资源网基于本协议的合同关系即终止。您的账户被注销后，能力资源网没有义务为您保留或向您披露您账户中的任何信息，也没有义务向您或第三方转发任何您未曾阅读或发送过的信息。&nbsp;<br />\r\n1.3.您理解并同意，您与能力资源网的合同关系终止后：&nbsp;<br />\r\na)能力资源网有权继续保存您的资料。&nbsp;<br />\r\nb)您在使用服务期间存在违法行为或违反本协议和/或规则的行为的，能力资源网仍可依据本协议向您主张权利。&nbsp;<br />\r\nC）您在使用服务期间因使用服务与其他用户之间发生的关系，不因本协议的终止而终止，其他用户仍有权向您主张权利，您应继续按您的承诺履行义务。<br />\r\n<br />\r\n&nbsp;<br />\r\n<br />\r\n五、登录名的注销&nbsp;<br />\r\n1、如您连续三年未使用您的邮箱、手机或本网站认可的其他方式和密码登录过本网站，也未登录过其他任意阿里网站，您的登录名可能被注销，不能再登录任意一家网站。<br />\r\n<br />\r\n2、您同意并授权能力资源网网站，如您在能力资源网网站有欺诈、发布或销售伪劣商品、侵权他人合法权益或其他严重违反任意能力资源网网站规则的行为，能力资源网网站对此有权披露，您的登录名可能被注销，不能再登录能力资源网网站。<br />\r\n<br />\r\n六、关于费用。&nbsp;<br />\r\n能力资源网保留在根据第一条第3款通知您后，收取“服务”费用的权利。另外，您因进行交易、向能力资源网获取有偿服务或接触能力资源网服务器而发生的所有应纳税赋，以及相关硬件、软件、通讯、网络服务及其他方面的费用均由您自行承担。能力资源网保留在无须发出书面通知，仅在网站公示的情况下，暂时或永久地更改或停止部分或全部“服务”的权利。<br />\r\n<br />\r\n<br />\r\n七、能力资源网平台服务和地位&nbsp;<br />\r\n1、通过能力资源网提供的平台服务，您可在能力资源网网站上发布交易信息、查询商品和服务信息、达成交易意向并进行交易、对其他会员进行评价、参加能力资源网组织的活动以及使用其它信息服务及技术服务。&nbsp;<br />\r\n2、能力资源网网站仅作为用户物色交易对象，就货物和服务的交易进行协商，以及获取各类与贸易相关的服务的地点。同时，能力资源网不涉及用户间因交易而产生的法律关系及法律纠纷，不会且不能牵涉进交易各方的交易当中。敬请注意，能力资源网不能控制或保证商贸信息的真实性、合法性、准确性，亦不能控制或保证交易所涉及的物品的质量、安全或合法性，以及相关交易各方履行在贸易协议项下的各项义务的能力。能力资源网不能也不会控制交易各方能否履行协议义务。此外，您应注意到，与以欺诈手段行事的人进行交易的风险是客观存在的。能力资源网希望您在使用能力资源网网站时，小心谨慎并运用常识。&nbsp;<br />\r\n<br />\r\n八、服务使用规范&nbsp;<br />\r\n1、关于您的资料的规则&nbsp;<br />\r\n1.1“您的资料”包括您在注册、发布信息或交易等过程中、在任何公开信息场合或通过任何电子邮件形式，向能力资源网或其他用户提供的任何资料 ，包括数据、文本、软件、音乐、声响、照片、图画、影像、词句或其他材料。您应对“您的资料”负全部责任，而能力资源网仅作为您在网上发布和刊登“您的资料”的被动渠道。&nbsp;<br />\r\n1.2您同意并承诺，“您的资料”和您供在能力资源网网站上交易的任何“物品”（泛指一切可供依法交易的、有形的或无形的、以各种形态存在的某种具体的物品，或某种权利或利益，或某种票据或证券，或某种服务或行为。本协议中“物品”一词均含此义）:<br />\r\na.不会有欺诈成份，与售卖伪造或盗窃无涉；&nbsp;<br />\r\nb.不会侵犯任何第三者对该物品享有的物权，或版权、专利、商标、商业秘密或其他知识产权，或隐私权、名誉权；<br />\r\nc.不会违反任何法律、法规、条例或规章(包括但不限于关于规范出口管理、凭许可证经营、贸易配额、保护消费者、不正当竞争或虚假广告的法律、法 规、条例或规章)、本协议及相关规则；&nbsp;<br />\r\nd.不会含有诽谤（包括商业诽谤）、非法恐吓或非法骚扰的内容；&nbsp;<br />\r\ne.不会含有淫秽、或包含任何儿童色情内容；&nbsp;<br />\r\nf.不会含有蓄意毁坏、恶意干扰、秘密地截取或侵占任何系统、数据或个人资料的任何病毒、伪装破坏程序、电脑蠕虫、定时程序炸弹或 其他电脑程序；&nbsp;<br />\r\ng.不会直接或间接与下述各项货物或服务连接，或包含对下述各项货物或服务的描述：(i)本协议项下禁止的货物或服务；或(ii)您无权连接或包含的货物或服务。此外，您同意不会：（ⅲ）在与任何连锁信件、大量胡乱邮寄的电子邮件、滥发电子邮件或任何复制或多余的信息有关的方面使用“服务”；(ⅳ)未经其他人士同意，利用“服务”收集其他人士的电子邮件地址及其他资料；或（ⅴ）利用“服务”制作虚假的电子邮件地址，或以其他形式试图在发送人的身份或信息的来源方面误导其他人士；&nbsp;<br />\r\nh.不含有能力资源网认为应禁止或不适合通过能力资源网网站宣传或交易。<br />\r\n<br />\r\n1.3您同意，您不会对任何资料作商业性利用，包括但不限于在未经能力资源网事先书面批准的情况下，复制在能力资源网网站上展示的任何资料并用于商业用途。能力资源网向会员提供的商品信息之编辑、编制、传播的版权和知识产权，全部由能力资源网拥有；未经能力资源网事先以书面表示同意，任何人不得以各种形式复制、散布、出售、出版、广播、转播该商品信息。<br />\r\n<br />\r\n1.4　能力资源网向会员提供的会员帐号及密码只供会员使用。如果会员将帐号或密码丢失或被盗，应及时重新登记并重新设置密码。会员造成的帐号失密，应自行承担责任。<br />\r\n<br />\r\n1.5会员如违反本协议而造成能力资源网的经济损失，能力资源网有权追究其经济责任与法律责任。<br />\r\n<br />\r\n2、关于交易的规则&nbsp;<br />\r\n2.1添加产品描述条目。产品描述是由您提供的在能力资源网网站上展示的文字描述、图画和/或照片，可以是(a)对您拥有而您希望出售的产品的描述；或(b)对您正寻找的产品的描述。您须将该等产品描述归入正确的门类内。能力资源网不对产品描述的准确性或内容负责。&nbsp;<br />\r\n2.2就交易进行协商。交易各方通过在能力资源网网站上明确描述报盘和回盘，进行相互协商。所有各方接纳报盘或回盘将使所涉及的能力资源网用户有义务完成交易。除非在特殊情况下，诸如用户在您提出报盘后实质性地更改对物品的描述或澄清任何文字输入错误，或您未能证实交易所涉及的用户的身份等，报盘和承诺均不得撤回。&nbsp;<br />\r\n2.3不得操纵交易。您同意不利用帮助实现蒙蔽或欺骗意图的同伙(下属的客户或第三方)，操纵与另一交易方所进行的商业谈判的结果。&nbsp;<br />\r\n2.4不得干扰交易系统。您同意，您不得使用任何装置、软件或例行程序干预或试图干预能力资源网网站的正常运作。您不得采取对任何将不合理或不合比例的庞大负载加诸能力资源网网络结构的行动。&nbsp;<br />\r\n2.5关于交易反馈。您不得采取任何可能损害信息反馈系统的完整性的行动，诸如：利用第二会员身份标识或第三者为您本身留下正面反馈；利用第二会员身份标识或第三者为其他用户留下负面反馈(反馈数据轰炸)；或在用户未能履行交易范围以外的某些行动时，留下负面的反馈(反馈恶意强加)。&nbsp;<br />\r\n2.6关于处理交易争议。&nbsp;<br />\r\n(i)能力资源网不涉及用户间因交易而产生的法律关系及法律纠纷，不会且不能牵涉进交易各方的交易当中。倘若您与一名或一名以上用户，或与您通过能力资源网网站获取其服务的第三者服务供应商发生争议，您免除能力资源网(及能力资源网代理人和雇员)在因该等争议而引起的，或在任何方面与该等争议有关的不同种类和性质的任何(实际和后果性的)权利主张、要求和损害赔偿等方面的责任。&nbsp;<br />\r\n(ii)能力资源网有权受理并调处您与其他用户因交易产生的争议，同时有权单方面独立判断其他用户对您的投诉及(或)索偿是否成立，若能力资源网判断索偿成立，则您应及时使用自有资金进行偿付，否则能力资源网有权使用您交纳的保证金或扣减已购能力资源网及其关联公司的产品或服务中未履行部分的费用的相应金额或您在能力资源网网站所有账户下的其他资金(或权益)等进行相应偿付。能力资源网没有使用自用资金进行偿付的义务，但若进行了该等支付，您应及时赔偿能力资源网的全部损失，否则能力资源网有权通过前述方式抵减相应资金或权益，如仍无法弥补能力资源网损失，则能力资源网保留继续追偿的权利。因能力资源网非司法机构，您完全理解并承认，能力资源网对证据的鉴别能力及对纠纷的处理能力有限，受理贸易争议完全是基于您之委托，不保证争议处理结果符合您的期望，亦不对争议处理结果承担任何责任。能力资源网有权决定是否参与争议的调处。&nbsp;<br />\r\n(iii)能力资源网有权通过电子邮件等联系方式向您了解情况，并将所了解的情况通过电子邮件等方式通知对方，您有义务配合能力资源网的工作，否则能力资源网有权做出对您不利的处理结果。&nbsp;<br />\r\n3、违反规则的后果。&nbsp;<br />\r\n3.1倘若能力资源网认为“您的资料”可能使能力资源网承担任何法律或道义上的责任，则能力资源网可自行全权决定对“您的资料”采取能力资源网认为必要或适当的任何行动，包括但不限于删除该类资料。您特此保证，您对提交给能力资源网的“您的资料”拥有全部权利，包括全部版权。您确认，能力资源网没有责任去认定或决定您提交给能力资源网的资料哪些是应当受到保护的，对享有“服务”的其他用户使用“您的资料”，能力资源网也不必负责。&nbsp;<br />\r\n3.2对于您涉嫌违反承诺的行为对任意第三方造成损害的，您均应当以自己的名义独立承担所有的法律责任，并应确保能力资源网免责。&nbsp;<br />\r\n3.3在不限制其他补救措施的前提下，发生下述任一情况，能力资源网可立即发出警告，暂时中止、永久中止或终止您的会员资格，删除您的任何现有产品信息，以及您在网站上展示的任何其他资料：(i)您违反本协议；(ii)能力资源网无法核实或鉴定您向能力资源网提供的任何资料；或(iii)能力资源网相信您的行为可能会使您、能力资源网用户或通过能力资源网或能力资源网网站提供服务的第三者服务供应商发生任何法律责任。在不限制任何其他补救措施的前提下，若发现您从事涉及能力资源网网站的诈骗活动，能力资源网可暂停或终止您的账户。&nbsp;<br />\r\n3.4经生效法律文书确认用户存在违法或违反本协议行为或者能力资源网自行判断用户涉嫌存在违法或违反本协议行为的，能力资源网有权在能力资源网中国站上以网络发布形式公布用户的违法行为并做出处罚（包括但不限于限权、终止服务等）。&nbsp;<br />\r\n<br />\r\n九、您授予的许可使用权。&nbsp;<br />\r\n您完全理解并同意不可撤销地授予能力资源网及其关联公司下列权利：&nbsp;<br />\r\n1、对于您提供的资料，您授予能力资源网及其关联公司独家的、全球通用的、永久的、免费的许可使用权利(并有权在多个层面对该权利进行再授权)，使能力资源网及其关联公司有权(全部或部份地)使用、复制、修订、改写、发布、翻译、分发、执行和展示\"您的资料\"或制作其派生作品，和/或以现在已知或日后开发的任何形式、媒体或技术，将\"您的资料\"纳入其他作品内。&nbsp;<br />\r\n2、当您违反本协议或与能力资源网签订的其他协议的约定，能力资源网有权以任何方式通知关联公司，要求其对您的权益采取限制措施，将您账户内的款项支付给能力资源网指定的对象，要求关联公司中止、终止对您提供部分或全部服务，且在其经营或实际控制的任何网站公示您的违约情况。&nbsp;<br />\r\n3、同样，当您向能力资源网关联公司作出任何形式的承诺，且相关公司已确认您违反了该承诺，则能力资源网有权立即按您的承诺约定的方式对您的账户采取限制措施，包括但不限于中止或终止向您提供服务，并公示相关公司确认的您的违约情况。您了解并同意，能力资源网无须就相关确认与您核对事实，或另行征得您的同意，且能力资源网无须就此限制措施或公示行为向您承担任何的责任。&nbsp;<br />\r\n<br />\r\n十、隐私。&nbsp;<br />\r\n尽管有第九条所规定的许可使用权，但基于保护您的隐私是能力资源网的一项基本原则，为此能力资源网还将根据能力资源网的隐私声明使用\"您的资料\"。能力资源网隐私声明的全部条款属于本协议的一部份，因此，您必须仔细阅读。请注意，您一旦自愿地在能力资源网交易地点披露\"您的资料\"，该等资料即可能被其他人士获取和使用。&nbsp;<br />\r\n<br />\r\n十一、责任范围和责任限制。&nbsp;<br />\r\n1、您明确理解和同意，能力资源网不对因下述任一情况而发生的任何损害赔偿承担责任，包括但不限于利润、商誉、使用、数据等方面的损失或其他无形损失的损害赔偿(无论能力资源网是否已被告知该等损害赔偿的可能性)：(i)使用或未能使用“服务”；(ii)因通过或从“服务”购买或获取任何货物、样品、数据、资料或服务，或通过或从“服务”接收任何信息或缔结任何交易所产生的获取替代货物和服务的费用；(iii)未经批准接入或更改您的传输资料或数据；(iv)任何其他方对“服务”的声明或关于“服务”的行为；或(v)因任何原因而引起的与“服务”有关的任何其他事宜，包括疏忽。&nbsp;<br />\r\n2、能力资源网会尽一切努力使您在使用能力资源网网站的过程中得到利益。不过能力资源网不能随时预见到任何技术上的问题或其他困难。该等困难可能会导致数据损失或其他服务中断。为此，您明确理解和同意，您使用“服务”的风险由您自行承担，且“服务”以“按现状”和“按可得到”的状态提供。能力资源网明确声明不作任何种类的明示或暗示的保证，包括但不限于关于适销性、适用于某一特定用途和无侵权行为等方面的保证。能力资源网对下述内容不作保证：(i)“服务”会符合您的要求；(ii)“服务”不会中断，且适时、安全和不带任何错误；(iii)通过使用“服务”而可能获取的结果将是准确或可信赖的；(iv)您通过“服务”而购买或获取的任何产品、服务、资料或其他材料的质量将符合您的预期。通过使用“服务”而下载或以其他形式获取任何材料是由您自行全权决定进行的，且与此有关的风险由您自行承担，对于因您下载任何该等材料而发生的您的电脑系统的任何损毁或任何数据损失，您将自行承担责任。您从能力资源网或通过或从“服务”获取的任何口头或书面意见或资料，均不产生未在本协议内明确载明的任何保证责任。&nbsp;<br />\r\n<br />\r\n十二.赔偿。&nbsp;<br />\r\n您同意，若因您违反本协议或经在此提及而纳入本协议的其他文件，或因您违反法律侵害了其他方的合法权利，或因您违反法律须承担行政或刑事责任，而使其他方或行政、司法机关对能力资源网及其关联公司董事、职员、代理人提出索赔或处罚要求（包括司法费用和其他专业人士的费用），您必须全额赔偿给能力资源网及其关联公司、董事、职员、代理人，并使其等免遭损失。&nbsp;<br />\r\n<br />\r\n十三、链接。&nbsp;<br />\r\n<br />\r\n由于能力资源网并不控制链接网站和资源，您承认并同意，能力资源网并不对该等外在网站或资源的可用性负责，且不认可该等网站或资源上或可从该等网站或资源获取的任何内容、宣传、产品、服务或其他材料，也不对其等负责或承担任何责任。您进一步承认和同意，对于任何因使用或信赖从此类网站或资源上获取的此类内容、宣传、产品、服务或其他材料而造成（或声称造成）的任何直接或间接损失，能力资源网均不承担责任。&nbsp;<br />\r\n<br />\r\n十四、通知。&nbsp;<br />\r\n1、您应当准确填写并及时更新您提供的电子邮件地址、联系电话、联系地址、邮政编码等联系方式，以使能力资源网或其他用户与您进行有效联系，因通过这些联系方式无法与您取得联系，导致您在使用能力资源网服务过程中产生任何损失或增加费用的，应由您完全独自承担。您了解并同意，您有义务保持你提供的联系方式的有效性，如有变更需要更新的，您应按能力资源网的要求进行操作。&nbsp;<br />\r\n2、除非另有明确规定，任何您与能力资源网之间的通知应以电子邮件形式发送，(就能力资源网而言)电子邮件地址为能力资源网，或(就您而言)发送到您在登记注册过程中向能力资源网提供的电子邮件地址，或有关方指明的该等其他地址。在电子邮件发出二十四(24)小时后，通知应被视为已送达，除非发送人被告知相关电子邮件地址已作废。或者，能力资源网可通过邮资预付挂号邮件并要求回执的方式，将通知发到您在登记过程中向能力资源网提供的地址。在该情况下，在付邮当日三(3)天后通知被视为已送达。&nbsp;<br />\r\n<br />\r\n十五、不可抗力。&nbsp;<br />\r\n对于因能力资源网合理控制范围以外的原因，包括但不限于自然灾害、罢工或骚乱、物质短缺或定量配给、暴动、战争行为、政府行为、通讯或其他设施故障等，致使能力资源网延迟或未能履约的，能力资源网不对您承担任何责任。&nbsp;<br />\r\n<br />\r\n十六.法律适用、管辖及其他&nbsp;<br />\r\n1、本协议之效力、解释、变更、执行与争议解决均适用中华人民共和国大陆地区法律，如无相关法律规定的，则应参照通用国际商业惯例和（或）行业惯例。&nbsp;<br />\r\n2、您与能力资源网仅为订约人关系。本协议无意结成或创设任何代理、合伙、合营、雇佣与被雇佣或特性授权与被授权关系。&nbsp;<br />\r\n3、您同意能力资源网因经营业务需要有权将本协议项下的权力义务就部分或全部进行转让，而无须再通知予您并取得您的同意。&nbsp;<br />\r\n4、因本协议或能力资源网服务所引起或与其有关的任何争议应向能力资源网所在地人民法院提起诉讼。&nbsp;<br />\r\n5、本协议取代您和能力资源网先前就相同事项订立的任何书面或口头协议。倘若本协议任何条款被裁定为无效或不可强制执行，该项条款应被撤销，而其余条款应予遵守和执行。条款标题仅为方便参阅而设，并不以任何方式界定、限制、解释或描述该条款的范围或限度。能力资源网未就您或其他人士的某项违约行为采取行动，并不表明能力资源网撤回就任何继后或类似的违约事件采取动的权利。<br />\r\n<br />\r\n能力资源网欢迎会员提出宝贵建议，共同进步！<br />\r\n<br />', '服务条款');
INSERT INTO `data` VALUES ('16', '<h1>\r\n	上海群享电子商务有限公司\r\n</h1>\r\n<br />\r\n开户银行：中国建设银行股份有限公司上海打浦路支行 <br />\r\n<br />\r\n银行账号：31001625777050007277 <br />\r\n<br />\r\n电话：13817177559 <br />\r\n<br />\r\n企业邮箱：customerservice@qunxiangcompany.com <br />\r\n<br />\r\nQQ：3229191623 tytujyjuytjjyjtyjtju<br />\r\n<br />\r\n<br />', '公司信息');
INSERT INTO `data` VALUES ('17', '岗位门类', '导航名称1');
INSERT INTO `data` VALUES ('18', '业务能人', '导航名称2');
INSERT INTO `data` VALUES ('19', '企业培训', '导航名称3');
INSERT INTO `data` VALUES ('20', '企业用户', '导航名称4');
INSERT INTO `data` VALUES ('21', '业务联系', '导航名称5');
INSERT INTO `data` VALUES ('23', 'http://www.sohu.com;upload/2015083104472040017563.jpg', '侧边栏广告');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '技术部');
INSERT INTO `department` VALUES ('2', '运营部');
INSERT INTO `department` VALUES ('3', '运维部');
INSERT INTO `department` VALUES ('4', '渠道部');
INSERT INTO `department` VALUES ('5', '市场部');
INSERT INTO `department` VALUES ('6', '网络部');
INSERT INTO `department` VALUES ('14', '采购部');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '汽车1', '6000');
INSERT INTO `goods` VALUES ('2', '维保商品1', '5000');

-- ----------------------------
-- Table structure for `industry`
-- ----------------------------
DROP TABLE IF EXISTS `industry`;
CREATE TABLE `industry` (
  `industry_id` int(11) NOT NULL AUTO_INCREMENT,
  `industry_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`industry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of industry
-- ----------------------------
INSERT INTO `industry` VALUES ('1', 'a汽车行业');
INSERT INTO `industry` VALUES ('2', 'b餐饮行业');
INSERT INTO `industry` VALUES ('3', 'z科技行业');
INSERT INTO `industry` VALUES ('4', 'e电子商务行业');
INSERT INTO `industry` VALUES ('5', 'f理发行业');
INSERT INTO `industry` VALUES ('6', 'c五金行业');
INSERT INTO `industry` VALUES ('7', 'd电器行业');
INSERT INTO `industry` VALUES ('12', 'y工业品行业');
INSERT INTO `industry` VALUES ('13', 'h互联网');
INSERT INTO `industry` VALUES ('14', 't通信，电信');
INSERT INTO `industry` VALUES ('15', 'a');
INSERT INTO `industry` VALUES ('16', 'b');
INSERT INTO `industry` VALUES ('17', 'c');
INSERT INTO `industry` VALUES ('18', 'd');
INSERT INTO `industry` VALUES ('19', 'e');
INSERT INTO `industry` VALUES ('20', 'f');
INSERT INTO `industry` VALUES ('21', 'g');
INSERT INTO `industry` VALUES ('22', 'h');
INSERT INTO `industry` VALUES ('23', 'i');
INSERT INTO `industry` VALUES ('24', 'o');
INSERT INTO `industry` VALUES ('25', 'p');
INSERT INTO `industry` VALUES ('26', 'q');
INSERT INTO `industry` VALUES ('27', 's');
INSERT INTO `industry` VALUES ('28', 't');
INSERT INTO `industry` VALUES ('29', 'u');
INSERT INTO `industry` VALUES ('30', 'v');
INSERT INTO `industry` VALUES ('31', 'w');
INSERT INTO `industry` VALUES ('32', 'x');
INSERT INTO `industry` VALUES ('33', 'y');
INSERT INTO `industry` VALUES ('34', 'z');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '购买汽车维保', '1000009');
INSERT INTO `order` VALUES ('2', '购买汽车', '1000009');

-- ----------------------------
-- Table structure for `order_cart`
-- ----------------------------
DROP TABLE IF EXISTS `order_cart`;
CREATE TABLE `order_cart` (
  `order_id` int(20) DEFAULT NULL,
  `goods_id` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_cart
-- ----------------------------
INSERT INTO `order_cart` VALUES ('2', '1');
INSERT INTO `order_cart` VALUES ('1', '1');
INSERT INTO `order_cart` VALUES ('1', '2');
INSERT INTO `order_cart` VALUES ('2', '2');

-- ----------------------------
-- Table structure for `pic`
-- ----------------------------
DROP TABLE IF EXISTS `pic`;
CREATE TABLE `pic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(250) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pic_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pic
-- ----------------------------
INSERT INTO `pic` VALUES ('4', 'zengjie7', '1000009');
INSERT INTO `pic` VALUES ('5', 'zengjie6', '1000009');

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_name` text,
  `question_answer` text,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '细菌数量仍高达10万个，因此清洁马桶是维持健康的重要措施?', '水流将污物与细菌一起卷走了');
INSERT INTO `question` VALUES ('2', '杆子问题', '桶是维持健康的重要措施每次冲完马桶，貌似湍急的水流将污物与细菌一起卷走了，');
INSERT INTO `question` VALUES ('4', '双眼失明如果不是为了装逼，那么就没有丝毫意义', '失明如果不是为了装逼，那么就没有丝毫意义');
INSERT INTO `question` VALUES ('5', '我的心，你最懂1121221', '最懂我的心，你最懂112121212');
INSERT INTO `question` VALUES ('6', 'adfs', 'bbbbb');
INSERT INTO `question` VALUES ('7', 'cccc', 'eeeee');
INSERT INTO `question` VALUES ('8', 'ddd', 'fffff');

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_content` text,
  `reply_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `reply_comment_id` int(11) DEFAULT NULL,
  `reply_user_name` varchar(255) DEFAULT NULL,
  `reply_user_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '真的那么棒吗', '2015-07-16 08:56:13', '1', '曾杰', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('2', '也不是很棒啊', '2015-07-16 08:58:44', '1', '曾界', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('3', '撒地方撒地方舒舒服服撒地方', '2015-07-16 11:55:21', '1', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('4', '士大夫士大夫的是撒地方', '2015-07-16 11:56:50', '1', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('5', '发的鬼地方个电饭锅电饭锅电饭锅', '2015-07-16 11:56:59', '1', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('6', '士大夫士大夫士大夫士大夫似的士大夫', '2015-07-16 12:04:15', '7', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('7', '回复5楼:是的撒地方是滴是滴撒地方撒地方', '2015-07-16 12:15:18', '8', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('8', '回复匿名用户:sdsdfsdsdf', '2015-08-03 09:49:24', '15', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('9', '回复匿名用户:11111地方地方', '2015-08-03 09:49:22', '21', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('10', '回复6楼:撒地方实打实地方士大夫士大夫士大夫士大夫士大夫', '2015-07-16 17:30:58', '21', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('11', '回复匿名用户:士大夫士大夫似的方式', '2015-08-03 09:49:19', '21', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('12', '回复匿名用户:撒地方撒地方士大夫士大夫似的方式的', '2015-08-03 09:49:17', '21', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('13', '回复匿名用户:撒地方撒地方士大夫士大夫似的方式的', '2015-08-03 09:49:15', '21', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('14', '回复匿名用户:撒地方撒地方士大夫士大夫似的方式的', '2015-08-03 09:49:13', '21', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('15', '回复匿名用户:撒地方撒地方士大夫士大夫似的方式的', '2015-08-03 09:49:11', '21', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('16', '回复6楼:是梵蒂冈大风歌大风歌电饭锅电饭锅电饭锅的地方', '2015-07-16 17:36:15', '21', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('17', '回复匿名用户:撒地方撒地方实打实', '2015-08-03 09:49:07', '22', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('18', '回复匿名用户:sdfsdfsdfsd', '2015-08-03 09:49:05', '23', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('19', '回复匿名用户:1212122121212121', '2015-08-03 09:49:03', '2', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('20', '回复匿名用户:21111111111111111111', '2015-08-03 09:49:01', '2', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('21', '回复匿名用户:撒地方撒地方士大夫士大夫似的方式分的', '2015-08-03 09:48:58', '30', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('22', '回复1楼:sdsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdf', '2015-07-29 08:21:32', '16', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('23', '回复匿名用户:sfsdfsdffffffffffff', '2015-08-03 09:48:53', '15', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('24', '回复匿名用户:2313werewrwrwr', '2015-08-03 09:48:49', '39', 'admin1', 'upload/2015073008051348215318.jpg');
INSERT INTO `reply` VALUES ('25', '回复匿名用户:是是是是是是是是是是是是', '2015-08-03 09:48:47', '52', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('26', '回复:匿名用户我们么么么么么么么么么么么么', '2015-08-03 09:47:49', '57', '匿名用户', 'upload/niming.jpg');
INSERT INTO `reply` VALUES ('27', '回复:那一抹情:是是是是是是是是是是是', '2015-08-13 09:55:08', '65', '匿名用户', 'upload/niming.jpg');

-- ----------------------------
-- Table structure for `train`
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train` (
  `train_id` int(11) NOT NULL AUTO_INCREMENT,
  `train_name` varchar(255) DEFAULT NULL,
  `train_price` double DEFAULT NULL,
  `train_poqiedu` int(11) DEFAULT NULL COMMENT '1-10之间',
  `train_industry_id` int(11) DEFAULT NULL COMMENT '所处行业编号',
  `train_user_id` int(11) DEFAULT NULL,
  `train_is_top` int(11) DEFAULT NULL,
  `business_type_id` int(11) DEFAULT NULL,
  `train_connecter` varchar(255) DEFAULT NULL,
  `train_phone` varchar(255) DEFAULT NULL,
  `train_mobile` varchar(255) DEFAULT NULL,
  `train_email` varchar(255) DEFAULT NULL,
  `train_time` timestamp NULL DEFAULT NULL,
  `train_qq` varchar(255) DEFAULT NULL,
  `train_view_count` int(11) DEFAULT NULL,
  `train_focus_count` int(11) DEFAULT NULL,
  `train_status` int(11) DEFAULT NULL COMMENT '0未审核 1通过 2不通过',
  `train_type` int(11) DEFAULT NULL COMMENT '1代表供应  2代表需求',
  `train_teacher` varchar(255) DEFAULT NULL,
  `train_company_name` varchar(255) DEFAULT NULL,
  `train_company_email` varchar(255) DEFAULT NULL,
  `train_address` varchar(255) DEFAULT NULL,
  `train_require` text COMMENT '对培训的要求(需求方才有)',
  `train_question_challenge` text,
  `train_content_outline` text,
  `train_company_des` text,
  `train_other` text,
  `train_img1` varchar(255) DEFAULT NULL,
  `train_img2` varchar(255) DEFAULT NULL,
  `train_img3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`train_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES ('25', '培训课程主题', '130', '10', '15', '1000011', '0', '6', '曾杰', '13554014654', '13554014654', 'nutterzen@qq.com', '2015-08-31 16:58:43', '1063304800', '3', '0', '1', '1', '曾老师', '上海惠多超市', null, '河北省;唐山市;-1', '', '问题很多啊', '精彩内容介绍和培训大纲没有什么的', '<p>\r\n	上海惠多超市有限公司主要经营：null等产品。公司尊崇“踏实、拼搏、责任”的企业精神，并以诚信、共赢、开创经营理念，创造良好的企业环境，以\r\n全新的管理模式，完善的技术，周到的服务，卓越的品质为生存根本，我们始终坚持用户至上 用心服务于客户，坚持用自己的服务去打动客户。\r\n</p>\r\n<p>\r\n	欢迎各位新老客户来我公司参观指导工作，我公司具体的地址是：上海市金山区亭林镇寺平北路111弄28号二、三楼 。\r\n</p>\r\n<p>\r\n	您如果对我们的产品感兴趣或者有任何的疑问，您可以直接给我们留言或直接与我们联络，我们将在收到您的信息后，会第一时间及时与您联络。\r\n</p>', '没有其他', 'upload/logo.jpg', 'upload/logo.jpg', null);
INSERT INTO `train` VALUES ('26', '诺手教程', '0', '1', '15', '1000011', '0', '2', '曾杰', '13554014654', '13554014654', 'nutterzen@qq.com', '2015-08-31 17:01:15', '1063304800', '4', '0', '1', '2', '', '上海惠多超市', null, '天津市;河东区;-1', '希望达到20-0的战绩', '诺手的q消弱了。。。。', '', '<p>\r\n	上海惠多超市有限公司主要经营：null等产品。公司尊崇“踏实、拼搏、责任”的企业精神，并以诚信、共赢、开创经营理念，创造良好的企业环境，以\r\n全新的管理模式，完善的技术，周到的服务，卓越的品质为生存根本，我们始终坚持用户至上 用心服务于客户，坚持用自己的服务去打动客户。\r\n</p>\r\n<p>\r\n	欢迎各位新老客户来我公司参观指导工作，我公司具体的地址是：上海市金山区亭林镇寺平北路111弄28号二、三楼 。\r\n</p>\r\n<p>\r\n	您如果对我们的产品感兴趣或者有任何的疑问，您可以直接给我们留言或直接与我们联络，我们将在收到您的信息后，会第一时间及时与您联络。\r\n</p>', '没有其他的要求', 'upload/2015083105165940083665.jpg', '', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_age` int(11) DEFAULT NULL,
  `user_is_top` int(11) DEFAULT NULL,
  `user_gender` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT '',
  `user_mobile` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_school` varchar(255) DEFAULT '未填写',
  `user_job` varchar(255) DEFAULT '未填写',
  `user_edu` varchar(255) DEFAULT '未填写',
  `user_qq` varchar(255) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_conecter` varchar(255) DEFAULT NULL,
  `user_company_name` varchar(255) DEFAULT NULL,
  `user_register_time` timestamp NULL DEFAULT NULL,
  `user_favorites` text,
  `user_company_des` text,
  `user_focus_count` int(11) DEFAULT '0',
  `user_status` int(11) DEFAULT NULL,
  `user_type_id` int(11) DEFAULT NULL COMMENT '1.个人用户   2.企业用户',
  `user_detail_des` text,
  `user_self_des` text,
  `user_img1` varchar(255) DEFAULT NULL,
  `user_img2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000037 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('999999', '匿名用户', null, '23', null, '男', '', null, null, null, null, null, null, '湖北省;孝感市;-1', null, null, '2015-08-20 00:00:00', null, null, '8', '1', '1', null, null, 'upload/niming.jpg', null);
INSERT INTO `user` VALUES ('1000000', 'admin1', 'a18c4d926fec3cd2ddd03dc4ed7e8c0d', '45', null, '男', null, '13554014654', '2281558656@qq.com', null, null, null, '2281558656', '湖北省;孝感市;-1', '曾', null, '2015-08-21 00:00:00', null, null, '7', '1', '1', '&nbsp;杆子, &nbsp;杆子', null, 'upload/201508031008599900553.jpg', '');
INSERT INTO `user` VALUES ('1000001', 'admin_2015', '21232f297a57a5a743894a0e4a801fc3', '34', null, '男', null, null, null, null, null, null, null, '湖北省;孝感市;-1', null, null, '2015-08-22 00:00:00', null, null, '6', '1', '1', null, null, null, null);
INSERT INTO `user` VALUES ('1000002', 'wudong', 'ade36b0117174557b035c802ffec2b90', '23', null, '女', '15001704729', '15001704729', 'wd@qunhai.net', null, null, null, '304000954', '湖北省;孝感市;-1', '吴东', '无业', '2015-08-23 00:00:00', null, '我是互联网工作9年', '5', '1', '1', '', '', '', '');
INSERT INTO `user` VALUES ('1000004', 'ddd@aliyun.com', '52c69e3a57331081823331c4e69d3f2e', '12', '0', '男', '15001704729', null, null, null, null, null, null, '湖北省;孝感市;-1', null, '上海鼎镭电子科技有限公司', '2015-08-20 00:00:00', null, '粘结剂，胶带等产品线丰富，库存充足。粘结剂，胶带等产品线丰富，库存充足。粘结剂，胶带等产品线丰富，库存充足。粘结剂，胶带等产品线丰富，库存充足。粘结剂，胶带等产品线丰富，库存充足。粘结剂，胶带等产品线丰富，库存充足。粘结剂，胶带等产品线丰富，库存充足。粘结剂，胶带等产品线丰富，库存充足。粘结剂，胶带等产品线丰富，库存充足。粘结剂，胶带等产品线丰富，库存充足。粘结剂，胶带等产品线丰富，库存充足。', '0', '0', '2', null, null, null, null);
INSERT INTO `user` VALUES ('1000007', 'wudong1', 'ade36b0117174557b035c802ffec2b90', '34', null, '男', null, '15001704729', '304000954@qq.com', null, null, null, '304000954', '湖北省;孝感市;-1', '吴东', null, '2015-08-20 00:00:00', null, null, '7', '1', '1', '互联网网站建设方面', null, null, null);
INSERT INTO `user` VALUES ('1000008', 'qunhai', 'eb5e22c2255f900d5142a90fb4c29e8f', '12', null, '男', '15001704729', null, 'wd@qunhai.net', null, null, null, '734589657', '湖北省;孝感市;-1', '吴东', '上海群海电子商务有限公司', '2015-08-20 00:00:00', null, '上海群海电子商务有限公司 互联网一站式托管商。', '0', '0', '2', null, null, null, null);
INSERT INTO `user` VALUES ('1000009', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '23', null, '女', null, '13554014654', '13554014654@qq.com', null, null, null, '13554014654', '湖北省;孝感市;-1', 'ganzi', null, '2015-08-20 00:00:00', null, null, '5', '1', '1', 'ganzi henhao', null, '', '');
INSERT INTO `user` VALUES ('1000010', '企业用户', 'e10adc3949ba59abbe56e057f20f883e', '12', null, '女', '12345678901', null, '12345678901@qq.com', null, null, null, '12345678901', '山西省;大同市;左云县', '朱佳宁', '武汉万安', '2015-08-20 00:00:00', null, '12345678901123456789011234567890112345678901', '3', '0', '2', null, null, null, null);
INSERT INTO `user` VALUES ('1000011', '那一抹情', 'e10adc3949ba59abbe56e057f20f883e', '34', '0', '男', '13554014654', null, 'nutterzen@qq.com', null, null, null, '1063304800', '上海市;市辖区;黄浦区', '曾杰', '上海惠多超市', '2015-08-20 00:00:00', 'business:19;', '<p>\r\n	上海惠多超市有限公司主要经营：null等产品。公司尊崇“踏实、拼搏、责任”的企业精神，并以诚信、共赢、开创经营理念，创造良好的企业环境，以\r\n全新的管理模式，完善的技术，周到的服务，卓越的品质为生存根本，我们始终坚持用户至上 用心服务于客户，坚持用自己的服务去打动客户。\r\n</p>\r\n<p>\r\n	欢迎各位新老客户来我公司参观指导工作，我公司具体的地址是：上海市金山区亭林镇寺平北路111弄28号二、三楼 。\r\n</p>\r\n<p>\r\n	您如果对我们的产品感兴趣或者有任何的疑问，您可以直接给我们留言或直接与我们联络，我们将在收到您的信息后，会第一时间及时与您联络。\r\n</p>', '4', '4', '2', null, null, null, null);
INSERT INTO `user` VALUES ('1000012', 'sss', '9f6e6800cfae7749eb6c486619254b9c', '56', null, '女', null, '13554014654', 'nutterze@qq.com', null, null, null, '1063304800', '北京市;东城区;-1', '曾杰', null, '2015-08-20 00:00:00', null, null, '0', null, '1', '四郎了<br />', null, null, null);
INSERT INTO `user` VALUES ('1000013', 'test', 'e10adc3949ba59abbe56e057f20f883e', '45', null, '男', null, '135540146564', '135540146564@qq.com', null, null, null, '135540146564', '北京市;-1;-1', 'zengchang', null, '2015-08-20 00:00:00', null, null, '0', null, '1', 'zehngchang &nbsp;is a dog', null, null, null);
INSERT INTO `user` VALUES ('1000016', '猪八', 'e10adc3949ba59abbe56e057f20f883e', '78', '1', '女', '123456', null, '123456', null, null, null, '123456', null, '123456', '123456', '2015-08-20 00:00:00', 'train:2;', '123456123456123456123456', '0', '0', '2', null, null, null, 'upload/2015082003110118662596.jpg');
INSERT INTO `user` VALUES ('1000017', 'zengchang', 'e10adc3949ba59abbe56e057f20f883e', '25', null, '男', null, '123', '123@', null, null, null, '123', '河北省;石家庄市;-1', 'zc', null, '2015-08-26 17:03:35', null, null, null, null, '1', 'sdfsdfasdfasfas<img src=\"/qunxiang/attached/image/20150826/20150826170148_474.jpg\" alt=\"\" />', null, null, null);
INSERT INTO `user` VALUES ('1000028', '凤小雨天', 'afb38e637eecf7972fa3f1230aff5385', null, '0', null, '13554014654', null, 'nutterzen@qq.com', null, null, null, '1063304800', null, '曾杰', '上海羽博商务有限公司', '2015-08-31 14:51:43', null, '<div class=\"lemma-summary\">\r\n	<div class=\"para\">\r\n		百度（Nasdaq：BIDU）是全球最大的中文搜索引擎、最大的中文网站。2000年1月由<a target=\"_blank\" href=\"http://baike.baidu.com/view/2375.htm\">李彦宏</a>创立于北京中关村，致力于向人们提供“简单，可依赖”的信息获取方式。“<a target=\"_blank\" href=\"http://baike.baidu.com/view/262.htm\">百度</a>”二字源于<a target=\"_blank\" href=\"http://baike.baidu.com/view/61891.htm\">中国</a><a target=\"_blank\" href=\"http://baike.baidu.com/view/23604.htm\">宋朝</a>词人<a target=\"_blank\" href=\"http://baike.baidu.com/view/2982.htm\">辛弃疾</a>的《<a target=\"_blank\" href=\"http://baike.baidu.com/view/143077.htm\">青玉案·元夕</a>》词句“<a target=\"_blank\" href=\"http://baike.baidu.com/view/287064.htm\">众里寻他千百度</a>”，象征着百度对中文信息检索技术的执著追求。\r\n	</div>\r\n	<div class=\"para\">\r\n		2015年1月24日，百度创始人、董事长兼CEO<a target=\"_blank\" href=\"http://baike.baidu.com/view/2375.htm\">李彦宏</a>在百度2014年会暨十五周年庆典上发表的主题演讲中表示，十五年来，百度坚持相信技术的力量，始终把简单可依赖的文化和人才成长机制当成最宝贵的财富，他号召百度全体员工，向连接人与服务的战略目标发起进攻。<sup>[1]</sup><a name=\"ref_[1]_5583090\"></a>&nbsp;\r\n	</div>\r\n</div>', '0', '0', '2', null, null, 'upload/logo.jpg', null);
INSERT INTO `user` VALUES ('1000032', '那枪很伤', 'e10adc3949ba59abbe56e057f20f883e', null, '0', null, '的师范生', null, '士大夫士大夫', null, null, null, '是大法官撒地方', null, '曾杰', '上海那情很伤', '2015-08-31 15:08:44', null, '撒地方士大夫士大夫士大夫', '0', '0', '2', null, null, 'upload/logo.jpg', null);
INSERT INTO `user` VALUES ('1000034', '123465', 'e10adc3949ba59abbe56e057f20f883e', null, '0', null, '123456', null, '123456', null, null, null, '123456', null, '123456', '123456', '2015-08-31 16:16:21', null, '123456', '0', '0', '2', null, null, 'upload/20150831041621022585511.tmp', 'upload/2015083104162185162127.tmp');
INSERT INTO `user` VALUES ('1000035', '456789', 'e35cf7b66449df565f93c607d5a81d09', null, '0', null, '456789', null, '456789', null, null, null, '456789', null, '456789', '456789', '2015-08-31 16:19:09', null, '456789', '0', '0', '2', null, null, 'upload/logo.jpg', 'upload/201508310419099874264.jpg');
INSERT INTO `user` VALUES ('1000036', '赫连勃勃大王', 'e10adc3949ba59abbe56e057f20f883e', '25', null, '男', null, '123', '123', '北京大学', '计算机', '本科', '123', '河北省;石家庄市;-1', '123', null, '2015-09-02 12:05:10', null, null, null, null, '1', '我的工作经验', null, null, null);

-- ----------------------------
-- Table structure for `vote`
-- ----------------------------
DROP TABLE IF EXISTS `vote`;
CREATE TABLE `vote` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_title` varchar(255) DEFAULT NULL,
  `vote_require` text,
  `vote_question_challenge` text,
  `vote_content_outline` text COMMENT '内容和大纲',
  `vote_company_name` varchar(255) DEFAULT NULL,
  `vote_connecter` varchar(255) DEFAULT NULL,
  `vote_mobile` varchar(255) DEFAULT NULL,
  `vote_phone` varchar(255) DEFAULT NULL,
  `vote_qq` varchar(255) DEFAULT NULL,
  `vote_other` varchar(255) DEFAULT NULL,
  `publish_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `auther` varchar(255) DEFAULT 'admin',
  `vote_comment_count` int(11) DEFAULT '0',
  `vote_focus_count` int(11) DEFAULT '0',
  `vote_view_count` int(11) DEFAULT '0',
  `vote_industry_id` int(11) DEFAULT NULL,
  `vote_user_id` int(11) DEFAULT NULL,
  `vote_type` int(11) DEFAULT NULL COMMENT '1代表需求2代表供应  ',
  `vote_status` int(11) DEFAULT NULL COMMENT '0未审核 1通过 2不通过',
  `vote_is_top` int(11) DEFAULT NULL,
  `business_type_id` int(11) DEFAULT NULL,
  `vote_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote
-- ----------------------------
INSERT INTO `vote` VALUES ('1', '需求:成功案例：2000年“华城杯”全球青年新概念商业建筑综合体设计大赛1', '要求', '成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛', '培训内容介绍和大纲:用户遇到的问题和挑', '上海工业', '韩月', '13905689517', '13905689517', '1063304811', '在一个公司中设计规范是有层次的，一般分为三个层次：一是公司级别的设计规范，主要是对公司整体的用户体验、品牌、视觉等方面的规范； 二是某一类产品线的设计规范一个公司中设计规范是有层次的。', '2015-08-11 13:20:53', '曾杰', '555', '86', '153', '2', '1', '1', '1', '1', '1', 'nutterzen@qq.com');
INSERT INTO `vote` VALUES ('2', '需求:成功案例：2001年“华城杯”全球青年新概念商业建筑综合体设计大赛2', '要求', '用户遇到的问题和挑战用户遇到的问题和挑战', '培训内容介绍和大纲:用户遇到的问题和挑', '上海工业', '韩月', '13905689517', '13905689517', '1063304811', '在一个公司中设计规范是有层次的，一般分为三个层次：一是公司级别的设计规范，主要是对公司整体的用户体验、品牌、视觉等方面的规范； 二是某一类产品线的设计规范一个公司中设计规范是有层次的。', '2015-08-11 13:20:57', '曾小', '55', '99', '223', '3', '1', '1', '1', '1', '1', '1063304800@qq.com');
INSERT INTO `vote` VALUES ('3', '需求:成功案例：2002年“华城杯”', '要求', '用户遇到的问题和挑战用户遇到的问题和挑战', '培训内容介绍和大纲:用户遇到的问题和挑战', '上海工业', '韩月', '13905689517', '13905689517', '1063304811', '在一个公司中设计规范是有层次的，一般分为三个层次：一是公司级别的设计规范，主要是对公司整体的用户体验、品牌、视觉等方面的规范； 二是某一类产品线的设计规范一个公司中设计规范是有层次的。', '2015-08-11 13:21:00', '长乐', '60', '83', '72', '3', '1', '1', '1', '1', '1', '1063304800@qq.com');
INSERT INTO `vote` VALUES ('4', '需求:成功案例：2003年“华城杯”全球青年新概念商业建筑综合体设计大赛4', '要求', '用户遇到的问题和挑战用户遇到的问题和挑战', '培训内容介绍和大纲:用户遇到的问题和挑', '上海工业', '韩月', '13905689517', '13905689517', '1063304811', '在一个公司中设计规范是有层次的，一般分为三个层次：一是公司级别的设计规范，主要是对公司整体的用户体验、品牌、视觉等方面的规范； 二是某一类产品线的设计规范一个公司中设计规范是有层次的。', '2015-08-11 13:21:05', '小欢', '70', '95', '155', '3', '1', '2', '1', '1', '1', '1063304800');
INSERT INTO `vote` VALUES ('5', '需求:成功案例：2004年“华城杯”全球青年新概念商业建筑综合体设计大赛5', '要求', '挑战', '培训内容介绍和大纲:用户遇到的问题和挑', '万安', '韩月', '13905689517', '13554014654', '2281558656', '其他', '2015-08-11 13:21:09', 'admin', '0', '4', '11', '7', '1', '2', '1', '1', '1', '2281558656@qq.com');
INSERT INTO `vote` VALUES ('6', '需求:成功案例：2005年“华城杯”全球青年新概念商业建筑综合体设计大赛11', '要求1', '挑战1', '培训内容介绍和大纲:用户遇到的问题和挑', '万安1', '韩月', '13905689517', '13554014654', '13554014654', '其他1', '2015-08-11 13:21:13', 'admin', '0', '1', '11', '3', '1', '2', '1', '1', '1', '123465@qq.com');
INSERT INTO `vote` VALUES ('7', '需求:成功案例：2006年“华城杯”全球青年新概念商业建筑综合体设计大赛10', '要求', '挑战', '培训内容介绍和大纲:用户遇到的问题和挑', '上海工业', '韩月', '13905689517', '13554014654', '13554014654', '其他', '2015-08-11 13:21:17', 'admin', '0', '5', '17', '3', '1', '1', '1', '1', '1', '123465@qq.com');
INSERT INTO `vote` VALUES ('8', '需求:成功案例：2007年“华城杯”全球青年新概念商业建筑综合体设计大赛9', '要求', '挑战', '培训内容介绍和大纲:用户遇到的问题和挑', '上海工业', '韩月', '13905689517', '13554014654', '13554014654', '其他', '2015-08-11 13:21:21', 'admin', '0', '1', '17', '1', '1', '1', '1', '1', '1', '123465@qq.com');
INSERT INTO `vote` VALUES ('9', '需求:成功案例：2008年“华城杯”全球青年新概念商业建筑综合体设计大赛8', '要求', '挑战', '培训内容介绍和大纲:用户遇到的问题和挑', '上海工业', '韩月', '13905689517', '13554014654', '13554014654', '其他', '2015-08-11 13:21:24', 'admin', '0', '3', '4', '3', '1', '1', '1', '1', '2', '123465@qq.com');
INSERT INTO `vote` VALUES ('10', '需求:成功案例：2009年“华城杯”全球青年新概念商业建筑综合体设计大赛7', '要求', '挑战', '培训内容介绍和大纲:用户遇到的问题和挑', '上海工业', '韩月', '13905689517', '13554014654', '13554014654', '其他', '2015-08-11 13:21:27', 'admin', '0', '3', '5', '5', '1', '1', '1', '0', '2', '123465@qq.com');
INSERT INTO `vote` VALUES ('11', '需求:成功案例：2010年“华城杯”全球青年新概念商业建筑综合体设计大赛6', '要求', '挑战', '培训内容介绍和大纲:用户遇到的问题和挑', '上海工业', '韩月', '13905689517', '13554014654', '13554014654', '其他', '2015-08-11 13:21:31', 'admin', '0', '5', '6', '3', '1', '2', '1', '0', '2', '123465@qq.com');
INSERT INTO `vote` VALUES ('12', '需求:成功案例：2012年“华城杯”全球青年新概念商业建筑综合体设计大赛1', '123', '成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛', '培训内容介绍和大纲:用户遇到的问题和挑', '上海工业', '韩月', '13905689517', '13905689517', '1063304811', '在一个公司中设计规范是有层次的，一般分为三个层次：一是公司级别的设计规范，主要是对公司整体的用户体验、品牌、视觉等方面的规范； 二是某一类产品线的设计规范一个公司中设计规范是有层次的。', '2015-08-11 13:21:33', '曾杰', '555', '82', '78', '3', '1', '1', '1', '0', '2', 'nutterzen@qq.com');
INSERT INTO `vote` VALUES ('13', '需求:成功案例：2013年“华城杯”全球青年新概念商业建筑综合体设计大赛6', '要求', '挑战', '培训内容介绍和大纲:用户遇到的问题和挑', '上海工业', '韩月', '13905689517', '13554014654', '13554014654', '其他', '2015-08-11 13:21:35', 'admin', '0', '5', '7', '3', '1', '2', '1', '0', '2', '123465@qq.com');
INSERT INTO `vote` VALUES ('14', '需求:成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛1', '123', '成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛成功案例：2014年“华城杯”全球青年新概念商业建筑综合体设计大赛', '培训内容介绍和大纲:用户遇到的问题和挑', '上海工业', '韩月', '13905689517', '13905689517', '1063304811', '在一个公司中设计规范是有层次的，一般分为三个层次：一是公司级别的设计规范，主要是对公司整体的用户体验、品牌、视觉等方面的规范； 二是某一类产品线的设计规范一个公司中设计规范是有层次的。', '2015-08-05 10:19:00', '曾杰', '555', '82', '70', '2', '1', '1', '1', '0', '1', 'nutterzen@qq.com');
INSERT INTO `vote` VALUES ('15', '需求:成功案例：2015年“华城杯”', '要求', '挑战', '培训内容介绍和大纲:用户遇到的问题和挑', '上海工业', '韩月', '13905689517', '13554014654', '13554014654', '其他', '2015-08-11 13:21:39', 'admin', '0', '6', '14', '6', '1', '2', '1', '0', '1', '123465@qq.com');
INSERT INTO `vote` VALUES ('17', '培训主题', '对培训的要求', '用户遇到的问题和挑战', null, '公司名称', '曾', null, '13554014654', '2281558656', '其他', '2015-08-05 10:19:02', 'admin', '0', '0', '4', '1', '1000000', '2', '0', '0', '1', '2281558656@qq.com');
INSERT INTO `vote` VALUES ('18', '培训主题', '用户遇到的问题和挑战', '用户遇到的问题和挑战', null, '杆子的公司', '杆子', null, '13554014654', '2281558656', '用户遇到的问题和挑战', '2015-08-05 10:19:02', 'admin', '0', '0', '2', '4', '1000000', '2', '1', '0', '1', '2281558656@qq.com');
INSERT INTO `vote` VALUES ('19', '培训主题', '对培训的要求', '用户遇到的问题和挑战', null, '公司名称', '曾', null, '13554014654', '2281558656', '', '2015-08-05 10:19:03', 'admin', '0', '1', '8', '5', '1000000', '2', '1', '0', '1', '2281558656@qq.com');
INSERT INTO `vote` VALUES ('20', 'test', '对培训的要求', '用户遇到的问题和挑战', null, 'test', 'test', null, '13554014654', '2281558656', '其他', '2015-08-05 10:19:04', 'admin', '0', '0', '20', '1', '1000000', '2', '1', '0', '3', '2281558656@qq.com');
INSERT INTO `vote` VALUES ('22', '123', '要求', '123123', '123123', '123', '123', '13554014654', '13554014654', '2281558656', '123', '2015-08-05 10:19:05', 'admin', '0', '0', '6', '12', '1000000', '1', '1', '0', '3', '2281558656@qq.com');
INSERT INTO `vote` VALUES ('23', '打造社会精英', '对培训的要求对培训的要求对培训的要求对培训的要求', '打造社会精英有限责任公司打造社会精英有限责任公司打造社会精英有限责任公司 用户遇到的问题和挑战 用户遇到的问题和挑战 用户遇到的问题和挑战 用户遇到的问题和挑战 用户遇到的问题和挑战', null, '打造社会精英有限责任公司', '曾杰', null, '13554014654', '861680976', 'sdssddsdssdsdsd', '2015-08-05 10:19:05', 'admin', '0', '0', '1', '1', '1000003', '2', '1', '0', '3', 'nutterzen@qq.com');
INSERT INTO `vote` VALUES ('24', '打造社会精英', null, '用户遇到的问题和挑战用户遇到的问题和挑战', '用户遇到的问题和挑战用户遇到的问题和挑战培训内容介绍和大纲培训内容介绍和大纲培训内容介绍和大纲', '打造社会精英有限责任公司', '曾杰', '13554014654', '13554014654', '1063304800', 'ssss', '2015-08-05 10:19:06', 'admin', '0', '0', '1', '1', '1000003', '1', '1', '0', '3', 'nutterzen@qq.com');
INSERT INTO `vote` VALUES ('25', '主题', '对培训的要求', ' 用户遇到的问题和挑战', null, '公司名称', null, null, null, null, '', '2015-08-05 10:19:07', 'admin', '0', '1', '0', '4', '1000000', '1', '1', '0', '3', null);
