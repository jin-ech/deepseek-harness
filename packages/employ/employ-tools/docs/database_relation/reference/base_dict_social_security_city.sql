-- Table structure for base_dict_social_security_city
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_social_security_city`;
CREATE TABLE `base_dict_social_security_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地区id',
  `code` varchar(32) NOT NULL COMMENT '大区编号',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '地区名称',
  `short_name` varchar(32) NOT NULL COMMENT '字母简称',
  `text` varchar(32) NOT NULL DEFAULT '' COMMENT '文本描述',
  `value` varchar(32) NOT NULL DEFAULT '1' COMMENT '地区名拼音',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1是 2否',
  PRIMARY KEY (`city_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=447 DEFAULT CHARSET=utf8mb4 COMMENT='社会保险地区表字典表';

-- ----------------------------
