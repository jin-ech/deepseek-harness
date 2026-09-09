-- Table structure for market_roles
-- ----------------------------
DROP TABLE IF EXISTS `market_roles`;
CREATE TABLE `market_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(32) NOT NULL DEFAULT '' COMMENT '角色编码 sale/service/customer',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：0未删除 1已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='营销小程序角色表';

-- ----------------------------
