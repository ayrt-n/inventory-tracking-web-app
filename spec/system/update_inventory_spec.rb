require 'rails_helper'

RSpec.describe 'Updating inventory', type: :system do
  scenario 'valid inputs' do
    inventory = create(:inventory)
    visit edit_inventory_path(inventory)

    fill_in 'SKU', with: 'New SKU'
    fill_in 'Name', with: 'New name'
    fill_in 'Quantity', with: 999_999_999
    click_on 'Update Inventory'

    expect(page).to have_content('New SKU')
    expect(page).to have_content('New name')
    expect(page).to have_content('999999999')
  end

  feature 'invalid inputs' do
    scenario 'empty values' do
      inventory = create(:inventory)
      visit edit_inventory_path(inventory)

      fill_in 'SKU', with: ''
      fill_in 'Name', with: ''
      fill_in 'Quantity', with: ''
      click_on 'Update Inventory'

      expect(page).to have_content("SKU can't be blank")
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Quantity can't be blank")
    end

    scenario 'duplicate sku' do
      inventory1 = create(:inventory)
      inventory2 = create(:inventory)
      visit edit_inventory_path(inventory2)

      fill_in 'SKU', with: inventory1.sku
      click_on 'Update Inventory'

      expect(page).to have_content('SKU has already been taken')
    end
  end
end