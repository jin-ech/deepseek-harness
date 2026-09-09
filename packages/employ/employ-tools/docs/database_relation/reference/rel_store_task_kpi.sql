-- Table structure for rel_store_task_kpi
-- ----------------------------
DROP TABLE IF EXISTS `rel_store_task_kpi`;
CREATE TABLE `rel_store_task_kpi` (
  `rel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联id',
  `store_id` int(11) DEFAULT NULL COMMENT '基地ID',
  `task_id` int(11) DEFAULT NULL COMMENT '任务ID',
  `kpi_code` varchar(255) DEFAULT NULL COMMENT '指标编码',
  `target_value` decimal(10,2) DEFAULT NULL COMMENT '目标值',
  `actual_value` decimal(10,2) DEFAULT NULL COMMENT '实际值',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `user_id` varchar(255) DEFAULT NULL COMMENT '添加人',
  `actual_time` datetime DEFAULT NULL COMMENT '实际值计算时间',
  PRIMARY KEY (`rel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='基地任务目标完成情况表';

-- ----------------------------
