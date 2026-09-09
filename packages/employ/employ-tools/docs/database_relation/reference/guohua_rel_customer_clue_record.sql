-- Table structure for guohua_rel_customer_clue_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_clue_record`;
CREATE TABLE `guohua_rel_customer_clue_record` (
  `customer_clue_record` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售记录id',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户id',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '分配时间',
  `add_userid` varchar(255) DEFAULT '' COMMENT '添加人',
  `responsible_userid` varchar(255) DEFAULT '' COMMENT '负责人',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `customer_clue_status` varchar(255) DEFAULT '0' COMMENT '0创建线索 1变更负责人 2创建合同 3退回公海 4线索分配 5客户跟进  6创建商机 7修改商机状态',
  `content` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`customer_clue_record`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-客户线索记录';

-- ----------------------------
