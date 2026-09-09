-- Table structure for threading
-- ----------------------------
DROP TABLE IF EXISTS `threading`;
CREATE TABLE `threading` (
  `thread_id` varchar(64) NOT NULL DEFAULT '' COMMENT '线程id',
  `light_weight` varchar(255) NOT NULL DEFAULT '' COMMENT '轻重残',
  `base_list` text NOT NULL COMMENT '基地列表',
  `customer_list` text NOT NULL COMMENT '公司列表',
  `work_num` varchar(11) NOT NULL DEFAULT '' COMMENT '在职人数',
  `customer_num` varchar(255) NOT NULL DEFAULT '' COMMENT '就职企业数',
  `disabled_pie` text NOT NULL COMMENT '残疾类别列表',
  `gender_list` varchar(255) NOT NULL DEFAULT '' COMMENT '性别人数',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`thread_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基地线程id统计表';

-- ----------------------------
