-- Table structure for guohua_rel_customer_opt_clue_contact
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_opt_clue_contact`;
CREATE TABLE `guohua_rel_customer_opt_clue_contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) DEFAULT NULL COMMENT '线索id',
  `contact_name` varchar(255) DEFAULT NULL COMMENT '联系人姓名',
  `contact_tel` varchar(64) DEFAULT NULL COMMENT '联系人电话',
  `contact_line_phone` varchar(255) DEFAULT NULL COMMENT '联系人固定电话',
  `contact_position_id` int(11) DEFAULT NULL COMMENT '联系人职位id  机构CRM使用',
  `contact_position_name` varchar(64) DEFAULT NULL COMMENT '联系人职位名称',
  `contact_address` varchar(500) DEFAULT NULL COMMENT '联系人地址',
  `contact_email` varchar(100) DEFAULT NULL COMMENT '联系人邮箱',
  `contact_remark` varchar(255) DEFAULT NULL COMMENT '联系人备注',
  `is_first` varchar(64) NOT NULL DEFAULT '2' COMMENT '是否首要联系人1:是 2:否',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0 已删除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `job_level_id` int(11) DEFAULT NULL COMMENT '职业级别id',
  PRIMARY KEY (`contact_id`) USING BTREE,
  KEY `_index_customer_id` (`clue_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2024 DEFAULT CHARSET=utf8mb4 COMMENT='客户线索联系人信息表';

-- ----------------------------
