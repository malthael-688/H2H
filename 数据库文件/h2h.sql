/*
Navicat MySQL Data Transfer

Source Server         : mys1
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : h2h

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2019-07-09 19:10:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminNum` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(18) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1', '123', '2889876004@qq.com');

-- ----------------------------
-- Table structure for `apply`
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskID` int(11) DEFAULT NULL,
  `applicantNum` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `A_User` (`applicantNum`) USING BTREE,
  KEY `A_Task` (`taskID`) USING BTREE,
  CONSTRAINT `A_Task` FOREIGN KEY (`taskID`) REFERENCES `task` (`taskID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `A_User` FOREIGN KEY (`applicantNum`) REFERENCES `user` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES ('1', '7', '2');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `commentatorNum` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `taskID` int(11) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`commentID`),
  KEY `C_User` (`commentatorNum`),
  KEY `C_Task` (`taskID`),
  CONSTRAINT `C_Task` FOREIGN KEY (`taskID`) REFERENCES `task` (`taskID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `C_User` FOREIGN KEY (`commentatorNum`) REFERENCES `user` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageID` int(11) NOT NULL AUTO_INCREMENT,
  `senderNum` bigint(20) DEFAULT NULL,
  `receiverNum` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `messageState` int(11) DEFAULT NULL,
  `showState` int(11) DEFAULT NULL,
  PRIMARY KEY (`messageID`),
  KEY `M_User1` (`senderNum`),
  KEY `M_User2` (`receiverNum`),
  CONSTRAINT `M_User1` FOREIGN KEY (`senderNum`) REFERENCES `user` (`num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `M_User2` FOREIGN KEY (`receiverNum`) REFERENCES `user` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '1', '2', 'erwerw', '2019-07-09 16:13:01', '1', '1');
INSERT INTO `message` VALUES ('2', '1', '2', 'qwer', '2019-07-07 16:12:02', '1', '1');
INSERT INTO `message` VALUES ('3', '3', '2', 'woaini', '2019-07-07 16:13:01', '1', '0');
INSERT INTO `message` VALUES ('4', '2', '1', '我是sc', '2019-07-09 17:28:04', '1', '1');
INSERT INTO `message` VALUES ('5', '2', '1', 'nihaoa', '2019-07-09 17:29:24', '1', '1');
INSERT INTO `message` VALUES ('6', '2', '1', 'hehe', '2019-07-09 17:30:07', '1', '1');
INSERT INTO `message` VALUES ('7', '1', '2', 'cxknmsl', '2019-07-09 17:37:51', '1', '1');
INSERT INTO `message` VALUES ('8', '1', '2', 'nihaoa', '2019-07-09 17:38:14', '1', '1');
INSERT INTO `message` VALUES ('9', '1', '2', 'heihei', '2019-07-09 17:46:06', '1', '1');
INSERT INTO `message` VALUES ('10', '2', '1', 'hohohohohoho', '2019-07-09 17:46:25', '1', '1');
INSERT INTO `message` VALUES ('11', '1', '2', 'huhuhuhu', '2019-07-09 17:47:36', '1', '1');
INSERT INTO `message` VALUES ('12', '1', '2', 'hihihih', '2019-07-09 17:54:02', '1', '1');
INSERT INTO `message` VALUES ('13', '1', '2', '000000', '2019-07-09 17:57:12', '0', '0');
INSERT INTO `message` VALUES ('14', '1', '2', '7897979789', '2019-07-09 17:57:58', '0', '0');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `noticeID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`noticeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', 'help', 'sc', '2019-7-6');
INSERT INTO `notice` VALUES ('2', 'done', 'jk', '2019-7-7');

-- ----------------------------
-- Table structure for `param`
-- ----------------------------
DROP TABLE IF EXISTS `param`;
CREATE TABLE `param` (
  `id` int(11) NOT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of param
-- ----------------------------
INSERT INTO `param` VALUES ('1', '15');

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `taskID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `rewardPoints` int(11) DEFAULT NULL,
  `startTime` varchar(255) DEFAULT NULL,
  `deadLine` varchar(255) DEFAULT NULL,
  `publisherNum` bigint(20) DEFAULT NULL,
  `receiverNum` bigint(20) DEFAULT NULL,
  `taskState` int(11) DEFAULT NULL,
  `heatValue` int(11) DEFAULT NULL,
  PRIMARY KEY (`taskID`),
  KEY `T_Uer1` (`publisherNum`),
  KEY `T_Uer2` (`receiverNum`),
  CONSTRAINT `T_Uer1` FOREIGN KEY (`publisherNum`) REFERENCES `user` (`num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `T_Uer2` FOREIGN KEY (`receiverNum`) REFERENCES `user` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '打死李大娘', '把它头都打飞', '打人', '100', '2019-7-5', '2020-7-5', '2', '1', '0', '100');
INSERT INTO `task` VALUES ('2', '踢飞李大娘', '把它头都踢歪', '踢人', '100', '2019-6-5', '2021-6-5', '2', '1', '0', '100');
INSERT INTO `task` VALUES ('3', '代写作业', '抄抄抄', '写作业', '50', '2018-5-5', '2021-6-6', '2', '1', '0', '50');
INSERT INTO `task` VALUES ('4', '帮我睡觉', 'ZZZzzz', '睡觉', '10', '2018-6-5', '2020-7-7', '2', '1', '3', '1');
INSERT INTO `task` VALUES ('5', '打死李大娘', '把它头都打飞', '打人', '100', '2019-7-5', '2020-7-5', '1', '2', '5', '100');
INSERT INTO `task` VALUES ('6', '踢飞李大娘', '把它头都踢歪', '踢人', '100', '2019-6-5', '2021-6-5', '1', '2', '6', '100');
INSERT INTO `task` VALUES ('7', '代写作业', '抄抄抄', '写作业', '50', '2018-5-5', '2021-6-6', '1', '2', '2', '50');
INSERT INTO `task` VALUES ('8', '帮我睡觉', 'ZZZzzz', '睡觉', '10', '2018-6-5', '2020-7-7', '1', '2', '3', '1');
INSERT INTO `task` VALUES ('35', 'rwe', '3423432', null, '34', '324', '342324', '123', null, '0', '0');
INSERT INTO `task` VALUES ('36', 'fdsdf', 'retrtrer', null, '42', '2020-07-01', '11:23', '123', null, '0', '0');
INSERT INTO `task` VALUES ('44', 'task7', 'sdfdsdsf', null, '7', '2019-07-09 11:59:21', '2019-08-09 11:57', '123', null, '0', '0');
INSERT INTO `task` VALUES ('45', 'task0', 'dfsdfssd', '寻人启事', '0', '2019-07-09 12:00:26', '2019-08-09 11:59', '123', null, '0', '0');
INSERT INTO `task` VALUES ('46', 'dfsdsfds', 'fdsdsffds', '寻物启事', '1', '2019-07-09 16:02:44', '2019-08-09 234', '2', null, '0', '0');
INSERT INTO `task` VALUES ('47', 'fds', 'dfsdfsds', '寻物启事', '3', '2019-07-09 16:03:53', '2019-07-10 16:02', '2', null, '0', '0');
INSERT INTO `task` VALUES ('48', 'rwe', 'fds', '寻物启事', '43', '2019-07-09 16:06:29', '2019-07-09 16:06', '2', null, '0', '0');
INSERT INTO `task` VALUES ('49', 'tas11', 'fdsfd', '寻人启事', '4', '2019-07-09 16:09:56', 'fds dsfds', '2', null, '0', '0');
INSERT INTO `task` VALUES ('50', 'dfsdfs', 'efefweff', '寻物启事', '4', '2019-07-09 16:10:13', '2019-07-09 16:09', '2', null, '0', '0');

-- ----------------------------
-- Table structure for `tasktype`
-- ----------------------------
DROP TABLE IF EXISTS `tasktype`;
CREATE TABLE `tasktype` (
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tasktype
-- ----------------------------
INSERT INTO `tasktype` VALUES ('寻人启事');
INSERT INTO `tasktype` VALUES ('寻物启事');
INSERT INTO `tasktype` VALUES ('课程咨询');
INSERT INTO `tasktype` VALUES ('跑腿递送');
INSERT INTO `tasktype` VALUES ('出行旅伴');
INSERT INTO `tasktype` VALUES ('其他');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `num` bigint(20) NOT NULL,
  `password` varchar(18) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `creditScore` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `userState` int(11) DEFAULT NULL,
  `releasedTaskNum` int(11) DEFAULT NULL,
  `finishedTaskNum` int(11) DEFAULT NULL,
  `giveUpTaskNum` int(11) DEFAULT NULL,
  `lastLoginDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '66666', 'null', 'null', '100', 'SC', '861', '0', '1000', '1000', '1000', null);
INSERT INTO `user` VALUES ('2', '123', '11111', '798175437@qq.com', '100', 'tt', '7446', '0', '2000', '2000', '0', null);
INSERT INTO `user` VALUES ('3', '456', null, null, '90', 'SC2', null, '0', null, null, null, null);
INSERT INTO `user` VALUES ('123', '456', null, '2889876004@qq.com', null, '123', null, '0', null, null, null, null);
INSERT INTO `user` VALUES ('789', '456', null, '2889876004@qq.com', null, '789', null, '0', null, null, null, null);
INSERT INTO `user` VALUES ('2015', '2016', null, null, null, null, null, '0', null, null, null, null);
INSERT INTO `user` VALUES ('123789', '789', null, '2889876004@qq.com', null, '789789', null, '0', null, null, null, null);
INSERT INTO `user` VALUES ('123123214', '789789', null, '2889876004@qq.com', null, '12421434', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('2015333222', '123', null, '798175437@qq.com', null, 'sscc', null, '0', null, null, null, null);
INSERT INTO `user` VALUES ('2016303142', '789', null, '2889876004@qq.com', null, 'helloworld', null, '0', null, null, null, null);
INSERT INTO `user` VALUES ('2016303148', '456', null, '3478466425@qq.com', null, '123', null, '0', null, null, null, null);
