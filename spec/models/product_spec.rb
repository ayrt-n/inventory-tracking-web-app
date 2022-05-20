require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'product name lower case' do
    it 'replaces with uppercase value' do
      product = create(:product, name: 'kylie matte lip kit')
      expect(product.name).to eql('KYLIE MATTE LIP KIT')
    end
  end
end
