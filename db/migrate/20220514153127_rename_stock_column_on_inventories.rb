class RenameStockColumnOnInventories < ActiveRecord::Migration[7.0]
  def change
    rename_column :inventories, :stock, :quantity
  end
end
