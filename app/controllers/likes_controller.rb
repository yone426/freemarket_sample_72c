class LikesController < ApplicationController

  def index
    # @user = User.find(params[:id])
    # @products = @user.products.order("created_at DESC")
    @user = current_user
    @likes = Like.where(user_id: @user.id).all
    # @likes = Product.where(user_id: @user.id).all
  end

  def create
    user=current_user
    product=Product.find(params[:product_id])
    if Like.create(user_id: user.id,product_id:product.id)
    redirect_to product
    else
      redirect_to root_url
    end

  end

  def destroy
    user=current_user
    product=Product.find(params[:product_id])
    if like=Like.find_by(user_id: user.id,product_id:product.id)
      like.delete
      redirect_to product
    else
      redirect_to root_url
    end
  end

end
