# README

# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birth_date         | date       | null: false                    |

### Association

- has_many :items
- has_many :payments

## items テーブル

| Column                 | Type        | Options                        |
| ---------------------- | ----------- | ------------------------------ |
| name                   | string      | null: false                    |
| info                   | text        | null: false                    |
| price                  | integer     | null: false                    |
| category_id            | integer     | null: false                    |
| sales_status_id        | integer     | null: false                    |
| shipping_fee_status_id | integer     | null: false                    |
| prefecture_id          | integer     | null: false                    |
| scheduled_delivery_id  | integer     | null: false                    |
| user                   | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :payment

## payments テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| item          | references  | null: false, foreign_key: true |
| user          | references  | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :payment_infomation

## payment_infomations テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| postal_code   | string      | null: false                    |
| prefecture_id | integer     | null: false                    |
| city          | string      | null: false                    |
| address       | string      | null: false                    |
| building      | string      |                                |
| phone_number  | string      | null: false                    |
| payment       | references  | null: false, foreign_key: true |

### Association

- belongs_to :payment