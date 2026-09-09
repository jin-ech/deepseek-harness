-- Table structure for guohua_store_product
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_product`;
CREATE TABLE `guohua_store_product` (
  `store_product_id` varchar(64) NOT NULL COMMENT '基地劳动产品id',
  `product_type_id` int(11) DEFAULT 1 COMMENT '产品类型 1:残疾人手工艺品',
  `brand_name` varchar(255) DEFAULT NULL COMMENT '品牌名称',
  `product_name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `store_id` int(11) DEFAULT NULL COMMENT '关联基地id',
  `product_unit` varchar(255) DEFAULT NULL COMMENT '计量单位',
  `product_specs` varchar(255) DEFAULT NULL COMMENT '产品规格',
  `material_quality` varchar(255) DEFAULT NULL COMMENT '商品材质',
  `product_price` decimal(10,2) DEFAULT 0.00 COMMENT '产品售价 单位元',
  `production_cycle` varchar(255) DEFAULT NULL COMMENT '生产周期',
  `tax_rate` float(3,2) DEFAULT 0.00 COMMENT '税率',
  `is_invoice` tinyint(4) DEFAULT 0 COMMENT '是否可以开发票 1可以 0 不可以',
  `product_content` text DEFAULT NULL COMMENT '产品描述',
  `product_content_html` text DEFAULT NULL COMMENT '产品描述html',
  `img_url` varchar(255) DEFAULT NULL COMMENT '商品主题图',
  `status` tinyint(4) DEFAULT 2 COMMENT '商家状态 1上架 2下架',
  `is_top` tinyint(4) DEFAULT 2 COMMENT '是否置顶 1是 2否',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1：未删除 0 已删除',
  PRIMARY KEY (`store_product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基地劳动产品表';

-- ----------------------------
