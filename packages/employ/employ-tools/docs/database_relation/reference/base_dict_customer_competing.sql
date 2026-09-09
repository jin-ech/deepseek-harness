-- Table structure for base_dict_customer_competing
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_customer_competing`;
CREATE TABLE `base_dict_customer_competing` (
  `competing_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '竞品id',
  `competing_name` varchar(255) NOT NULL DEFAULT '' COMMENT '竞品名称',
  `sort` tinyint(4) NOT NULL DEFAULT 1 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1显示 0不显示',
  PRIMARY KEY (`competing_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='客户竞品字典表';

-- ----------------------------
