-- Table structure for guohua_plan_store_direct
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_store_direct`;
CREATE TABLE `guohua_plan_store_direct` (
  `direct_store_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '直营店id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `month` varchar(32) DEFAULT NULL COMMENT '月份2025-01',
  `area_id` int(11) DEFAULT NULL COMMENT '区域id',
  `area_name` varchar(32) DEFAULT NULL COMMENT '区域名称',
  `city_id` int(11) DEFAULT NULL COMMENT '城市id',
  `province_id` int(11) DEFAULT NULL COMMENT '省份id',
  `store_id` varchar(32) DEFAULT NULL COMMENT '单店id',
  `store_name` varchar(64) DEFAULT NULL COMMENT '单店名',
  `persons_num` int(11) DEFAULT 0 COMMENT '职康站/阳光家园人数',
  `service_persons_num` int(11) DEFAULT 0 COMMENT '服务总人数',
  `office_num` int(11) DEFAULT 0 COMMENT '帮扶性就业人数',
  `bind_num` int(11) DEFAULT 0 COMMENT '绑定人数',
  `week_persons_bind_num` int(11) DEFAULT 0 COMMENT '周增绑定人数',
  `week_persons_activity_num` int(11) DEFAULT 0 COMMENT '周活跃人数',
  `week_create_activity_num` int(11) DEFAULT 0 COMMENT '周系统服务/活动生成数',
  `activity_num` int(11) DEFAULT 0 COMMENT '累计活动数',
  `service_num` int(11) DEFAULT 0 COMMENT '累计服务数',
  `fusion_activity_num` int(11) DEFAULT 0 COMMENT '累计企业融合活动数',
  `week_activity_num` int(11) DEFAULT 0 COMMENT '周活动数',
  `week_service_num` int(11) DEFAULT NULL COMMENT '周服务数',
  `week_fusion_activity_num` int(11) DEFAULT 0 COMMENT '周企业融合活动数',
  `expend_product_num` int(11) DEFAULT 0 COMMENT '累计交付产品数',
  `product_amount` decimal(11,2) DEFAULT NULL COMMENT '累计增收金额',
  `create_product_num` int(11) DEFAULT 0 COMMENT '当前制作产品数',
  `project_amount` decimal(10,2) DEFAULT 0.00 COMMENT '项目金额',
  `confirm_amount` decimal(10,2) DEFAULT 0.00 COMMENT '累计已到账',
  `project_should_amount` decimal(10,2) DEFAULT 0.00 COMMENT '项目应收',
  `confirm_amount_year` decimal(10,2) DEFAULT 0.00 COMMENT '本年已到账',
  `project_should_amount_year` decimal(10,2) DEFAULT 0.00 COMMENT '本年应收',
  `project_expend_amount` decimal(10,2) DEFAULT 0.00 COMMENT '项目已支出',
  `project_expected_profit` decimal(10,2) DEFAULT NULL COMMENT '项目预期利润',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  PRIMARY KEY (`direct_store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COMMENT='直营店数据';

-- ----------------------------
