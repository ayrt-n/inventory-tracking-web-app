class Inventory < ApplicationRecord
  validates :sku, :name, :quantity, presence: true
end
