-- Table structure for rel_store_product_order_deliver_record_files
-- ----------------------------
DROP TABLE IF EXISTS `rel_store_product_order_deliver_record_files`;
CREATE TABLE `rel_store_product_order_deliver_record_files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `deliver_record_id` varchar(64) DEFAULT NULL COMMENT '劳动产品交付id',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_url` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `sort` int(11) DEFAULT 999 COMMENT '排序',
  `is_show` tinyint(4) DEFAULT 1 COMMENT '1 显示 0不显示',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='劳动产品订单产品交付附件信息表';

-- ----------------------------
