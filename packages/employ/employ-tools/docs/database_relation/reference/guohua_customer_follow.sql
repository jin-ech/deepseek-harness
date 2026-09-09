-- Table structure for guohua_customer_follow
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_follow`;
CREATE TABLE `guohua_customer_follow` (
  `follow_id` varchar(255) NOT NULL DEFAULT '' COMMENT '跟进记录id',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户id',
  `opportunity_id` varchar(64) DEFAULT NULL COMMENT '商机id',
  `follow_content` text NOT NULL COMMENT '跟进记录内容',
  `follow_type` tinyint(4) DEFAULT NULL COMMENT '跟进类型 1电话 2微信 3拜访 4邮件 5其他',
  `follow_time` varchar(255) DEFAULT NULL COMMENT '跟进时间',
  `next_follow_time` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `next_follow_plan` varchar(255) DEFAULT NULL COMMENT '下次跟进计划',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '创建人',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '修改时间',
  `update_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '修改人',
  `system_id` varchar(64) DEFAULT NULL COMMENT '系统id',
  `sessionId` varchar(64) DEFAULT NULL COMMENT '外呼唯一标识',
  `visit_id` varchar(64) DEFAULT NULL COMMENT '外出登记id',
  `contact_id` int(11) DEFAULT NULL COMMENT '客户联系人id',
  PRIMARY KEY (`follow_id`) USING BTREE,
  KEY `idx_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户信息跟进表';

-- ----------------------------
