require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = create(:product, name: 'kylie matte lip kit', quantity: '', price: 10)
  end

  context 'product name lower case' do
    it 'replaces with uppercase value' do
      expect(@product.name).to eq('KYLIE MATTE LIP KIT')
    end
  end

  context 'no quantity provided' do
    it 'replaces with default value of zero' do
      expect(@product.quantity).to eq(0)
    end
  end

  describe '#value' do
    it 'calculates the value of inventory' do
      @product.quantity = 25

      expect(@product.value).to eq(250)
    end
  end
end
