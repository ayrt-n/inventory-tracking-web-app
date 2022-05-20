class Shipment < ApplicationRecord
  has_many :shipment_items, dependent: :destroy
  has_many :products, through: :shipment_items

  accepts_nested_attributes_for :shipment_items

  # validates :quantity, numericality: { greater_than: 0 }
  # validate :check_sufficient_inventory

  # before_save :remove_shipment_from_inventory
  # before_destroy :add_shipment_to_inventory

  # def value
  #   (self.quantity * self.product.price).round(2)
  # end

  # private

  # def check_sufficient_inventory
  #   errors.add(:quantity, 'cannot be greater than available inventory') if self.quantity > self.product.quantity
  # end

  # def remove_shipment_from_inventory
  #   shipment_amount = self.quantity
  #   inventory_amount = self.product.quantity

  #   self.product.update_attribute(:quantity, inventory_amount - shipment_amount)
  # end

  # def add_shipment_to_inventory
  #   shipment_amount = self.quantity
  #   inventory_amount = self.product.quantity

  #   self.product.update_attribute(:quantity, inventory_amount + shipment_amount)
  # end
end
