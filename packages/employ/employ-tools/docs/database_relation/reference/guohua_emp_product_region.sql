-- Table structure for guohua_emp_product_region
-- ----------------------------
DROP TABLE IF EXISTS `guohua_emp_product_region`;
CREATE TABLE `guohua_emp_product_region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID guohua_emp_product.product_id',
  `region_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '地区用途：1客户区域 2产品交付所在地区',
  `province_code` varchar(6) NOT NULL DEFAULT '' COMMENT '省 国标行政区划码 base_dict_region.std_code（如 110000）',
  `province_name` varchar(60) NOT NULL DEFAULT '' COMMENT '省名称快照',
  `city_code` varchar(6) NOT NULL DEFAULT '' COMMENT '市 国标行政区划码 base_dict_region.std_code，空串=全省',
  `city_name` varchar(60) NOT NULL DEFAULT '' COMMENT '市名称快照',
  `district_code` varchar(6) NOT NULL DEFAULT '' COMMENT '区县 国标行政区划码 base_dict_region.std_code，空串=全市通用',
  `district_name` varchar(60) NOT NULL DEFAULT '' COMMENT '区县名称快照',
  `apply_scope` varchar(255) NOT NULL DEFAULT '' COMMENT '适用范围补充说明（如：全市通用（除西青区）、仅限长宁、杨浦、城六区、远郊区县）',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：0未删除 1已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_emp_product_region_pid` (`product_id`,`region_type`),
  KEY `idx_emp_product_region_code` (`province_code`,`city_code`,`district_code`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COMMENT='就业标准化产品地区表（客户区域/交付地区）';

-- ----------------------------
