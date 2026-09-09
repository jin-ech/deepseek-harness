-- Table structure for base_dict_expend_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_expend_type`;
CREATE TABLE `base_dict_expend_type` (
  `expend_type_id` int(11) NOT NULL,
  `expend_type_name` varchar(255) NOT NULL,
  `short_words` varchar(255) NOT NULL,
  PRIMARY KEY (`expend_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='费用支出类型字典表';

-- ----------------------------
