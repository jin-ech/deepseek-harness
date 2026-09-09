-- Table structure for guohua_rel_persons_work_contract_info
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_persons_work_contract_info`;
CREATE TABLE `guohua_rel_persons_work_contract_info` (
  `contract_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '合同信息id',
  `work_id` int(11) DEFAULT NULL COMMENT '就职信息id',
  `contract_type` tinyint(4) DEFAULT NULL COMMENT '人员合同状态 1:已邮寄 2:已回收',
  `express_id` int(11) DEFAULT NULL COMMENT '快递id',
  `express_sn` varchar(255) DEFAULT NULL COMMENT '快递单号',
  `add_userid` varchar(64) DEFAULT NULL COMMENT '添加人',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`contract_info_id`) USING BTREE,
  KEY `idx_contract_workid_del` (`work_id`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=8835 DEFAULT CHARSET=utf8mb4 COMMENT='客户在职人员合同接收记录表';

-- ----------------------------
