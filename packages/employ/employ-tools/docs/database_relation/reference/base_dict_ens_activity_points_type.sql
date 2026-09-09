-- Table structure for base_dict_ens_activity_points_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_ens_activity_points_type`;
CREATE TABLE `base_dict_ens_activity_points_type` (
  `activity_points_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动积分类型id',
  `activity_type_id` int(11) DEFAULT NULL COMMENT '活动类型id',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id',
  `activity_points_type_name` varchar(255) DEFAULT NULL COMMENT '活动类型名称',
  `activity_points_type_content` varchar(255) DEFAULT NULL COMMENT '相关要求',
  `activity_points_type_score` varchar(255) DEFAULT NULL COMMENT '获得分值',
  `sort` int(11) DEFAULT 999 COMMENT '排序',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`activity_points_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='助益行活动类型积分表';

-- ----------------------------
