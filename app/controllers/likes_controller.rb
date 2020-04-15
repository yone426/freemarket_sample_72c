class LikesController < ApplicationController

  def index
    @likes = Like.where(user_id: current_user.id).all
  end

  def create
    if Like.create(user_id: current_user.id,product_id: params[:product_id])
      redirect_to product_path(params[:product_id])
    else
      redirect_to root_path
    end
  end

  def destroy
    if like = Like.find_by(user_id: current_user.id,product_id:params[:product_id])
      like.delete
      redirect_to product_path(params[:product_id])
    else
      redirect_to root_path
    end
  end

end
