-- Table structure for sell_week_date
-- ----------------------------
DROP TABLE IF EXISTS `sell_week_date`;
CREATE TABLE `sell_week_date` (
  `week_date_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日期范围id',
  `week_date` varchar(32) NOT NULL DEFAULT '' COMMENT '日期范围',
  `week` int(11) NOT NULL DEFAULT 0 COMMENT '当月周数',
  `month` varchar(32) NOT NULL DEFAULT '' COMMENT '月',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '添加人',
  `start_date` varchar(32) NOT NULL DEFAULT '' COMMENT '开始日期',
  `end_date` varchar(32) NOT NULL DEFAULT '' COMMENT '结束日期',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  PRIMARY KEY (`week_date_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='销售完成情况指标表';

-- ----------------------------
