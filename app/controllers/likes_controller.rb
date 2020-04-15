class LikesController < ApplicationController

  def index
    @user = current_user
    @likes = Like.where(user_id: @user.id).all
  end

  def create
    user = current_user
    product = Product.find(params[:product_id])
    if Like.create(user_id: user.id,product_id:product.id)
    redirect_to product_path(product.id)
    else
      redirect_to root_url_path
    end

  end

  def destroy
    user = current_user
    product = Product.find(params[:product_id])
    if like = Like.find_by(user_id: user.id,product_id:product.id)
      like.delete
      redirect_to product_path(product.id)
    else
      redirect_to root_path
    end
  end

end
