require 'rails_helper'

RSpec.describe 'Creating inventory', type: :system do
  scenario 'valid inputs' do
    visit new_inventory_path
    fill_in 'SKU', with: 'A1A3N-GBG6'
    fill_in 'Name', with: 'POWER ZIP HOODIE'
    fill_in 'Quantity', with: 50
    click_on 'Create Inventory'

    expect(page).to have_content('POWER ZIP HOODIE')
  end

  feature 'invalid inputs' do
    scenario 'empty values' do
      visit new_inventory_path
      fill_in 'SKU', with: ''
      fill_in 'Name', with: ''
      fill_in 'Quantity', with: ''
      click_on 'Create Inventory'

      expect(page).to have_content("SKU can't be blank")
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Quantity can't be blank")
    end

    scenario 'duplicate sku' do
      inventory = create(:inventory)

      visit new_inventory_path
      fill_in 'SKU', with: inventory.sku
      fill_in 'Name', with: inventory.name
      fill_in 'Quantity', with: inventory.quantity
      click_on 'Create Inventory'

      expect(page).to have_content('SKU has already been taken')
    end
  end
end