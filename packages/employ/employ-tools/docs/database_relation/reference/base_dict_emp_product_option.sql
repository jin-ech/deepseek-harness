-- Table structure for base_dict_emp_product_option
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_emp_product_option`;
CREATE TABLE `base_dict_emp_product_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `option_type` varchar(32) NOT NULL COMMENT '选项类型：disability适配残疾人 digital_service数字化服务 employ_form用工形式 job_name岗位名称 work_time工作时间 labor_project劳动项目 price标准价格 delivery_type交付物 health_care健康关怀 training培训 care_activity关爱活动 entry_material入职材料',
  `option_value` varchar(500) NOT NULL DEFAULT '' COMMENT '选项内容',
  `biz_side` tinyint(1) NOT NULL DEFAULT 0 COMMENT '适用业务端：0通用 1 toB 2 toG',
  `sort` int(11) NOT NULL DEFAULT 9999 COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示：1是 0否',
  PRIMARY KEY (`id`),
  KEY `idx_emp_option_type` (`option_type`,`is_show`)
) ENGINE=InnoDB AUTO_INCREMENT=1902 DEFAULT CHARSET=utf8mb4 COMMENT='就业标准化产品通用选项字典表';

-- ----------------------------
