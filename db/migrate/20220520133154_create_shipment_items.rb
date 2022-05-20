class CreateShipmentItems < ActiveRecord::Migration[7.0]
  def change
    create_table :shipment_items do |t|
      t.references :product
      t.references :shipment
      t.integer :quantity

      t.timestamps
    end
  end
end
