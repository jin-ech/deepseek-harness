-- Table structure for zyx_activity_type
-- ----------------------------
DROP TABLE IF EXISTS `zyx_activity_type`;
CREATE TABLE `zyx_activity_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `activity_type` varchar(255) NOT NULL DEFAULT '' COMMENT '活动类型',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '活动分类介绍',
  `is_custom` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否是定制 1：是 0：否',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='基地导览活动预约活动类型表';

-- ----------------------------
