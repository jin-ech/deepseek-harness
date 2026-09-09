-- Table structure for ins_dict_economic_state
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_economic_state`;
CREATE TABLE `ins_dict_economic_state` (
  `economic_state_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '经济状况id',
  `economic_state_name` varchar(255) NOT NULL COMMENT '经济状况',
  PRIMARY KEY (`economic_state_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='家庭情况经济状况字典表';

-- ----------------------------
