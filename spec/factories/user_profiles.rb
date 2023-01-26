FactoryBot.define do
  factory :user_profile do
    user { create(:user) }
    first_name { 'MyString' }
    middle_name { 'MyString' }
    last_name { 'MyString' }
    dob { '2023-01-26' }
    gender { '' }
    country_code { '' }
    contact_number { '' }
  end
end
