module Cartify::CurrenSession
  extend ActiveSupport::Concern

  included do
    helper_method :current_order, :current_user
  end

  def current_order
    @current_order ||= Cartify::Order.find_or_initialize_by(id: order_id)
    @current_order.update(user_id: current_user.id) if current_user
    @current_order
    # TODO: .decorate
  end

  def current_user
    send Cartify.current_user
  end

  private

  def order_id
    current_user ? order_in_progress&.id : session[:order_id]
  end

  def order_in_progress
    current_user.orders.where_status('in_progress').first
  end
end
