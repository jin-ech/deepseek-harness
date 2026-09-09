-- Table structure for guohua_rel_transfer_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_transfer_record`;
CREATE TABLE `guohua_rel_transfer_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `customer_id` varchar(32) DEFAULT NULL COMMENT '客户id',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `add_userid` varchar(32) NOT NULL DEFAULT '' COMMENT '添加人员id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除  0已删除',
  `status` varchar(4) NOT NULL DEFAULT '0' COMMENT '状态 0待执行 1成功 2失败',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4438 DEFAULT CHARSET=utf8mb4 COMMENT='客户信息变更记录表';

-- ----------------------------
