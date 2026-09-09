-- Table structure for guohua_store_rank_monthly_stats
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_rank_monthly_stats`;
CREATE TABLE `guohua_store_rank_monthly_stats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `stat_month` char(7) NOT NULL COMMENT '统计月份 (YYYY-MM)',
  `store_id` int(11) NOT NULL COMMENT '基地ID',
  `store_name` varchar(255) DEFAULT '' COMMENT '基地名称',
  `userid` varchar(64) DEFAULT '' COMMENT '基地负责人ID',
  `department_id` int(11) DEFAULT NULL COMMENT '所属部门ID',
  `department_name` varchar(100) DEFAULT '' COMMENT '所属部门名称',
  `region_name` varchar(255) DEFAULT '' COMMENT '地区名称',
  `checkin_star_count` int(11) DEFAULT 0 COMMENT '月度打卡之星(近30天活跃>=2次)人数',
  `photo_upload_count` int(11) DEFAULT 0 COMMENT '当月上传工作照人数',
  `new_onboard_count` int(11) DEFAULT 0 COMMENT '当月新增上岗人数',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `onsite_count` int(11) DEFAULT 0 COMMENT '在职人数',
  `bind_count` int(11) DEFAULT 0 COMMENT '绑定人数',
  `checkin_count` int(11) DEFAULT 0 COMMENT '打卡人数(口径待定)',
  `light_count` int(11) DEFAULT 0 COMMENT '轻残人数',
  `weight_count` int(11) DEFAULT 0 COMMENT '重残人数',
  `order_done_count` int(11) DEFAULT 0 COMMENT '完成订单数(口径待定)',
  `order_undone_count` int(11) DEFAULT 0 COMMENT '未完成订单数(口径待定)',
  `monthly_revenue_amount` decimal(14,2) DEFAULT 0.00 COMMENT '本月营收金额',
  `operate_amount` decimal(14,2) DEFAULT 0.00 COMMENT '运营金额',
  `employment_amount` decimal(14,2) DEFAULT 0.00 COMMENT '就业金额',
  `total_revenue_amount` decimal(14,2) DEFAULT 0.00 COMMENT '总营收金额',
  `labor_product_amount` decimal(14,2) DEFAULT 0.00 COMMENT '劳动产品金额',
  `labor_product_ongoing_amount` decimal(14,2) DEFAULT 0.00 COMMENT '劳动产品进行中金额',
  `labor_product_month_order_amount` decimal(14,2) DEFAULT 0.00 COMMENT '劳动产品当月订单金额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_month_store` (`stat_month`,`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1710 DEFAULT CHARSET=utf8mb4 COMMENT='基地月度排行榜快照表';

-- ----------------------------
