-- Table structure for guohua_plan_update_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_update_record`;
CREATE TABLE `guohua_plan_update_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `target_type_id` varchar(64) DEFAULT NULL COMMENT '模板id',
  `filed_name` varchar(64) DEFAULT NULL COMMENT '字段名',
  `old_word` varchar(64) DEFAULT NULL COMMENT '旧内容',
  `new_word` varchar(64) DEFAULT NULL COMMENT '新内容',
  `update_time` datetime DEFAULT current_timestamp() COMMENT '更新时间',
  `update_userid` varchar(255) DEFAULT NULL COMMENT '更新人id',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除  0已删除',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6371 DEFAULT CHARSET=utf8mb4 COMMENT='驾驶舱目标更新记录表';

-- ----------------------------
