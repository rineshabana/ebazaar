FactoryBot.define do
  factory :user_profile do
    user { create(:user) }
    first_name { 'Jhon' }
    middle_name { 'Sam' }
    last_name { 'Dean' }
    dob { '2023-01-26' }
    gender { 1 }
    country_code { '91' }
    contact_number { '12345678' }
  end
end
