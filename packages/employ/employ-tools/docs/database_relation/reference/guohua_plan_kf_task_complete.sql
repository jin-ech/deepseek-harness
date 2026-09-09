-- Table structure for guohua_plan_kf_task_complete
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_kf_task_complete`;
CREATE TABLE `guohua_plan_kf_task_complete` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `department_name` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `target_amount_year` decimal(10,2) DEFAULT NULL COMMENT '年度目标',
  `income_amount_year` decimal(10,2) DEFAULT NULL COMMENT '年度收入',
  `target_amount_q1` decimal(10,2) DEFAULT NULL COMMENT 'Q1目标',
  `income_amount_q1` decimal(10,2) DEFAULT NULL COMMENT 'Q1收入',
  `target_amount_q2` decimal(10,2) DEFAULT NULL COMMENT 'Q2目标',
  `income_amount_q2` decimal(10,2) DEFAULT NULL COMMENT 'Q2收入',
  `target_amount_q3` decimal(10,2) DEFAULT NULL COMMENT 'Q3目标',
  `income_amount_q3` decimal(10,2) DEFAULT NULL COMMENT 'Q3收入',
  `target_amount_q4` decimal(10,2) DEFAULT NULL COMMENT 'Q4目标',
  `income_amount_q4` decimal(10,2) DEFAULT NULL COMMENT 'Q4收入',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1:未删除 2:已删除',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='康复任务完成表';

-- ----------------------------
