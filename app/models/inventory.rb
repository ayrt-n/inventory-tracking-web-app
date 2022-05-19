class Inventory < ApplicationRecord
  belongs_to :product

  before_save do
    self.quantity = self.quantity || 0
  end

  def value
    self.quantity * self.product.price
  end
end
