-- Table structure for persons_guardian
-- ----------------------------
DROP TABLE IF EXISTS `persons_guardian`;
CREATE TABLE `persons_guardian` (
  `guardian_id` varchar(64) NOT NULL COMMENT '监护人id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人id',
  `guardian_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '类型 1：主要监护人，2：主要联络人',
  `guardian_name` varchar(32) NOT NULL DEFAULT '' COMMENT '监护人姓名',
  `relation` varchar(32) NOT NULL DEFAULT '' COMMENT '与残疾人关系',
  `guardian_address` varchar(255) NOT NULL DEFAULT '' COMMENT '监护人住址',
  `guardian_phone` varchar(64) NOT NULL DEFAULT '' COMMENT '监护人电话',
  `guardian_email` varchar(100) NOT NULL DEFAULT '' COMMENT '监护人邮箱',
  `guardian_card` varchar(32) NOT NULL DEFAULT '' COMMENT '联系人身份证号',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`guardian_id`) USING BTREE,
  KEY `index_persons_id` (`persons_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='残疾人监护人表';

-- ----------------------------
