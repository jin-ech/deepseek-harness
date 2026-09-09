-- Table structure for guohua_rel_bill_cancel_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_bill_cancel_files`;
CREATE TABLE `guohua_rel_bill_cancel_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cancel_id` int(11) DEFAULT NULL COMMENT '作废id',
  `file_url` varchar(255) DEFAULT NULL COMMENT '保存路径',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `media_id` varchar(255) DEFAULT NULL COMMENT '素材id',
  `add_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=utf8mb4 COMMENT='财务管理系统开票作废关联附件表';

-- ----------------------------
