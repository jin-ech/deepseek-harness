# 八、助益行小程序域

## 8.1 核心表 (guohua_ens_*)

| 表名 | 说明 |
|------|------|
| `guohua_ens_persons` [guohua_ens_persons.sql](./reference/guohua_ens_persons.sql) | 助益行企业用户表 |
| `guohua_ens_activity` [guohua_ens_activity.sql](./reference/guohua_ens_activity.sql) | 助益行活动表 |
| `guohua_ens_works` [guohua_ens_works.sql](./reference/guohua_ens_works.sql) | 助益行残疾人作品表 |
| `guohua_ens_banner` [guohua_ens_banner.sql](./reference/guohua_ens_banner.sql) | 小程序banner |
| `guohua_ens_settings` [guohua_ens_settings.sql](./reference/guohua_ens_settings.sql) | 小程序配置表 |
| `guohua_ens_theme` [guohua_ens_theme.sql](./reference/guohua_ens_theme.sql) | 小程序主题表 |
| `guohua_ens_activity_sign` [guohua_ens_activity_sign.sql](./reference/guohua_ens_activity_sign.sql) | 活动企业报名 |
| `guohua_ens_activity_company_sign` [guohua_ens_activity_company_sign.sql](./reference/guohua_ens_activity_company_sign.sql) | 活动企业报名 |
| `guohua_ens_points_order` [guohua_ens_points_order.sql](./reference/guohua_ens_points_order.sql) | 礼品兑换订单 |
| `guohua_ens_persons_receive` [guohua_ens_persons_receive.sql](./reference/guohua_ens_persons_receive.sql) | 用户收货地址 |
| `guohua_ens_persons_recommend_job` [guohua_ens_persons_recommend_job.sql](./reference/guohua_ens_persons_recommend_job.sql) | 推荐岗位 |
| `guohua_ens_persons_product_buy_record` [guohua_ens_persons_product_buy_record.sql](./reference/guohua_ens_persons_product_buy_record.sql) | 劳动产品购买记录 |
| `guohua_ens_customer_gift` [guohua_ens_customer_gift.sql](./reference/guohua_ens_customer_gift.sql) | 企业商城礼品 |

## 8.2 活动系统

| 表名 | 说明 |
|------|------|
| `guohua_activity_them` [guohua_activity_them.sql](./reference/guohua_activity_them.sql) | 活动主题配置 |
| `guohua_activity_stage` [guohua_activity_stage.sql](./reference/guohua_activity_stage.sql) | 主题关卡 |
| `guohua_activity_game_list` [guohua_activity_game_list.sql](./reference/guohua_activity_game_list.sql) | 活动游戏 |
| `guohua_activity_question` [guohua_activity_question.sql](./reference/guohua_activity_question.sql) | 活动题目 |
| `guohua_activity_question_option` [guohua_activity_question_option.sql](./reference/guohua_activity_question_option.sql) | 题目选项 |
| `guohua_activity_record` [guohua_activity_record.sql](./reference/guohua_activity_record.sql) | 活动记录 |
| `guohua_activity_photo` [guohua_activity_photo.sql](./reference/guohua_activity_photo.sql) | 活动拍照附件 |

关联表：
| 表名 | 说明 |
|------|------|
| `guohua_rel_activity_game` [guohua_rel_activity_game.sql](./reference/guohua_rel_activity_game.sql) | 关卡游戏关联 |
| `guohua_rel_activity_question` [guohua_rel_activity_question.sql](./reference/guohua_rel_activity_question.sql) | 关卡题目关联 |
| `guohua_rel_activity_question_option` [guohua_rel_activity_question_option.sql](./reference/guohua_rel_activity_question_option.sql) | 题目选项关联 |
| `rel_activity_game_persons` [rel_activity_game_persons.sql](./reference/rel_activity_game_persons.sql) | 游戏人员完成 |
| `rel_activity_photo_persons` [rel_activity_photo_persons.sql](./reference/rel_activity_photo_persons.sql) | 拍照人员完成 |
| `rel_activity_question_persons` [rel_activity_question_persons.sql](./reference/rel_activity_question_persons.sql) | 题目人员完成 |

## 8.3 助益行关联 (rel_ens_*)

| 表名 | 说明 |
|------|------|
| `rel_ens_activity_persons_collect` [rel_ens_activity_persons_collect.sql](./reference/rel_ens_activity_persons_collect.sql) | 志愿者活动收藏 |
| `rel_ens_activity_persons_points` [rel_ens_activity_persons_points.sql](./reference/rel_ens_activity_persons_points.sql) | 志愿者活动积分 |
| `rel_ens_activity_persons_points_exchange` [rel_ens_activity_persons_points_exchange.sql](./reference/rel_ens_activity_persons_points_exchange.sql) | 积分兑换记录 |
| `rel_ens_activity_persons_cert` [rel_ens_activity_persons_cert.sql](./reference/rel_ens_activity_persons_cert.sql) | 活动证书 |
| `rel_ens_activity_enterprise_points` [rel_ens_activity_enterprise_points.sql](./reference/rel_ens_activity_enterprise_points.sql) | 企业活动积分 |
| `rel_ens_activity_banner` [rel_ens_activity_banner.sql](./reference/rel_ens_activity_banner.sql) | 活动banner关联 |
| `rel_ens_gift_persons_collect` [rel_ens_gift_persons_collect.sql](./reference/rel_ens_gift_persons_collect.sql) | 礼品收藏 |
| `rel_ens_works_persons_collect` [rel_ens_works_persons_collect.sql](./reference/rel_ens_works_persons_collect.sql) | 作品收藏 |
| `rel_ens_persons_product_buy_record_audit` [rel_ens_persons_product_buy_record_audit.sql](./reference/rel_ens_persons_product_buy_record_audit.sql) | 购买审核 |
| `rel_ens_persons_recommend_job_audit` [rel_ens_persons_recommend_job_audit.sql](./reference/rel_ens_persons_recommend_job_audit.sql) | 推荐岗位审核 |

## 8.4 助益行关系图

```
guohua_ens_persons
    ├──► guohua_ens_persons_receive (1:N)
    ├──► guohua_ens_persons_recommend_job (1:N)
    ├──► guohua_ens_persons_product_buy_record (1:N)
    └──► rel_ens_activity_persons_collect (1:N)

guohua_ens_activity
    ├──► guohua_ens_activity_sign (1:N)
    ├──► rel_ens_activity_persons_collect (1:N)
    └──► rel_ens_activity_enterprise_points (1:N)

guohua_activity_them
    └──► guohua_activity_stage (1:N)
            └──► guohua_activity_game_list (1:N)
                    └──► guohua_activity_question (1:N)
                            └──► guohua_activity_question_option (1:N)
```
