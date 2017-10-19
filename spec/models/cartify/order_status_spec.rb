require 'rails_helper'

module Cartify
  RSpec.describe OrderStatus, type: :model do
    it { expect(subject).to have_many :orders }
    it { expect(subject).to validate_presence_of :name }
    it { expect(subject).to validate_length_of(:name).is_at_most 30 }
    it { expect(subject).to validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end
end
