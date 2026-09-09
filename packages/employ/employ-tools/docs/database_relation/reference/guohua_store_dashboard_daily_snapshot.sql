-- Table structure for guohua_store_dashboard_daily_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_dashboard_daily_snapshot`;
CREATE TABLE `guohua_store_dashboard_daily_snapshot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `stat_date` date NOT NULL COMMENT '统计日 YYYY-MM-DD',
  `store_id` int(11) NOT NULL COMMENT '基地ID',
  `is_workday` tinyint(1) NOT NULL DEFAULT 0 COMMENT '当天是否工作日',
  `onsite_count` int(11) NOT NULL DEFAULT 0 COMMENT '在职人数(入职<=当天)',
  `attendance_should_count` int(11) NOT NULL DEFAULT 0 COMMENT '应打卡人数(工作日且入职<=当天)',
  `attendance_checkin_count` int(11) NOT NULL DEFAULT 0 COMMENT '实打卡人数(当天有打卡)',
  `attendance_out_range_count` int(11) NOT NULL DEFAULT 0 COMMENT '超范围人数(当天>20km打卡)',
  `snapshot_batch_no` char(32) NOT NULL DEFAULT '' COMMENT '计算批次号',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_store_dashboard_daily_date_store` (`stat_date`,`store_id`),
  KEY `idx_store_dashboard_daily_store_date` (`store_id`,`stat_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基地看板按天考勤快照表';

-- ----------------------------
