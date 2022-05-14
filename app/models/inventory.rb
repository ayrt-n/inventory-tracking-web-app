class Inventory < ApplicationRecord
  validates :sku, :name, :quantity, presence: true
  validates :sku, uniqueness: true
end
