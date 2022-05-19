require 'rails_helper'

RSpec.describe 'Deleting shipment', type: :system do
  scenario 'successfully deletes shipment' do
    inventory = create(:inventory_with_shipment)
    visit shipments_path
    expect(page).to have_content(inventory.product.name)

    click_on 'Delete'
    accept_alert

    expect(page).not_to have_content(inventory.product.name)
  end
end