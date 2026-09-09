-- Table structure for sale_rank_config
-- ----------------------------
DROP TABLE IF EXISTS `sale_rank_config`;
CREATE TABLE `sale_rank_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userid` varchar(64) NOT NULL COMMENT '用户ID',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否展示到销售排行榜：1展示 0隐藏',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否删除：1正常 0删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_sale_rank_config_userid` (`userid`),
  KEY `idx_sale_rank_config_show_delete` (`is_show`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='销售排行榜过滤用户配置表';

-- ----------------------------
