-- Table structure for guohua_work_task_schedule_config
-- ----------------------------
DROP TABLE IF EXISTS `guohua_work_task_schedule_config`;
CREATE TABLE `guohua_work_task_schedule_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `task_id` int(10) unsigned NOT NULL COMMENT '排班任务ID，关联 guohua_work_task.id',
  `schedule_mode` tinyint(4) NOT NULL DEFAULT 1 COMMENT '排班方式 1:智能自动排班(周期内为每人均摊工作日) 2:手动排班(逐人指定排班日期)',
  `content_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '工作内容ID数组(关联 guohua_work_position_content.id)，多选，用于排班分配；如 [12,15,18]',
  `rotation_strategy` tinyint(4) NOT NULL DEFAULT 1 COMMENT '轮值策略 1:按期偏移轮换(默认,起始人随period_index后移) 2:固定顺序 3:随机',
  `max_times_per_period` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '每人每周期被排次数(如"每人每周最多1次")，总条数 = 参与人数 × 本值',
  `participant_order` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参与人员固定顺序快照(persons_id 数组)，保证均摊与偏移轮值稳定；人员增减时同步维护',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人 userid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人 userid',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_task_id` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COMMENT='排班任务配置表(每任务一行)';

-- ----------------------------
