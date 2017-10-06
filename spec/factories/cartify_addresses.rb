FactoryGirl.define do
  factory :cartify_address, class: 'Cartify::Address' do
    type ""
    first_name "MyString"
    last_name "MyString"
    address "MyString"
    city "MyString"
    zip 1
    country "MyString"
    phone "MyString"
    user_id nil
  end
end
