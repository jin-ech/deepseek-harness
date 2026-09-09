-- Table structure for guohua_ens_activity_company_sign
-- ----------------------------
DROP TABLE IF EXISTS `guohua_ens_activity_company_sign`;
CREATE TABLE `guohua_ens_activity_company_sign` (
  `activity_company_sign_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动报名id',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
  `customer_id` int(11) DEFAULT NULL COMMENT '企业id',
  `sign_num` int(11) DEFAULT NULL COMMENT '报名人数',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `sign_up` varchar(64) DEFAULT NULL COMMENT '报名时间',
  `sign_in` varchar(64) DEFAULT NULL COMMENT '签到时间',
  `sign_lat` varchar(255) DEFAULT NULL COMMENT '签到纬度',
  `sign_lng` varchar(255) DEFAULT NULL COMMENT '签到精度',
  `sign_out` varchar(64) DEFAULT NULL COMMENT '签退时间',
  `sign_remarks` varchar(255) DEFAULT NULL COMMENT '签到备注',
  `sign_up_type` tinyint(4) DEFAULT 1 COMMENT '报名方式 1小程序报名 2后台报名',
  `sign_in_type` tinyint(4) DEFAULT NULL COMMENT '签到方式 1小程序签到 2后台签到',
  PRIMARY KEY (`activity_company_sign_id`) USING BTREE,
  KEY `index_ activity_id` (`activity_id`) USING BTREE,
  KEY `sign_persons_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COMMENT='助益行活动报名表';

-- ----------------------------
