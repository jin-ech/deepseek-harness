-- Table structure for guohua_plan_self_employ
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_self_employ`;
CREATE TABLE `guohua_plan_self_employ` (
  `self_employ_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `month` varchar(32) DEFAULT NULL COMMENT '月份2025-01',
  `area_id` int(11) DEFAULT NULL COMMENT '地区id',
  `area_name` varchar(32) DEFAULT NULL COMMENT '区域名称',
  `account_id` int(11) DEFAULT NULL COMMENT '主体id',
  `account_name` varchar(32) DEFAULT NULL COMMENT '主体名称',
  `active_employ` int(11) DEFAULT NULL COMMENT '当前在职人数',
  `year_avg_active_employ` int(11) DEFAULT NULL COMMENT '年度平均在职人数',
  `employ_target` int(11) DEFAULT NULL COMMENT '应雇佣指标数',
  `active_employ_light` int(11) DEFAULT NULL COMMENT '在职轻残',
  `active_employ_weight` int(11) DEFAULT NULL COMMENT '在职重残',
  `disable_ratio` int(11) DEFAULT NULL COMMENT '当前残疾人比例',
  `month_payroll_status` varchar(255) DEFAULT NULL COMMENT '月发薪状态',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1:未删除 2:已删除',
  PRIMARY KEY (`self_employ_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COMMENT='自雇残疾人表';

-- ----------------------------
