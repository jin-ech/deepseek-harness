-- Table structure for ins_dict_orthosis
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_orthosis`;
CREATE TABLE `ins_dict_orthosis` (
  `orthosis_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配用矫形器id',
  `orthosis_name` varchar(255) NOT NULL DEFAULT '' COMMENT '配用矫形器名称',
  PRIMARY KEY (`orthosis_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='辅助器具配用矫形器字典表';

-- ----------------------------
