FactoryBot.define do
  factory :shipment do
    customer_name { Faker::Name.name }
  end
end
