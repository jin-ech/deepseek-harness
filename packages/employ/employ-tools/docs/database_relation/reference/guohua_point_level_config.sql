-- Table structure for guohua_point_level_config
-- ----------------------------
DROP TABLE IF EXISTS `guohua_point_level_config`;
CREATE TABLE `guohua_point_level_config` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(20) NOT NULL COMMENT '等级名称',
  `min_points` int(11) NOT NULL COMMENT '最低积分（含）',
  `max_points` int(11) DEFAULT NULL COMMENT '最高积分（不含），NULL表示最高等级',
  PRIMARY KEY (`level_id`),
  KEY `idx_min_points` (`min_points`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='积分等级配置';

-- ----------------------------
