-- Table structure for rel_ens_activity_persons_points
-- ----------------------------
DROP TABLE IF EXISTS `rel_ens_activity_persons_points`;
CREATE TABLE `rel_ens_activity_persons_points` (
  `points_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分记录id',
  `activity_points_type_id` int(11) DEFAULT NULL COMMENT '活动积分类型id',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
  `persons_id` varchar(64) DEFAULT NULL COMMENT '人员id',
  `activity_points` decimal(10,2) DEFAULT NULL COMMENT '获得活动积分',
  `add_userid` varchar(64) DEFAULT NULL COMMENT '后台添加人',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  PRIMARY KEY (`points_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='助益行志愿者活动积分记录表';

-- ----------------------------
