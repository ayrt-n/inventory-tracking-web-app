require 'rails_helper'

RSpec.describe 'Updating product', type: :system do
  scenario 'valid inputs' do
    product = create(:product)
    visit edit_product_path(product)

    fill_in 'SKU', with: 'New SKU'
    fill_in 'Name', with: 'NEW NAME'
    fill_in 'Price', with: 0
    fill_in 'Quantity', with: 0
    click_on 'Update Product'

    expect(page).to have_content('New SKU')
    expect(page).to have_content('NEW NAME')
    expect(page).to have_content('Price: $0.00')
    expect(page).to have_content('Quantity: 0')
  end

  feature 'invalid inputs' do
    scenario 'empty values' do
      product = create(:product)
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
      product1 = create(:product)
      product2 = create(:product)
      visit edit_product_path(product2)

      fill_in 'SKU', with: product1.sku
      click_on 'Update Product'

      expect(page).to have_content('SKU has already been taken')
    end
  end
end
