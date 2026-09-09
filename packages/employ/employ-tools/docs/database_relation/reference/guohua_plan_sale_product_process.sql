-- Table structure for guohua_plan_sale_product_process
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_sale_product_process`;
CREATE TABLE `guohua_plan_sale_product_process` (
  `product_process_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '劳动产品进展id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `month` varchar(32) DEFAULT NULL COMMENT '月份2025-01',
  `area_id` varchar(32) DEFAULT NULL COMMENT '区域id',
  `product_type_id` int(11) DEFAULT NULL COMMENT '产品类别id',
  `product_name` varchar(64) DEFAULT '' COMMENT '产品类别',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  `product_sale_amount` decimal(11,2) DEFAULT NULL COMMENT '累计销售金额',
  `product_sale_num` int(11) DEFAULT 0 COMMENT '累计销售数量',
  `customer_num` int(11) DEFAULT 0 COMMENT '客户数',
  `cooperate_customer_num` int(11) DEFAULT 0 COMMENT '合作客户数',
  `store_num` int(11) DEFAULT 0 COMMENT '基地数',
  `persons_num` int(11) DEFAULT 0 COMMENT '残疾人数量',
  `disable_amount` decimal(10,2) DEFAULT 0.00 COMMENT '残疾人增收',
  `project_profit` decimal(10,2) DEFAULT 0.00 COMMENT '项目毛利',
  `delivery_num` int(11) DEFAULT 0 COMMENT '交付数量',
  `create_num` int(11) DEFAULT 0 COMMENT '制作中数量',
  `wait_num` int(11) DEFAULT 0 COMMENT '待分配数量',
  PRIMARY KEY (`product_process_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COMMENT='劳动产品进展表';

-- ----------------------------
