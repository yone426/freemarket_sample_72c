class UsersController < ApplicationController
 #マイページ関連
  def show
    @user = User.find(params[:id])
    @products = @user.products.order("created_at DESC")
    @user = current_user
    @likes = Like.where(user_id: @user.id).all
  end

  def likes
    @user = current_user
    @likes = Like.where(user_id: @user.id).all
  end

end
