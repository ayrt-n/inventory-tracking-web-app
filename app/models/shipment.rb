class Shipment < ApplicationRecord
  belongs_to :inventory

  def value
    self.quantity * self.inventory.product.price
  end
end
