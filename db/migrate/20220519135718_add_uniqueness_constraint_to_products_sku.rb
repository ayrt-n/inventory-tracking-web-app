class AddUniquenessConstraintToProductsSku < ActiveRecord::Migration[7.0]
  def change
    add_index :products, :sku, unique: true
  end
end
