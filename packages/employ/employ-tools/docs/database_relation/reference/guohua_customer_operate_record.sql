-- Table structure for guohua_customer_operate_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_operate_record`;
CREATE TABLE `guohua_customer_operate_record` (
  `operate_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运营记录id',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户id',
  `contact_id` int(11) DEFAULT NULL COMMENT '客户联系人id',
  `record_content` text NOT NULL COMMENT '记录内容',
  `record_date` varchar(255) DEFAULT '' COMMENT '记录日期',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '创建人',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '修改时间',
  PRIMARY KEY (`operate_record_id`) USING BTREE,
  KEY `idx_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COMMENT='客户运营跟进记录';

-- ----------------------------
