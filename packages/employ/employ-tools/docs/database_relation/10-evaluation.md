# 十、测评与残疾人评估域

## 10.1 题库 (work_disability_evaluate_question)

残疾人职业能力测评题库，含多个备份表（导入前、优化前、大模型生成前等）。

| 表名 | 说明 |
|------|------|
| `work_disability_evaluate_question` | 残疾人职业能力测评题库（主表） |

## 10.2 测评记录

| 表名 | 说明 |
|------|------|
| `work_evaluate_disabled` [work_evaluate_disabled.sql](./reference/work_evaluate_disabled.sql) | 残疾人测评记录表 |
| `work_evaluation_record` [work_evaluation_record.sql](./reference/work_evaluation_record.sql) | 测评记录详表 |
| `work_evaluate_area` [work_evaluate_area.sql](./reference/work_evaluate_area.sql) | 区县二维码表 |
| `work_evaluate_qrcode_pool` [work_evaluate_qrcode_pool.sql](./reference/work_evaluate_qrcode_pool.sql) | 测评二维码池 |
| `work_evaluate_area_pool_binding` [work_evaluate_area_pool_binding.sql](./reference/work_evaluate_area_pool_binding.sql) | 区县与二维码池绑定 |
| `work_disability_homeland_callback_log` [work_disability_homeland_callback_log.sql](./reference/work_disability_homeland_callback_log.sql) | 测评报告回调日志 |
| `work_anchor_question` [work_anchor_question.sql](./reference/work_anchor_question.sql) | 施恩职业锚测评题库 |

## 10.3 验证残疾人

| 表名 | 说明 |
|------|------|
| `verify_persons_disable` [verify_persons_disable.sql](./reference/verify_persons_disable.sql) | 残联系统验证残疾人 |
| `verify_persons_disable_zhixuan` [verify_persons_disable_zhixuan.sql](./reference/verify_persons_disable_zhixuan.sql) | 直选验证残疾人 |
| `verify_persons_recure` [verify_persons_recure.sql](./reference/verify_persons_recure.sql) | 康复系统验证人员 |

## 10.4 ins_dict 残疾人字典

| 表名 | 说明 |
|------|------|
| `ins_dict_disabled_type` [ins_dict_disabled_type.sql](./reference/ins_dict_disabled_type.sql) | 残疾人类别 |
| `ins_dict_disability_reason` [ins_dict_disability_reason.sql](./reference/ins_dict_disability_reason.sql) | 致残原因 |
| `ins_dict_education` [ins_dict_education.sql](./reference/ins_dict_education.sql) | 学历 |
| `ins_dict_nation` [ins_dict_nation.sql](./reference/ins_dict_nation.sql) | 民族 |
| `ins_dict_family_relation` [ins_dict_family_relation.sql](./reference/ins_dict_family_relation.sql) | 家人关系 |
| `ins_dict_economic_state` [ins_dict_economic_state.sql](./reference/ins_dict_economic_state.sql) | 经济状况 |
| `ins_dict_medical_security` [ins_dict_medical_security.sql](./reference/ins_dict_medical_security.sql) | 医疗保障 |
| `ins_dict_personal_income` [ins_dict_personal_income.sql](./reference/ins_dict_personal_income.sql) | 个人收入 |
| `ins_dict_prosthesis` [ins_dict_prosthesis.sql](./reference/ins_dict_prosthesis.sql) | 安装假肢 |
| `ins_dict_orthosis` [ins_dict_orthosis.sql](./reference/ins_dict_orthosis.sql) | 矫形器 |
| `ins_dict_use_appliances` [ins_dict_use_appliances.sql](./reference/ins_dict_use_appliances.sql) | 使用器具 |

### ins_dict 残疾人字典（补充）

| 表名 | 说明 |
|------|------|
| `ins_dict_continued_time` | 残疾持续时间字典表 |
| `ins_dict_housework` | 家庭情况会做的家事字典表 |
| `ins_dict_like_family` | 家庭情况最喜欢的家人字典表 |
| `ins_dict_limb_parts` | 致残肢体部位字典表 |
| `ins_dict_main_arder_activity` | 家庭情况主要休闲活动字典表 |
| `ins_dict_main_economic_source` | 家庭情况主要经济来源字典表 |
| `ins_dict_main_look` | 家庭情况主要照顾者字典表 |
