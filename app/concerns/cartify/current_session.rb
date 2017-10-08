module Cartify::CurrentSession
  thread_mattr_accessor :user
  extend ActiveSupport::Concern

  included do
    add_flash_types :danger, :warning, :success
    helper_method :current_order, :cartify_current_user, :cartify_authenticate_user!
    before_action :cartify_set_current_user

    def after_sign_in_path_for(resource)
      if cookies[:from_checkout]
        cookies.delete :from_checkout
        cartify.checkout_path(:addresses)
      else
        super
      end
    end
  end

  def current_order
    @current_order ||= Cartify::Order.find_or_initialize_by(id: order_id).decorate
  end

  def cartify_current_user
    return unless respond_to?(Cartify.current_user)
    @cartify_current_user ||= send(Cartify.current_user)
  end

  def cartify_set_current_user
    Cartify::CurrentSession.user = cartify_current_user
  end

  def cartify_authenticate_user!
    return unless respond_to?("Authenticate#{Cartify.user_class}!".underscore)
    send "Authenticate#{Cartify.user_class}!".underscore
  end

  private

  def order_id
    order_in_progress&.id || session[:order_id]
  end

  def order_in_progress
    return unless cartify_current_user
    cartify_current_user.orders.where_status('in_progress').first
  end
end
