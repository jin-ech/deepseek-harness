-- Table structure for guohua_rel_contract_sign_files_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_contract_sign_files_record`;
CREATE TABLE `guohua_rel_contract_sign_files_record` (
  `sing_file_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '合同转交记录id',
  `contract_id` int(11) NOT NULL DEFAULT 0 COMMENT '合同ID',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '添加人',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
  `sign_file_status` varchar(64) NOT NULL DEFAULT '' COMMENT '0 未转叫 1已转交 2已收到',
  `sign_file_remarks` varchar(255) DEFAULT NULL COMMENT '合同转交备注',
  PRIMARY KEY (`sing_file_record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=800 DEFAULT CHARSET=utf8mb4 COMMENT='合同盖章附件表';

-- ----------------------------
