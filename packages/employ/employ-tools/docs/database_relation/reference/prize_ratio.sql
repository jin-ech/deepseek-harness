-- Table structure for prize_ratio
-- ----------------------------
DROP TABLE IF EXISTS `prize_ratio`;
CREATE TABLE `prize_ratio` (
  `prize_id` int(11) NOT NULL AUTO_INCREMENT,
  `prize_name` varchar(50) NOT NULL COMMENT '奖项名称',
  `prize_count` int(11) NOT NULL COMMENT '奖项个数',
  `prize_level` varchar(64) NOT NULL DEFAULT '' COMMENT '奖项级别',
  `prize_ratio` int(11) NOT NULL DEFAULT 0 COMMENT '中将概率',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示',
  PRIMARY KEY (`prize_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='奖项个数和概率表';

-- ----------------------------
