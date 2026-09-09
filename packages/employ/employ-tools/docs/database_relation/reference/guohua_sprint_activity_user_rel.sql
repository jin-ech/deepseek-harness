-- ============================================================
-- 挂钩节点枚举值
-- 回款入账 / 赢单签约 / 续约完成 / 综合达成

-- ============================================================
-- 冲刺活动人员提成配置表
-- 用途: 记录冲刺活动下每个参与人员的独立提成方式和提成比例/金额
--       创建冲刺活动时，从活动关联部门中选取人员，为每人单独配置提成
-- ============================================================

DROP TABLE IF EXISTS `guohua_sprint_activity_user_rel`;
CREATE TABLE `guohua_sprint_activity_user_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',

  -- 关联关系
  `activity_id` bigint(20) NOT NULL COMMENT '冲刺活动ID → guohua_sprint_activity.id',
  `user_id` varchar(64) NOT NULL COMMENT '人员企业微信userid → base_guohua_user.userid',

  -- 新签签约提成配置
  `win_sign_rate_percent` decimal(8,4) DEFAULT NULL COMMENT '赢单签约提成比例(%)',
  `win_sign_fixed_amount` decimal(12,2) DEFAULT NULL COMMENT '赢单签约固定提成金额(元)',

  -- 续签单提成配置
  `renew_rate_percent` decimal(8,4) DEFAULT NULL COMMENT '续签提成比例(%)',
  `renew_fixed_amount` decimal(12,2) DEFAULT NULL COMMENT '续签固定提成金额(元)',

  -- 个人业绩目标
  `target_win_sign_amount` decimal(14,2) DEFAULT NULL COMMENT '个人目标赢单签约金额(元)',
  `target_renew_amount` decimal(14,2) DEFAULT NULL COMMENT '个人目标续签完成金额(元)',

  -- 部门领导提成
  `leader_rate_percent` decimal(8,4) DEFAULT NULL COMMENT '部门领导提成比例(%)',
  `leader_fixed_amount` decimal(12,2) DEFAULT NULL COMMENT '部门领导固定提成金额(元)',

  -- 审计字段
  `create_userid` varchar(64) DEFAULT NULL COMMENT '创建人userid',
  `update_userid` varchar(64) DEFAULT NULL COMMENT '最后修改人userid',
  `create_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '逻辑删除: 1=正常 0=已删除',

  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_activity_user` (`activity_id`, `user_id`, `is_delete`) USING BTREE COMMENT '同一活动中同一人员唯一',
  KEY `idx_sprint_member_activity` (`activity_id`) USING BTREE,
  KEY `idx_sprint_member_user` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='冲刺活动人员提成配置表';
