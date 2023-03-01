
## users テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| email              | string | null: false, unique: true      |
| encrypted_password | string | null: false                    |
| last_name          | string | null: false                    |
| first_name         | string | null: false                    |
| last_name_kana     | string | null: false                    |
| first_name_kana    | string | null: false                    |
| birth_year         | string | null: false                    |
| birth_month        | string | null: false                    |
| birth_date         | string | null: false                    |

### Association

- has_many :items
- has_many :after_sales



## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| items_name         | string    | null: false                    |
| explain            | text      | null: false                    |
| category           | string    | null: false                    |
| condition          | string    | null: false                    |
| tax                | string    | null: false                    |
| from_prefecture    | string    | null: false                    |
| schedule_day       | string    | null: false                    |
| price              | string    | null: false                    |
| seller_user_id     |references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :after_sale



## after_sales テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| items_name         |references | null: false, foreign_key: true |
| buyer_user_id      |references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :send_address



## send_address テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| post_code          |string     | null: false                    |      
| to_prefecture      |string     | null: false                    |
| to_city            |string     | null: false                    |
| to_house_number    |string     | null: false                    |
| to_building_name   |string     |                                |
| to_telephone_number|string     | null: false                    |
| after_sales        |references | null: false, foreign_key: true |


### Association

- belongs_to :after_sale

