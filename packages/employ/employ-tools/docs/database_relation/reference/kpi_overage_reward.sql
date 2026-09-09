-- Table structure for kpi_overage_reward
-- ----------------------------
DROP TABLE IF EXISTS `kpi_overage_reward`;
CREATE TABLE `kpi_overage_reward` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `business_type` varchar(20) NOT NULL COMMENT '业务类型 direct=直销 channel=渠道',
  `reward_rate` decimal(5,2) NOT NULL DEFAULT 2.00 COMMENT '额外加成比例(%)',
  `reward_condition` varchar(200) NOT NULL COMMENT '触发条件',
  `is_enabled` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `create_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='超额奖励配置表';

-- ----------------------------
