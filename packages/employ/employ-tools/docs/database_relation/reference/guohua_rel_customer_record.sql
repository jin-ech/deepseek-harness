-- Table structure for guohua_rel_customer_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_record`;
CREATE TABLE `guohua_rel_customer_record` (
  `customer_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户记录id',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户id',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `content` varchar(255) DEFAULT NULL COMMENT '操作内容',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '分配时间',
  `add_userid` varchar(255) DEFAULT '' COMMENT '操作人',
  `old_responsible_userid` varchar(255) DEFAULT '' COMMENT '变更前的负责人',
  `responsible_userid` varchar(255) DEFAULT '' COMMENT '变更后的负责人',
  `status` varchar(255) DEFAULT '0' COMMENT '1客户认领分配  2子客户变更 3退回公海',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `main_customer_id` int(11) DEFAULT NULL COMMENT '主客户id',
  PRIMARY KEY (`customer_record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41596 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-客户信息变更记录';

-- ----------------------------
