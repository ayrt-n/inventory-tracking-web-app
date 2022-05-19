class Product < ApplicationRecord
  validates :name, :sku, :price, presence: true
  has_one :inventory

  before_create do
    self.name = self.name.upcase
  end
end
