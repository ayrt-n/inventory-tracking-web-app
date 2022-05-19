require 'rails_helper'

RSpec.describe 'Creating shipment', type: :system do
  scenario 'valid inputs' do
    product = create(:product)
    create(:inventory, product: product, quantity: 100)
    visit inventories_path
    click_on 'New Shipment'
    fill_in 'Quantity', with: 100
    click_on 'Create Shipment'

    expect(page).to have_content(product.name)
  end

  feature 'invalid inputs' do
    scenario 'shipment quantity less than one' do
      product = create(:product)
      create(:inventory, product: product, quantity: 100)
      visit inventories_path
      click_on 'New Shipment'
      fill_in 'Quantity', with: 0
      click_on 'Create Shipment'

      expect(page).to have_content('Quantity must be greater than 0')
    end

    scenario 'shipment quantity greater than inventory quantity' do
      product = create(:product)
      create(:inventory, product: product, quantity: 100)
      visit inventories_path
      click_on 'New Shipment'
      fill_in 'Quantity', with: 101
      click_on 'Create Shipment'

      expect(page).to have_content('Quantity cannot be greater than available inventory')
    end
  end
end