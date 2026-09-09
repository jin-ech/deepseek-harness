-- Table structure for ins_dict_like_family
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_like_family`;
CREATE TABLE `ins_dict_like_family` (
  `like_family_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '喜欢的家人id',
  `like_family_name` varchar(255) NOT NULL COMMENT '喜欢的家人关系',
  PRIMARY KEY (`like_family_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='家庭情况最喜欢的家人字典表';

-- ----------------------------
