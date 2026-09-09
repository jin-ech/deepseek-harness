-- Table structure for guohua_service_staff_monthly
-- ----------------------------
DROP TABLE IF EXISTS `guohua_service_staff_monthly`;
CREATE TABLE `guohua_service_staff_monthly` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `stat_month` char(7) NOT NULL COMMENT '考核月份 (YYYY-MM)',
  `user_id` varchar(64) NOT NULL COMMENT '企业微信用户ID',
  `user_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `department_id` int(11) DEFAULT NULL COMMENT '所属部门ID',
  `department_name` varchar(100) DEFAULT NULL COMMENT '所属部门名称',
  `target_service_customer_count` int(11) DEFAULT 0 COMMENT '目标服务客户数',
  `actual_service_customer_count_direct` int(11) DEFAULT 0 COMMENT '实际服务客户数-直雇',
  `actual_service_customer_count_dispatch` int(11) DEFAULT 0 COMMENT '实际服务客户数-派遣',
  `service_score` decimal(10,2) DEFAULT 0.00 COMMENT '服务得分',
  `overage_reward_standard_direct` decimal(10,2) DEFAULT 10.00 COMMENT '超额奖励标准-直雇',
  `overage_reward_standard_dispatch` decimal(10,2) DEFAULT 15.00 COMMENT '超额奖励标准-派遣',
  `month_customer_renewal_rate` decimal(10,4) DEFAULT 0.0000 COMMENT '当月客户续签率',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_stat_month_user_id` (`stat_month`,`user_id`) USING BTREE,
  KEY `idx_department_id` (`department_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='客服月度人员基础信息表';

-- ----------------------------
