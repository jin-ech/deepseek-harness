-- Table structure for rel_ins_user_work
-- ----------------------------
DROP TABLE IF EXISTS `rel_ins_user_work`;
CREATE TABLE `rel_ins_user_work` (
  `rel_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(36) NOT NULL DEFAULT '' COMMENT 'ins 库 user_id',
  `area_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '区域ids',
  `store_ids` varchar(500) NOT NULL DEFAULT '0' COMMENT '基地ids',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1：未删除 0：已删除',
  PRIMARY KEY (`rel_id`) USING BTREE,
  UNIQUE KEY `un_ids` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
