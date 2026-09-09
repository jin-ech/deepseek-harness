-- Table structure for zyx_activity_orders
-- ----------------------------
DROP TABLE IF EXISTS `zyx_activity_orders`;
CREATE TABLE `zyx_activity_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动预约ID',
  `activity_type` varchar(255) NOT NULL DEFAULT '' COMMENT '活动类型',
  `custom_content` varchar(255) NOT NULL DEFAULT '' COMMENT '定制活动内容',
  `company` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名称',
  `link_name` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `order_month` varchar(255) NOT NULL DEFAULT '' COMMENT '预约日期',
  `start_date` varchar(10) NOT NULL DEFAULT '' COMMENT '开始日期',
  `end_date` varchar(10) NOT NULL DEFAULT '0' COMMENT '结束日期',
  `region_id` int(11) NOT NULL DEFAULT 0 COMMENT '地区',
  `street` varchar(255) NOT NULL DEFAULT '' COMMENT '街道',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 1：待处理 2：已处理',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'Ip地址',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '申请时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '编辑时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1：未删除 0：已删除',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='基地导览活动预约表';

-- ----------------------------
