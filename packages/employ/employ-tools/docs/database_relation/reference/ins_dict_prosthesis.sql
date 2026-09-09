-- Table structure for ins_dict_prosthesis
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_prosthesis`;
CREATE TABLE `ins_dict_prosthesis` (
  `prosthesis_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '安装假肢id',
  `prosthesis_name` varchar(255) NOT NULL DEFAULT '' COMMENT '安装假肢名称',
  PRIMARY KEY (`prosthesis_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='辅助器具安装假肢字典表';

-- ----------------------------
