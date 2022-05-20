class ShipmentsController < ApplicationController
  def index
    @shipments = Shipment.all.order('updated_at DESC')
  end

  def show
    @shipment = Shipment.find(params[:id])
  end

  def new
    @product_options = Product.all.order('name').map { |p| [p.name, p.id] }
    @shipment = Shipment.new
    @number_of_products = Product.count

    number_of_items = params[:number_of_items] || 1
    number_of_items.to_i.times { @shipment.shipment_items.build }
  end

  def create
    @shipment = Shipment.new(shipment_params)

    if @shipment.save
      redirect_to shipments_path
    else
      @product_options = Product.all.order('name').map { |p| [p.name, p.id] }
      @number_of_products = Product.count
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @shipment = Shipment.find(params[:id])
    @shipment.destroy

    redirect_to shipments_path, status: 303
  end

  private

  def shipment_params
    params.require(:shipment).permit(shipment_items_attributes: [:id, :product_id, :quantity])
  end
end
