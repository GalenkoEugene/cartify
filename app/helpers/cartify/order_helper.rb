module Cartify::OrderHelper
  def order_active_filter
    case request.GET[:filter]
    when 'in_progress' then t('order.status.in_progress')
    when 'in_queue' then t('order.status.in_queue')
    when 'in_delivery' then t('order.status.in_delivery')
    when 'delivered' then t('order.status.delivered')
    when 'canceled' then t('order.status.canceled')
    else t('order.status.all')
    end
  end
end
