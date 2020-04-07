class UsersController < ApplicationController
  # マイページとかクレジットカード登録とかその辺の操作を行うためのコントローラー 新規登録は/controller/users/以下のコントローラーを使用

  def index
    
  end

  def show
    @user = User.find(params[:id])
    @products = @user.products
  end

  def new 
  end

  def rogout
  end



end
