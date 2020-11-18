# README

# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |

### Association

- has_many :items
- has_many :payments
- has_one  :users_profile

## users-profile テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| birth_date      | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## items テーブル

| Column  | Type        | Options                        |
| ------- | ----------- | ------------------------------ |
| image   | string      | null: false                    |
| name    | string      | null: false                    |
| info    | text        | null: false                    |
| price   | integer     | null: false                    |
| user_id | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :items_profile
- has_one    :payments

## items-profile テーブル

| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| category            | string      | null: false                    |
| sales_status        | string      | null: false                    |
| shipping_fee_status | string      | null: false                    |
| prefecture          | string      | null: false                    |
| scheduled_delivery  | integer     | null: false                    |
| item_id             | references  | null: false, foreign_key: true |

### Association

- belongs_to :item

## payments テーブル

| Column    | Type        | Options                        |
| --------- | ----------- | ------------------------------ |
| number    | integer     | null: false                    |
| exp-month | integer     | null: false                    |
| exp-year  | integer     | null: false                    |
| cvc       | integer     | null: false                    |
| user_id   | references  | null: false, foreign_key: true |
| item_id   | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :payments_adress

## payments-adress テーブル

| Column       | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| postal_code  | integer     | null: false                    |
| prefecture   | string      | null: false                    |
| city         | string      | null: false                    |
| address      | string      | null: false                    |
| building     | string      | null: false                    |
| phone_number | integer     | null: false                    |
| item_pay_id  | references  | null: false, foreign_key: true |

### Association

- belongs_to :payment