-- Table structure for base_dict_payment_period
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_payment_period`;
CREATE TABLE `base_dict_payment_period` (
  `payment_period_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '补贴类型ID',
  `payment_period_name` varchar(255) NOT NULL DEFAULT '' COMMENT '付款周期名称',
  `sort` smallint(6) NOT NULL DEFAULT 9999 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  PRIMARY KEY (`payment_period_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-付款周期字典表';

-- ----------------------------
