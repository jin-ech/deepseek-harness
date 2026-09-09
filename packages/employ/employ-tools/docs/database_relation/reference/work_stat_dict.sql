-- Table structure for work_stat_dict
-- ----------------------------
DROP TABLE IF EXISTS `work_stat_dict`;
CREATE TABLE `work_stat_dict` (
  `stat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '统计维度ID',
  `stat_name` varchar(50) DEFAULT NULL COMMENT '统计名称',
  `stat_code` varchar(50) DEFAULT NULL COMMENT '统计编码-唯一',
  `pid` int(11) DEFAULT 0 COMMENT '父级id',
  `sort` int(11) DEFAULT 999 COMMENT '排序',
  `is_valid` tinyint(4) DEFAULT 1 COMMENT '是否生效 1：是 0：否',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1：未删除  0：已删除',
  PRIMARY KEY (`stat_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='经营分析统计维度表';

-- ----------------------------
