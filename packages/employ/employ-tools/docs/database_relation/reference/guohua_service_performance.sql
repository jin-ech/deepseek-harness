-- Table structure for guohua_service_performance
-- ----------------------------
DROP TABLE IF EXISTS `guohua_service_performance`;
CREATE TABLE `guohua_service_performance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `stat_month` char(7) NOT NULL COMMENT '考核月份 (YYYY-MM)',
  `user_id` varchar(64) NOT NULL COMMENT '企业微信用户ID',
  `user_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `department_id` int(11) DEFAULT NULL COMMENT '所属部门ID',
  `department_name` varchar(100) DEFAULT NULL COMMENT '所属部门名称',
  `target_service_customers` int(11) NOT NULL DEFAULT 0 COMMENT '目标服务客户数-手工填写',
  `actual_service_customers_direct` int(11) NOT NULL DEFAULT 0 COMMENT '实际服务客户数-直雇(系统同步)',
  `actual_service_customers_dispatch` int(11) NOT NULL DEFAULT 0 COMMENT '实际服务客户数-派遣(系统同步)',
  `service_score` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '服务得分',
  `direct_excess_reward_standard` decimal(10,2) NOT NULL DEFAULT 10.00 COMMENT '超额奖励标准-直雇(元/客户)',
  `dispatch_excess_reward_standard` decimal(10,2) NOT NULL DEFAULT 15.00 COMMENT '超额奖励标准-派遣(元/客户)',
  `monthly_customer_renewal_rate` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT '当月客户续签率(%)',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `dispatch_discount_rate` decimal(10,2) NOT NULL DEFAULT 1.50 COMMENT '派遣折算倍数',
  `is_delete` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除 0:否 1:是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_service_month_user` (`stat_month`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COMMENT='客服人员绩效月度表';

-- ----------------------------
