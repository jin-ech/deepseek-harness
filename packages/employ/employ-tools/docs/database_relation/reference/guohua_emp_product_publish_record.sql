-- Table structure for guohua_emp_product_publish_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_emp_product_publish_record`;
CREATE TABLE `guohua_emp_product_publish_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID guohua_emp_product.product_id',
  `action_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '操作类型：1发布 2下架 3更新发布',
  `version_no` int(11) NOT NULL DEFAULT 1 COMMENT '发布时版本号',
  `snapshot` longtext DEFAULT NULL COMMENT '产品全量快照（JSON，含地区数据）',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '操作备注',
  `operate_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '操作人',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_emp_publish_pid` (`product_id`,`version_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='就业标准化产品发布记录表';

-- ----------------------------
