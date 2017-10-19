module Cartify::Updatable
  extend ActiveSupport::Concern

  included do
    private

    def update_addresses
      @addresses = Cartify::AddressesForm.new(addresses_params)
      render_wizard unless @addresses.save
    end

    def update_delivery
      current_order.update_attributes(order_params)
      flash[:notice] = t('delivery.pickup') if current_order.delivery_id.nil?
    end

    def update_payment
      @credit_card = Cartify::CreditCard.new(credit_card_params)
      render_wizard unless @credit_card.save
    end

    def update_confirm
      flash[:complete_order] = true
      session[:order_id] = nil if current_order.finalize
    end

    def order_params
      params.require(:order).permit(:delivery_id)
    end

    def credit_card_params
      params.require(:credit_card).permit(:number, :name, :mm_yy, :cvv)
    end

    def addresses_params
      params.require(:addresses_form)
    end
  end
end
