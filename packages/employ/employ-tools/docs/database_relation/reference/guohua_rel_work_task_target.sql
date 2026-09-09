-- Table structure for guohua_rel_work_task_target
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_work_task_target`;
CREATE TABLE `guohua_rel_work_task_target` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `task_id` int(10) unsigned NOT NULL COMMENT '任务ID，关联 guohua_work_task.id',
  `target_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '目标类型(与assign_type对齐) 1:企业(子客户) 2:基地',
  `target_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '目标ID(均为int)：企业=具体企业(guohua_customer.customer_id)；基地=guohua_store.store_id',
  `target_name` varchar(128) NOT NULL DEFAULT '' COMMENT '目标名称（冗余：企业名/基地名）',
  `group_customer_id` int(10) unsigned DEFAULT NULL COMMENT '所属集团客户ID（可空，无集团时为NULL），关联 guohua_customer.customer_id，便于按集团归组',
  `remarks` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人 userid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人 userid',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  PRIMARY KEY (`id`),
  KEY `idx_task_id` (`task_id`),
  KEY `idx_target` (`target_type`,`target_id`),
  KEY `idx_group_customer_id` (`group_customer_id`),
  KEY `idx_task_target` (`task_id`,`target_type`,`target_id`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COMMENT='工作任务-分发目标(企业/基地)关联表';

-- ----------------------------
