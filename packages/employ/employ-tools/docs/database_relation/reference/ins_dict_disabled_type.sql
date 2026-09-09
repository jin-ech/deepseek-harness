-- Table structure for ins_dict_disabled_type
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_disabled_type`;
CREATE TABLE `ins_dict_disabled_type` (
  `disabled_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '残疾类别id',
  `disabled_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '残疾类别名称',
  `sort` int(11) NOT NULL DEFAULT 999 COMMENT '排序',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`disabled_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='残疾人类别字典表';

-- ----------------------------
