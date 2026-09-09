-- Table structure for guohua_ens_works
-- ----------------------------
DROP TABLE IF EXISTS `guohua_ens_works`;
CREATE TABLE `guohua_ens_works` (
  `works_id` varchar(64) NOT NULL COMMENT '作品id',
  `persons_id` varchar(64) DEFAULT NULL COMMENT '人员id',
  `persons_name` varchar(64) DEFAULT NULL COMMENT '人员姓名',
  `persons_img` varchar(255) DEFAULT NULL COMMENT '人员照片',
  `homeland_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `disabled_type_id` int(11) DEFAULT NULL COMMENT '残疾类型id',
  `persons_desc` varchar(255) DEFAULT NULL COMMENT '人员简介',
  `works_name` varchar(255) DEFAULT NULL COMMENT '作品名称',
  `works_img` varchar(255) DEFAULT NULL COMMENT '作品图片',
  `works_desc` text DEFAULT NULL COMMENT '作品描述',
  `is_show` tinyint(4) DEFAULT 1 COMMENT '是否显示 1显示 0 不显示 状态同步c端小程序',
  `is_top` tinyint(4) DEFAULT 0 COMMENT '是否置顶 1是 0否',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`works_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='助益行残疾人作品表';

-- ----------------------------
