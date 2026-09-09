-- Table structure for guohua_plan_update_record_append
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_update_record_append`;
CREATE TABLE `guohua_plan_update_record_append` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `target_type_id` varchar(64) DEFAULT NULL COMMENT '模板id',
  `add_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '新增内容',
  `add_userid` varchar(255) DEFAULT NULL COMMENT '更新人id',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除  0已删除',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='驾驶舱目标新增记录表';

-- ----------------------------
