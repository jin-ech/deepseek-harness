-- Table structure for guohua_rel_persons_declare_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_persons_declare_files`;
CREATE TABLE `guohua_rel_persons_declare_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persons_id` varchar(255) NOT NULL DEFAULT '' COMMENT '人员ID',
  `customer_id` varchar(64) NOT NULL DEFAULT '' COMMENT '客户ID',
  `start_date` varchar(255) NOT NULL DEFAULT '' COMMENT '申报周期开始',
  `end_date` varchar(255) NOT NULL COMMENT '申报周期结束',
  `file_type` varchar(64) NOT NULL DEFAULT '' COMMENT '文件类型 7:医保 8:社保（五险） 9:收入证明',
  `file_url` varchar(500) NOT NULL DEFAULT '' COMMENT '保存路径',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `audit_status` varchar(64) NOT NULL DEFAULT '1' COMMENT '审核状态 1:待审核 2:审核通过 3:审核异常',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 2:已删除',
  `file_source` varchar(32) NOT NULL DEFAULT '2' COMMENT '申报资料2',
  `file_source_type` varchar(64) NOT NULL DEFAULT '1' COMMENT '资料来源类型 1:电子件(拍照) 2:扫描件(上传)',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=630 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-人员申报资料表';

-- ----------------------------
