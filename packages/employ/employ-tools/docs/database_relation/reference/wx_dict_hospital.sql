-- Table structure for wx_dict_hospital
-- ----------------------------
DROP TABLE IF EXISTS `wx_dict_hospital`;
CREATE TABLE `wx_dict_hospital` (
  `hospital_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医院id',
  `area_id` int(11) NOT NULL DEFAULT 0 COMMENT '区域id',
  `hospital_name` varchar(255) NOT NULL COMMENT '医院名称',
  `remarks` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注信息',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1显示 0不显示',
  PRIMARY KEY (`hospital_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='微信预约体检-医院字典表';

-- ----------------------------
