-- Table structure for base_dict_cbj_fund
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_cbj_fund`;
CREATE TABLE `base_dict_cbj_fund` (
  `cbj_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '残保金id',
  `min_base` float(11,1) NOT NULL COMMENT '最小社保缴纳基数',
  `max_base` float(11,1) NOT NULL COMMENT '最大社保缴纳基数',
  `avg_base` float(11,1) NOT NULL COMMENT '残疾人月薪',
  `cbj_area_id` int(32) NOT NULL DEFAULT 0 COMMENT '地区名拼音',
  `year` varchar(32) NOT NULL DEFAULT '' COMMENT '年',
  PRIMARY KEY (`cbj_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COMMENT='残保金缴纳基数表';

-- ----------------------------
