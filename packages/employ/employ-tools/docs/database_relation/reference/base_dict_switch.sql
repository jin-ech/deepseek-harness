-- Table structure for base_dict_switch
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_switch`;
CREATE TABLE `base_dict_switch` (
  `switch_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '开关id',
  `api_type` varchar(64) NOT NULL DEFAULT '' COMMENT '接口类型A:接口A B:接口B',
  `api_url` varchar(255) NOT NULL DEFAULT '' COMMENT '接口地址',
  `api_status` varchar(64) NOT NULL DEFAULT '' COMMENT '开关状态on:开启资料显示 off:关闭资料显示',
  `version` varchar(255) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`switch_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='就业资料开关配置表';

-- ----------------------------
