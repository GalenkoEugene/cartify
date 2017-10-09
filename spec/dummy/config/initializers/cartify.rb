Cartify.product_class = 'Book'
Cartify.user_class = 'User'
Cartify.current_user = 'current_user'
Cartify.empty_cart_path = 'catalog_path'

# user_class:      is a owner model name, change it if you have other!
# product_class:   is a product model name, change it if you have other!
# empty_cart_path: it's a route where you will be redirected if empty cart and user try go to checkout

# don't forget add:
  # mount Cartify::Engine, at: '/'  # into routes.rb file
