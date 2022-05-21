require 'rails_helper'

RSpec.describe 'Creating shipment', type: :system do
  scenario 'valid inputs' do
    product = create(:product, quantity: 100)
    visit new_shipment_path
    fill_in 'Customer name', with: 'Test Customer'
    fill_in 'Quantity', with: 100
    click_on 'Create Shipment'

    expect(page).to have_content(product.name)
  end

  feature 'invalid inputs' do
    scenario 'shipment quantity less than one' do
      product = create(:product, quantity: 100)
      visit new_shipment_path
      fill_in 'Customer name', with: 'Test Customer'
      fill_in 'Quantity', with: 0
      click_on 'Create Shipment'

      expect(page).to have_content('Shipment items quantity must be greater than 0')
    end

    scenario 'shipment quantity greater than inventory quantity' do
      product = create(:product, quantity: 100)
      visit new_shipment_path
      fill_in 'Customer name', with: 'Test Customer'
      fill_in 'Quantity', with: 101
      click_on 'Create Shipment'

      expect(page).to have_content('Shipment items quantity cannot be greater than available inventory')
    end

    scenario 'no customer name provided' do
      product = create(:product, quantity: 100)
      visit new_shipment_path
      fill_in 'Customer name', with: ''
      fill_in 'Quantity', with: 50
      click_on 'Create Shipment'

      expect(page).to have_content("Customer name can't be blank")
    end
  end
end