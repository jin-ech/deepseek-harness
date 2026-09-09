-- Table structure for guohua_customer_user
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_user`;
CREATE TABLE `guohua_customer_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '企业用户id',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '企业id',
  `user_name` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码',
  `password_text` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `contact_name` varchar(64) NOT NULL COMMENT '联系人',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '联系电话',
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色id',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 1 启用  0禁用',
  `remarks` text DEFAULT NULL COMMENT '助残备注',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0 已删除',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `index_user_name` (`user_name`) USING BTREE COMMENT '用户名唯一',
  UNIQUE KEY `index_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4647 DEFAULT CHARSET=utf8mb4 COMMENT='客户用户信息表';

-- ----------------------------
