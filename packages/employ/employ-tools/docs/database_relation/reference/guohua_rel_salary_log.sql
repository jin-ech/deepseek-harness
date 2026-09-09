-- Table structure for guohua_rel_salary_log
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_salary_log`;
CREATE TABLE `guohua_rel_salary_log` (
  `salary_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `salary_id` bigint(20) DEFAULT NULL COMMENT '账单ID',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `log_type` varchar(32) DEFAULT NULL COMMENT '1账单新增  2账单确认  3账单发送  4人员变更',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `add_userid` varchar(32) DEFAULT NULL COMMENT '添加人',
  `log_content` varchar(500) DEFAULT NULL COMMENT '操作内容',
  `salary_month` varchar(32) DEFAULT NULL COMMENT '账单所属月',
  PRIMARY KEY (`salary_log_id`) USING BTREE,
  KEY `_index_customer_id` (`salary_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6541 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-账单更新日志表';

-- ----------------------------
