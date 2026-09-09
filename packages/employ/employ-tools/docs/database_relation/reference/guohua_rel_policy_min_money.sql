-- Table structure for guohua_rel_policy_min_money
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_policy_min_money`;
CREATE TABLE `guohua_rel_policy_min_money` (
  `min_money_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '最低工资id',
  `policy_id` int(11) DEFAULT NULL COMMENT '政策id',
  `base_min_money` decimal(10,2) DEFAULT NULL COMMENT '最低工资（元）',
  `base_min_money_start_date` varchar(255) DEFAULT NULL COMMENT '最低工资起始时间',
  `base_min_money_url` varchar(255) DEFAULT NULL COMMENT '最低工资链接',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`min_money_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1151 DEFAULT CHARSET=utf8mb4 COMMENT='就业政策最低工资表';

-- ----------------------------
