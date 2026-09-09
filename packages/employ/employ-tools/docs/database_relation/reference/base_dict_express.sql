-- Table structure for base_dict_express
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_express`;
CREATE TABLE `base_dict_express` (
  `express_id` int(11) NOT NULL AUTO_INCREMENT,
  `express_name` varchar(255) NOT NULL DEFAULT '',
  `delivery_id` varchar(10) NOT NULL DEFAULT '' COMMENT '快递公司 ID',
  `sort` int(11) DEFAULT 999 COMMENT '排序',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1否 0是',
  PRIMARY KEY (`express_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='物流公司字典表';

-- ----------------------------
