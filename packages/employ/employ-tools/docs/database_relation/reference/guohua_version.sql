-- Table structure for guohua_version
-- ----------------------------
DROP TABLE IF EXISTS `guohua_version`;
CREATE TABLE `guohua_version` (
  `version_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '版本id',
  `version_number` varchar(64) DEFAULT NULL COMMENT '版本号',
  `version_content` text DEFAULT NULL COMMENT '版本内容',
  `is_release` tinyint(4) DEFAULT 0 COMMENT '是否发布 1是 0否',
  `is_mast` tinyint(4) DEFAULT 0 COMMENT '是否强制更新1是 0否',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '发布时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除0已删除',
  PRIMARY KEY (`version_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COMMENT='国华CRM系统版本记录表';

-- ----------------------------
