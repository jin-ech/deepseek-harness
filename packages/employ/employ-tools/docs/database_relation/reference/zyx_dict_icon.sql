-- Table structure for zyx_dict_icon
-- ----------------------------
DROP TABLE IF EXISTS `zyx_dict_icon`;
CREATE TABLE `zyx_dict_icon` (
  `icon_id` int(11) NOT NULL AUTO_INCREMENT,
  `icon_url` varchar(255) DEFAULT '',
  `icon_name` varchar(255) DEFAULT '',
  PRIMARY KEY (`icon_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='基地导览-icon表';

-- ----------------------------
