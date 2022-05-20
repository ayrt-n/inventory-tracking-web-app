require 'rails_helper'

RSpec.describe 'Creating product', type: :system do
  scenario 'valid inputs' do
    visit new_product_path
    fill_in 'SKU', with: 'A1A3N-GBG6'
    fill_in 'Name', with: 'POWER ZIP HOODIE'
    fill_in 'Price', with: 55.00
    fill_in 'Quantity', with: 50
    click_on 'Create Product'

    expect(page).to have_content('A1A3N-GBG6')
    expect(page).to have_content('POWER ZIP HOODIE')
    expect(page).to have_content('55')
    expect(page).to have_content('50')
  end

  feature 'invalid inputs' do
    scenario 'empty values' do
      visit new_product_path
      fill_in 'SKU', with: ''
      fill_in 'Name', with: ''
      fill_in 'Price', with: ''
      fill_in 'Quantity', with: ''
      click_on 'Create Product'

      expect(page).to have_content("SKU can't be blank")
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Price can't be blank")
    end

    scenario 'duplicate skus' do
      product = create(:product)

      visit new_product_path
      fill_in 'SKU', with: product.sku
      fill_in 'Name', with: product.name
      fill_in 'Price', with: product.price
      fill_in 'Quantity', with: product.quantity
      click_on 'Create Product'

      expect(page).to have_content('SKU has already been taken')
    end
  end
end
