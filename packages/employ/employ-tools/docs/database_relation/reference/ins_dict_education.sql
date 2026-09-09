-- Table structure for ins_dict_education
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_education`;
CREATE TABLE `ins_dict_education` (
  `education_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学历id',
  `education_name` varchar(64) NOT NULL DEFAULT '' COMMENT '学历名称',
  `sort` int(11) NOT NULL DEFAULT 999 COMMENT '排序',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1 未删除 0已删除',
  PRIMARY KEY (`education_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='学历字典表';

-- ----------------------------
