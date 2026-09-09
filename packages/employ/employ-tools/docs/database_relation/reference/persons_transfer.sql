-- Table structure for persons_transfer
-- ----------------------------
DROP TABLE IF EXISTS `persons_transfer`;
CREATE TABLE `persons_transfer` (
  `transfer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '转签id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '成员id',
  `transfer_date` varchar(64) NOT NULL DEFAULT '' COMMENT '转签年份（转入后的年份）',
  `transfer_add` varchar(64) NOT NULL DEFAULT '' COMMENT '转签/新增',
  `start_date` varchar(64) NOT NULL DEFAULT '' COMMENT '劳动合同生效时间',
  `end_date` varchar(64) NOT NULL DEFAULT '' COMMENT '劳动合同结束时间',
  `actual_end_date` varchar(64) NOT NULL DEFAULT '' COMMENT '实际结束时间',
  `customer_name` varchar(255) NOT NULL DEFAULT '' COMMENT '所属客户',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  `bank_number` varchar(64) NOT NULL DEFAULT '' COMMENT '银行卡信息',
  PRIMARY KEY (`transfer_id`) USING BTREE,
  KEY `work_persons_id` (`transfer_date`) USING BTREE COMMENT '工作经历成员索引'
) ENGINE=InnoDB AUTO_INCREMENT=19700 DEFAULT CHARSET=utf8mb4 COMMENT='残疾人转签记录表';

-- ----------------------------
