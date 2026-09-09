-- Table structure for base_dict_seal_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_seal_type`;
CREATE TABLE `base_dict_seal_type` (
  `seal_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `seal_type_name` varchar(64) NOT NULL DEFAULT '' COMMENT '费用类别名称',
  `sort` int(11) NOT NULL DEFAULT 999 COMMENT '排序',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1显示 0不显示i',
  PRIMARY KEY (`seal_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='印章类别字典表';

-- ----------------------------
