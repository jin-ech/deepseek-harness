-- Table structure for guohua_store_total_detail
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_total_detail`;
CREATE TABLE `guohua_store_total_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT 0 COMMENT '基地id',
  `add_time` date DEFAULT current_timestamp() COMMENT '添加时间',
  `total_num` int(11) DEFAULT 0 COMMENT '在职人数',
  `bind_num` int(11) DEFAULT 0 COMMENT '绑定人数',
  `not_bind_num` int(11) DEFAULT 0 COMMENT '未绑定人数',
  `photo_num` int(11) DEFAULT 0 COMMENT '上传照片人数',
  `check_num` int(11) DEFAULT 0 COMMENT '打卡人数',
  `date` varchar(32) DEFAULT '' COMMENT '当前日期',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=954 DEFAULT CHARSET=utf8mb4 COMMENT='企业营销CRM销售目标完成情况表';

-- ----------------------------
