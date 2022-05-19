class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all.includes(:product).order('products.name')
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  private

  def inventory_params
    params.require(:inventory).permit(:sku, :name, :quantity)
  end
end
