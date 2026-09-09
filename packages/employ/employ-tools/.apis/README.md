# 接口文档索引

本目录包含国华就业管理系统的核心查询接口文档，每个接口对应一份独立文档。

| 序号 | 接口名称 | 请求方式 | 接口路径 | 文档 |
| --- | --- | --- | --- | --- |
| 01 | 基地查询接口 | GET | `/employ/store/list` | [01-基地查询接口.md](./01-基地查询接口.md) |
| 02 | 人员查询接口 | GET | `/employ/persons` | [02-人员查询接口.md](./02-人员查询接口.md) |
| 03 | 合同查询接口 | GET | `/contract` | [03-合同查询接口.md](./03-合同查询接口.md) |
| 04 | 线索查询接口 | GET | `/employ/customer/opt/clue` | [04-线索查询接口.md](./04-线索查询接口.md) |

## 通用约定

- **认证方式**：请求头携带 `token`（登录令牌），部分接口还需 `system-id` 请求头用于解析角色权限。
- **服务端口**：本地默认 `9300`（`settings` 中 `API_PORT`）。
- **统一响应结构**：

```json
{
  "code": 0,
  "timestamp": 1712345678,
  "message": "请求成功",
  "data": {},
  "errors": {},
  "request_id": 17123456780000000
}
```

| 字段 | 类型 | 说明 |
| --- | --- | --- |
| code | int | `0` 成功，`1` 失败，`2` 业务异常，`500` 服务异常 |
| timestamp | int | 服务器时间戳 |
| message | string | 提示信息 |
| data | object | 业务数据（分页结构 `{count, pageSize, list}`） |
| errors | object | 表单校验错误 |
| request_id | number | 请求追踪 ID |

## 相关源码位置

- 基地：`apps/store/views.py` + `module/mysql/guohua/EmployStoreDbModel.py`
- 人员：`apps/persons/views.py` + `module/mysql/guohua/PersonsDbModel.py`
- 合同：`apps/contract/views.py` + `module/mysql/guohua/ContractDbModel.py`
- 线索：`apps/customer/views.py` + `module/mysql/guohua/CustomerDbModel.py`
