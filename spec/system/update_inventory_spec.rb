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

  scenario 'invalid inputs' do
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
end