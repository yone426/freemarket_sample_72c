class ProductsController < ApplicationController

  before_action :set_product, except: [:index, :new, :create]

  def index
    @new_products = Product.where(status: 0).order("created_at DESC").page(params[:page]).per(5)
    @pickup_products = Product.where(categories: 'メンズ', status: 0).order("created_at DESC").page(params[:page]).per(5)

    @products = Product.all
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

    @product = Product.find(params[:id])
    @image = @product.images.first
    @images = @product.images.drop(1)

  end


  def edit
    @product = Product.find(params[:id])
  end

  def buy #商品確認画面です
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  begin
    def update
      if @product.update(product_params)
        redirect_to root_path
      else
        render :edit
      end
    end
  rescue => exception
    render :edit
  end    

  private
    def product_params
      params.require(:product).permit(:details, :name, :categories, :price, :condition, :exhibition, :shippingarea, :shippingdate, images_attributes:  [:src, :_destroy, :id])
    end
end

def set_product
  @product = Product.find(params[:id])
end