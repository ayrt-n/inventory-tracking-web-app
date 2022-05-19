FactoryBot.define do
  factory :product do
    sku { Faker::Invoice.reference }
    name { Faker::Commerce.product_name.upcase }
    price { Faker::Number.decimal(l_digits: 2) }

    factory :product_with_inventory do
      after(:create) do |product|
        create(:inventory, product: product)
      end
    end
  end
end
