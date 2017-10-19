require 'rails_helper'

module Cartify
  RSpec.describe Billing, type: :model do
    include_examples 'address_validations'
  end
end
