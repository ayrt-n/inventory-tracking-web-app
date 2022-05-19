class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.build_inventory
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to inventories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to inventories_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :sku, :price, inventory_attributes: [:id, :quantity])
  end
end
