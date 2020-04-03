class ProductsController < ApplicationController
  def index

    @new_products = Product.where(status: 0).order("created_at DESC").page(params[:page]).per(5)
    @pickup_products = Product.where(categories: '猫', status: 0).order("created_at DESC").page(params[:page]).per(5)

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
