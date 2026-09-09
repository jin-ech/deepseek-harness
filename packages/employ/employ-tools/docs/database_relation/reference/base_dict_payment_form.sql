-- Table structure for base_dict_payment_form
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_payment_form`;
CREATE TABLE `base_dict_payment_form` (
  `payment_form_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '付款形式id',
  `payment_form_name` varchar(255) NOT NULL DEFAULT '' COMMENT '付款形式',
  `sort` int(11) NOT NULL DEFAULT 999 COMMENT '排序',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1显示 0不显示',
  PRIMARY KEY (`payment_form_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='付款形式字典表';

-- ----------------------------
