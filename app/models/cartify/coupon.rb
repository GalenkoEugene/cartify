module Cartify
  class Coupon < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :value, presence: true
    validates :value, numericality: { only_float: true }
    validates_length_of :name,  is: 15

    has_many :orders
  end
end
