-- Table structure for guohua_work_task_occurrence
-- ----------------------------
DROP TABLE IF EXISTS `guohua_work_task_occurrence`;
CREATE TABLE `guohua_work_task_occurrence` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `task_id` int(10) unsigned NOT NULL COMMENT '任务ID，关联 guohua_work_task.id',
  `period_key` varchar(16) NOT NULL DEFAULT '' COMMENT '周期锚点：2026-06-15 / 2026-W25 / 2026-06 / once',
  `period_start` datetime NOT NULL COMMENT '周期起',
  `period_end` datetime NOT NULL COMMENT '周期止',
  `occurrence_status` tinyint(4) NOT NULL DEFAULT 10 COMMENT '周期状态 10:未开始 20:进行中 30:已结束',
  `notify_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:未推送 1:已推送 2:推送失败',
  `notify_time` datetime DEFAULT NULL COMMENT '推送完成时间',
  `should_do_count` int(10) unsigned DEFAULT NULL COMMENT '本期应做人数（封存时写入）',
  `submitted_count` int(10) unsigned DEFAULT NULL COMMENT '本期已提交人数（封存时写入）',
  `stats_sealed_time` datetime DEFAULT NULL COMMENT '统计封存时间；NULL=未封存仍走实时算',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人 userid（cron=system）',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人 userid',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_task_period` (`task_id`,`period_key`),
  KEY `idx_status_end` (`occurrence_status`,`period_end`),
  KEY `idx_task_start` (`task_id`,`period_start`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COMMENT='任务周期实例表(task×period)';

-- ----------------------------
