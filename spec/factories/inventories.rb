FactoryBot.define do
  factory :inventory do
    product
    quantity { Faker::Number.between(from: 20, to: 100) }
  end
end
