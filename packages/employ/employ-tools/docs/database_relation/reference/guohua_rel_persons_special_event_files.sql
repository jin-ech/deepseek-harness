-- Table structure for guohua_rel_persons_special_event_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_persons_special_event_files`;
CREATE TABLE `guohua_rel_persons_special_event_files` (
  `special_event_files_id` varchar(64) NOT NULL COMMENT '事件图片ID',
  `persons_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '人员ID',
  `special_event_id` varchar(64) DEFAULT NULL COMMENT '事件ID',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名称',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '保存地址',
  `file_type` varchar(64) NOT NULL COMMENT '文件类型  special_event_type_files_id',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `audit_status` varchar(64) NOT NULL DEFAULT '1' COMMENT '审核状态 1:交付待审核 2:审核通过 3:审核异常 4:中台待审核',
  `is_show` tinyint(4) NOT NULL DEFAULT 0 COMMENT '中台是否可见  1可见  2不可见',
  PRIMARY KEY (`special_event_files_id`) USING BTREE,
  KEY `img_ acitvity_id` (`persons_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='人员特殊事件上报信息附件表';

-- ----------------------------
