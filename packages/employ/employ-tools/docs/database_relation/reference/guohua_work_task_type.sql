-- Table structure for guohua_work_task_type
-- ----------------------------
DROP TABLE IF EXISTS `guohua_work_task_type`;
CREATE TABLE `guohua_work_task_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `type_code` varchar(32) NOT NULL DEFAULT '' COMMENT '类型编码，如 checkin/home/labeling/questionnaire',
  `type_name` varchar(64) NOT NULL DEFAULT '' COMMENT '类型名称，如 居家任务',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标URL（可选）',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序，越小越靠前',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 1:启用 2:停用',
  `remarks` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人 userid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人 userid',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  `store_types` varchar(32) DEFAULT NULL COMMENT '可分配的基地类型(1,2)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_type_code` (`type_code`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='工作任务一级类型表';

-- ----------------------------
