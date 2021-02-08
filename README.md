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
has_many :item


## itemsテーブル

| Column              | Type           | Options     |
| -----------         | -------------  | ----------- |
| name                | string         | null: false |
| introduction_id     | text           | null: false |
| category_id         | integer        | null: false | 
| status_id           | integer        | null: false |
| shipping_fee_burden | integer        | null: false | 
| shipment_source_id  | integer        | null: false |
| date_of_shipment_id | integer        | null: false |
| price_id            | integer        | null: false | 
| shipping_id         | integer        | null: false | 
|prefecture           | string         | null: false |
## Association
belongs_to :user


## commentsテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references | null: false |
## Association
belongs_to :user

## buysテーブル

| Column         | Type       | Options           |
| ---------      | ---------- | ------------------|
| price_id       | integer    | foreign_key: true |
| nickname       | string     | null: false       |
| category_id    | integer    | foreign_key: true |
| status_id      | integer    | foreign_key: true |
| location_id    | integer    | foreign_key: true |
| shipping_id    | integer    | foreign_key: true |
## Association
has_one :user



## shopping_datesテーブル

| Column         | Type       | Options           |
| ---------------| ---------- | -----------       |
|postal_code     | string     | null: false       |
|prefecture      | string     | null: false       |
|city            | string     | null: false       |
|address_number  | string     | null: false       |
|name_of_building| string     |                   |
|tell            | integer    | null: false       |
## Association
belongs_to :user