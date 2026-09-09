-- Table structure for verify_persons_disable
-- ----------------------------
DROP TABLE IF EXISTS `verify_persons_disable`;
CREATE TABLE `verify_persons_disable` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '成员id',
  `persons_name` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `id_number` varchar(64) NOT NULL DEFAULT '' COMMENT '身份证号',
  `disabled_no` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾证号',
  `disabled_type` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾类别',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `is_verify` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否验证 1是 0未开始  2验证失败  3验证成功有多条  4中残联验证通过  5失败',
  `start_date` varchar(32) NOT NULL DEFAULT '' COMMENT '残疾证开始日期',
  `end_date` varchar(32) NOT NULL DEFAULT '' COMMENT '残疾证结束日期',
  `disabled_no_old` varchar(64) NOT NULL DEFAULT '' COMMENT '旧残疾证号',
  `start_date_old` varchar(64) NOT NULL DEFAULT '' COMMENT '旧残疾证开始日期',
  `end_date_old` varchar(32) NOT NULL DEFAULT '' COMMENT '旧残疾证结束日期',
  `disabled_type_old` varchar(64) NOT NULL DEFAULT '' COMMENT '旧残疾类别',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `remarks` varchar(64) NOT NULL DEFAULT '' COMMENT '备注',
  `month` varchar(64) NOT NULL DEFAULT '' COMMENT '年月',
  `verify_type` varchar(64) NOT NULL DEFAULT '' COMMENT '1社保一轮查询通过  2二次验证  3中残联',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_is_delete_` (`is_delete`) USING BTREE,
  KEY `index_id_number` (`id_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17199 DEFAULT CHARSET=utf8mb4 COMMENT='残联系统验证残疾人';

-- ----------------------------
