class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  has_many :orders, class_name: 'Cartify::Order', foreign_key: :user_id
  has_one :billing, class_name: 'Cartify::Billing', foreign_key: :user_id
  has_one :shipping, class_name: 'Cartify::Shipping', foreign_key: :user_id
  has_many :addresses, class_name: 'Cartify::Address', foreign_key: :user_id
end
