-- Table structure for base_dict_activity_web
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_activity_web`;
CREATE TABLE `base_dict_activity_web` (
  `activity_rel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '服务关联温馨家园网站id',
  `activity_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '服务类型id 1基础服务 2赋能服务  3互助服务  4 照料服务 5项目服务 6其他服务',
  `activity_name` varchar(32) NOT NULL DEFAULT '' COMMENT '外部服务名称',
  `activity_web_id` varchar(32) NOT NULL DEFAULT '' COMMENT '外部网站服务id',
  `activity_id` int(11) NOT NULL DEFAULT 0 COMMENT '内部服务id',
  `is_show` int(11) NOT NULL DEFAULT 1 COMMENT '是否显示 1是 2否',
  PRIMARY KEY (`activity_rel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COMMENT='服务关联温馨家园网站字典表';

-- ----------------------------
