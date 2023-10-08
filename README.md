## users テーブル

| Column                  | Type   | Options                   |
| ----------------------- | ------ | ------------------------- |
| nickname                | string | null: false               |
| email                   | string | null: false, unique: true |
| password                | string | null: false               |
| password_confirmation   | string | null: false               |
| last_name               | string | null: false               |
| first_name              | string | null: false               |
| last_name_kana          | string | null: false               |
| first_name_kana         | string | null: false               |
| birthday                | date   | null: false               |

### Association

- has_many :items
- has_many :orders
- has_one :address


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| text               | text       | null: false                    |
| category           | string     | null: false                    |
| item_status        | string     | null: false                    |
| freight            | string     | null: false                    |
| region             | string     | null: false                    |
| ship_date          | string     | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :order

##　ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
| address            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

##　addressテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| ship_to_address    | string     | null: false                    |
| ship_address       | string     | null: false                    |
| ship_city          | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order