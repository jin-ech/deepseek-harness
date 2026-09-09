-- Table structure for guohua_rel_customer_info_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_info_record`;
CREATE TABLE `guohua_rel_customer_info_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `customer_name_old` varchar(255) DEFAULT NULL COMMENT '旧内容',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '新内容',
  `change_reason` varchar(255) DEFAULT NULL COMMENT '变更原因',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `add_userid` varchar(32) NOT NULL DEFAULT '' COMMENT '添加人员id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除  0已删除',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2158 DEFAULT CHARSET=utf8mb4 COMMENT='客户名称变更记录表';

-- ----------------------------
