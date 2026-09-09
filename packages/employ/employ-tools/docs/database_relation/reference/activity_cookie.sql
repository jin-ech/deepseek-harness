-- Table structure for activity_cookie
-- ----------------------------
DROP TABLE IF EXISTS `activity_cookie`;
CREATE TABLE `activity_cookie` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cookie` varchar(64) NOT NULL DEFAULT '0' COMMENT 'cookie',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '提交时间',
  `cl_username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COMMENT='网站活动cookie表';

-- ----------------------------
