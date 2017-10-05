module Cartify
  class OrderStatus < ApplicationRecord
    has_many :orders

    validates :name, presence: true, uniqueness: true
    validates_length_of :name, maximum: 30

    scope :prohibited_to_change, -> { where(name: %i[in_progress in_queue]) }

    def valid_step?(target)
      if OrderStatus.find(target).name == 'delivered'
        name == 'in_delivery'
      else
        OrderStatus.prohibited_to_change.ids.exclude? target.to_i
      end
    end
  end
end
