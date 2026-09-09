-- Table structure for base_dict_service_line
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_service_line`;
CREATE TABLE `base_dict_service_line` (
  `service_line_id` int(11) NOT NULL,
  `service_line` varchar(255) NOT NULL DEFAULT '' COMMENT '业务线名称',
  PRIMARY KEY (`service_line_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='业务线字典';

-- ----------------------------
