
# テーブル設計

## users テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| name               | string  | null: false                    |
| email              | string  | null: false                    |
| encrypted_password | string  | null: false                    |
| skill              | string  |                                |
| position           | string  |                                |
| profile            | text    |                                |

### Association
- has_many :seed
- has_many :messages
- has_many :rooms, through: entries

## seeds テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| title           | string     | null: false                   |
| tag             | string     | null: false                   |
| idea            | text       | null: false                   |
| user            | references | null: false, foreign_key: true|

### Association
- belongs_to :users
- has_one :room

## rooms テーブル

| Column | Type   | Options     |
| ------ | -------| ----------- |
| name   | string | null: false |


### Association

- has_many :entries
- has_many :users, through: entries
- has_many :messages


## entry テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

