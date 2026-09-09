-- Table structure for guohua_rel_persons_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_persons_files`;
CREATE TABLE `guohua_rel_persons_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persons_id` varchar(255) NOT NULL DEFAULT '' COMMENT '人员ID',
  `file_type` varchar(64) NOT NULL COMMENT '文件类型 1身份证正面 2户口本首页 3残疾证正面 4银行卡正面 5体检报告 6电子照片 10身份证背面 11户口本本人页 12户口本变更页 13残疾证背面 14银行卡背面 15身份证扫描件 16户口本扫描件 17残疾证扫描件 18银行卡扫描件 19电子照片 20 无犯罪证明 21入职套表  22其他 23 离职信',
  `file_url` varchar(500) NOT NULL DEFAULT '' COMMENT '保存路径',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  `small_match_id` int(11) NOT NULL DEFAULT 0 COMMENT '小程序岗位匹配ID',
  `file_source` varchar(32) NOT NULL DEFAULT '1' COMMENT '就业资料 1',
  `file_source_type` varchar(64) NOT NULL DEFAULT '1' COMMENT '资料来源类型 1:电子件(拍照) 2:扫描件(上传)',
  `audit_status` varchar(64) NOT NULL DEFAULT '1' COMMENT '审核状态 1:待审核 2:审核通过 3:审核异常',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `_index_persons_id` (`persons_id`) USING BTREE,
  KEY `_index_match_id` (`small_match_id`) USING BTREE,
  KEY `idx_files_is_delete` (`is_delete`),
  KEY `idx_files_persons_delete` (`persons_id`,`is_delete`),
  KEY `idx_files_match_delete` (`small_match_id`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=123943 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-人员资料附件表';

-- ----------------------------
