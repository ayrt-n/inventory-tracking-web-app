require 'rails_helper'

RSpec.describe 'Deleting shipment', type: :system do
  scenario 'successfully deletes shipment' do
    shipment_items = create(:shipment_item)

    visit shipments_path
    expect(page).to have_content(shipment_items.shipment.customer_name)

    click_on 'Delete'
    accept_alert

    expect(page).not_to have_content(shipment_items.shipment.customer_name)
  end
end