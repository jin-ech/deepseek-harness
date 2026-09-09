-- Table structure for user_appid
-- ----------------------------
DROP TABLE IF EXISTS `user_appid`;
CREATE TABLE `user_appid` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `appid` varchar(64) NOT NULL DEFAULT '0' COMMENT 'appid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加日期',
  `user` varchar(64) NOT NULL DEFAULT '0' COMMENT '用户',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0 已删除',
  `is_sign` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否跳过验证 1是 0否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='网站活动cookie表';

-- ----------------------------
