-- ============================================================
-- 冲刺活动主表
-- 用途: 管理冲刺活动配置（名称、奖励池、时间窗、目标说明、关联部门）
-- ============================================================

DROP TABLE IF EXISTS `guohua_sprint_activity`;
CREATE TABLE `guohua_sprint_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `activity_name` varchar(100) NOT NULL COMMENT '活动名称（如: 7月回款冲刺周）',
  `reward_pool` decimal(14,2) NOT NULL DEFAULT 0.00 COMMENT '奖励池总额(元)',
  `target_description` varchar(500) DEFAULT '' COMMENT '目标说明（如: 团队回款≥320000元，个人达标额外200000元）',
  `department_id` varchar(64) DEFAULT NULL COMMENT '关联部门ID → base_guohua_user.department_id',
  `start_time` datetime NOT NULL COMMENT '活动开始时间',
  `end_time` datetime NOT NULL COMMENT '活动结束时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态: 0=未开始 1=进行中 2=已结束',
  `create_userid` varchar(64) DEFAULT NULL COMMENT '创建人userid',
  `update_userid` varchar(64) DEFAULT NULL COMMENT '最后修改人userid',
  `create_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '逻辑删除: 1=正常 0=已删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sprint_activity_status` (`status`) USING BTREE,
  KEY `idx_sprint_activity_time` (`start_time`,`end_time`) USING BTREE,
  KEY `idx_sprint_activity_department` (`department_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='冲刺活动主表';

-- ============================================================
-- 说明：trigger_node 及 target_*_amount 目标金额维度已迁移至
-- guohua_sprint_activity_user_rel 人员配置表，按人独立设定。