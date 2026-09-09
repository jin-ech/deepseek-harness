-- Table structure for base_plan_policy_dict
-- ----------------------------
DROP TABLE IF EXISTS `base_plan_policy_dict`;
CREATE TABLE `base_plan_policy_dict` (
  `policy_overview_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '政策概述id',
  `region_id` int(11) DEFAULT NULL COMMENT '地区ID 0:表示全国',
  `policy_overview` varchar(1000) DEFAULT NULL COMMENT '政策概述',
  `store_types` varchar(255) DEFAULT NULL COMMENT '支持的产品类型',
  `imgs` varchar(1000) DEFAULT NULL COMMENT '相关文件图片 多个,连接',
  PRIMARY KEY (`policy_overview_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='智能方案政策概述表';

-- ----------------------------
