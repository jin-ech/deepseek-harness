-- ============================================================
-- 兑现记录表
-- 用途: 记录冲刺活动提成兑现的审批流程及结果
--       用户在台账列表点击"核算"后发起审批，插入一条兑现记录
--       审批状态流转: 1=审批中 → 2=待核算 → 3=已兑现
-- ============================================================

DROP TABLE IF EXISTS `guohua_sprint_settlement_record`;
CREATE TABLE `guohua_sprint_settlement_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',

  -- 单号 & 审批信息
  `settlement_no` varchar(64) NOT NULL COMMENT '兑现单号，如 DH-20240715-0001',
  `sp_no` varchar(128) DEFAULT NULL COMMENT '审批流编号（对接企微审批实例ID）',
  `sp_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '审批状态: 1=审批中 2=待核算 3=已兑现',
  `approver_userid` varchar(64) DEFAULT NULL COMMENT '审批人企业微信userid',
  `approve_time` datetime DEFAULT NULL COMMENT '审批完成时间',

  -- 关联信息
  `activity_id` bigint(20) NOT NULL COMMENT '冲刺活动ID → guohua_sprint_activity.id',
  `user_id` varchar(64) NOT NULL COMMENT '人员企业微信userid → base_guohua_user.userid',

  -- 业绩信息（快照，审批时固化）
  `related_performance` varchar(512) DEFAULT NULL COMMENT '业绩描述，如"回款 14616.33元 / 新签 6650.00元 / 续签 7966.33元"',

  -- 提成方式展示（快照）
  `commission_method` varchar(256) DEFAULT NULL COMMENT '提成方式，如"新签 1000.0元 / 续签 3.0%"',
  `leader_commission_method` varchar(128) DEFAULT NULL COMMENT '领导提成方式，如"5.0%"或"3000元"，无则为空',

  -- 提成金额（元）
  `base_commission` decimal(12,2) NOT NULL DEFAULT 0.00 COMMENT '基础提成金额（元）= 新签签约提成 + 续签提成',
  `leader_commission` decimal(12,2) NOT NULL DEFAULT 0.00 COMMENT '领导提成金额（元），无则为 0',
  `total_commission` decimal(12,2) NOT NULL DEFAULT 0.00 COMMENT '总提成 = base_commission + leader_commission（元）',

  -- 审计字段
  `create_userid` varchar(64) DEFAULT NULL COMMENT '创建人userid',
  `update_userid` varchar(64) DEFAULT NULL COMMENT '最后修改人userid',
  `create_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '逻辑删除: 1=正常 0=已删除',

  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_settlement_no` (`settlement_no`) USING BTREE COMMENT '兑现单号唯一',
  KEY `idx_settlement_activity` (`activity_id`) USING BTREE,
  KEY `idx_settlement_user` (`user_id`) USING BTREE,
  KEY `idx_settlement_sp_status` (`sp_status`) USING BTREE,
  KEY `idx_settlement_sp_no` (`sp_no`) USING BTREE,
  KEY `idx_settlement_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='冲刺活动兑现记录表';
