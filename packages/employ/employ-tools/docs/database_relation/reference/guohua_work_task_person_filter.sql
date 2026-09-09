-- Table structure for guohua_work_task_person_filter
-- ----------------------------
DROP TABLE IF EXISTS `guohua_work_task_person_filter`;
CREATE TABLE `guohua_work_task_person_filter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `filter_type` tinyint(4) NOT NULL COMMENT '过滤类型 1:公司 2:个人',
  `filter_value` varchar(64) NOT NULL DEFAULT '' COMMENT '过滤值；filter_type=1为customer_id，=2为persons_id',
  `remarks` varchar(500) NOT NULL DEFAULT '' COMMENT '备注（如：小米、万达）',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人userid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人userid',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  PRIMARY KEY (`id`),
  KEY `idx_type_value` (`filter_type`,`filter_value`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='工作任务-全部人员过滤配置表';

-- ----------------------------
