module Cartify
  module CartsHelper
    def add_to_cart(product, qqty = 1, name = 'Add to cart')
      link_to name, cartify.order_items_path(order_item: {quantity: qqty, product_id: product.id}), { method: :post, remote: true }
    end

    def shop_icon_quantity
      qty = current_order.order_items.reload.collect(&:quantity).compact.sum
      qty_span = qty.zero? ? 0 : "<span class='shop-quantity'>#{qty}</span>"
      "<span class='shop-icon'>#{qty_span}</span>".html_safe
    end
  end
end
