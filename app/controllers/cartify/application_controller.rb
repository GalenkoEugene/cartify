module Cartify
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # helper_method :current_order, :current_user

    def current_order
      @current_order ||= Order.find_or_initialize_by(id: order_id)
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
end
