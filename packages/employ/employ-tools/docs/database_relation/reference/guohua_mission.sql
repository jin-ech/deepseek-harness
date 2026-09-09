-- Table structure for guohua_mission
-- ----------------------------
DROP TABLE IF EXISTS `guohua_mission`;
CREATE TABLE `guohua_mission` (
  `mission_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `project_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '项目ID',
  `service_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务ID',
  `mission_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '任务编号',
  `demand_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '需求ID',
  `demand_job_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联岗位ID',
  `recruit_people_num` int(11) NOT NULL DEFAULT 0 COMMENT '负责招聘人数',
  `recruit_three_types_num` int(11) NOT NULL DEFAULT 0 COMMENT '负责招聘三类人数',
  `responsible_person` varchar(255) NOT NULL DEFAULT '' COMMENT '负责人微信ID',
  `main_department_id` int(11) NOT NULL DEFAULT 0 COMMENT '负责部门ID',
  `material_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '材料类型 1:标准材料 2:非标准材料',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `mission_status` varchar(64) NOT NULL DEFAULT '1' COMMENT '任务状态 1:未开始 2:招聘中 3:已完成 4:已终止',
  `audit_status` tinyint(4) NOT NULL DEFAULT 20 COMMENT '审核状态 10未审核 20审核通过（需求自动下发的任务为10，客户确认后变20）',
  `recruit_start_date` varchar(255) NOT NULL DEFAULT '' COMMENT '招聘开始时间',
  `recruit_end_date` varchar(255) NOT NULL DEFAULT '' COMMENT '招聘结束时间',
  `recruit_place` int(11) NOT NULL DEFAULT 0 COMMENT '招聘地点ID',
  `participant` varchar(255) NOT NULL DEFAULT '' COMMENT '参与人',
  `complete_people` int(11) NOT NULL DEFAULT 0 COMMENT '已招聘人数',
  `complete_three_people` int(11) NOT NULL DEFAULT 0 COMMENT '已招聘三类人数',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '添加人微信ID',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '更新人微信ID',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0 已删除',
  `tmp_id` varchar(255) NOT NULL DEFAULT '' COMMENT '临时任务id',
  `contract_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '合同id',
  PRIMARY KEY (`mission_id`) USING BTREE,
  KEY `_index_demand_id` (`demand_id`) USING BTREE,
  KEY `_index_demand_job_id` (`demand_job_id`) USING BTREE,
  KEY `_index_mission_id` (`mission_id`) USING BTREE,
  KEY `idx_mission_is_delete` (`is_delete`),
  KEY `idx_mission_delete` (`is_delete`,`mission_id`),
  KEY `idx_mission_demand_id` (`demand_id`,`is_delete`),
  KEY `idx_mission_isdelete_demand_mission` (`is_delete`,`demand_id`,`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22082 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-任务信息表';

-- ----------------------------
