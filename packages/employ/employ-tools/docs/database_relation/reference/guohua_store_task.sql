-- Table structure for guohua_store_task
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_task`;
CREATE TABLE `guohua_store_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `store_id` int(11) DEFAULT NULL COMMENT '基地ID',
  `task_year` date DEFAULT NULL COMMENT '任务年份',
  `task_quarter` varchar(255) DEFAULT NULL COMMENT '任务季度 Q1,Q2,Q3,Q4',
  `status` tinyint(1) DEFAULT 0 COMMENT '任务状态 1：已完成 0：未完成',
  `user_id` varchar(255) DEFAULT NULL COMMENT '任务维护人',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1：未删除 0：已删除',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='基地任务表';

-- ----------------------------
