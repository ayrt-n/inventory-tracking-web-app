class ShipmentsController < ApplicationController
  def index
    @shipments = Shipment.all
  end

  def new
    @inventory_options = Inventory.all.includes(:product).map { |inv| [inv.product.name, inv.id] }
    @shipment = Shipment.new
  end

  def create
    @shipment = Shipment.new(shipment_params)

    if @shipment.save
      redirect_to inventories_path
    else
      @inventory_options = Inventory.all.includes(:product).map { |inv| [inv.product.name, inv.id] }
      render :new, status: :unprocessable_entity
    end
  end

  private

  def shipment_params
    params.require(:shipment).permit(:inventory_id, :quantity)
  end
end
