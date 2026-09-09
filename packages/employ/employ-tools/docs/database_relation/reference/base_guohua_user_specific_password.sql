-- Table structure for base_guohua_user_specific_password
-- ----------------------------
DROP TABLE IF EXISTS `base_guohua_user_specific_password`;
CREATE TABLE `base_guohua_user_specific_password` (
  `specific_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userid` varchar(50) DEFAULT NULL COMMENT '人员id',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `specific_password` varchar(64) DEFAULT NULL COMMENT '特定密码',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`specific_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='人员邮箱特定密码表';

-- ----------------------------
