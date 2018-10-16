# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Contributions to Project
### Feature
* Product Sold Out Badge
* Admin Category Routes and Creation
* User Authentication and Login
* Order Details Upon Checkout
* Email Receipt
* Admin Authentication
* Product Ratings and Reviews
### Bug Fix
* Checking out With Empty Cart
### Testing
* Model Spec: Product
* Model Spec: User 
* Feature Spec: Home Page
* Feature Spec: Product Details
* Feature Spec: Add to Cart

### Screenshot
![Screenshot of homepage](https://github.com/fei-gao/jungle-rails/blob/master/docs/home_page.png)
![Screenshot of bookshelf](https://github.com/fei-gao/jungle-rails/blob/master/docs/bookshelf.png)
![Screenshot of product details](https://github.com/fei-gao/jungle-rails/blob/master/docs/product_details.png)
![Screenshot of admin_all_products page](https://github.com/fei-gao/jungle-rails/blob/master/docs/admin_all_products.png)

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
