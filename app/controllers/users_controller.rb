class UsersController < ApplicationController
 #マイページ関連
  def show
    @user = User.find(params[:id])
    @products = @user.products

  end

end
