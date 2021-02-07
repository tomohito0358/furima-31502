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

## itemsテーブル

| Column              | Type           | Options     |
| -----------         | -------------  | ----------- |
| name                | string         | null: false |
| introduction_id     | integer        | null: false |
| category_id         | integer        | null: false | 
| status_id           | integer        | null: false |
| shipping_fee_burden | integer        | null: false | 
| shipment source_id  | integer        | null: false |
| date_of_shipment_id | integer        | null: false |
| price_id            | integer        | null: false | 
| shipping_id         | integer        | null: false | 

## commentsテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references | null: false |
| prototype | references | null: false |

## buysテーブル

| Column         | Type       | Options           |
| ---------      | ---------- | ------------------|
| price_id       | integer    | foreign_key: true |
| nickname       | string     | foreign_key: true |
| user           | strings    | foreign_key: true |
| item           | strings    | foreign_key: true |
| category_id    | integer    | foreign_key: true |
| status_id      | integer    | foreign_key: true |
| location_id    | integer    | foreign_key: true |
| shipping_id    | integer    | foreign_key: true |


## shopping_datesテーブル

| Column         | Type       | Options           |
| ---------------| ---------- | -----------       |
|credit_card     | strings    | null: false       |
|expiration_date | strings    | null: false       |
|security_code   | strings    | null: false       |
|postal_code     | strings    | null: false       |
|prefecture      | strings    | null: false       |
|city            | strings    | null: false       |
|address_number  | strings    | null: false       |
|name_of_building| strings    |                   |
|tell            | integer    | null: false       |
