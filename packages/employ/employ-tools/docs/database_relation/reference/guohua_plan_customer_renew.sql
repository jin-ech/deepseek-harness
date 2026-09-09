-- Table structure for guohua_plan_customer_renew
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_customer_renew`;
CREATE TABLE `guohua_plan_customer_renew` (
  `renew_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `month` varchar(32) DEFAULT NULL COMMENT '月份2025-01',
  `area_id` int(11) DEFAULT NULL COMMENT '地区id',
  `area_name` varchar(32) DEFAULT NULL COMMENT '区域名称',
  `department_id` varchar(32) DEFAULT NULL COMMENT '部门id',
  `department_name` varchar(32) DEFAULT NULL COMMENT '部门名',
  `service_customer` int(11) DEFAULT NULL COMMENT '服务客户数',
  `service_people_light` int(11) DEFAULT NULL COMMENT '服务人数轻残',
  `service_people_weight` int(11) DEFAULT NULL COMMENT '服务人数重残',
  `year_resign_customer` int(11) DEFAULT NULL COMMENT '年度需转签客户数',
  `year_resign_light` int(11) DEFAULT NULL COMMENT '年度需转签轻残',
  `year_resign_weight` int(11) DEFAULT NULL COMMENT '年度需转签重残',
  `year_renew_customer` int(11) DEFAULT NULL COMMENT '年度已续签客户数',
  `year_renew_light` int(11) DEFAULT NULL COMMENT '年度已续签轻残',
  `year_renew_weight` int(11) DEFAULT NULL COMMENT '年度已续签重残',
  `year_not_renew_customer` int(11) DEFAULT NULL COMMENT '年度不续签客户数',
  `month_expire_customer` int(11) DEFAULT NULL COMMENT '本月到期客户数',
  `month_expire_light` int(11) DEFAULT NULL COMMENT '本月到期轻残',
  `month_expire_weight` int(11) DEFAULT NULL COMMENT '本月到期重残',
  `month_renew_customer` int(11) DEFAULT NULL COMMENT '本月续签客户数',
  `month_renew_light` int(11) DEFAULT NULL COMMENT '本月续签轻残',
  `month_renew_weight` int(11) DEFAULT NULL COMMENT '本月续签重残',
  `month_not_renew_customer` int(11) DEFAULT NULL COMMENT '本月明确不续签客户数',
  `month_not_renew_light` int(11) DEFAULT NULL COMMENT '本月不续签轻残',
  `month_not_renew_weight` int(11) DEFAULT NULL COMMENT '本月不续签重残',
  `month_residue_light` int(11) DEFAULT NULL COMMENT '本月剩余轻残',
  `month_residue_weight` int(11) DEFAULT NULL COMMENT '本月剩余重残',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`renew_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COMMENT='客户续签进度表';

-- ----------------------------
