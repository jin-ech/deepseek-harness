-- Table structure for guohua_project
-- ----------------------------
DROP TABLE IF EXISTS `guohua_project`;
CREATE TABLE `guohua_project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目id',
  `project_code` varchar(255) NOT NULL DEFAULT '' COMMENT '项目编号',
  `project_name` varchar(255) NOT NULL DEFAULT '' COMMENT '项目名称',
  `project_leader` varchar(255) NOT NULL DEFAULT '' COMMENT '项目负责人ID',
  `main_department_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属部门ID',
  `userid` varchar(255) NOT NULL DEFAULT '' COMMENT '添加人微信ID',
  `update_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '修改人微信ID',
  `product_id` int(11) NOT NULL DEFAULT 0 COMMENT '产品ID',
  `customer_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '客户ID',
  `contract_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '合同ID',
  `service_line_id` int(11) NOT NULL DEFAULT 0 COMMENT '业务线ID',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0 已删除',
  `tmp_id` varchar(255) NOT NULL DEFAULT '' COMMENT '临时id',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示',
  `project_amount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '项目金额',
  `start_date` varchar(10) NOT NULL DEFAULT '' COMMENT '项目开始时间',
  `end_date` varchar(10) NOT NULL DEFAULT '' COMMENT '项目结束时间',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '家园连锁单店ID',
  PRIMARY KEY (`project_id`) USING BTREE,
  KEY `index_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5026 DEFAULT CHARSET=utf8mb4 COMMENT='项目表';

-- ----------------------------
