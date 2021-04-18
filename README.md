# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                      |
| ---------------    | ------ | ---------------------------- |
| nickname           | string | null: false                  |
| email              | string | null: false,uniqueness: true |
| encrypted_password | string | null: false                  |
| family_name        | string | null: false                  |
| first_name         | string | null: false                  |
| family_name_kana   | string | null: false                  |
| first_name_kana    | string | null: false                  |
| birthday           | date   | null: false                  |

### Association
* has_many :products dependent :destroy
* belongs_to :destinations dependent :destroy


## destinations テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |

### Association
*  belongs_to :purchase_managements dependent :destroy



## products テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| status           | string     | null: false                    |
| shipping_cost    | string     | null: false                    |
| shipping_days    | string     | null: false                    |
| category         | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| user_id          | string     | null: false,foreign_key:true   |

### Association
*  belongs_to :user dependent :destroy


## Purchase_managements テーブル
| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| user_id     | reference  | foreign_key: true              |
| item_id     | reference  | foreign_key: true              |

### Association
*  belongs_to :products dependent :destroy
*  belongs_to :user dependent :destroy
*  belongs_to :destination dependent :destroy