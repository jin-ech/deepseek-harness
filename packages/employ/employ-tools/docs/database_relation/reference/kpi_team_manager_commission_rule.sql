-- Table structure for kpi_team_manager_commission_rule
-- ----------------------------
DROP TABLE IF EXISTS `kpi_team_manager_commission_rule`;
CREATE TABLE `kpi_team_manager_commission_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `business_type` varchar(20) NOT NULL COMMENT '业务类型 direct=直销 channel=渠道',
  `contract_type` varchar(20) NOT NULL COMMENT '合同类型 new=新签 renew=续签',
  `bonus_rate` decimal(8,4) NOT NULL DEFAULT 0.0000 COMMENT '团队经理加提比例（小数，例如 0.0500）',
  `is_enabled` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否启用 1=启用 0=禁用',
  `remark` varchar(200) DEFAULT '' COMMENT '规则说明',
  `create_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_kpi_tmcr_bt_ct` (`business_type`,`contract_type`) USING BTREE,
  KEY `idx_kpi_tmcr_enabled` (`is_enabled`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='团队经理团队提成规则表';

-- ----------------------------
