-- Table structure for guohua_persons_match_expect_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_persons_match_expect_record`;
CREATE TABLE `guohua_persons_match_expect_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预匹配ID',
  `match_id` int(11) NOT NULL DEFAULT 0 COMMENT '人岗预匹配id',
  `is_delete` varchar(64) NOT NULL DEFAULT '1' COMMENT '是否删除 1:未删除 0:删除',
  PRIMARY KEY (`record_id`) USING BTREE,
  KEY `_index_is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=901 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-人员岗位预匹配信息表';

-- ----------------------------
