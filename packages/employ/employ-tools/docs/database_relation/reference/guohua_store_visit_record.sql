-- Table structure for guohua_store_visit_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_visit_record`;
CREATE TABLE `guohua_store_visit_record` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '拜访记录id',
  `store_id` int(11) NOT NULL COMMENT '基地id，关联guohua_store.store_id',
  `visit_location` varchar(255) NOT NULL DEFAULT '' COMMENT '拜访地点',
  `visit_userids` varchar(1000) NOT NULL DEFAULT '' COMMENT '拜访人姓名，手动填写，多人使用逗号分隔',
  `visit_start_time` datetime NOT NULL COMMENT '拜访开始时间',
  `visit_end_time` datetime NOT NULL COMMENT '拜访结束时间',
  `visit_content` text NOT NULL COMMENT '拜访内容',
  `photo_urls` text DEFAULT NULL COMMENT '拜访照片URL数组，JSON格式',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人userid',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '最后修改人userid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改时间',
  `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否删除：1未删除，0已删除',
  PRIMARY KEY (`visit_id`),
  KEY `idx_store_visit_store_time` (`store_id`,`visit_start_time`),
  KEY `idx_store_visit_delete` (`is_delete`),
  KEY `idx_store_visit_add_userid` (`add_userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='基地拜访留痕记录表';

-- ----------------------------
