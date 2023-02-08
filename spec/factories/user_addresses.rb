FactoryBot.define do
  factory :user_address do
    user_profile { create(:user_profile) }
    address_line1 { 'MyString' }
    address_line2 { 'MyString' }
    address_line3 { 'MyString' }
    city { 'MyString' }
    state { 'MyString' }
    pincode { '1' }
    country_code { '1' }
    contact_number { '1234567890' }
  end
end
