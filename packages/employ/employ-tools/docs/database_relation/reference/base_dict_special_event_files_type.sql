-- Table structure for base_dict_special_event_files_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_special_event_files_type`;
CREATE TABLE `base_dict_special_event_files_type` (
  `special_event_type_files_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型附件ID',
  `special_event_type` varchar(64) DEFAULT '' COMMENT '事件类型1:医疗报销 2:生育津贴 3:死亡清算 4:社保一次性清算 5:遗属待遇申领',
  `special_event_type_files_name` varchar(255) NOT NULL DEFAULT '' COMMENT '事件附件名称',
  `type_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `sort` smallint(6) NOT NULL DEFAULT 9999 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  PRIMARY KEY (`special_event_type_files_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-事件附件类型字典表';

-- ----------------------------
