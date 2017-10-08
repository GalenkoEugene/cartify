module Cartify::Showable
  extend ActiveSupport::Concern

  included do
    private
    before_action :setup_wizard

    def show_login
      return jump_to(next_step) if signed_in?
      cookies[:from_checkout] = { value: true, expires: 1.day.from_now }
    end

    def show_addresses
      @addresses = Cartify::AddressesForm.new(show_addresses_params)
    end

    def show_delivery
      return jump_to(previous_step) unless current_order.addresses.presence
      @deliveries = Cartify::Delivery.all
    end

    def show_payment
      return jump_to(previous_step) unless current_order.delivery
      @credit_card = current_order.credit_card || Cartify::CreditCard.new
    end

    def show_confirm
      return jump_to(previous_step) unless current_order.credit_card
      show_addresses
    end

    def show_complete
      return jump_to(previous_step) unless flash[:complete_order]
      @order = cartify_current_user.orders.processing_order.decorate
    end

    def fast_authentification!
      return unless signed_in? and step != :login
      jump_to(:login) unless signed_in?
    end

    def show_addresses_params # take data from settings if persist
      return { user_id: cartify_current_user.id } if current_order.addresses.empty?
      { order_id: current_order.id }
    end

    def signed_in?
      return unless respond_to?("#{Cartify.user_class}SignedIn?".underscore)
      send "#{Cartify.user_class}SignedIn?".underscore
    end
  end
end
