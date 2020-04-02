# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  before_action :configure_sign_up_params, only: [:create]

def new
  @user = User.new
end

def create  #1ページ目で入力した情報のバリデーションチェック
            #1ページで入力した情報をsessionに保持させること
            #次の住所情報登録で使用するインスタンスを生成、当該ページへ遷移すること
  @user = User.new(sign_up_params)
  unless @user.valid?
    flash.now[:alert] = @user.errors.full_messages
    render :new and return
  end
  session["devise.regist_data"] = {user: @user.attributes}
  session["devise.regist_data"][:user]["password"] = params[:user][:password]
  address = @user.build_addresse
  @todouhuken = { 北海道: "北海道" ,
    青森県: "青森県" ,
    岩手県: "岩手県" ,
    宮城県: "宮城県" ,
    秋田県: "秋田県" ,
    山形県: "山形県" ,
    福島県: "福島県" ,
    茨城県: "茨城県" ,
    栃木県: "栃木県" ,
    群馬県: "群馬県" ,
    埼玉県: "埼玉県" ,
    千葉県: "千葉県" ,
    東京都: "東京都" ,
    神奈川県: "神奈川県",
    新潟県: "新潟県" ,
    富山県: "富山県" ,
    石川県: "石川県" ,
    福井県: "福井県" ,
    山梨県: "山梨県" ,
    長野県: "長野県",
    岐阜県: "岐阜県" ,
    静岡県: "静岡県" ,
    愛知県: "愛知県" ,
    三重県: "三重県" ,
    滋賀県: "滋賀県" ,
    京都府: "京都府" ,
    大阪府: "大阪府" ,
    兵庫県: "兵庫県" ,
    奈良県: "奈良県" ,
    和歌山県: "和歌山県",
    鳥取県: "鳥取県" ,
    島根県: "島根県" ,
    岡山県: "岡山県" ,
    広島県: "広島県" ,
    山口県: "山口県" ,
    徳島県: "徳島県" ,
    香川県: "香川県" ,
    愛媛県: "愛媛県" ,
    高知県: "高知県" ,
    福岡県: "福岡県" ,
    佐賀県: "佐賀県" ,
    長崎県: "長崎県" ,
    熊本県: "熊本県" ,
    大分県: "大分県" ,
    宮崎県: "宮崎県" ,
    鹿児島県: "鹿児島県",
    沖縄県: "沖縄県" }
  render :new_address
end


def create_address
  @user = User.new(session["devise.regist_data"]["user"])
  @address = Address.new(address_params)
  unless @address.valid?
    flash.now[:alert] = @address.errors.full_messages
    render :new_address and return
  end
  @user.build_address(@address.attributes)
  @user.save
  sign_in(:user, @user)
  redirect_to root_path
end










protected

def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
end

def address_params
  params.require(:address).permit(:zipcode, :address,:prefectures,:municiplities,:building)
end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
