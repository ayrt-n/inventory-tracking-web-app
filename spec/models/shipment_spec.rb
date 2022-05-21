require 'rails_helper'

RSpec.describe Shipment, type: :model do
  describe '#value' do
    it 'calculates total value of shipment' do
      shipment = create(:shipment)

      product1 = create(:product, price: 5)
      product2 = create(:product, price: 25)
      product3 = create(:product, price: 1)

      create(:shipment_item, shipment: shipment, product: product1, quantity: 5)
      create(:shipment_item, shipment: shipment, product: product2, quantity: 10)
      create(:shipment_item, shipment: shipment, product: product3, quantity: 10)

      expect(shipment.value).to eq(285)
    end
  end
end
