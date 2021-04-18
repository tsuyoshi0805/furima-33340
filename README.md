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
* has_many :product dependent :destroy
* belongs_to :destination dependent :destroy


## destination テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |

### Association
*  belongs_to :user dependent :destroy



## product テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| status           | string     | null: false                    |
| shipping_cost    | string     | null: false                    |
| shipping_days    | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| brand_id         | integer    | null: false                    |
| shipping_id      | integer    | null: false                    |
| user_id          | integer    | null: false                    |

### Association
*  belongs_to :user dependent :destroy


## Purchase_managements テーブル
| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| user_id     | integer    | null: false                    |
| item_id     | integer    | null: false                    |

### Association
*  belongs_to :product dependent :destroy
