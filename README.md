# Jungle

A mini e-commerce application built with Rails 4.2 - a simulation of inheritting an existing code base and adding features in a unfamiliar language / framework.

See these implemented features within [Expore jungleApp](#explore-jungleapp)

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Setup

1. Clone this repo
2. Run `bundle install` to install dependencies
3. Create .env file based on .env.example

- this dev app can be tested with 'Admin access rights' using the following password and username:

  * username: Jungle
  * password: book

4. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

## Explore jungleApp

The following features were created and implemented on-top of the already existing code base:

### Admin Features

* routes remain RESTful
* when a product has 0 quantity, a sold out badge displays on the product list page
* admin users can list and create new categories and products

### User Authentication

* visitors can go to registration page from any page in order to create an account
* users can then sign-in using that email and password
* users cna log out from any page
* NOTE: passwords are not stored as plain text in the database, `bcrypt` gem levereged for secure password creation

### Order Details Page

* order page contains items, their image, qty's and line item totals
* final amount for the order is displayed

### Email Receipt

* upon successful order, user is sent an HTML formatted email with the order summary
* order ID is within the subject line

### Bug Fixes

* user must enter HTTP auth login/password to access admin functionality

* when cart is empty, the user is not clicked through to the cart page and instead is displayed a message about the cart being empty

### Product Rating

* use of nested resources in the routing, and not using custom controller actions
* visitors can review the list of ratings and review when viewing the product detail
* logged in users can rate and review a product in a single step
* logged in users can delete only a rating and review that they previoulsy created
