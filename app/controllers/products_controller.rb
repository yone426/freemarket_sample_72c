class ProductsController < ApplicationController
  def index
    @new_products = Product.where(status: 0).order("created_at DESC").page(params[:page]).per(3)
    @pickup_products = Product.where(categories: '猫', status: 0).order("created_at DESC").page(params[:page]).per(3)
    
    @products = Product.includes(:images)
    @images = Image.find_by(product_id: 1)
    
  end
  def new
  end
  def create
  end
  def show
  end
  def edit
  end
  def destroy
  end
  def update
  end
end
