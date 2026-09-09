# 三、基础数据层

## 3.1 组织与权限

### base_guohua_user（通讯录表/会员表）

| 字段 | 类型 | 说明 |
|------|------|------|
| `userid` | varchar(64) [PK] | 企业微信userid |
| `name` | varchar(64) | 姓名 |
| `department` | varchar(500) | 部门ID列表(逗号分隔) |
| `main_department` | int(11) | 主部门ID |
| `mobile` | varchar(32) | 手机号 |
| `email` | varchar(128) | 邮箱 |
| `gender` | tinyint(4) | 性别 |
| `status` | tinyint(4) | 状态 |
| `isleader` | tinyint(4) | 是否领导 |
| `enable` | tinyint(4) | 是否启用 |

### base_guohua_department（国华企业微信部门表）

| 字段 | 类型 | 说明 |
|------|------|------|
| `department_id` | int(11) [PK] | 部门ID |
| `name` | varchar(128) | 部门名称 |
| `parentid` | int(11) | 父部门ID |
| `department_leader` | varchar(500) | 部门负责人userid列表(逗号分隔) |

### base_guohua_user_role（员工系统角色id）

| 字段 | 类型 | 说明 |
|------|------|------|
| `userid` | varchar(64) | 用户userid |
| `system_id` | varchar(64) | 系统ID |
| `permission_role_id` | int(11) | 角色ID |

### base_permission_roles（权限角色）

| 字段 | 类型 | 说明 |
|------|------|------|
| `permission_role_id` | int(11) [PK] | 角色ID |
| `permission_role_name` | varchar(128) | 角色名称 |
| `system_id` | varchar(64) | 系统ID |

### base_permission_role_detail（角色权限明细）

| 字段 | 类型 | 说明 |
|------|------|------|
| `permission_role_id` | int(11) | 角色ID |
| `permission_id` | int(11) | 权限ID |

### base_guohua_menu（国华内部系统菜单表）

| 字段 | 类型 | 说明 |
|------|------|------|
| `id` | int(11) [PK] | 菜单ID |
| `menu_name` | varchar(128) | 菜单名称 |
| `parent_id` | int(11) | 父菜单ID |
| `menu_url` | varchar(255) | 菜单URL |
| `system_id` | varchar(64) | 系统ID |

### base_guohua_user_specific_password（人员邮箱特定密码表）

| 字段 | 类型 | 说明 |
|------|------|------|
| `id` | int(11) [PK] | 主键 |
| `userid` | varchar(64) | 用户userid |
| `password` | varchar(255) | 特定密码 |

### base_plan_policy_dict（智能方案政策概述表）

| 字段 | 类型 | 说明 |
|------|------|------|
| `id` | int(11) [PK] | 主键 |
| `policy_content` | text | 政策概述内容 |

### cmb_alert_subscription（企业微信告警订阅）

| 字段 | 类型 | 说明 |
|------|------|------|
| `id` | int(11) [PK] | 主键 |
| `userid` | varchar(64) | 订阅用户 |
| `alert_type` | varchar(64) | 告警类型 |

**关联关系**:
- `base_guohua_user_role.userid` → `base_guohua_user.userid`
- `base_guohua_user_role.permission_role_id` → `base_permission_roles.permission_role_id`
- `base_guohua_user.department` → `base_guohua_department.department_id`（逗号分隔）
- `base_guohua_user.main_department` → `base_guohua_department.department_id`
- `base_permission_role_detail.permission_role_id` → `base_permission_roles.permission_role_id`
- `base_permission_role_detail.permission_id` → `base_dict_permissions.id`

---

## 3.2 字典表 (base_dict_*)

共 **~79 张**，按业务分类：

### 客户相关字典

| 表名 | 说明 |
|------|------|
| `base_dict_customer_bank` [base_dict_customer_bank.sql](./reference/base_dict_customer_bank.sql) | 客户工资所属银行字典 |
| `base_dict_customer_competing` [base_dict_customer_competing.sql](./reference/base_dict_customer_competing.sql) | 客户竞品字典 |
| `base_dict_customer_group` [base_dict_customer_group.sql](./reference/base_dict_customer_group.sql) | 客户集团信息表 |
| `base_dict_customer_industry` [base_dict_customer_industry.sql](./reference/base_dict_customer_industry.sql) | 客户所属行业 |
| `base_dict_customer_maincode` [base_dict_customer_maincode.sql](./reference/base_dict_customer_maincode.sql) | 客户主体编码 |
| `base_dict_customer_nature` [base_dict_customer_nature.sql](./reference/base_dict_customer_nature.sql) | 客户单位性质 |
| `base_dict_customer_position` [base_dict_customer_position.sql](./reference/base_dict_customer_position.sql) | 决策人职位 |
| `base_dict_customer_project_chance` [base_dict_customer_project_chance.sql](./reference/base_dict_customer_project_chance.sql) | 项目机会 |
| `base_dict_customer_source` [base_dict_customer_source.sql](./reference/base_dict_customer_source.sql) | 客户来源 |
| `base_dict_customer_supplier` [base_dict_customer_supplier.sql](./reference/base_dict_customer_supplier.sql) | 客户供应商 |

### 合同相关字典

| 表名 | 说明 |
|------|------|
| `base_dict_contract_status` [base_dict_contract_status.sql](./reference/base_dict_contract_status.sql) | 合同签署状态 |
| `base_dict_contract_type` [base_dict_contract_type.sql](./reference/base_dict_contract_type.sql) | 合同类型 |

### 财务相关字典

| 表名 | 说明 |
|------|------|
| `base_dict_account` [base_dict_account.sql](./reference/base_dict_account.sql) | 收款账户 |
| `base_dict_bill_content` [base_dict_bill_content.sql](./reference/base_dict_bill_content.sql) | 开票商品编码 |
| `base_dict_budget` [base_dict_budget.sql](./reference/base_dict_budget.sql) | 年预算 |
| `base_dict_cost_type` [base_dict_cost_type.sql](./reference/base_dict_cost_type.sql) | 费用类别 |
| `base_dict_payment_form` [base_dict_payment_form.sql](./reference/base_dict_payment_form.sql) | 付款形式 |
| `base_dict_payment_period` [base_dict_payment_period.sql](./reference/base_dict_payment_period.sql) | 付款周期 |
| `base_dict_payment_type` [base_dict_payment_type.sql](./reference/base_dict_payment_type.sql) | 付款方式 |
| `base_dict_expend_type` [base_dict_expend_type.sql](./reference/base_dict_expend_type.sql) | 费用支出类型 |

### 就业/产品相关字典

| 表名 | 说明 |
|------|------|
| `base_dict_brand` [base_dict_brand.sql](./reference/base_dict_brand.sql) | 品牌 |
| `base_dict_business_type` [base_dict_business_type.sql](./reference/base_dict_business_type.sql) | 业务类型 |
| `base_dict_employ_type` [base_dict_employ_type.sql](./reference/base_dict_employ_type.sql) | 就业类型 |
| `base_dict_job` [base_dict_job.sql](./reference/base_dict_job.sql) | 工作岗位 |
| `base_dict_product` [base_dict_product.sql](./reference/base_dict_product.sql) | 产品 |
| `base_dict_service_type` [base_dict_service_type.sql](./reference/base_dict_service_type.sql) | 服务类型 |
| `base_dict_store_type` [base_dict_store_type.sql](./reference/base_dict_store_type.sql) | 基地类型 |

### 政策相关字典

| 表名 | 说明 |
|------|------|
| `base_dict_policy_social` [base_dict_policy_social.sql](./reference/base_dict_policy_social.sql) | 社会保险比例 |
| `base_dict_social_security` [base_dict_social_security.sql](./reference/base_dict_social_security.sql) | 社保缴纳基数 |
| `base_dict_social_security_city` [base_dict_social_security_city.sql](./reference/base_dict_social_security_city.sql) | 社保地区 |
| `base_dict_social_security_fund` [base_dict_social_security_fund.sql](./reference/base_dict_social_security_fund.sql) | 公积金基数 |
| `base_dict_cbj_area` [base_dict_cbj_area.sql](./reference/base_dict_cbj_area.sql) | 残保金地区名单 |
| `base_dict_cbj_fund` [base_dict_cbj_fund.sql](./reference/base_dict_cbj_fund.sql) | 残保金缴纳基数 |

### 其他字典

| 表名 | 说明 |
|------|------|
| `base_dict_region` [base_dict_region.sql](./reference/base_dict_region.sql) | 省市区县 |
| `base_dict_area_store` [base_dict_area_store.sql](./reference/base_dict_area_store.sql) | 地区表(被53张表引用) |
| `base_dict_express` [base_dict_express.sql](./reference/base_dict_express.sql) | 物流公司 |
| `base_dict_homeland` [base_dict_homeland.sql](./reference/base_dict_homeland.sql) | 温馨家园 |
| `base_dict_recommender` [base_dict_recommender.sql](./reference/base_dict_recommender.sql) | 关系户 |
| `base_dict_report_type` [base_dict_report_type.sql](./reference/base_dict_report_type.sql) | 月报类型 |
| `base_dict_seal_type` [base_dict_seal_type.sql](./reference/base_dict_seal_type.sql) | 印章类别 |
| `base_dict_subsidy_type` [base_dict_subsidy_type.sql](./reference/base_dict_subsidy_type.sql) | 补贴类型 |
| `base_dict_system` [base_dict_system.sql](./reference/base_dict_system.sql) | 系统字典 |
| `base_dict_permissions` [base_dict_permissions.sql](./reference/base_dict_permissions.sql) | 权限 |

### 审批相关字典

| 表名 | 说明 |
|------|------|
| `base_dict_approval` | 国华审批模板表 |
| `base_dict_approval_status` | 企业微信审批状态字典表 |

### 就业/服务相关字典（补充）

| 表名 | 说明 |
|------|------|
| `base_dict_accrued_risk_ratio` | 就业管理系统-风险金计提字典表 |
| `base_dict_activity_web` | 服务关联温馨家园网站字典表 |
| `base_dict_contact_type` | 联系人类型字典表 |
| `base_dict_emp_product_option` | 就业标准化产品通用选项字典表 |
| `base_dict_job_level` | 民族表 |
| `base_dict_persons_files_type` | 就业管理系统-电子附件类型字典表 |
| `base_dict_product_load` | 产品字典表（加载项） |
| `base_dict_service_department` | 外企服务部门表 |
| `base_dict_service_line` | 业务线字典 |
| `base_dict_social_salary` | 收款账户字典表 |
| `base_dict_special_event_files_type` | 就业管理系统-事件附件类型字典表 |
| `base_dict_special_event_type` | 就业管理系统-事件类型字典表 |
| `base_dict_special_event_type_load` | 就业管理系统-事件类型字典表（加载项） |
| `base_dict_special_event_type_tips` | 就业管理系统-事件类型提示字典表 |
| `base_dict_switch` | 就业资料开关配置表 |
| `base_dict_tax_rules_type` | 就业管理系统-报税规则字典表 |

### 区域/目标相关字典

| 表名 | 说明 |
|------|------|
| `base_dict_region_data1` | 省市区县表 |
| `base_dict_target_area` | 区域表 |
| `base_dict_target_center` | 中心表 |
| `base_dict_target_type` | 目标表格类型字典表 |
| `base_dict_verify_source_logo` | 验证来源logo表 |
| `base_dict_wanda_area` | 万达区域 |
| `base_dict_wanda_persons_month` | 万达人员月 |
| `base_dict_xiaomi_persons_month` | 小米人员月 |

### 助益行相关字典

| 表名 | 说明 |
|------|------|
| `base_dict_ens_activity_points_type` | 助益行活动类型积分表 |
| `base_dict_ens_activity_type` | 助益行活动类型表 |
| `base_dict_report_option_type` | 选项类型表 |

> **注**: `base_dict` 为基地字典表（最基础的基地字典，被众多表引用）。
