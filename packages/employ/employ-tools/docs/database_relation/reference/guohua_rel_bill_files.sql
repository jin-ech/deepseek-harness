-- Table structure for guohua_rel_bill_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_bill_files`;
CREATE TABLE `guohua_rel_bill_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL DEFAULT 0 COMMENT '付款申请id',
  `file_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '文件类型 1：工资附件  2：合同附件  3：账单附件  4：其他附件 5：原发票附件',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '保存路径',
  `media_id` varchar(255) NOT NULL DEFAULT '' COMMENT '企业微信素材保存路径',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13667 DEFAULT CHARSET=utf8mb4 COMMENT='账单开票关联附件表';

-- ----------------------------
