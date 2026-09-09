-- Table structure for persons_assist_utensil
-- ----------------------------
DROP TABLE IF EXISTS `persons_assist_utensil`;
CREATE TABLE `persons_assist_utensil` (
  `assist_utensil_id` varchar(64) NOT NULL COMMENT '辅助器具id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人id',
  `prosthesis_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '安装假肢ids',
  `orthosis_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '配用矫形器ids',
  `use_appliances_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '使用器具ids',
  `use_appliances_other` varchar(255) NOT NULL DEFAULT '' COMMENT '使用器具其他',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`assist_utensil_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='残疾人辅助器具表';

-- ----------------------------
