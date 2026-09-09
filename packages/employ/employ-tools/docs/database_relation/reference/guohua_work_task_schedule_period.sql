-- Table structure for guohua_work_task_schedule_period
-- ----------------------------
DROP TABLE IF EXISTS `guohua_work_task_schedule_period`;
CREATE TABLE `guohua_work_task_schedule_period` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `task_id` int(10) unsigned NOT NULL COMMENT '排班任务ID，关联 guohua_work_task.id',
  `period_key` varchar(16) NOT NULL DEFAULT '' COMMENT '周期锚点：2026-06-15 / W:2026-06-15 / M:2026-06-15 / once',
  `period_index` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '本期序号(自任务起第几个周期,0-based)，按期偏移轮值用：起始人=(基准+period_index) mod 人数',
  `period_start` datetime NOT NULL COMMENT '周期起',
  `period_end` datetime NOT NULL COMMENT '周期止',
  `participant_count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '本期参与人数',
  `scheduled_count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '本期实际已排明细条数',
  `gen_status` tinyint(4) NOT NULL DEFAULT 10 COMMENT '生成状态 10:待生成 20:已生成 30:生成失败(本期无有效工作日等)',
  `gen_fail_reason` varchar(500) NOT NULL DEFAULT '' COMMENT '生成失败原因（如：本期无有效工作日可排）',
  `gen_time` datetime DEFAULT NULL COMMENT '生成完成时间',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人 userid（cron=system）',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人 userid',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_task_period` (`task_id`,`period_key`),
  KEY `idx_task_start` (`task_id`,`period_start`),
  KEY `idx_gen_status` (`gen_status`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8mb4 COMMENT='排班周期表(task×period，含均摊偏移基准与统计计数)';

-- ----------------------------
