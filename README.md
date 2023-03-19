# テーブル設計

## users

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nick_name          | string | null: false              |
| first_name         | string | null: false              |
| first_name_kana    | string | null:false               |
| name               | string | null: false              |
| name_kana          | string | null:false               |
| email              | string | null: false,unique :true |
| encrypted_password | string | null: false              |
| birth_date         | date   | null:false               |

- has_many:items
- has_many:orders


## items 

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null:false                     |
| price         | integer    | null:false                     |
|description    | text       | null: false,                   |
|category_id    | integer    | null:false                     |
|condition_id   | integer    | null: false                    |
|shipping_id    | integer    | null: false                    |
|region_id      | integer    | null:false                     |
|days_to_ship_id| integer    | null: false                    |
|user           | references | null: false, foreign_key: true |

- has_one :order
- belongs_to:user


## orders

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| user        | references | null:false, foreign key :true   |
| item        | references | null:false, foreign key :true   |

- belongs_to :user
- belongs_to :item
- has_one :order


## addresses

| Column      | Type       | Options                      |
| ------------| ---------- | ---------------------------- |
|postal_code  |string      | null:false                   |
|region_id    |integer     | null:false                   |
|city         |string      | null:false                   |
|street       |string      | null:false                   |
| building    |string      |                              |
| phone_number|string      | null: false                  |
| order       |references  |not_null,foreign_key: true    |

- belongs_to :order















