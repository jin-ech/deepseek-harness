-- Table structure for base_dict_special_event_type_load
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_special_event_type_load`;
CREATE TABLE `base_dict_special_event_type_load` (
  `special_event_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部事件类型id',
  `special_event_type` varchar(64) NOT NULL DEFAULT '' COMMENT '事件类型1:医疗报销 2:生育津贴 3:死亡清算 4:社保一次性清算 5:遗属待遇申领',
  `role_type` varchar(64) NOT NULL COMMENT '角色类型 1-3:数据中台 1-2:业务员',
  `is_month` varchar(64) NOT NULL DEFAULT '2' COMMENT '是否包含月份 1:是 2:否',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  `sort` smallint(6) NOT NULL DEFAULT 999 COMMENT '排序',
  `level` tinyint(4) DEFAULT 1 COMMENT '事件层级',
  `parent_id` tinyint(4) DEFAULT 0 COMMENT '上级id',
  PRIMARY KEY (`special_event_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-事件类型字典表';

-- ----------------------------
