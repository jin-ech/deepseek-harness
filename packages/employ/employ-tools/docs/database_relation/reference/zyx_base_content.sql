-- Table structure for zyx_base_content
-- ----------------------------
DROP TABLE IF EXISTS `zyx_base_content`;
CREATE TABLE `zyx_base_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '基地内容ID',
  `base_id` int(11) NOT NULL COMMENT '基地ID',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'Icon url',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text DEFAULT NULL COMMENT '内容',
  `sort` tinyint(4) NOT NULL DEFAULT 99 COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1：显示 0：隐藏',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:未删除 0：已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime(4) NOT NULL DEFAULT current_timestamp(4) ON UPDATE current_timestamp(4) COMMENT '更新时间',
  PRIMARY KEY (`content_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8mb4 COMMENT='助益行 基地内容表';

-- ----------------------------
