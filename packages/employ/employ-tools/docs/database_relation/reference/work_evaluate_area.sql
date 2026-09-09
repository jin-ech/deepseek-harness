-- Table structure for work_evaluate_area
-- ----------------------------
DROP TABLE IF EXISTS `work_evaluate_area`;
CREATE TABLE `work_evaluate_area` (
  `id` varchar(64) NOT NULL COMMENT '主键（UUID）',
  `province` varchar(64) DEFAULT NULL COMMENT '省',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `district` varchar(64) DEFAULT NULL COMMENT '区/县',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未删除 1已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_area` (`province`,`city`,`district`),
  KEY `idx_is_delete` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='区县二维码表';

-- ----------------------------
