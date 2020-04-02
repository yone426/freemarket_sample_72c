class ProductsController < ApplicationController
  def index
  end
  def new
  end
  def create
  end
  def show
  end
  def edit
    @product = Product.find(params[:id])
  end
  def buy #商品確認画面です
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end
  def update
    @product = Product.find(params[:id])
    @product.update!(product_params)
    redirect_to product_path(@product.id)
  end
  private
  def product_params
    params.require(:product).permit(:name, :details, :categories, :price, :condition, :exhibition, :shippingarea, :shippingdate)
  end
end
