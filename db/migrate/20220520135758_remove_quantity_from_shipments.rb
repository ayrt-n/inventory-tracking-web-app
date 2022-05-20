class RemoveQuantityFromShipments < ActiveRecord::Migration[7.0]
  def change
    remove_column :shipments, :quantity
  end
end
