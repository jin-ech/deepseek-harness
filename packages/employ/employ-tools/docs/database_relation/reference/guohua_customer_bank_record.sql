-- Table structure for guohua_customer_bank_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_bank_record`;
CREATE TABLE `guohua_customer_bank_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `customer_id` varchar(64) NOT NULL DEFAULT '' COMMENT '客户id',
  `old_customer_bank_id` int(11) DEFAULT NULL COMMENT '旧内容',
  `customer_bank_id` int(11) DEFAULT 0 COMMENT '新内容',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除  0已删除',
  `add_userid` varchar(32) NOT NULL DEFAULT '' COMMENT '添加人员id',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6935 DEFAULT CHARSET=utf8mb4 COMMENT='人员更新记录表';

-- ----------------------------
