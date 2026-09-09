-- Table structure for guohua_plan_store_franchise
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_store_franchise`;
CREATE TABLE `guohua_plan_store_franchise` (
  `franchise_store_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '直营店id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `month` varchar(32) DEFAULT NULL COMMENT '月份2025-01',
  `area_id` varchar(32) DEFAULT NULL COMMENT '区域名称',
  `province_id` int(11) DEFAULT NULL COMMENT '省份id',
  `city_id` int(11) DEFAULT NULL COMMENT '城市id',
  `store_id` varchar(32) DEFAULT NULL COMMENT '基地id',
  `store_name` varchar(32) DEFAULT NULL COMMENT '基地名称',
  `store_type` varchar(255) DEFAULT NULL COMMENT '基地类型',
  `office_num` int(11) DEFAULT 0 COMMENT '帮扶性就业人数',
  `bind_num` int(11) DEFAULT 0 COMMENT '系统绑定人数',
  `week_create_activity_num` int(11) DEFAULT 0 COMMENT '周系统服务/活动生成数',
  `fusion_activity_num` int(11) DEFAULT 0 COMMENT '累计企业融合活动数',
  `week_fusion_activity_num` int(11) DEFAULT 0 COMMENT '周融合活动数',
  `expend_product_num` int(11) DEFAULT 0 COMMENT '累计交付产品数',
  `product_amount` decimal(10,2) DEFAULT 0.00 COMMENT '累计增收金额',
  `create_product_num` int(11) DEFAULT 0 COMMENT '当前制作产品数',
  `visit_num` int(11) DEFAULT 0 COMMENT '年度累计走访次数',
  `month_visit_num` int(11) DEFAULT 0 COMMENT '本月走访次数',
  `week_plan_remarks` varchar(255) DEFAULT '0' COMMENT '本周服务计划',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  PRIMARY KEY (`franchise_store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8mb4 COMMENT='加盟店数据';

-- ----------------------------
