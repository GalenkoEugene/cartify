require 'rails_helper'

module Cartify
  RSpec.describe Delivery, type: :model do
    it { expect(subject).to validate_presence_of :name }
    it { expect(subject).to validate_presence_of :price }
    it { expect(subject).to validate_presence_of :duration }
    it { expect(subject).to have_many :orders }
    it {
        expect(subject).to validate_numericality_of(:price)
          .is_greater_than_or_equal_to 0.01
      }
    it {
        expect(subject).to validate_length_of(:name)
          .is_at_least(3).is_at_most(100)
      }
  end
end
