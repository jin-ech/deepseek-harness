-- Table structure for guohua_ens_activity
-- ----------------------------
DROP TABLE IF EXISTS `guohua_ens_activity`;
CREATE TABLE `guohua_ens_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `customer_id` text DEFAULT NULL COMMENT '客户id',
  `activity_name` varchar(255) DEFAULT NULL COMMENT '活动名称',
  `activity_type_id` int(11) DEFAULT NULL COMMENT '活动类型 ',
  `activity_address` varchar(255) DEFAULT NULL COMMENT '活动地点',
  `activity_address_lat` varchar(255) DEFAULT NULL COMMENT '活动地点纬度',
  `activity_address_lng` varchar(255) DEFAULT NULL COMMENT '活动地点精度',
  `activity_address_info` varchar(255) DEFAULT NULL COMMENT '活动地点详细',
  `activity_address_province` varchar(64) DEFAULT NULL COMMENT '活动地点省份',
  `activity_address_city` varchar(64) DEFAULT NULL COMMENT '活动地点城市',
  `activity_address_district` varchar(64) DEFAULT NULL COMMENT '活动地点地区',
  `activity_cover_photo` varchar(255) DEFAULT NULL COMMENT '活动封面图片',
  `activity_content` text DEFAULT NULL COMMENT '活动内容',
  `activity_points` int(11) DEFAULT NULL COMMENT '参与活动可获得的积分',
  `activity_contact_name` varchar(64) DEFAULT NULL COMMENT '活动联系人',
  `activity_contact_tel` varchar(255) DEFAULT NULL COMMENT '活动联系人电话',
  `start_date` varchar(32) DEFAULT NULL COMMENT '活动开始时间',
  `end_date` varchar(32) DEFAULT NULL COMMENT '活动结束时间',
  `is_show` tinyint(4) DEFAULT 1 COMMENT '是否显示 1显示 0 不显示 状态同步c端小程序',
  `is_top` tinyint(4) DEFAULT 0 COMMENT '是否置顶 1是 0否',
  `is_global` tinyint(4) DEFAULT 0 COMMENT '是否全局显示 1是0否',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `is_comment` tinyint(4) DEFAULT 1 COMMENT '是否开启评论 1开启 0未开启',
  `homeland_id` text DEFAULT NULL COMMENT '关联家园id',
  `activity_add_source` tinyint(4) DEFAULT NULL COMMENT '新增活动来源 1CMS 2企业',
  PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4 COMMENT='助益行活动表';

-- ----------------------------
