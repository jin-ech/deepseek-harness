-- Table structure for base_dict_cbj_area
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_cbj_area`;
CREATE TABLE `base_dict_cbj_area` (
  `cbj_area_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '残保金地区id',
  `code` varchar(32) NOT NULL COMMENT '地区编号',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '地区名',
  `short_name` varchar(32) NOT NULL COMMENT '字母简称',
  `text` varchar(32) NOT NULL DEFAULT '' COMMENT '文本描述',
  `value` varchar(32) NOT NULL DEFAULT '1' COMMENT '地区名拼音',
  PRIMARY KEY (`cbj_area_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='残保金地区名单表';

-- ----------------------------
