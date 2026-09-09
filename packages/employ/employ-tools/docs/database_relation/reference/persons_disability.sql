-- Table structure for persons_disability
-- ----------------------------
DROP TABLE IF EXISTS `persons_disability`;
CREATE TABLE `persons_disability` (
  `disability_id` varchar(64) NOT NULL COMMENT '残疾状态id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人id',
  `disabled_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '残疾类别',
  `disabled_level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '残疾等级',
  `disability_reason_id` varchar(11) NOT NULL DEFAULT '' COMMENT '致残原因',
  `disability_reason_other` varchar(255) NOT NULL DEFAULT '' COMMENT '致残原因其他',
  `disability_date` varchar(255) NOT NULL DEFAULT '' COMMENT '致残时间',
  `continued_time_id` varchar(11) NOT NULL DEFAULT '' COMMENT '持续时间id',
  `other_disabled_type_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '伴随其他残疾',
  `hospital_diagnosis_id` varchar(11) NOT NULL DEFAULT '' COMMENT '医院诊断',
  `present_situation` varchar(255) NOT NULL DEFAULT '' COMMENT '现状',
  `diagnostic_mechanism` varchar(255) NOT NULL DEFAULT '' COMMENT '诊断机构',
  `limb_parts_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '致残肢体部位ids',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`disability_id`) USING BTREE,
  UNIQUE KEY `disability_persons_id` (`persons_id`) USING BTREE COMMENT '健康情况成员唯一id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='残疾状况表';

-- ----------------------------
