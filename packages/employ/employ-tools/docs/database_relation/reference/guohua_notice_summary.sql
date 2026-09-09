-- Table structure for guohua_notice_summary
-- ----------------------------
DROP TABLE IF EXISTS `guohua_notice_summary`;
CREATE TABLE `guohua_notice_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(255) NOT NULL COMMENT '人员ID',
  `notice_type_id` int(11) NOT NULL COMMENT '通知类型ID',
  `notice_number` int(11) DEFAULT NULL COMMENT '数量',
  `notice_error_count` int(11) NOT NULL DEFAULT 0 COMMENT '原始异常数量',
  `send_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '发送状态：1已发送，0未发送',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '日期',
  `is_delete` int(11) NOT NULL DEFAULT 1 COMMENT '1未删除 0已删除',
  `send_time` datetime DEFAULT NULL COMMENT '发送消息时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14235 DEFAULT CHARSET=utf8mb4 COMMENT='检查事项通知汇总表';

-- ----------------------------
