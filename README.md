# README

# テーブル設計

## users テーブル

| Column                 | Type       | Options                      |
| ---------------        | ------     | ---------------------------- |
| nickname               | string     | null: false                  |
| email                  | string     | null: false,unique: true     |
| encrypted_password     | string     | null: false                  |
| family_name            | string     | null: false                  |
| first_name             | string     | null: false                  |
| family_name_kana       | string     | null: false                  |
| first_name_kana        | string     | null: false                  |
| birthday               | date       | null: false                  |
| Purchase_management_id | integer    | null: false,foreign_key:true |

### Association
* has_many :products dependent :destroy
*  belongs_to :purchase_management dependent :destroy



## destinations テーブル

| Column                 | Type       | Options                        |
| -------                | ---------- | ------------------------------ |
| post_code              | string     | null: false                    |
| shipping_area_id       | integer    | null: false                    |
| city                   | string     | null: false                    |
| address                | string     | null: false                    |
| building_name          | string     |                                |
| phone_number           | string     | null: false                    |
| purchase_management_id | integer    | null: false,foreign_key:true   |

### Association
*  belongs_to :purchase_management dependent :destroy



## products テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| status_id        | integer    | null: false,foreign_key:true   |
| shipping_cost_id | integer    | null: false,foreign_key:true   |
| shipping_days_id | integer    | null: false,foreign_key:true   |
| category_id      | integer    | null: false,foreign_key:true   |
| shipping_area_id | integer    | null: false,foreign_key:true   |
| user_id          | integer    | null: false,foreign_key:true   |

### Association
*  belongs_to :user dependent :destroy
*  has_one :purchase_management dependent :destroy

## Purchase_managements テーブル
| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| user_id     | integer    | null: false,foreign_key:true   |
| product_id  | integer    | null: false,foreign_key:true   |

### Association
*  belongs_to :product dependent :destroy
*  belongs_to :user dependent :destroy
*  has_one :destination dependent :destroy