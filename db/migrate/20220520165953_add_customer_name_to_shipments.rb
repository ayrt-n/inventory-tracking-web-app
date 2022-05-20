class AddCustomerNameToShipments < ActiveRecord::Migration[7.0]
  def change
    add_column :shipments, :customer_name, :string
  end
end
