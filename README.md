# テーブル設計

## users

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| id                 | integer| not null, primary key    |
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

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| id         | integer    | not null, primary key          |
| name       | string     | null:false                     |
| price      | integer    | null:false                     |
|description | text       | null: false,                   |
|user        | references | null: false, foreign_key: true |
|category    | integer    | null:false                     |
|condition   | integer    | null: false                    |
|shipping    | integer    | null: false                    |
| region     | integer    | null:false                     |
|days_to_ship| integer    | null: false                    |

- has_one :order
- belongs_to:user


## orders

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| id          | integer    | not null, primary key :true   |
| user        | references | not null, foreign key :true   |
| item        | references | not null, foreign key :true   |

- belongs_to :user
- belongs_to :item
- has_one :order


## addresses

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| id          | integer    | not null, primary key          |
|postal_code  |string      | not_null                        |
|prefecture_id| integer    | not_null                        |
|city         |string      | not_null                        |
|street       | string     | not_null                        |
| building    |string      |                                |
| phone_number| integer    | null: false                    |
|order_history|references|not_null,foreign_key: true     |

- belongs_to :order















