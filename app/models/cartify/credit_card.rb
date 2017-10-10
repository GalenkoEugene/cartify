module Cartify
  class CreditCard < ApplicationRecord
    validates :number, :name, :mm_yy, :cvv, presence: true
    validates_length_of :cvv, in: 3..4
    validates :cvv, numericality: { only_integer: true }
    validates_format_of :mm_yy, with: %r{\A(0[1-9]|10|11|12)\/\d\d\z}, message: I18n.t('validation.mm_yy')
    validates_format_of :number, with: /\A\d{16}\z/, message: I18n.t('validation.cart_number')
    validates_format_of :name, with: /\A[a-zA-Z\s]{0,49}\z/, message: I18n.t('validation.cart_name')
    before_validation :clear_mask
    has_one :order

    after_save :connect_to_order

    private

    def connect_to_order
      user = CurrentSession.user unless CurrentSession.user.nil?
      user&.orders&.where_status(:in_progress)&.first&.update_attributes(credit_card_id: id)
    end

    def clear_mask
      number&.gsub!(/\s/, '')
    end
  end
end
