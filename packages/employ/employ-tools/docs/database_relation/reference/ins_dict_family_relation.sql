-- Table structure for ins_dict_family_relation
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_family_relation`;
CREATE TABLE `ins_dict_family_relation` (
  `family_relation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '家人关系id',
  `family_relation_name` varchar(255) NOT NULL DEFAULT '' COMMENT '家人关系',
  PRIMARY KEY (`family_relation_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='家庭情况家人关系字典表';

-- ----------------------------
