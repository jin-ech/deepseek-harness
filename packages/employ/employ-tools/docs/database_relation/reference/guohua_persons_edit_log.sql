-- Table structure for guohua_persons_edit_log
-- ----------------------------
DROP TABLE IF EXISTS `guohua_persons_edit_log`;
CREATE TABLE `guohua_persons_edit_log` (
  `persons_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `persons_id` bigint(20) DEFAULT NULL COMMENT '人员ID',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `add_userid` varchar(32) DEFAULT NULL COMMENT '添加人',
  `log_content` varchar(500) DEFAULT NULL COMMENT '操作内容',
  PRIMARY KEY (`persons_log_id`) USING BTREE,
  KEY `_index_customer_id` (`persons_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3268 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-残疾人详情编辑日志记录表';

-- ----------------------------
