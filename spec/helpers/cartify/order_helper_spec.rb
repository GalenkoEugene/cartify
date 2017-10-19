require 'rails_helper'

module Cartify
  RSpec.describe Cartify::OrderHelper, type: :helper do
    describe '#order_active_filter' do
      STATUS_NAMES = [
        I18n.t('order.status.in_progress'),
        I18n.t('order.status.in_queue'),
        I18n.t('order.status.in_delivery'),
        I18n.t('order.status.delivered'),
        I18n.t('order.status.canceled'),
        I18n.t('order.status.all')
      ]

      %w[in_progress in_queue in_delivery delivered canceled all].each_with_index do |status_key, index|
        it "set filter to #{status_key} status" do
          allow_any_instance_of(ActionController::TestRequest)
            .to receive(:GET).and_return(filter: status_key)
          expect(helper.order_active_filter).to eq STATUS_NAMES[index]
        end
      end
    end
  end
end
