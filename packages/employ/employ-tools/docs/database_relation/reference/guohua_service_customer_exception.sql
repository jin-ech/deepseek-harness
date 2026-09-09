-- Table structure for guohua_service_customer_exception
-- ----------------------------
DROP TABLE IF EXISTS `guohua_service_customer_exception`;
CREATE TABLE `guohua_service_customer_exception` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_userid` varchar(64) NOT NULL COMMENT '客服企业微信 userid',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `include_in_service_customer` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否额外纳入服务客户统计',
  `ignore_guohua_name_exclude` tinyint(4) NOT NULL DEFAULT 0 COMMENT '客户名包含国华时是否豁免排除',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1有效 0删除，跟当前客户域口径保持一致',
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_service_customer` (`service_userid`,`customer_id`),
  KEY `idx_customer_id` (`customer_id`),
  KEY `idx_service_userid` (`service_userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='服务客户统计特殊纳入规则表';

-- ----------------------------
