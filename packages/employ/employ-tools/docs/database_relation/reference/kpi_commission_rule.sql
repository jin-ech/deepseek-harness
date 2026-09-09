-- Table structure for kpi_commission_rule
-- ----------------------------
DROP TABLE IF EXISTS `kpi_commission_rule`;
CREATE TABLE `kpi_commission_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `business_type` varchar(20) NOT NULL COMMENT '业务类型 direct=直销 channel=渠道',
  `contract_type` varchar(20) NOT NULL COMMENT '合同类型 new=新签 renew=续签',
  `sign_tenure_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '签约年限类型 0不限 1两年内 2连签两年以上',
  `monthly_price_min` decimal(10,2) NOT NULL COMMENT '月单价下限',
  `monthly_price_max` decimal(10,2) NOT NULL COMMENT '月单价上限',
  `commission_rate` decimal(5,2) NOT NULL COMMENT '提成比例(%)',
  `need_approval` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否需要审批 1=是 0=否',
  `operation_cost` decimal(10,2) NOT NULL DEFAULT 280.00 COMMENT '运营成本 280元/人/月',
  `is_channel_cost` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否扣除渠道成本 1=是 0=否',
  `remark` varchar(200) DEFAULT '' COMMENT '规则说明',
  `create_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COMMENT='提成规则配置表';

-- ----------------------------
