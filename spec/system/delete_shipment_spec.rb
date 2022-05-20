require 'rails_helper'

RSpec.describe 'Deleting shipment', type: :system do
  scenario 'successfully deletes shipment' do
    product = create(:product_with_shipment)
    visit shipments_path
    expect(page).to have_content(product.name)

    click_on 'Delete'
    accept_alert

    expect(page).not_to have_content(product.name)
  end
end