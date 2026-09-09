-- Table structure for customer_ip
-- ----------------------------
DROP TABLE IF EXISTS `customer_ip`;
CREATE TABLE `customer_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ip` varchar(64) NOT NULL DEFAULT '' COMMENT 'ip',
  `add_time` date NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COMMENT='官网提交表单限制IP表';

-- ----------------------------
