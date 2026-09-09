-- Table structure for base_dict_wanda_persons_month
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_wanda_persons_month`;
CREATE TABLE `base_dict_wanda_persons_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `month` varchar(255) DEFAULT '' COMMENT '所属月份',
  `id_numbers` text DEFAULT NULL COMMENT '当月需要展示的人员',
  `is_show` tinyint(4) DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  `start_date` varchar(32) DEFAULT NULL COMMENT '图片可见范围',
  `end_date` varchar(32) DEFAULT NULL COMMENT '图片可见范围',
  `url` varchar(500) DEFAULT NULL COMMENT '万达zip附件',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_group_name` (`month`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COMMENT='万达区域';

-- ----------------------------
