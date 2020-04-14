class ProductsController < ApplicationController

  require 'payjp'
  before_action :set_category, only: [:new]
  before_action :set_product, only: [:show,:edit,:destroy,:update, :purchase, :pay]

  def index
    @new_products = Product.where(status: 0).order("created_at DESC").page(params[:page]).per(5)
    @pickup_products = Product.where(category_id: 202, status:0).all.order("created_at DESC").page(params[:page]).per(5)

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
    @area = @product.prefecture
    
    @comment = Comment.new
    @comments = @product.comments.includes(:user)

  end

  def edit
  end	

  begin	
    def destroy	
      @product.destroy	
      redirect_to root_path	
    end	
  rescue => exception	
    redirect_to :edit	
  end	



  def update	
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def purchase
  end

  def pay
    Payjp.api_key = Rails.application.credentials[:payjp][:payjp_secret_key]
    Payjp::Charge.create(
      amount: @product.price, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'	
      )
      @product.update(status: 1)
      if @product.status == 1
        redirect_to root_path, notice: "#{@product.name}を購入しました"
      else
        flash.now[:alert] = "購入に失敗しました。"
      end
  end

  

  def category 
    @parents = Category.all.where(ancestry: nil).limit(13)
  end

  def categoryindex
    @category = Category.find(params[:id])
    @pro = Product.where(category_id: @category.id)
    @image
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

  def product_search
    @productsearch = params[:productsearch]
    @product = Product.productsearch(params[:productsearch])
      if @product.empty?
        @productsearch = nil
        @product = Product.all.order("created_at DESC")
      end
  end

  

  

  private
  
    def set_category
      @parents = Category.all.where(ancestry: nil).limit(13)
    end

    def product_params
      params.require(:product).permit(:details, :name, :category_id, :price, :condition, :exhibition, :shippingarea, :shippingdate,:prefecture_id,:city, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)

    end

    def set_product
      @product = Product.find(params[:id])
    end

end
