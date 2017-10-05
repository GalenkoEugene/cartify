FactoryGirl.define do
  factory :cartify_order_item, class: 'Cartify::OrderItem' do
    product_id 1
    unit_price "9.99"
    quantity 1
    total_price "9.99"
    order nil
  end
end
