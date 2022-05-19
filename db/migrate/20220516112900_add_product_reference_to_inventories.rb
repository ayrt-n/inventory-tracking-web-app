class AddProductReferenceToInventories < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventories, :product, index: true
  end
end
