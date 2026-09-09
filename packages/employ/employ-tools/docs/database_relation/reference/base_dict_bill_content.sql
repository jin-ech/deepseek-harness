-- Table structure for base_dict_bill_content
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_bill_content`;
CREATE TABLE `base_dict_bill_content` (
  `bill_content_id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_content` varchar(255) NOT NULL DEFAULT '' COMMENT '开票内容',
  `bill_tax_rate` int(11) DEFAULT NULL COMMENT '税率',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否可用：0-不可用；1-可用',
  `sort` int(11) DEFAULT 999 COMMENT '排序',
  PRIMARY KEY (`bill_content_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COMMENT='开票商品编码表';

-- ----------------------------
