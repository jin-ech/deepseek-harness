-- Table structure for kpi_job_position
-- ----------------------------
DROP TABLE IF EXISTS `kpi_job_position`;
CREATE TABLE `kpi_job_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `position_name` varchar(50) NOT NULL COMMENT '岗位职级序列名称',
  `position_level` varchar(20) NOT NULL COMMENT '岗位等级',
  `is_all_position` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否全岗位 1=是 0=否',
  `create_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_position_level` (`position_level`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='岗位职级基础表';

-- ----------------------------
