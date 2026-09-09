-- Table structure for guohua_ens_banner
-- ----------------------------
DROP TABLE IF EXISTS `guohua_ens_banner`;
CREATE TABLE `guohua_ens_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'banner id ',
  `banner_name` varchar(255) DEFAULT NULL COMMENT 'banner名称',
  `banner_url` varchar(255) DEFAULT NULL COMMENT 'banner图片链接',
  `banner_type` tinyint(4) DEFAULT 1 COMMENT 'banner类型1默认 2主题',
  `theme_id` varchar(64) DEFAULT NULL COMMENT '主题id',
  `customer_id` text DEFAULT NULL COMMENT '客户id',
  `is_show` tinyint(4) DEFAULT 1 COMMENT '是否显示 1 显示 0不显示',
  `is_global` tinyint(4) DEFAULT 0 COMMENT '是否全局显示 1是0否',
  `jump_type` varchar(255) DEFAULT NULL COMMENT '跳转类型 self小程序内部 mini外部小程序',
  `jump_path` varchar(255) DEFAULT NULL COMMENT '跳转路径',
  `activity_id` int(11) DEFAULT NULL COMMENT '跳转活动id',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `sort` int(11) DEFAULT 999 COMMENT '排序',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `banner_add_source` tinyint(4) DEFAULT NULL COMMENT '新增活动来源 1CMS 2企业',
  PRIMARY KEY (`banner_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='助益行小程序banner';

-- ----------------------------
