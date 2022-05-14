FactoryBot.define do
  factory :inventory do
    sku { Faker::Invoice.reference }
    name { Faker::Commerce.product_name.upcase }
    quantity { Faker::Number.between(from: 20, to: 100) }
  end
end
