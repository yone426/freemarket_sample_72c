class ProductsController < ApplicationController

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
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
    @product.update(product_params)
    redirect_to product_path(@product.id)
  end

  private
    def product_params
      params.require(:product).permit(:details, :name, :categories, :price, :condition, :exhibition, :shippingarea, :shippingdate, images_attributes:  [:src, :_destroy, :id])
    end
end
