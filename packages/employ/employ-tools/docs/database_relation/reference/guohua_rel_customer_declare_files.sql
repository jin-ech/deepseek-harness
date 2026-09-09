-- Table structure for guohua_rel_customer_declare_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_declare_files`;
CREATE TABLE `guohua_rel_customer_declare_files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件id',
  `customer_declare_id` int(11) DEFAULT NULL COMMENT '申报记录id',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_url` varchar(255) DEFAULT NULL COMMENT '文件链接',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='国华CRM-客户申报附件表';

-- ----------------------------
