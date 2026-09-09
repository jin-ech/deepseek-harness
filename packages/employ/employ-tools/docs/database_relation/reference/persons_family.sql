-- Table structure for persons_family
-- ----------------------------
DROP TABLE IF EXISTS `persons_family`;
CREATE TABLE `persons_family` (
  `family_id` varchar(64) NOT NULL COMMENT '家庭成员id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人id',
  `appellation` varchar(255) NOT NULL DEFAULT '' COMMENT '称谓',
  `family_name` varchar(255) NOT NULL DEFAULT '' COMMENT '成员姓名',
  `birthday` varchar(32) NOT NULL DEFAULT '' COMMENT '出生年月',
  `education_id` varchar(11) NOT NULL DEFAULT '' COMMENT '教育程度',
  `occupation` varchar(255) NOT NULL DEFAULT '' COMMENT '职业',
  `work_place` varchar(255) NOT NULL DEFAULT '' COMMENT '工作或学习单位',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`family_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='残疾人家庭成员表';

-- ----------------------------
