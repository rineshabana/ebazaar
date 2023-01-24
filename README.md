# README

## We need to make a e-commerce website for 2 types of users, 

* Buyer
* Seller

## Purpose
Selling Products

## Associations
Products have Features
Categories have products

Products have reviews only if the user has ever bought that product

Product have rating only if User has Bought that product


## Constraints
No need for Payment Gateway Just manage inventory

If the Product goes out of stock the product is not listed in the home page

Documentations on what is being used

## Tech

* App server = Ruby on Rails 5.2.8

* Db Server = MySql

* Background Processing = Sidekiq

* Unit Test = RSpec


## Tables (Backend)

* User table = id , timestamps, credentials, roles

* Product table = id timestamp price

* Identifiers = id identifier_type value product_id

* Features Table = id, product_id, content

* Categories Table = id , name

* ProductCategories = id product_id category_id

* Inventory table = id product_id count

* Review table = id comment user_id

* Rating table = id value user_id rating



## Front end
* Login = Cart, Buy 

* No Login = Listing Product Searching Product

* Buyer UI = Listing page, Cart Page, Invoice Page

* Seller UI = Inventory Page, Invoice Page, Sales 



## Gems to be used

* Devise - Authentication
* Petergate - Authorisation
* Kaminari - Pagination
* Sidekiq -  Background Process