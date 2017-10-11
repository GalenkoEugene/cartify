
# filter for orders
module Cartify
  class OrdersQuery
    attr_reader :relation

    def initialize(relation = Cartify::Order.none)
      @relation = relation
    end

    def run(filter_params = '')
      status_id = Cartify::OrderStatus.find_by(name: filter_params)
      return relation.where(order_status_id: status_id) if status_id
      relation
    end
  end
end
