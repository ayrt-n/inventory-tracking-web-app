class AddProductReferenceToInventories < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventories, :products, index: true
  end
end
