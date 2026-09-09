-- Table structure for guohua_rel_customer_contact
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_contact`;
CREATE TABLE `guohua_rel_customer_contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `contact_name` varchar(255) DEFAULT NULL COMMENT '联系人姓名',
  `contact_tel` varchar(64) DEFAULT NULL COMMENT '联系人电话',
  `contact_position_id` int(11) DEFAULT NULL COMMENT '联系人职位id',
  `contact_position_name` varchar(64) DEFAULT NULL COMMENT '联系人职位名称',
  `contact_address` varchar(500) DEFAULT NULL COMMENT '联系人地址',
  `contact_email` varchar(100) DEFAULT NULL COMMENT '联系人邮箱',
  `contact_remark` varchar(255) DEFAULT NULL COMMENT '联系人备注',
  `contact_type_id` varchar(64) DEFAULT NULL COMMENT '联系人类型id',
  `is_first` varchar(64) NOT NULL DEFAULT '2' COMMENT '是否首要联系人1:是 2:否',
  `is_usable` tinyint(4) DEFAULT 1 COMMENT '是否可用1是 0否',
  `sync_to_son_customers` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否同步至子客户 1是 0否',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0 已删除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `job_level_id` int(11) DEFAULT NULL COMMENT '职业级别id',
  `customer_line_phone` varchar(255) DEFAULT NULL COMMENT '客户固定电话',
  PRIMARY KEY (`contact_id`) USING BTREE,
  KEY `_index_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72425 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-联系人信息表';

-- ----------------------------
