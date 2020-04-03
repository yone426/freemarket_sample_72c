class ProductsController < ApplicationController

  before_action :set_product, except: [:index, :new, :create]

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
    
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy

  end

  def update

  end

  private
    def product_params
      params.require(:product).permit(:details, :name, :categories, :price, :condition, :exhibition, :shippingarea, :shippingdate, images_attributes: [:src, :_destroy, :id])
    end

    def set_product
      @product = Product.find(params[:id])
    end

end
