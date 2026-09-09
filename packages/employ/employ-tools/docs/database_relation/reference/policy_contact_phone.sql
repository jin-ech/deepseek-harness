-- Table structure for policy_contact_phone
-- ----------------------------
DROP TABLE IF EXISTS `policy_contact_phone`;
CREATE TABLE `policy_contact_phone` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '联系方式id',
  `policy_id` varchar(32) NOT NULL DEFAULT '' COMMENT '政策id',
  `disabled_phone` varchar(64) NOT NULL DEFAULT '' COMMENT '联系电话',
  `contact` varchar(64) NOT NULL DEFAULT '' COMMENT '联系人/单位或个人',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 未删除 2已删除',
  PRIMARY KEY (`contact_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COMMENT='政策联系人信息记录表';

-- ----------------------------
