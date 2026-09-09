-- Table structure for guohua_rel_demand_change_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_demand_change_record`;
CREATE TABLE `guohua_rel_demand_change_record` (
  `change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '变更id',
  `demand_id` int(11) DEFAULT NULL COMMENT '需求id',
  `change_content` varchar(255) DEFAULT NULL COMMENT '变更内容',
  `change_reason` varchar(255) DEFAULT NULL COMMENT '变更原因',
  `add_userid` varchar(255) DEFAULT NULL COMMENT '审核人微信ID',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` varchar(64) DEFAULT '1' COMMENT '是否删除 1:未删除 0:删除',
  PRIMARY KEY (`change_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-需求变更记录表';

-- ----------------------------
