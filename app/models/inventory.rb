class Inventory < ApplicationRecord
  belongs_to :product
  has_many :shipments

  before_save do
    self.quantity = self.quantity || 0
  end

  def value
    (self.quantity * self.product.price).round(2)
  end
end
