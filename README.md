# PhotoSpaceのテーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |

has_many :prototype
has_many :messages

## prototype テーブル

| Column      | Type      | Options     |
| ------      | ------    | ----------- |
| title       | string    | null: false |
| catch_copy  | text      | null: false |
| concept     | text      | null: false |
| user        | reference | null: false |

has_many :messages
belongs_to :users

## comments テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| content    | text       | null: false                               |
| prototype  | references | null: false, foreign_key: true |
| room       | references | null: false, foreign_key: true |

belongs_to :users
belongs_to :prototype