-- Table structure for guohua_persons_leave_detail
-- ----------------------------
DROP TABLE IF EXISTS `guohua_persons_leave_detail`;
CREATE TABLE `guohua_persons_leave_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `leave_id` bigint(20) unsigned NOT NULL COMMENT '请假单ID',
  `persons_id` varchar(36) NOT NULL COMMENT '申请人ID冗余，用于按人按月查询',
  `leave_date` date NOT NULL COMMENT '请假日期',
  `attendance_basis` varchar(16) NOT NULL DEFAULT 'calendar' COMMENT '日期来源 calendar/schedule/hybrid',
  `attendance_mark` varchar(16) NOT NULL DEFAULT 'leave' COMMENT '考勤标记 固定 leave',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1有效 2删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_leave_date` (`leave_id`,`leave_date`),
  KEY `idx_leave_date` (`leave_date`),
  KEY `idx_person_date` (`persons_id`,`leave_date`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='请假日期明细';

-- ----------------------------
