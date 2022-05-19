class ShipmentsController < ApplicationController
  def index
    @shipments = Shipment.all.includes(inventory: :product)
  end

  def show
    @shipment = Shipment.find(params[:id])
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

  def destroy
    @shipment = Shipment.find(params[:id])
    @shipment.destroy

    redirect_to shipments_path
  end

  private

  def shipment_params
    params.require(:shipment).permit(:inventory_id, :quantity)
  end
end
