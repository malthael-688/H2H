/*
Navicat MySQL Data Transfer

Source Server         : H2H
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : h2h

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2019-07-09 23:58:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
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
-- Table structure for apply
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES ('5', '2', '2016303148');
INSERT INTO `apply` VALUES ('6', '2', '2016303144');

-- ----------------------------
-- Table structure for comment
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '2016303151', '23333', '1', '2019-07-09 19:37');
INSERT INTO `comment` VALUES ('2', '2016303150', 'fuck you', '5', '2019-07-09 19:58');
INSERT INTO `comment` VALUES ('3', '2016303150', '你是傻屌吗', '1', '2019-07-09 19:58');
INSERT INTO `comment` VALUES ('4', '2016303150', '6666', '1', '2019-07-09 19:59');
INSERT INTO `comment` VALUES ('5', '2016303150', '6666', '1', '2019-07-09 20:01');
INSERT INTO `comment` VALUES ('6', '2016303150', '6666', '1', '2019-07-09 20:03');
INSERT INTO `comment` VALUES ('7', '2016303115', 'bbb ', '1', '2019-07-09 22:56');

-- ----------------------------
-- Table structure for message
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '2016303115', '2016303151', '我是15', '2019-07-06 16:13:01', '1', '1');
INSERT INTO `message` VALUES ('2', '2016303115', '2016303151', '你好', '2019-07-06 16:12:02', '1', '1');
INSERT INTO `message` VALUES ('3', '2016303151', '2016303115', '我是51', '2019-07-07 16:13:01', '1', '1');
INSERT INTO `message` VALUES ('4', '2016303151', '2016303115', 'hello', '2019-07-07 16:28:04', '1', '1');
INSERT INTO `message` VALUES ('18', '2016303151', '2016303115', '你有问题吗', '2019-07-09 22:30:42', '1', '1');
INSERT INTO `message` VALUES ('19', '2016303115', '2016303151', '你明天能帮我吗', '2019-07-09 22:31:14', '1', '1');

-- ----------------------------
-- Table structure for notice
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
-- Table structure for param
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
-- Table structure for task
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '打死李大娘', '把它头都打飞', '打人', '20', '2019-07-09 12:00:26', '2019-07-10 16:02', '2016303115', '2016303150', '2', '10');
INSERT INTO `task` VALUES ('2', '吃雪糕', '把它头都踢歪', '寻人启事', '30', '2019-07-09 12:00:26', '2019-07-10 16:02', '2016303115', null, '0', '20');
INSERT INTO `task` VALUES ('3', '图书馆占座', '抄抄抄', '跑腿递送', '50', '2019-07-09 12:00:26', '2019-07-10 16:02', '2016303115', null, '0', '30');
INSERT INTO `task` VALUES ('4', '拿个快递', 'ZZZzzz', '课程咨询', '20', '2019-07-09 12:00:26', '2019-07-10 16:02', '2016303116', null, '0', '40');
INSERT INTO `task` VALUES ('5', '帮我买票', '把它头都打飞', '出行旅伴', '30', '2019-07-09 12:00:26', '2019-07-10 16:02', '2016303116', null, '0', '20');
INSERT INTO `task` VALUES ('6', '听我唱歌', '把它头都踢歪', '跑腿递送', '10', '2019-07-09 12:00:26', '2019-07-10 16:02', '2016303116', null, '0', '30');
INSERT INTO `task` VALUES ('7', '你知道我在等你吗', '抄抄抄', '课程咨询', '30', '2019-07-09 12:00:26', '2019-07-10 16:02', '2016303144', null, '0', '40');
INSERT INTO `task` VALUES ('8', '软微学院', 'ZZZzzz', '出行旅伴', '40', '2019-07-09 12:00:26', '2019-07-10 16:02', '2016303144', null, '0', '20');
INSERT INTO `task` VALUES ('44', '公诚勇毅', '西工大', '出行旅伴', '30', '2019-07-09 11:59:21', '2019-08-09 11:57', '2016303144', null, '0', '40');
INSERT INTO `task` VALUES ('45', '三实一新', '王源', '寻人启事', '50', '2019-07-09 12:00:26', '2019-08-09 11:59', '2016303149', null, '0', '45');
INSERT INTO `task` VALUES ('46', '我要去开飞机', '实验室', '课程咨询', '10', '2019-07-09 16:02:44', '2019-08-09 12:11', '2016303149', null, '0', '25');
INSERT INTO `task` VALUES ('47', '带个盒饭', '三个一', '寻物启事', '0', '2019-07-09 16:03:53', '2019-07-10 16:02', '2016303150', null, '0', '35');
INSERT INTO `task` VALUES ('48', '啦啦啦', '我想吃饭', '寻物启事', '20', '2019-07-09 16:06:29', '2019-07-09 16:06', '2016303151', null, '0', '45');
INSERT INTO `task` VALUES ('49', '请个假', 'huhuhu', '课程咨询', '10', '2019-07-09 16:09:56', '2019-07-10 16:02', '2016303151', null, '0', '55');
INSERT INTO `task` VALUES ('50', 'dfsdfs', 'hohoho', '其他', '25', '2019-07-09 16:10:13', '2019-07-09 16:09', '2016303151', null, '0', '15');

-- ----------------------------
-- Table structure for tasktype
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
-- Table structure for user
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
INSERT INTO `user` VALUES ('2016303115', '789', '17698547895', '2889876004@qq.com', '94', 'qjx', '91', '0', null, null, null, '2019-07-09 22:59:42');
INSERT INTO `user` VALUES ('2016303116', '2016', '13258964598', '546655601@qq.com', '90', 'ltt', '94', '0', null, null, null, '2019-07-09 21:50:57');
INSERT INTO `user` VALUES ('2016303144', '456', '15987654896', '2889876003@qq.com', '90', 'lyy', '88', '0', null, null, null, '2019-07-09 21:50:57');
INSERT INTO `user` VALUES ('2016303148', '456', '15825869874', '2889876004@qq.com', '95', 'lns', '93', '0', null, null, null, '2019-07-09 21:50:57');
INSERT INTO `user` VALUES ('2016303149', '456', '15961022753', '841495246@qq.com', '90', 'mqy', '94', '0', null, null, null, '2019-07-09 21:50:57');
INSERT INTO `user` VALUES ('2016303150', '123', '13016753873', '798175437@qq.com', '100', 'ht', '95', '0', null, null, null, '2019-07-09 21:50:57');
INSERT INTO `user` VALUES ('2016303151', '66666', '18220193519', '985264344@qq.com', '100', 'sc', '100', '0', null, null, null, '2019-07-09 22:51:10');
