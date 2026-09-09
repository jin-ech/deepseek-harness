-- Table structure for market_system_var
-- ----------------------------
DROP TABLE IF EXISTS `market_system_var`;
CREATE TABLE `market_system_var` (
  `var_code` varchar(64) NOT NULL COMMENT '变量编码',
  `var_value` text NOT NULL COMMENT '变量值',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`var_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='营销小程序系统变量表（kv 配置）';

-- ----------------------------
