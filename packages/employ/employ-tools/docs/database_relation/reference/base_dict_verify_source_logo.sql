-- Table structure for base_dict_verify_source_logo
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_verify_source_logo`;
CREATE TABLE `base_dict_verify_source_logo` (
  `verify_source_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '来源id',
  `verify_source_name` varchar(255) NOT NULL DEFAULT '' COMMENT '来源名称',
  `verify_source_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '来源logo',
  PRIMARY KEY (`verify_source_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='验证来源logo表';

-- ----------------------------
