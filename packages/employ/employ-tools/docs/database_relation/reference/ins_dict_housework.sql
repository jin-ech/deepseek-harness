-- Table structure for ins_dict_housework
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_housework`;
CREATE TABLE `ins_dict_housework` (
  `housework_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会做的家事id',
  `housework_name` varchar(255) NOT NULL DEFAULT '' COMMENT '会做的家事',
  PRIMARY KEY (`housework_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='家庭情况会做的家事字典表';

-- ----------------------------
