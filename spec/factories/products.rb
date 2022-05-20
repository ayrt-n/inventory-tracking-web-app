FactoryBot.define do
  factory :product do
    sku { Faker::Invoice.reference }
    name { Faker::Commerce.product_name.upcase }
    price { Faker::Number.decimal(l_digits: 2) }
    quantity { Faker::Number.between(from: 20, to: 100) }

    factory :product_with_shipment do
      after(:create) do |product|
        create(:shipment, product: product)
      end
    end
  end
end
