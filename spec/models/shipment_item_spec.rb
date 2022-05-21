require 'rails_helper'

RSpec.describe ShipmentItem, type: :model do
  before do
    @product = create(:product, quantity: 100, price: 10)
    @shipment_items = create(:shipment_item, product: @product, quantity: 25)
  end

  describe '#add_shipment_from_inventory' do
    it 'deducts shipment quantity from product quantity on create' do
      expect(@product.quantity).to eq(75)
    end
  end

  describe '#remove_shipment_from_inventory' do
    it 'adds shipment quantity back to product quantity on destroy' do
      @shipment_items.destroy

      expect(@product.quantity).to eq(100)
    end
  end

  describe '#value' do
    it 'calculates the value of the shipment item' do
      expect(@shipment_items.value).to eq(250)
    end
  end
end
