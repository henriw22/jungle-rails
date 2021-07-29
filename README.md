# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Database was setup with PostgreSQL. Implemented Stripe testing card API to simulate transaction.

## Project Goals

* To become familiar with Ruby and the Rails framework
* Learn how to navigate an existing code-base
* Use existing code style and approach to implement new features in unfamiliar territory
* Apply previous learning tactics to research and become familiar with a new paradigm, language and framework
* A simulation of the real world where feature and bug-fix requests are listed instead of step-by-step instructions on how to implement a solution

## Functional Requirements

* Users should be able to view all the products and display the products based on categories.
* Users can see the details of the product
* Users can add the product into cart and see them on the checkout page
* Users can modify the cart, add/reduce quantity and proceed to payment
* Users receives a summary of the order after the transaction went through
* Admin users can see the list of the product items available on the app
* Admin users can add or remove product from the app
* Admin users can add categories to group the product items

## Screenshots

!["Main Display"](https://github.com/henriw22/jungle-rails/blob/master/docs/Main_Display.png?raw=true)
!["User Login"](https://github.com/henriw22/jungle-rails/blob/master/docs/User_Login.png?raw=true)
!["Cart"](https://github.com/henriw22/jungle-rails/blob/master/docs/Cart.png?raw=true)
!["Order Confirmation"](https://github.com/henriw22/jungle-rails/blob/master/docs/Order_confirmation.png?raw=true)

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
