Cartify.product_class = 'Product'
Cartify.user_class = 'Customer'
Cartify.empty_cart_path = 'products_path'

# user_class:      is a owner model name, change it if you have other!
# product_class:   is a product model name, change it if you have other!
# empty_cart_path: it's a route where you will be redirected if empty cart and user try go to checkout

# don't forget add:
# mount Cartify::Engine, at: '/'  # into routes.rb file
