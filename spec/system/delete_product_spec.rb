require 'rails_helper'

RSpec.describe 'Deleting product', type: :system do
  scenario 'successfully deletes product' do
    product = create(:product_with_inventory)
    visit inventory_path(product.inventory)

    click_on 'Delete'
    accept_alert

    expect(page).not_to have_content(product.name)
    expect(page).not_to have_content(product.sku)
    expect(page).not_to have_content(product.inventory.quantity)
  end
end