-- Table structure for ins_dict_main_look
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_main_look`;
CREATE TABLE `ins_dict_main_look` (
  `main_look_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主要照顾者id',
  `main_look_name` varchar(255) NOT NULL DEFAULT '' COMMENT '主要照顾者名称',
  PRIMARY KEY (`main_look_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='家庭情况主要照顾着字典表';

-- ----------------------------
