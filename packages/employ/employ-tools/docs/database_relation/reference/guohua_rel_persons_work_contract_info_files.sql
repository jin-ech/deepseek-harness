-- Table structure for guohua_rel_persons_work_contract_info_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_persons_work_contract_info_files`;
CREATE TABLE `guohua_rel_persons_work_contract_info_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件id',
  `contract_info_id` int(11) DEFAULT NULL COMMENT '合同信息id',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_url` text DEFAULT NULL COMMENT '保存路径',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_contractfile_contractid` (`contract_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8787 DEFAULT CHARSET=utf8mb4 COMMENT='客户在职人员合同信息附件表';

-- ----------------------------
