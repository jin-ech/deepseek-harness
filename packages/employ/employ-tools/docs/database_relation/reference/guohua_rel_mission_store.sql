-- Table structure for guohua_rel_mission_store
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_mission_store`;
CREATE TABLE `guohua_rel_mission_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `mission_id` int(10) unsigned NOT NULL COMMENT '任务ID，关联guohua_mission.mission_id',
  `store_id` int(10) unsigned NOT NULL COMMENT '基地ID，关联guohua_store.store_id',
  `recruit_people_num` int(11) NOT NULL DEFAULT 0 COMMENT '分配招聘人数',
  `recruit_three_types_num` int(11) NOT NULL DEFAULT 0 COMMENT '分配招聘三类人数',
  `assign_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '分配人（负责人）userid',
  `remarks` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人userid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人userid',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  PRIMARY KEY (`id`),
  KEY `idx_mission_id` (`mission_id`),
  KEY `idx_store_id` (`store_id`),
  KEY `idx_mission_store` (`mission_id`,`store_id`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COMMENT='任务分配基地关联表';

-- ----------------------------
