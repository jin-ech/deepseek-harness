-- Table structure for ins_dict_use_appliances
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_use_appliances`;
CREATE TABLE `ins_dict_use_appliances` (
  `use_appliances_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '使用器具id',
  `use_appliances_name` varchar(255) NOT NULL DEFAULT '' COMMENT '使用器具名称',
  PRIMARY KEY (`use_appliances_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='辅助器具使用器具字典表';

-- ----------------------------
