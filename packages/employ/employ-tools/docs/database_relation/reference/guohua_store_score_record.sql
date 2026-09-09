-- Table structure for guohua_store_score_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_score_record`;
CREATE TABLE `guohua_store_score_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '基地id',
  `score_year` char(4) NOT NULL DEFAULT '' COMMENT '评分年份 YYYY',
  `score_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '评分JSON数据',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_score_year` (`store_id`,`score_year`) USING BTREE,
  KEY `idx_store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='基地年度评分记录表';

-- ----------------------------
