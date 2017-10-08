module Cartify
  module CheckoutHelper
    def active_step?(current_step)
      'active' if current_step == step
    end

    def order_summary_text_position
      return 'text-center general-text-right' if right?
      'general-text-align'
    end

    def order_summary_table_position
      'general-summary-table-right general-text-right' if right?
    end

    private

    def right?
      %i[confirm complete].include? step
    end
  end
end
