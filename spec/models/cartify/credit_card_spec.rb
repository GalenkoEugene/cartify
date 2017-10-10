require 'rails_helper'

module Cartify
  RSpec.describe CreditCard, type: :model do
    context 'validations' do
      it { expect(subject).to validate_presence_of :number }
      it { expect(subject).to validate_presence_of :name }
      it { expect(subject).to validate_presence_of :mm_yy }
      it { expect(subject).to validate_presence_of :cvv }

      it { expect(subject).to have_one :order }

      it {
        expect(subject).to validate_length_of(:cvv)
          .is_at_least(3).is_at_most(4)
      }

      it { expect(subject).to validate_numericality_of(:cvv) }
      it { expect(subject).to allow_value('09/17').for(:mm_yy) }
      it { expect(subject).to allow_value('12/18').for(:mm_yy) }
      it { expect(subject).to allow_value('02/19').for(:mm_yy) }
      it { expect(subject).not_to allow_value('00/17').for(:mm_yy) }
      it { expect(subject).not_to allow_value('21/17').for(:mm_yy) }
      it { expect(subject).not_to allow_value('1f/ac').for(:mm_yy) }
      it { expect(subject).to allow_value('1234567891234567').for(:number) }
      it { expect(subject).to allow_value('9996667776661112').for(:number) }
      it { expect(subject).not_to allow_value('123456').for(:number) }
      it { expect(subject).not_to allow_value('fffffffffffffff').for(:number) }
      it { expect(subject).to allow_value('Adam').for(:name) }
      it { expect(subject).to allow_value('Eva').for(:name) }
      it { expect(subject).not_to allow_value('').for(:name) }
      it { expect(subject).not_to allow_value('looong name ' * 10).for(:name) }
      it { expect(subject).not_to allow_value('!@#$%^&*_+').for(:name) }
    end
  end
end
