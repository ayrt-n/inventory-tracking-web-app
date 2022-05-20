class RemoveReferenceToProductFromShipments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :shipments, :product, index: true
  end
end
