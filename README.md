# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|fullname|string|null: false|
|fullname_katakana|string|null: false|
|phone_number|integer |null: false|
|birthday|integer |null: false|
### Association
- has_many :products 
- has_many :comments
- has_many :likes
- has_many :addresses
- has_many :cards

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|name|string|null: false|
|details|string|null: false|
|categories|string|null: false|
|price|int|null: false|
|condition|string|null: false|
|exhibition|string|null: false|
|shippingarea|stirng|null: false|
|shippingdate|string|null: false|
### Association
- belongs_to :user
- has_many :images
- has_many :main_categories
- has_many :comments
- has_many :likes


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null:false,foreign_key: true|
|zipcode|string|null:false|
|prefectures|string|null:false|
|municipalities|string|null:false|
|address|string||
|building|string||
### Association
- belongs_to :user


## cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false,foreign_key: true|
|card_number|integer|null:false|
### Association
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id||references|null:false,foreign_key: true|
|image|string|null: false, foreign_key: true|
### Association
- belongs_to :product

## main_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false, foreign_key: true|
### Association
- belongs_to :product
- has_many :sub_categories
- has_ancestry

## sub_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false, foreign_key: true|
### Association
- belongs_to :main_category
- has_many :sub2_categories

## sub2_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false, foreign_key: true|
### Association
- belongs_to :sub_category

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false,foreign_key: true|
|product_id|references|null:false,foreign_key: true|
|comment|string|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product