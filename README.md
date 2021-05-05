# README

# テーブル設計

## users テーブル

| Column                 | Type       | Options                      |
| ---------------        | ------     | ---------------------------- |
| nickname               | string     | null: false                  |
| email                  | string     | null: false,unique:true      |
| encrypted_password     | string     | null: false                  |
| family_name            | string     | null: false                  |
| first_name             | string     | null: false                  |
| family_name_kana       | string     | null: false                  |
| first_name_kana        | string     | null: false                  |
| birthday               | date       | null: false                  |


### Association
* has_many :products dependent :destroy
* has_many :purchase_managements dependent :destroy



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
*  belongs_to :purchase_management 



## items テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| status_id        | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| user_id          | integer    | null: false,foreign_key:true   |

### Association
*  has_one :purchase_management dependent :destroy
*  belongs_to :user 

## Purchase_managements テーブル
| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| user_id     | integer    | null: false,foreign_key:true   |
| product_id  | integer    | null: false,foreign_key:true   |

### Association
*  belongs_to :product 
*  belongs_to :user 
*  has_one :destination dependent :destroy