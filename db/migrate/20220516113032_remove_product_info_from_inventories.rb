class RemoveProductInfoFromInventories < ActiveRecord::Migration[7.0]
  def change
    remove_column :inventories, :name
    remove_column :inventories, :sku
  end
end
