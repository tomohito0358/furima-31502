# README

## usersテーブル

| Column                 | Type    | Options     |
| ---------------------- | ------- | ------------|
| nickname               | string  | null: false |
| mail_address           | text    | null: false |
| password               | string  | null: false |
| password_confirmation  | string  | null: false |

## profilesテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ------------|
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_read | string  | null: false |
| last_name_read  | string  | null: false |
| birth_day       | date    | null: false |

## itemsテーブル

| Column           | Type          | Options     |
| -----------      | ------------- | ----------- |
| item             | text          | null: false |
| date_of_shipment | string        | null: false |
| category         | string        | null: false | 
| status           | text          | null: false |
| location         | references    | null: false |

## commentsテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references | null: false |
| prototype | references | null: false |

## buysテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| item_name | strings    | null: false |

## shopping_datesテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| nickname        | strings    | null: false |
| shopping_address | text       | null: false |

