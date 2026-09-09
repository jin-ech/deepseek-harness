-- Table structure for guohua_customer_channel
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_channel`;
CREATE TABLE `guohua_customer_channel` (
  `channel_id` varchar(32) NOT NULL COMMENT '渠道id',
  `channel_name` varchar(255) DEFAULT NULL COMMENT '渠道名称',
  `channel_type` tinyint(4) DEFAULT 1 COMMENT '渠道类型 1自拓  2FESCO  3使用资质',
  `channel_region` varchar(64) DEFAULT NULL COMMENT '渠道区域 1华北 2上海 3杭州',
  `channel_contact` varchar(255) DEFAULT NULL COMMENT '渠道联系人',
  `contact_phone` varchar(255) DEFAULT NULL COMMENT '渠道联系人电话',
  `rebate_ratio` float(11,2) DEFAULT NULL COMMENT '渠道返款比例 正常0% 15% 30% 35% 40% 其他',
  `responsible_userid` varchar(64) DEFAULT NULL COMMENT '负责人',
  `is_public` tinyint(4) DEFAULT 1 COMMENT '是否公开 1 是 0否',
  `add_userid` varchar(64) DEFAULT NULL COMMENT '创建人id',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `update_time` datetime DEFAULT current_timestamp() COMMENT '修改时间',
  `update_userid` varchar(64) DEFAULT NULL COMMENT '修改人',
  `is_company` tinyint(4) DEFAULT NULL COMMENT '渠道属性 1企业渠道  2个人渠道',
  `service_start_date` varchar(64) DEFAULT NULL COMMENT '服务起止日期',
  `service_end_date` varchar(64) DEFAULT NULL COMMENT '服务起止日期',
  `dispatch_license_date` varchar(64) DEFAULT NULL COMMENT '劳务派遣许可证有效时间',
  `business_license_date` varchar(64) DEFAULT NULL COMMENT '营业执照有效时间',
  `hr_license_date` varchar(64) DEFAULT NULL COMMENT '人力资源许可证有效时间',
  `share_userids` varchar(1024) DEFAULT NULL COMMENT '共享用户userid，逗号分隔',
  `channel_level` tinyint(1) DEFAULT 0 COMMENT '渠道级别 1：金牌 0:普通',
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户渠道信息表';

-- ----------------------------
