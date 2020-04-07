class ProductsController < ApplicationController
  before_action :set_category, only: [:new]
  def index
    @products = Product.all
  
  end

  def new
    @product = Product.new
    @product.images.new


  end
  

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show

    @product = Product.find(params[:id])
    @images = @product.images

  end

  def edit

  end

  def destroy

  end

  def update

  end

  def category 
    @parents = Category.all.where(ancestry: nil).limit(13)
  end

  def search
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
        #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
  end



  private
    def product_params
      params.require(:product).permit(:details, :name, :categories, :price, :condition, :exhibition, :shippingarea, :shippingdate, images_attributes: [:src])
    end

    def set_category
      @parents = Category.all.where(ancestry: nil).limit(13)
    end

end
