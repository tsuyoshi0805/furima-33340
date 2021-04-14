# README

# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| image            | string |             |
| introduction     | text   |             |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |



## card テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| user_id     | integer    | null: false,foreign_key:true   |
| customer_id | string     | null: false                    |
| card_id     | string     | null: false                    |



## destination テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| user_id          | integer    | null: false,foreign_key:true   |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| post_code        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     |                                |


## product テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | string     | null: false                    |
| description      | string     | null: false                    |
| status           | string     | null: false                    |
| shipping_cost    | string     | null: false                    |
| shipping_days    | string     | null: false                    |
| prefecture_id    | string     | null: false                    |
| judgment         | string     |                                |
| category_id      | string     | null: false,foreign_key:true   |
| brand_id         | string     | null: false,foreign_key:true   |
| shipping_id      | string     | null: false,foreign_key:true   |
| user_id          | string     | null: false,foreign_key:true   |


## brand　テーブル
| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| name        | string     | index:true                     |


## image テーブル
| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| image       | string     | null: false                    |
| product_id  | integer    | null: false,foreign_key:true   |

## category　テーブル
| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| ancestry    | string     |                                |

