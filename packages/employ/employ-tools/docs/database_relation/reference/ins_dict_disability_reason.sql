-- Table structure for ins_dict_disability_reason
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_disability_reason`;
CREATE TABLE `ins_dict_disability_reason` (
  `disability_reason_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '致残原因id',
  `disability_reason_name` varchar(255) NOT NULL COMMENT '致残原因名称',
  PRIMARY KEY (`disability_reason_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='致残原因字典表';

-- ----------------------------
