module Cartify
  module CartsHelper
    def add_to_cart(product, qqty = 1, name = 'Add to cart')
      link_to name, cartify.order_items_path(order_item: {quantity: qqty, product_id: product.id}), { method: :post, remote: true }
    end
  end
end
