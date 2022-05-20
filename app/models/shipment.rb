class Shipment < ApplicationRecord
  has_many :shipment_items, dependent: :destroy
  has_many :products, through: :shipment_items

  accepts_nested_attributes_for :shipment_items, allow_destroy: true

  validates :customer_name, presence: true

  def value
    self.shipment_items.to_a.sum(&:value)
  end
end
