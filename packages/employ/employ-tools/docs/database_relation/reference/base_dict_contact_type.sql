-- Table structure for base_dict_contact_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_contact_type`;
CREATE TABLE `base_dict_contact_type` (
  `contact_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '联系人类型id',
  `contact_type_name` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人类型名称',
  `is_show` tinyint(4) DEFAULT 1 COMMENT '是否显示 1:是 0:否',
  PRIMARY KEY (`contact_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='联系人类型字典表';

-- ----------------------------
