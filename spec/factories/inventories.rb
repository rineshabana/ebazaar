FactoryBot.define do
  factory :inventory do
    product { nil }
    quantity { 1 }
    minimum_quantity { 1 }
    maximum_quantity { 1 }
    starts { "2023-03-13" }
    ends { "2023-03-13" }
  end
end
