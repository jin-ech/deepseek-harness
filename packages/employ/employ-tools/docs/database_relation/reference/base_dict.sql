-- Table structure for base_dict
-- ----------------------------
DROP TABLE IF EXISTS `base_dict`;
CREATE TABLE `base_dict` (
  `base_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '基地id',
  `base_name` varchar(255) NOT NULL DEFAULT '' COMMENT '基地名称',
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示(1:显示,2:不显示)',
  PRIMARY KEY (`base_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8mb4 COMMENT='基地字典表';

-- ----------------------------
