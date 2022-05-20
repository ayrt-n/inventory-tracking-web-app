class Product < ApplicationRecord
  validates :name, :sku, :price, presence: true
  validates :sku, uniqueness: true
  has_many :shipments

  before_save do
    self.name = self.name.upcase
    self.quantity = self.quantity || 0
  end

  def value
    (self.quantity * self.price).round(2)
  end
end
