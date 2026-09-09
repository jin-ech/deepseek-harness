-- Table structure for rel_ens_activity_enterprise_points
-- ----------------------------
DROP TABLE IF EXISTS `rel_ens_activity_enterprise_points`;
CREATE TABLE `rel_ens_activity_enterprise_points` (
  `points_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分记录id',
  `activity_points_type_id` int(11) DEFAULT NULL COMMENT '活动积分类型id',
  `customer_id` int(11) DEFAULT NULL COMMENT '企业id',
  `activity_points_type_score` decimal(10,2) DEFAULT NULL COMMENT '获得积分',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  PRIMARY KEY (`points_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='助益行企业活动积分记录表';

-- ----------------------------
