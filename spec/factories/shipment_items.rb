FactoryBot.define do
  factory :shipment_item do
    product
    shipment
    quantity { Faker::Number.between(from: 1, to: 19) }
  end
end
