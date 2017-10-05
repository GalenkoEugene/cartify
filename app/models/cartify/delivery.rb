module Cartify
  class Delivery < ApplicationRecord
    has_many :orders
    validates :name, :duration, :price, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
    validates_length_of :name, in: 3..100
  end
end
