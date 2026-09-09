-- Table structure for persons_payslip
-- ----------------------------
DROP TABLE IF EXISTS `persons_payslip`;
CREATE TABLE `persons_payslip` (
  `payslip_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工资条图片id',
  `persons_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '人员id',
  `img_name` varchar(255) NOT NULL DEFAULT '' COMMENT '图片名称',
  `img_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `payslip_month` varchar(255) NOT NULL DEFAULT '' COMMENT '工资条月份',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `ocr_text` text DEFAULT NULL COMMENT 'OCR识别原始文本',
  `llm_parsed_result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'LLM解析结果JSON',
  `ocr_card_last4_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'LLM提取的银行卡后四位列表',
  `match_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '匹配状态 0未处理 1匹配成功 2未识别到文字 3未识别到卡尾号 4未查询到人员银行卡 5未匹配到 6需人工确认',
  `matched_bank_id` bigint(20) DEFAULT NULL COMMENT '匹配命中的人员银行卡记录ID',
  `matched_bank_last4` varchar(16) DEFAULT '' COMMENT '匹配命中的银行卡后四位',
  `matched_source_last4` varchar(16) DEFAULT '' COMMENT '本次匹配命中的OCR候选后四位',
  `match_reason` varchar(255) DEFAULT '' COMMENT '匹配结果说明',
  PRIMARY KEY (`payslip_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='人员工资条图片表';

-- ----------------------------
