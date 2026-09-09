-- Table structure for base_dict_special_event_type_tips
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_special_event_type_tips`;
CREATE TABLE `base_dict_special_event_type_tips` (
  `special_event_type_tips_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型提示ID',
  `special_event_type` varchar(64) DEFAULT '' COMMENT '事件类型1:医疗报销 2:生育津贴 3:死亡清算 4:社保一次性清算 5:遗属待遇申领',
  `type_tips` text NOT NULL COMMENT '提示信息',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  PRIMARY KEY (`special_event_type_tips_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-事件类型提示字典表';

-- ----------------------------
