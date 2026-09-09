-- Table structure for rel_ens_activity_banner
-- ----------------------------
DROP TABLE IF EXISTS `rel_ens_activity_banner`;
CREATE TABLE `rel_ens_activity_banner` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'banner id ',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_url` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `sort` int(11) DEFAULT 999 COMMENT '排序',
  `is_show` tinyint(4) DEFAULT 1 COMMENT '1 显示 0不显示',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8mb4 COMMENT='助益行活动banner';

-- ----------------------------
