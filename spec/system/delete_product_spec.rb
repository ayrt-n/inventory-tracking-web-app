require 'rails_helper'

RSpec.describe 'Deleting product', type: :system do
  scenario 'successfully deletes product' do
    product = create(:product)
    visit product_path(product)

    click_on 'Delete'
    accept_alert

    expect(page).not_to have_content(product.name)
    expect(page).not_to have_content(product.sku)
    expect(page).not_to have_content(product.quantity)
  end
end