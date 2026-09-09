-- Table structure for prize_setting
-- ----------------------------
DROP TABLE IF EXISTS `prize_setting`;
CREATE TABLE `prize_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `random_nums` varchar(50) NOT NULL COMMENT '随机数',
  `is_choose` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 允许重复抽',
  `date` varchar(50) NOT NULL DEFAULT '' COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='奖项个数和概率表';

-- ----------------------------
