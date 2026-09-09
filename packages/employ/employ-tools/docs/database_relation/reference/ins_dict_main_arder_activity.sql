-- Table structure for ins_dict_main_arder_activity
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_main_arder_activity`;
CREATE TABLE `ins_dict_main_arder_activity` (
  `main_arder_activity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主要休闲活动id',
  `main_arder_activity_name` varchar(255) NOT NULL DEFAULT '' COMMENT '主要休闲活动',
  PRIMARY KEY (`main_arder_activity_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='家庭情况主要休闲活动字典表';

-- ----------------------------
