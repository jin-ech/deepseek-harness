-- Table structure for rel_ens_activity_persons_cert
-- ----------------------------
DROP TABLE IF EXISTS `rel_ens_activity_persons_cert`;
CREATE TABLE `rel_ens_activity_persons_cert` (
  `cert_id` varchar(64) NOT NULL COMMENT '证书id',
  `persons_id` varchar(64) DEFAULT NULL COMMENT '用户id',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1是 0否',
  PRIMARY KEY (`cert_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='助益行用户活动证书表';

-- ----------------------------
