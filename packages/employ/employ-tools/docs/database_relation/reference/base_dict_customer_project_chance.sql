-- Table structure for base_dict_customer_project_chance
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_customer_project_chance`;
CREATE TABLE `base_dict_customer_project_chance` (
  `project_chance_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目机会id',
  `project_chance_name` varchar(64) NOT NULL DEFAULT '0' COMMENT '机会名称',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1显示 0不显示',
  `sort` tinyint(4) NOT NULL DEFAULT 1 COMMENT '排序方式',
  PRIMARY KEY (`project_chance_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='项目机会字典表';

-- ----------------------------
