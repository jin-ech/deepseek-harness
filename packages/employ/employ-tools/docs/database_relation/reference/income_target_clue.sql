-- Table structure for income_target_clue
-- ----------------------------
DROP TABLE IF EXISTS `income_target_clue`;
CREATE TABLE `income_target_clue` (
  `clue_target_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销线目标id',
  `clue_target` int(11) NOT NULL DEFAULT 0 COMMENT '销售目标',
  `project_chance_id` varchar(32) NOT NULL DEFAULT '' COMMENT '产品id',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 显示 2不显示',
  `is_renewal` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 续约 0不续约',
  `sort` tinyint(11) NOT NULL DEFAULT 1 COMMENT '1 显示 2不显示',
  PRIMARY KEY (`clue_target_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='2023年部门收入目标表';

-- ----------------------------
