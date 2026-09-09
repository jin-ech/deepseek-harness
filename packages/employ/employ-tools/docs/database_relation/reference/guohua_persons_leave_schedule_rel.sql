-- Table structure for guohua_persons_leave_schedule_rel
-- ----------------------------
DROP TABLE IF EXISTS `guohua_persons_leave_schedule_rel`;
CREATE TABLE `guohua_persons_leave_schedule_rel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `leave_id` bigint(20) unsigned NOT NULL COMMENT '请假单ID',
  `leave_detail_id` bigint(20) unsigned NOT NULL COMMENT '请假日期明细ID',
  `schedule_detail_id` int(11) NOT NULL COMMENT '被挂起的排班明细ID',
  `task_id` int(11) NOT NULL DEFAULT 0 COMMENT '工作任务ID快照',
  `period_key` varchar(32) NOT NULL DEFAULT '' COMMENT '周期快照',
  `schedule_date` date DEFAULT NULL COMMENT '排班日期快照',
  `schedule_snapshot_json` text DEFAULT NULL COMMENT '排班挂起前完整字段快照',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1有效 2销假恢复',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_leave_schedule` (`leave_id`,`schedule_detail_id`),
  KEY `idx_schedule` (`schedule_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='请假单与排班挂起关联';

-- ----------------------------
