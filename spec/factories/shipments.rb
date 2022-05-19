FactoryBot.define do
  factory :shipment do
    inventory
    quantity { Faker::Number.between(from: 1, to: 19) }
  end
end
