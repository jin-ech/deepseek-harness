-- Table structure for guohua_rel_contract_sign_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_contract_sign_files`;
CREATE TABLE `guohua_rel_contract_sign_files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL DEFAULT 0 COMMENT '合同ID',
  `file_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '文件类型 1：图片 2：文件',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '保存路径',
  `media_id` varchar(255) NOT NULL DEFAULT '' COMMENT '企业微信素材保存路径',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3423 DEFAULT CHARSET=utf8mb4 COMMENT='合同盖章附件表';

-- ----------------------------
