-- Table structure for guohua_rel_customer_declare
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_declare`;
CREATE TABLE `guohua_rel_customer_declare` (
  `customer_declare_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申报记录id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `is_agency` tinyint(4) DEFAULT 0 COMMENT '是否需要代办 1是 0否',
  `is_approve` tinyint(4) DEFAULT 0 COMMENT '是否审核通过 1是 0否',
  `declare_year` varchar(64) DEFAULT NULL COMMENT '申报年份',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `add_userid` varchar(255) DEFAULT '' COMMENT '操作人',
  `update_time` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT '更新时间',
  `update_userid` varchar(64) DEFAULT NULL COMMENT '更新人',
  `audit_userid` varchar(64) DEFAULT NULL COMMENT '审核人',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_use_declare` tinyint(4) DEFAULT 0 COMMENT '是否用于申报',
  PRIMARY KEY (`customer_declare_id`) USING BTREE,
  KEY `idx_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2129 DEFAULT CHARSET=utf8mb4 COMMENT='国华CRM-客户申报记录表';

-- ----------------------------
