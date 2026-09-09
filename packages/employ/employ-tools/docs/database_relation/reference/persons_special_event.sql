-- Table structure for persons_special_event
-- ----------------------------
DROP TABLE IF EXISTS `persons_special_event`;
CREATE TABLE `persons_special_event` (
  `special_event_id` varchar(64) NOT NULL DEFAULT '' COMMENT '特殊事件ID',
  `special_event_type` varchar(64) NOT NULL DEFAULT '0' COMMENT '事件类型1:医疗报销 2:生育津贴 3:死亡清算 4:社保一次性清算 5:遗属待遇申领',
  `special_event_status` varchar(64) NOT NULL DEFAULT '1' COMMENT '事件状态 1:业务员待审核 2:审核通过(审核流程结束) 3:审核拒绝 4:中台待审核  5 事件完成',
  `persons_id` varchar(255) NOT NULL DEFAULT '' COMMENT '用户ID',
  `remarks` text NOT NULL COMMENT '备注事由',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `is_push` varchar(64) NOT NULL DEFAULT '1' COMMENT '1 已发布 0未发布',
  PRIMARY KEY (`special_event_id`) USING BTREE,
  KEY `img_ acitvity_id` (`special_event_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='人员特殊事件上报信息表';

-- ----------------------------
