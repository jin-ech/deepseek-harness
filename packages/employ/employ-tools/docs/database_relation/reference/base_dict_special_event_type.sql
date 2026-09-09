-- Table structure for base_dict_special_event_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_special_event_type`;
CREATE TABLE `base_dict_special_event_type` (
  `special_event_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部事件类型id',
  `special_event_type` varchar(64) DEFAULT '' COMMENT '事件类型1:医疗报销 2:生育津贴 3:死亡清算 4:社保一次性清算 5:遗属待遇申领',
  `role_type` varchar(64) DEFAULT NULL COMMENT '角色类型 1-3:数据中台 1-2:业务员',
  `is_month` varchar(64) DEFAULT '2' COMMENT '是否包含月份 1:是 2:否',
  `is_show` tinyint(4) DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  `sort` smallint(6) DEFAULT 999 COMMENT '排序',
  `level` tinyint(4) DEFAULT 1 COMMENT '事件层级',
  `parent_id` int(11) DEFAULT 0 COMMENT '上级id',
  `is_allows` varchar(64) DEFAULT '2' COMMENT '1 负责人是否允许多选  2否',
  `required_materials` text DEFAULT NULL COMMENT '所需材料/办理说明',
  `process_duration` varchar(32) DEFAULT NULL COMMENT '办理时限',
  `template_attachments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '模板附件列表 [{"name":"附件名","url":"附件地址"}]',
  `is_once` tinyint(4) DEFAULT 2 COMMENT '是否一次性完成 1是 2否',
  PRIMARY KEY (`special_event_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-事件类型字典表';

-- ----------------------------
