-- Table structure for guohua_plan_kf_station_complete
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_kf_station_complete`;
CREATE TABLE `guohua_plan_kf_station_complete` (
  `station_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '站点id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `month` varchar(32) DEFAULT NULL COMMENT '月份2025-01',
  `area_id` int(11) DEFAULT NULL COMMENT '区域id',
  `area_name` varchar(255) DEFAULT NULL COMMENT '区域名称',
  `street_name` varchar(255) DEFAULT NULL COMMENT '街镇',
  `station_address` varchar(255) DEFAULT NULL COMMENT '站点位置',
  `contact_person` varchar(255) DEFAULT NULL COMMENT '业务对接人',
  `station_progress` varchar(255) DEFAULT NULL COMMENT '建设进度',
  `operation_time` date DEFAULT NULL COMMENT '投入运营时间',
  `disabled_person_num` int(11) DEFAULT NULL COMMENT '肢体残疾人数量',
  `recovery_num` int(11) DEFAULT NULL COMMENT '参与康复人数',
  `close_time` date DEFAULT NULL COMMENT '预计关闭时间',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  PRIMARY KEY (`station_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COMMENT='康复站点建设及预测';

-- ----------------------------
