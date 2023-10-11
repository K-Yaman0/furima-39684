## users テーブル

| Column                  | Type   | Options                   |
| ----------------------- | ------ | ------------------------- |
| nickname                | string | null: false               |
| email                   | string | null: false, unique: true |
| encrypted_password      | string | null: false               |
| last_name               | string | null: false               |
| first_name              | string | null: false               |
| last_name_kana          | string | null: false               |
| first_name_kana         | string | null: false               |
| birthday                | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| description          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| item_condition_id    | integer    | null: false                    |
| freight_id           | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| ship_date_id         | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

##　ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

##　addressesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| block              | string     | null: false                    |
| building           | string     |                                |
| phone_number       | integer    | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order