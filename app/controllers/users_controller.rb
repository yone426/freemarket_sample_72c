class UsersController < ApplicationController
 #マイページ関連
  def show
    @user = User.find(params[:id])
    @products = @user.products.order("created_at DESC")
    @card = Card.where(user_id: current_user.id).first
  end
  
end
