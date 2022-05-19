FactoryBot.define do
  factory :inventory do
    product
    quantity { Faker::Number.between(from: 20, to: 100) }

    factory :inventory_with_shipment do
      after(:create) do |inventory|
        create(:shipment, inventory: inventory)
      end
    end
  end
end
