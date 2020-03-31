class ApplicationController < ActionController::Base
  # deviseの追加カラムをストロングパラメーターに追加 
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

    def configure_permitted_parameters
      #新規登録のストロングパラメーターに追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :fullname,:fullname_katakana,:phone_number,:birthday])
    end
end
