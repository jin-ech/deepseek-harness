-- Table structure for guohua_standard_service_product
-- ----------------------------
DROP TABLE IF EXISTS `guohua_standard_service_product`;
CREATE TABLE `guohua_standard_service_product` (
  `standard_product_id` varchar(64) NOT NULL COMMENT '标准服务产品id',
  `sku` varchar(64) NOT NULL DEFAULT '' COMMENT '产品SKU编码',
  `product_name` varchar(255) NOT NULL DEFAULT '' COMMENT '产品名称',
  `product_img_url` varchar(500) DEFAULT '' COMMENT '产品图片',
  `product_specs` varchar(255) DEFAULT '' COMMENT '产品规格',
  `product_price` decimal(10,2) DEFAULT 0.00 COMMENT '单价(元)',
  `product_unit` varchar(64) DEFAULT '' COMMENT '计量单位 套/个/支/盒等',
  `participate_link` varchar(255) DEFAULT '' COMMENT '残疾人参与环节 如:制作、包装',
  `min_order_num` int(11) DEFAULT 0 COMMENT '起订量 0表示无起订量',
  `is_custom` tinyint(4) DEFAULT 0 COMMENT '是否可定制 1是 0否',
  `custom_condition` varchar(255) DEFAULT '' COMMENT '定制条件 如:年度订购100件以上可定制logo',
  `custom_method` varchar(255) DEFAULT '' COMMENT '定制方式 如:水晶贴定制logo',
  `purchase_standard` decimal(10,2) DEFAULT 0.00 COMMENT '采购标准(元/月/人)',
  `delivery_num` decimal(10,2) DEFAULT 0.00 COMMENT '交付数量(个/人/年)',
  `delivery_frequency` varchar(64) DEFAULT '' COMMENT '交付频率 如:一年一次',
  `support_store_ids` text DEFAULT NULL COMMENT '可承接基地store_id 0=全部基地 部分基地用逗号分隔 如:1,2,3',
  `sort` int(11) DEFAULT 0 COMMENT '排序号(对应清单序号)',
  `status` tinyint(4) DEFAULT 1 COMMENT '状态 1上架 2下架',
  `add_userid` varchar(64) DEFAULT '' COMMENT '添加人',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  PRIMARY KEY (`standard_product_id`),
  UNIQUE KEY `uk_sku` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标准服务产品表';

-- ----------------------------
