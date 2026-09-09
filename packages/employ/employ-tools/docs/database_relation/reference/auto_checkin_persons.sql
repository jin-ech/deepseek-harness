-- Table structure for auto_checkin_persons
-- ----------------------------
DROP TABLE IF EXISTS `auto_checkin_persons`;
CREATE TABLE `auto_checkin_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `persons_name` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `id_number` varchar(32) NOT NULL DEFAULT '' COMMENT '身份证号',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '人员ID（对应 guohua_ins.persons.persons_id）',
  `base_name` varchar(128) NOT NULL DEFAULT '' COMMENT '基地名称（打卡位置）',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：1=启用，2=停用',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`),
  KEY `idx_id_number` (`id_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时打卡人员表';

-- ----------------------------
