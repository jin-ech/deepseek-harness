-- Table structure for guohua_rel_dispatch_wages_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_dispatch_wages_files`;
CREATE TABLE `guohua_rel_dispatch_wages_files` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `dispatch_wages_id` varchar(64) NOT NULL DEFAULT '' COMMENT '公司发放申请id',
  `file_type` varchar(64) NOT NULL DEFAULT '' COMMENT '文件类型 1:工资表 2:回款截图',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '保存路径',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `media_id` varchar(255) NOT NULL DEFAULT '' COMMENT '企业微信素材保存路径',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='OA-工资发放申请关联附件表';

-- ----------------------------
