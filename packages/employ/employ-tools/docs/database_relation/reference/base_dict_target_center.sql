-- Table structure for base_dict_target_center
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_target_center`;
CREATE TABLE `base_dict_target_center` (
  `center_id` int(11) NOT NULL AUTO_INCREMENT,
  `center_name` varchar(255) NOT NULL DEFAULT '' COMMENT '中心名',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示  1 显示 0 不显示',
  PRIMARY KEY (`center_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='中心表';

-- ----------------------------
