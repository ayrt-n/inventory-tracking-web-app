class AddSkuToInventory < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :sku, :string
  end
end
