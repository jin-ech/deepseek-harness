-- Table structure for ins_dict_nation
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_nation`;
CREATE TABLE `ins_dict_nation` (
  `nation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nation_name` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`nation_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COMMENT='民族表';

-- ----------------------------
