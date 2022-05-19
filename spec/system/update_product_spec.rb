require 'rails_helper'

RSpec.describe 'Updating product', type: :system do
  scenario 'valid inputs' do
    product = create(:product_with_inventory)
    visit edit_product_path(product)

    fill_in 'SKU', with: 'New SKU'
    fill_in 'Name', with: 'New name'
    fill_in 'Price', with: 999.99
    fill_in 'Quantity', with: 999_999_999
    click_on 'Update Product'

    expect(page).to have_content('New SKU')
    expect(page).to have_content('New name')
    expect(page).to have_content('999.99')
    expect(page).to have_content('999999999')
  end

  feature 'invalid inputs' do
    scenario 'empty values' do
      product = create(:product_with_inventory)
      visit edit_product_path(product)

      fill_in 'SKU', with: ''
      fill_in 'Name', with: ''
      fill_in 'Price', with: ''
      fill_in 'Quantity', with: ''
      click_on 'Update Product'

      expect(page).to have_content("SKU can't be blank")
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Price can't be blank")
    end

    scenario 'duplicate skus' do
      product1 = create(:product_with_inventory)
      product2 = create(:product_with_inventory)
      visit edit_product_path(product2)

      fill_in 'SKU', with: product1.sku
      click_on 'Update Product'

      expect(page).to have_content('SKU has already been taken')
    end
  end
end
