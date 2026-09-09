-- Table structure for guohua_rel_demand_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_demand_files`;
CREATE TABLE `guohua_rel_demand_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `demand_id` int(11) DEFAULT NULL COMMENT '需求id',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_url` text DEFAULT NULL COMMENT '保存路径',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `file_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '文件类型 1普通附件 2服务确认清单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6778 DEFAULT CHARSET=utf8mb4 COMMENT='需求人员合同附件表';

-- ----------------------------
