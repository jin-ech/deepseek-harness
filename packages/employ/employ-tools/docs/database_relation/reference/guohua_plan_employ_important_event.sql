-- Table structure for guohua_plan_employ_important_event
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_employ_important_event`;
CREATE TABLE `guohua_plan_employ_important_event` (
  `operate_event_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `month` varchar(32) DEFAULT NULL COMMENT '月份2025-01',
  `area_id` int(11) DEFAULT NULL COMMENT '地区id',
  `area_name` varchar(32) DEFAULT NULL COMMENT '区域名称',
  `department_id` varchar(32) DEFAULT NULL COMMENT '部门id',
  `department_name` varchar(32) DEFAULT NULL COMMENT '部门名',
  `inspect_people` int(11) DEFAULT NULL COMMENT '需核查总人数',
  `level_inspect_complete` int(11) DEFAULT NULL COMMENT '等级核查已完成',
  `level_inspect_remnant` int(11) DEFAULT NULL COMMENT '等级核查剩余人数',
  `level_inspect_normal` int(11) DEFAULT NULL COMMENT '等级核查正常人数',
  `level_inspect_abnormal` int(11) DEFAULT NULL COMMENT '等级核查异常人数',
  `collect_complete` int(11) DEFAULT NULL COMMENT '收费已完成',
  `collect_remnant` int(11) DEFAULT NULL COMMENT '收费剩余人数',
  `collect_abnormal` int(11) DEFAULT NULL COMMENT '收费异常人数',
  `double_complete` int(11) DEFAULT NULL COMMENT '双挂核查已完成',
  `double_remnant` int(11) DEFAULT NULL COMMENT '双挂核查剩余人数',
  `double_abnormal` int(11) DEFAULT NULL COMMENT '双挂核查异常人数',
  `contract_expire` int(11) DEFAULT NULL COMMENT '合同到期人数',
  `contract_expire_complete` int(11) DEFAULT NULL COMMENT '合同到期通知已完成',
  `contract_expire_remnant` int(11) DEFAULT NULL COMMENT '合同到期通知剩余人数',
  `disable_expire` int(11) DEFAULT NULL COMMENT '残疾证到期人数',
  `disable_expire_complete` int(11) DEFAULT NULL COMMENT '残疾证到期通知已完成',
  `disable_expire_remnant` int(11) DEFAULT NULL COMMENT '残疾证到期通知剩余人数',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  PRIMARY KEY (`operate_event_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COMMENT='重点运营事件表';

-- ----------------------------
