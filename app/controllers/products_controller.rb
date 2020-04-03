class ProductsController < ApplicationController

  def index
  end

  def new

  end

  def create
  end

  def show
    @product = Product.find(params[:id])
    @product.src
  end

  def edit
  end

  def destroy
  end

  def update
  end

end
