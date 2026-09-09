-- Table structure for guohua_rel_expend_store
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_expend_store`;
CREATE TABLE `guohua_rel_expend_store` (
  `expend_store_id` int(11) NOT NULL AUTO_INCREMENT,
  `expend_detail_id` int(11) NOT NULL DEFAULT 0 COMMENT '付款申请ID',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '单店ID',
  `expend_amount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '付款金额',
  PRIMARY KEY (`expend_store_id`) USING BTREE,
  KEY `idx_expend_detail_id` (`expend_detail_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5151 DEFAULT CHARSET=utf8mb4 COMMENT='OA-付款申请关联单店表';

-- ----------------------------
