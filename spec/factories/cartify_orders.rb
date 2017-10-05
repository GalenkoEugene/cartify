FactoryGirl.define do
  factory :cartify_order, class: 'Cartify::Order' do
    subtotal "9.99"
    total "9.99"
    order_status nil
    coupon nil
    user_id 1
    delivery nil
    credit_card nil
  end
end
