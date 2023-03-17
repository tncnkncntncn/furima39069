# テーブル設計

## users

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| id                 | integer| not null, primary key    |
| name               | string | null: false              |
| name_kana          | string | null:false               |
| email              | string | null: false,unique :true |
| encrypted_password | string | null: false              |
| birth_date         | date   | null:false               |

- has_many:items
- has_many:purchases


## items 

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| id         | integer    | not null, primary key          |
| user_id    | integer    | not null, foreign key          |
| name       | string     | null:false                     |
|description | references | null: false,                   |
|user        | references | null: false, foreign_key: true |
|category    | enum       | null:false                     |
|condition   | enum       | null: false                    |
|shipping    | enum       | null: false                    |
| region     | enum       | null:false                     |
|days_to_ship| int        | null: false, foreign_key: true |

- belongs_to:users
- has_many :purchases

## purchases 

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| id          | integer    | not null, primary key          |
| user_id     | integer    | not null, foreign key          |
| item_id     | integer     | not null, foreign key         |

- belongs_to :user
- belongs_to :item
