-- Table structure for ins_dict_main_economic_source
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_main_economic_source`;
CREATE TABLE `ins_dict_main_economic_source` (
  `main_economic_source_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主要经济来源id',
  `main_economic_source_name` varchar(255) NOT NULL DEFAULT '' COMMENT '主要经济来源',
  PRIMARY KEY (`main_economic_source_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='家庭情况主要经济来源字典表';

-- ----------------------------
