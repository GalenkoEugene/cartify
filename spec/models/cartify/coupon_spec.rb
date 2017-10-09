require 'rails_helper'

module Cartify
  RSpec.describe Coupon, type: :model do
    it { expect(subject).to validate_presence_of :name }
    it { expect(subject).to validate_presence_of :value }
    it { expect(subject).to validate_length_of(:name).is_equal_to 15 }
    it { expect(subject).to validate_uniqueness_of :name }
    it { expect(subject).to validate_numericality_of(:value) }
    it { expect(subject).to have_many :orders }
  end
end
