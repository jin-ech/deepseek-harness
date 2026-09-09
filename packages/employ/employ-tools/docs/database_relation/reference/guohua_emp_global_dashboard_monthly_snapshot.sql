-- Table structure for guohua_emp_global_dashboard_monthly_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `guohua_emp_global_dashboard_monthly_snapshot`;
CREATE TABLE `guohua_emp_global_dashboard_monthly_snapshot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `stat_month` char(7) NOT NULL COMMENT '统计月份 YYYY-MM',
  `region_id` int(11) NOT NULL DEFAULT 0 COMMENT '基地行政区域ID',
  `employee_total` int(11) NOT NULL DEFAULT 0 COMMENT '就业人数快照',
  `base_count` int(11) NOT NULL DEFAULT 0 COMMENT '基地数量快照，按建立日期计入',
  `labor_project_quantity` int(11) NOT NULL DEFAULT 0 COMMENT '已完成劳动项目订单数',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_month_region` (`stat_month`,`region_id`),
  KEY `idx_region_month` (`region_id`,`stat_month`),
  KEY `idx_stat_month` (`stat_month`)
) ENGINE=InnoDB AUTO_INCREMENT=29899 DEFAULT CHARSET=utf8mb4 COMMENT='全市帮扶性就业大屏月度快照表';

-- ----------------------------
