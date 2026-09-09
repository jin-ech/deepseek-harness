-- Table structure for guohua_rel_contract_advance_approval
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_contract_advance_approval`;
CREATE TABLE `guohua_rel_contract_advance_approval` (
  `advance_id` int(11) NOT NULL AUTO_INCREMENT,
  `sp_no` varchar(255) NOT NULL DEFAULT '' COMMENT '审批编号',
  `sp_status` varchar(255) NOT NULL DEFAULT '0' COMMENT '审批状态',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `contract_id` int(11) DEFAULT NULL COMMENT '合同id',
  `contract_start_date` date DEFAULT NULL COMMENT '合同开始日期',
  `advance_remarks` varchar(1000) NOT NULL DEFAULT '' COMMENT '提前批办原因',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '添加人ID',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '启动日期',
  `update_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `light_num` int(11) DEFAULT 0 COMMENT '轻残人数',
  `weight_num` int(11) DEFAULT 0 COMMENT '重残人数',
  `light_price` decimal(10,2) DEFAULT NULL COMMENT '轻残报价',
  `weight_price` decimal(10,2) DEFAULT NULL COMMENT '重残报价',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  PRIMARY KEY (`advance_id`) USING BTREE,
  KEY `index_contract_id` (`advance_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=518 DEFAULT CHARSET=utf8mb4 COMMENT='合同提前批办';

-- ----------------------------
