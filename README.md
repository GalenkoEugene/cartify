# Cartify
Shopping cart with a multi-step checkout, easily mounted into Rails application.

## Usage
Run initializer:
  ```bash
  rails generate initializer
  ```
Clone migrations:
  ```bash
  rake cartify:install:migrations
  ```
Define associations in your "User" model:
  ```ruby
  has_many :orders, class_name: 'Cartify::Order', foreign_key: :user_id
  has_one :billing, class_name: 'Cartify::Billing', foreign_key: :user_id
  has_one :shipping, class_name: 'Cartify::Shipping', foreign_key: :user_id
  has_many :addresses, class_name: 'Cartify::Address', foreign_key: :user_id
  ```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'cartify'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install cartify
```

## Available helpers
  #### Shop icon helper
  ```ruby
  shop_icon_quantity
  ```
  Will produce:
  ```html
  <span class="shop-icon">
    <span class="shop-quantity">1</span>
  </span>
  ```
  #### Add to cart link helper
  ```ruby
  add_to_cart(product, quantity, button_name)
  # product -     name of your selling product (required!)
  # quantity -    how many goods you with put into cart (default: 1)
  # button_name - button name (default: "Add to cart")
  ```
  Or customize as you with:
  ```ruby
  'helper link':            cartify.order_items_path()
  'required params':        order_item: {quantity: quantity, product_id: product.id}
  'use method':             method: :post
  'asynchronously':         remote: true

  # Example:
    link_to cartify.order_items_path(order_item: {quantity: 7, product_id: product.id}), 
      { method: :post, remote: true }
   ```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
