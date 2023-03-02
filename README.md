
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
| birthday           | date   | null: false                    |

### Association

- has_many :items
- has_many :after_sales



## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| items_name         | string     | null: false                    |
| explain            | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| tax_id             | integer    | null: false                    |
| from_prefecture_id | integer    | null: false                    |
| schedule_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :after_sale



## after_sales テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| item               |references | null: false, foreign_key: true |
| user               |references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :send_address



## send_addresses テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| post_code          |string     | null: false                    |      
| from_prefecture_id | integer    | null: false                    |
| to_city            |string     | null: false                    |
| to_house_number    |string     | null: false                    |
| to_building_name   |string     |                                |
| to_telephone_number|string     | null: false                    |
| after_sale         |references | null: false, foreign_key: true |


### Association

- belongs_to :after_sale

