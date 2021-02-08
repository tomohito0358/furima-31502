# README

## usersテーブル

| Column                 | Type    | Options     |
| ---------------------- | ------- | ------------|
| nickname               | string  | null: false |
| first_name             | string  | null: false |
| last_name              | string  | null: false |
| first_name_read        | string  | null: false |
| last_name_read         | string  | null: false |
| email                  | string  | unique: true|
| encrypted_password     | string  | null: false |
| birth_day              | date    | null: false |

## Association
has_many :items
has_many :comments
has_one :buys


## itemsテーブル
| Column              | Type           | Options     |
| -----------         | -------------  | ----------- |
| name                | string         | null: false |
| introduction        | text           | null: false |
| category_id         | integer        | null: false | 
| status_id           | integer        | null: false |
| date_of_shipment_id | integer        | null: false |
| price               | integer        | null: false | 
| shipping_id         | integer        | null: false | 
| prefecture_id       | string         | null: false |

## Association
belongs_to :user
hsa_many :comments


## commentsテーブル
| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references | null: false |

## Association
belongs_to :user


## buysテーブル
| Column         | Type       | Options                        |
| ---------      | ---------- | -------------------------------|
| user_id        | integer    | null: false, foreign_key: true |
| item_id        | integer    | null: false, foreign_key: true |

## Association
belongs_to :item
belongs_to :user


## shopping_datesテーブル
| Column         | Type       | Options           |
| ---------------| ---------- | -----------       |
|postal_code     | string     | null: false       |
|prefecture_id   | integer    | null: false       |
|city            | string     | null: false       |
|address_number  | string     | null: false       |
|name_of_building| string     |                   |
|tell            | integer    | null: false       |

## Association
belongs_to :user
belongs_to :item




<!-- | category_id    | integer    | foreign_key: true              |
| status_id      | integer    | foreign_key: true              |
| location_id    | integer    | foreign_key: true              |
| shipping_id    | integer    | foreign_key: true              | -->