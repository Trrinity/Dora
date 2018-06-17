/*
 * 
Source Server         : 120.25.170.124_3306
Source Server Version : 50627
Source Host           : 120.25.170.124:3306
Source Database       : Dora

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2018-03-02 16:01:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2018-02-12');

-- ----------------------------
-- Table structure for `t_attachment`//pter works
-- ----------------------------
DROP TABLE IF EXISTS `t_attachment`;
CREATE TABLE `t_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worksId` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `createTime` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `worksId` (`worksId`),
  CONSTRAINT `t_attachment_ibfk_1` FOREIGN KEY (`worksId`) REFERENCES `t_works` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_attachment
-- ----------------------------
INSERT INTO `t_attachment` VALUES ('2', '3', '/uploads/images/1.jpeg', '2018-03-17', '0');
INSERT INTO `t_attachment` VALUES ('3', '3', '/uploads/images/2.jpeg', '2018-03-17', '0');
INSERT INTO `t_attachment` VALUES ('4', '4', '/uploads/images/3.jpeg', '2018-03-17', '0');
INSERT INTO `t_attachment` VALUES ('5', '4', '/uploads/images/4.jpeg', '2018-03-17', '0');
INSERT INTO `t_attachment` VALUES ('6', '5', '/uploads/images/5.jpg', '2018-03-17','0');

-- ----------------------------
-- Table structure for `t_banner`
-- ----------------------------
DROP TABLE IF EXISTS `t_banner`;
CREATE TABLE `t_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `createTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_banner
-- ----------------------------
INSERT INTO `t_banner` VALUES ('1', '首页图1', '/uploads/banner/1.jpg', '2018-01-08');
INSERT INTO `t_banner` VALUES ('2', '首页图2', '/uploads/banner/2.jpg', '2018-02-08');
INSERT INTO `t_banner` VALUES ('3', '首页图3', '/uploads/banner/3.jpg', '2018-03-08');
INSERT INTO `t_banner` VALUES ('4', '首页图4', '/uploads/banner/4.jpg', '2018-03-08');
INSERT INTO `t_banner` VALUES ('5', '首页图5', '/uploads/banner/5.jpg', '2018-04-08');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `photographerId` int(11) NOT NULL,
  `comment` text,
  `createTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `photographerId` (`photographerId`),
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`photographerId`) REFERENCES `t_photographer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('5', '5', '10', '真不错', '2018-03-03');

-- ----------------------------
-- Table structure for `t_photographer`
-- ----------------------------
DROP TABLE IF EXISTS `t_photographer`;
CREATE TABLE `t_photographer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` text,
  `createTime` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_photographer
-- ----------------------------
INSERT INTO `t_photographer` VALUES ('1', '/uploads/photographer/1.jpg', '测试摄影师1', '测试摄影师1', '2018-03-03', '0');
INSERT INTO `t_photographer` VALUES ('2', '/uploads/photographer/2.jpg', '测试摄影师2', '测试摄影师2', '2018-03-03', '0');
INSERT INTO `t_photographer` VALUES ('3', '/uploads/photographer/3.jpg', '测试摄影师3', '测试摄影师3', '2018-03-03', '0');
INSERT INTO `t_photographer` VALUES ('4', '/uploads/photographer/4.jpg', '测试摄影师4', '测试摄影师4', '2018-03-03', '0');

-- ----------------------------
-- Table structure for `t_photographer_spots`
-- ----------------------------
DROP TABLE IF EXISTS `t_photographer_spots`;
CREATE TABLE `t_photographer_spots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spotsId` int(11) NOT NULL,
  `photographerId` int(11) NOT NULL,
  `createTime` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spotsId` (`spotsId`),
  KEY `photographerId` (`photographerId`),
  CONSTRAINT `t_photographer_spots_ibfk_1` FOREIGN KEY (`spotsId`) REFERENCES `t_spots` (`id`),
  CONSTRAINT `t_photographer_spots_ibfk_2` FOREIGN KEY (`photographerId`) REFERENCES `t_photographer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_photographer_spots
-- ----------------------------
INSERT INTO `t_photographer_spots` VALUES ('1', '1', '1', '2017-03-03', '0');
INSERT INTO `t_photographer_spots` VALUES ('2', '2', '2', '2017-03-03', '0');
INSERT INTO `t_photographer_spots` VALUES ('3', '3', '3', '2017-03-03', '0');
INSERT INTO `t_photographer_spots` VALUES ('4', '4', '4', '2017-03-03', '0');

-- ----------------------------
-- Table structure for `t_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `t_schedule`;
CREATE TABLE `t_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `photographerId` int(11) NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `createTime` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '0有空 1有预约 2无档期3过期',
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`id`),
  KEY `photographerId` (`photographerId`),
  CONSTRAINT `t_schedule_ibfk_2` FOREIGN KEY (`photographerId`) REFERENCES `t_photographer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_schedule
-- ----------------------------
INSERT INTO `t_schedule` VALUES ('1', '5', '1', '2017-03-10', '2017-03-10', '2017-03-03', '1', '测试', '男', '13539767578', '', '');
INSERT INTO `t_schedule` VALUES ('2', '5', '2', '2017-03-03', '2017-03-03', '2017-03-03', null, '测试2', '男', '13111111111', '', '');
INSERT INTO `t_schedule` VALUES ('3', '1', '3', '2017-03-11', '2017-03-13', '2017-03-03', '1', null, null, null, null, null);
INSERT INTO `t_schedule` VALUES ('4', '1', '4', '2017-03-09', '2017-03-13', '2017-03-03', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_spots`
-- ----------------------------
DROP TABLE IF EXISTS `t_spots`;
CREATE TABLE `t_spots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `content` text,
  `path` varchar(255) DEFAULT NULL,
  `createTime` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_spots
-- ----------------------------
INSERT INTO `t_spots` VALUES ('1', '北京', '颐和园', '/uploads/spots/1.jpg', '2017-03-03', '1');
INSERT INTO `t_spots` VALUES ('2', '西安', '兵马俑', '/uploads/spots/2.jpg', '2017-03-03', '1');
INSERT INTO `t_spots` VALUES ('3', '西安', '大雁塔', '/uploads/spots/3.jpg', '2017-03-03', '1');
INSERT INTO `t_spots` VALUES ('4', '西安', '陕西博物馆', '/uploads/spots/4.jpg', '2017-03-03', '1');
INSERT INTO `t_spots` VALUES ('5', '武汉', '武汉大学', '/uploads/spots/5.jpg', '2017-06-08', '1');
INSERT INTO `t_spots` VALUES ('6', '南京', '秦淮河', '/uploads/spots/6.jpg', '2017-06-08', '1');
INSERT INTO `t_spots` VALUES ('7', '广州', '小蛮腰', '/uploads/spots/7.jpg', '2017-06-08', '1');
INSERT INTO `t_spots` VALUES ('8', '杭州', '杭州大学', '/uploads/spots/8.jpg', '2017-06-08', '1');
INSERT INTO `t_spots` VALUES ('9', '杭州', '西湖', '/uploads/spots/9.jpg', '2017-06-08', '1');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `createTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '管理员', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '1', '2017-02-13');
INSERT INTO `t_user` VALUES ('2', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '1', '2017-02-13');
INSERT INTO `t_user` VALUES ('5', '测试', 'e10adc3949ba59abbe56e057f20f883e', '13533333333', null, '2017-03-03');

-- ----------------------------
-- Table structure for `t_works`
-- ----------------------------
DROP TABLE IF EXISTS `t_works`;
CREATE TABLE `t_works` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `content` text,
  `spotsId` int(11) NOT NULL,
  `photographerId` int(11) NOT NULL,
  `createTime` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `photographerId` (`photographerId`),
  KEY `spotsId` (`spotsId`),
  CONSTRAINT `t_works_ibfk_1` FOREIGN KEY (`photographerId`) REFERENCES `t_photographer` (`id`),
  CONSTRAINT `t_works_ibfk_2` FOREIGN KEY (`spotsId`) REFERENCES `t_spots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_works
-- ----------------------------
INSERT INTO `t_works` VALUES ('54', '测试作品1', '/uploads/images/15.jpg', '测试作品1', '9', '1', '2018-03-03', '1');
INSERT INTO `t_works` VALUES ('55', '测试作品2', '/uploads/images/12.jpg', '测试作品2', '10', '1', '2018-03-03', '1');
INSERT INTO `t_works` VALUES ('56', '测作品A', '/uploads/images/11.jpg', '测试使用', '11', '2', '2018-02-26', '1');