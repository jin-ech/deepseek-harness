-- Table structure for guohua_rel_renew
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_renew`;
CREATE TABLE `guohua_rel_renew` (
  `renew_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '续签id',
  `demand_id` int(11) NOT NULL DEFAULT 0 COMMENT '需求id',
  `demand_job_id` int(11) NOT NULL DEFAULT 0 COMMENT '需求岗位id',
  `mission_id` int(11) NOT NULL DEFAULT 0 COMMENT '任务id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '人员id',
  `is_sign` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否可转签1是 0否',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `responsible_person` varchar(255) NOT NULL DEFAULT '' COMMENT '负责人微信id',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '添加人微信id',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新时间',
  `update_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '更新人员微信id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0 已删除',
  PRIMARY KEY (`renew_id`) USING BTREE,
  KEY `index_persons_id` (`persons_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-转签记录关联表';

-- ----------------------------
