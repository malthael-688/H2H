/*
Navicat MySQL Data Transfer

Source Server         : sc2
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : h2h

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2019-07-10 22:11:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminNum` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '李宁生', '202CB962AC59075B964B07152D234B70', '2889876004@qq.com');
INSERT INTO `admin` VALUES ('2', '陆韬韬', '202CB962AC59075B964B07152D234B70', '798175437@qq.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '2016303147', '很棒', '3', '2019-9-1');
INSERT INTO `comment` VALUES ('2', '2016303147', '很好', '4', '2019-9-2');
INSERT INTO `comment` VALUES ('3', '2016303142', 'good', '5', '2019-9-3');
INSERT INTO `comment` VALUES ('4', '2016303142', 'great', '6', '2019-9-4');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('24', '2016303142', '2016303151', '你申请的消息成功！', '2019-07-10 20:05:44', '1', '1');
INSERT INTO `message` VALUES ('25', '2016303142', '2016303151', '你的任务已经验收!', '2019-07-10 20:10:20', '1', '1');
INSERT INTO `message` VALUES ('26', '2016303142', '2016303151', '我要吃大便 交给你了!', '2019-07-10 20:18:38', '1', '1');
INSERT INTO `message` VALUES ('27', '2016303151', '2016303142', '代购XX 交给你了!', '2019-07-10 21:37:01', '0', '0');
INSERT INTO `message` VALUES ('28', '2016303151', '2016303142', '代购XX 取消了!', '2019-07-10 22:01:44', '0', '0');
INSERT INTO `message` VALUES ('29', '2016303151', '2016303133', '代购XX 取消了!', '2019-07-10 22:01:44', '0', '0');
INSERT INTO `message` VALUES ('30', '2016303151', '2016303147', '代购XX 取消了!', '2019-07-10 22:01:44', '0', '0');

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
INSERT INTO `notice` VALUES ('1', 'H2H网站使用注意', '互联网并非无法之地，请大家遵纪守法', '2019-7-9');
INSERT INTO `notice` VALUES ('2', '用户使用教程', '请大家按照用户手册进行用户行为', '2019-7-9');

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '丢失饭卡', '本人饭卡丢失，如果找回请联系XXXXXX', '寻物启事', '10', '2019-7-10', '2019-7-15', '2016303142', null, '7', '0');
INSERT INTO `task` VALUES ('2', '考试咨询', 'XX考试，希望找人咨询考试相关问题', '咨询', '10', '2019-7-8', '2019-7-13', '2016303142', null, '1', '0');
INSERT INTO `task` VALUES ('3', '打车出行', '想找个一起打车去老校区的同学，分摊车费', '出行', '10', '2019-7-7', '2019-7-12', '2016303142', '2016303151', '5', '0');
INSERT INTO `task` VALUES ('4', '志愿者召集', '召集暑期志愿者项目', '活动', '20', '2019-8-1', '2019-8-10', '2016303142', '2016303147', '3', '0');
INSERT INTO `task` VALUES ('5', '社团招募', 'XX社团等待你的加入', '社团', '20', '2019-8-1', '2019-8-20', '2016303142', '2016303147', '4', '0');
INSERT INTO `task` VALUES ('6', '代取快递', '帮忙代取XX快递', '代取快递', '15', '2019-7-1', '2019-7-11', '2016303142', '2016303147', '5', '0');
INSERT INTO `task` VALUES ('7', '帮忙剪辑视频', '帮忙剪辑个人拍摄的社团活动视频', '帮忙做事', '30', '2019-7-7', '2019-7-9', '2016303142', null, '6', '0');
INSERT INTO `task` VALUES ('8', '代购XX', '寻求一个老校区同学代购XX', '代购', '20', '2019-7-10', '2019-7-17', '2016303151', null, '7', '0');
INSERT INTO `task` VALUES ('52', '我要吃大便', '一次坚强的测试', '跑腿递送', '20', '2019-07-10 20:15:45', '2019-07-08 20:14', '2016303142', null, '2', '0');

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
  `password` varchar(255) NOT NULL,
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
INSERT INTO `user` VALUES ('2016303133', '202CB962AC59075B964B07152D234B70', '18922861965', '3478466425@qq.com', '100', '熊敏光', '30', '1', '0', '0', '0', '2019-07-10 19:33:00');
INSERT INTO `user` VALUES ('2016303142', '202CB962AC59075B964B07152D234B70', '18691874616', '2889876004@qq.com', '101', '李宁生', '0', '0', '9', '0', '0', '2019-07-10');
INSERT INTO `user` VALUES ('2016303147', '202CB962AC59075B964B07152D234B70', '18821622394', '798175437@qq.com', '100', '涛涛', '90', '0', '0', '1', '0', '2019-07-10');
INSERT INTO `user` VALUES ('2016303151', '202CB962AC59075B964B07152D234B70', '18220193519', '985264344@qq.com', '95', '宋昌', '50', '0', '0', '1', '1', '2019-07-10');
