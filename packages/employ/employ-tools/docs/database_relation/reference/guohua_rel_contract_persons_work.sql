-- Table structure for guohua_rel_contract_persons_work
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_contract_persons_work`;
CREATE TABLE `guohua_rel_contract_persons_work` (
  `rel_contract_persons_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '合同关联人员id',
  `contract_id` int(11) NOT NULL DEFAULT 0 COMMENT '合同id',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户id',
  `customer_name` varchar(255) NOT NULL COMMENT '客户名',
  `offer_type_one` varchar(64) NOT NULL DEFAULT '' COMMENT '报价类型1 （1:按客户 2:按人）',
  `offer_type_two` varchar(64) NOT NULL DEFAULT '' COMMENT '报价类型2 （1:按月 2:按年）',
  `light_disability_num` int(11) NOT NULL DEFAULT 0 COMMENT '轻残报价',
  `severe_disability_num` int(11) NOT NULL DEFAULT 0 COMMENT '轻残报价',
  `light_disability_price` float(11,2) NOT NULL DEFAULT 0.00 COMMENT '轻残报价',
  `severe_disability_price` float(11,2) NOT NULL DEFAULT 0.00 COMMENT '重残报价',
  `service_price` float(11,2) NOT NULL DEFAULT 0.00 COMMENT '服务报价(服务类型为申报代办)',
  `demand_id` int(11) NOT NULL DEFAULT 0 COMMENT '需求id',
  `mission_id` int(11) NOT NULL DEFAULT 0 COMMENT '任务id',
  `service_id` int(11) NOT NULL DEFAULT 0 COMMENT '服务id',
  `match_id` int(11) NOT NULL DEFAULT 0 COMMENT '匹配id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '人员id',
  `work_id` int(11) NOT NULL DEFAULT 0 COMMENT '岗位id',
  `audit_status` varchar(11) NOT NULL DEFAULT '' COMMENT '人员审批状态',
  `start_date` varchar(32) NOT NULL DEFAULT '' COMMENT '人员工作开始时间',
  `end_date` varchar(32) NOT NULL DEFAULT '' COMMENT '人员工作结束时间',
  `actual_end_date` varchar(32) NOT NULL DEFAULT '' COMMENT '实际工作结束时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新时间',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `disabled_extent` varchar(32) NOT NULL DEFAULT '' COMMENT '1重残  2轻残',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  PRIMARY KEY (`rel_contract_persons_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9646 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-合同关联人员就职信息表';

-- ----------------------------
