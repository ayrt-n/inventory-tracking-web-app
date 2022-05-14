class AddUniquenessConstraintToInventoriesSku < ActiveRecord::Migration[7.0]
  def change
    add_index :inventories, :sku, unique: true
  end
end
