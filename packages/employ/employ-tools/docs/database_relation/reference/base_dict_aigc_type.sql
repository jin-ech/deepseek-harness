-- Table structure for base_dict_aigc_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_aigc_type`;
CREATE TABLE `base_dict_aigc_type` (
  `aigc_type_id` varchar(64) NOT NULL COMMENT 'aigc模型类型id',
  `aigc_type_name` varchar(255) DEFAULT NULL COMMENT 'aigc模型名称',
  `api_key` varchar(255) DEFAULT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aigc_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Aigc类型字典';

-- ----------------------------
