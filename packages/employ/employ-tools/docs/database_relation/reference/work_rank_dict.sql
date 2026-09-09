-- Table structure for work_rank_dict
-- ----------------------------
DROP TABLE IF EXISTS `work_rank_dict`;
CREATE TABLE `work_rank_dict` (
  `rank_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排行id',
  `rank_name` varchar(255) DEFAULT NULL COMMENT '排行名称\n',
  `rank_code` varchar(255) DEFAULT NULL COMMENT '排行code',
  `sort` int(11) DEFAULT 999 COMMENT '排序',
  `is_delete` tinyint(1) DEFAULT 1 COMMENT '删除状态 1： 未删除 0：已删除',
  PRIMARY KEY (`rank_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='业务板块字典表';

-- ----------------------------
