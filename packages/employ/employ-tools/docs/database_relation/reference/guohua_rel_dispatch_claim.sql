-- Table structure for guohua_rel_dispatch_claim
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_dispatch_claim`;
CREATE TABLE `guohua_rel_dispatch_claim` (
  `claim_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '确认id',
  `dispatch_wages_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '工资发放id',
  `userid` varchar(64) NOT NULL DEFAULT '' COMMENT '人员id',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '出纳id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 2:已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加日期',
  `status` varchar(64) NOT NULL COMMENT '确认状态',
  PRIMARY KEY (`claim_id`) USING BTREE,
  UNIQUE KEY `uk_dispatch_wages_id` (`dispatch_wages_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9676 DEFAULT CHARSET=utf8mb4 COMMENT='财务管理系统工资发放确认表';

-- ----------------------------
