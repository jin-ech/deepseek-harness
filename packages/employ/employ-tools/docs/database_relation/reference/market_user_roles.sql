-- Table structure for market_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `market_user_roles`;
CREATE TABLE `market_user_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `market_user_id` bigint(20) NOT NULL COMMENT '用户id market_users.market_user_id',
  `role_id` int(11) NOT NULL COMMENT '角色id market_roles.role_id',
  `role_code` varchar(32) NOT NULL DEFAULT '' COMMENT '角色编码 sale/service/customer',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_market_user_roles_user` (`market_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COMMENT='营销小程序用户-角色关联表';

-- ----------------------------
