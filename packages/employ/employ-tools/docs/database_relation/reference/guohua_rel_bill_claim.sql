-- Table structure for guohua_rel_bill_claim
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_bill_claim`;
CREATE TABLE `guohua_rel_bill_claim` (
  `claim_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '确认id',
  `bill_id` int(11) NOT NULL DEFAULT 0 COMMENT '开票id',
  `userid` varchar(64) NOT NULL DEFAULT '' COMMENT '人员id',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '出纳id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 2:已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加日期',
  `status` varchar(64) NOT NULL COMMENT '确认状态',
  PRIMARY KEY (`claim_id`) USING BTREE,
  KEY `_index_bill_id` (`bill_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16353 DEFAULT CHARSET=utf8mb4 COMMENT='财务管理系统开票确认表';

-- ----------------------------
