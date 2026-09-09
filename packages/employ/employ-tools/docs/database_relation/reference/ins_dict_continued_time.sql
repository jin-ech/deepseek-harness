-- Table structure for ins_dict_continued_time
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_continued_time`;
CREATE TABLE `ins_dict_continued_time` (
  `continued_time_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '残疾持续时间id',
  `continued_time_name` varchar(255) NOT NULL DEFAULT '' COMMENT '对应时间',
  PRIMARY KEY (`continued_time_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='残疾持续时间字典表';

-- ----------------------------
