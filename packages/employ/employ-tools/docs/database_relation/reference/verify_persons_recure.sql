-- Table structure for verify_persons_recure
-- ----------------------------
DROP TABLE IF EXISTS `verify_persons_recure`;
CREATE TABLE `verify_persons_recure` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '成员id',
  `persons_name` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `id_number` varchar(64) NOT NULL DEFAULT '' COMMENT '身份证号',
  `disabled_no` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾证号',
  `status` varchar(64) NOT NULL DEFAULT '' COMMENT '状态',
  `phone` varchar(64) NOT NULL DEFAULT '' COMMENT '电话',
  `get_in_date` varchar(64) NOT NULL DEFAULT '' COMMENT '系统录入日期',
  `project_name` varchar(64) NOT NULL DEFAULT '' COMMENT '项目',
  `birthday` varchar(32) NOT NULL DEFAULT '' COMMENT '生日',
  `gender` varchar(64) NOT NULL DEFAULT '' COMMENT '性别',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '户口所在地',
  `guardian` varchar(30) NOT NULL DEFAULT '' COMMENT '家属联系人姓名',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_verify` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否验证 1是 0否',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `nation` varchar(255) DEFAULT '' COMMENT '民族',
  `contact_relatives` varchar(255) DEFAULT NULL COMMENT '联系人关系',
  `contact_phone` varchar(255) DEFAULT NULL COMMENT '联系人电话',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_is_delete_` (`is_delete`) USING BTREE,
  KEY `index_id_number` (`id_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9127 DEFAULT CHARSET=utf8mb4 COMMENT='残联康复系统验证人员';

-- ----------------------------
