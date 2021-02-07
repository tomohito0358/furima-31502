# README

## usersテーブル

| Column                 | Type    | Options     |
| ---------------------- | ------- | ------------|
| nickname               | string  | null: false |
| first_name             | string  | null: false |
| last_name              | string  | null: false |
| first_name_read        | string  | null: false |
| last_name_read         | string  | null: false |
| email                  | string    | null: false |
| encrypted_password     | string  | null: false |
| birth_day              | date    | null: false |

## itemsテーブル

| Column              | Type          | Options     |
| -----------         | ------------- | ----------- |
| name                | string         | null: false |
| date_of_shipment-id | integer        | null: false |
| category-id         | integer        | null: false | 
| status-id           | integer        | null: false |
| location-id         | integer        | null: false |
| Shipping-id         | integer        | null: false | 

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
| nickname         | strings    | null: false |
| shopping_address | text       | null: false |
