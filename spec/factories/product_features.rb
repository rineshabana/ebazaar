FactoryBot.define do
  factory :product_feature do
    name { 'Red fruit' }
    product { create(:product) }
  end
end
