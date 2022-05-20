class Shipment < ApplicationRecord
  has_many :shipment_items, dependent: :destroy
  has_many :products, through: :shipment_items

  accepts_nested_attributes_for :shipment_items, allow_destroy: true

  def value
    100
  end
end
