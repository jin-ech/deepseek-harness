-- Table structure for work_operate_suggestion
-- ----------------------------
DROP TABLE IF EXISTS `work_operate_suggestion`;
CREATE TABLE `work_operate_suggestion` (
  `suggestion_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '建议ID',
  `suggestion_month` varchar(10) DEFAULT NULL COMMENT '建议年月',
  `priority_level` varchar(255) DEFAULT NULL COMMENT '优先级',
  `suggestion_content` text DEFAULT NULL COMMENT '建议内容',
  `duty_department` varchar(500) DEFAULT NULL COMMENT '责任部门',
  `modify_suggestion_content` varchar(255) DEFAULT NULL COMMENT '修改后建议内容',
  `modify_duty_dempartment` varchar(50) DEFAULT NULL COMMENT '修改后责任部门',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `modify_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改时间',
  `user_id` varchar(36) DEFAULT NULL COMMENT '修改人',
  `is_delete` tinyint(1) DEFAULT 1 COMMENT '1:未删除 0：已删除',
  PRIMARY KEY (`suggestion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COMMENT='经营分析建议表';

-- ----------------------------
