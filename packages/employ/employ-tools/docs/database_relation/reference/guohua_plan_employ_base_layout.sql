-- Table structure for guohua_plan_employ_base_layout
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_employ_base_layout`;
CREATE TABLE `guohua_plan_employ_base_layout` (
  `base_layout_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '完成id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `month` varchar(32) DEFAULT NULL COMMENT '月份2025-01',
  `area_id` int(11) DEFAULT NULL COMMENT '区域id',
  `province_id` int(11) DEFAULT NULL COMMENT '省份id',
  `city_id` int(11) DEFAULT NULL COMMENT '城市id',
  `base_self_target` int(11) DEFAULT NULL COMMENT '自营基地年度目标',
  `base_self` int(11) DEFAULT NULL COMMENT '自营基地数',
  `base_example_target` int(11) DEFAULT NULL COMMENT '示范基地年度目标',
  `base_example` int(11) DEFAULT NULL COMMENT '示范基地数',
  `base_common` int(11) DEFAULT NULL COMMENT '普通基地数',
  `base_contract` int(11) DEFAULT NULL COMMENT '基地协议数',
  `base_on_job` int(11) DEFAULT NULL COMMENT '在职人数',
  `base_register` int(11) DEFAULT NULL COMMENT '员工注册数',
  `base_check_in` int(11) DEFAULT NULL COMMENT '考勤打卡数',
  `base_upload` int(11) DEFAULT NULL COMMENT '工作照片上传人数',
  `base_light_reserve` int(11) DEFAULT NULL COMMENT '储备轻残',
  `base_weight_reserve` int(11) DEFAULT NULL COMMENT '储备重残',
  `special_require` varchar(255) DEFAULT NULL COMMENT '特殊要求',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  PRIMARY KEY (`base_layout_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=493 DEFAULT CHARSET=utf8mb4 COMMENT='基地布局数据';

-- ----------------------------
