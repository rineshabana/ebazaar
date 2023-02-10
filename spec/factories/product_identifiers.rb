FactoryBot.define do
  factory :product_identifier do
    name { 'Serial Number' }
    value { '123WER123FF' }
    product { create(:product) }
  end
end
