class Product < ApplicationRecord
  validates :name, :sku, :price, presence: true
  validates :sku, uniqueness: true
  has_one :inventory, dependent: :destroy
  accepts_nested_attributes_for :inventory

  before_create do
    self.name = self.name.upcase
  end
end
