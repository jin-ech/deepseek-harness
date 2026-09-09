-- Table structure for base_dict_system
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_system`;
CREATE TABLE `base_dict_system` (
  `system_id` varchar(64) NOT NULL COMMENT '系统ID',
  `system_name` varchar(255) NOT NULL DEFAULT '' COMMENT '系统名称',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`system_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统字典表';

-- ----------------------------
